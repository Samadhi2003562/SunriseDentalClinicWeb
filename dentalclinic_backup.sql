--
-- PostgreSQL database dump
--

\restrict SSmIi2kjM7gOeFF6jv3z4Fj9IiszZwhDPK3LZ1Nwv0O0bnl29sBgbrIZe5bXe6J

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-09-05 12:35:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 17680)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    appointment_number character varying(20) NOT NULL,
    patient_id integer NOT NULL,
    dentist_name character varying(100),
    treatment_type character varying(50),
    appointment_date date,
    appointment_time time without time zone,
    status character varying(20) DEFAULT 'SCHEDULED'::character varying
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17679)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 223
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 226 (class 1259 OID 17698)
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bills (
    id integer NOT NULL,
    appointment_number character varying(20),
    treatment_cost numeric(10,2),
    consultation_fee numeric(10,2) DEFAULT 50.00,
    total_cost numeric(10,2),
    bill_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17697)
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bills_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bills_id_seq OWNER TO postgres;

--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 225
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_id_seq OWNED BY public.bills.id;


--
-- TOC entry 222 (class 1259 OID 17671)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(200),
    contact character varying(15)
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17670)
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patients_id_seq OWNER TO postgres;

--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 221
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- TOC entry 220 (class 1259 OID 17658)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    role character varying(20) DEFAULT 'STAFF'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17657)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4874 (class 2604 OID 17683)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 4876 (class 2604 OID 17701)
-- Name: bills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN id SET DEFAULT nextval('public.bills_id_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 17674)
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 17661)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5045 (class 0 OID 17680)
-- Dependencies: 224
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, appointment_number, patient_id, dentist_name, treatment_type, appointment_date, appointment_time, status) FROM stdin;
1	APT001	1	Dr. Perera	Cleaning	2026-09-03	09:00:00	SCHEDULED
2	APT002	2	Dr. Silva	Filling	2026-09-03	10:00:00	SCHEDULED
3	APT003	3	Dr. Perera	Root Canal	2026-09-03	11:00:00	SCHEDULED
4	APT004	4	Dr. Silva	Extraction	2026-09-03	13:00:00	SCHEDULED
5	APT-AE79887C	6	Dr. Smith	Filling	2026-09-04	19:42:00	SCHEDULED
6	APT-D87CC296	7	dr.perera	Cleaning	2026-09-04	20:50:00	SCHEDULED
7	APT-D729AD9A	8	Dr. 	Root Canal	2026-09-04	12:50:00	SCHEDULED
8	APT-B06EF8CC	9	Dr. Smith	Cleaning	2026-09-04	19:45:00	SCHEDULED
9	APT-393F9658	10	Dr. Smith	Crown	2026-09-05	13:20:00	SCHEDULED
10	APT-2A94206E	11	Dr. Smith	Extraction	2026-09-05	09:30:00	SCHEDULED
11	APT-C8B6B3EB	12	Dr. Smith	Filling	2026-09-05	18:15:00	SCHEDULED
12	APT-3F5944C6	13	Dr. Smith	Cleaning	2026-09-05	04:00:00	SCHEDULED
13	APT-70F6B59D	14	Dr. Smith	Cleaning	2026-09-05	10:46:00	SCHEDULED
14	APT-A0742352	15	Dr. Smith	Root Canal	2026-09-05	18:15:00	SCHEDULED
15	APT-59E98616	16	Dr. Smith	Cleaning	2026-09-05	10:20:00	SCHEDULED
\.


--
-- TOC entry 5047 (class 0 OID 17698)
-- Dependencies: 226
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bills (id, appointment_number, treatment_cost, consultation_fee, total_cost, bill_date) FROM stdin;
1	APT001	1500.00	50.00	1550.00	2026-09-03
2	APT002	3000.00	50.00	3050.00	2026-09-03
\.


--
-- TOC entry 5043 (class 0 OID 17671)
-- Dependencies: 222
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id, name, address, contact) FROM stdin;
1	Smith	123 Main St	0712345678
2	John Silva	45 Temple Road	0771234567
3	Nimal Perera	78 Main Street	0719876543
4	Kamal Fernando	12 Lake Road	0764567890
5	Amal Jayasinghe	90 Station Road	0751234567
6	smith	123 Main St	0712345678
7	mala	negombo	0776993265
8	santha silva	nugegoda	0776993265
9	santha silva	nugegoda	0776993265
10	Teena silva	kollupitiya	0778954364
11	Teena silva	kollupitiya	0778954364
12	Teena silva	kollupitiya	0778954364
13	Teena silva	kollupitiya	0778954364
14	Sarath Perera	kollupitiya	0776993265
15	Sarath Perera	kollupitiya	0776993265
16	Sarath Perera	kollupitiya	0776993265
\.


--
-- TOC entry 5041 (class 0 OID 17658)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role) FROM stdin;
1	admin	admin123	ADMIN
2	staff	staff123	STAFF
\.


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 223
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 15, true);


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 225
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_id_seq', 2, true);


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 221
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_id_seq', 16, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4886 (class 2606 OID 17691)
-- Name: appointments appointments_appointment_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_appointment_number_key UNIQUE (appointment_number);


--
-- TOC entry 4888 (class 2606 OID 17689)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 17706)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 17678)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 17667)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 17669)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4891 (class 2606 OID 17692)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;


--
-- TOC entry 4892 (class 2606 OID 17707)
-- Name: bills bills_appointment_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_appointment_number_fkey FOREIGN KEY (appointment_number) REFERENCES public.appointments(appointment_number) ON DELETE CASCADE;


-- Completed on 2026-09-05 12:35:25

--
-- PostgreSQL database dump complete
--

\unrestrict SSmIi2kjM7gOeFF6jv3z4Fj9IiszZwhDPK3LZ1Nwv0O0bnl29sBgbrIZe5bXe6J

