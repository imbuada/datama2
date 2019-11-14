--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-14 14:35:20

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
-- TOC entry 205 (class 1259 OID 16441)
-- Name: buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buildings (
    id integer NOT NULL,
    bldg_name text,
    bldg_add text,
    blg_zip text,
    cust_fname text,
    cust_lname text
);


ALTER TABLE public.buildings OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16439)
-- Name: buildings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buildings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.buildings_id_seq OWNER TO postgres;

--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 204
-- Name: buildings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buildings_id_seq OWNED BY public.buildings.id;


--
-- TOC entry 203 (class 1259 OID 16432)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    cust_fname text,
    cust_mi text,
    cust_lname text,
    cust_cont text,
    cust_add text,
    cust_eadd text,
    cust_job text
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16448)
-- Name: cust_bldg; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.cust_bldg AS
 SELECT customers.id,
    customers.cust_fname,
    customers.cust_lname,
    buildings.bldg_name,
    buildings.blg_zip
   FROM (public.customers
     JOIN public.buildings USING (cust_lname));


ALTER TABLE public.cust_bldg OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16430)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 202
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 2700 (class 2604 OID 16444)
-- Name: buildings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buildings ALTER COLUMN id SET DEFAULT nextval('public.buildings_id_seq'::regclass);


--
-- TOC entry 2699 (class 2604 OID 16435)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 16441)
-- Dependencies: 205
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buildings (id, bldg_name, bldg_add, blg_zip, cust_fname, cust_lname) FROM stdin;
1	net lima	taguig	1630	angelika	pineda
2	APC	makati	1232	irwin	buada
3	uptown	taguig	1630	angelika	pineda
4	uptown	taguig	1226	felix	pedro
\.


--
-- TOC entry 2829 (class 0 OID 16432)
-- Dependencies: 203
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, cust_fname, cust_mi, cust_lname, cust_cont, cust_add, cust_eadd, cust_job) FROM stdin;
1	irwin	m	buada	091660188387	pasay	imbuada	student
2	angelika	l	pineda	09123456789	san pedro	alpineda	manager
3	felix	l	pedro	09164544783	paranaque	flpedro	instructor
4	emily	v	teodoro	0922596969	makati	evteodoro	miipai
\.


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 204
-- Name: buildings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buildings_id_seq', 1, false);


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 202
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


-- Completed on 2019-11-14 14:35:20

--
-- PostgreSQL database dump complete
--

