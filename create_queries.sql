
--Таблица пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	email VARCHAR(128) NOT NULL,
	register_at TIMESTAMP NOT NULL
);

--Отелы компании
DROP TABLE IF EXISTS departaments;
CREATE TABLE departaments (
	id SERIAL PRIMARY KEY,
	name VARCHAR(64) NOT NULL,
	description VARCHAR(256) DEFAULT NULL
);

--"Карточки" пользователей(пользовательская информация, относительно компании)
DROP TABLE IF EXISTS users_info_cards;
CREATE TABLE users_info_cards (
	user_id INT NOT NULL PRIMARY KEY,
	first_name VARCHAR(128) NOT NULL,
	last_name  VARCHAR(128) DEFAULT NULL,
	patronymic VARCHAR(128) DEFAULT NULL,
	position VARCHAR(256) DEFAULT NULL,
	department_id INT DEFAULT NULL,
	manager_id INT DEFAULT NULL,
	CONSTRAINT info_card_users_id_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
	CONSTRAINT info_card_manager_id_fk FOREIGN KEY (manager_id) REFERENCES users (id) ON DELETE SET NULL,
	CONSTRAINT info_card_department_id_fk FOREIGN KEY (department_id) REFERENCES departaments (id) ON DELETE SET NULL
);

--Статусы приватности для групп/проектов
DROP TABLE IF EXISTS private_types;
CREATE TABLE private_types (
	id SERIAL PRIMARY KEY,
	status VARCHAR(64),
	description VARCHAR(256)
);


--Рабочие группы/проекты
DROP TABLE IF EXISTS workgroups;
CREATE TABLE workgroups (
	id SERIAL PRIMARY KEY,
	name VARCHAR(128) NOT NULL,
	description VARCHAR(256) DEFAULT NULL,
	is_project BOOLEAN NOT NULL,
	private_type_id INT NOT NULL,
	creator_id INT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	CONSTRAINT workgroups_private_fk FOREIGN KEY (private_type_id) REFERENCES private_types (id),
	CONSTRAINT workgroups_creator_id_fk FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE
);


--Роли(права) пользователей
DROP TABLE IF EXISTS workgroup_roles;
CREATE TABLE workgroup_roles (
	id SERIAL PRIMARY KEY,
	role VARCHAR(128)
);
--Таблица связи групп и пользователей
DROP TABLE IF EXISTS workgroups_users;
CREATE TABLE workgroups_users (
	user_id INT NOT NULL,
	workgroup_id INT NOT NULL,
	workgroup_role_id INT NOT NULL,
	created_at TIMESTAMP NOT NULL, 
	PRIMARY KEY (user_id, workgroup_id),
	CONSTRAINT workgroups_users__userid_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
	CONSTRAINT workgroups_users_workgroupsid_fk FOREIGN KEY (workgroup_id) REFERENCES workgroups (id) ON DELETE CASCADE,
	CONSTRAINT workgroups_users_role_fk FOREIGN KEY (workgroup_role_id) REFERENCES workgroup_roles (id)
);

--Таблица статусов выполнения задачи
DROP TABLE IF EXISTS tasks_work_statuses;
CREATE TABLE tasks_work_statuses (
	id SERIAL PRIMARY KEY,
	status VARCHAR(64)
);
--Таблица задач
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(128) NOT NULL,
	body TEXT NOT NULL,
	work_status_id INT NOT NULL,
	requester_id INT NOT NULL,
	workgroup_id INT DEFAULT NULL,
	deadline_at TIMESTAMP DEFAULT NULL,
	created_at TIMESTAMP NOT NULL,
	CONSTRAINT tasks_requester_id_fk FOREIGN KEY (requester_id) REFERENCES users (id) ON DELETE CASCADE,
	CONSTRAINT tasks_workgroup_id_fk FOREIGN KEY (workgroup_id) REFERENCES workgroups (id) ON DELETE SET NULL,
	CONSTRAINT tasks_work_status_id_fk FOREIGN KEY (work_status_id) REFERENCES tasks_work_statuses (id)
);

--Таблица связей задач и исполнителей
DROP TABLE IF EXISTS tasks_executers;
CREATE TABLE tasks_executers (
	task_id INT NOT NULL,
	executer_id INT NOT NULL,
	PRIMARY KEY (task_id, executer_id),
	CONSTRAINT tasks_executers_task_id_fk FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE,
	CONSTRAINT tasks_executers_executer_id_fk FOREIGN KEY (executer_id) REFERENCES users (id) ON DELETE CASCADE
);

--Комменатрии к задачам
DROP TABLE IF EXISTS tasks_comments;
CREATE TABLE tasks_comments (
	id SERIAL PRIMARY KEY,
	task_id INT NOT NULL,
	creator_id INT NOT NULL,
	body TEXT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	CONSTRAINT tasks_comments_task_id_fk FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE,
	CONSTRAINT tasks_comments_CREATOR_id_fk FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE
);

--Замечания к задачам
DROP TABLE IF EXISTS tasks_remarks;
CREATE TABLE tasks_remarks (
	id SERIAL PRIMARY KEY,
	task_id INT NOT NULL,
	creator_id INT NOT NULL,
	created_at TIMESTAMP NOT NULL,
	CONSTRAINT tasks_remarks_task_id_fk  FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE,
	CONSTRAINT tasks_remarks_task_id_fk  FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE
);

--Вложения к задачам
DROP TABLE IF EXISTS tasks_files;
CREATE TABLE tasks_files (
	id SERIAL PRIMARY KEY,
	path VARCHAR(256) NOT NULL,
	task_id INT NOT NULL,
	size INT NOT NULL,
	uploader_id INT NOT NULL,
	upload_at TIMESTAMP NOT NULL,
	CONSTRAINT tasks_files_task_id_fk  FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE,
	CONSTRAINT tasks_files_uploader_id_fk  FOREIGN KEY (uploader_id) REFERENCES users (id) ON DELETE CASCADE
);

--Файлы групп/проектов
DROP TABLE IF EXISTS workgroups_files;
CREATE TABLE workgroups_files (
	id SERIAL PRIMARY KEY,
	path VARCHAR(256) NOT NULL,
	workgroup_id INT NOT NULL,
	size INT NOT NULL,
	uploader_id INT NOT NULL,
	upload_at TIMESTAMP NOT NULL,
	CONSTRAINT workgroups_files_task_id_fk FOREIGN KEY (workgroup_id) REFERENCES workgroups (id) ON DELETE CASCADE,
	CONSTRAINT workgroups_files_task_id_fk FOREIGN KEY (uploader_id) REFERENCES users (id) ON DELETE CASCADE
);

