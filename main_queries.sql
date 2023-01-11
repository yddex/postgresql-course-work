--5. Создать два сложных (многотабличных) запроса
--с использованием подзапросов.

--1 Вывод id постановщиков задач у которых
--приложенные файлы весят больше среднего значения
SELECT requester_id
FROM tasks WHERE tasks.id IN
(SELECT 
	task_id
	FROM tasks_files 
	WHERE size > (SELECT AVG(size) FROM tasks_files)
)ORDER BY requester_id DESC;

--2 Вывод общего количества замечаний к заданиям по отделу
SELECT COUNT(*) FROM tasks_remarks
WHERE task_id IN 
(SELECT task_id FROM tasks_executers WHERE executer_id IN
	(SELECT user_id FROM users_info_cards WHERE department_id = 2)
);

-------------------
--6. Создать два сложных запроса (Написаны после представлений)
--с использованием объединения JOIN и без использования подзапросов.

--Представление выборки выполненных заданий у пользователей
--(7. Создать два представления, в основе которых лежат сложные запросы)


DROP VIEW IF EXISTS completed_users_tasks;
CREATE VIEW completed_users_tasks AS (
	SELECT DISTINCT
	COUNT(*) OVER (PARTITION BY tasks_executers.executer_id) AS completed_tasks,
	tasks_executers.executer_id AS user_id
	FROM tasks 
		JOIN tasks_executers ON tasks.id = tasks_executers.task_id
	WHERE work_status_id = 3
	ORDER BY completed_tasks DESC
);
--Представление выборки количества просроченных заданий
DROP VIEW IF EXISTS expired_users_tasks;
CREATE VIEW expired_users_tasks AS (
	SELECT DISTINCT
	COUNT(*) OVER (PARTITION BY tasks_executers.executer_id) AS expired_tasks,
	tasks_executers.executer_id AS user_id
	FROM tasks 
		JOIN tasks_executers ON tasks.id = tasks_executers.task_id
	WHERE work_status_id = 4
	ORDER BY expired_tasks DESC
);
--Представление с количеством замечаний к заданиям у пользователей
DROP VIEW IF EXISTS users_tasks_remarks;
CREATE VIEW users_tasks_remarks AS (
	SELECT  DISTINCT
	COUNT(*) OVER (PARTITION BY tasks_executers.executer_id) AS remarks_count,
	tasks_executers.executer_id AS user_id
	FROM tasks_remarks 
	JOIN tasks_executers ON tasks_remarks.task_id = tasks_executers.task_id
	ORDER BY remarks_count DESC
);
DROP VIEW IF EXISTS users_counts_tasks;
CREATE VIEW users_counts_tasks AS (
	SELECT DISTINCT
	COUNT(*) OVER (PARTITION BY executer_id) AS tasks_count,
	executer_id AS user_id
	FROM tasks_executers
	ORDER BY tasks_count DESC
);
--1 Запрос 
SELECT 
users.id AS user_id,
users.email AS email,
users_info_cards.first_name AS name,
completed_users_tasks.completed_tasks AS tasks_completed,
expired_users_tasks.expired_tasks AS tasks_expired,
users_tasks_remarks.remarks_count AS tasks_remarks,
users_counts_tasks.tasks_count AS tasks_count
FROM users 
	JOIN users_info_cards ON users.id = users_info_cards.user_id
	LEFT JOIN completed_users_tasks ON completed_users_tasks.user_id = users.id
	LEFT JOIN expired_users_tasks ON expired_users_tasks.user_id = users.id
	LEFT JOIN users_tasks_remarks ON users_tasks_remarks.user_id = users.id
	LEFT JOIN users_counts_tasks ON users_counts_tasks.user_id = users.id
ORDER BY tasks_count DESC NULLS LAST;

--2 Запрос 
SELECT DISTINCT
workgroups.id,
workgroups.name,
COUNT(tasks.id) OVER (PARTITION BY workgroups.id) AS tasks_count
FROM workgroups
	LEFT JOIN tasks ON tasks.workgroup_id = workgroups.id
ORDER BY tasks_count DESC NULLS LAST;


--8. Создать пользовательскую функцию
--Функция вычисления kpi в группе 
-- Эффективность = 100 - (Замечаний к задачам / Всего в работе) * 100

DROP FUNCTION IF EXISTS workgroup_kpi;
CREATE FUNCTION workgroup_kpi(wg_id integer)
RETURNS real AS
$$
DECLARE remarks_count numeric;
DECLARE active_tasks_count numeric;
DECLARE kpi numeric;
BEGIN
	SELECT COUNT(*) INTO remarks_count
	FROM tasks_remarks 
		JOIN tasks ON tasks.id = tasks_remarks.task_id
	WHERE tasks.workgroup_id = wg_id;
	
	SELECT COUNT(*) INTO active_tasks_count
	FROM tasks WHERE work_status_id != 4 AND workgroup_id = wg_id;
	kpi := 100 - (remarks_count / active_tasks_count) * 100;
	RETURN kpi;
END;
$$ LANGUAGE plpgsql;


--9. Создать триггер

CREATE FUNCTION check_valid_task_trigger()
RETURNS TRIGGER AS 
$$
BEGIN
	IF (NEW.created_at > NEW.deadline_at) THEN 
		RAISE EXCEPTION 'Not valid deadline time';
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_task_on_insert BEFORE INSERT ON tasks
	FOR EACH ROW EXECUTE FUNCTION check_valid_task_trigger();


-- 10. Оптимизация запросов 

-- Анализ
SET enable_seqscan TO on;
EXPLAIN SELECT 
users.id AS user_id,
users.email AS email,
users_info_cards.first_name AS name,
completed_users_tasks.completed_tasks AS tasks_completed,
expired_users_tasks.expired_tasks AS tasks_expired,
users_tasks_remarks.remarks_count AS tasks_remarks,
users_counts_tasks.tasks_count AS tasks_count
FROM users 
	JOIN users_info_cards ON users.id = users_info_cards.user_id
	LEFT JOIN completed_users_tasks ON completed_users_tasks.user_id = users.id
	LEFT JOIN expired_users_tasks ON expired_users_tasks.user_id = users.id
	LEFT JOIN users_tasks_remarks ON users_tasks_remarks.user_id = users.id
	LEFT JOIN users_counts_tasks ON users_counts_tasks.user_id = users.id
ORDER BY tasks_count DESC NULLS LAST;

-- Следует создать индексы для столбцов в таблице tasks_executers
CREATE INDEX tasks_executers_task_id_idx_fk ON tasks_executers(task_id);
CREATE INDEX tasks_executers_executer_id_idx_fk ON tasks_executers(executer_id);
CREATE INDEX tasks_work_status_idx ON tasks(work_status_id);
--ИЗМЕНЯЕМ ПРЕДСТАВЛЕНИЯ, КОТОРЫЕ ИСПОЛЬЗУЮТСЯ В ЗАПРОСЕ
DROP VIEW IF EXISTS completed_users_tasks;
CREATE VIEW completed_users_tasks AS (
	SELECT DISTINCT
	COUNT(*) OVER (PARTITION BY tasks_executers.executer_id) AS completed_tasks,
	tasks_executers.executer_id AS user_id
	FROM tasks_executers 
		JOIN tasks ON tasks.id = tasks_executers.task_id
	WHERE work_status_id = 3
);
--Представление выборки количества просроченных заданий
DROP VIEW IF EXISTS expired_users_tasks;
CREATE VIEW expired_users_tasks AS (
	SELECT DISTINCT
	COUNT(tasks.id) OVER (PARTITION BY tasks_executers.executer_id) AS expired_tasks,
	tasks_executers.executer_id AS user_id
	FROM tasks_executers
		JOIN tasks ON tasks.id = tasks_executers.task_id
	WHERE work_status_id = 4
);
--Представление с количеством замечаний к заданиям у пользователей
DROP VIEW IF EXISTS users_tasks_remarks;
CREATE VIEW users_tasks_remarks AS (
	SELECT  DISTINCT
	COUNT(tasks_remarks.id) OVER (PARTITION BY tasks_executers.executer_id) AS remarks_count,
	tasks_executers.executer_id AS user_id
	FROM tasks_executers
	JOIN tasks_remarks ON tasks_remarks.task_id = tasks_executers.task_id
);
DROP VIEW IF EXISTS users_counts_tasks;
CREATE VIEW users_counts_tasks AS (
	SELECT DISTINCT
	COUNT(*) OVER (PARTITION BY executer_id) AS tasks_count,
	executer_id AS user_id
	FROM tasks_executers
);









