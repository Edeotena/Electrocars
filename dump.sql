--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.6 (Ubuntu 14.6-0ubuntu0.22.04.1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO edeotena;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    full_name character varying,
    phone_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.clients OWNER TO edeotena;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: edeotena
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO edeotena;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edeotena
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: connectors; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.connectors (
    id bigint NOT NULL,
    connector_type character varying,
    power numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    station_id bigint NOT NULL
);


ALTER TABLE public.connectors OWNER TO edeotena;

--
-- Name: connectors_id_seq; Type: SEQUENCE; Schema: public; Owner: edeotena
--

CREATE SEQUENCE public.connectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connectors_id_seq OWNER TO edeotena;

--
-- Name: connectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edeotena
--

ALTER SEQUENCE public.connectors_id_seq OWNED BY public.connectors.id;


--
-- Name: points; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.points (
    id bigint NOT NULL,
    name character varying,
    latitude numeric,
    longitude numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.points OWNER TO edeotena;

--
-- Name: points_id_seq; Type: SEQUENCE; Schema: public; Owner: edeotena
--

CREATE SEQUENCE public.points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.points_id_seq OWNER TO edeotena;

--
-- Name: points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edeotena
--

ALTER SEQUENCE public.points_id_seq OWNED BY public.points.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO edeotena;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    connector_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    status character varying,
    energy numeric
);


ALTER TABLE public.sessions OWNER TO edeotena;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: edeotena
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO edeotena;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edeotena
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: stations; Type: TABLE; Schema: public; Owner: edeotena
--

CREATE TABLE public.stations (
    id bigint NOT NULL,
    serial_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    point_id bigint NOT NULL
);


ALTER TABLE public.stations OWNER TO edeotena;

--
-- Name: stations_id_seq; Type: SEQUENCE; Schema: public; Owner: edeotena
--

CREATE SEQUENCE public.stations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stations_id_seq OWNER TO edeotena;

--
-- Name: stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: edeotena
--

ALTER SEQUENCE public.stations_id_seq OWNED BY public.stations.id;


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: connectors id; Type: DEFAULT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.connectors ALTER COLUMN id SET DEFAULT nextval('public.connectors_id_seq'::regclass);


--
-- Name: points id; Type: DEFAULT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.points ALTER COLUMN id SET DEFAULT nextval('public.points_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: stations id; Type: DEFAULT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.stations ALTER COLUMN id SET DEFAULT nextval('public.stations_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-02-08 08:49:21.726168	2023-02-08 08:49:21.726168
schema_sha1	a01cd516f0e70d0e0c057cfa4f07fe8733d5e923	2023-02-08 08:49:21.745635	2023-02-08 08:49:21.745635
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.clients (id, full_name, phone_number, created_at, updated_at) FROM stdin;
1	Yelena Osipova	+7(4812)82-49-53 	2023-02-08 09:29:35.178379	2023-02-08 09:29:35.178379
2	Iolanta Kuznetsova	+7(8443)33-45-47	2023-02-08 09:30:06.051506	2023-02-08 09:30:06.051506
3	Stepan Sokolo	+7(8552)55-61-37	2023-02-08 09:30:50.847093	2023-02-08 09:30:50.847093
4	Zakhar Novikov	+7(4742)39-47-91	2023-02-08 09:31:16.329469	2023-02-08 09:31:16.329469
5	Grisha Sergeev	+7(4742)47-91-13 	2023-02-08 09:31:49.730865	2023-02-08 09:31:49.730865
6	Adrik Gusev	+7(4922)33-17-26 	2023-02-08 09:32:21.922337	2023-02-08 09:32:21.922337
7	Ipatiy Kuzmin	+7(39553)5-96-28 	2023-02-08 09:32:45.43412	2023-02-08 09:32:45.43412
8	Larissa Koroleva	+7(347)822-76-50 	2023-02-08 09:33:10.981782	2023-02-08 09:33:10.981782
9	Khariton Vinogradov	+7(843)471-68-00	2023-02-08 09:33:31.464957	2023-02-08 09:33:31.464957
10	Efimiia Lebedeva	+7(3955)99-48-40 	2023-02-08 09:33:52.682372	2023-02-08 09:33:52.682372
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.connectors (id, connector_type, power, created_at, updated_at, station_id) FROM stdin;
1	Type 2	1.0	2023-02-08 09:22:24.662012	2023-02-08 09:22:24.662012	13
2	CHAdeMO	21.0	2023-02-08 09:22:28.963972	2023-02-08 09:22:28.963972	13
3	CCS Combo 2	31.0	2023-02-08 09:22:50.421367	2023-02-08 09:22:50.421367	13
4	Type 2	13.0	2023-02-08 09:23:00.172134	2023-02-08 09:23:00.172134	14
5	Type 2	32.0	2023-02-08 09:23:06.484291	2023-02-08 09:23:06.484291	14
6	CHAdeMO	23.0	2023-02-08 09:23:15.033603	2023-02-08 09:23:15.033603	15
7	CCS Combo 2	12.0	2023-02-08 09:23:24.679797	2023-02-08 09:23:24.679797	15
8	CHAdeMO	1.0	2023-02-08 09:23:36.011046	2023-02-08 09:23:36.011046	16
9	Type 2	12.0	2023-02-08 09:23:51.425352	2023-02-08 09:23:51.425352	4
10	CCS Combo 2	123.0	2023-02-08 09:24:02.230663	2023-02-08 09:24:02.230663	3
11	Type 2	12.0	2023-02-08 09:24:06.129461	2023-02-08 09:24:06.129461	3
12	CCS Combo 2	32.0	2023-02-08 09:24:15.9014	2023-02-08 09:24:15.9014	2
13	CCS Combo 2	23.0	2023-02-08 09:24:21.3513	2023-02-08 09:24:21.3513	2
14	Type 2	1.0	2023-02-08 09:24:28.30449	2023-02-08 09:24:28.30449	1
15	CHAdeMO	2.0	2023-02-08 09:24:32.744487	2023-02-08 09:24:32.744487	1
16	Type 2	1.0	2023-02-08 09:24:42.32049	2023-02-08 09:24:42.32049	8
17	CHAdeMO	2.0	2023-02-08 09:24:46.457291	2023-02-08 09:24:46.457291	8
18	CCS Combo 2	3.0	2023-02-08 09:24:56.888694	2023-02-08 09:24:56.888694	8
19	Type 2	111.0	2023-02-08 09:25:29.721215	2023-02-08 09:25:29.721215	7
20	CCS Combo 2	2.0	2023-02-08 09:25:37.865778	2023-02-08 09:25:37.865778	6
21	Type 2	2.0	2023-02-08 09:25:41.990287	2023-02-08 09:25:41.990287	6
22	CHAdeMO	1.0	2023-02-08 09:25:48.620102	2023-02-08 09:25:48.620102	5
23	Type 2	100.0	2023-02-08 09:25:53.030776	2023-02-08 09:25:53.030776	5
24	Type 2	12.0	2023-02-08 09:26:11.722785	2023-02-08 09:26:11.722785	12
25	CHAdeMO	1.0	2023-02-08 09:26:18.97554	2023-02-08 09:26:18.97554	10
26	CCS Combo 2	1.0	2023-02-08 09:26:27.365438	2023-02-08 09:26:27.365438	11
27	Type 2	2.0	2023-02-08 09:26:31.805003	2023-02-08 09:26:31.805003	11
28	CCS Combo 2	121.0	2023-02-08 09:26:39.219023	2023-02-08 09:26:39.219023	9
29	Type 2	212.0	2023-02-08 09:26:44.821369	2023-02-08 09:26:44.821369	9
\.


--
-- Data for Name: points; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.points (id, name, latitude, longitude, created_at, updated_at) FROM stdin;
4	Samara	53.241505	50.221245	2023-02-08 09:03:32.771981	2023-02-08 09:07:26.170345
1	Moscow	55.751244	37.618423	2023-02-08 09:08:15.613875	2023-02-08 09:08:15.613875
2	Kaliningrad	54.715424	20.509207	2023-02-08 09:08:42.105358	2023-02-08 09:08:42.105358
3	Yekaterinburg	56.833332	60.583332	2023-02-08 09:09:49.319601	2023-02-08 09:09:49.319601
5	Omsk	54.983334	73.366669	2023-02-08 09:10:35.480823	2023-02-08 09:10:35.480823
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.schema_migrations (version) FROM stdin;
20230207155618
20230206104441
20230206104608
20230206105008
20230206110815
20230206110902
20230206111321
20230207121617
20230207133535
20230207145333
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.sessions (id, client_id, connector_id, created_at, updated_at, status, energy) FROM stdin;
3	3	26	2023-02-08 09:36:06.97091	2023-02-08 09:36:06.97091	active	213.0
4	4	25	2023-02-08 09:36:14.36888	2023-02-08 09:36:15.402056	disable	123.0
5	5	25	2023-02-08 09:36:22.305996	2023-02-08 09:36:24.015866	disable	123.0
8	6	11	2023-02-08 09:36:49.176989	2023-02-08 09:36:50.291826	disable	21.0
9	6	10	2023-02-08 09:36:57.973406	2023-02-08 09:36:57.973406	active	123.0
10	7	13	2023-02-08 09:37:05.552851	2023-02-08 09:37:05.552851	active	40.0
11	8	15	2023-02-08 09:37:12.843296	2023-02-08 09:37:12.843296	active	23.0
12	9	18	2023-02-08 09:37:29.110703	2023-02-08 09:37:29.110703	active	12.0
13	10	16	2023-02-08 09:37:34.148373	2023-02-08 09:37:35.158907	disable	213.0
14	10	8	2023-02-08 09:37:45.05449	2023-02-08 09:37:45.05449	active	12.0
1	1	24	2023-02-08 09:35:07.921929	2023-02-08 09:40:31.045458	disable	1.0
15	1	24	2023-02-08 09:40:33.43459	2023-02-08 09:40:33.43459	active	12.0
2	2	27	2023-02-08 09:36:02.27195	2023-02-08 09:40:40.230696	disable	12.0
6	4	25	2023-02-08 09:36:26.007664	2023-02-08 09:40:46.492211	disable	12.0
16	2	17	2023-02-08 09:40:59.287543	2023-02-08 09:40:59.287543	active	12.0
17	4	22	2023-02-08 09:41:19.188846	2023-02-08 09:42:14.543854	disable	12.0
7	5	9	2023-02-08 09:36:41.063045	2023-02-08 09:42:24.731693	disable	123.0
18	4	12	2023-02-08 09:43:29.366227	2023-02-08 09:43:29.366227	active	322.0
19	5	9	2023-02-08 09:43:38.513665	2023-02-08 09:43:38.513665	active	21.0
\.


--
-- Data for Name: stations; Type: TABLE DATA; Schema: public; Owner: edeotena
--

COPY public.stations (id, serial_number, created_at, updated_at, point_id) FROM stdin;
1	M1	2023-02-08 09:11:42.59106	2023-02-08 09:11:42.59106	1
2	M2	2023-02-08 09:11:55.474674	2023-02-08 09:11:55.474674	1
3	M3	2023-02-08 09:12:06.443612	2023-02-08 09:12:06.443612	1
5	K1	2023-02-08 09:13:03.606282	2023-02-08 09:13:03.606282	2
4	M4	2023-02-08 09:13:28.364736	2023-02-08 09:13:28.364736	1
6	K2	2023-02-08 09:13:53.143131	2023-02-08 09:13:53.143131	2
7	K3	2023-02-08 09:14:07.026159	2023-02-08 09:14:07.026159	2
9	Y1	2023-02-08 09:14:22.640562	2023-02-08 09:15:14.85303	3
8	K4	2023-02-08 09:15:36.736275	2023-02-08 09:15:36.736275	2
10	Y2	2023-02-08 09:16:03.793358	2023-02-08 09:16:03.793358	3
11	Y3	2023-02-08 09:16:14.937537	2023-02-08 09:16:14.937537	3
12	Y4	2023-02-08 09:16:59.650036	2023-02-08 09:16:59.650036	3
13	S1	2023-02-08 09:17:46.267329	2023-02-08 09:19:35.730296	4
14	S2	2023-02-08 09:18:13.872434	2023-02-08 09:19:42.903201	4
15	S3	2023-02-08 09:18:24.86938	2023-02-08 09:19:47.974403	4
16	S4	2023-02-08 09:18:35.367002	2023-02-08 09:19:54.05321	4
17	O1	2023-02-08 09:20:37.516232	2023-02-08 09:20:37.516232	5
18	O2	2023-02-08 09:20:47.793845	2023-02-08 09:20:47.793845	5
19	O3	2023-02-08 09:20:57.377182	2023-02-08 09:20:57.377182	5
20	O4	2023-02-08 09:21:15.818252	2023-02-08 09:21:15.818252	5
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edeotena
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, true);


--
-- Name: connectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edeotena
--

SELECT pg_catalog.setval('public.connectors_id_seq', 29, true);


--
-- Name: points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edeotena
--

SELECT pg_catalog.setval('public.points_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edeotena
--

SELECT pg_catalog.setval('public.sessions_id_seq', 19, true);


--
-- Name: stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: edeotena
--

SELECT pg_catalog.setval('public.stations_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: connectors connectors_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_pkey PRIMARY KEY (id);


--
-- Name: points points_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: stations stations_pkey; Type: CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT stations_pkey PRIMARY KEY (id);


--
-- Name: index_connectors_on_station_id; Type: INDEX; Schema: public; Owner: edeotena
--

CREATE INDEX index_connectors_on_station_id ON public.connectors USING btree (station_id);


--
-- Name: index_sessions_on_client_id; Type: INDEX; Schema: public; Owner: edeotena
--

CREATE INDEX index_sessions_on_client_id ON public.sessions USING btree (client_id);


--
-- Name: index_sessions_on_connector_id; Type: INDEX; Schema: public; Owner: edeotena
--

CREATE INDEX index_sessions_on_connector_id ON public.sessions USING btree (connector_id);


--
-- Name: index_stations_on_point_id; Type: INDEX; Schema: public; Owner: edeotena
--

CREATE INDEX index_stations_on_point_id ON public.stations USING btree (point_id);


--
-- Name: stations fk_rails_7d14442778; Type: FK CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.stations
    ADD CONSTRAINT fk_rails_7d14442778 FOREIGN KEY (point_id) REFERENCES public.points(id);


--
-- Name: sessions fk_rails_9e410b9855; Type: FK CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_9e410b9855 FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: connectors fk_rails_c6663557d9; Type: FK CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT fk_rails_c6663557d9 FOREIGN KEY (station_id) REFERENCES public.stations(id);


--
-- Name: sessions fk_rails_e5385c34de; Type: FK CONSTRAINT; Schema: public; Owner: edeotena
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT fk_rails_e5385c34de FOREIGN KEY (connector_id) REFERENCES public.connectors(id);


--
-- PostgreSQL database dump complete
--

