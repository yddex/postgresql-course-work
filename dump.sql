--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1+b1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1+b1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departaments; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.departaments (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(256) DEFAULT NULL::character varying
);


ALTER TABLE public.departaments OWNER TO gb_user;

--
-- Name: departaments_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.departaments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departaments_id_seq OWNER TO gb_user;

--
-- Name: departaments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.departaments_id_seq OWNED BY public.departaments.id;


--
-- Name: private_types; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.private_types (
    id integer NOT NULL,
    status character varying(64),
    description character varying(256)
);


ALTER TABLE public.private_types OWNER TO gb_user;

--
-- Name: private_types_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.private_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.private_types_id_seq OWNER TO gb_user;

--
-- Name: private_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.private_types_id_seq OWNED BY public.private_types.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    body text NOT NULL,
    work_status_id integer NOT NULL,
    requester_id integer NOT NULL,
    workgroup_id integer,
    deadline_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks OWNER TO gb_user;

--
-- Name: tasks_comments; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tasks_comments (
    id integer NOT NULL,
    task_id integer NOT NULL,
    creator_id integer NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks_comments OWNER TO gb_user;

--
-- Name: tasks_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.tasks_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_comments_id_seq OWNER TO gb_user;

--
-- Name: tasks_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tasks_comments_id_seq OWNED BY public.tasks_comments.id;


--
-- Name: tasks_executers; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tasks_executers (
    task_id integer NOT NULL,
    executer_id integer NOT NULL
);


ALTER TABLE public.tasks_executers OWNER TO gb_user;

--
-- Name: tasks_files; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tasks_files (
    id integer NOT NULL,
    path character varying(256) NOT NULL,
    task_id integer NOT NULL,
    size integer NOT NULL,
    uploader_id integer NOT NULL,
    upload_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks_files OWNER TO gb_user;

--
-- Name: tasks_files_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.tasks_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_files_id_seq OWNER TO gb_user;

--
-- Name: tasks_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tasks_files_id_seq OWNED BY public.tasks_files.id;


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO gb_user;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: tasks_remarks; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tasks_remarks (
    id integer NOT NULL,
    task_id integer NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tasks_remarks OWNER TO gb_user;

--
-- Name: tasks_remarks_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.tasks_remarks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_remarks_id_seq OWNER TO gb_user;

--
-- Name: tasks_remarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tasks_remarks_id_seq OWNED BY public.tasks_remarks.id;


--
-- Name: tasks_work_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.tasks_work_statuses (
    id integer NOT NULL,
    status character varying(64)
);


ALTER TABLE public.tasks_work_statuses OWNER TO gb_user;

--
-- Name: tasks_work_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.tasks_work_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_work_statuses_id_seq OWNER TO gb_user;

--
-- Name: tasks_work_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.tasks_work_statuses_id_seq OWNED BY public.tasks_work_statuses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(128) NOT NULL,
    register_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_info_cards; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users_info_cards (
    user_id integer NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) DEFAULT NULL::character varying,
    patronymic character varying(128) DEFAULT NULL::character varying,
    "position" character varying(256) DEFAULT NULL::character varying,
    department_id integer,
    manager_id integer
);


ALTER TABLE public.users_info_cards OWNER TO gb_user;

--
-- Name: workgroup_roles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.workgroup_roles (
    id integer NOT NULL,
    role character varying(128)
);


ALTER TABLE public.workgroup_roles OWNER TO gb_user;

--
-- Name: workgroup_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.workgroup_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workgroup_roles_id_seq OWNER TO gb_user;

--
-- Name: workgroup_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.workgroup_roles_id_seq OWNED BY public.workgroup_roles.id;


--
-- Name: workgroups; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.workgroups (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description character varying(256) DEFAULT NULL::character varying,
    is_project boolean NOT NULL,
    private_type_id integer NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.workgroups OWNER TO gb_user;

--
-- Name: workgroups_files; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.workgroups_files (
    id integer NOT NULL,
    path character varying(256) NOT NULL,
    workgroup_id integer NOT NULL,
    size integer NOT NULL,
    uploader_id integer NOT NULL,
    upload_at timestamp without time zone NOT NULL
);


ALTER TABLE public.workgroups_files OWNER TO gb_user;

--
-- Name: workgroups_files_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.workgroups_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workgroups_files_id_seq OWNER TO gb_user;

--
-- Name: workgroups_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.workgroups_files_id_seq OWNED BY public.workgroups_files.id;


--
-- Name: workgroups_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.workgroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workgroups_id_seq OWNER TO gb_user;

--
-- Name: workgroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.workgroups_id_seq OWNED BY public.workgroups.id;


--
-- Name: workgroups_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.workgroups_users (
    user_id integer NOT NULL,
    workgroup_id integer NOT NULL,
    workgroup_role_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.workgroups_users OWNER TO gb_user;

--
-- Name: departaments id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.departaments ALTER COLUMN id SET DEFAULT nextval('public.departaments_id_seq'::regclass);


--
-- Name: private_types id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_types ALTER COLUMN id SET DEFAULT nextval('public.private_types_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: tasks_comments id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_comments ALTER COLUMN id SET DEFAULT nextval('public.tasks_comments_id_seq'::regclass);


--
-- Name: tasks_files id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_files ALTER COLUMN id SET DEFAULT nextval('public.tasks_files_id_seq'::regclass);


--
-- Name: tasks_remarks id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_remarks ALTER COLUMN id SET DEFAULT nextval('public.tasks_remarks_id_seq'::regclass);


--
-- Name: tasks_work_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_work_statuses ALTER COLUMN id SET DEFAULT nextval('public.tasks_work_statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workgroup_roles id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroup_roles ALTER COLUMN id SET DEFAULT nextval('public.workgroup_roles_id_seq'::regclass);


--
-- Name: workgroups id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups ALTER COLUMN id SET DEFAULT nextval('public.workgroups_id_seq'::regclass);


--
-- Name: workgroups_files id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_files ALTER COLUMN id SET DEFAULT nextval('public.workgroups_files_id_seq'::regclass);


--
-- Data for Name: departaments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.departaments (id, name, description) FROM stdin;
1	Frontend-developers	frontend departament
2	Backend-developers	Backend departament
3	DevOps	DevOps departament
4	Project managers	Managers departament
5	Marketing	Marketing departament
6	Design	Departament of design
7	Directors	Director of company
\.


--
-- Data for Name: private_types; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.private_types (id, status, description) FROM stdin;
1	Open	Open to everyone
2	Close	Entrance by invitation
3	Hidden-close	The entrance by invitation is also hidden
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tasks (id, title, body, work_status_id, requester_id, workgroup_id, deadline_at, created_at) FROM stdin;
1	quis turpis	risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,	4	39	4	2023-03-30 03:59:28	2023-01-18 00:00:00
2	et netus et	ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,	4	6	4	2023-03-08 13:42:28	2023-01-04 00:00:00
3	ornare lectus justo	Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis	1	14	2	2023-03-24 07:16:03	2023-01-11 00:00:00
4	Nullam ut	mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque	2	21	3	2023-03-27 04:17:08	2023-01-27 00:00:00
5	Duis	lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis	3	7	6	2023-02-25 09:34:57	2023-01-05 00:00:00
6	leo elementum sem,	luctus. Curabitur egestas nunc sed libero. Proin sed turpis	2	41	6	2023-02-12 08:04:52	2023-01-12 00:00:00
7	dictum	Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis	3	25	5	2023-02-08 05:09:06	2023-01-10 00:00:00
8	Vivamus molestie	mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum	2	92	1	2023-03-04 12:26:17	2023-01-03 00:00:00
9	Duis gravida. Praesent	Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent	3	53	5	2023-02-23 02:18:36	2023-01-22 00:00:00
10	dictum eu, eleifend	tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur	2	63	1	2023-03-11 21:49:23	2023-01-27 00:00:00
11	felis	lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus	2	58	1	2023-02-13 01:41:53	2023-01-16 00:00:00
12	Quisque tincidunt	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo.	3	82	2	2023-03-10 13:40:02	2023-01-05 00:00:00
13	nisi. Mauris	et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper	3	50	6	2023-03-23 19:36:24	2023-01-13 00:00:00
14	per	Curae Donec tincidunt. Donec vitae erat vel	3	28	5	2023-03-30 07:40:21	2023-01-22 00:00:00
15	porttitor scelerisque neque.	mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi	2	65	4	2023-03-14 19:07:10	2023-01-22 00:00:00
16	molestie sodales. Mauris blandit	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam	4	5	5	2023-02-05 14:19:51	2023-01-05 00:00:00
17	dictum	at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla	2	86	1	2023-02-28 05:06:58	2023-01-15 00:00:00
18	dui augue	consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu	3	31	4	2023-02-13 20:02:48	2023-01-26 00:00:00
19	eget massa. Suspendisse eleifend.	dui. Suspendisse ac metus vitae	3	98	1	2023-02-19 04:12:46	2023-01-12 00:00:00
20	quis turpis vitae	Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam	2	1	1	2023-02-24 01:21:13	2023-01-23 00:00:00
21	enim. Nunc	dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras	1	14	1	2023-03-27 23:04:51	2023-01-12 00:00:00
22	pharetra, felis eget	imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede.	2	19	3	2023-03-12 04:15:37	2023-01-04 00:00:00
23	lorem, luctus ut, pellentesque	rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer	1	3	3	2023-02-07 22:14:45	2023-01-08 00:00:00
24	dis parturient montes, nascetur	aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.	3	2	5	2023-03-25 07:05:44	2023-01-21 00:00:00
25	Nulla facilisi. Sed neque.	leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu,	1	55	3	2023-03-24 17:14:21	2023-01-17 00:00:00
26	dictum. Proin eget	malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id	1	13	4	2023-03-30 00:58:27	2023-01-16 00:00:00
27	dignissim lacus. Aliquam	eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis	2	69	3	2023-03-11 13:41:36	2023-01-13 00:00:00
28	netus et	ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend	1	27	2	2023-03-20 11:46:11	2023-01-14 00:00:00
29	vulputate eu,	ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis	4	10	4	2023-03-05 20:01:19	2023-01-18 00:00:00
30	scelerisque neque. Nullam nisl.	ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant	3	33	2	2023-02-20 13:20:45	2023-01-22 00:00:00
31	magna a	faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis.	2	66	2	2023-03-01 02:49:46	2023-01-07 00:00:00
32	id,	conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet	1	15	3	2023-03-16 23:54:50	2023-01-07 00:00:00
33	dui. Fusce	interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non	4	12	2	2023-03-13 22:07:47	2023-01-26 00:00:00
34	dignissim lacus. Aliquam	Praesent eu dui. Cum sociis natoque penatibus	2	85	6	2023-02-15 13:17:03	2023-01-16 00:00:00
35	ornare. Fusce	ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem	3	90	5	2023-03-20 05:37:15	2023-01-24 00:00:00
36	lectus sit amet	gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa	2	22	5	2023-03-21 22:28:03	2023-01-07 00:00:00
37	Sed eu	et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin	2	38	4	2023-03-25 10:11:45	2023-01-07 00:00:00
38	ante dictum mi,	Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim	1	38	2	2023-03-30 11:41:49	2023-01-06 00:00:00
39	rutrum magna. Cras	cursus. Nunc mauris elit, dictum eu,	2	48	3	2023-03-09 03:40:24	2023-01-23 00:00:00
40	faucibus.	orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor	2	8	1	2023-03-06 20:15:11	2023-01-07 00:00:00
41	nisi. Mauris nulla. Integer	Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque	1	63	3	2023-03-10 17:09:18	2023-01-14 00:00:00
42	consequat, lectus	sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus,	1	10	5	2023-03-27 01:12:11	2023-01-13 00:00:00
43	aliquam arcu. Aliquam ultrices	mollis. Duis sit amet diam eu	1	39	2	2023-03-01 03:11:40	2023-01-28 00:00:00
44	imperdiet	tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	2	10	4	2023-03-09 15:41:11	2023-01-29 00:00:00
45	risus. Morbi	Suspendisse sed dolor. Fusce mi lorem,	4	8	5	2023-02-06 16:11:33	2023-01-08 00:00:00
46	Duis sit	Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis	3	74	2	2023-03-27 10:51:39	2023-01-03 00:00:00
47	In scelerisque scelerisque	lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam.	1	8	3	2023-02-16 14:46:30	2023-01-28 00:00:00
48	magna. Ut	risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt	4	25	1	2023-03-18 05:13:12	2023-01-15 00:00:00
49	sit amet metus.	velit. Sed malesuada augue ut lacus. Nulla tincidunt,	1	68	5	2023-02-22 10:41:49	2023-01-19 00:00:00
50	fames	pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus	2	16	4	2023-03-05 05:14:16	2023-01-20 00:00:00
51	odio. Aliquam	vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae	3	60	4	2023-03-02 17:30:00	2023-01-11 00:00:00
52	et magnis dis	Proin ultrices. Duis volutpat nunc sit	4	74	2	2023-03-13 18:41:30	2023-01-18 00:00:00
53	ornare tortor at	eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus.	3	43	4	2023-02-19 17:13:10	2023-01-29 00:00:00
54	tempor	sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec	2	43	2	2023-03-24 09:28:42	2023-01-25 00:00:00
55	Phasellus	aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.	4	80	6	2023-03-19 20:46:13	2023-01-17 00:00:00
56	Vestibulum ante ipsum primis	Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut	2	26	2	2023-02-20 09:12:25	2023-01-06 00:00:00
57	Phasellus ornare. Fusce	tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam	2	88	4	2023-03-31 09:41:18	2023-01-22 00:00:00
58	neque tellus, imperdiet	ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat	2	7	4	2023-03-26 10:37:00	2023-01-31 00:00:00
59	euismod	nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum	4	42	6	2023-03-31 05:23:05	2023-01-28 00:00:00
60	rutrum eu,	ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non	3	75	1	2023-03-22 11:30:56	2023-01-21 00:00:00
61	ultrices posuere cubilia	dictum sapien. Aenean massa. Integer vitae nibh. Donec est	1	59	5	2023-02-05 13:08:50	2023-01-15 00:00:00
62	congue a, aliquet	non magna. Nam ligula elit, pretium et,	2	73	4	2023-03-06 15:01:11	2023-01-18 00:00:00
63	ac sem	nunc sed pede. Cum sociis	2	35	5	2023-03-29 07:08:33	2023-01-20 00:00:00
64	Aliquam ornare, libero	purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,	1	94	3	2023-02-22 09:35:17	2023-01-12 00:00:00
65	Cras interdum.	auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero	4	3	2	2023-02-19 12:00:41	2023-01-19 00:00:00
66	justo. Proin	nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,	4	60	3	2023-02-09 11:56:09	2023-01-31 00:00:00
67	Sed eget lacus. Mauris	ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis,	2	91	4	2023-02-20 19:53:45	2023-01-02 00:00:00
68	mus. Proin vel	nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales	2	49	3	2023-02-27 10:36:07	2023-01-30 00:00:00
69	convallis	consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet	3	32	4	2023-02-07 22:41:11	2023-01-21 00:00:00
70	mollis vitae, posuere	in consequat enim diam vel arcu. Curabitur ut odio vel	3	55	1	2023-02-12 21:43:50	2023-01-14 00:00:00
71	velit justo nec ante.	id risus quis diam luctus lobortis.	1	40	5	2023-03-02 13:08:52	2023-01-03 00:00:00
72	convallis in, cursus	Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui.	2	8	4	2023-03-24 00:38:19	2023-01-05 00:00:00
73	mauris elit, dictum	venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non,	1	68	2	2023-03-19 09:19:00	2023-01-16 00:00:00
74	scelerisque, lorem	habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a	3	85	3	2023-03-23 10:08:34	2023-01-15 00:00:00
75	dolor,	eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin	3	50	5	2023-02-07 10:58:54	2023-01-23 00:00:00
76	adipiscing elit.	tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie	1	3	4	2023-03-15 23:56:13	2023-01-13 00:00:00
77	non, luctus sit	ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus.	3	63	4	2023-03-19 19:21:57	2023-01-28 00:00:00
78	eu nulla	elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce	4	100	4	2023-03-01 16:00:50	2023-01-06 00:00:00
79	elit fermentum	pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent	2	93	6	2023-02-21 15:09:30	2023-01-03 00:00:00
80	magna et ipsum	convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	3	54	2	2023-03-07 03:35:32	2023-01-17 00:00:00
81	fames ac turpis egestas.	ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci.	2	30	2	2023-03-24 09:04:47	2023-01-05 00:00:00
82	amet, risus. Donec	orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede	3	76	3	2023-03-08 14:04:08	2023-01-20 00:00:00
83	erat neque non	amet ultricies sem magna nec quam. Curabitur vel lectus. Cum	1	50	4	2023-03-11 16:06:51	2023-01-08 00:00:00
84	hendrerit neque. In	ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis	4	71	6	2023-02-19 10:39:58	2023-01-26 00:00:00
85	nisl. Maecenas malesuada fringilla	Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non,	2	7	1	2023-03-03 03:30:12	2023-01-08 00:00:00
86	ultrices posuere cubilia	sagittis lobortis mauris. Suspendisse aliquet molestie	2	70	4	2023-02-02 15:43:26	2023-01-06 00:00:00
87	ante dictum cursus.	id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent	4	67	3	2023-02-17 10:00:24	2023-01-17 00:00:00
88	sem. Pellentesque	quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque,	1	5	2	2023-03-16 10:43:57	2023-01-03 00:00:00
89	tempus scelerisque,	ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.	3	47	2	2023-02-17 04:05:50	2023-01-29 00:00:00
90	Nullam scelerisque neque	dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet,	3	51	2	2023-03-10 03:09:20	2023-01-10 00:00:00
91	Sed dictum.	luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam	2	71	3	2023-03-20 15:10:20	2023-01-09 00:00:00
92	arcu. Curabitur	interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec	3	84	5	2023-03-15 19:44:00	2023-01-18 00:00:00
93	tempus non, lacinia	consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper.	3	99	3	2023-02-14 13:16:19	2023-01-22 00:00:00
94	semper et, lacinia vitae,	vestibulum massa rutrum magna. Cras convallis	3	76	5	2023-03-08 14:04:52	2023-01-16 00:00:00
95	aliquet, sem ut cursus	tellus eu augue porttitor interdum. Sed	3	19	3	2023-03-01 02:45:05	2023-01-30 00:00:00
96	eros	Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est.	3	45	4	2023-02-26 19:53:31	2023-01-16 00:00:00
97	Aliquam tincidunt, nunc	leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit,	2	65	4	2023-03-25 01:10:12	2023-01-29 00:00:00
98	nec urna	sed consequat auctor, nunc nulla	1	63	2	2023-03-14 07:49:46	2023-01-13 00:00:00
99	eget odio. Aliquam	nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices	2	87	4	2023-02-13 14:52:16	2023-01-12 00:00:00
100	dolor egestas	cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis	2	59	2	2023-03-01 09:43:33	2023-01-06 00:00:00
101	eu, eleifend nec, malesuada	lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero.	2	70	5	2023-03-10 07:56:11	2023-01-11 00:00:00
102	Phasellus ornare.	malesuada malesuada. Integer id magna et ipsum	3	34	3	2023-03-06 15:48:25	2023-01-10 00:00:00
103	lorem, sit	vitae nibh. Donec est mauris, rhoncus id, mollis nec,	1	12	3	2023-02-26 08:12:18	2023-01-16 00:00:00
104	nisi sem	Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur	2	89	3	2023-03-20 09:39:31	2023-01-08 00:00:00
105	Vivamus euismod urna.	posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam	1	25	6	2023-02-22 03:37:35	2023-01-26 00:00:00
106	ullamcorper eu,	dolor sit amet, consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet	3	7	5	2023-03-28 17:55:37	2023-01-08 00:00:00
107	neque. Sed	erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc.	2	13	2	2023-03-13 00:26:12	2023-01-29 00:00:00
108	sagittis. Duis	dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus	2	9	4	2023-02-17 20:58:52	2023-01-24 00:00:00
109	Nullam vitae diam.	malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.	4	100	6	2023-02-14 11:55:29	2023-01-26 00:00:00
110	eros. Nam consequat dolor	urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et	3	73	3	2023-03-05 18:45:08	2023-01-30 00:00:00
111	sociosqu	iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus	2	74	6	2023-03-05 03:50:59	2023-01-27 00:00:00
112	Nulla eu neque	euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat,	2	31	6	2023-02-03 01:10:21	2023-01-07 00:00:00
113	semper pretium	mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus	3	86	2	2023-03-13 00:02:46	2023-01-04 00:00:00
114	ornare. Fusce	porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc	4	91	2	2023-02-17 12:39:51	2023-01-12 00:00:00
115	quis,	mollis vitae, posuere at, velit. Cras lorem	3	83	3	2023-02-25 23:15:26	2023-01-06 00:00:00
116	consequat, lectus sit	vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac	3	100	4	2023-02-21 20:57:44	2023-01-29 00:00:00
117	facilisis eget, ipsum.	auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris	1	3	2	2023-02-24 17:51:46	2023-01-29 00:00:00
118	elit. Nulla facilisi. Sed	eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,	1	50	2	2023-02-03 20:37:39	2023-01-22 00:00:00
119	ipsum dolor	hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu	1	1	5	2023-03-10 22:13:42	2023-01-03 00:00:00
120	magna. Duis dignissim	mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus.	3	87	3	2023-03-22 14:22:27	2023-01-23 00:00:00
121	quam. Curabitur	arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui,	4	23	5	2023-03-15 16:57:43	2023-01-29 00:00:00
122	tempus eu,	lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem	2	72	1	2023-02-24 17:36:01	2023-01-06 00:00:00
123	vestibulum lorem, sit	sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,	1	100	4	2023-03-15 21:20:26	2023-01-04 00:00:00
124	a, aliquet vel,	Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis	3	83	5	2023-03-12 15:39:32	2023-01-10 00:00:00
125	et tristique	euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit	4	24	2	2023-02-10 01:43:02	2023-01-08 00:00:00
126	Nam porttitor scelerisque	orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.	1	23	3	2023-03-15 06:33:06	2023-01-17 00:00:00
127	nisl. Nulla	gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	1	39	4	2023-03-17 09:36:10	2023-01-05 00:00:00
128	mauris, rhoncus id, mollis	tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque	3	95	2	2023-02-22 13:54:09	2023-01-16 00:00:00
129	Praesent eu dui.	eu enim. Etiam imperdiet dictum magna. Ut tincidunt	2	10	6	2023-02-16 14:12:12	2023-01-23 00:00:00
130	egestas. Fusce aliquet	sem. Nulla interdum. Curabitur dictum. Phasellus in felis.	3	2	2	2023-03-17 21:31:34	2023-01-15 00:00:00
131	Integer vulputate,	tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie	2	45	5	2023-02-08 07:59:00	2023-01-04 00:00:00
132	blandit at, nisi.	pede. Nunc sed orci lobortis augue scelerisque mollis.	2	46	4	2023-02-05 20:32:35	2023-01-26 00:00:00
133	vulputate, lacus. Cras interdum.	purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus	2	63	2	2023-03-23 19:22:54	2023-01-19 00:00:00
134	vitae diam. Proin dolor.	interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis	2	16	4	2023-03-06 06:55:30	2023-01-20 00:00:00
135	blandit congue. In	Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.	4	100	5	2023-02-11 21:28:39	2023-01-22 00:00:00
136	dapibus gravida.	porttitor vulputate, posuere vulputate, lacus.	1	36	2	2023-03-08 00:19:18	2023-01-03 00:00:00
137	mauris.	commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit	3	98	3	2023-03-15 05:54:53	2023-01-15 00:00:00
138	elit, dictum eu,	vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero	2	56	1	2023-02-04 04:21:30	2023-01-20 00:00:00
139	rutrum. Fusce dolor	adipiscing, enim mi tempor lorem, eget	3	99	6	2023-02-21 02:24:05	2023-01-22 00:00:00
140	nonummy ipsum non	mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac	2	26	5	2023-03-16 02:21:02	2023-01-03 00:00:00
141	justo. Praesent	consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae,	1	60	4	2023-02-20 12:47:21	2023-01-05 00:00:00
142	eu enim. Etiam	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam	2	55	4	2023-03-19 00:55:04	2023-01-17 00:00:00
143	arcu et	enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras	4	77	4	2023-02-12 13:08:46	2023-01-22 00:00:00
144	a mi fringilla	risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum	2	69	5	2023-03-22 12:59:16	2023-01-17 00:00:00
145	Cras interdum.	Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum	1	91	1	2023-03-01 19:50:54	2023-01-24 00:00:00
146	eu	amet nulla. Donec non justo. Proin non massa non ante bibendum	1	22	1	2023-02-25 08:39:10	2023-01-20 00:00:00
147	ipsum. Suspendisse	fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum	2	100	5	2023-02-14 07:20:57	2023-01-15 00:00:00
148	mus.	Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus	2	42	3	2023-03-25 02:45:06	2023-01-23 00:00:00
149	molestie dapibus	enim. Nunc ut erat. Sed nunc	2	39	3	2023-03-18 07:58:19	2023-01-21 00:00:00
150	Etiam ligula tortor,	amet, consectetuer adipiscing elit. Aliquam auctor, velit	2	98	4	2023-03-13 07:06:32	2023-01-05 00:00:00
151	Donec fringilla.	Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis,	2	8	3	2023-02-25 16:40:52	2023-01-17 00:00:00
152	iaculis enim,	risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper	3	2	4	2023-02-13 10:23:50	2023-01-28 00:00:00
153	Ut tincidunt vehicula	vel nisl. Quisque fringilla euismod enim.	3	72	1	2023-03-06 08:20:10	2023-01-11 00:00:00
154	volutpat. Nulla	velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est	1	69	1	2023-02-28 23:10:17	2023-01-24 00:00:00
155	eu dui. Cum	ipsum sodales purus, in molestie tortor nibh sit	3	74	1	2023-03-24 17:29:28	2023-01-07 00:00:00
156	ligula consectetuer	penatibus et magnis dis parturient montes,	2	52	1	2023-03-14 03:28:29	2023-01-02 00:00:00
157	molestie tortor nibh	erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio.	4	81	1	2023-02-25 02:53:56	2023-01-30 00:00:00
158	et ipsum	quis accumsan convallis, ante lectus convallis est, vitae sodales	3	60	2	2023-02-10 10:13:58	2023-01-17 00:00:00
159	gravida sit	euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat,	2	15	5	2023-03-15 16:58:23	2023-01-19 00:00:00
160	sed	purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam,	3	89	5	2023-02-22 20:38:19	2023-01-04 00:00:00
161	vitae, posuere at, velit.	Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada	1	5	1	2023-03-05 09:38:35	2023-01-17 00:00:00
162	nascetur ridiculus	nec enim. Nunc ut erat. Sed nunc est,	1	87	6	2023-02-22 15:41:19	2023-01-19 00:00:00
163	dui lectus	luctus. Curabitur egestas nunc sed libero. Proin sed	3	26	5	2023-02-22 09:22:13	2023-01-04 00:00:00
164	eget, venenatis a, magna.	placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class	3	29	4	2023-03-15 03:09:51	2023-01-25 00:00:00
165	dolor vitae dolor.	senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a	2	72	6	2023-02-14 12:38:52	2023-01-10 00:00:00
166	Mauris quis turpis	Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis.	3	36	5	2023-03-18 21:06:28	2023-01-25 00:00:00
167	nulla. Integer	Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	1	83	5	2023-03-31 01:49:59	2023-01-14 00:00:00
168	Vivamus nibh	luctus lobortis. Class aptent taciti sociosqu ad litora torquent per	2	69	2	2023-03-02 20:27:00	2023-01-03 00:00:00
169	consectetuer mauris id	amet, dapibus id, blandit at, nisi. Cum sociis natoque	3	88	1	2023-03-06 23:08:28	2023-01-30 00:00:00
170	leo, in	enim commodo hendrerit. Donec porttitor tellus non	4	25	4	2023-02-22 01:21:10	2023-01-05 00:00:00
171	mollis. Duis sit	leo. Cras vehicula aliquet libero. Integer in	4	34	1	2023-02-15 16:02:12	2023-01-18 00:00:00
172	senectus	commodo auctor velit. Aliquam nisl. Nulla eu neque	2	94	3	2023-02-26 16:20:57	2023-01-17 00:00:00
173	ac ipsum. Phasellus	ridiculus mus. Donec dignissim magna a tortor.	2	26	4	2023-02-04 06:24:22	2023-01-28 00:00:00
174	scelerisque mollis.	euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam	2	2	2	2023-03-22 14:29:37	2023-01-19 00:00:00
175	magna. Cras convallis convallis	vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec	2	84	2	2023-02-27 09:16:01	2023-01-04 00:00:00
176	Proin nisl	sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus.	3	25	2	2023-02-12 18:29:35	2023-01-26 00:00:00
177	convallis convallis	ut lacus. Nulla tincidunt, neque vitae semper egestas, urna	3	19	6	2023-03-23 16:46:02	2023-01-24 00:00:00
178	felis. Donec	erat. Etiam vestibulum massa rutrum magna.	4	71	3	2023-03-17 23:05:53	2023-01-29 00:00:00
179	Cras	Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam	3	4	3	2023-03-05 15:32:47	2023-01-20 00:00:00
180	ut nisi	egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed	3	23	2	2023-03-02 17:36:49	2023-01-17 00:00:00
181	risus quis diam	Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci	3	7	5	2023-03-18 21:37:14	2023-01-19 00:00:00
182	congue a,	rhoncus. Proin nisl sem, consequat nec, mollis	2	84	2	2023-02-27 02:30:06	2023-01-02 00:00:00
183	eget magna. Suspendisse tristique	mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris	1	11	3	2023-03-24 13:08:03	2023-01-25 00:00:00
184	Nullam feugiat	Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante	4	16	2	2023-02-21 13:28:00	2023-01-25 00:00:00
185	Proin nisl sem, consequat	mauris a nunc. In at pede. Cras vulputate velit eu	2	3	2	2023-02-11 14:10:48	2023-01-08 00:00:00
186	nunc interdum feugiat.	ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia	3	99	3	2023-02-20 06:43:17	2023-01-21 00:00:00
187	non lorem vitae	elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis	2	31	3	2023-02-02 13:37:27	2023-01-02 00:00:00
188	Nulla	ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit	2	82	5	2023-03-04 09:38:33	2023-01-05 00:00:00
189	ornare lectus	Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit.	4	88	6	2023-03-14 18:10:38	2023-01-17 00:00:00
190	vehicula risus. Nulla	egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,	1	34	1	2023-02-02 21:50:53	2023-01-12 00:00:00
191	libero est,	elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis	1	51	3	2023-02-11 00:36:27	2023-01-26 00:00:00
192	amet ornare	metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla	3	14	6	2023-02-22 13:34:10	2023-01-15 00:00:00
193	Curabitur consequat,	eleifend, nunc risus varius orci, in consequat enim diam vel	4	88	5	2023-03-06 08:13:27	2023-01-06 00:00:00
194	vel, venenatis	enim, sit amet ornare lectus justo	2	62	3	2023-03-20 22:41:06	2023-01-26 00:00:00
195	a,	Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus	3	39	3	2023-02-24 16:16:41	2023-01-10 00:00:00
196	consequat,	morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet	1	25	3	2023-03-19 10:41:18	2023-01-16 00:00:00
197	odio,	mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque	1	40	3	2023-02-13 13:38:30	2023-01-10 00:00:00
198	tellus lorem	turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus	3	12	3	2023-02-18 22:52:06	2023-01-21 00:00:00
199	vel sapien imperdiet	a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.	2	26	2	2023-02-18 03:47:54	2023-01-28 00:00:00
200	sit amet metus.	enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo.	3	72	2	2023-03-19 11:26:58	2023-01-28 00:00:00
201	id, blandit	egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.	3	20	1	2023-02-06 22:27:28	2023-01-23 00:00:00
202	purus gravida	vulputate velit eu sem. Pellentesque ut ipsum ac	3	28	3	2023-02-10 06:42:59	2023-01-04 00:00:00
203	ipsum. Suspendisse non leo.	neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu.	2	94	4	2023-03-10 11:09:20	2023-01-20 00:00:00
204	ullamcorper.	Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer	2	53	1	2023-03-10 18:10:57	2023-01-26 00:00:00
205	iaculis	lectus. Cum sociis natoque penatibus et magnis	3	75	4	2023-02-11 17:55:31	2023-01-04 00:00:00
206	sagittis augue,	penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero	4	7	5	2023-03-03 02:13:53	2023-01-20 00:00:00
207	dapibus ligula. Aliquam	porttitor scelerisque neque. Nullam nisl.	2	46	2	2023-02-04 01:04:11	2023-01-17 00:00:00
208	dolor sit amet,	at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus	4	69	3	2023-02-06 03:17:07	2023-01-09 00:00:00
209	nulla. Donec	vehicula risus. Nulla eget metus	1	95	4	2023-03-16 16:51:47	2023-01-27 00:00:00
210	dolor dapibus gravida.	Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin	3	48	2	2023-02-25 04:34:48	2023-01-31 00:00:00
211	vitae, aliquet nec, imperdiet	arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut	4	86	6	2023-03-11 18:19:15	2023-01-25 00:00:00
212	sed, est. Nunc	Mauris magna. Duis dignissim tempor arcu.	4	49	4	2023-02-27 09:10:03	2023-01-14 00:00:00
213	velit	dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit.	1	68	2	2023-02-20 02:44:02	2023-01-22 00:00:00
214	tempus non, lacinia	egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui.	2	60	3	2023-03-11 12:47:20	2023-01-02 00:00:00
215	non, lacinia at, iaculis	magnis dis parturient montes, nascetur ridiculus mus.	3	58	2	2023-02-12 19:51:48	2023-01-09 00:00:00
216	ac libero nec ligula	semper pretium neque. Morbi quis urna. Nunc quis	1	4	3	2023-03-05 03:47:05	2023-01-18 00:00:00
217	gravida. Praesent eu	fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at	2	4	2	2023-03-24 20:50:03	2023-01-28 00:00:00
218	volutpat nunc sit	risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas	2	15	5	2023-03-24 03:20:15	2023-01-16 00:00:00
219	Sed nulla ante, iaculis	sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor,	3	95	5	2023-02-19 01:15:11	2023-01-09 00:00:00
220	Donec	dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum	3	58	3	2023-03-20 14:15:18	2023-01-17 00:00:00
221	Aenean sed	netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio	2	57	4	2023-03-21 18:04:11	2023-01-25 00:00:00
222	ridiculus mus. Donec	Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at,	2	39	3	2023-02-11 21:54:18	2023-01-10 00:00:00
223	molestie	egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit	4	75	5	2023-03-14 04:02:27	2023-01-05 00:00:00
224	quam dignissim pharetra.	ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus	3	1	4	2023-02-21 03:10:40	2023-01-06 00:00:00
225	ultrices. Vivamus rhoncus. Donec	lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique	2	69	2	2023-02-10 16:12:12	2023-01-19 00:00:00
226	erat. Etiam vestibulum	gravida molestie arcu. Sed eu	1	82	3	2023-03-10 21:37:46	2023-01-22 00:00:00
227	orci luctus et ultrices	nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat	2	2	2	2023-03-02 02:50:02	2023-01-22 00:00:00
228	Aliquam vulputate ullamcorper magna.	Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna	4	8	6	2023-03-29 11:51:38	2023-01-16 00:00:00
229	parturient	pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum	2	12	3	2023-03-19 00:05:39	2023-01-30 00:00:00
230	dolor vitae dolor. Donec	vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,	1	64	6	2023-02-21 23:30:16	2023-01-10 00:00:00
231	erat,	Donec fringilla. Donec feugiat metus sit amet ante. Vivamus	1	10	2	2023-03-28 01:06:31	2023-01-20 00:00:00
232	eu, odio. Phasellus at	urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum	2	42	4	2023-03-15 23:06:08	2023-01-11 00:00:00
233	ullamcorper viverra.	vitae mauris sit amet lorem semper auctor. Mauris	2	12	3	2023-02-17 20:19:05	2023-01-30 00:00:00
234	dolor. Donec fringilla.	vitae sodales nisi magna sed dui.	3	65	6	2023-03-12 04:22:46	2023-01-30 00:00:00
235	non justo. Proin	luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus.	2	62	4	2023-03-07 21:02:25	2023-01-26 00:00:00
236	tempor	venenatis vel, faucibus id, libero. Donec consectetuer mauris	2	17	2	2023-03-12 13:34:43	2023-01-05 00:00:00
237	arcu. Sed	velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas,	2	75	5	2023-02-22 02:37:38	2023-01-28 00:00:00
238	purus ac tellus.	massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi	3	55	4	2023-02-04 12:58:28	2023-01-05 00:00:00
239	odio, auctor vitae, aliquet	Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In	3	15	5	2023-03-29 00:41:14	2023-01-18 00:00:00
240	Ut tincidunt	urna et arcu imperdiet ullamcorper. Duis at	3	37	2	2023-03-06 04:48:30	2023-01-05 00:00:00
241	nec, eleifend	molestie in, tempus eu, ligula. Aenean euismod mauris eu elit.	3	63	4	2023-03-12 10:14:25	2023-01-23 00:00:00
242	leo. Cras vehicula aliquet	nunc. Quisque ornare tortor at risus. Nunc ac sem ut	3	47	3	2023-03-27 18:26:47	2023-01-13 00:00:00
243	eleifend	Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.	2	46	5	2023-02-03 15:36:17	2023-01-04 00:00:00
244	at	sociis natoque penatibus et magnis dis parturient	1	94	5	2023-03-16 11:18:25	2023-01-24 00:00:00
245	est ac mattis semper,	bibendum fermentum metus. Aenean sed pede nec ante	4	22	6	2023-02-12 00:31:59	2023-01-06 00:00:00
246	Proin	gravida mauris ut mi. Duis risus odio, auctor	3	11	4	2023-02-07 17:48:40	2023-01-20 00:00:00
247	auctor odio a	Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus.	2	24	4	2023-02-12 04:31:59	2023-01-30 00:00:00
248	In at pede.	sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat	2	70	4	2023-03-29 23:43:42	2023-01-27 00:00:00
249	tristique pharetra.	lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi	1	62	5	2023-03-24 04:36:15	2023-01-29 00:00:00
250	semper erat, in	purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt	4	67	3	2023-03-27 13:53:07	2023-01-25 00:00:00
\.


--
-- Data for Name: tasks_comments; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tasks_comments (id, task_id, creator_id, body, created_at) FROM stdin;
1	155	59	egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta	2022-12-16 03:43:22
2	76	36	In at pede. Cras	2023-06-19 05:37:01
3	190	21	magna tellus faucibus leo, in lobortis	2022-05-01 18:39:22
4	17	76	Nunc ac	2023-01-03 06:00:23
5	16	46	egestas rhoncus. Proin nisl sem, consequat nec,	2022-03-26 07:07:52
6	206	67	sagittis. Duis gravida. Praesent eu	2023-05-18 08:12:24
7	63	67	Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla	2023-12-16 10:23:00
8	34	26	arcu. Sed et libero. Proin mi.	2022-04-09 11:01:33
9	95	13	sit amet	2022-04-02 22:07:54
10	207	61	rhoncus. Donec	2022-12-05 00:15:54
11	58	61	dictum placerat, augue. Sed	2022-05-13 19:34:45
12	186	44	bibendum fermentum metus. Aenean sed pede	2023-03-05 11:14:19
13	171	30	ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia	2022-02-03 04:23:05
14	25	13	Mauris vestibulum, neque sed	2023-04-07 20:01:27
15	239	65	purus gravida sagittis. Duis gravida.	2022-08-17 08:59:45
16	69	34	vitae diam. Proin dolor. Nulla semper tellus	2022-02-17 10:26:26
17	9	2	odio sagittis semper. Nam	2023-10-23 11:46:48
18	161	13	primis in faucibus orci luctus et	2022-03-13 12:14:30
19	35	17	Maecenas iaculis aliquet diam. Sed diam lorem, auctor	2023-04-05 00:45:53
20	166	29	dolor. Quisque tincidunt pede ac	2023-01-26 13:51:19
21	70	54	leo. Vivamus nibh dolor,	2022-11-25 08:30:21
22	214	78	lacus. Nulla tincidunt, neque vitae semper egestas, urna justo	2023-06-14 21:59:04
23	226	66	arcu et pede. Nunc sed orci lobortis	2023-11-08 12:00:24
24	200	49	a, dui. Cras pellentesque.	2023-05-19 20:49:59
25	41	65	molestie	2023-05-05 03:36:47
26	176	96	consectetuer, cursus et, magna. Praesent interdum	2023-10-25 08:27:27
27	208	11	sapien, gravida non, sollicitudin a, malesuada	2023-02-27 12:11:44
28	32	41	semper cursus. Integer mollis.	2022-11-01 23:06:38
29	131	84	pulvinar arcu et pede.	2022-09-03 01:13:49
30	207	31	aliquet molestie tellus.	2023-10-27 13:05:19
31	151	11	Nam interdum enim non nisi. Aenean eget	2022-10-25 10:08:17
32	179	71	rhoncus. Proin nisl sem, consequat nec, mollis vitae,	2022-06-21 04:00:46
33	44	46	primis in faucibus orci luctus	2023-06-15 14:56:50
34	49	80	lorem lorem, luctus ut,	2023-10-11 21:55:38
35	152	12	nisi. Cum	2023-03-10 11:09:55
36	45	37	risus odio, auctor vitae, aliquet nec, imperdiet	2023-12-06 17:42:34
37	49	58	amet metus. Aliquam	2022-10-10 09:00:14
38	79	24	Etiam laoreet, libero et tristique pellentesque,	2023-07-28 18:25:20
39	30	61	neque vitae semper	2023-06-13 18:29:26
40	122	26	tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam.	2023-10-20 20:34:17
41	178	47	amet ante. Vivamus non lorem vitae odio sagittis semper. Nam	2023-01-26 05:45:51
42	228	93	magna nec quam. Curabitur vel lectus. Cum	2022-11-23 13:57:24
43	181	86	Fusce mi lorem, vehicula et, rutrum	2023-06-11 05:57:45
44	181	87	purus ac	2022-12-09 05:36:25
45	82	20	nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer	2022-06-28 15:36:19
46	44	73	odio. Nam	2023-11-25 10:08:08
47	179	44	est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia	2022-08-11 12:30:32
48	234	88	arcu.	2023-03-10 17:54:32
49	33	61	amet ornare lectus justo eu arcu. Morbi sit	2023-02-02 19:22:59
50	20	37	magna, malesuada vel, convallis in, cursus et, eros.	2022-07-04 22:18:34
51	244	24	diam nunc,	2022-12-10 22:58:28
52	249	12	metus eu erat	2022-05-22 08:23:58
53	196	18	ac, eleifend vitae, erat.	2023-12-23 21:02:27
54	154	17	ullamcorper	2022-12-19 16:48:18
55	65	67	feugiat tellus lorem eu metus. In lorem. Donec elementum,	2023-08-28 12:03:41
56	173	18	erat eget ipsum. Suspendisse sagittis. Nullam vitae	2023-09-12 05:25:32
57	27	12	nibh sit amet orci. Ut	2023-01-01 18:14:45
58	46	98	at	2023-03-21 07:16:58
59	233	17	ligula eu enim. Etiam imperdiet dictum magna.	2023-04-24 06:18:46
60	156	86	mauris eu elit. Nulla	2023-05-19 04:12:10
61	203	33	a	2023-12-02 02:27:34
62	171	53	id nunc interdum feugiat. Sed nec metus facilisis lorem	2023-03-11 06:07:12
63	148	12	rutrum magna.	2022-03-07 00:56:20
64	40	12	rutrum. Fusce dolor	2022-05-31 03:03:28
65	233	3	morbi tristique senectus et netus et	2022-11-06 10:03:06
66	119	53	eu	2022-09-13 11:21:21
67	93	12	at	2022-09-24 09:22:43
68	126	51	et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim	2023-03-17 22:29:43
69	25	41	rutrum lorem	2022-11-11 06:21:29
70	76	62	aliquet magna a neque.	2023-01-30 08:56:35
71	43	45	in, tempus eu, ligula. Aenean	2023-10-20 10:13:56
72	150	99	malesuada augue ut lacus. Nulla	2023-07-15 01:05:28
73	38	47	ac sem ut dolor dapibus gravida. Aliquam tincidunt,	2022-02-13 23:06:00
74	36	60	eros. Nam	2023-09-10 15:17:25
75	36	66	consectetuer adipiscing elit. Curabitur sed tortor.	2022-02-27 11:52:15
76	1	96	dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc	2023-05-01 20:53:34
77	19	95	consectetuer, cursus et, magna. Praesent interdum ligula eu enim.	2023-01-14 10:25:20
78	3	89	velit in aliquet lobortis, nisi nibh lacinia	2023-06-22 11:43:38
79	118	38	luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.	2022-02-16 12:11:55
80	8	100	non massa	2022-02-24 00:55:06
81	47	100	Donec nibh	2023-04-24 23:33:49
82	191	53	Mauris	2022-09-04 05:00:34
83	238	41	ante ipsum primis in faucibus orci	2023-10-11 00:30:42
84	122	64	erat volutpat. Nulla dignissim. Maecenas ornare	2022-11-10 23:28:29
85	56	55	non,	2023-08-31 06:47:27
86	215	37	blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci	2023-10-28 14:12:31
87	38	88	vestibulum massa rutrum magna. Cras convallis convallis dolor.	2022-10-10 03:41:19
88	4	81	primis in faucibus orci luctus et	2022-02-10 09:11:40
89	80	50	eu	2022-06-25 03:59:51
90	200	54	feugiat non, lobortis quis, pede.	2023-06-30 10:52:59
91	44	60	enim nisl elementum purus, accumsan interdum libero	2022-12-17 08:48:19
92	199	76	aliquam adipiscing lacus. Ut nec	2023-03-24 03:14:37
93	47	29	ac urna. Ut tincidunt vehicula risus. Nulla	2023-10-30 15:36:18
94	32	99	aliquet. Phasellus fermentum convallis	2023-05-25 02:40:13
95	242	65	Nam porttitor	2022-12-19 04:13:36
96	232	80	sit amet ultricies sem magna nec quam. Curabitur vel	2023-07-30 13:56:23
97	157	46	nibh dolor,	2022-11-10 05:25:39
98	217	61	Nunc sollicitudin commodo ipsum. Suspendisse non	2023-03-23 05:31:16
99	142	21	lorem, sit amet ultricies	2023-07-18 05:09:12
100	137	82	sem,	2022-04-12 19:46:33
\.


--
-- Data for Name: tasks_executers; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tasks_executers (task_id, executer_id) FROM stdin;
1	69
2	61
3	64
4	100
5	97
6	24
7	75
8	6
9	75
10	25
11	14
12	69
13	20
14	38
15	84
16	18
17	12
18	66
19	52
20	76
21	66
22	59
23	91
24	49
25	13
26	48
27	53
28	92
29	53
30	98
31	16
32	72
33	10
34	31
35	65
36	93
37	40
38	53
39	88
40	24
41	65
42	56
43	91
44	23
45	32
46	83
47	27
48	15
49	28
50	51
51	47
52	65
53	75
54	60
55	67
56	65
57	4
58	45
59	81
60	68
61	3
62	97
63	85
64	59
65	16
66	4
67	85
68	2
69	29
70	29
71	33
72	47
73	34
74	76
75	86
76	92
77	45
78	100
79	13
80	78
81	12
82	32
83	31
84	27
85	81
86	55
87	32
88	32
89	73
90	76
91	68
92	8
93	6
94	48
95	80
96	6
97	72
98	40
99	85
100	77
101	11
102	17
103	97
104	92
105	71
106	11
107	61
108	26
109	44
110	92
111	57
112	24
113	86
114	97
115	71
116	90
117	74
118	88
119	65
120	81
121	56
122	6
123	20
124	50
125	54
126	26
127	49
128	87
129	22
130	38
131	37
132	95
133	71
134	39
135	50
136	41
137	73
138	49
139	69
140	59
141	78
142	34
143	54
144	26
145	82
146	93
147	43
148	8
149	37
150	80
151	68
152	19
153	7
154	48
155	86
156	77
157	7
158	51
159	9
160	60
161	29
162	64
163	56
164	72
165	100
166	60
167	11
168	57
169	19
170	77
171	88
172	51
173	87
174	41
175	7
176	61
177	29
178	27
179	9
180	22
181	6
182	63
183	78
184	68
185	29
186	87
187	77
188	59
189	3
190	72
191	14
192	55
193	18
194	32
195	8
196	66
197	69
198	60
199	61
200	61
201	34
202	93
203	91
204	79
205	32
206	97
207	33
208	47
209	44
210	74
211	99
212	70
213	37
214	77
215	77
216	64
217	23
218	88
219	47
220	60
221	44
222	65
223	23
224	78
225	48
226	6
227	28
228	58
229	43
230	46
231	81
232	93
233	93
234	57
235	68
236	74
237	86
238	94
239	31
240	29
241	26
242	56
243	65
244	61
245	79
246	5
247	29
248	47
249	27
250	81
\.


--
-- Data for Name: tasks_files; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tasks_files (id, path, task_id, size, uploader_id, upload_at) FROM stdin;
1	Aliquam erat	80	15997	46	2022-03-10 18:51:11
2	odio tristique pharetra.	13	11133	9	2023-11-14 11:36:38
3	lectus quis massa.	131	9351	98	2023-04-03 10:52:44
4	non,	47	19273	45	2022-04-03 23:50:24
5	Vivamus nisi.	55	13350	62	2023-09-13 22:03:23
6	tellus. Suspendisse sed	6	1836	34	2022-04-14 23:33:13
7	velit. Cras	232	2483	56	2023-04-06 23:50:50
8	ac mi eleifend egestas.	88	23155	89	2023-01-16 23:32:47
9	mattis semper, dui	156	3702	34	2022-09-12 08:11:44
10	lacus. Nulla tincidunt,	182	20784	91	2023-11-17 13:06:40
11	sociosqu ad litora torquent	169	7095	15	2022-02-28 09:57:48
12	consequat	176	13131	16	2022-04-20 21:28:47
13	Nunc mauris. Morbi	232	5114	14	2023-10-14 07:27:52
14	lacus. Quisque purus sapien,	239	20408	40	2022-02-26 08:13:21
15	eu lacus.	138	20949	71	2022-08-06 22:56:17
16	tellus	164	12158	30	2022-06-29 20:34:05
17	mi felis,	127	1305	49	2023-10-20 16:49:03
18	lorem, luctus ut, pellentesque	25	23875	80	2023-04-20 19:09:55
19	porttitor interdum. Sed auctor	195	14904	87	2022-04-04 12:34:58
20	facilisis non,	108	16880	100	2022-10-23 23:52:54
21	lacus pede sagittis augue,	151	8355	79	2022-03-01 10:51:29
22	mi pede,	130	4311	57	2023-08-01 03:45:50
23	mauris	187	2184	82	2022-07-24 12:52:46
24	interdum. Curabitur	159	20915	5	2023-07-16 17:34:57
25	vel sapien imperdiet ornare.	244	9554	9	2023-04-20 19:01:40
26	Vivamus non lorem	71	8929	67	2022-05-18 17:38:28
27	habitant morbi	174	20189	18	2022-04-26 23:20:46
28	lorem, sit amet ultricies	159	15487	9	2023-02-13 18:21:51
29	eros turpis	228	7839	16	2023-11-02 23:21:36
30	dignissim magna	77	10096	62	2023-11-06 01:23:32
31	orci, in	14	8390	52	2023-02-24 23:59:35
32	faucibus leo, in	105	15446	7	2023-12-15 16:09:45
33	ornare egestas	145	5321	35	2023-09-24 23:50:19
34	Proin velit.	108	20294	54	2022-04-07 08:24:44
35	sollicitudin a, malesuada	247	14481	26	2023-01-24 10:21:48
36	magna tellus faucibus	64	10278	83	2023-09-09 21:56:53
37	sed libero.	161	4777	74	2023-12-09 12:32:22
38	ullamcorper magna.	175	7625	69	2023-10-31 18:02:35
39	enim commodo	44	14551	70	2022-02-21 22:22:44
40	sapien. Nunc	234	12281	30	2022-10-30 01:04:16
41	in, tempus eu,	60	8333	91	2022-11-23 18:19:17
42	nibh lacinia orci, consectetuer	77	18824	67	2022-02-09 14:26:12
43	tempor bibendum.	158	10419	64	2023-07-20 11:21:17
44	orci, adipiscing non,	162	19048	94	2022-12-07 13:21:45
45	fringilla. Donec feugiat	193	22529	38	2023-11-13 09:46:23
46	arcu. Sed et	217	19219	84	2023-05-13 13:34:30
47	massa. Quisque	107	20535	13	2022-02-01 21:04:24
48	Sed malesuada augue	208	11411	54	2022-03-29 16:00:33
49	eget	239	4329	80	2023-11-01 08:00:37
50	dolor, nonummy ac,	126	15722	48	2022-04-10 21:58:19
51	condimentum. Donec	95	6423	28	2022-10-15 10:54:42
52	lobortis. Class aptent	60	13175	88	2023-08-07 19:36:06
53	ligula. Aenean	76	23600	42	2022-07-21 15:36:05
54	bibendum ullamcorper.	184	14851	95	2022-06-04 17:19:58
55	dui. Fusce	186	4074	82	2022-06-21 15:07:16
56	Sed eu	9	15176	49	2023-07-08 11:42:54
57	ac ipsum. Phasellus vitae	169	21400	53	2022-11-01 05:56:56
58	nulla vulputate	151	9535	22	2022-11-21 14:39:00
59	accumsan sed, facilisis	193	15467	3	2022-10-16 10:51:44
60	porttitor	93	21453	98	2023-08-25 18:55:55
61	Nullam	145	20499	47	2023-08-30 14:28:57
62	nec, eleifend	72	10546	27	2023-02-11 10:11:32
63	aliquam iaculis, lacus	31	9017	9	2022-02-09 06:33:32
64	morbi tristique	191	14025	27	2023-11-04 07:22:47
65	eu,	176	20620	30	2023-03-26 22:57:28
66	ac risus. Morbi metus.	80	15588	50	2023-07-17 05:32:57
67	nunc id enim.	113	15685	53	2022-03-21 13:21:24
68	semper egestas,	50	20531	89	2023-06-06 08:37:59
69	non	244	5239	69	2022-06-22 12:38:19
70	luctus et ultrices	42	17833	4	2022-04-28 01:54:19
71	inceptos hymenaeos.	193	11844	2	2023-01-02 21:53:19
72	quis,	196	14825	96	2022-05-04 19:45:20
73	enim nec tempus	124	5919	37	2022-08-13 19:25:18
74	sem mollis dui,	45	1007	93	2024-01-09 20:00:39
75	Sed nulla ante, iaculis	104	21486	74	2023-03-19 01:54:52
76	elit. Aliquam auctor, velit	123	5878	25	2022-02-27 16:51:48
77	libero. Morbi	219	14375	14	2023-08-06 22:15:36
78	dictum mi, ac mattis	216	12015	87	2022-08-07 22:35:23
79	nec, cursus	29	13607	62	2022-05-01 12:22:13
80	aliquet molestie tellus. Aenean	136	2945	23	2022-01-13 22:49:58
81	dui, nec	107	17883	45	2022-08-19 09:01:12
82	urna convallis	28	11470	92	2023-09-18 15:01:02
83	arcu et pede. Nunc	87	14490	9	2022-03-19 06:53:31
84	libero. Proin	76	8730	36	2022-05-02 08:42:01
85	adipiscing non, luctus	49	6621	82	2022-02-25 14:22:10
86	pede et risus. Quisque	130	19558	23	2023-11-20 20:48:46
87	magnis dis	115	15703	93	2023-10-18 21:40:07
88	porttitor scelerisque	70	1037	23	2023-01-18 17:58:03
89	Vivamus sit amet	217	17412	43	2022-05-18 06:19:20
90	bibendum	136	11988	73	2022-05-29 18:17:18
91	ut, nulla. Cras eu	164	8206	7	2022-03-27 07:34:55
92	Mauris eu turpis. Nulla	216	20710	42	2023-07-08 15:22:17
93	nisl. Quisque fringilla	175	2850	13	2023-09-14 00:31:27
94	eu neque	98	10156	70	2022-04-21 21:56:45
95	diam luctus lobortis. Class	107	19850	22	2022-02-10 00:02:44
96	egestas	81	17149	94	2024-01-06 23:33:09
97	arcu iaculis enim,	208	4168	86	2022-03-04 14:01:40
98	blandit viverra.	74	4433	87	2023-04-04 11:53:00
99	libero at auctor ullamcorper,	123	15018	25	2023-01-09 07:43:23
100	ut mi. Duis	23	10166	17	2022-03-06 11:53:04
\.


--
-- Data for Name: tasks_remarks; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tasks_remarks (id, task_id, creator_id, created_at) FROM stdin;
1	145	1	2023-03-07 12:37:26
2	68	1	2023-06-23 02:32:33
3	172	1	2023-05-17 05:46:58
4	14	1	2023-07-30 05:10:32
5	9	1	2022-08-16 23:20:49
6	114	1	2022-06-06 01:19:27
7	208	1	2023-11-29 05:50:45
8	118	1	2022-05-13 19:56:50
9	249	1	2023-08-28 11:49:00
10	176	1	2023-11-06 00:37:09
11	130	1	2023-02-28 21:02:30
12	196	1	2023-07-27 03:33:05
13	86	1	2022-11-10 12:37:41
14	137	1	2023-09-13 03:20:57
15	212	1	2023-04-10 07:03:15
16	40	1	2023-04-03 10:29:00
17	180	1	2023-08-02 05:59:23
18	135	1	2023-10-02 14:52:12
19	230	1	2022-11-23 23:04:58
20	27	1	2023-02-06 09:42:50
21	20	1	2022-04-27 06:31:23
22	133	1	2023-11-18 12:12:53
23	148	1	2023-06-30 11:56:52
24	78	1	2023-05-05 00:46:51
25	35	1	2023-03-03 23:44:56
26	210	1	2022-10-12 06:13:47
27	184	1	2023-01-29 12:25:02
28	156	1	2023-08-15 20:20:56
29	32	1	2023-05-09 15:08:17
30	204	1	2022-11-27 14:41:41
31	27	1	2022-02-01 00:25:31
32	244	1	2023-12-11 11:42:52
33	89	1	2022-12-24 20:41:51
34	86	1	2022-07-06 16:55:04
35	203	1	2022-07-02 23:42:52
36	239	1	2023-12-13 21:29:36
37	99	1	2023-01-10 21:34:25
38	26	1	2023-06-18 22:56:42
39	119	1	2022-06-09 12:05:02
40	173	1	2022-01-19 07:59:13
41	193	1	2023-08-30 02:07:54
42	100	1	2022-05-05 18:53:25
43	69	1	2023-11-13 17:25:47
44	125	1	2022-09-13 03:17:37
45	217	1	2023-03-05 18:23:09
46	233	1	2023-05-15 00:36:37
47	69	1	2023-07-25 17:13:39
48	234	1	2022-08-19 00:17:18
49	199	1	2023-05-03 17:48:45
50	105	1	2023-09-18 08:07:59
51	118	1	2022-03-24 19:52:07
52	8	1	2023-04-13 21:50:23
53	245	1	2022-08-08 10:48:11
54	216	1	2023-06-08 04:38:00
55	227	1	2023-04-17 02:29:29
56	63	1	2022-08-21 00:38:54
57	148	1	2023-11-27 13:41:10
58	37	1	2023-12-21 04:16:10
59	248	1	2022-07-24 16:56:34
60	174	1	2022-11-16 08:38:37
61	74	1	2023-02-17 21:00:54
62	79	1	2022-12-27 07:53:53
63	176	1	2022-09-03 23:15:19
64	25	1	2023-05-07 23:45:32
65	38	1	2023-03-07 12:10:46
66	2	1	2022-06-01 04:38:29
67	211	1	2022-09-16 10:18:05
68	220	1	2022-10-03 12:38:31
69	203	1	2022-08-25 22:34:38
70	169	1	2022-09-23 06:16:44
71	75	1	2022-03-16 01:39:51
72	213	1	2023-03-29 14:49:50
73	113	1	2022-07-12 16:51:07
74	131	1	2022-05-09 07:52:48
75	122	1	2023-10-20 01:48:35
76	49	1	2023-11-28 04:27:54
77	106	1	2023-05-26 10:44:09
78	1	1	2023-05-03 19:38:30
79	42	1	2023-12-15 19:14:06
80	101	1	2023-04-20 22:29:41
81	159	1	2022-10-03 02:06:47
82	21	1	2022-06-01 17:28:24
83	54	1	2023-10-30 21:53:55
84	224	1	2022-04-23 04:58:55
85	5	1	2022-09-06 05:44:10
86	157	1	2022-04-17 11:57:07
87	166	1	2022-06-08 21:07:17
88	130	1	2023-09-29 13:25:29
89	117	1	2022-02-02 16:20:07
90	142	1	2024-01-02 10:09:05
91	123	1	2022-12-27 01:02:36
92	57	1	2023-04-02 00:14:57
93	112	1	2022-12-29 19:13:11
94	159	1	2022-03-04 07:08:32
95	209	1	2022-12-04 12:16:28
96	28	1	2023-04-29 17:33:50
97	230	1	2023-08-25 09:26:28
98	242	1	2023-10-31 08:11:09
99	108	1	2023-05-17 13:29:23
100	53	1	2023-03-27 05:35:15
\.


--
-- Data for Name: tasks_work_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.tasks_work_statuses (id, status) FROM stdin;
1	Awaiting confirmation
2	At work
3	Completed
4	Expired
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, email, register_at) FROM stdin;
1	admin@mail.com	2023-01-10 18:21:41.682692
2	hendrerit.id.ante@yahoo.com	2022-08-30 23:13:38
3	penatibus@hotmail.com	2022-01-29 08:10:28
4	dui@google.edu	2022-09-18 03:58:44
5	curabitur.vel@icloud.com	2022-11-01 12:08:04
6	risus.a.ultricies@icloud.couk	2022-05-11 12:34:35
7	aliquet.libero@protonmail.ca	2022-07-03 08:00:29
8	nulla.aliquet.proin@aol.com	2023-11-11 02:09:55
9	tortor.integer.aliquam@hotmail.couk	2024-01-05 04:33:02
10	semper@outlook.com	2022-08-08 20:34:30
11	dolor.tempus@aol.edu	2022-01-27 17:15:45
12	proin.vel@outlook.org	2023-11-29 11:56:42
13	magnis@outlook.com	2023-05-30 06:58:30
14	nec.tempus@icloud.couk	2022-04-22 16:31:48
15	gravida.praesent@protonmail.net	2023-05-14 23:59:34
16	fermentum.arcu@aol.net	2022-12-13 13:38:59
17	ut.nulla@yahoo.ca	2022-05-16 18:21:53
18	fermentum.arcu.vestibulum@aol.couk	2023-08-19 14:52:17
19	nisl.nulla@icloud.couk	2022-11-15 17:29:13
20	tempus.eu@outlook.ca	2023-06-26 16:00:36
21	sed.eu.eros@aol.org	2023-04-24 11:47:37
22	porttitor.tellus.non@yahoo.edu	2023-07-14 18:02:39
23	justo@aol.net	2023-09-01 13:08:28
24	sed.dolor.fusce@yahoo.org	2022-09-24 11:18:03
25	dui.in.sodales@aol.edu	2022-03-19 06:32:18
26	amet.luctus@icloud.org	2023-05-03 22:27:12
27	sed.sapien@aol.ca	2022-06-22 08:07:08
28	aliquet@aol.com	2022-09-04 01:31:42
29	nunc.ullamcorper.eu@protonmail.edu	2023-08-03 09:00:49
30	eu.tempor@google.edu	2023-10-01 23:09:35
31	nec@icloud.edu	2022-10-01 11:59:40
32	ornare.sagittis@icloud.com	2022-09-20 14:39:04
33	orci@aol.ca	2023-09-05 20:43:18
34	proin.nisl@protonmail.couk	2022-11-11 01:04:45
35	commodo@icloud.ca	2023-06-19 23:19:50
36	donec.sollicitudin@aol.com	2023-07-25 02:18:37
37	etiam@hotmail.net	2022-06-10 01:59:32
38	habitant.morbi.tristique@hotmail.edu	2023-10-01 11:16:38
39	sit@icloud.ca	2022-11-02 03:46:08
40	in.lorem@yahoo.net	2022-02-02 13:32:57
41	sit@hotmail.couk	2023-11-29 13:54:28
42	sem.vitae.aliquam@outlook.couk	2022-06-06 02:39:03
43	nibh.dolor@outlook.net	2023-09-22 01:43:37
44	integer@yahoo.couk	2022-08-07 10:18:44
45	vitae.diam@hotmail.couk	2022-04-06 22:58:23
46	nisi.mauris@google.com	2023-11-02 14:31:48
47	maecenas@yahoo.com	2023-05-29 17:32:52
48	duis@icloud.com	2022-12-18 03:03:12
49	ligula.tortor.dictum@icloud.edu	2022-09-28 06:29:54
50	adipiscing.mauris.molestie@google.couk	2023-03-31 20:47:10
51	vulputate@hotmail.net	2023-11-02 08:57:40
52	sociis.natoque@protonmail.ca	2023-09-23 08:25:10
53	litora.torquent@icloud.couk	2023-03-01 10:57:56
54	nam.tempor@icloud.edu	2023-05-15 05:59:13
55	a.ultricies@icloud.edu	2022-04-30 11:44:42
56	posuere@aol.com	2022-03-02 23:06:46
57	amet.ornare@outlook.ca	2024-01-09 13:04:17
58	ipsum@google.edu	2023-01-07 13:38:48
59	turpis@icloud.org	2022-11-28 10:30:34
60	auctor.quis.tristique@aol.edu	2023-10-08 06:19:58
61	morbi.quis@outlook.org	2022-04-28 04:58:19
62	sed.et@aol.net	2023-12-26 14:44:20
63	nunc@icloud.org	2022-10-29 11:21:37
64	donec@hotmail.net	2023-07-14 19:42:30
65	enim.nunc@outlook.org	2022-07-30 22:11:17
66	at@protonmail.org	2023-01-15 06:46:44
67	pharetra.nam@yahoo.couk	2022-01-29 01:41:14
68	curabitur@outlook.com	2022-04-04 15:59:31
69	hendrerit.neque@icloud.ca	2022-04-29 02:09:19
70	congue@outlook.net	2023-12-20 03:25:13
71	justo.nec@google.org	2023-08-01 07:19:40
72	curae.donec@google.edu	2023-09-23 11:02:26
73	accumsan.neque.et@outlook.org	2023-03-28 06:39:30
74	curabitur@aol.org	2023-01-07 02:21:57
75	adipiscing.lacus@yahoo.couk	2023-01-13 12:12:19
76	tempor.augue.ac@google.ca	2022-10-12 15:19:28
77	mauris@yahoo.com	2022-03-30 05:06:04
78	rutrum.magna.cras@outlook.couk	2023-06-26 21:38:54
79	suspendisse@aol.couk	2023-10-13 00:12:32
80	odio.sagittis@google.com	2023-03-21 21:57:58
81	orci@yahoo.edu	2023-02-09 20:07:55
82	vivamus.nisi@outlook.com	2023-12-16 05:40:20
83	ipsum.primis.in@outlook.com	2023-03-04 06:23:36
84	proin.sed.turpis@google.ca	2022-09-25 16:23:58
85	nam.tempor.diam@outlook.couk	2022-10-25 05:34:54
86	aliquet.phasellus@google.ca	2023-02-17 08:14:04
87	orci.lobortis@yahoo.org	2023-10-24 14:13:38
88	id.libero@google.ca	2023-07-22 22:52:47
89	natoque.penatibus@aol.couk	2022-09-10 08:29:14
90	sed@yahoo.couk	2022-03-03 11:05:34
91	maecenas.iaculis@outlook.com	2022-07-17 14:33:18
92	blandit.nam@aol.net	2022-07-25 23:27:40
93	tellus.sem@hotmail.net	2022-04-03 02:39:47
94	aliquam.ultrices@icloud.couk	2023-01-20 22:27:45
95	suspendisse.ac.metus@yahoo.org	2022-09-10 08:36:37
96	ut@protonmail.com	2022-03-15 16:30:25
97	diam.at.pretium@outlook.com	2022-08-30 03:06:15
98	duis.a.mi@yahoo.net	2023-12-21 17:53:03
99	molestie.orci.tincidunt@aol.couk	2023-02-13 10:52:02
100	urna.nunc.quis@hotmail.org	2022-02-06 21:42:48
101	elit@aol.edu	2022-10-10 13:30:31
\.


--
-- Data for Name: users_info_cards; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users_info_cards (user_id, first_name, last_name, patronymic, "position", department_id, manager_id) FROM stdin;
1	Antonrie	Humio	Sertigo	Director of company	7	\N
2	Violet	Garza	Kibo	magna. Phasellus dolor	6	1
3	Yuli	Barker	Phelan	mollis. Integer tincidunt	1	1
4	Bruno	Underwood	Paki	euismod est	3	1
5	Natalie	Quinn	Raja	purus. Duis elementum, dui	4	1
6	Aurora	Hurley	Dillon	mollis lectus pede	3	1
7	Malik	Woodward	Sean	libero est, congue	2	1
8	Dillon	Pittman	Cullen	pellentesque massa	4	1
9	Ivor	Lambert	Emery	ut cursus	3	1
10	Aiko	Zamora	Ferdinand	elit, a feugiat	3	1
11	Rogan	Palmer	Oleg	vel lectus. Cum sociis	6	1
12	Lev	Humphrey	Vincent	dignissim. Maecenas ornare	3	1
13	Jelani	Vega	Barry	sed pede. Cum sociis	4	1
14	Georgia	Tillman	Amos	placerat velit. Quisque varius.	4	1
15	Macon	Sweet	Theodore	lorem lorem,	2	1
16	Zane	Boyle	Avram	Curabitur egestas nunc	3	1
17	Dante	Bryant	Emmanuel	id, ante. Nunc	5	1
18	Hasad	Carter	Rudyard	cursus in,	2	1
19	Chadwick	Tyler	Vaughan	metus facilisis	6	1
20	Oprah	Rice	Colt	sem, consequat nec,	2	1
21	Gil	Griffith	Derek	mauris, rhoncus id, mollis	3	1
22	Teegan	Hamilton	Curran	lectus, a sollicitudin	5	1
23	Ginger	Rodgers	Quinlan	Praesent eu nulla	5	1
24	Irene	Brown	Garrett	arcu. Sed et	6	1
25	Maisie	Odom	Gavin	libero. Morbi	3	1
26	Quentin	Savage	Caleb	dapibus rutrum, justo.	2	1
27	Brenden	Phelps	Merrill	lacus vestibulum	5	1
28	Boris	Conley	Castor	elit, pellentesque a, facilisis	6	1
29	Nicholas	Pennington	Xenos	Vivamus molestie dapibus	1	1
30	Ulric	Wise	Reuben	adipiscing non,	3	1
31	Stephen	Pollard	Brady	massa. Integer vitae nibh.	5	1
32	Bert	Parks	Aaron	cubilia Curae Phasellus	5	1
33	Ora	Price	Chandler	risus. In mi pede,	2	1
34	Adele	Beard	Cairo	Ut semper	5	1
35	Daria	Reese	Kirk	In mi pede,	5	1
36	Imelda	Cortez	Nehru	Mauris magna. Duis dignissim	4	1
37	Regan	Boone	Nathan	nec, eleifend	6	1
38	Quinn	Patterson	Guy	nec, eleifend non,	6	1
39	Nelle	Ferguson	Clayton	nunc sed libero. Proin	2	1
40	Norman	Peterson	Rogan	imperdiet dictum magna. Ut	2	1
41	Jackson	Brewer	Hall	volutpat. Nulla	5	1
42	Marvin	Gomez	Blaze	id nunc	6	1
43	Anthony	Rose	Ferdinand	justo sit	5	1
44	Melanie	Hardy	Marvin	netus et malesuada fames	3	1
45	Herman	Blanchard	Burton	tempus eu, ligula.	1	1
46	Hannah	Long	Guy	metus urna convallis	5	1
47	Kevin	Flynn	Ahmed	at pretium	1	1
48	Kyle	Maddox	Samson	luctus aliquet odio. Etiam	5	1
49	Perry	Lane	Jasper	ornare egestas ligula. Nullam	4	1
50	Rhiannon	Ford	Amal	egestas ligula. Nullam	2	1
51	Jasper	Bullock	Gregory	ligula elit, pretium	4	1
52	Garrison	Downs	Davis	risus odio, auctor	1	1
53	Duncan	Kaufman	Hiram	et risus. Quisque libero	5	1
54	Fiona	Mcdaniel	Burton	egestas. Duis ac	6	1
55	Jasper	Mullins	Cain	Donec luctus aliquet	6	1
56	Caldwell	William	Adam	aliquet, metus urna	3	1
57	Armando	Knowles	Octavius	et tristique pellentesque,	5	1
58	Cara	Dudley	Marshall	at, iaculis quis, pede.	4	1
59	Marny	Townsend	Victor	risus. In mi pede,	2	1
60	Maggy	Ross	Erasmus	tristique pellentesque, tellus sem	3	1
61	Karen	Reilly	Kane	Quisque libero	4	1
62	Quentin	Battle	Branden	Suspendisse ac metus vitae	2	1
63	Macaulay	Harrell	Finn	Morbi neque tellus,	3	1
64	Yuli	Le	Sean	dui quis accumsan	1	1
65	Reese	Horn	Cadman	arcu ac orci. Ut	3	1
66	Xanthus	Hall	Bradley	Quisque tincidunt	1	1
67	Keegan	Reilly	Akeem	tincidunt pede ac	3	1
68	Colton	Sherman	Chandler	id enim. Curabitur	3	1
69	Ulla	Guthrie	Stewart	sed, facilisis vitae, orci.	3	1
70	Rashad	Dejesus	Axel	auctor vitae,	2	1
71	Frances	Davis	Austin	tincidunt aliquam arcu. Aliquam	5	1
72	Alfreda	Schneider	Harlan	volutpat. Nulla facilisis.	5	1
73	Grant	Deleon	David	et malesuada fames	2	1
74	Amy	Snider	Kieran	Nunc ullamcorper, velit in	1	1
75	Wynter	Moody	Ulysses	Aenean eget magna. Suspendisse	5	1
76	Carlos	Pennington	Ethan	ipsum. Suspendisse non leo.	2	1
77	Garth	Freeman	Oscar	turpis egestas. Fusce	5	1
78	Lance	Mcleod	Mufutau	libero. Proin	2	1
79	Micah	Conner	Oscar	iaculis enim, sit	2	1
80	Neil	Atkinson	Jameson	nec enim.	1	1
81	Aretha	Solis	Patrick	non, feugiat nec,	5	1
82	Merrill	Gray	Barclay	lacinia. Sed	4	1
83	Sawyer	Sellers	Damon	a, malesuada id,	2	1
84	Amela	Keller	Alvin	risus quis	5	1
85	Jeremy	Spears	Daniel	Morbi non sapien	2	1
86	Ivan	Cleveland	Evan	viverra. Maecenas iaculis aliquet	3	1
87	Desiree	Barton	Grady	tellus. Aenean	1	1
88	Faith	Santos	Judah	feugiat. Lorem ipsum dolor	1	1
89	May	Beasley	Ivor	fermentum vel, mauris.	6	1
90	Jael	Hansen	Simon	eu tellus. Phasellus elit	3	1
91	Ralph	Finch	Arthur	nonummy. Fusce fermentum	2	1
92	Kadeem	Everett	Uriel	sit amet nulla.	3	1
93	Finn	Dominguez	Fritz	sit amet,	6	1
94	Jasper	Bowman	Cade	tellus, imperdiet non,	5	1
95	Margaret	Mullen	Ian	enim, gravida sit	5	1
96	Clarke	Burks	Derek	Quisque ornare	5	1
97	Ainsley	Bender	Mark	consectetuer adipiscing elit.	5	1
98	Sylvester	Schwartz	Macon	ut aliquam iaculis,	5	1
99	Derek	Sosa	Sylvester	In nec	5	1
100	Gisela	Quinn	Jerry	mus. Proin vel	6	1
101	Gareth	Hoover	Victor	sem mollis dui, in	3	1
\.


--
-- Data for Name: workgroup_roles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.workgroup_roles (id, role) FROM stdin;
1	Admin
2	Manager
3	Employee
\.


--
-- Data for Name: workgroups; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.workgroups (id, name, description, is_project, private_type_id, creator_id, created_at) FROM stdin;
1	fames	at auctor ullamcorper, nisl arcu iaculis enim,	t	1	29	2022-04-15 06:38:56
2	amet, consectetuer	nec ligula	t	1	96	2023-07-24 22:18:28
3	at, velit.	non arcu. Vivamus sit amet	f	1	47	2023-10-26 17:49:52
4	euismod mauris	ultrices. Duis volutpat nunc sit amet	f	1	4	2022-08-30 16:09:39
5	habitant morbi	nibh. Phasellus nulla. Integer vulputate, risus a ultricies	f	1	77	2022-07-13 21:39:19
6	metus vitae velit egestas	mauris a nunc. In at pede. Cras vulputate	t	1	63	2024-01-08 14:53:53
\.


--
-- Data for Name: workgroups_files; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.workgroups_files (id, path, workgroup_id, size, uploader_id, upload_at) FROM stdin;
1	in, tempus eu,	3	6293	69	2022-08-09 08:30:19
2	lobortis tellus	2	6597	58	2023-04-08 19:29:48
3	ante. Nunc	3	9485	73	2023-02-06 02:30:48
4	ut	3	6045	7	2023-12-01 11:39:03
5	luctus sit amet,	6	6998	69	2023-10-29 19:55:41
6	cubilia Curae Donec	5	5081	80	2022-06-25 23:25:19
7	vehicula. Pellentesque	3	5671	37	2022-02-28 15:18:25
8	Nunc sollicitudin commodo	6	1023	14	2022-05-18 06:58:04
9	rutrum	5	6300	12	2023-02-23 12:47:56
10	commodo ipsum. Suspendisse non	3	6498	18	2022-10-30 15:16:14
11	enim mi tempor	3	1286	61	2023-01-04 02:25:23
12	Morbi sit amet	2	6221	33	2022-11-07 14:45:12
13	sociis natoque	4	6157	39	2022-07-04 01:43:03
14	sem, vitae aliquam	3	9952	86	2022-01-18 12:51:16
15	ultrices	5	1917	42	2022-05-26 20:45:48
16	massa. Integer vitae nibh.	5	7605	53	2023-10-05 23:53:52
17	nascetur	5	9476	39	2023-10-31 19:52:44
18	Sed id risus quis	3	2804	85	2022-01-11 17:39:50
19	dui lectus rutrum	4	6055	43	2023-08-14 01:53:19
20	fringilla cursus	3	8812	73	2022-02-10 18:58:30
21	Ut sagittis	5	5556	52	2023-08-19 04:52:20
22	eget	3	6061	21	2023-11-11 00:54:59
23	Sed diam lorem,	2	5478	93	2022-03-19 04:06:38
24	risus. In mi	5	3132	81	2022-10-02 11:38:44
25	Etiam laoreet, libero et	4	1700	35	2023-06-26 23:37:36
26	eleifend, nunc	2	4798	11	2023-07-30 02:00:59
27	facilisis vitae, orci. Phasellus	3	8385	24	2023-07-14 21:21:52
28	In faucibus. Morbi	5	5827	45	2023-10-14 21:04:49
29	auctor odio	4	4509	40	2022-05-07 05:39:17
30	Fusce	6	1585	5	2023-04-07 06:34:39
31	nisi. Cum sociis natoque	4	9377	67	2023-10-21 13:44:46
32	mollis nec, cursus	5	7955	75	2022-05-12 22:21:17
33	pede nec ante	2	6755	9	2023-08-06 08:06:55
34	risus varius orci, in	3	5973	2	2023-06-06 00:39:06
35	ac tellus. Suspendisse	4	8168	99	2023-10-13 13:06:46
36	tincidunt nibh.	5	2444	43	2023-07-10 00:31:32
37	massa. Suspendisse	2	9912	60	2023-03-02 06:08:33
38	ante blandit	3	4178	45	2022-08-13 13:00:59
39	dolor.	2	1904	69	2023-04-04 07:50:30
40	a, aliquet	5	5482	47	2023-08-27 03:20:54
41	natoque penatibus	2	4504	12	2023-03-03 11:35:18
42	dui. Cum	2	2168	32	2022-06-10 02:26:20
43	Vestibulum accumsan neque et	3	8656	39	2022-11-22 07:09:22
44	pede sagittis	2	3159	89	2022-07-26 01:15:34
45	ornare. Fusce mollis.	3	5974	90	2023-09-22 04:37:56
46	cursus. Integer	3	5771	54	2022-02-15 09:13:57
47	Proin non	2	8611	46	2023-07-07 09:07:58
48	sagittis felis.	5	8570	26	2022-09-27 16:57:51
49	tortor nibh sit	4	5768	73	2022-05-09 15:38:48
50	Pellentesque habitant morbi	2	8750	84	2024-01-06 18:30:31
\.


--
-- Data for Name: workgroups_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.workgroups_users (user_id, workgroup_id, workgroup_role_id, created_at) FROM stdin;
30	4	1	2023-06-19 20:03:10
31	4	1	2022-12-05 01:32:04
32	4	3	2023-02-07 13:32:20
33	4	2	2023-09-06 10:04:10
34	4	2	2022-01-27 20:04:59
35	4	2	2022-03-14 13:51:53
36	4	3	2023-03-10 04:39:37
37	4	3	2023-10-10 01:36:53
38	4	1	2024-01-01 20:47:44
39	4	2	2023-11-27 21:26:37
40	4	1	2023-03-18 01:07:10
41	4	2	2023-08-06 12:12:17
42	4	2	2023-09-03 07:22:43
43	4	2	2023-05-19 04:53:22
44	4	2	2023-10-27 16:51:01
45	4	2	2024-01-10 11:46:13
46	4	2	2023-10-14 13:23:05
47	4	2	2022-05-01 19:48:09
48	4	2	2023-03-11 15:08:55
49	4	2	2022-08-05 22:12:53
50	4	2	2022-11-16 17:31:12
51	4	2	2023-06-09 02:52:20
52	4	2	2023-04-10 06:07:23
53	4	2	2023-10-13 04:20:19
54	4	1	2022-12-26 02:58:34
55	4	1	2022-09-17 12:44:36
56	4	1	2022-07-20 03:28:47
57	4	2	2023-10-08 06:34:23
58	4	2	2023-09-17 02:56:16
59	4	2	2023-07-02 16:42:32
60	4	2	2023-10-16 07:21:33
61	4	2	2022-12-29 11:38:29
62	4	1	2023-01-13 01:26:48
63	4	2	2022-10-27 07:51:07
64	4	2	2022-09-02 19:03:11
65	4	2	2023-04-14 14:45:20
66	4	3	2023-07-24 21:39:55
67	4	2	2023-03-30 08:23:35
68	4	2	2022-08-31 19:35:33
69	4	2	2022-06-05 21:42:38
1	1	1	2022-11-23 02:50:04
1	2	1	2022-07-19 14:24:23
1	3	1	2023-08-30 16:08:31
1	4	1	2023-10-31 16:02:47
1	5	1	2022-03-07 04:31:59
1	6	1	2023-01-23 11:44:09
2	1	2	2023-07-18 23:44:46
3	1	2	2023-06-12 18:50:10
4	1	2	2022-09-07 20:52:16
5	1	1	2022-02-07 08:49:18
6	1	2	2023-01-14 00:56:17
7	1	2	2022-07-04 12:19:56
8	1	3	2023-01-20 01:58:33
9	1	2	2022-08-29 08:39:07
10	1	2	2023-08-25 08:37:26
11	1	2	2022-05-11 04:15:37
12	1	2	2022-10-14 09:44:58
13	1	3	2022-04-15 10:29:17
14	1	2	2023-09-24 02:31:24
15	1	2	2022-07-09 13:46:22
16	1	2	2023-12-10 17:21:13
17	1	3	2024-01-09 02:09:29
18	1	2	2022-02-18 17:05:30
19	1	1	2023-04-19 21:49:19
20	1	2	2022-01-22 09:03:12
21	1	2	2022-06-16 00:50:10
20	2	1	2022-09-26 23:55:55
21	2	3	2022-10-25 16:11:23
22	2	2	2022-11-23 14:42:23
23	2	2	2022-10-16 06:42:26
24	2	2	2023-05-02 06:39:12
25	2	3	2022-09-01 22:14:43
26	2	2	2022-05-09 08:08:52
27	2	2	2022-11-26 01:00:07
28	2	3	2022-01-12 13:33:01
29	2	2	2022-06-07 11:09:09
30	2	1	2022-05-31 22:33:05
31	2	3	2022-11-09 22:52:56
32	2	1	2023-02-07 12:25:13
33	2	3	2022-06-11 05:36:57
34	2	2	2022-07-05 23:49:25
35	2	1	2023-01-25 02:58:05
36	2	2	2022-03-03 14:29:27
37	2	3	2022-05-10 01:05:14
38	2	2	2023-03-17 21:05:32
39	2	3	2022-09-16 20:25:23
5	5	1	2023-02-23 18:56:24
8	5	3	2023-01-24 19:29:04
11	5	1	2023-06-04 03:09:36
14	5	3	2022-10-17 16:50:33
17	5	2	2023-05-31 19:30:05
20	5	3	2022-09-29 20:20:46
23	5	1	2022-03-11 10:29:59
26	5	3	2023-04-05 00:51:25
29	5	3	2022-03-19 20:15:12
32	5	1	2022-04-26 04:28:24
35	5	2	2023-02-19 13:46:16
38	5	1	2022-08-23 22:37:36
41	5	3	2023-10-21 19:54:22
44	5	2	2023-05-05 08:17:39
47	5	3	2022-03-04 08:49:46
50	5	2	2023-01-23 03:42:57
53	5	1	2022-11-06 03:15:40
56	5	2	2023-08-07 14:21:47
59	5	2	2022-08-31 02:03:06
62	5	1	2022-03-12 13:57:57
10	3	2	2023-02-03 03:20:38
11	3	3	2024-01-05 13:02:09
12	3	3	2023-12-29 01:03:27
13	3	2	2022-01-13 01:41:15
14	3	2	2022-02-09 22:20:46
15	3	2	2023-08-26 19:13:16
16	3	2	2023-12-13 21:11:31
17	3	1	2023-10-20 10:14:49
18	3	2	2023-03-30 00:00:09
19	3	2	2023-03-08 10:51:40
20	3	2	2023-07-27 03:46:41
21	3	1	2023-12-10 17:08:12
22	3	1	2022-12-05 09:48:16
23	3	2	2023-01-12 22:00:14
24	3	1	2023-08-05 03:03:24
25	3	2	2022-05-15 07:05:52
26	3	3	2023-11-22 15:44:44
27	3	2	2022-07-06 20:56:58
28	3	2	2022-07-07 21:14:43
29	3	1	2023-05-31 03:00:55
30	3	2	2022-04-08 07:18:56
31	3	2	2022-02-24 23:34:53
32	3	2	2022-07-01 20:03:14
33	3	3	2023-06-30 15:07:14
34	3	1	2022-02-26 21:17:49
35	3	2	2022-09-21 08:47:48
36	3	2	2022-08-11 07:31:38
37	3	2	2023-01-21 21:40:15
38	3	2	2023-03-06 15:45:01
39	3	2	2022-12-14 14:29:00
40	3	2	2023-05-16 14:23:20
41	3	1	2023-08-05 17:29:30
42	3	1	2023-08-31 02:50:38
43	3	3	2022-03-28 21:14:32
44	3	2	2022-12-02 04:17:58
45	3	1	2023-01-27 12:04:18
46	3	2	2022-12-13 05:17:36
47	3	2	2022-10-07 14:29:15
48	3	2	2023-12-29 20:19:49
49	3	3	2023-02-11 06:24:58
\.


--
-- Name: departaments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.departaments_id_seq', 7, true);


--
-- Name: private_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.private_types_id_seq', 3, true);


--
-- Name: tasks_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tasks_comments_id_seq', 1, false);


--
-- Name: tasks_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tasks_files_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);


--
-- Name: tasks_remarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tasks_remarks_id_seq', 1, false);


--
-- Name: tasks_work_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.tasks_work_statuses_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: workgroup_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.workgroup_roles_id_seq', 3, true);


--
-- Name: workgroups_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.workgroups_files_id_seq', 1, false);


--
-- Name: workgroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.workgroups_id_seq', 1, false);


--
-- Name: departaments departaments_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.departaments
    ADD CONSTRAINT departaments_pkey PRIMARY KEY (id);


--
-- Name: private_types private_types_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.private_types
    ADD CONSTRAINT private_types_pkey PRIMARY KEY (id);


--
-- Name: tasks_comments tasks_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_comments
    ADD CONSTRAINT tasks_comments_pkey PRIMARY KEY (id);


--
-- Name: tasks_executers tasks_executers_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_executers
    ADD CONSTRAINT tasks_executers_pkey PRIMARY KEY (task_id, executer_id);


--
-- Name: tasks_files tasks_files_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_files
    ADD CONSTRAINT tasks_files_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: tasks_remarks tasks_remarks_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_remarks
    ADD CONSTRAINT tasks_remarks_pkey PRIMARY KEY (id);


--
-- Name: tasks_work_statuses tasks_work_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_work_statuses
    ADD CONSTRAINT tasks_work_statuses_pkey PRIMARY KEY (id);


--
-- Name: users_info_cards users_info_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_info_cards
    ADD CONSTRAINT users_info_cards_pkey PRIMARY KEY (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workgroup_roles workgroup_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroup_roles
    ADD CONSTRAINT workgroup_roles_pkey PRIMARY KEY (id);


--
-- Name: workgroups_files workgroups_files_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_files
    ADD CONSTRAINT workgroups_files_pkey PRIMARY KEY (id);


--
-- Name: workgroups workgroups_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_pkey PRIMARY KEY (id);


--
-- Name: workgroups_users workgroups_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_users
    ADD CONSTRAINT workgroups_users_pkey PRIMARY KEY (user_id, workgroup_id);


--
-- Name: users_info_cards info_card_department_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_info_cards
    ADD CONSTRAINT info_card_department_id_fk FOREIGN KEY (department_id) REFERENCES public.departaments(id) ON DELETE SET NULL;


--
-- Name: users_info_cards info_card_manager_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_info_cards
    ADD CONSTRAINT info_card_manager_id_fk FOREIGN KEY (manager_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: users_info_cards info_card_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users_info_cards
    ADD CONSTRAINT info_card_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks_comments tasks_comments_creator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_comments
    ADD CONSTRAINT tasks_comments_creator_id_fk FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks_comments tasks_comments_task_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_comments
    ADD CONSTRAINT tasks_comments_task_id_fk FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: tasks_executers tasks_executers_executer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_executers
    ADD CONSTRAINT tasks_executers_executer_id_fk FOREIGN KEY (executer_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks_executers tasks_executers_task_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_executers
    ADD CONSTRAINT tasks_executers_task_id_fk FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: tasks_files tasks_files_task_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_files
    ADD CONSTRAINT tasks_files_task_id_fk FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: tasks_files tasks_files_uploader_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_files
    ADD CONSTRAINT tasks_files_uploader_id_fk FOREIGN KEY (uploader_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks_remarks tasks_remarks_creator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_remarks
    ADD CONSTRAINT tasks_remarks_creator_id_fk FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks_remarks tasks_remarks_task_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks_remarks
    ADD CONSTRAINT tasks_remarks_task_id_fk FOREIGN KEY (task_id) REFERENCES public.tasks(id) ON DELETE CASCADE;


--
-- Name: tasks tasks_requester_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_requester_id_fk FOREIGN KEY (requester_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tasks tasks_work_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_work_status_id_fk FOREIGN KEY (work_status_id) REFERENCES public.tasks_work_statuses(id);


--
-- Name: tasks tasks_workgroup_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_workgroup_id_fk FOREIGN KEY (workgroup_id) REFERENCES public.workgroups(id) ON DELETE SET NULL;


--
-- Name: workgroups workgroups_creator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_creator_id_fk FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: workgroups_files workgroups_files_task_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_files
    ADD CONSTRAINT workgroups_files_task_id_fk FOREIGN KEY (workgroup_id) REFERENCES public.workgroups(id) ON DELETE CASCADE;


--
-- Name: workgroups_files workgroups_files_uploader_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_files
    ADD CONSTRAINT workgroups_files_uploader_id_fk FOREIGN KEY (uploader_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: workgroups workgroups_private_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups
    ADD CONSTRAINT workgroups_private_fk FOREIGN KEY (private_type_id) REFERENCES public.private_types(id);


--
-- Name: workgroups_users workgroups_users__userid_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_users
    ADD CONSTRAINT workgroups_users__userid_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: workgroups_users workgroups_users_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_users
    ADD CONSTRAINT workgroups_users_role_fk FOREIGN KEY (workgroup_role_id) REFERENCES public.workgroup_roles(id);


--
-- Name: workgroups_users workgroups_users_workgroupsid_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.workgroups_users
    ADD CONSTRAINT workgroups_users_workgroupsid_fk FOREIGN KEY (workgroup_id) REFERENCES public.workgroups(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

