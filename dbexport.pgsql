--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: axes_accessattempt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.axes_accessattempt (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    get_data text NOT NULL,
    post_data text NOT NULL,
    failures_since_start integer NOT NULL,
    CONSTRAINT axes_accessattempt_failures_since_start_check CHECK ((failures_since_start >= 0))
);


ALTER TABLE public.axes_accessattempt OWNER TO postgres;

--
-- Name: axes_accessattempt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.axes_accessattempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.axes_accessattempt_id_seq OWNER TO postgres;

--
-- Name: axes_accessattempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.axes_accessattempt_id_seq OWNED BY public.axes_accessattempt.id;


--
-- Name: axes_accessfailurelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.axes_accessfailurelog (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    locked_out boolean NOT NULL
);


ALTER TABLE public.axes_accessfailurelog OWNER TO postgres;

--
-- Name: axes_accessfailurelog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.axes_accessfailurelog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.axes_accessfailurelog_id_seq OWNER TO postgres;

--
-- Name: axes_accessfailurelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.axes_accessfailurelog_id_seq OWNED BY public.axes_accessfailurelog.id;


--
-- Name: axes_accesslog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.axes_accesslog (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    logout_time timestamp with time zone
);


ALTER TABLE public.axes_accesslog OWNER TO postgres;

--
-- Name: axes_accesslog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.axes_accesslog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.axes_accesslog_id_seq OWNER TO postgres;

--
-- Name: axes_accesslog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.axes_accesslog_id_seq OWNED BY public.axes_accesslog.id;


--
-- Name: categories_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories_category (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.categories_category OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories_category.id;


--
-- Name: comments_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments_comment (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    comment text NOT NULL,
    publicated boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.comments_comment OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_comment_id_seq OWNER TO postgres;

--
-- Name: comments_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments_comment.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_summernote_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_summernote_attachment (
    id integer NOT NULL,
    name character varying(255),
    file character varying(100) NOT NULL,
    uploaded timestamp with time zone NOT NULL
);


ALTER TABLE public.django_summernote_attachment OWNER TO postgres;

--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_summernote_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_summernote_attachment_id_seq OWNER TO postgres;

--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_summernote_attachment_id_seq OWNED BY public.django_summernote_attachment.id;


--
-- Name: posts_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_post (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    excerpt text NOT NULL,
    image character varying(100),
    publicated boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    category_id bigint
);


ALTER TABLE public.posts_post OWNER TO postgres;

--
-- Name: posts_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_post_id_seq OWNER TO postgres;

--
-- Name: posts_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_post_id_seq OWNED BY public.posts_post.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: axes_accessattempt id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accessattempt ALTER COLUMN id SET DEFAULT nextval('public.axes_accessattempt_id_seq'::regclass);


--
-- Name: axes_accessfailurelog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accessfailurelog ALTER COLUMN id SET DEFAULT nextval('public.axes_accessfailurelog_id_seq'::regclass);


--
-- Name: axes_accesslog id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accesslog ALTER COLUMN id SET DEFAULT nextval('public.axes_accesslog_id_seq'::regclass);


--
-- Name: categories_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_category ALTER COLUMN id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: comments_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_comment ALTER COLUMN id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_summernote_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_summernote_attachment ALTER COLUMN id SET DEFAULT nextval('public.django_summernote_attachment_id_seq'::regclass);


--
-- Name: posts_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post ALTER COLUMN id SET DEFAULT nextval('public.posts_post_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add post	1	add_post
2	Can change post	1	change_post
3	Can delete post	1	delete_post
4	Can view post	1	view_post
5	Can add category	2	add_category
6	Can change category	2	change_category
7	Can delete category	2	delete_category
8	Can view category	2	view_category
9	Can add comment	3	add_comment
10	Can change comment	3	change_comment
11	Can delete comment	3	delete_comment
12	Can view comment	3	view_comment
13	Can add log entry	4	add_logentry
14	Can change log entry	4	change_logentry
15	Can delete log entry	4	delete_logentry
16	Can view log entry	4	view_logentry
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add content type	8	add_contenttype
30	Can change content type	8	change_contenttype
31	Can delete content type	8	delete_contenttype
32	Can view content type	8	view_contenttype
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
37	Can add attachment	10	add_attachment
38	Can change attachment	10	change_attachment
39	Can delete attachment	10	delete_attachment
40	Can view attachment	10	view_attachment
41	Can add access attempt	11	add_accessattempt
42	Can change access attempt	11	change_accessattempt
43	Can delete access attempt	11	delete_accessattempt
44	Can view access attempt	11	view_accessattempt
45	Can add access log	12	add_accesslog
46	Can change access log	12	change_accesslog
47	Can delete access log	12	delete_accesslog
48	Can view access log	12	view_accesslog
49	Can add access failure	13	add_accessfailurelog
50	Can change access failure	13	change_accessfailurelog
51	Can delete access failure	13	delete_accessfailurelog
52	Can view access failure	13	view_accessfailurelog
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$320000$YVC7sZB9TFn3PS1EXXZOp2$gTSMEiORgEvVR8L3O1WHycAWerRKqAgqrE57aHCW/8E=	\N	f	ana	Ana	Garcia	ana@mail.com	f	t	2022-07-10 15:36:36-03
3	pbkdf2_sha256$320000$T6G0258O7t2ZEL73B5ZZEc$5GUv4E1JrB8nbdUrD+D+Hu75CARGd7FfK1GC44KCV38=	\N	f	leo	Leo	Silva	leo@mail.com	f	t	2022-07-10 15:37:20-03
1	pbkdf2_sha256$320000$v47I1opWJTnybGxHkqXqhq$LOLShLWYnbqrzdE8NwTQ7mMEymwnBzCfTYSiQO6nVVc=	2022-07-10 16:33:05.605715-03	t	bruno			bruno@mail.com	t	t	2022-07-10 15:30:13.089708-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: axes_accessattempt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.axes_accessattempt (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, get_data, post_data, failures_since_start) FROM stdin;
\.


--
-- Data for Name: axes_accessfailurelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.axes_accessfailurelog (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, locked_out) FROM stdin;
\.


--
-- Data for Name: axes_accesslog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.axes_accesslog (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, logout_time) FROM stdin;
1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36	127.0.0.1	bruno	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9	/admin/login/	2022-07-10 16:33:05.611868-03	\N
\.


--
-- Data for Name: categories_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories_category (id, name) FROM stdin;
5	Esportes
6	Entreterimento
7	Política
8	Tecnologia
\.


--
-- Data for Name: comments_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments_comment (id, name, email, comment, publicated, created_at, post_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-07-10 15:34:37.356339-03	1	Tecnology	1	[{"added": {}}]	2	1
2	2022-07-10 15:34:42.700806-03	2	Sports	1	[{"added": {}}]	2	1
3	2022-07-10 15:35:03.378253-03	3	Policy	1	[{"added": {}}]	2	1
4	2022-07-10 15:35:22.489784-03	4	Entertainment	1	[{"added": {}}]	2	1
5	2022-07-10 15:36:36.28463-03	2	ana	1	[{"added": {}}]	7	1
6	2022-07-10 15:36:59.475221-03	2	ana	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	7	1
7	2022-07-10 15:37:20.551445-03	3	leo	1	[{"added": {}}]	7	1
8	2022-07-10 15:37:46.373574-03	3	leo	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	7	1
9	2022-07-10 15:40:22.559674-03	1	Título teste	1	[{"added": {}}]	1	1
10	2022-07-10 19:10:45.866849-03	2	dsddsdsdsd	3		3	1
11	2022-07-10 19:10:53.817332-03	1	Tecnology	3		3	1
12	2022-07-10 19:11:05.540798-03	1	Título teste	3		1	1
13	2022-07-10 19:11:14.880595-03	4	Entertainment	3		2	1
14	2022-07-10 19:11:18.624263-03	3	Policy	3		2	1
15	2022-07-10 19:11:21.178059-03	2	Sports	3		2	1
16	2022-07-10 19:11:23.44878-03	1	Tecnology	3		2	1
17	2022-07-10 19:12:30.656311-03	5	Esportes	1	[{"added": {}}]	2	1
18	2022-07-10 19:13:04.482568-03	2	Teste	1	[{"added": {}}]	1	1
19	2022-07-10 19:13:24.93825-03	2	Teste	2	[{"changed": {"fields": ["Publicated"]}}]	1	1
20	2022-07-10 19:14:19.483008-03	2	Teste	3		1	1
21	2022-07-10 19:14:34.48418-03	6	Entreterimento	1	[{"added": {}}]	2	1
22	2022-07-10 19:14:51.715876-03	7	Política	1	[{"added": {}}]	2	1
23	2022-07-10 19:15:01.420277-03	8	Tecnologia	1	[{"added": {}}]	2	1
24	2022-07-10 19:17:14.04602-03	3	What is Lorem Ipsum?	1	[{"added": {}}]	1	1
25	2022-07-10 19:17:54.382286-03	4	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distrib	1	[{"added": {}}]	1	1
26	2022-07-10 19:18:14.165619-03	4	Why do we use it?	2	[{"changed": {"fields": ["Title"]}}]	1	1
27	2022-07-10 19:18:58.999487-03	5	Where does it come from?	1	[{"added": {}}]	1	1
28	2022-07-10 19:19:38.383756-03	6	Where can I get some?	1	[{"added": {}}]	1	1
29	2022-07-10 19:20:33.33663-03	7	What is Lorem Ipsum?	1	[{"added": {}}]	1	1
30	2022-07-10 19:22:23.610712-03	8	Why do we use it?	1	[{"added": {}}]	1	1
31	2022-07-10 19:23:49.873564-03	9	Where does it come from?	1	[{"added": {}}]	1	1
32	2022-07-10 19:24:29.193825-03	10	Where can I get some?	1	[{"added": {}}]	1	1
33	2022-07-10 19:25:19.240933-03	9	Where does it come from?	2	[{"changed": {"fields": ["Publicated"]}}]	1	1
34	2022-07-10 19:25:19.248308-03	8	Why do we use it?	2	[{"changed": {"fields": ["Publicated"]}}]	1	1
35	2022-07-10 19:26:28.654021-03	5	Where does it come from?	2	[{"changed": {"fields": ["Image"]}}]	1	1
36	2022-07-10 19:27:03.391558-03	11	Where can I get some?	1	[{"added": {}}]	1	1
37	2022-07-10 19:28:28.594356-03	12	Where can I get some?	1	[{"added": {}}]	1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	posts	post
2	categories	category
3	comments	comment
4	admin	logentry
5	auth	permission
6	auth	group
7	auth	user
8	contenttypes	contenttype
9	sessions	session
10	django_summernote	attachment
11	axes	accessattempt
12	axes	accesslog
13	axes	accessfailurelog
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-07-10 15:22:54.078868-03
2	auth	0001_initial	2022-07-10 15:22:54.251299-03
3	admin	0001_initial	2022-07-10 15:22:54.301225-03
4	admin	0002_logentry_remove_auto_add	2022-07-10 15:22:54.318748-03
5	admin	0003_logentry_add_action_flag_choices	2022-07-10 15:22:54.339233-03
6	contenttypes	0002_remove_content_type_name	2022-07-10 15:22:54.372809-03
7	auth	0002_alter_permission_name_max_length	2022-07-10 15:22:54.393493-03
8	auth	0003_alter_user_email_max_length	2022-07-10 15:22:54.411881-03
9	auth	0004_alter_user_username_opts	2022-07-10 15:22:54.4298-03
10	auth	0005_alter_user_last_login_null	2022-07-10 15:22:54.448541-03
11	auth	0006_require_contenttypes_0002	2022-07-10 15:22:54.454459-03
12	auth	0007_alter_validators_add_error_messages	2022-07-10 15:22:54.472215-03
13	auth	0008_alter_user_username_max_length	2022-07-10 15:22:54.502683-03
14	auth	0009_alter_user_last_name_max_length	2022-07-10 15:22:54.521157-03
15	auth	0010_alter_group_name_max_length	2022-07-10 15:22:54.542628-03
16	auth	0011_update_proxy_permissions	2022-07-10 15:22:54.56014-03
17	auth	0012_alter_user_first_name_max_length	2022-07-10 15:22:54.578551-03
18	categories	0001_initial	2022-07-10 15:22:54.595923-03
19	posts	0001_initial	2022-07-10 15:22:54.650945-03
20	comments	0001_initial	2022-07-10 15:22:54.71193-03
21	comments	0002_alter_comment_comment_alter_comment_email_and_more	2022-07-10 15:22:54.795399-03
22	django_summernote	0001_initial	2022-07-10 15:22:54.811697-03
23	django_summernote	0002_update-help_text	2022-07-10 15:22:54.821843-03
24	sessions	0001_initial	2022-07-10 15:22:54.85687-03
25	axes	0001_initial	2022-07-10 16:31:11.046459-03
26	axes	0002_auto_20151217_2044	2022-07-10 16:31:11.164961-03
27	axes	0003_auto_20160322_0929	2022-07-10 16:31:11.199313-03
28	axes	0004_auto_20181024_1538	2022-07-10 16:31:11.233432-03
29	axes	0005_remove_accessattempt_trusted	2022-07-10 16:31:11.247072-03
30	axes	0006_remove_accesslog_trusted	2022-07-10 16:31:11.260813-03
31	axes	0007_alter_accessattempt_unique_together	2022-07-10 16:31:11.306904-03
32	axes	0008_accessfailurelog	2022-07-10 16:31:11.36834-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
t8sbzqv3yc3wd0qpqwrdrdeat55w8bc5	.eJxVjEsOAiEQBe_C2hBAoMGl-zkD6YZGRs2QzGdlvLtOMgvdvqp6L5FwW1vaFp7TWMRFaHH63Qjzg6cdlDtOty5zn9Z5JLkr8qCLHHrh5_Vw_w4aLu1bV4iscwUCMqjRB-OYyDpFWJUqZ81ZBTAe2AFFZymCN9HFYEsAykq8P_ELN7E:1oAbi1:1Y1LD8Zk8tDNpAUdCH8XS-fAwRmT7kHgj301auUhMos	2022-07-24 15:31:09.732546-03
zy8svm4geg20oeccrh4ivnu5927qq2kl	.eJxVjEsOAiEQBe_C2hBAoMGl-zkD6YZGRs2QzGdlvLtOMgvdvqp6L5FwW1vaFp7TWMRFaHH63Qjzg6cdlDtOty5zn9Z5JLkr8qCLHHrh5_Vw_w4aLu1bV4iscwUCMqjRB-OYyDpFWJUqZ81ZBTAe2AFFZymCN9HFYEsAykq8P_ELN7E:1oAcfx:6kBHsbTdnGEiSkJkk2F3OZ5a2qGfRq4tY82smboR6GY	2022-07-24 16:33:05.617884-03
\.


--
-- Data for Name: django_summernote_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_summernote_attachment (id, name, file, uploaded) FROM stdin;
\.


--
-- Data for Name: posts_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_post (id, title, content, excerpt, image, publicated, created_at, author_id, category_id) FROM stdin;
7	What is Lorem Ipsum?	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</span><br></p>	post_img/2022/07/10/6.jpg	t	2022-07-10 19:19:40-03	1	8
3	What is Lorem Ipsum?	<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker.</span><br></p>	post_img/2022/07/10/2.jpg	t	2022-07-10 19:15:55-03	1	5
4	Why do we use it?	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	post_img/2022/07/10/3.jpg	t	2022-07-10 19:17:19-03	2	6
6	Where can I get some?	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum</span><br></p>	post_img/2022/07/10/5.jpg	t	2022-07-10 19:19:07-03	2	8
5	Where does it come from?	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</span><br></p>	post_img/2022/07/10/11.jpg	t	2022-07-10 19:18:22-03	3	7
10	Where can I get some?	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">(The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span><br></p>	post_img/2022/07/10/9.jpg	t	2022-07-10 19:23:54-03	1	5
9	Where does it come from?	<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour</span><br></p>	post_img/2022/07/10/10_9FYQ9Zp.jpg	t	2022-07-10 19:22:38-03	2	6
8	Why do we use it?	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>	post_img/2022/07/10/8.jpg	t	2022-07-10 19:21:26-03	3	7
11	Where can I get some?	<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br></p>	<p><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using</span><br></p>	post_img/2022/07/10/hero.jpg	t	2022-07-10 19:26:32-03	2	7
12	Where can I get some?	<p style="margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p><p style="margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>	<p><strong style="margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">Lorem Ipsum</strong><span style="color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</span><br></p>	post_img/2022/07/10/7.jpg	t	2022-07-10 19:27:38-03	1	8
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: axes_accessattempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.axes_accessattempt_id_seq', 2, true);


--
-- Name: axes_accessfailurelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.axes_accessfailurelog_id_seq', 1, false);


--
-- Name: axes_accesslog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.axes_accesslog_id_seq', 1, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 8, true);


--
-- Name: comments_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_comment_id_seq', 2, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 37, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);


--
-- Name: django_summernote_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_summernote_attachment_id_seq', 1, false);


--
-- Name: posts_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_post_id_seq', 12, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: axes_accessattempt axes_accessattempt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accessattempt
    ADD CONSTRAINT axes_accessattempt_pkey PRIMARY KEY (id);


--
-- Name: axes_accessattempt axes_accessattempt_username_ip_address_user_agent_8ea22282_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accessattempt
    ADD CONSTRAINT axes_accessattempt_username_ip_address_user_agent_8ea22282_uniq UNIQUE (username, ip_address, user_agent);


--
-- Name: axes_accessfailurelog axes_accessfailurelog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accessfailurelog
    ADD CONSTRAINT axes_accessfailurelog_pkey PRIMARY KEY (id);


--
-- Name: axes_accesslog axes_accesslog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.axes_accesslog
    ADD CONSTRAINT axes_accesslog_pkey PRIMARY KEY (id);


--
-- Name: categories_category categories_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories_category
    ADD CONSTRAINT categories_category_pkey PRIMARY KEY (id);


--
-- Name: comments_comment comments_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_comment
    ADD CONSTRAINT comments_comment_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_summernote_attachment django_summernote_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_summernote_attachment
    ADD CONSTRAINT django_summernote_attachment_pkey PRIMARY KEY (id);


--
-- Name: posts_post posts_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: axes_accessattempt_ip_address_10922d9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessattempt_ip_address_10922d9c ON public.axes_accessattempt USING btree (ip_address);


--
-- Name: axes_accessattempt_user_agent_ad89678b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessattempt_user_agent_ad89678b ON public.axes_accessattempt USING btree (user_agent);


--
-- Name: axes_accessattempt_user_agent_ad89678b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessattempt_user_agent_ad89678b_like ON public.axes_accessattempt USING btree (user_agent varchar_pattern_ops);


--
-- Name: axes_accessattempt_username_3f2d4ca0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessattempt_username_3f2d4ca0 ON public.axes_accessattempt USING btree (username);


--
-- Name: axes_accessattempt_username_3f2d4ca0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessattempt_username_3f2d4ca0_like ON public.axes_accessattempt USING btree (username varchar_pattern_ops);


--
-- Name: axes_accessfailurelog_ip_address_2e9f5a7f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessfailurelog_ip_address_2e9f5a7f ON public.axes_accessfailurelog USING btree (ip_address);


--
-- Name: axes_accessfailurelog_user_agent_ea145dda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessfailurelog_user_agent_ea145dda ON public.axes_accessfailurelog USING btree (user_agent);


--
-- Name: axes_accessfailurelog_user_agent_ea145dda_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessfailurelog_user_agent_ea145dda_like ON public.axes_accessfailurelog USING btree (user_agent varchar_pattern_ops);


--
-- Name: axes_accessfailurelog_username_a8b7e8a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessfailurelog_username_a8b7e8a4 ON public.axes_accessfailurelog USING btree (username);


--
-- Name: axes_accessfailurelog_username_a8b7e8a4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accessfailurelog_username_a8b7e8a4_like ON public.axes_accessfailurelog USING btree (username varchar_pattern_ops);


--
-- Name: axes_accesslog_ip_address_86b417e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accesslog_ip_address_86b417e5 ON public.axes_accesslog USING btree (ip_address);


--
-- Name: axes_accesslog_user_agent_0e659004; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accesslog_user_agent_0e659004 ON public.axes_accesslog USING btree (user_agent);


--
-- Name: axes_accesslog_user_agent_0e659004_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accesslog_user_agent_0e659004_like ON public.axes_accesslog USING btree (user_agent varchar_pattern_ops);


--
-- Name: axes_accesslog_username_df93064b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accesslog_username_df93064b ON public.axes_accesslog USING btree (username);


--
-- Name: axes_accesslog_username_df93064b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX axes_accesslog_username_df93064b_like ON public.axes_accesslog USING btree (username varchar_pattern_ops);


--
-- Name: comments_comment_post_id_96a9ac05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comments_comment_post_id_96a9ac05 ON public.comments_comment USING btree (post_id);


--
-- Name: comments_comment_user_id_a1db4881; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comments_comment_user_id_a1db4881 ON public.comments_comment USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: posts_post_author_id_fe5487bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_author_id_fe5487bf ON public.posts_post USING btree (author_id);


--
-- Name: posts_post_category_id_ab339803; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_category_id_ab339803 ON public.posts_post USING btree (category_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comments_comment comments_comment_post_id_96a9ac05_fk_posts_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_comment
    ADD CONSTRAINT comments_comment_post_id_96a9ac05_fk_posts_post_id FOREIGN KEY (post_id) REFERENCES public.posts_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comments_comment comments_comment_user_id_a1db4881_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments_comment
    ADD CONSTRAINT comments_comment_user_id_a1db4881_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post posts_post_author_id_fe5487bf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_author_id_fe5487bf_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post posts_post_category_id_ab339803_fk_categories_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_category_id_ab339803_fk_categories_category_id FOREIGN KEY (category_id) REFERENCES public.categories_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

