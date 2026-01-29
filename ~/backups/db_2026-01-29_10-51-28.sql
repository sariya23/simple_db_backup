--
-- PostgreSQL database dump
--

\restrict wTjarFIzU1Iti9b4ehTNVxDkHF9AxcUyHQcDipXwWuEiyQfB3MxWKSdN6MR8lAR

-- Dumped from database version 16.11 (Debian 16.11-1.pgdg13+1)
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

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
-- Name: goose_db_version; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.goose_db_version (
    id integer NOT NULL,
    version_id bigint NOT NULL,
    is_applied boolean NOT NULL,
    tstamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goose_db_version OWNER TO admin;

--
-- Name: goose_db_version_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.goose_db_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.goose_db_version_id_seq OWNER TO admin;

--
-- Name: goose_db_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.goose_db_version_id_seq OWNED BY public.goose_db_version.id;


--
-- Name: user_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_session (
    session_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    refresh_token_hash character varying NOT NULL,
    fingerprint uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expires_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone
);


ALTER TABLE public.user_session OWNER TO admin;

--
-- Name: verification; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.verification (
    verification_id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    email character varying(320) NOT NULL,
    hash_code character varying NOT NULL,
    event_type character varying(255) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    used_at timestamp without time zone
);


ALTER TABLE public.verification OWNER TO admin;

--
-- Name: goose_db_version id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.goose_db_version ALTER COLUMN id SET DEFAULT nextval('public.goose_db_version_id_seq'::regclass);


--
-- Data for Name: goose_db_version; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.goose_db_version (id, version_id, is_applied, tstamp) FROM stdin;
1	0	t	2026-01-28 21:16:46.243205
2	20250309205201	t	2026-01-28 21:16:46.251273
3	20250309211256	t	2026-01-28 21:16:46.257243
4	20250309212038	t	2026-01-28 21:16:46.261386
5	20260117133822	t	2026-01-28 21:16:46.26713
6	20260117134640	t	2026-01-28 21:16:46.268375
7	20260117134705	t	2026-01-28 21:16:46.270317
8	20260117134830	t	2026-01-28 21:16:46.271256
9	20260117134929	t	2026-01-28 21:16:46.273081
10	20260117135108	t	2026-01-28 21:16:46.273916
11	20260117135151	t	2026-01-28 21:16:46.27544
12	20260117135240	t	2026-01-28 21:16:46.276174
13	20260118161711	t	2026-01-28 21:16:46.277258
14	20260119113149	t	2026-01-28 21:16:46.279772
15	20260119113252	t	2026-01-28 21:16:46.280643
16	20260119113326	t	2026-01-28 21:16:46.281426
17	20260119113519	t	2026-01-28 21:16:46.282354
18	20260119115905	t	2026-01-28 21:16:46.283491
19	20260119120932	t	2026-01-28 21:16:46.287389
20	20260119121019	t	2026-01-28 21:16:46.288437
21	20260119121102	t	2026-01-28 21:16:46.289117
22	20260122170138	t	2026-01-28 21:16:46.289678
23	20260122170257	t	2026-01-28 21:16:46.295818
24	20260124103854	t	2026-01-28 21:16:46.297184
25	20260124104552	t	2026-01-28 21:16:46.300079
26	20260124104646	t	2026-01-28 21:16:46.311082
27	20260124104741	t	2026-01-28 21:16:46.313412
28	20260124105137	t	2026-01-28 21:16:46.314667
29	20260124105231	t	2026-01-28 21:16:46.315394
30	20260124105341	t	2026-01-28 21:16:46.316049
31	20260124114507	t	2026-01-28 21:16:46.316818
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_session (session_id, user_id, refresh_token_hash, fingerprint, created_at, expires_at, revoked_at) FROM stdin;
01c0690d-1468-46d0-88aa-c91253660784	9d76c676-b986-403b-bb4a-830e8977de57	93ef31995bb5c2880104efb991c4b8fc26cf41bcb4f5b5c7f87ecf7fdefe17f8	8432defd-29b2-4056-8a68-aa1ee7f42586	2026-01-28 21:22:03.669295	2026-01-29 21:22:03.668843	2026-01-29 06:45:10.420728
99212921-8b23-4c6e-8cdb-3378b5022cea	9d76c676-b986-403b-bb4a-830e8977de57	f1feec1f2d09d3ff088375a9847c642fe58a075a4f4fe58186f18af7e0730cef	e67850cc-1e95-4840-9f6e-61e7ab073087	2026-01-28 21:26:39.864911	2026-01-29 21:26:39.864724	2026-01-29 06:45:10.420728
36039bee-f620-4096-ad44-7bce79173eec	9d76c676-b986-403b-bb4a-830e8977de57	65bddd2b235a0e700ef830d0933179ec4fa60cb2ab1bfbd2a5c60333b500c358	8e743d30-9a78-4dbf-a28d-9ea508b8f002	2026-01-29 06:44:49.82982	2026-01-30 06:44:49.829398	2026-01-29 06:46:29.071396
\.


--
-- Data for Name: verification; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.verification (verification_id, user_id, email, hash_code, event_type, expires_at, created_at, used_at) FROM stdin;
3f9ee18d-1d61-47da-af03-e94c8bd689c2	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	a2e39d8aadb75b21e2f45545f56c33ff0661cee5b4817416a619ddb2df0db736	reset_password	2026-01-28 21:35:41.950177	2026-01-28 21:20:41.951919	\N
e0a9cb7e-42c3-4759-8325-5ee6afbb1b4d	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	316b2b68895f3ec466000188d2c24cee199a637e8bef620791705415778b324b	reset_password	2026-01-28 21:36:08.355631	2026-01-28 21:21:08.355719	2026-01-28 21:21:56.421881
595914e3-346a-45ac-81db-63fa2e3ba2f4	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	84768c0338fdd76216ce47d5b9257b89ac4375dc40449ce60a853ce5126c2022	reset_password	2026-01-28 21:40:38.81423	2026-01-28 21:25:38.814316	2026-01-28 21:26:34.149427
78bec132-9760-4d33-aaae-f5176805fd0e	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	6ecb12ead7505b3f34cd54b91cdc35039302b700aae225efec4cbac874028eeb	verify_email	2026-01-28 21:41:45.777573	2026-01-28 21:26:45.777646	\N
ea145744-40a0-410c-aff4-646086ed9552	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	3f52dc98ed356afb669a1dc96ac6bcb75190f0256f839581db441c37bafd4266	verify_email	2026-01-28 21:41:45.784827	2026-01-28 21:26:45.784986	2026-01-28 21:26:59.16489
bf161e3a-d99c-46fd-adb6-272ee8cf1ba1	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	736c579678cd611551c0d579a4939ddf69c31e5fc1f75413d9821c09ed7637a4	reset_password	2026-01-29 06:59:00.342273	2026-01-29 06:44:00.343944	2026-01-29 06:44:23.103012
1c3987f1-e823-4dd2-8326-efd3a34e6b2a	9d76c676-b986-403b-bb4a-830e8977de57	dayzwaitik123@yandex.ru	2f2c5faccc32bb840d87963b2bc4e2b30c506d857e8c023144059ca244cdd130	reset_password	2026-01-29 06:59:55.425537	2026-01-29 06:44:55.425825	2026-01-29 06:45:10.355497
\.


--
-- Name: goose_db_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.goose_db_version_id_seq', 31, true);


--
-- Name: goose_db_version goose_db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.goose_db_version
    ADD CONSTRAINT goose_db_version_pkey PRIMARY KEY (id);


--
-- Name: user_session user_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT user_session_pkey PRIMARY KEY (session_id);


--
-- Name: verification verification_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.verification
    ADD CONSTRAINT verification_pkey PRIMARY KEY (verification_id);


--
-- PostgreSQL database dump complete
--

\unrestrict wTjarFIzU1Iti9b4ehTNVxDkHF9AxcUyHQcDipXwWuEiyQfB3MxWKSdN6MR8lAR

