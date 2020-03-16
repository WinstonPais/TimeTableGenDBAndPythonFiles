--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: class_time_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_time_table (
    ctt_id smallint NOT NULL,
    staff_id character varying,
    sub_id character varying,
    day character varying,
    period smallint,
    class_id character varying
);


ALTER TABLE public.class_time_table OWNER TO postgres;

--
-- Name: class_time_table_ctt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_time_table_ctt_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.class_time_table_ctt_id_seq OWNER TO postgres;

--
-- Name: class_time_table_ctt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_time_table_ctt_id_seq OWNED BY public.class_time_table.ctt_id;


--
-- Name: staff_time_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff_time_table (
    stt_id smallint NOT NULL,
    staff_id character varying,
    sub_id character varying,
    day character varying,
    period smallint,
    class_id character varying
);


ALTER TABLE public.staff_time_table OWNER TO postgres;

--
-- Name: staff_time_table_stt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_time_table_stt_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_time_table_stt_id_seq OWNER TO postgres;

--
-- Name: staff_time_table_stt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_time_table_stt_id_seq OWNED BY public.staff_time_table.stt_id;


--
-- Name: staffdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staffdetails (
    staff_id character varying NOT NULL,
    s_name character varying
);


ALTER TABLE public.staffdetails OWNER TO postgres;

--
-- Name: staffdetails_ctt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staffdetails_ctt (
    staff_id character varying NOT NULL,
    ctt_id smallint NOT NULL
);


ALTER TABLE public.staffdetails_ctt OWNER TO postgres;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    sub_id character varying NOT NULL,
    sub_name character varying,
    semester numeric
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: subjects_ctt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects_ctt (
    sub_id character varying NOT NULL,
    ctt_id smallint NOT NULL
);


ALTER TABLE public.subjects_ctt OWNER TO postgres;

--
-- Name: subjects_stt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects_stt (
    sub_id character varying NOT NULL,
    stt_id smallint NOT NULL
);


ALTER TABLE public.subjects_stt OWNER TO postgres;

--
-- Name: class_time_table ctt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_time_table ALTER COLUMN ctt_id SET DEFAULT nextval('public.class_time_table_ctt_id_seq'::regclass);


--
-- Name: staff_time_table stt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_time_table ALTER COLUMN stt_id SET DEFAULT nextval('public.staff_time_table_stt_id_seq'::regclass);


--
-- Data for Name: class_time_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_time_table (ctt_id, staff_id, sub_id, day, period, class_id) FROM stdin;
\.


--
-- Data for Name: staff_time_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff_time_table (stt_id, staff_id, sub_id, day, period, class_id) FROM stdin;
\.


--
-- Data for Name: staffdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staffdetails (staff_id, s_name) FROM stdin;
ECH	Ms Evita Coelho
BBT	Ms Babitha
SMA	Ms Sowmya
AMM	Ms Anusha M M
GMN	Ms Gayana M N
GHF	Mr Gerald H Fernandes
RCP	Dr Rachana P
EJS	Ms Eden J Sequeira
KKM	Dr Kavitha Mahesh
SPS	Ms Supriya Salian
TYN	Mr Tyson B D’Cunha
SVG	Ms Smitha V George
ARR	Ms Archana Rao
CHT	Ms Chaithra
DVS	Ms Divya S
LJD	Ms Lavina J D’Silva
MMT	Ms Mamatha
NJR	Ms Nisha J Roche
PMD	Ms Pramila R Madhava
RDS	Dr Rio D’Souza
RNT	Ms Renuka Tantry
SDS	Dr Sridevi Saralaya
SGP	Ms Sunitha Guruprasad
SNA	Mr Shreenath Acharya
SPR	Ms Supreetha R
SPT	Ms Spurthy M Pais
UDV	Dr Usha Divakarla
VJU	Ms Vijetha U
\.


--
-- Data for Name: staffdetails_ctt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staffdetails_ctt (staff_id, ctt_id) FROM stdin;
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (sub_id, sub_name, semester) FROM stdin;
MAT-III	Transform Calculus, Fourier Series And Numerical Techniques	3
DS	Data Structures and Application	3
ADE	Analog and Digital Electronics	3
CO	Computer Organization	3
SE	Software Engineering	3
DMS	Discrete Mathematical Structures	3
ADE LAB	Analog And Digital Electronics Laboratory	3
DS LAB	Data Structures Laboratory	3
KAN	Kannada	3
IOT LAB	Internet Of Things Laboratory	3
V-ACT	V-ACT Soft Skills Program	3
CPS	C Programming for Problem Solving	1
\.


--
-- Data for Name: subjects_ctt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects_ctt (sub_id, ctt_id) FROM stdin;
\.


--
-- Data for Name: subjects_stt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects_stt (sub_id, stt_id) FROM stdin;
\.


--
-- Name: class_time_table_ctt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_time_table_ctt_id_seq', 1, false);


--
-- Name: staff_time_table_stt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_time_table_stt_id_seq', 1, false);


--
-- Name: class_time_table class_time_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_time_table
    ADD CONSTRAINT class_time_table_pkey PRIMARY KEY (ctt_id);


--
-- Name: staff_time_table staff_time_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_time_table
    ADD CONSTRAINT staff_time_table_pkey PRIMARY KEY (stt_id);


--
-- Name: staffdetails_ctt staffdetails_ctt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffdetails_ctt
    ADD CONSTRAINT staffdetails_ctt_pkey PRIMARY KEY (staff_id, ctt_id);


--
-- Name: staffdetails staffdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffdetails
    ADD CONSTRAINT staffdetails_pkey PRIMARY KEY (staff_id);


--
-- Name: subjects_ctt subjects_ctt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_ctt
    ADD CONSTRAINT subjects_ctt_pkey PRIMARY KEY (sub_id, ctt_id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (sub_id);


--
-- Name: subjects_stt subjects_stt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_stt
    ADD CONSTRAINT subjects_stt_pkey PRIMARY KEY (sub_id, stt_id);


--
-- Name: fki_staff_id_ctt_to_staffdetails_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_staff_id_ctt_to_staffdetails_fkey ON public.class_time_table USING btree (staff_id);


--
-- Name: fki_sub_id_ctt_to_subjects_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sub_id_ctt_to_subjects_fkey ON public.class_time_table USING btree (sub_id);


--
-- Name: staffdetails_ctt ctt_id_staffdetails_ctt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffdetails_ctt
    ADD CONSTRAINT ctt_id_staffdetails_ctt_fkey FOREIGN KEY (ctt_id) REFERENCES public.class_time_table(ctt_id);


--
-- Name: subjects_ctt ctt_id_subjects_ctt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_ctt
    ADD CONSTRAINT ctt_id_subjects_ctt_fkey FOREIGN KEY (ctt_id) REFERENCES public.class_time_table(ctt_id);


--
-- Name: class_time_table staff_id_ctt_to_staffdetails_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_time_table
    ADD CONSTRAINT staff_id_ctt_to_staffdetails_fkey FOREIGN KEY (staff_id) REFERENCES public.staffdetails(staff_id);


--
-- Name: staffdetails_ctt staff_id_staffdetails_ctt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffdetails_ctt
    ADD CONSTRAINT staff_id_staffdetails_ctt_fkey FOREIGN KEY (staff_id) REFERENCES public.staffdetails(staff_id);


--
-- Name: staff_time_table staff_id_stt_to_staffdetails_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_time_table
    ADD CONSTRAINT staff_id_stt_to_staffdetails_fkey FOREIGN KEY (staff_id) REFERENCES public.staffdetails(staff_id);


--
-- Name: subjects_stt stt_id_subjects_stt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_stt
    ADD CONSTRAINT stt_id_subjects_stt_fkey FOREIGN KEY (stt_id) REFERENCES public.staff_time_table(stt_id);


--
-- Name: class_time_table sub_id_ctt_to_subjects_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_time_table
    ADD CONSTRAINT sub_id_ctt_to_subjects_fkey FOREIGN KEY (sub_id) REFERENCES public.subjects(sub_id);


--
-- Name: staff_time_table sub_id_ctt_to_subjects_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff_time_table
    ADD CONSTRAINT sub_id_ctt_to_subjects_fkey FOREIGN KEY (sub_id) REFERENCES public.subjects(sub_id);


--
-- Name: subjects_ctt sub_id_subjects_ctt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_ctt
    ADD CONSTRAINT sub_id_subjects_ctt_fkey FOREIGN KEY (sub_id) REFERENCES public.subjects(sub_id);


--
-- Name: subjects_stt sub_id_subjects_stt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects_stt
    ADD CONSTRAINT sub_id_subjects_stt_fkey FOREIGN KEY (sub_id) REFERENCES public.subjects(sub_id);


--
-- PostgreSQL database dump complete
--

