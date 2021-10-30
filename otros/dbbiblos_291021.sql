--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

-- Started on 2021-10-29 18:46:39 CDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2832 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 43934)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    categoria character varying(150) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 43932)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 2833 (class 0 OID 0)
-- Dependencies: 208
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 232 (class 1259 OID 44161)
-- Name: codigopaises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.codigopaises (
    id bigint NOT NULL,
    codigo character varying(10) DEFAULT ''::character varying,
    lenguaje character varying(150),
    tipo character(255) DEFAULT 'L'::bpchar,
    empresa_id smallint DEFAULT '1'::smallint,
    status_lenguaje smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    migration_id integer DEFAULT 0,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.codigopaises OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 44159)
-- Name: codigopaises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.codigopaises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.codigopaises_id_seq OWNER TO postgres;

--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 231
-- Name: codigopaises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.codigopaises_id_seq OWNED BY public.codigopaises.id;


--
-- TOC entry 244 (class 1259 OID 44396)
-- Name: editoriale_libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editoriale_libro (
    id bigint NOT NULL,
    editoriale_id integer DEFAULT 0,
    libro_id integer DEFAULT 0,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.editoriale_libro OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 44394)
-- Name: editoriale_libro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editoriale_libro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.editoriale_libro_id_seq OWNER TO postgres;

--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 243
-- Name: editoriale_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriale_libro_id_seq OWNED BY public.editoriale_libro.id;


--
-- TOC entry 234 (class 1259 OID 44188)
-- Name: editoriales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editoriales (
    id bigint NOT NULL,
    editorial character varying(100) DEFAULT ''::character varying NOT NULL,
    representante character varying(150) DEFAULT ''::character varying,
    telefonos character varying(100) DEFAULT ''::character varying,
    email character varying(150) DEFAULT ''::character varying,
    predeterminado boolean DEFAULT false NOT NULL,
    status_editorial smallint DEFAULT '1'::smallint,
    empresa_id smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    searchtext tsvector
);


ALTER TABLE public.editoriales OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 44186)
-- Name: editoriales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.editoriales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.editoriales_id_seq OWNER TO postgres;

--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 233
-- Name: editoriales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriales_id_seq OWNED BY public.editoriales.id;


--
-- TOC entry 199 (class 1259 OID 40736)
-- Name: empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresas (
    id bigint NOT NULL,
    razon_social character varying(250) DEFAULT ''::character varying,
    domicilio_fiscal character varying(250) DEFAULT ''::character varying,
    rfc character varying(15) DEFAULT ''::character varying,
    ip character varying(150) DEFAULT ''::character varying,
    host character varying(150) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.empresas OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 40734)
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresas_id_seq OWNER TO postgres;

--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 198
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresas_id_seq OWNED BY public.empresas.id;


--
-- TOC entry 216 (class 1259 OID 44006)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 44004)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 215
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 248 (class 1259 OID 44440)
-- Name: historiallibros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historiallibros (
    id bigint NOT NULL,
    libro_id integer DEFAULT 0,
    inventariolibro_id integer DEFAULT 0,
    user_id integer DEFAULT 0,
    fecha timestamp(0) without time zone,
    tipo_movto character varying(25) DEFAULT 'INICIO'::character varying NOT NULL,
    observaciones character varying(500) DEFAULT ''::character varying,
    empresa_id smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.historiallibros OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 44438)
-- Name: historiallibros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historiallibros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.historiallibros_id_seq OWNER TO postgres;

--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 247
-- Name: historiallibros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historiallibros_id_seq OWNED BY public.historiallibros.id;


--
-- TOC entry 213 (class 1259 OID 43973)
-- Name: imagen_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagen_user (
    id integer NOT NULL,
    imagen_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.imagen_user OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 43971)
-- Name: imagen_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagen_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagen_user_id_seq OWNER TO postgres;

--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 212
-- Name: imagen_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagen_user_id_seq OWNED BY public.imagen_user.id;


--
-- TOC entry 211 (class 1259 OID 43943)
-- Name: imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagenes (
    id bigint NOT NULL,
    root character varying(250),
    filename character varying(250),
    filename_png character varying(250),
    filename_thumb character varying(250) DEFAULT ''::character varying,
    pie_de_foto character varying(250) DEFAULT ''::character varying,
    user_id integer DEFAULT 0,
    creado_por_id integer DEFAULT 0,
    status_imagen smallint DEFAULT '1'::smallint,
    ip character varying(150) DEFAULT ''::character varying,
    host character varying(150) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.imagenes OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 43941)
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagenes_id_seq OWNER TO postgres;

--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 210
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenes_id_seq OWNED BY public.imagenes.id;


--
-- TOC entry 246 (class 1259 OID 44418)
-- Name: inventariolibro_portada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventariolibro_portada (
    id bigint NOT NULL,
    inventariolibro_id integer DEFAULT 0,
    portada_id integer DEFAULT 0,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.inventariolibro_portada OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 44416)
-- Name: inventariolibro_portada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventariolibro_portada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventariolibro_portada_id_seq OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 245
-- Name: inventariolibro_portada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventariolibro_portada_id_seq OWNED BY public.inventariolibro_portada.id;


--
-- TOC entry 240 (class 1259 OID 44296)
-- Name: inventariolibros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventariolibros (
    id bigint NOT NULL,
    libro_id integer DEFAULT 0,
    isbn character varying(50) DEFAULT ''::character varying,
    clasificacion character varying(30) DEFAULT ''::character varying,
    edicion character varying(30) DEFAULT ''::character varying,
    codebar character varying(30) DEFAULT ''::character varying,
    prestado_user_id integer DEFAULT 0,
    fecha_prestamo timestamp(0) without time zone,
    fecha_entrega timestamp(0) without time zone,
    apartado_user_id integer DEFAULT 0,
    fecha_apartado timestamp(0) without time zone,
    editorial_id integer DEFAULT 0,
    uuid uuid NOT NULL,
    observaciones character varying(500) DEFAULT ''::character varying,
    empresa_id smallint DEFAULT '1'::smallint,
    status_libro smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    etiqueta_smarth character varying(1000) DEFAULT ''::character varying,
    no_coleccion character varying(250) DEFAULT ''::character varying,
    searchtext tsvector
);


ALTER TABLE public.inventariolibros OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 44294)
-- Name: inventariolibros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventariolibros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventariolibros_id_seq OWNER TO postgres;

--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 239
-- Name: inventariolibros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventariolibros_id_seq OWNED BY public.inventariolibros.id;


--
-- TOC entry 250 (class 1259 OID 58483)
-- Name: libro_portada; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_portada (
    id bigint NOT NULL,
    libro_id integer DEFAULT 0,
    portada_id integer DEFAULT 0,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.libro_portada OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 58481)
-- Name: libro_portada_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_portada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libro_portada_id_seq OWNER TO postgres;

--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 249
-- Name: libro_portada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_portada_id_seq OWNED BY public.libro_portada.id;


--
-- TOC entry 238 (class 1259 OID 44245)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id bigint NOT NULL,
    ficha_no character varying(25) DEFAULT ''::character varying,
    titulo character varying(250) DEFAULT ''::character varying,
    autor character varying(250) DEFAULT ''::character varying,
    datos_fijos character varying(250) DEFAULT ''::character varying,
    codebar character varying(30) DEFAULT ''::character varying,
    observaciones character varying(1000) DEFAULT ''::character varying,
    tipo_material_id smallint DEFAULT '1'::smallint,
    status_libro smallint DEFAULT '1'::smallint,
    empresa_id smallint DEFAULT '1'::smallint,
    editorial_id integer DEFAULT 1,
    creado_por_id integer DEFAULT 1,
    ip character varying(150) DEFAULT ''::character varying,
    host character varying(150) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    searchtext tsvector
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 44243)
-- Name: libros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_id_seq OWNER TO postgres;

--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 237
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_seq OWNED BY public.libros.id;


--
-- TOC entry 197 (class 1259 OID 40728)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 40726)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 221 (class 1259 OID 44051)
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 44063)
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 43997)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 44131)
-- Name: permission_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_role (
    id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permission_role OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 44129)
-- Name: permission_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_role_id_seq OWNER TO postgres;

--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 228
-- Name: permission_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_role_id_seq OWNED BY public.permission_role.id;


--
-- TOC entry 227 (class 1259 OID 44111)
-- Name: permission_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permission_user OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 44109)
-- Name: permission_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_user_id_seq OWNER TO postgres;

--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 226
-- Name: permission_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_user_id_seq OWNED BY public.permission_user.id;


--
-- TOC entry 218 (class 1259 OID 44020)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    descripcion character varying(100),
    color character varying(25) DEFAULT '#7986cb'::character varying,
    guard_name character varying(255) DEFAULT 'web'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 44018)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 217
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 242 (class 1259 OID 44349)
-- Name: portadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portadas (
    id bigint NOT NULL,
    root character varying(250) DEFAULT ''::character varying,
    filename character varying(250) DEFAULT '1'::character varying,
    filename_png character varying(250) DEFAULT '1'::character varying,
    filename_thumb character varying(250) DEFAULT ''::character varying,
    pie_de_foto character varying(250) DEFAULT ''::character varying,
    status_portada smallint DEFAULT '1'::smallint,
    empresa_id smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    ip character varying(150) DEFAULT ''::character varying,
    host character varying(150) DEFAULT ''::character varying,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.portadas OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 44347)
-- Name: portadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.portadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portadas_id_seq OWNER TO postgres;

--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 241
-- Name: portadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.portadas_id_seq OWNED BY public.portadas.id;


--
-- TOC entry 223 (class 1259 OID 44074)
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 44091)
-- Name: role_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.role_user OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 44089)
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_id_seq OWNER TO postgres;

--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 224
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_user_id_seq OWNED BY public.role_user.id;


--
-- TOC entry 220 (class 1259 OID 44035)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    descripcion character varying(100),
    color character varying(25) DEFAULT '#ffab91'::character varying,
    abreviatura character varying(25) DEFAULT 'none'::character varying,
    guard_name character varying(255) DEFAULT 'web'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 44033)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 230 (class 1259 OID 44149)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 44222)
-- Name: tipomaterial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipomaterial (
    id bigint NOT NULL,
    tipo_material character varying(100) DEFAULT ''::character varying,
    empresa_id smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    searchtext tsvector
);


ALTER TABLE public.tipomaterial OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 44220)
-- Name: tipomaterial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipomaterial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipomaterial_id_seq OWNER TO postgres;

--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipomaterial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipomaterial_id_seq OWNED BY public.tipomaterial.id;


--
-- TOC entry 203 (class 1259 OID 43873)
-- Name: user_adress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_adress (
    id integer NOT NULL,
    calle character varying(250) DEFAULT ''::character varying,
    num_ext character varying(100) DEFAULT ''::character varying,
    num_int character varying(100) DEFAULT ''::character varying,
    colonia character varying(150) DEFAULT ''::character varying,
    localidad character varying(150) DEFAULT ''::character varying,
    municipio character varying(100) DEFAULT ''::character varying,
    estado character varying(100) DEFAULT 'TABASCO'::character varying,
    pais character varying(25) DEFAULT 'MÉXICO'::character varying,
    cp character varying(10) DEFAULT ''::character varying,
    user_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_adress OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 43871)
-- Name: user_adress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_adress_id_seq OWNER TO postgres;

--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_adress_id_seq OWNED BY public.user_adress.id;


--
-- TOC entry 205 (class 1259 OID 43898)
-- Name: user_extend; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_extend (
    id integer NOT NULL,
    ocupacion character varying(250) DEFAULT ''::character varying,
    profesion character varying(250) DEFAULT ''::character varying,
    lugar_trabajo character varying(250) DEFAULT ''::character varying,
    lugar_nacimiento character varying(250) DEFAULT ''::character varying,
    user_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_extend OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 43896)
-- Name: user_extend_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_extend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_extend_id_seq OWNER TO postgres;

--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_extend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_extend_id_seq OWNED BY public.user_extend.id;


--
-- TOC entry 207 (class 1259 OID 43918)
-- Name: user_social; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_social (
    id integer NOT NULL,
    red_social character varying(100) DEFAULT ''::character varying,
    username_red_social character varying(100) DEFAULT ''::character varying,
    alias_red_social character varying(100) DEFAULT ''::character varying,
    user_id integer NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_social OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 43916)
-- Name: user_social_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_social_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_social_id_seq OWNER TO postgres;

--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_social_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_social_id_seq OWNED BY public.user_social.id;


--
-- TOC entry 201 (class 1259 OID 43830)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    email character varying(250) DEFAULT ''::character varying,
    password character varying(64) NOT NULL,
    nombre character varying(50),
    ap_paterno character varying(50),
    ap_materno character varying(50),
    curp character varying(18) DEFAULT ''::character varying,
    emails character varying(500) DEFAULT ''::character varying,
    celulares character varying(250) DEFAULT ''::character varying,
    telefonos character varying(250) DEFAULT ''::character varying,
    fecha_nacimiento date,
    genero smallint DEFAULT '0'::smallint,
    root character varying(150) DEFAULT ''::character varying,
    filename character varying(50),
    filename_png character varying(50),
    filename_thumb character varying(50),
    admin boolean DEFAULT false NOT NULL,
    session_id character varying(255),
    status_user smallint DEFAULT '1'::smallint,
    empresa_id smallint DEFAULT '1'::smallint,
    creado_por_id integer DEFAULT 1,
    user_id_anterior integer DEFAULT 0 NOT NULL,
    ip character varying(150) DEFAULT ''::character varying,
    host character varying(150) DEFAULT ''::character varying,
    logged boolean DEFAULT false NOT NULL,
    logged_at timestamp(0) without time zone,
    logout_at timestamp(0) without time zone,
    email_verified_at timestamp(0) without time zone,
    id_sistema_anterior integer DEFAULT 0,
    deleted_at timestamp(0) without time zone,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    searchtext tsvector
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 43828)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2361 (class 2604 OID 43937)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 2386 (class 2604 OID 44164)
-- Name: codigopaises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises ALTER COLUMN id SET DEFAULT nextval('public.codigopaises_id_seq'::regclass);


--
-- TOC entry 2446 (class 2604 OID 44399)
-- Name: editoriale_libro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro ALTER COLUMN id SET DEFAULT nextval('public.editoriale_libro_id_seq'::regclass);


--
-- TOC entry 2393 (class 2604 OID 44191)
-- Name: editoriales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales ALTER COLUMN id SET DEFAULT nextval('public.editoriales_id_seq'::regclass);


--
-- TOC entry 2319 (class 2604 OID 40739)
-- Name: empresas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas ALTER COLUMN id SET DEFAULT nextval('public.empresas_id_seq'::regclass);


--
-- TOC entry 2374 (class 2604 OID 44009)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2452 (class 2604 OID 44443)
-- Name: historiallibros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros ALTER COLUMN id SET DEFAULT nextval('public.historiallibros_id_seq'::regclass);


--
-- TOC entry 2371 (class 2604 OID 43976)
-- Name: imagen_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user ALTER COLUMN id SET DEFAULT nextval('public.imagen_user_id_seq'::regclass);


--
-- TOC entry 2363 (class 2604 OID 43946)
-- Name: imagenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes ALTER COLUMN id SET DEFAULT nextval('public.imagenes_id_seq'::regclass);


--
-- TOC entry 2449 (class 2604 OID 44421)
-- Name: inventariolibro_portada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada ALTER COLUMN id SET DEFAULT nextval('public.inventariolibro_portada_id_seq'::regclass);


--
-- TOC entry 2420 (class 2604 OID 44299)
-- Name: inventariolibros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros ALTER COLUMN id SET DEFAULT nextval('public.inventariolibros_id_seq'::regclass);


--
-- TOC entry 2460 (class 2604 OID 58486)
-- Name: libro_portada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada ALTER COLUMN id SET DEFAULT nextval('public.libro_portada_id_seq'::regclass);


--
-- TOC entry 2406 (class 2604 OID 44248)
-- Name: libros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id SET DEFAULT nextval('public.libros_id_seq'::regclass);


--
-- TOC entry 2318 (class 2604 OID 40731)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2385 (class 2604 OID 44134)
-- Name: permission_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role ALTER COLUMN id SET DEFAULT nextval('public.permission_role_id_seq'::regclass);


--
-- TOC entry 2384 (class 2604 OID 44114)
-- Name: permission_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user ALTER COLUMN id SET DEFAULT nextval('public.permission_user_id_seq'::regclass);


--
-- TOC entry 2376 (class 2604 OID 44023)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 2435 (class 2604 OID 44352)
-- Name: portadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas ALTER COLUMN id SET DEFAULT nextval('public.portadas_id_seq'::regclass);


--
-- TOC entry 2383 (class 2604 OID 44094)
-- Name: role_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user ALTER COLUMN id SET DEFAULT nextval('public.role_user_id_seq'::regclass);


--
-- TOC entry 2379 (class 2604 OID 44038)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 2402 (class 2604 OID 44225)
-- Name: tipomaterial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial ALTER COLUMN id SET DEFAULT nextval('public.tipomaterial_id_seq'::regclass);


--
-- TOC entry 2342 (class 2604 OID 43876)
-- Name: user_adress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress ALTER COLUMN id SET DEFAULT nextval('public.user_adress_id_seq'::regclass);


--
-- TOC entry 2352 (class 2604 OID 43901)
-- Name: user_extend id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend ALTER COLUMN id SET DEFAULT nextval('public.user_extend_id_seq'::regclass);


--
-- TOC entry 2357 (class 2604 OID 43921)
-- Name: user_social id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social ALTER COLUMN id SET DEFAULT nextval('public.user_social_id_seq'::regclass);


--
-- TOC entry 2325 (class 2604 OID 43833)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2783 (class 0 OID 43934)
-- Dependencies: 209
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, categoria, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 44161)
-- Dependencies: 232
-- Data for Name: codigopaises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.codigopaises (id, codigo, lenguaje, tipo, empresa_id, status_lenguaje, creado_por_id, migration_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 44396)
-- Dependencies: 244
-- Data for Name: editoriale_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriale_libro (id, editoriale_id, libro_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 44188)
-- Dependencies: 234
-- Data for Name: editoriales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriales (id, editorial, representante, telefonos, email, predeterminado, status_editorial, empresa_id, creado_por_id, deleted_at, created_at, updated_at, searchtext) FROM stdin;
1	ACANTILADO				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'acantil':1
2	AGUILAR				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'aguil':1
3	AKAL				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'akal':1
4	ALBA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'alba':1
5	ALFAGUARA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'alfagu':1
7	ALMADíA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'almad':1
8	ANAGRAMA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'anagram':1
9	ALPHA DECAY				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'alpha':1 'decay':2
11	ATALANTA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'atalant':1
12	CAJA NEGRA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'caj':1 'negr':2
13	CáTEDRA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'catedr':1
14	CRíTICA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'critic':1
15	DEBOLSILLO				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'debolsill':1
16	FONDO DE CULTURA ECONóMICA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'cultur':3 'econom':4 'fond':1
17	GALAXIA GUTENBERG				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'galaxi':1 'gutenberg':2
18	GALLO NERO				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'gall':1 'ner':2
19	GREDOS				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'gred':1
20	GUSTAVO GILI				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'gili':2 'gustav':1
21	HERDER				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'herd':1
22	IMPEDIMENTA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'impediment':1
23	JOAQUíN MORTIZ				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'joaquin':1 'mortiz':2
24	LA ESFERA DE LOS LIBROS				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'esfer':2 'libr':5
25	LIBRARY OF AMERICA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'amer':3 'library':1 'of':2
26	LUMEN				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'lum':1
27	NEVSKY				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'nevsky':1
28	OLAñETA				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'olañet':1
29	PAIDóS				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'paidos':1
30	PENGUIN BOOKS				f	1	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'books':2 'penguin':1
31	PHAIDON				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'phaidon':1
32	PLANETA				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'planet':1
33	PLAZA Y JANéS				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'janes':3 'plaz':1
34	RM				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'rm':1
35	SAJALíN				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'sajalin':1
36	SALAMANDRA				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'salamandr':1
37	SATORI				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'satori':1
38	SEIX BARRAL				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'barral':2 'seix':1
39	SEXTO PISO				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'pis':2 'sext':1
40	SIGLO XXI				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'sigl':1 'xxi':2
41	SIRUELA				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'siruel':1
42	TASCHEN				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'tasch':1
43	TAURUS				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'taurus':1
44	TROTTA				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'trott':1
45	TUSQUETS				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'tusquets':1
46	URANO				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'uran':1
47	VALDEMAR				f	1	1	1	\N	2021-10-01 20:45:42	2021-10-01 20:45:42	'valdem':1
48	SANTILLANA				f	1	1	2	\N	2021-10-04 12:25:49	2021-10-04 12:25:49	'santillan':1
49	NUEVA IMAGEN	.			f	1	1	2	\N	2021-10-04 12:27:39	2021-10-04 12:27:39	'imag':2 'nuev':1
50	EDICIONES SM	.			f	1	1	2	\N	2021-10-04 12:27:49	2021-10-04 12:27:49	'edicion':1 'sm':2
51	NUEVO MéXICO	.			f	1	1	2	\N	2021-10-04 12:28:01	2021-10-04 12:28:01	'mexic':2 'nuev':1
52	EDITORIAL ESFINGE	.			f	1	1	2	\N	2021-10-04 12:28:22	2021-10-04 12:28:22	'editorial':1 'esfing':2
53	PUBLICACIONES CULTURAL	.			f	1	1	2	\N	2021-10-04 12:28:30	2021-10-04 12:28:30	'cultural':2 'public':1
54	THOMSON	.			f	1	1	2	\N	2021-10-04 12:28:39	2021-10-04 12:28:39	'thomson':1
55	PRENTICE HALL	.			f	1	1	2	\N	2021-10-04 12:29:01	2021-10-04 12:29:01	'hall':2 'prentic':1
56	NORMA				f	1	1	2	\N	2021-10-04 12:29:11	2021-10-04 12:29:11	'norm':1
57	LIMUSA / NORIEGA EDITORES	.			f	1	1	2	\N	2021-10-04 12:29:28	2021-10-04 12:29:28	'editor':3 'limus':1 'norieg':2
58	S E P	.			f	1	1	2	\N	2021-10-04 12:29:46	2021-10-04 12:29:46	'p':3 's':1
59	LAROUSSE	.			f	1	1	2	\N	2021-10-04 12:30:00	2021-10-04 12:30:00	'larouss':1
60	TRILLAS	.			f	1	1	2	\N	2021-10-04 12:30:06	2021-10-04 12:30:06	'trill':1
61	MC GRAW HILL	.			f	1	1	2	\N	2021-10-04 12:30:18	2021-10-04 12:30:18	'graw':2 'hill':3 'mc':1
62	LIBRIS EDITORES	.			f	1	1	2	\N	2021-10-04 12:30:35	2021-10-04 12:30:35	'editor':2 'libris':1
63	ST EDITORIAL	.			f	1	1	2	\N	2021-10-04 12:30:46	2021-10-04 12:30:46	'editorial':2 'st':1
64	OXFORD	.			f	1	1	2	\N	2021-10-04 12:30:52	2021-10-04 12:30:52	'oxford':1
65	FERNÁNDEZ EDITORES	,			f	1	1	2	\N	2021-10-04 12:30:58	2021-10-04 12:30:58	'editor':2 'fernandez':1
67	EDITORIAL PATRIA	.			f	1	1	2	\N	2021-10-04 12:31:22	2021-10-04 12:31:22	'editorial':1 'patri':2
68	MACMILLAN	.			f	1	1	2	\N	2021-10-04 12:31:31	2021-10-04 12:31:31	'macmill':1
69	EDICIONES ANGELES	.			f	1	1	2	\N	2021-10-04 12:31:40	2021-10-04 12:31:40	'angel':2 'edicion':1
66	EDICIONES CASTILLO	.			f	1	1	2	\N	2021-10-04 12:31:03	2021-10-05 17:11:53	'castill':2 'edicion':1
130	LIBSA				f	1	1	2	\N	2021-10-07 18:55:49	2021-10-07 18:55:49	'libs':1
70	NUEVA EDITORIAL LUCERO	.			f	1	1	2	\N	2021-10-04 12:38:28	2021-10-04 12:38:28	'editorial':2 'lucer':3 'nuev':1
71	EDITORIAL PROGRESO	.			f	1	1	2	\N	2021-10-04 12:38:35	2021-10-04 12:38:35	'editorial':1 'progres':2
72	CONACULTA	.			f	1	1	2	\N	2021-10-04 12:38:42	2021-10-04 12:38:42	'conacult':1
73	CECSA	.			f	1	1	2	\N	2021-10-04 12:38:50	2021-10-04 12:38:50	'cecs':1
74	CENGAGE LEARNING	.			f	1	1	2	\N	2021-10-04 12:38:57	2021-10-04 12:38:57	'cengag':1 'learning':2
75	PEARSON EDUCACIóN	.			f	1	1	2	\N	2021-10-04 12:39:03	2021-10-04 12:39:03	'educ':2 'pearson':1
76	UNESCO	.			f	1	1	2	\N	2021-10-04 12:39:09	2021-10-04 12:39:09	'unesc':1
77	S D I	.			f	1	1	2	\N	2021-10-04 12:39:19	2021-10-04 12:39:19	'd':2 'i':3 's':1
78	ANGELES				f	1	1	2	\N	2021-10-04 19:38:25	2021-10-04 19:38:25	'angel':1
79	LUKAMBANDA EDITORIAL				f	1	1	2	\N	2021-10-05 16:03:04	2021-10-05 16:03:04	'editorial':2 'lukamband':1
80	ÉPOCA				f	1	1	2	\N	2021-10-05 16:33:49	2021-10-05 16:33:49	'epoc':1
81	EDICIONES EUROMéXICO				f	1	1	2	\N	2021-10-05 16:36:56	2021-10-05 16:36:56	'edicion':1 'euromex':2
82	PORRúA	.			f	1	1	2	\N	2021-10-05 16:40:32	2021-10-05 16:40:32	'porru':1
83	ALFAOMEGA				f	1	1	2	\N	2021-10-05 16:41:46	2021-10-05 16:41:46	'alfaomeg':1
84	GRIJALBO				f	1	1	2	\N	2021-10-05 16:52:58	2021-10-05 16:52:58	'grijalb':1
85	ART BLUME				f	1	1	2	\N	2021-10-05 16:55:51	2021-10-05 16:55:51	'art':1 'blum':2
86	GLOBAL EDUCATIONAL SOLUTIONS				f	1	1	2	\N	2021-10-05 18:46:25	2021-10-05 18:46:25	'educational':2 'global':1 'solutions':3
87	LUGAR EDITORIAL				f	1	1	2	\N	2021-10-05 19:14:53	2021-10-05 19:14:53	'editorial':2 'lug':1
88	PAX MéXICO				f	1	1	2	\N	2021-10-05 19:16:37	2021-10-05 19:16:37	'mexic':2 'pax':1
89	EDITORIAL LIMUSA				f	1	1	2	\N	2021-10-05 19:21:07	2021-10-05 19:21:07	'editorial':1 'limus':2
90	COMPAñíA EDITORIAL CONTINENTAL				f	1	1	2	\N	2021-10-06 12:19:11	2021-10-06 12:19:11	'compañ':1 'continental':3 'editorial':2
91	WOLTERS KLUWER				f	1	1	2	\N	2021-10-06 12:38:43	2021-10-06 12:38:43	'kluw':2 'wolters':1
92	NOVEDADES EDUCATIVAS				f	1	1	2	\N	2021-10-06 14:29:59	2021-10-06 14:29:59	'educ':2 'novedad':1
93	TROQUEL				f	1	1	2	\N	2021-10-06 15:16:37	2021-10-06 15:16:37	'troquel':1
94	EDICIONES GRAO				f	1	1	2	\N	2021-10-06 15:45:05	2021-10-06 15:45:05	'edicion':1 'gra':2
95	ENCYCLOPAEDIA BRITANNICA PUBLISHER				f	1	1	2	\N	2021-10-06 16:06:38	2021-10-06 16:06:38	'britann':2 'encyclopaedi':1 'publish':3
96	EDITORIAL CUMBRE				f	1	1	2	\N	2021-10-06 16:09:08	2021-10-06 16:09:08	'cumbr':2 'editorial':1
97	EDITORIAL OCEANO				f	1	1	2	\N	2021-10-06 16:10:53	2021-10-06 16:10:53	'editorial':1 'ocean':2
98	SALVAT EDITORES				f	1	1	2	\N	2021-10-06 16:12:10	2021-10-06 16:12:10	'editor':2 'salvat':1
99	UTHEA				f	1	1	2	\N	2021-10-06 16:13:46	2021-10-06 16:13:46	'uthe':1
100	ENCYCLOPAEDIA BRITANNICA DE MèXICO				f	1	1	2	\N	2021-10-06 16:45:01	2021-10-06 16:45:01	'britann':2 'encyclopaedi':1 'mèxic':4
101	EDICIONES CULTURALES INTERNACIONALES				f	1	1	2	\N	2021-10-06 16:47:34	2021-10-06 16:47:34	'cultural':2 'edicion':1 'internacional':3
102	OLIMPO EDICIONES				f	1	1	2	\N	2021-10-06 16:50:51	2021-10-06 16:50:51	'edicion':2 'olimp':1
103	PLANETA DE AGOSTINI - CONACULTA				f	1	1	2	\N	2021-10-06 16:56:43	2021-10-06 16:56:43	'agostini':3 'conacult':4 'planet':1
104	GRAN ENCICLOPEDIA VISUAL DE MEXICO				f	1	1	2	\N	2021-10-06 16:57:29	2021-10-06 16:57:29	'enciclopedi':2 'gran':1 'mexic':5 'visual':3
105	MIGUEL ANGEL PORRùA, CAMARA DE DIPUTADOS LVIII LEGISLATURA				f	1	1	2	\N	2021-10-06 17:10:41	2021-10-06 17:29:18	'angel':2 'cam':4 'diput':6 'legislatur':8 'lviii':7 'miguel':1 'porrù':3
106	OCEANO MULTIMEDIA				f	1	1	2	\N	2021-10-06 17:30:41	2021-10-06 17:30:41	'multimedi':2 'ocean':1
107	EDITORIAL ALPH				f	1	1	2	\N	2021-10-06 17:33:04	2021-10-06 17:33:04	'alph':2 'editorial':1
108	THEMA EQUIPO EDITORIAL				f	1	1	2	\N	2021-10-06 17:36:00	2021-10-06 17:36:00	'editorial':3 'equip':2 'them':1
109	TIME LIFE				f	1	1	2	\N	2021-10-06 17:38:15	2021-10-06 17:38:15	'lif':2 'tim':1
110	EVEREST				f	1	1	2	\N	2021-10-06 17:41:07	2021-10-06 17:41:07	'everest':1
111	ANAYA EDITORES				f	1	1	2	\N	2021-10-06 17:43:47	2021-10-06 17:43:47	'anay':1 'editor':2
112	INSTITUTO MEXICANO DE CONTADORES PúBLICOS				f	1	1	2	\N	2021-10-06 17:55:46	2021-10-06 17:55:46	'contador':4 'institut':1 'mexican':2 'public':5
113	FLACSO				f	1	1	2	\N	2021-10-06 17:58:59	2021-10-06 17:58:59	'flacs':1
114	COMISIóN NACIONAL DE LOS LIBROS DE TEXTO GRATUITOS				f	1	1	2	\N	2021-10-06 18:03:54	2021-10-06 18:03:54	'comision':1 'gratuit':8 'libr':5 'nacional':2 'text':7
115	SUSAETA EDICIONES				f	1	1	2	\N	2021-10-06 18:22:20	2021-10-06 18:22:20	'edicion':2 'susaet':1
116	SISTA				f	1	1	2	\N	2021-10-06 18:38:41	2021-10-06 18:38:41	'sist':1
117	LIMUSA / UNAM				f	1	1	2	\N	2021-10-06 18:47:19	2021-10-06 18:47:19	'limus':1 'unam':2
118	ALTEA				f	1	1	2	\N	2021-10-06 18:50:15	2021-10-06 18:50:15	'alte':1
119	MILES KELLI				f	1	1	2	\N	2021-10-06 18:56:18	2021-10-06 18:56:18	'kelli':2 'mil':1
120	EDITORIAL RAF				f	1	1	2	\N	2021-10-06 18:58:46	2021-10-06 18:58:46	'editorial':1 'raf':2
121	CAMBRIDGE UNIVERSITY PRESS				f	1	1	2	\N	2021-10-07 16:58:00	2021-10-07 16:58:00	'cambridg':1 'press':3 'university':2
122	E T C				f	1	1	2	\N	2021-10-07 18:22:05	2021-10-07 18:22:05	'c':3 't':2
123	TELEVISA				f	1	1	2	\N	2021-10-07 18:26:21	2021-10-07 18:26:21	'televis':1
124	UNIVERSITY OF CAMBRIDGE				f	1	1	2	\N	2021-10-07 18:30:04	2021-10-07 18:30:42	'cambridg':3 'of':2 'university':1
125	ATLANTIDA				f	1	1	2	\N	2021-10-07 18:32:18	2021-10-07 18:32:18	'atlant':1
126	TIKAL				f	1	1	2	\N	2021-10-07 18:41:21	2021-10-07 18:41:21	'tikal':1
127	EDICIONES MARTíNEZ ROCA				f	1	1	2	\N	2021-10-07 18:46:11	2021-10-07 18:46:11	'edicion':1 'martinez':2 'roc':3
128	DEBATE				f	1	1	2	\N	2021-10-07 18:51:16	2021-10-07 18:51:16	'debat':1
129	VERGARA, GRUPO ZETA				f	1	1	2	\N	2021-10-07 18:54:30	2021-10-07 18:54:30	'grup':2 'verg':1 'zet':3
131	CATAPULTA CHILDREN ENTERTAIMENT				f	1	1	2	\N	2021-10-07 18:56:44	2021-10-07 18:56:44	'catapult':1 'childr':2 'entertaiment':3
132	EDILUPA				f	1	1	2	\N	2021-10-07 19:43:48	2021-10-07 19:43:48	'edilup':1
133	EDITORES MEXICANOS UNIDOS				f	1	1	2	\N	2021-10-07 19:45:16	2021-10-07 19:45:16	'editor':1 'mexican':2 'unid':3
134	BIBLIOTECA NUEVA				f	1	1	2	\N	2021-10-07 19:50:32	2021-10-07 19:50:32	'bibliotec':1 'nuev':2
135	EL COLEGIO DE MéXICO				f	1	1	2	\N	2021-10-07 19:51:17	2021-10-07 19:51:17	'colegi':2 'mexic':4
136	GOBIERNO DEL ESTADO DE TABASCO				f	1	1	2	\N	2021-10-07 19:52:45	2021-10-07 19:52:45	'gobiern':1 'tabasc':5
137	PUBLICACIONES CRUZ O.				f	1	1	2	\N	2021-10-07 19:53:51	2021-10-07 19:53:51	'cruz':2 'public':1
138	ALGARABIA				f	1	1	2	\N	2021-10-08 18:07:34	2021-10-08 18:07:34	'algarabi':1
139	PROMEXA				f	1	1	2	\N	2021-10-08 18:19:48	2021-10-08 18:19:48	'promex':1
140	ARTES DE MéXICO				f	1	1	2	\N	2021-10-08 18:20:51	2021-10-08 18:20:51	'artes':1 'mexic':3
141	FCE, SEP, CONACYT				f	1	1	2	\N	2021-10-08 19:44:39	2021-10-08 19:44:39	'conacyt':3 'fce':1 'sep':2
142	NUEVA GALICIA EDICIONES				f	1	1	2	\N	2021-10-11 13:03:07	2021-10-11 13:03:07	'edicion':3 'galici':2 'nuev':1
143	NOVA GALICIA EDICIONES				f	1	1	2	\N	2021-10-11 14:21:34	2021-10-11 14:27:57	'edicion':3 'galici':2 'nov':1
144	COMPAñIA NUEVA IMAGEN				f	1	1	2	\N	2021-10-12 13:45:21	2021-10-12 13:45:21	'compañi':1 'imag':3 'nuev':2
145	QUETS EDITORES				f	1	1	2	\N	2021-10-12 15:07:24	2021-10-12 15:07:24	'editor':2 'quets':1
146	DIANA				f	1	1	2	\N	2021-10-14 15:37:58	2021-10-14 15:37:58	'dian':1
147	PANTHEON				f	1	1	2	\N	2021-10-14 16:17:25	2021-10-14 16:17:25	'pantheon':1
148	SM DE EDICIONES				f	1	1	2	\N	2021-10-14 17:08:41	2021-10-14 17:08:41	'edicion':3 'sm':1
149	EL CAMINO ROJO EDICIONES				f	1	1	2	\N	2021-10-14 19:04:20	2021-10-14 19:04:20	'camin':2 'edicion':4 'roj':3
150	SUMA DE LETRAS				f	1	1	2	\N	2021-10-15 16:31:21	2021-10-15 16:31:21	'letr':3 'sum':1
151	NOSTRA EDICIONES				f	1	1	2	\N	2021-10-15 17:16:24	2021-10-15 17:16:24	'edicion':2 'nostr':1
152	INSTITUTO NACIONAL DE ANTROPOLOGíA E HISTORIA				f	1	1	2	\N	2021-10-15 17:26:20	2021-10-15 17:26:20	'antropolog':4 'histori':6 'institut':1 'nacional':2
153	EDICIONES ARTíSTICAS				f	1	1	2	\N	2021-10-15 17:27:27	2021-10-15 17:27:27	'artist':2 'edicion':1
154	EDICIONES COYOACAN				f	1	1	2	\N	2021-10-15 17:29:07	2021-10-15 17:29:07	'coyoac':2 'edicion':1
155	PANORAMA EDITORIAL				f	1	1	2	\N	2021-10-15 17:30:43	2021-10-15 17:30:43	'editorial':2 'panoram':1
156	SELECTOR				f	1	1	2	\N	2021-10-15 17:49:50	2021-10-15 17:49:50	'selector':1
157	PITKIN PUBLISHING				f	1	1	2	\N	2021-10-15 17:56:55	2021-10-15 17:56:55	'pitkin':1 'publishing':2
158	UNIVERSIDAD IBEROAMéRICANA				f	1	1	2	\N	2021-10-15 18:03:31	2021-10-15 18:03:31	'iberoamerican':2 'univers':1
159	EDITORIAL OTRAS INQUISICIONES				f	1	1	2	\N	2021-10-15 18:21:40	2021-10-15 18:21:40	'editorial':1 'inquisicion':3
160	EDITORIAL PAX MéXICO				f	1	1	2	\N	2021-10-15 18:24:24	2021-10-15 18:24:24	'editorial':1 'mexic':3 'pax':2
161	EDICIONES UNIVERSIDAD DE NAVARRA				f	1	1	2	\N	2021-10-15 18:26:03	2021-10-15 18:26:03	'edicion':1 'navarr':4 'univers':2
162	UJAT				f	1	1	2	\N	2021-10-15 18:29:30	2021-10-15 18:29:30	'ujat':1
163	EDICIONES SCHOLA				f	1	1	2	\N	2021-10-15 18:33:27	2021-10-15 18:33:27	'edicion':1 'schol':2
164	V&R EDITORES				f	1	1	2	\N	2021-10-15 18:39:14	2021-10-15 18:39:14	'editor':3 'r':2 'v':1
165	CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO				f	1	1	2	\N	2021-10-15 18:40:25	2021-10-15 18:40:25	'centr':1 'didact':7 'educ':4 'material':6 'public':3
166	GRUPO EDITORIAL PATRIA				f	1	1	2	\N	2021-10-18 12:33:16	2021-10-18 12:33:16	'editorial':2 'grup':1 'patri':3
167	PRODUCCIONES EDUCACIóN APLICADA				f	1	1	2	\N	2021-10-18 12:35:58	2021-10-18 12:35:58	'aplic':3 'educ':2 'produccion':1
168	EL MANUAL MODERNO				f	1	1	2	\N	2021-10-18 12:38:33	2021-10-18 12:38:33	'manual':2 'modern':3
169	MESTAS EDICIONES				f	1	1	2	\N	2021-10-18 12:44:52	2021-10-18 12:44:52	'edicion':2 'mest':1
171	EDITORIAL TELEVISA				f	1	1	2	\N	2021-10-18 12:51:47	2021-10-18 12:51:47	'editorial':1 'televis':2
172	JAVIER VERGARA				f	1	1	2	\N	2021-10-18 13:15:12	2021-10-18 13:15:12	'javi':1 'verg':2
173	EDICIONES LEYENDA				f	1	1	2	\N	2021-10-18 13:18:17	2021-10-18 13:18:17	'edicion':1 'leyend':2
174	F C E				f	1	1	2	\N	2021-10-18 13:20:03	2021-10-18 13:20:03	'c':2 'f':1
175	UNIVERSIDAD ANAHUAC				f	1	1	2	\N	2021-10-18 13:24:28	2021-10-18 13:24:28	'anahuac':2 'univers':1
176	INSTITUTO DE INVESTIGACIONES SOCIALES S.C.				f	1	1	2	\N	2021-10-18 13:26:05	2021-10-18 13:26:23	'institut':1 'investig':3 's.c':5 'social':4
177	SUPREMA CORTE DE JUSTICIA DE LA NACIóN				f	1	1	2	\N	2021-10-18 13:29:42	2021-10-18 13:29:42	'cort':2 'justici':4 'nacion':7 'suprem':1
178	EDICIONES QUINTO SOL				f	1	1	2	\N	2021-10-18 13:30:57	2021-10-18 13:30:57	'edicion':1 'quint':2 'sol':3
179	UNAM				f	1	1	2	\N	2021-10-18 13:32:26	2021-10-18 13:32:26	'unam':1
180	EDICIONES DE CULTURA POPULAR				f	1	1	2	\N	2021-10-18 13:33:50	2021-10-18 13:33:50	'cultur':3 'edicion':1 'popul':4
181	EDITORIAL URANO				f	1	1	2	\N	2021-10-18 18:34:07	2021-10-18 18:34:07	'editorial':1 'uran':2
182	EDAF				f	1	1	2	\N	2021-10-18 18:36:20	2021-10-18 18:36:20	'edaf':1
183	CIRSA				f	1	1	2	\N	2021-10-18 18:37:36	2021-10-18 18:37:36	'cirs':1
184	MR EDICIONES				f	1	1	2	\N	2021-10-18 18:39:12	2021-10-18 18:39:12	'edicion':2 'mr':1
185	EDITORIAL DIANA				f	1	1	2	\N	2021-10-18 18:43:48	2021-10-18 18:43:48	'dian':2 'editorial':1
186	EDITORIAL SERPENTINA				f	1	1	2	\N	2021-10-18 18:44:46	2021-10-18 18:44:46	'editorial':1 'serpentin':2
187	PODER JUDICIAL DE LA FEDERACIóN				f	1	1	2	\N	2021-10-18 18:50:42	2021-10-18 18:50:42	'feder':5 'judicial':2 'pod':1
188	ALBOR LIBROS				f	1	1	2	\N	2021-10-18 18:55:41	2021-10-18 18:55:41	'albor':1 'libr':2
189	EDITORIAL FOLIO				f	1	1	2	\N	2021-10-18 18:57:17	2021-10-18 18:57:17	'editorial':1 'foli':2
190	STAR FIRE				f	1	1	2	\N	2021-10-18 18:59:08	2021-10-18 18:59:08	'fir':2 'star':1
191	UNIVERSIDAD INTERCONTINENTAL				f	1	1	2	\N	2021-10-18 19:03:55	2021-10-18 19:03:55	'intercontinental':2 'univers':1
192	EDITORIAL CCS				f	1	1	2	\N	2021-10-18 19:27:02	2021-10-18 19:27:02	'ccs':2 'editorial':1
193	ALAMAH AUTO AYUDA				f	1	1	2	\N	2021-10-18 19:40:32	2021-10-18 19:40:32	'alamah':1 'aut':2 'ayud':3
194	HEINEMANN INTERNATIONAL				f	1	1	2	\N	2021-10-18 19:44:17	2021-10-18 19:44:17	'heinemann':1 'international':2
195	PLAZA JANéS				f	1	1	2	\N	2021-10-18 19:45:46	2021-10-18 19:45:46	'janes':2 'plaz':1
196	PUNTO DE LECTURA				f	1	1	2	\N	2021-10-19 12:33:27	2021-10-19 12:33:27	'lectur':3 'punt':1
197	CERLALC, LATINOAMERICANA				f	1	1	2	\N	2021-10-19 12:37:13	2021-10-19 12:37:13	'cerlalc':1 'latinoamerican':2
198	PARRAGON				f	1	1	2	\N	2021-10-19 17:21:30	2021-10-19 17:21:30	'parragon':1
199	EDICIONES PRELUDIO				f	1	1	2	\N	2021-10-19 17:24:29	2021-10-19 17:24:29	'edicion':1 'preludi':2
200	SCHOLASTIC INC.				f	1	1	2	\N	2021-10-19 17:28:41	2021-10-19 17:28:41	'inc':2 'scholastic':1
201	EDICIONES ARTISTIKAS				f	1	1	2	\N	2021-10-19 17:36:43	2021-10-19 17:36:43	'artistik':2 'edicion':1
202	EDICIONES DEL AULA AL TALLER				f	1	1	2	\N	2021-10-19 17:40:51	2021-10-19 17:40:51	'aul':3 'edicion':1 'tall':5
203	PREUNIVERSITARIA SANTILLANA				f	1	1	2	\N	2021-10-19 18:00:02	2021-10-19 18:00:02	'preuniversitari':1 'santillan':2
204	EDITORIAL GEDISA				f	1	1	2	\N	2021-10-19 18:04:28	2021-10-19 18:04:28	'editorial':1 'gedis':2
205	EDITORIAL SPANTA				f	1	1	2	\N	2021-10-19 18:06:09	2021-10-19 18:06:09	'editorial':1 'spant':2
206	EDICIONES NOVEDADES EDUCATIVAS				f	1	1	2	\N	2021-10-21 12:32:50	2021-10-21 12:32:50	'edicion':1 'educ':3 'novedad':2
207	BONUM				f	1	1	2	\N	2021-10-21 12:34:28	2021-10-21 12:34:28	'bonum':1
208	MIGUEL ÁNGEL PORRúA				f	1	1	2	\N	2021-10-21 12:43:01	2021-10-21 12:43:01	'angel':2 'miguel':1 'porru':3
209	A DELL BOOK				f	1	1	2	\N	2021-10-28 18:44:35	2021-10-28 18:44:35	'book':3 'dell':2
210	ADN, CONACULTA				f	1	1	2	\N	2021-10-28 18:44:41	2021-10-28 18:44:41	'adn':1 'conacult':2
211	AGENCIA DE PUBLICACIONES MéXICO CENTRAL A.C.				f	1	1	2	\N	2021-10-28 18:44:46	2021-10-28 18:44:46	'a.c':6 'agenci':1 'central':5 'mexic':4 'public':3
212	AGRUPACIóN VENTANA AMBIENTAL				f	1	1	2	\N	2021-10-28 18:44:52	2021-10-28 18:44:52	'agrup':1 'ambiental':3 'ventan':2
213	ALFA OMEGA GRUPO EDITOR				f	1	1	2	\N	2021-10-28 18:45:39	2021-10-28 18:45:39	'alfa':1 'editor':4 'grup':3 'omeg':2
214	ALFAGUARA ENGLISH				f	1	1	2	\N	2021-10-28 18:45:51	2021-10-28 18:45:51	'alfagu':1 'english':2
215	ALFAGUARA JUVENIL				f	1	1	2	\N	2021-10-28 18:46:03	2021-10-28 18:46:03	'alfagu':1 'juvenil':2
217	ALFAOMEGA GRUPO EDITORIAL				f	1	1	2	\N	2021-10-28 18:46:59	2021-10-28 18:46:59	'alfaomeg':1 'editorial':3 'grup':2
218	ALGARABIA POCKET				f	1	1	2	\N	2021-10-28 18:47:14	2021-10-28 18:47:14	'algarabi':1 'pocket':2
6	ALIANZA EDITORIAL				f	1	1	2	\N	2021-10-01 20:45:41	2021-10-28 19:36:35	'alianz':1 'editorial':2
219	ALIANZA, EMECé				f	1	1	2	\N	2021-10-28 19:36:48	2021-10-28 19:36:48	'alianz':1 'emec':2
220	AMERICAN NUMISMATIC ASSOCIATION MONEY MUSEUM				f	1	1	2	\N	2021-10-28 19:36:56	2021-10-28 19:36:56	'americ':1 'association':3 'money':4 'museum':5 'numismatic':2
221	AMORRORTU EDITORES				f	1	1	2	\N	2021-10-28 19:37:03	2021-10-28 19:37:03	'amorrortu':1 'editor':2
222	ANTHROPOS / EDICIONES UNIVERSIDAD NACIONAL DEL LITORAL				f	1	1	2	\N	2021-10-28 19:37:16	2021-10-28 19:37:16	'anthrop':1 'edicion':2 'litoral':6 'nacional':4 'univers':3
223	ARGOS-VERGARA				f	1	1	2	\N	2021-10-28 19:37:21	2021-10-28 19:37:21	'argos':2 'argos-verg':1 'verg':3
10	EDITORIAL ARIEL				f	1	1	2	\N	2021-10-01 20:45:41	2021-10-28 19:38:50	'ariel':2 'editorial':1
170	BORRAR				f	1	1	2	\N	2021-10-18 12:46:23	2021-10-28 19:40:13	'borr':1
224	ARLANZA EDICIONES				f	1	1	2	\N	2021-10-28 19:40:23	2021-10-28 19:40:23	'arlanz':1 'edicion':2
\.


--
-- TOC entry 2773 (class 0 OID 40736)
-- Dependencies: 199
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresas (id, razon_social, domicilio_fiscal, rfc, ip, host, deleted_at, created_at, updated_at) FROM stdin;
1	Nombre Institución	rfc				\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2790 (class 0 OID 44006)
-- Dependencies: 216
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 44440)
-- Dependencies: 248
-- Data for Name: historiallibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historiallibros (id, libro_id, inventariolibro_id, user_id, fecha, tipo_movto, observaciones, empresa_id, creado_por_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 43973)
-- Dependencies: 213
-- Data for Name: imagen_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagen_user (id, imagen_id, user_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 43943)
-- Dependencies: 211
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenes (id, root, filename, filename_png, filename_thumb, pie_de_foto, user_id, creado_por_id, status_imagen, ip, host, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 44418)
-- Dependencies: 246
-- Data for Name: inventariolibro_portada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventariolibro_portada (id, inventariolibro_id, portada_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	11	\N	\N	\N
\.


--
-- TOC entry 2814 (class 0 OID 44296)
-- Dependencies: 240
-- Data for Name: inventariolibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventariolibros (id, libro_id, isbn, clasificacion, edicion, codebar, prestado_user_id, fecha_prestamo, fecha_entrega, apartado_user_id, fecha_apartado, editorial_id, uuid, observaciones, empresa_id, status_libro, creado_por_id, deleted_at, created_at, updated_at, etiqueta_smarth, no_coleccion, searchtext) FROM stdin;
1	517	9789681660529	461.52 S211 2006	2a. Ed.	0009706382127	0	\N	\N	0	\N	16	4a18bc4f-ca63-4f4c-a9ec-36d8763e7b88		1	1	2	\N	2021-10-26 13:20:34	2021-10-26 13:20:34			'0009706382127':7 '2006':4 '2a':5 '461.52':2 '9789681660529':1 'ed':6 's211':3
2	398	9681864271	C 912.972 G881 2007	\N	0789681850067	0	\N	\N	0	\N	117	dc44fd60-8f5f-4595-bfec-49a09ee7ee27		1	1	2	\N	2021-10-26 18:14:44	2021-10-26 18:14:44			'0789681850067':6 '2007':5 '912.972':3 '9681864271':1 'c':2 'g881':4
5	398	9681850068	C 912.972 G881 2003	\N	0009681850068	0	\N	\N	0	\N	117	00edd4c3-343d-4f20-90a0-45f9aef18b36		1	1	2	\N	2021-10-26 18:17:17	2021-10-26 18:17:17			'0009681850068':6 '2003':5 '912.972':3 '9681850068':1 'c':2 'g881':4
\.


--
-- TOC entry 2824 (class 0 OID 58483)
-- Dependencies: 250
-- Data for Name: libro_portada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_portada (id, libro_id, portada_id, deleted_at, created_at, updated_at) FROM stdin;
1	627	1	\N	\N	\N
2	932	2	\N	\N	\N
11	517	11	\N	\N	\N
13	398	13	\N	\N	\N
\.


--
-- TOC entry 2812 (class 0 OID 44245)
-- Dependencies: 238
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (id, ficha_no, titulo, autor, datos_fijos, codebar, observaciones, tipo_material_id, status_libro, empresa_id, editorial_id, creado_por_id, ip, host, deleted_at, created_at, updated_at, searchtext) FROM stdin;
18	17	LIBRO PARA EL MAESTRO : EDUCACION SECUNDARIA ESPAN	.				1	1	1	58	2			\N	2021-10-04 14:46:47	2021-10-04 14:46:47	'educacion':5 'espan':7 'libr':1 'maestr':4 'secundari':6
8	8	ESPANOL UNO	.				1	1	1	51	2			\N	2021-10-04 14:12:19	2021-10-04 16:30:40	'espanol':1
22	22	ESPANOL 3 CUADERNO DE TRABAJO	GARCIA, PELAYO OLIVIA				1	1	1	52	2			\N	2021-10-04 14:56:35	2021-10-04 14:56:35	'3':2 'cuadern':3 'espanol':1 'garci':6 'olivi':8 'pelay':7 'trabaj':5
23	23	ESPANOL 3	CUEVA, HUMBERTO				1	1	1	60	2			\N	2021-10-04 14:57:02	2021-10-04 14:57:02	'3':2 'cuev':3 'espanol':1 'humbert':4
24	24	TALLER DE LECTURA Y REDACCION II	CID GARZON, MARIA DE LOURDES				1	1	1	49	2			\N	2021-10-04 15:04:59	2021-10-04 15:04:59	'cid':7 'garzon':8 'ii':6 'lectur':3 'lourd':11 'mari':9 'redaccion':5 'tall':1
54	54	ESPANOL 2	MAYORGA CORTES, LUCIO				1	1	1	64	2			\N	2021-10-04 17:19:41	2021-10-04 17:19:41	'2':2 'cort':4 'espanol':1 'luci':5 'mayorg':3
25	25	TALLER DE LECTURA Y REDACCION 1	DE LA TORRE ZERMENO, FRANCISCO J.				1	1	1	61	2			\N	2021-10-04 15:05:39	2021-10-04 15:05:39	'1':6 'francisc':11 'j':12 'lectur':3 'redaccion':5 'tall':1 'torr':9 'zermen':10
26	26	TALLER DE LECTURA Y REDACCION II	OLMEDO, MARTINEZ DOMINGA				1	1	1	49	2			\N	2021-10-04 15:06:25	2021-10-04 15:06:25	'doming':9 'ii':6 'lectur':3 'martinez':8 'olmed':7 'redaccion':5 'tall':1
27	28	LITERATURA BACHILLERATO GENERAL 2	LOZANO LUCERO				1	1	1	62	2			\N	2021-10-04 15:11:46	2021-10-04 15:11:46	'2':4 'bachillerat':2 'general':3 'literatur':1 'lozan':5 'lucer':6
679	646	LASTIMA DE CUBA	RIUS				1	1	1	15	2			\N	2021-10-14 19:20:06	2021-10-14 19:20:06	'cub':3 'lastim':1 'rius':4
28	29	CONTABILIDAD 1	ILLESCAS, PACHECO APOLONIO				1	1	1	49	2			\N	2021-10-04 15:23:21	2021-10-04 15:23:21	'1':2 'apoloni':5 'contabil':1 'illesc':3 'pachec':4
712	672	PARA ENTENDER EL PODER JUDICIAL DE LOS ESTADOS UNI	CARBONELL, MIGUEL				1	1	1	151	2			\N	2021-10-15 17:22:28	2021-10-15 17:22:28	'carbonell':10 'entend':2 'judicial':5 'miguel':11 'pod':4 'uni':9
30	31	INFORMATICA 2	PEREZ, CHAVEZ CECILIA				1	1	1	63	2			\N	2021-10-04 16:24:38	2021-10-04 16:24:38	'2':2 'cecili':5 'chavez':4 'informat':1 'perez':3
31	32	ESPANOL 1	MAYORGA CORTES,LUCIO				1	1	1	64	2			\N	2021-10-04 16:25:39	2021-10-04 16:25:39	'1':2 'cort':4 'espanol':1 'luci':5 'mayorg':3
6	6	TALLER DE LECTURA Y REDACCION 1	QUINTERO JARA, CARLOS VALENTE				1	1	1	48	2			\N	2021-10-04 13:14:42	2021-10-04 16:28:45	'1':6 'carl':9 'jar':8 'lectur':3 'quinter':7 'redaccion':5 'tall':1 'valent':10
29	30	LECTURAS PARA ADOLESCENTES	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-04 16:20:36	2021-10-04 16:33:22	'adolescent':3 'lectur':1 'lozan':4 'lucer':5
33	33	NUEVO ESPANOL DE HOY 1	HERRERA SUASTEGUI OMAR				1	1	1	65	2			\N	2021-10-04 16:37:23	2021-10-04 16:37:23	'1':5 'espanol':2 'herrer':6 'hoy':4 'nuev':1 'omar':8 'suastegui':7
34	34	COMUNICATE EN ESPANOL 1	DIAZ DE LEON, SANDRA				1	1	1	64	2			\N	2021-10-04 16:38:57	2021-10-04 16:39:08	'1':4 'comunicat':1 'diaz':5 'espanol':3 'leon':7 'sandr':8
35	35	ESPANOL 1	CARRUS TREVINO, LUZ AMELIA				1	1	1	51	2			\N	2021-10-04 16:40:29	2021-10-04 16:40:29	'1':2 'ameli':6 'carrus':3 'espanol':1 'luz':5 'trevin':4
36	36	ESPANOL 1	CARRASCO, ALMA				1	1	1	66	2			\N	2021-10-04 16:45:35	2021-10-04 16:45:35	'1':2 'alma':4 'carrasc':3 'espanol':1
37	37	ESPANOL 1	HERNANDEZ SANDOVAL , ADRIANA				1	1	1	52	2			\N	2021-10-04 16:48:30	2021-10-04 16:48:30	'1':2 'adrian':5 'espanol':1 'hernandez':3 'sandoval':4
38	38	ESPANOL 1	PASTOR, BLANCA				1	1	1	48	2			\N	2021-10-04 16:49:26	2021-10-04 16:49:26	'1':2 'blanc':4 'espanol':1 'pastor':3
39	39	ESPANOL 1: CUADERNO DE TRABAJO	RIVERA LOPEZ SARA				1	1	1	66	2			\N	2021-10-04 16:50:05	2021-10-04 16:50:05	'1':2 'cuadern':3 'espanol':1 'lopez':7 'river':6 'sar':8 'trabaj':5
40	40	EL NUEVO UNIVERSO DE LAS LETRAS 1	CHAVEZ GONZALEZ PEDRO TEOBALDO				1	1	1	65	2			\N	2021-10-04 16:50:54	2021-10-04 16:50:54	'1':7 'chavez':8 'gonzalez':9 'letr':6 'nuev':2 'pedr':10 'teobald':11 'univers':3
41	41	PALABRAS SIN FRONTERA 1	RIVERO REYNA,FRANCISCO				1	1	1	65	2			\N	2021-10-04 16:51:46	2021-10-04 16:51:46	'1':4 'francisc':7 'fronter':3 'palabr':1 'reyn':6 'river':5
42	42	ESPANOL 1 : NUEVOS HORIZONTES	ARCINIEGA RANGEL, MA. ESTELA				1	1	1	65	2			\N	2021-10-04 16:52:14	2021-10-04 16:52:14	'1':2 'arcinieg':5 'espanol':1 'estel':8 'horizont':4 'ma':7 'nuev':3 'rangel':6
43	43	ESPANOL 1	LOZANO,  LUCERO				1	1	1	62	2			\N	2021-10-04 16:53:13	2021-10-04 16:53:13	'1':2 'espanol':1 'lozan':3 'lucer':4
186	201	IMAGEN COOL	GORDOA,  ALVARO				1	1	1	84	2			\N	2021-10-05 16:53:09	2021-10-05 16:53:26	'alvar':4 'cool':2 'gordo':3 'imag':1
44	44	ESPANOL 1: VERSION PRELIMINAR	VITAL, ALBERTO				1	1	1	62	2			\N	2021-10-04 16:54:29	2021-10-04 16:54:29	'1':2 'albert':6 'espanol':1 'prelimin':4 'version':3 'vital':5
45	45	ESPANOL 1	VALLE GUERRERO,  ESTELA DEL				1	1	1	66	2			\N	2021-10-04 16:57:37	2021-10-04 16:57:37	'1':2 'espanol':1 'estel':5 'guerrer':4 'vall':3
215	229	SOCIOLOGIA	.				1	1	1	61	2			\N	2021-10-05 17:42:26	2021-10-05 17:42:26	'sociologi':1
205	220	SOCIOLOGIA 2	AMEZCUA CARDIEL,HECTOR				1	1	1	49	2			\N	2021-10-05 17:21:50	2021-10-05 17:21:50	'2':2 'amezcu':3 'cardiel':4 'hector':5 'sociologi':1
46	46	ESPANOL 1: PRIMER GRADO	PRAXEDIS MONTES, NIEVES				1	1	1	67	2			\N	2021-10-04 16:58:39	2021-10-04 16:58:39	'1':2 'espanol':1 'grad':4 'mont':6 'niev':7 'praxedis':5 'prim':3
47	47	ESPANOL 1	GARCIA CARDENAS, LIDIA				1	1	1	67	2			\N	2021-10-04 17:03:16	2021-10-04 17:03:16	'1':2 'carden':4 'espanol':1 'garci':3 'lidi':5
112	113	COMUNICATE EN ESPANOL 3	DIAZ DE LEON, SANDRA				1	1	1	65	2			\N	2021-10-05 13:21:47	2021-10-05 13:21:47	'3':4 'comunicat':1 'diaz':5 'espanol':3 'leon':7 'sandr':8
101	100	REDACCION Y ORTOGRAFIA 1 ; CUADERNO DE TRABAJO	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 12:53:19	2021-10-05 13:19:01	'1':4 'cuadern':5 'lozan':8 'lucer':9 'ortografi':3 'redaccion':1 'trabaj':7
48	48	ESPANOL 2:CUADERNO DE TRABAJO	FERNANDEZ FUENTES, MARIA ISABEL				1	1	1	66	2			\N	2021-10-04 17:05:22	2021-10-04 17:05:22	'2':2 'cuadern':3 'espanol':1 'fernandez':6 'fuent':7 'isabel':9 'mari':8 'trabaj':5
49	49	ESPANOL : CODIGO 1	OCHOA, DE TERESA ADRIANA				1	1	1	50	2			\N	2021-10-04 17:07:16	2021-10-04 17:07:16	'1':3 'adrian':7 'codig':2 'espanol':1 'ocho':4 'teres':6
267	280	BIOLOGIA 2:UN ENFOQUE CONSTRUCTIVISTA	GAMA FUERTES,MARIA DE LOS ANGELES				1	1	1	75	2			\N	2021-10-06 12:32:22	2021-10-06 12:32:32	'2':2 'angel':11 'biologi':1 'constructiv':5 'enfoqu':4 'fuert':7 'gam':6 'mari':8
268	281	EDUCACION PARA LA SALUD	SALAS CUEVAS,CONSUELO B.				1	1	1	75	2			\N	2021-10-06 12:33:07	2021-10-06 12:33:07	'b':8 'consuel':7 'cuev':6 'educacion':1 'sal':5 'salud':4
269	282	QUIMICA I:UN ENFOQUE CONSTRUCTIVISTA	SIN AUTOR				1	1	1	75	2			\N	2021-10-06 12:34:13	2021-10-06 14:00:54	'autor':7 'constructiv':5 'enfoqu':4 'i':2 'quimic':1
345	337	DICCIONARIO ESCOLAR DE LA LENGUA ESPANOLA	SIN AUTOR				1	1	1	48	2			\N	2021-10-06 17:13:56	2021-10-06 17:13:56	'autor':8 'diccionari':1 'escol':2 'espanol':6 'lengu':5
50	50	ESPANOL 1: CUADERNO DE EJERCICIOS	HERRERA , OMMAR				1	1	1	65	2			\N	2021-10-04 17:15:24	2021-10-04 17:15:24	'1':2 'cuadern':3 'ejercici':5 'espanol':1 'herrer':6 'ommar':7
51	51	ESPANOL 1: RECURSOS DIDACTICOS	HERNANDEZ BARROS, ALEJANDRA				1	1	1	48	2			\N	2021-10-04 17:16:07	2021-10-04 17:16:07	'1':2 'alejandr':7 'barr':6 'didact':4 'espanol':1 'hernandez':5 'recurs':3
52	52	VITRAL 1: ESPANOL	LUCERO SANCHEZ, MARTHA ELENA				1	1	1	56	2			\N	2021-10-04 17:17:44	2021-10-04 17:17:44	'1':2 'elen':7 'espanol':3 'lucer':4 'marth':6 'sanchez':5 'vitral':1
53	53	ESPANOL CODIGO 2: SECUNDARIA	OCHOA, ADRIANA DE TERESA				1	1	1	50	2			\N	2021-10-04 17:18:39	2021-10-04 17:18:39	'2':3 'adrian':6 'codig':2 'espanol':1 'ocho':5 'secundari':4 'teres':8
713	673	PARA ENTENDER EL PODER LEGISLATIVO DE LOS ESTADOS	NACIF, BENITO				1	1	1	151	2			\N	2021-10-15 17:23:33	2021-10-15 17:23:33	'benit':10 'entend':2 'legisl':5 'nacif':9 'pod':4
56	55	ESPANOL 2: NUEVOS HORIZONTES	ARCINIEGA RANGEL, MA. ESTELA				1	1	1	64	2			\N	2021-10-04 17:22:53	2021-10-04 17:22:53	'2':2 'arcinieg':5 'espanol':1 'estel':8 'horizont':4 'ma':7 'nuev':3 'rangel':6
57	56	ESPANOL 2 : MARGARITA ALEGRIA DE LA COLINA ; ALEJA	ALEGRIA DE LA COLINA, MARGARITA				1	1	1	51	2			\N	2021-10-04 17:26:19	2021-10-04 17:26:19	'2':2 'alegri':4,9 'alej':8 'colin':7,12 'espanol':1 'margarit':3,13
58	58	EL ESPANOL DE HOY 1	HERRERA SUASTEGUI,OMAR				1	1	1	65	2			\N	2021-10-04 17:47:32	2021-10-04 17:47:32	'1':5 'espanol':2 'herrer':6 'hoy':4 'omar':8 'suastegui':7
59	59	ESPANOL 1: CUADERNO DE TRABAJO	GARCIA PELAYO, OLIVIA				1	1	1	52	2			\N	2021-10-04 17:48:44	2021-10-04 17:48:44	'1':2 'cuadern':3 'espanol':1 'garci':6 'olivi':8 'pelay':7 'trabaj':5
60	60	ESPANOL : CUADERNO DE TRABAJO	LOZANO , LUCERO				1	1	1	62	2			\N	2021-10-04 17:51:02	2021-10-04 17:51:02	'cuadern':2 'espanol':1 'lozan':5 'lucer':6 'trabaj':4
390	381	CODIGO CIVIL FEDERAL	MEXICO, LEYES Y CODIGOS DE				1	1	1	116	2			\N	2021-10-06 18:41:01	2021-10-06 18:41:36	'civil':2 'codig':1,7 'federal':3 'ley':5 'mexic':4
391	382	FUNDAMENTOS DE PROGRAMACION: LIBRO DE PROBLEMAS	JOYANES AGUILAR, LUIS				1	1	1	61	2			\N	2021-10-06 18:42:22	2021-10-06 18:42:22	'aguil':8 'fundament':1 'joyan':7 'libr':4 'luis':9 'problem':6 'programacion':3
392	383	PROGRAMACION EN JAVA 2: ALGORITMOS, ESTRUCTURAS DE	JOYANES AGUILAR, LUIS				1	1	1	61	2			\N	2021-10-06 18:43:01	2021-10-06 18:43:01	'2':4 'aguil':9 'algoritm':5 'estructur':6 'jav':3 'joyan':8 'luis':10 'programacion':1
61	61	ESPANOL 1: CUADERNO DE ACTIVIDADES	ANGELES MARTINEZ, ELFEGO				1	1	1	69	2			\N	2021-10-04 17:52:19	2021-10-04 17:52:19	'1':2 'activ':5 'angel':6 'cuadern':3 'elfeg':8 'espanol':1 'martinez':7
62	62	MI CUADERNO PARA HABLAR Y ESCRIBIR 1	DOMINGUEZ HIDALGO, ANTONIO				1	1	1	75	2			\N	2021-10-04 17:55:37	2021-10-04 17:55:37	'1':7 'antoni':10 'cuadern':2 'dominguez':8 'escrib':6 'habl':4 'hidalg':9
63	63	ESPANOL 1 : CUADERNO DE TRABAJO	FERNANDEZ FUENTES, MARIA ISABEL				1	1	1	66	2			\N	2021-10-04 17:57:21	2021-10-04 17:57:21	'1':2 'cuadern':3 'espanol':1 'fernandez':6 'fuent':7 'isabel':9 'mari':8 'trabaj':5
64	64	ESPANOL : PALABRAS Y COMUNICACION	MURILLO, GRACIELA				1	1	1	68	2			\N	2021-10-04 17:58:20	2021-10-04 17:58:20	'comunicacion':4 'espanol':1 'graciel':6 'murill':5 'palabr':2
65	65	MATERIAL DE APOYO COMPLEMENTARIO DE ESPANOL 1	LOZANO , LUCERO				1	1	1	62	2			\N	2021-10-04 18:00:01	2021-10-04 18:00:01	'1':7 'apoy':3 'complementari':4 'espanol':6 'lozan':8 'lucer':9 'material':1
66	66	CAMINOS DEL ESPANOL 2	MUNGUIA ZATARAIN , IRMA				1	1	1	48	2			\N	2021-10-04 18:00:47	2021-10-04 18:00:47	'2':4 'camin':1 'espanol':3 'irma':7 'mungui':5 'zatarain':6
68	67	ESPANOL 2	REYES HERRERA, SARA				1	1	1	48	2			\N	2021-10-04 18:03:11	2021-10-04 18:03:11	'2':2 'espanol':1 'herrer':4 'rey':3 'sar':5
69	68	ESPANOL 2: CUADERNO DE TRABAJO	ARREDONDO VARGAS, LUIS RODRIGO				1	1	1	66	2			\N	2021-10-04 18:06:33	2021-10-04 18:06:33	'2':2 'arredond':6 'cuadern':3 'espanol':1 'luis':8 'rodrig':9 'trabaj':5 'varg':7
70	69	ESPANOL 2	TOLEDO GUERRERO, ANTONIO				1	1	1	48	2			\N	2021-10-04 18:07:19	2021-10-04 18:07:19	'2':2 'antoni':5 'espanol':1 'guerrer':4 'toled':3
71	70	COMPETENCIAS LECTORAS : LECTURA DE COMPRENSION 2	GOMEZ Z. JUAN FRANCISCO				1	1	1	56	2			\N	2021-10-04 18:08:05	2021-10-04 18:08:05	'2':6 'competent':1 'comprension':5 'francisc':10 'gomez':7 'juan':9 'lector':2 'lectur':3 'z':8
72	71	ESPANOL 2 : CUADERNO DE EJERCICIOS	HERRERA, OMAR				1	1	1	65	2			\N	2021-10-04 18:11:25	2021-10-04 18:11:25	'2':2 'cuadern':3 'ejercici':5 'espanol':1 'herrer':6 'omar':7
73	72	ESPANOL 2 : CUADERNO DE TRABAJO	LOZANO , LUCERO				1	1	1	65	2			\N	2021-10-04 18:13:23	2021-10-04 18:13:23	'2':2 'cuadern':3 'espanol':1 'lozan':6 'lucer':7 'trabaj':5
74	73	NUEVO ESPANOL DE HOY 2	HERRERA SUASTEGUI, OMAR				1	1	1	65	2			\N	2021-10-04 18:14:13	2021-10-04 18:14:13	'2':5 'espanol':2 'herrer':6 'hoy':4 'nuev':1 'omar':8 'suastegui':7
75	74	ESPANOL 2 : SECUNDARIA SEGUNDO GRADO	VITAL , ALBERTO				1	1	1	68	2			\N	2021-10-04 18:15:33	2021-10-04 18:15:33	'2':2 'albert':7 'espanol':1 'grad':5 'secundari':3 'segund':4 'vital':6
76	75	MI CUADERNO PARA HABLAR Y ESCRIBIR 2 : ESPANOL	DOMINGUEZ HIDALGO , ANTONIO				1	1	1	55	2			\N	2021-10-04 18:16:21	2021-10-04 18:16:21	'2':7 'antoni':11 'cuadern':2 'dominguez':9 'escrib':6 'espanol':8 'habl':4 'hidalg':10
575	554	LA ENERGIA	TONDA MAZON, JUAN				1	1	1	48	2			\N	2021-10-12 15:05:24	2021-10-12 15:05:24	'energi':2 'juan':5 'mazon':4 'tond':3
576	555	MAFALDA	QUINO				1	1	1	145	2			\N	2021-10-12 15:08:34	2021-10-12 15:08:56	'mafald':1 'quin':2
577	556	BIODIVERSIDAD 2	PINERO, DANIEL				1	1	1	48	2			\N	2021-10-12 15:10:24	2021-10-12 15:10:24	'2':2 'biodivers':1 'daniel':4 'piner':3
578	557	TRAVESIAS POR MEXICO	VALEK, GLORIA				1	1	1	48	2			\N	2021-10-12 15:11:15	2021-10-12 15:11:15	'glori':5 'mexic':3 'travesi':1 'valek':4
77	76	CODIGO 1: ESPANOL	YNCLAN, GABRIELA				1	1	1	50	2			\N	2021-10-04 18:17:48	2021-10-04 18:17:48	'1':2 'codig':1 'espanol':3 'gabriel':5 'ynclan':4
78	77	ESPANOL 1: SECUNDARIA	HINOJOSA , FRANCISCO				1	1	1	50	2			\N	2021-10-04 18:18:33	2021-10-04 18:18:33	'1':2 'espanol':1 'francisc':5 'hinoj':4 'secundari':3
600	580	LAS CIVILIZACIONES DEL MEDITERRANEO	LUISELLI, DANIELA				1	1	1	48	2			\N	2021-10-13 13:59:26	2021-10-13 13:59:26	'civiliz':2 'daniel':6 'luiselli':5 'mediterrane':4
601	581	LOS CUATRO ELEMENTOS	CHAMIZO, JOSE ANTONIO				1	1	1	48	2			\N	2021-10-13 14:00:46	2021-10-13 14:00:46	'antoni':6 'chamiz':4 'cuatr':2 'element':3 'jos':5
602	582	SE UN ADOLESCENTE FELIZ	MATTHEWS, ANDREW				1	1	1	48	2			\N	2021-10-13 14:01:37	2021-10-13 14:01:37	'adolescent':3 'andrew':6 'feliz':4 'matthews':5
79	78	ESPANOL 2: CUADERNO DE TRABAJO	GARCIA PELAYO , OLIVIA				1	1	1	52	2			\N	2021-10-04 18:19:33	2021-10-04 18:19:33	'2':2 'cuadern':3 'espanol':1 'garci':6 'olivi':8 'pelay':7 'trabaj':5
715	674	PARA ENTENDER EL PODER EJECUTIVO DE LOS ESTADOS UN	LLAMAS M., AGUSTIN				1	1	1	151	2			\N	2021-10-15 17:25:13	2021-10-15 17:25:13	'agustin':12 'ejecut':5 'entend':2 'llam':10 'm':11 'pod':4
619	599	EL AGUA	VALES VAZQUEZ, CARLOS				1	1	1	143	2			\N	2021-10-14 15:40:12	2021-10-14 15:40:12	'agu':2 'carl':5 'val':3 'vazquez':4
620	600	COMO MEJORAR LA ATENCION	BUCETA CANCELA, MA. JOSE				1	1	1	143	2			\N	2021-10-14 15:40:51	2021-10-14 15:40:51	'atencion':4 'bucet':5 'cancel':6 'jos':8 'ma':7 'mejor':2
621	601	ESTUDIAR MEJOR... TODO UN DEPORTE	BARREIRO GONZALEZ, PILAR				1	1	1	143	2			\N	2021-10-14 15:41:27	2021-10-14 15:41:27	'barreir':6 'deport':5 'estudi':1 'gonzalez':7 'mejor':2 'pil':8
629	609	PERSEPOLIS	SATROPI, MARJANE				1	1	1	56	2			\N	2021-10-14 16:16:27	2021-10-14 16:16:27	'marjan':3 'persepolis':1 'satropi':2
111	111	ORTOGRAFIA ACTIVA	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 13:15:54	2021-10-05 13:17:57	'activ':2 'lozan':3 'lucer':4 'ortografi':1
81	79	EL UNIVERSO DE LAS LETRAS 2: LIBRO DE EJERCICIOS P	CHAVEZ GONZALEZ, PEDRO TEOBALDO				1	1	1	65	2			\N	2021-10-04 18:24:58	2021-10-04 18:24:58	'2':6 'chavez':11 'ejercici':9 'gonzalez':12 'letr':5 'libr':7 'p':10 'pedr':13 'teobald':14 'univers':2
82	80	BASICOS ESPANOL : PRACTICAS DE LA EXPRESION ESCRIT	JAIDAR PASTOR , VALERIA				4	1	1	48	2			\N	2021-10-04 18:33:06	2021-10-04 18:33:06	'basic':1 'escrit':7 'espanol':2 'expresion':6 'jaid':8 'pastor':9 'practic':3 'valeri':10
83	81	ESPANOL 2 : LIBRO DE RECURSOS PARA EL PROFESOR	GUTIERREZ SANDOVAL, GRACIELA				1	1	1	48	2			\N	2021-10-04 18:36:55	2021-10-04 18:36:55	'2':2 'espanol':1 'graciel':11 'gutierrez':9 'libr':3 'profesor':8 'recurs':5 'sandoval':10
84	82	ACENTO 2 : CUADERNO DE TRABAJO	SANCHEZ LOZANO, CARLOS				1	1	1	56	2			\N	2021-10-04 18:37:25	2021-10-04 18:37:25	'2':2 'acent':1 'carl':8 'cuadern':3 'lozan':7 'sanchez':6 'trabaj':5
85	83	COMUNICATE EN ESPANOL 2	DIAZ DE LEON,  SANDRA				1	1	1	65	2			\N	2021-10-04 18:38:06	2021-10-04 18:38:06	'2':4 'comunicat':1 'diaz':5 'espanol':3 'leon':7 'sandr':8
770	725	EVALUACION PARA DOCENTES Y DIRECTIVOS: UN VINCULO	MARTINEZ DE OSABA, VICTORIA				1	1	1	89	2			\N	2021-10-18 12:19:19	2021-10-18 12:19:19	'direct':5 'docent':3 'evaluacion':1 'martinez':8 'osab':10 'victori':11 'vincul':7
774	729	LEER Y ESCRIBIR, EXPERIENCIA ESTETICA Y COGNITIVA:	TEJEDA, ANA LUISA				1	1	1	89	2			\N	2021-10-18 12:22:01	2021-10-18 12:22:01	'ana':9 'cognit':7 'escrib':3 'estet':5 'experient':4 'leer':1 'luis':10 'tejed':8
775	730	EL FRACASO ESCOLAR: FACTORES QUE CONDICIONAN EL DE	PONCE LEON, OLIVIA				1	1	1	89	2			\N	2021-10-18 12:22:43	2021-10-18 12:22:43	'condicion':6 'escol':3 'factor':4 'fracas':2 'leon':10 'olivi':11 'ponc':9
776	731	LA PREGUNTA COMO INTERVENCION COGNITIVA: ¿QUE? ¿CO	GARCIA CANCINO, EVERARDO				1	1	1	89	2			\N	2021-10-18 12:23:18	2021-10-18 12:23:18	'cancin':9 'co':7 'cognit':5 'everard':10 'garci':8 'intervencion':4 'pregunt':2
777	732	COMO SOBREVIVIR A ENLACE Y FORTALECERSE EN EL INTE	ROMAN, SERGIO				1	1	1	89	2			\N	2021-10-18 12:23:50	2021-10-18 12:23:50	'enlac':4 'fortalec':6 'inte':9 'rom':10 'sergi':11 'sobreviv':2
780	735	EDUCACION DIFERENCIADA: LA PROPUESTA DE CAROL ANN	DURAN, VERONICA				1	1	1	89	2			\N	2021-10-18 12:26:29	2021-10-18 12:26:29	'ann':7 'carol':6 'diferenci':2 'dur':8 'educacion':1 'propuest':4 'veron':9
781	736	DIALOGO 1: FORMACION CIVICA Y ETICA. SECUNDARIA SE	HERNANDEZ AVENDANO, MAITE				1	1	1	50	2			\N	2021-10-18 12:27:13	2021-10-18 12:27:13	'1':2 'avendan':10 'civic':4 'dialog':1 'etic':6 'formacion':3 'hernandez':9 'mait':11 'secundari':7
782	737	ETICA Y VALORES IETICA Y VALORES I	ESCOBAR VALENZUELA, GUSTAVO				1	1	1	67	2			\N	2021-10-18 12:28:01	2021-10-18 12:28:01	'escob':8 'etic':1 'gustav':10 'i':7 'ietic':4 'valenzuel':9 'valor':3,6
784	739	ETICA Y VALORES I: ENFOQUE POR COMPETENCIAS	GOMEZ-NAVAS CHAPA, LEONARDO				1	1	1	61	2			\N	2021-10-18 12:30:30	2021-10-18 12:30:30	'chap':11 'competent':7 'enfoqu':5 'etic':1 'gomez':9 'gomez-nav':8 'i':4 'leonard':12 'nav':10 'valor':3
86	84	GUIA DIDACTICA: ESPANOL CODIGO 2 SECUNDARIA	OCHOA, ADRIANA DE TERESA				1	1	1	50	2			\N	2021-10-04 18:39:30	2021-10-04 18:39:30	'2':5 'adrian':8 'codig':4 'didact':2 'espanol':3 'gui':1 'ocho':7 'secundari':6 'teres':10
87	85	ESPANOL 2	ARAGON RIVAS , MIRIAM				1	1	1	48	2			\N	2021-10-04 19:25:29	2021-10-04 19:25:29	'2':2 'aragon':3 'espanol':1 'miriam':5 'riv':4
88	86	ESPANOL 2	CARRASCO , ALMA				1	1	1	66	2			\N	2021-10-04 19:33:34	2021-10-04 19:33:34	'2':2 'alma':4 'carrasc':3 'espanol':1
89	87	ESPANOL 3 : NUEVOS HORIZONTES	ARCINIEGA RANGEL, MARIA ESTELA				1	1	1	64	2			\N	2021-10-04 19:36:08	2021-10-04 19:36:08	'3':2 'arcinieg':5 'espanol':1 'estel':8 'horizont':4 'mari':7 'nuev':3 'rangel':6
737	692	EL  PERSEGUIDOR	CORTAZAR, JULIO				1	1	1	6	2			\N	2021-10-15 18:15:48	2021-10-15 18:15:48	'cortaz':3 'juli':4 'perseguidor':2
100	99	ESPANOL 3	LOZANO , LUCERO				1	1	1	62	2			\N	2021-10-05 12:51:54	2021-10-05 12:51:54	'3':2 'espanol':1 'lozan':3 'lucer':4
110	109	ORTOGRAFIA APLICADA A LA REDACCION	ANGELES MANRIQUEZ, ELFEGO				1	1	1	69	2			\N	2021-10-05 12:59:11	2021-10-05 12:59:11	'angel':6 'aplic':2 'elfeg':8 'manriquez':7 'ortografi':1 'redaccion':5
91	89	ESPANOL CODIGO 3	TELLO GARRIDO, AGUSTIN ROMEO				1	1	1	50	2			\N	2021-10-04 19:40:15	2021-10-05 12:44:50	'3':3 'agustin':6 'codig':2 'espanol':1 'garr':5 'rome':7 'tell':4
92	91	ESPANOL 2 : LIBRO DE EJERCICIOS	ABARCA LAREDO, BERTHA LILIA				1	1	1	48	2			\N	2021-10-05 12:47:10	2021-10-05 12:47:10	'2':2 'abarc':6 'berth':8 'ejercici':5 'espanol':1 'lared':7 'libr':3 'lili':9
93	92	ESPANOL 3	CARRASCO, ALMA				1	1	1	66	2			\N	2021-10-05 12:47:44	2021-10-05 12:47:44	'3':2 'alma':4 'carrasc':3 'espanol':1
94	93	EL ESPANOL DE HOY 3	HERRERA SUASTEGUI , OMAR				1	1	1	65	2			\N	2021-10-05 12:48:21	2021-10-05 12:48:21	'3':5 'espanol':2 'herrer':6 'hoy':4 'omar':8 'suastegui':7
793	748	ADOLESCENTES EN CONFLICTO: COMO RECUPERAR LA ARMON	MOLINERO, CARLOS				1	1	1	169	2			\N	2021-10-18 12:44:39	2021-10-18 12:45:14	'adolescent':1 'armon':7 'carl':9 'conflict':3 'moliner':8 'recuper':5
95	94	OTOGRAFIA MODERNA 3	GUTIERREZ GOMEZ, FELIPE				1	1	1	66	2			\N	2021-10-05 12:48:50	2021-10-05 12:48:50	'3':3 'felip':6 'gomez':5 'gutierrez':4 'modern':2 'otografi':1
96	95	ESPANOL 3 : LIBRO DE RECURSOS PARA EL PROFESOR	GUTIERREZ SANDOVAL , GRACIELA				1	1	1	48	2			\N	2021-10-05 12:49:19	2021-10-05 12:49:19	'3':2 'espanol':1 'graciel':11 'gutierrez':9 'libr':3 'profesor':8 'recurs':5 'sandoval':10
97	96	ESPANOL 3: CUADERNO DE TRABAJO EDUCACION SECUNDARI	FERNANDEZ FUENTES , MARIA ISABEL				1	1	1	66	2			\N	2021-10-05 12:49:52	2021-10-05 12:49:52	'3':2 'cuadern':3 'educacion':6 'espanol':1 'fernandez':8 'fuent':9 'isabel':11 'mari':10 'secundari':7 'trabaj':5
98	97	ORTOGRAFIA SIN REGLAS 3 : TERCER GRADO DE SECUNDARIA	MONDADA , ANA VICTORIA				1	1	1	65	2			\N	2021-10-05 12:50:39	2021-10-05 12:50:39	'3':4 'ana':10 'grad':6 'mond':9 'ortografi':1 'regl':3 'secundari':8 'terc':5 'victori':11
99	98	NUEVO ESPANOL ACTIVO 3	LOZANO , LUCERO				1	1	1	62	2			\N	2021-10-05 12:51:18	2021-10-05 12:51:18	'3':4 'activ':3 'espanol':2 'lozan':5 'lucer':6 'nuev':1
102	102	PARA ESCRIBIRTE MEJOR 2 : ORTOGRAFIA Y REDACCION	MAQUEO, ANA MARIA				1	1	1	57	2			\N	2021-10-05 12:54:01	2021-10-05 12:54:01	'2':4 'ana':9 'escribirt':2 'maque':8 'mari':10 'mejor':3 'ortografi':5 'redaccion':7
738	693	EL FANTASMA DE CANTERVILLE	WILDE, OSCAR				1	1	1	6	2			\N	2021-10-15 18:16:46	2021-10-15 18:16:46	'cantervill':4 'fantasm':2 'oscar':6 'wild':5
478	466	CIENCIAS FORENSES	PLATT, RICHARD				1	1	1	48	2			\N	2021-10-08 19:33:58	2021-10-08 19:33:58	'cienci':1 'forens':2 'platt':3 'richard':4
479	467	PLAGAS Y EPIDEMIAS	WALKER, RICHARD				1	1	1	48	2			\N	2021-10-08 19:34:27	2021-10-08 19:34:27	'epidemi':3 'plag':1 'richard':5 'walk':4
480	468	PIRATAS Y TRAFICANTES	BUTTERFIELD, MOIRA				1	1	1	48	2			\N	2021-10-08 19:35:54	2021-10-08 19:35:54	'butterfield':4 'moir':5 'pirat':1 'trafic':3
481	469	FORTALEZAS Y CASTILLOS	ADAMS, SIMON				1	1	1	48	2			\N	2021-10-08 19:36:24	2021-10-08 19:36:24	'adams':4 'castill':3 'fortalez':1 'simon':5
471	459	HISTORIA DEL SIGLO XX TIME	RICART, JOAN				1	1	1	109	2			\N	2021-10-08 19:04:12	2021-10-08 19:04:12	'histori':1 'joan':7 'ricart':6 'sigl':3 'tim':5 'xx':4
751	706	ARTES PLASTICAS 1	RAMIREZ LOPEZ, CARMEN				1	1	1	48	2			\N	2021-10-15 18:28:10	2021-10-15 18:28:10	'1':3 'artes':1 'carm':6 'lopez':5 'plastic':2 'ramirez':4
108	107	ORTOGRAFIA SIN REGLAS 1: PRIMER GRADO DE SECUNDARIA	MONDADA , ANA VICTORIA				1	1	1	65	2			\N	2021-10-05 12:57:00	2021-10-05 12:57:00	'1':4 'ana':10 'grad':6 'mond':9 'ortografi':1 'prim':5 'regl':3 'secundari':8 'victori':11
472	460	ESPIAS	GIFFORD, CLIVE				1	1	1	48	2			\N	2021-10-08 19:04:42	2021-10-08 19:04:42	'cliv':3 'espi':1 'gifford':2
107	106	NUEVA ORTOGRAFIA 1	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 12:56:25	2021-10-05 13:18:20	'1':3 'lozan':4 'lucer':5 'nuev':1 'ortografi':2
105	105	DESTREZA ORTOGRAFICA 1	MORENO MANZUR, SONIA DEL CARMEN				1	1	1	48	2			\N	2021-10-05 12:55:57	2021-10-05 13:18:28	'1':3 'carm':8 'destrez':1 'manzur':5 'moren':4 'ortograf':2 'soni':6
104	104	NUEVA ORTOGRAFIA ACTIVA 2	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 12:55:17	2021-10-05 13:18:38	'2':4 'activ':3 'lozan':5 'lucer':6 'nuev':1 'ortografi':2
103	103	PARA ESCRIBIRTE MEJOR 3 : ORTOGRAFIA Y REDACCION	MAQUEO, ANA MARIA				1	1	1	57	2			\N	2021-10-05 12:54:31	2021-10-05 13:18:52	'3':4 'ana':9 'escribirt':2 'maque':8 'mari':10 'mejor':3 'ortografi':5 'redaccion':7
845	798	ENIGMAS Y MISTERIOS DEL CRISTIANISMO	MASIAVERICAT, CONCEPCION				1	1	1	188	2			\N	2021-10-18 18:55:31	2021-10-18 18:55:52	'concepcion':7 'cristian':5 'enigm':1 'masiavericat':6 'misteri':3
846	799	EL ATLAS DE LAS RELIGIONES	DENIS, JEAN PIERRE				1	1	1	59	2			\N	2021-10-18 18:56:24	2021-10-18 18:56:24	'atlas':2 'denis':6 'jean':7 'pierr':8 'religion':5
864	817	DESARROLLO HUMANO	PAPALIA, DIANE E.				1	1	1	61	2			\N	2021-10-18 19:37:52	2021-10-18 19:37:52	'desarroll':1 'dian':4 'human':2 'papali':3
16	15	LECTURA  Y REDACCION DE TEXTOS	ZACAULA, FRIDA ; ROJAS , ELIZABETH ; VITAL, ALBERT				1	1	1	48	2			\N	2021-10-04 14:17:08	2021-10-04 14:17:08	'albert':11 'elizabeth':9 'frid':7 'lectur':1 'redaccion':3 'roj':8 'text':5 'vital':10 'zacaul':6
880	833	INVENTARIO	BENEDETTI, MARIO				1	1	1	196	2			\N	2021-10-19 12:33:14	2021-10-19 12:33:44	'benedetti':2 'inventari':1 'mari':3
1	1	TALLER DE LECTURA Y REDACCION 1	SANCHEZ AMADOR, MARIA DE LA PAZ CARMEN			461.52 S211 2006	1	1	1	49	2			\N	2021-10-01 20:46:32	2021-10-04 12:40:09	'1':6 'amador':8 'carm':13 'lectur':3 'mari':9 'paz':12 'redaccion':5 'sanchez':7 'tall':1
2	2	ESPANOL 3	ALEGRIA, DE LA COLINA MARGARITA				1	1	1	48	2			\N	2021-10-04 12:41:14	2021-10-04 12:41:14	'3':2 'alegri':3 'colin':6 'espanol':1 'margarit':7
3	3	CONTEXTO 1 ESPANOL ; ALMA YOLANDA CASTILLO, RITA F	CASTILLO, ALMA YOLANDA				1	1	1	50	2			\N	2021-10-04 12:48:55	2021-10-04 12:48:55	'1':2 'alma':4,10 'castill':6,9 'context':1 'espanol':3 'f':8 'rit':7 'yoland':5,11
882	835	LEYENDAS MEXICANAS DE TODOS LOS TIEMPOS: PREHISPAN	GONZALEZ OLIVO, MARISOL				1	1	1	133	2			\N	2021-10-19 12:35:49	2021-10-19 12:35:49	'gonzalez':8 'leyend':1 'marisol':10 'mexican':2 'oliv':9 'prehisp':7 'tiemp':6
883	836	24 POETAS LATINOAMERICANOS	SERRANO, FRANCISCO				1	1	1	197	2			\N	2021-10-19 12:36:56	2021-10-19 12:38:42	'24':1 'francisc':5 'latinoamerican':3 'poet':2 'serran':4
884	837	ANTOLOGIA DE TEATRO Y POESIA: LITERATURA 2	MERODIO LOPEZ, CLEMENTE				1	1	1	48	2			\N	2021-10-19 12:41:31	2021-10-19 12:41:31	'2':7 'antologi':1 'clement':10 'literatur':6 'lopez':9 'merodi':8 'poesi':5 'teatr':3
4	4	ESPANOL 3 SECUNDARIA ELIZABETH HERNANDEZ ALVIDREZ	HERNANDEZ, ALVIDRES ELIZABETH				1	1	1	51	2			\N	2021-10-04 12:50:17	2021-10-04 12:50:17	'3':2 'alvidr':8 'alvidrez':6 'elizabeth':4,9 'espanol':1 'hernandez':5,7 'secundari':3
5	5	UN MONTON DE LIBROS. TALLER LITERARIO PARA SECUNDA	LOPEZ VILLAMAR, EDUARDO RENE				1	1	1	52	2			\N	2021-10-04 12:51:04	2021-10-04 12:51:04	'eduard':11 'libr':4 'literari':6 'lopez':9 'monton':2 'ren':12 'secund':8 'tall':5 'villam':10
17	16	PARA LEERTE MEJOR	CORONADO, JUAN				1	1	1	57	2			\N	2021-10-04 14:46:03	2021-10-04 14:46:03	'coron':4 'juan':5 'leert':2 'mejor':3
19	18	CONTEXTO 2 ESPANOL GUIA DIDACTICA DEL MAESTRO	JUAREZ, PEREZ ROSA ISELA				1	1	1	50	2			\N	2021-10-04 14:47:34	2021-10-04 14:47:34	'2':2 'context':1 'didact':5 'espanol':3 'gui':4 'isel':11 'juarez':8 'maestr':7 'perez':9 'ros':10
109	108	DESTREZA ORTOGRAFICA 3	DIAZ CHAVEZ, OSCAR				1	1	1	48	2			\N	2021-10-05 12:58:20	2021-10-05 13:18:11	'3':3 'chavez':5 'destrez':1 'diaz':4 'ortograf':2 'oscar':6
20	20	GUIA DIDACTICA: ESPANOL 2 EJERCICIOS	GUIA DIDACTICA: ESPANOL 2 EJERCICIOS				1	1	1	59	2			\N	2021-10-04 14:48:07	2021-10-04 14:48:07	'2':4,9 'didact':2,7 'ejercici':5,10 'espanol':3,8 'gui':1,6
21	21	CONTEXTO 1 ESPANOL GUIA DIDACTICA DEL MAESTRO	CUEVAS, GARCIA ALICIA				1	1	1	50	2			\N	2021-10-04 14:48:37	2021-10-04 14:48:37	'1':2 'alici':10 'context':1 'cuev':8 'didact':5 'espanol':3 'garci':9 'gui':4 'maestr':7
711	671	PARA ENTENDER LOS DERECHOS HUMANOS EN MEXICO	ALVAREZ ICAZA LONGORIA, EMILIO				1	1	1	151	2			\N	2021-10-15 17:20:22	2021-10-15 17:20:22	'alvarez':8 'derech':4 'emili':11 'entend':2 'human':5 'icaz':9 'longori':10 'mexic':7
7	7	ESPANOL 2: SECUNDARIA INTEGRAL	GARZA, ESTELA				1	1	1	48	2			\N	2021-10-04 14:11:38	2021-10-04 14:11:38	'2':2 'espanol':1 'estel':6 'garz':5 'integral':4 'secundari':3
812		EL MUNDO DE LOS ADOLESCENTES	IZQUIERDO MORENO, CIRIACO				1	1	1	60	2			\N	2021-10-18 13:36:41	2021-10-18 13:36:41	'adolescent':5 'ciriac':8 'izquierd':6 'moren':7 'mund':2
9	9	ETICA Y VALORES	ESCOBAR, GUSTAVO				1	1	1	53	2			\N	2021-10-04 14:12:52	2021-10-04 14:12:52	'escob':4 'etic':1 'gustav':5 'valor':3
10	10	TALLER DE LECTURA Y REDACCION 1	SANCHEZ, PEREZ ARSENIO				1	1	1	54	2			\N	2021-10-04 14:13:26	2021-10-04 14:13:26	'1':6 'arseni':9 'lectur':3 'perez':8 'redaccion':5 'sanchez':7 'tall':1
11	11	REDACCION 1	FOURNIER, MARCOS				1	1	1	54	2			\N	2021-10-04 14:13:52	2021-10-04 14:13:52	'1':2 'fourni':3 'marc':4 'redaccion':1
12	12	LECTURA Y REDACCION CON ANALISIS LITERARIO	PINEDA, RAMIREZ MARIA IGNACIA				1	1	1	55	2			\N	2021-10-04 14:14:26	2021-10-04 14:14:26	'analisis':5 'ignaci':10 'lectur':1 'literari':6 'mari':9 'pined':7 'ramirez':8 'redaccion':3
13	13	DICCIONARIO DE LA LENGUA ESPANOLA. BASICO	.				1	1	1	56	2			\N	2021-10-04 14:15:09	2021-10-04 14:15:09	'basic':6 'diccionari':1 'espanol':5 'lengu':4
14	14	RETOS COMPRENSION LECTORA	OCHOA,ADRIANA DE TERESA				1	1	1	48	2			\N	2021-10-04 14:15:37	2021-10-04 14:15:37	'adrian':5 'comprension':2 'lector':3 'ocho':4 'ret':1 'teres':7
923	875	ARTICULACION	LUCHETTI, ELENA				1	1	1	207	2			\N	2021-10-21 12:34:31	2021-10-21 12:34:40	'articulacion':1 'elen':3 'luchetti':2
929	881	HERE, THERE AND EVERYWHERE: TODO ACERCA DE LOS BEA	VAZQUEZ LOZANO. GUSTAVO				1	1	1	159	2			\N	2021-10-21 12:39:06	2021-10-21 12:40:11	'acerc':6 'and':3 'bea':9 'everywher':4 'gustav':12 'her':1 'lozan':11 'ther':2 'vazquez':10
930	882	UNA VISITA AL MUSEO NACIONAL DE HISTORIA CASTILLO	FRANCO, MARIA TERESA				1	1	1	208	2			\N	2021-10-21 12:42:47	2021-10-21 12:43:26	'castill':8 'franc':9 'histori':7 'mari':10 'muse':4 'nacional':5 'teres':11 'visit':2
932	883	UNA VISITA AL PALACIO DE BELLAS ARTES	FRANCO, MARIA TERESA				1	1	1	208	2			\N	2021-10-21 12:48:17	2021-10-21 12:48:17	'artes':7 'bell':6 'franc':8 'mari':9 'palaci':4 'teres':10 'visit':2
398	389	ATLAS DE HISTORIA DE MEXICO	GONZALEZ DE LEMOINE, GUILLERMINA				1	1	1	117	2			\N	2021-10-06 18:48:41	2021-10-26 18:20:00	'atlas':1 'gonzalez':6 'guillermin':9 'histori':3 'lemoin':8 'mexic':5
796	751	ETICA DE URGENCIA	SAVATER, FERNANDO				1	1	1	10	2			\N	2021-10-18 12:50:19	2021-10-28 19:41:27	'etic':1 'fern':5 'savat':4 'urgenci':3
795	750	ETICA PARA  AMADOR	SAVATER, FERNANDO				1	1	1	10	2			\N	2021-10-18 12:49:48	2021-10-28 19:42:21	'amador':3 'etic':1 'fern':5 'savat':4
794	749	ETICA PARA AMADOR	SAVATER, FERNANDO				1	1	1	10	2			\N	2021-10-18 12:46:07	2021-10-28 19:42:39	'amador':3 'etic':1 'fern':5 'savat':4
113	114	COMPETENCIAS LECTORAS 3 : LECTURAS DE COMPRENSION	BELLO C., OSCAR HENYER				1	1	1	56	2			\N	2021-10-05 13:22:49	2021-10-05 13:22:49	'3':3 'bell':7 'c':8 'competent':1 'comprension':6 'heny':10 'lector':2 'lectur':4 'oscar':9
114	115	DETECTIVES ORTOGRAFICOS 1: PRIMER GRADO	SILVA MELENDEZ, LETICIA				1	1	1	64	2			\N	2021-10-05 13:23:25	2021-10-05 13:23:37	'1':3 'detectiv':1 'grad':5 'letici':8 'melendez':7 'ortograf':2 'prim':4 'silv':6
115	117	DESTREZA ORTOGRAFICA 2	MONTEJO MANZUR, SONIA DEL CARMEN				1	1	1	48	2			\N	2021-10-05 13:44:11	2021-10-05 13:44:11	'2':3 'carm':8 'destrez':1 'manzur':5 'montej':4 'ortograf':2 'soni':6
117	118	ORTOGRAFIA : CUADERNO DE ACTIVIDADES	GARCIA CARDENAS, LIDIA				1	1	1	71	2			\N	2021-10-05 13:53:05	2021-10-05 13:53:05	'activ':4 'carden':6 'cuadern':2 'garci':5 'lidi':7 'ortografi':1
118	119	PARA ESCRIBIRTE MEJOR 1: ORTOGRAFIA Y REDACCION	MAQUEO, ANA MARIA				1	1	1	57	2			\N	2021-10-05 13:53:51	2021-10-05 13:53:51	'1':4 'ana':9 'escribirt':2 'maque':8 'mari':10 'mejor':3 'ortografi':5 'redaccion':7
119	121	TALLER DE LECTURA Y REDACCION 2	JAUREGUI RODRIGUEZ, ERNESTO				1	1	1	48	2			\N	2021-10-05 13:54:33	2021-10-05 13:54:33	'2':6 'ernest':9 'jauregui':7 'lectur':3 'redaccion':5 'rodriguez':8 'tall':1
120	122	TALLER DE LECTURA Y REDACCION 2 : BACHILLERATO GEN	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 13:55:57	2021-10-05 13:55:57	'2':6 'bachillerat':7 'gen':8 'lectur':3 'lozan':9 'lucer':10 'redaccion':5 'tall':1
121	123	TALLER DE LECTURA Y REDACCION	ZARZAR CHARUR, CARLOS				1	1	1	53	2			\N	2021-10-05 14:11:40	2021-10-05 14:11:40	'carl':8 'charur':7 'lectur':3 'redaccion':5 'tall':1 'zarz':6
122	124	TEXTOS LITERARIOS : ANALISIS Y COMENTARIOS	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 14:15:47	2021-10-05 14:15:47	'analisis':3 'comentari':5 'literari':2 'lozan':6 'lucer':7 'text':1
123	125	LABERINTO DE PALABRAS : ESTRATEGIAS DE COMPRENSION	GONZALEZ GUERRERO, LAURA VICTORIANA				1	1	1	64	2			\N	2021-10-05 14:57:22	2021-10-05 14:57:22	'comprension':6 'estrategi':4 'gonzalez':7 'guerrer':8 'laberint':1 'laur':9 'palabr':3 'victorian':10
124	126	GEOGRAFIA 1 DE MEXICO Y DEL MUNDO	RODRIGUEZ HELU, LETICIA				1	1	1	48	2			\N	2021-10-05 14:57:57	2021-10-05 14:57:57	'1':2 'geografi':1 'helu':9 'letici':10 'mexic':4 'mund':7 'rodriguez':8
125	127	GEOGRAFIA DE MEXICO Y DEL MUNDO 1	ALVAREZ, BERENICE				1	1	1	48	2			\N	2021-10-05 14:58:44	2021-10-05 14:58:44	'1':7 'alvarez':8 'berenic':9 'geografi':1 'mexic':3 'mund':6
126	128	TALLER DE LECTURA Y REDACCION 1	ZARZAR, CHARUR CARLOS				1	1	1	53	2			\N	2021-10-05 14:59:25	2021-10-05 14:59:25	'1':6 'carl':9 'charur':8 'lectur':3 'redaccion':5 'tall':1 'zarz':7
127	130	TALLER DE LECTURA Y REDACCION : SEGUNDO SEMESTRE	LOPEZ CANO, JOSE LUIS				1	1	1	52	2			\N	2021-10-05 14:59:59	2021-10-05 14:59:59	'can':9 'jos':10 'lectur':3 'lopez':8 'luis':11 'redaccion':5 'segund':6 'semestr':7 'tall':1
128	131	TALLER DE LECTURA Y REDACCION 1	ARGUDIN Y VAZQUEZ YOLANDA				1	1	1	52	2			\N	2021-10-05 15:01:03	2021-10-05 15:01:03	'1':6 'argudin':7 'lectur':3 'redaccion':5 'tall':1 'vazquez':9 'yoland':10
129	132	REDACCION AVANZADA	SANCHEZ, ARSENIO				1	1	1	54	2			\N	2021-10-05 15:03:15	2021-10-05 15:03:15	'arseni':4 'avanz':2 'redaccion':1 'sanchez':3
130	133	TALLER DE LECTURA Y REDACCION 1	TORRE ZERMENO, FRANCISCO DE LA				1	1	1	61	2			\N	2021-10-05 15:03:46	2021-10-05 15:03:46	'1':6 'francisc':9 'lectur':3 'redaccion':5 'tall':1 'torr':7 'zermen':8
131	134	RAICES DE LA SABIDURIA	BUSS MITCHEL, HELLEN				1	1	1	61	2			\N	2021-10-05 15:04:09	2021-10-05 15:04:09	'buss':5 'hell':7 'mitchel':6 'raic':1 'sabiduri':4
132	135	TALLER INTEGRAL DE LECTURA Y REDACCION 1: JUVENTUD	DOMINGUEZ HIDALGO, ANTONIO				1	1	1	64	2			\N	2021-10-05 15:04:47	2021-10-05 15:04:47	'1':7 'antoni':11 'dominguez':9 'hidalg':10 'integral':2 'juventud':8 'lectur':4 'redaccion':6 'tall':1
739	694	EL ETERNO FEMENINO: FARSA	CASTELLANOS, ROSARIO				1	1	1	16	2			\N	2021-10-15 18:17:14	2021-10-15 18:17:14	'castellan':5 'etern':2 'fars':4 'femenin':3 'rosari':6
134	136	TALLER INTEGRAL DE LECTURA Y REDACCION 2: JUVENTUD	DOMIGUEZ HIDALGO, ANTONIO				1	1	1	64	2			\N	2021-10-05 15:05:18	2021-10-05 15:05:18	'2':7 'antoni':11 'domiguez':9 'hidalg':10 'integral':2 'juventud':8 'lectur':4 'redaccion':6 'tall':1
135	137	APLIQUE LA GRAMATICA:MENSAJES IDIOMATICOS 2	BASULTO, HILDA				1	1	1	60	2			\N	2021-10-05 15:05:45	2021-10-05 15:05:45	'2':6 'apliqu':1 'basult':7 'gramat':3 'hild':8 'idiomat':5 'mensaj':4
136	140	LITERATURA MEXICANA : CON NOTAS DE LITERATURA  HIS	MILLAN, MARIA DEL CARMEN				1	1	1	52	2			\N	2021-10-05 15:06:31	2021-10-05 15:06:31	'carm':11 'his':7 'literatur':1,6 'mari':9 'mexican':2 'mill':8 'not':4
137	141	LITERATURA 1	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 15:08:48	2021-10-05 15:08:48	'1':2 'literatur':1 'lozan':3 'lucer':4
162	176	ESPANOL:VERSION PRELIMINAR	MAYORGA CORTES,LUCIO				1	1	1	64	2			\N	2021-10-05 15:58:34	2021-10-05 15:58:34	'cort':5 'espanol':1 'luci':6 'mayorg':4 'prelimin':3 'version':2
138	142	NUEVAS LECTURAS PARA ADOLESCENTES 2	LOZANO, LUCERO				1	1	1	70	2			\N	2021-10-05 15:09:22	2021-10-05 15:09:22	'2':5 'adolescent':4 'lectur':2 'lozan':6 'lucer':7 'nuev':1
139	144	LITERATURA DE MEXICO E IBEROAMERICA	FERNANDEZ CONTRERAS, ROSALBA				1	1	1	61	2			\N	2021-10-05 15:09:57	2021-10-05 15:09:57	'contrer':7 'fernandez':6 'iberoamer':5 'literatur':1 'mexic':3 'rosalb':8
140	145	LITERATURA UNIVERSAL	OCHOA, ADRIANA MARIA DE TERESA				1	1	1	61	2			\N	2021-10-05 15:13:59	2021-10-05 15:13:59	'adrian':4 'literatur':1 'mari':5 'ocho':3 'teres':7 'universal':2
141	146	LITERATURA MEXICANA E IBEROAMERICANA	CELORIO, GONZALO				1	1	1	48	2			\N	2021-10-05 15:14:39	2021-10-05 15:14:39	'celori':5 'gonzal':6 'iberoamerican':4 'literatur':1 'mexican':2
142	147	RITMO, METRICA Y RIMA : EL VERSO EN ESPANOL	VALENCIA  MORALES, HENOC				1	1	1	60	2			\N	2021-10-05 15:15:59	2021-10-05 15:15:59	'espanol':8 'henoc':11 'metric':2 'moral':10 'rim':4 'ritm':1 'valenci':9 'vers':6
758	713	ARTES Y OFICIOS EN LA NUEVA ESPANA	GOMEZ MARTINEZ, ANA				1	1	1	72	2			\N	2021-10-15 18:41:14	2021-10-15 18:41:14	'ana':10 'artes':1 'espan':7 'gomez':8 'martinez':9 'nuev':6 'ofici':3
144	148	LITERATURA 1	LUCERO SANCHEZ, MARTHA ELENA				1	1	1	48	2			\N	2021-10-05 15:17:30	2021-10-05 15:17:30	'1':2 'elen':6 'literatur':1 'lucer':3 'marth':5 'sanchez':4
145	149	LITERATURA 2	VILLASENOR LOPEZ, VICTORIA YOLANDA				1	1	1	49	2			\N	2021-10-05 15:18:10	2021-10-05 15:18:10	'2':2 'literatur':1 'lopez':4 'victori':5 'villasenor':3 'yoland':6
146	150	ETICA Y VALORES 1	NAVARRO CRUZ, RUTH				1	1	1	49	2			\N	2021-10-05 15:19:14	2021-10-05 15:19:14	'1':4 'cruz':6 'etic':1 'navarr':5 'ruth':7 'valor':3
147	151	NUEVA INICIACION A LAS ESTRUCTURAS LITERARIAS Y SU	DOMINGUEZ HIDALGO, ANTONIO				1	1	1	71	2			\N	2021-10-05 15:20:49	2021-10-05 15:20:49	'antoni':11 'dominguez':9 'estructur':5 'hidalg':10 'iniciacion':2 'literari':6 'nuev':1
716	675	MUJERES MURALISTAS DEL MUSEO NACIONAL DE ANTROPOLO	HAMMER, MARTHA				1	1	1	152	2			\N	2021-10-15 17:25:58	2021-10-15 17:26:37	'antropol':7 'hamm':8 'marth':9 'mujer':1 'mural':2 'muse':4 'nacional':5
149	152	LITERATURA 2 : BACHILLERATO GENERAL	LOZANO, LUCERO				1	1	1	70	2			\N	2021-10-05 15:21:56	2021-10-05 15:21:56	'2':2 'bachillerat':3 'general':4 'literatur':1 'lozan':5 'lucer':6
150	153	LITERATURA 2	MIR ELIZONDO DANIEL				1	1	1	48	2			\N	2021-10-05 15:24:10	2021-10-05 15:24:10	'2':2 'daniel':5 'elizond':4 'literatur':1 'mir':3
151	154	CAMINOS DEL ESPANOL 3: SECUNDARIA	ARAGON RIVAS, MIRIAM				1	1	1	48	2			\N	2021-10-05 15:24:45	2021-10-05 15:24:45	'3':4 'aragon':6 'camin':1 'espanol':3 'miriam':8 'riv':7 'secundari':5
152	159	DIBUJO	BRETON ARREDONDO, JOSE LUIS				1	1	1	49	2			\N	2021-10-05 15:25:10	2021-10-05 15:25:10	'arredond':3 'breton':2 'dibuj':1 'jos':4 'luis':5
153	161	HISTORIA DEL ARTE II: BACHILLERATO GENERAL	LOZANO FUENTES, JOSE MANUEL				1	1	1	67	2			\N	2021-10-05 15:25:42	2021-10-05 15:25:42	'arte':3 'bachillerat':5 'fuent':8 'general':6 'histori':1 'ii':4 'jos':9 'lozan':7 'manuel':10
154	163	ARTES PLASTICAS : EL LENGUAJE DE LAS ARTES : EXPRE	SERRANO LIMON, MARIA ISABEL				1	1	1	75	2			\N	2021-10-05 15:34:13	2021-10-05 15:34:13	'artes':1,7 'expre':8 'isabel':12 'lenguaj':4 'limon':10 'mari':11 'plastic':2 'serran':9
155	164	MUSICA: EL LENGUAJE DE LAS ARTES : EXPRESION Y APR	JIMENEZ GUZMAN, MARIA DEL CARMEN				1	1	1	75	2			\N	2021-10-05 15:34:53	2021-10-05 15:34:53	'apr':9 'artes':6 'carm':14 'expresion':7 'guzm':11 'jimenez':10 'lenguaj':3 'mari':12 'music':1
156	165	HISTORIA DE MEXICO 1	FLORES RANGEL, JUAN JOSE				1	1	1	54	2			\N	2021-10-05 15:35:52	2021-10-05 15:35:52	'1':4 'flor':5 'histori':1 'jos':8 'juan':7 'mexic':3 'rangel':6
157	169	CIENCIAS 1:BIOLOGIA I,EDICION PREELIMINAR	GUILLEN RODRIGUEZ,FEDRO CARLOS				1	1	1	48	2			\N	2021-10-05 15:36:17	2021-10-05 15:36:17	'1':2 'biologi':3 'carl':10 'cienci':1 'edicion':5 'fedr':9 'guill':7 'i':4 'preelimin':6 'rodriguez':8
158	170	BIOLOGIA GENERAL	CERVANTES, MARTA				1	1	1	53	2			\N	2021-10-05 15:39:50	2021-10-05 15:39:50	'biologi':1 'cervant':3 'general':2 'mart':4
159	171	BIOLOGIA 2	PEREDO JAIME, RICARDO C.				1	1	1	52	2			\N	2021-10-05 15:52:07	2021-10-05 15:52:07	'2':2 'biologi':1 'c':6 'jaim':4 'pered':3 'ricard':5
160	174	BIOLOGIA	SOLOMON,ELDRA P.				1	1	1	61	2			\N	2021-10-05 15:56:48	2021-10-05 15:56:48	'biologi':1 'eldra':3 'p':4 'solomon':2
161	175	ESPANOL 1	HERNANDEZ BARROS,ALEJANDRA				1	1	1	48	2			\N	2021-10-05 15:57:42	2021-10-05 15:57:42	'1':2 'alejandr':5 'barr':4 'espanol':1 'hernandez':3
163	177	ESPANOL 1NUEVOS HORIZONTES: VERSION PRELIMINAR	ARCINIEGA RANGEL,MA. ESTELA				1	1	1	64	2			\N	2021-10-05 15:59:11	2021-10-05 15:59:11	'1nuevos':2 'arcinieg':6 'espanol':1 'estel':9 'horizont':3 'ma':8 'prelimin':5 'rangel':7 'version':4
164	178	ESPANOL 2 : VERSION PRELIMINAR	MAYORGA CORTES, LUCIO				1	1	1	64	2			\N	2021-10-05 16:00:05	2021-10-05 16:00:05	'2':2 'cort':6 'espanol':1 'luci':7 'mayorg':5 'prelimin':4 'version':3
165	179	ATLAS DE HISTORIA DE AMERICA	GOMEZ MENDEZ,SERGIO ORLANDO				1	1	1	57	2			\N	2021-10-05 16:00:35	2021-10-05 16:00:35	'amer':5 'atlas':1 'gomez':6 'histori':3 'mendez':7 'orland':9 'sergi':8
166	180	DICCIONARIO DE COMPUTACION	FREEDMAN, ALAN				1	1	1	61	2			\N	2021-10-05 16:01:02	2021-10-05 16:01:02	'alan':5 'computacion':3 'diccionari':1 'freedm':4
167	181	DICCIONARIO AUROCH DE FISICA Y QUIMICA.	DICCIONARIO AUROCH DE FISICA Y QUIMICA.				1	1	1	79	2			\N	2021-10-05 16:31:39	2021-10-05 16:31:39	'auroch':2,8 'diccionari':1,7 'fisic':4,10 'quimic':6,12
168	182	DICCIONARIO FILOSOFICO	EZCURDIA HIJAR, AGUSTIN				1	1	1	57	2			\N	2021-10-05 16:32:49	2021-10-05 16:32:49	'agustin':5 'diccionari':1 'ezcurdi':3 'filosof':2 'hij':4
169	183	DICCIONARIO DE MEDICINA	DABOUT, E.				1	1	1	50	2			\N	2021-10-05 16:35:38	2021-10-05 16:35:38	'dabout':4 'diccionari':1 'medicin':3
170	185	MATEMATICAS: DICCIONARIO ESENCIAL	.				1	1	1	59	2			\N	2021-10-05 16:36:05	2021-10-05 16:36:05	'diccionari':2 'esencial':3 'matemat':1
171	186	DICCIONARIO DE PSICOLOGIA Y PEDAGOGIA	.				1	1	1	81	2			\N	2021-10-05 16:37:16	2021-10-05 16:37:26	'diccionari':1 'pedagogi':5 'psicologi':3
172	187	ALGEBRA CON APLICACIONES	DIFANIS PHILLIPS, ELIZABETH				1	1	1	64	2			\N	2021-10-05 16:38:10	2021-10-05 16:38:10	'algebr':1 'aplic':3 'difanis':4 'elizabeth':6 'phillips':5
173	188	ALGEBRA ELEMENTAL	RICH, BARNETT				1	1	1	61	2			\N	2021-10-05 16:39:24	2021-10-05 16:39:24	'algebr':1 'barnett':4 'elemental':2 'rich':3
174	189	DERECHO CIVIL : PRIMER CURSO	GALINDO GARFIAS, IGNACIO				1	1	1	82	2			\N	2021-10-05 16:40:47	2021-10-05 16:40:56	'civil':2 'curs':4 'derech':1 'galind':5 'garfi':6 'ignaci':7 'prim':3
759	714	PINTURA MURAL MESOAMERICANA	ORTEGA, ANA				1	1	1	72	2			\N	2021-10-15 18:42:56	2021-10-15 18:42:56	'ana':5 'mesoamerican':3 'mural':2 'orteg':4 'pintur':1
175	190	ESTADISTICA PARA ADMINISTRACION Y ECONOMIA	LIND, DOUGLAS A.				1	1	1	83	2			\N	2021-10-05 16:41:26	2021-10-05 16:42:12	'administracion':3 'dougl':7 'economi':5 'estadist':1 'lind':6
176	191	HISTORIA DE MEXICO	DELGADO DE CANTU, GLORIA M.				1	1	1	75	2			\N	2021-10-05 16:42:40	2021-10-05 16:42:40	'cantu':6 'delg':4 'glori':7 'histori':1 'm':8 'mexic':3
348	339	EL PEQUENO LAROUSSE ILUSTRADO	SIN AUTOR				1	1	1	59	2			\N	2021-10-06 17:15:29	2021-10-06 17:15:29	'autor':6 'ilustr':4 'larouss':3 'pequen':2
178	194	EL MUNDO MODERNO Y CONTEMPORANEO	DELGADO DE CANTU, GLORIA M.				1	1	1	75	2			\N	2021-10-05 16:44:10	2021-10-05 16:44:10	'cantu':8 'contemporane':5 'delg':6 'glori':9 'm':10 'modern':3 'mund':2
743	698	LEYENDAS PREHISPANICAS MEXICANAS	MEZA, OTILIO				1	1	1	155	2			\N	2021-10-15 18:20:09	2021-10-15 18:20:09	'leyend':1 'mexican':3 'mez':4 'otili':5 'prehispan':2
179	195	HISTORIA UNIVERSAL CONTEMPORANEA	NIETO RIVERO, DOLORES				1	1	1	53	2			\N	2021-10-05 16:44:40	2021-10-05 16:44:40	'contemporane':3 'dolor':6 'histori':1 'niet':4 'river':5 'universal':2
717	676	ARTES VISUALES: CON ENFOQUE EN COMPUTACION	SERRANO FUENTES, ISABEL				1	1	1	153	2			\N	2021-10-15 17:27:13	2021-10-15 17:27:56	'artes':1 'computacion':6 'enfoqu':4 'fuent':8 'isabel':9 'serran':7 'visual':2
181	196	HISTORIA UNIVERSAL : DE LOS ORIGENES DE LA MODERNI	PEREZ MONROY, ATZIN JULIETA				1	1	1	64	2			\N	2021-10-05 16:46:13	2021-10-05 16:46:13	'atzin':11 'histori':1 'juliet':12 'moderni':8 'monroy':10 'origen':5 'perez':9 'universal':2
182	197	QUIMICA: DICCIONARIO ESENCIAL	.				1	1	1	59	2			\N	2021-10-05 16:46:37	2021-10-05 16:46:37	'diccionari':2 'esencial':3 'quimic':1
183	198	ESTADISTICA ELEMENTAL	FREUND, JHON E.				1	1	1	75	2			\N	2021-10-05 16:47:06	2021-10-05 16:47:06	'elemental':2 'estadist':1 'freund':3 'jhon':4
190	205	QUIMICA 1: CUADERNO DE EJERCICIOS	JARA REYES,SILVIA				1	1	1	59	2			\N	2021-10-05 16:58:24	2021-10-05 16:58:24	'1':2 'cuadern':3 'ejercici':5 'jar':6 'quimic':1 'rey':7 'silvi':8
184	199	ESTADISTICA ELEMENTAL: LO ESENCIAL	JHONSON, ROBERT				1	1	1	74	2			\N	2021-10-05 16:49:57	2021-10-05 16:49:57	'elemental':2 'esencial':4 'estadist':1 'jhonson':5 'robert':6
185	200	ESTADISTICA Y PROBABILIDAD: EL MUNDO DE LOS DATOS	DOMINGUEZ DOMINGUEZ,  JORGE				1	1	1	64	2			\N	2021-10-05 16:52:06	2021-10-05 16:52:06	'dat':8 'dominguez':9,10 'estadist':1 'jorg':11 'mund':5 'probabil':3
187	202	LA MODA DEL SIGLO XX	"BAUDOT, FRANCOIS     BAUDOT, FRANCOIS       BA"				1	1	1	20	2			\N	2021-10-05 16:54:47	2021-10-05 16:54:47	'ba':10 'baudot':6,8 'francois':7,9 'mod':2 'sigl':4 'xx':5
188	203	DISENO DE MODA	JENKYN JONES, SUE				1	1	1	85	2			\N	2021-10-05 16:55:40	2021-10-05 16:55:59	'disen':1 'jenkyn':4 'jon':5 'mod':3 'sue':6
189	204	MATEMATICA: RAZONAMIENTO Y APLICACIONES	MILLER,CHARLES D.				1	1	1	75	2			\N	2021-10-05 16:57:43	2021-10-05 16:57:43	'aplic':4 'charl':6 'd':7 'matemat':1 'mill':5 'razon':2
191	206	QUIMICA 1:CUADERNO DE EJERCICIOS	JARA REYES,SILVIA				1	1	1	59	2			\N	2021-10-05 16:58:59	2021-10-05 16:58:59	'1':2 'cuadern':3 'ejercici':5 'jar':6 'quimic':1 'rey':7 'silvi':8
192	207	INTRODUCCION A LA FISICA Y A LA QUIMICA : SECUNDAR	.				1	1	1	66	2			\N	2021-10-05 16:59:40	2021-10-05 16:59:40	'fisic':4 'introduccion':1 'quimic':8 'secund':9
193	208	INTRODUCCION A LA FISICA Y A LA QUIMICA:SECUNDARIA	COVARRUBIAS MARTINEZ, HECTOR				1	1	1	51	2			\N	2021-10-05 17:00:38	2021-10-05 17:00:38	'covarrubi':10 'fisic':4 'hector':12 'introduccion':1 'martinez':11 'quimic':8 'secundari':9
718	677	LOS CONCEPTOS ESENCIALES DE LAS ARTES PLASTICAS	ACHA, JUAN				1	1	1	127	2			\N	2021-10-15 17:28:53	2021-10-15 17:28:53	'acha':8 'artes':6 'concept':2 'esencial':3 'juan':9 'plastic':7
740	695	BREVE ANTOLOGIA	GARIBEY, RICARDO				1	1	1	58	2			\N	2021-10-15 18:17:54	2021-10-15 18:17:54	'antologi':2 'brev':1 'garibey':3 'ricard':4
196	210	INTRODUCCION A LA FISICA Y A LA QUIMICA	CHAMIZO GUERRERO,JOSE ANTONIO				1	1	1	52	2			\N	2021-10-05 17:09:02	2021-10-05 17:09:02	'antoni':12 'chamiz':9 'fisic':4 'guerrer':10 'introduccion':1 'jos':11 'quimic':8
244	258	PSICOLOGIA DEL JUGADOR DE FUTBOL:CON LA CABEZA HEC	ROFFE,MARCELO.				1	1	1	87	2			\N	2021-10-05 19:14:41	2021-10-05 19:17:37	'cabez':8 'futbol':5 'hec':9 'jugador':3 'marcel':11 'psicologi':1 'roff':10
197	211	FISICA I:PARA BACHILLERATO GENERAL	PEREZ MONTIEL,HECTOR				1	1	1	67	2			\N	2021-10-05 17:09:56	2021-10-05 17:09:56	'bachillerat':4 'fisic':1 'general':5 'hector':8 'i':2 'montiel':7 'perez':6
198	212	BIOLOGIA: CIENCIAS 1,SECUNDARIA	LIMON,SAUL				1	1	1	66	2			\N	2021-10-05 17:11:30	2021-10-05 17:11:30	'1':3 'biologi':1 'cienci':2 'limon':5 'saul':6 'secundari':4
199	213	BIOLOGIA 1:LA DINAMICA DE LA VIDA	SAINZ CANEDO,LUIS CARLOS				1	1	1	75	2			\N	2021-10-05 17:15:03	2021-10-05 17:15:03	'1':2 'biologi':1 'caned':9 'carl':11 'dinam':4 'luis':10 'sainz':8 'vid':7
200	214	BIOLOGIA: CIENCIAS I,EDUCACION SECUNDARIA PRIMER G	BARAHONA, ANA				1	1	1	66	2			\N	2021-10-05 17:16:30	2021-10-05 17:16:30	'ana':9 'barahon':8 'biologi':1 'cienci':2 'educacion':4 'g':7 'i':3 'prim':6 'secundari':5
201	215	BIOLOGIA 1:SECUNDARIA	TOVAR MARTINEZ,MARIA EUGENIA				1	1	1	51	2			\N	2021-10-05 17:17:33	2021-10-05 17:17:33	'1':2 'biologi':1 'eugeni':7 'mari':6 'martinez':5 'secundari':3 'tov':4
202	216	CIENCIAS 1:BIOLOGIA	TREJO BENITEZ,FRANCISCO JAVIER				1	1	1	67	2			\N	2021-10-05 17:18:08	2021-10-05 17:18:08	'1':2 'benitez':5 'biologi':3 'cienci':1 'francisc':6 'javi':7 'trej':4
203	218	CIENCIAS:BIOLOGIA 1,RECURSOS DIDACTICOS	GUILLEN RODRIGUEZ,FEDRO CARLOS				1	1	1	48	2			\N	2021-10-05 17:19:41	2021-10-05 17:19:41	'1':3 'biologi':2 'carl':9 'cienci':1 'didact':5 'fedr':8 'guill':6 'recurs':4 'rodriguez':7
204	219	LA COMPRENSION DE LA VIDA 1 : ACTIVIDADES CREATIVA	SAINZ CANEDO,LUIS CARLOS				1	1	1	75	2			\N	2021-10-05 17:20:34	2021-10-05 17:20:34	'1':6 'activ':7 'caned':10 'carl':12 'comprension':2 'creativ':8 'luis':11 'sainz':9 'vid':5
206	221	GUEVARA GONZALEZ, CESAR	GUEVARA GONZALEZ,CESAR				1	1	1	49	2			\N	2021-10-05 17:23:26	2021-10-05 17:23:26	'ces':3,6 'gonzalez':2,5 'guev':1,4
207	222	CIENCIAS: BIOLOGIA 1,RECURSOS DIDACTICOS	GUILLEN RODRIGUEZ,FEDRO CARLOS				1	1	1	48	2			\N	2021-10-05 17:26:16	2021-10-05 17:26:16	'1':3 'biologi':2 'carl':9 'cienci':1 'didact':5 'fedr':8 'guill':6 'recurs':4 'rodriguez':7
208	223	QUIMICA 1	ORTIZ FLORES, IGNACIO				1	1	1	48	2			\N	2021-10-05 17:26:56	2021-10-05 17:26:56	'1':2 'flor':4 'ignaci':5 'ortiz':3 'quimic':1
223	236	HISTORIA DE MEXICO I:UN ENFOQUE CONSTRUCTIVISTA	.				1	1	1	75	2			\N	2021-10-05 18:45:00	2021-10-05 18:45:00	'constructiv':7 'enfoqu':6 'histori':1 'i':4 'mexic':3
209	224	FUNDAMENTOS DE QUIMICA	BURNS,RALPH A.				1	1	1	75	2			\N	2021-10-05 17:28:12	2021-10-05 17:28:12	'burns':4 'fundament':1 'quimic':3 'ralph':5
210	225	ALGEBRA	LEITHOLD, LOUIS				1	1	1	64	2			\N	2021-10-05 17:29:12	2021-10-05 17:29:12	'algebr':1 'leithold':2 'louis':3
211	226	ALGEBRA Y TRIGONOMETRIA CON GEOMETRIA ANALITICA	LEITHOLD,LOUIS				1	1	1	64	2			\N	2021-10-05 17:36:02	2021-10-05 17:36:02	'algebr':1 'analit':6 'geometri':5 'leithold':7 'louis':8 'trigonometri':3
473	461	MEDIO ORIENTE	STEELE, PHILIP				1	1	1	48	2			\N	2021-10-08 19:05:20	2021-10-08 19:05:20	'medi':1 'orient':2 'philip':4 'steel':3
719	678	EL NACIMIENTO DE LOS ESTADOS UNIDOS, 1763-1816	ASIMOV, ISAAC				1	1	1	6	2			\N	2021-10-15 17:29:56	2021-10-15 17:29:56	'-1816':8 '1763':7 'asimov':9 'isaac':10 'nacimient':2 'unid':6
213	227	MATEMATICAS III:UN ENFOQUE CONSTRUCTIVISTA	.				1	1	1	75	2			\N	2021-10-05 17:37:17	2021-10-05 17:37:17	'constructiv':5 'enfoqu':4 'iii':2 'matemat':1
214	228	MATEMATICAS IV:UN ENFOQUE CONSTRUCTIVISTA	PIMIENTA PRIETO,JULIO HERMINIO.				1	1	1	75	2			\N	2021-10-05 17:38:54	2021-10-05 17:38:54	'constructiv':5 'enfoqu':4 'hermini':9 'iv':2 'juli':8 'matemat':1 'pimient':6 'priet':7
772	727	ES HORA DE CAMBIAR	FERRI, LAURA				1	1	1	164	2			\N	2021-10-18 12:20:37	2021-10-18 12:20:37	'cambi':4 'ferri':5 'hor':2 'laur':6
216	230	HACIA LA SOCIOLOGIA	PUGA,MARIA CRISTINA				1	1	1	75	2			\N	2021-10-05 17:43:11	2021-10-05 17:43:11	'cristin':6 'haci':1 'mari':5 'pug':4 'sociologi':3
217	231	FISICA CONCEPTUAL:MANUAL DE LABORATORIO	ROBINSON,PAUL				1	1	1	75	2			\N	2021-10-05 17:44:11	2021-10-05 17:44:11	'conceptual':2 'fisic':1 'laboratori':5 'manual':3 'paul':7 'robinson':6
218	232	FISICA:PRINCIPIOS CON APLICACIONES	GIANCOLI,DOUGLAS C.				1	1	1	75	2			\N	2021-10-05 17:44:42	2021-10-05 17:44:42	'aplic':4 'c':7 'dougl':6 'fisic':1 'giancoli':5 'principi':2
219	233	FISICA:EL GIMNASIO DE LA MENTE	SLISKO,JOSIP				1	1	1	75	2			\N	2021-10-05 17:45:52	2021-10-05 17:45:52	'fisic':1 'gimnasi':3 'josip':8 'ment':6 'slisk':7
220	234	QUIMICA	TIMBERLAKE,KAREN C.				1	1	1	75	2			\N	2021-10-05 17:46:25	2021-10-05 17:46:25	'c':4 'kar':3 'quimic':1 'timberlak':2
221	235	QUIMICA II:UN ENFOQUE CONSTRUCTIVISTA	.				1	1	1	75	2			\N	2021-10-05 17:48:20	2021-10-05 17:48:20	'constructiv':5 'enfoqu':4 'ii':2 'quimic':1
741	696	POESIAS DE MEXICO Y DEL MUNDO	NANEZ, ERASMO DE				1	1	1	133	2			\N	2021-10-15 18:18:42	2021-10-15 18:18:42	'erasm':8 'mexic':3 'mund':6 'nanez':7 'poesi':1
224	237	HISTORIA UNIVERSAL CONTEMPORANEA:ENFOQUE CONSTRUCT	CASTRO, MONICA Z.				1	1	1	86	2			\N	2021-10-05 18:46:55	2021-10-05 18:47:04	'castr':6 'construct':5 'contemporane':3 'enfoqu':4 'histori':1 'monic':7 'universal':2 'z':8
225	238	ORTOGRAFIA:EJERCICIO PARA TODOS	PECINA HERNANDEZ,JOSE C.				1	1	1	75	2			\N	2021-10-05 18:48:38	2021-10-05 18:48:38	'c':8 'ejercici':2 'hernandez':6 'jos':7 'ortografi':1 'pecin':5
226	239	BIOLOGIA II	VAZQUEZ CONDE,ROSALINO				1	1	1	53	2			\N	2021-10-05 18:49:12	2021-10-05 18:49:12	'biologi':1 'cond':4 'ii':2 'rosalin':5 'vazquez':3
227	241	ETICA Y VALORES 1:UN ENFOQUE CONSTRUCTIVISTA	ENRIQUEZ OLVERA,ANGELICA GUADALUPE				1	1	1	75	2			\N	2021-10-05 18:52:22	2021-10-05 18:52:22	'1':4 'angel':10 'constructiv':7 'enfoqu':6 'enriquez':8 'etic':1 'guadalup':11 'olver':9 'valor':3
228	242	ETICA Y VALORES 2:UN ENFOQUE CONSTRUCTIVISTA	VALDES SALMERON,VERONICA				1	1	1	75	2			\N	2021-10-05 18:53:05	2021-10-05 18:53:05	'2':4 'constructiv':7 'enfoqu':6 'etic':1 'salmeron':9 'vald':8 'valor':3 'veron':10
261	274	ACERCATE A LA QUIMICA 1	JARA REYES,SILVIA				1	1	1	59	2			\N	2021-10-06 12:26:06	2021-10-06 12:26:06	'1':5 'acercat':1 'jar':6 'quimic':4 'rey':7 'silvi':8
262	275	QUIMICA:EDUCACION SECUNDARIA 1	CHAMIZO,JOSE ANTONIO				1	1	1	51	2			\N	2021-10-06 12:27:54	2021-10-06 12:27:54	'1':4 'antoni':7 'chamiz':5 'educacion':2 'jos':6 'quimic':1 'secundari':3
229	243	INFORMATICA II:UN ENFOQUE CONSTRUCTIVISTA	SANCHEZ MONTUFAR,LUIS				1	1	1	75	2			\N	2021-10-05 18:54:10	2021-10-05 18:54:10	'constructiv':5 'enfoqu':4 'ii':2 'informat':1 'luis':8 'montuf':7 'sanchez':6
230	245	LOGICA ¿PARA QUE? : ARGUMENTA, DEBATE Y DECIDE RAC	HERNANDEZ DECIDERIO,GABRIELA				1	1	1	75	2			\N	2021-10-05 18:54:49	2021-10-05 18:54:49	'argument':4 'debat':5 'decid':7 'decideri':10 'gabriel':11 'hernandez':9 'logic':1 'rac':8
231	246	METODOS DE INVESTIGACION	SALKIND,NEIL J.				1	1	1	75	2			\N	2021-10-05 18:55:19	2021-10-05 18:55:19	'investigacion':3 'j':6 'metod':1 'neil':5 'salkind':4
232	247	GEOGRAFIA:ENFOQUE BASADO EN COMPETENCIAS	SALINAS LUNA, ADOLFO				1	1	1	75	2			\N	2021-10-05 18:56:18	2021-10-05 18:56:18	'adolf':8 'bas':3 'competent':5 'enfoqu':2 'geografi':1 'lun':7 'salin':6
233	248	EL PLACER DE LA ESCRITURA:MANUAL DE APROPIACION DE	CORREA PEREZ,ALICIA				1	1	1	75	2			\N	2021-10-05 18:56:59	2021-10-05 18:56:59	'alici':12 'apropiacion':8 'corre':10 'escritur':5 'manual':6 'perez':11 'plac':2
234	249	LECTURA Y REDACCION:CON ANALISIS LITERARIO	PINEDA RAMIREZ,MARIA IGNACIA				1	1	1	75	2			\N	2021-10-05 18:59:15	2021-10-05 18:59:15	'analisis':5 'ignaci':10 'lectur':1 'literari':6 'mari':9 'pined':7 'ramirez':8 'redaccion':3
235	250	EL DEBATE Y LA ARGUMENTACION:TEORIA,TECNICAS Y EST	RANGEL HINOJOSA,MONICA				1	1	1	60	2			\N	2021-10-05 19:00:16	2021-10-05 19:00:16	'argumentacion':5 'debat':2 'est':9 'hinoj':11 'monic':12 'rangel':10 'tecnic':7 'teori':6
238	252	HISTORIA DE MEXICO:LEGADO HISTORICO Y PASADO RECIE	DELGADO DE CANTU,GLORIA M.				1	1	1	75	2			\N	2021-10-05 19:02:10	2021-10-05 19:02:10	'cantu':11 'delg':9 'glori':12 'histor':5 'histori':1 'leg':4 'm':13 'mexic':3 'pas':7 'reci':8
239	253	FISICA:CONCEPTOS Y APLICACIONES	TIPPENS,PAUL E.				1	1	1	61	2			\N	2021-10-05 19:02:54	2021-10-05 19:02:54	'aplic':4 'concept':2 'fisic':1 'paul':6 'tippens':5
236	251	ETIMOLOGIAS:INTRODUCCION A LA HISTORIA DEL LEXICO	SANTIAGO MARTINEZ,MARIA DE LOURDES  SANTIAGO MAR				1	1	1	75	2			\N	2021-10-05 19:01:16	2021-10-05 19:03:55	'etimologi':1 'histori':5 'introduccion':2 'lexic':7 'lourd':12 'mar':14 'mari':10 'martinez':9 'santiag':8,13
241	255	FISICA 1	HERNANDEZ ACOSTA,ROSA ELISA T.				1	1	1	48	2			\N	2021-10-05 19:05:50	2021-10-05 19:05:50	'1':2 'acost':4 'elis':6 'fisic':1 'hernandez':3 'ros':5 't':7
242	256	FISICA 1:UN ENFOQUE CONSTRUCTIVISTA	LARA-BARRAGAN GOMEZ,ANTONIO.				1	1	1	75	2			\N	2021-10-05 19:06:34	2021-10-05 19:06:34	'1':2 'antoni':10 'barrag':8 'constructiv':5 'enfoqu':4 'fisic':1 'gomez':9 'lar':7 'lara-barrag':6
243	257	EL ABC DEL APRENDIZAJE COOPERATIVO:TRABAJO EN EQUI	FERREIRO GRAVIE,  RAMON.				1	1	1	60	2			\N	2021-10-05 19:12:44	2021-10-05 19:12:44	'abc':2 'aprendizaj':4 'cooper':5 'equi':8 'ferreir':9 'gravi':10 'ramon':11 'trabaj':6
377	368	QUIMICA: DICCIONARIO ESENCIAL LAROUSSE	SIN AUTOR				1	1	1	59	2			\N	2021-10-06 18:02:14	2021-10-06 18:02:14	'autor':6 'diccionari':2 'esencial':3 'larouss':4 'quimic':1
245	259	ESTRATEGIAS NO VERBALES PARA LA ENSENANZA:GUIA PER	GRINDER,MICHAEL				1	1	1	88	2			\N	2021-10-05 19:16:25	2021-10-05 19:17:51	'ensen':6 'estrategi':1 'grind':9 'gui':7 'michael':10 'per':8 'verbal':3
246	260	¡SAL SI PUEDES!:LABERINTOS Y ROMPECABEZAS MATEMATI	SNAPE,CHARLES				1	1	1	57	2			\N	2021-10-05 19:19:09	2021-10-05 19:19:09	'charl':9 'laberint':4 'matemati':7 'pued':3 'rompecabez':6 'sal':1 'si':2 'snap':8
247	261	DESAFIOS  MATEMATICOS	SNAPE,CHARLES				1	1	1	25	2			\N	2021-10-05 19:24:13	2021-10-05 19:24:13	'charl':4 'desafi':1 'matemat':2 'snap':3
248	262	MARKETING GLOBAL	MASAAKI,KOTABE				1	1	1	89	2			\N	2021-10-05 19:32:55	2021-10-05 19:32:55	'global':2 'kotab':4 'marketing':1 'masaaki':3
249	263	MATEMATICAS FINANCIERAS	VILLALOBOS,JOSE LUIS				1	1	1	75	2			\N	2021-10-05 19:35:15	2021-10-05 19:35:15	'financ':2 'jos':4 'luis':5 'matemat':1 'villalob':3
250	264	CONTABILIDAD I	GUERRERO REYES,JOSE CLAUDIO				1	1	1	67	2			\N	2021-10-05 19:37:39	2021-10-05 19:37:39	'claudi':6 'contabil':1 'guerrer':3 'i':2 'jos':5 'rey':4
251	265	FUNDAMENTOS DE ADMINISTRACION:CONCEPTOS ESENCIALES	ROBBINS,STEPHEN P.				1	1	1	75	2			\N	2021-10-05 19:38:50	2021-10-05 19:38:50	'administracion':3 'concept':4 'esencial':5 'fundament':1 'p':8 'robbins':6 'steph':7
252	266	FISICA CONCEPTUAL	HEWITT,PAUL G.				1	1	1	75	2			\N	2021-10-05 19:39:29	2021-10-05 19:39:29	'conceptual':2 'fisic':1 'g':5 'hewitt':3 'paul':4
253	267	FISICA:PARA BACHILLERATO  GENERAL	SERWAY,RAYMOND A.				1	1	1	54	2			\N	2021-10-05 19:40:19	2021-10-05 19:40:19	'bachillerat':3 'fisic':1 'general':4 'raymond':6 'serway':5
254	268	FISICA:PARA BACHILLERATO GENERAL	SERWAY,RAYMOND A.				1	1	1	54	2			\N	2021-10-05 19:41:26	2021-10-05 19:41:26	'bachillerat':3 'fisic':1 'general':4 'raymond':6 'serway':5
255	269	FISICA	RESNICK,ROBERT				1	1	1	90	2			\N	2021-10-06 12:18:47	2021-10-06 12:19:34	'fisic':1 'resnick':2 'robert':3
258	271	QUIMICA 1	GARCIA BECERRIL,MARIA DE LOURDES				1	1	1	61	2			\N	2021-10-06 12:23:53	2021-10-06 12:23:53	'1':2 'becerril':4 'garci':3 'lourd':7 'mari':5 'quimic':1
259	272	QUIMICA 1:PARA BACHILLERATO GENERAL	RAMIREZ REGALADO,VICTOR MANUEL				1	1	1	53	2			\N	2021-10-06 12:24:38	2021-10-06 12:24:38	'1':2 'bachillerat':4 'general':5 'manuel':9 'quimic':1 'ramirez':6 'regal':7 'victor':8
260	273	QUIMICA 2:CUADERNO DE TRABAJO	MONNIER TREVINO,ALBERTO				1	1	1	52	2			\N	2021-10-06 12:25:25	2021-10-06 12:25:25	'2':2 'albert':8 'cuadern':3 'monni':6 'quimic':1 'trabaj':5 'trevin':7
263	276	BIOLOGIA:CIENCIA Y NATURALEZA	AUDESIRK,TERESA				1	1	1	75	2			\N	2021-10-06 12:28:38	2021-10-06 12:28:38	'audesirk':5 'biologi':1 'cienci':2 'naturalez':4 'teres':6
264	277	BIOLOGIA:LA VIDA EN LA TIERRA	AUDESIRK,TERESA				1	1	1	75	2			\N	2021-10-06 12:29:36	2021-10-06 12:29:36	'audesirk':7 'biologi':1 'teres':8 'tierr':6 'vid':3
266	279	BIOLOGIA 1:UN ENFOQUE CONSTRUCTIVISTA	GAMA FUERTES,MARIA DE LOS ANGELES				1	1	1	75	2			\N	2021-10-06 12:31:43	2021-10-06 12:31:43	'1':2 'angel':11 'biologi':1 'constructiv':5 'enfoqu':4 'fuert':7 'gam':6 'mari':8
344	336	DICCIONARIO ACADEMIA SECUNDARIA	CAMPILLO CUAUTLI, HECTOR				1	1	1	65	2			\N	2021-10-06 17:13:28	2021-10-06 17:13:28	'academi':2 'campill':4 'cuautli':5 'diccionari':1 'hector':6 'secundari':3
349	340	LAROUSSE JUNIOR DICCIONARIO	PENA, LUIS IGNACIO DE LA				1	1	1	59	2			\N	2021-10-06 17:22:06	2021-10-06 17:22:06	'diccionari':3 'ignaci':6 'junior':2 'larouss':1 'luis':5 'pen':4
350	341	BREVE DICCIONARIO PORRUA DE LA LENGUA ESPANOLA	RALUY POUDEVIDA, ANTONIO				1	1	1	82	2			\N	2021-10-06 17:22:35	2021-10-06 17:22:35	'antoni':10 'brev':1 'diccionari':2 'espanol':7 'lengu':6 'porru':3 'poudev':9 'raluy':8
378	369	ATLAS UNIVERSAL PANORAMA	SIN AUTOR				1	1	1	89	2			\N	2021-10-06 18:03:03	2021-10-06 18:03:03	'atlas':1 'autor':5 'panoram':3 'universal':2
351	343	LAROUSSE ORTOGRAFIA: REGLAS Y EJERCICIOS	SIN AUTOR				1	1	1	59	2			\N	2021-10-06 17:23:07	2021-10-06 17:23:07	'autor':7 'ejercici':5 'larouss':1 'ortografi':2 'regl':3
423	410	HOJA DE CALCULO: ENTENDIENDO AL CONSUMIDOR	EDUCATIONAL TECHNOLOGY CONSULTING				1	1	1	122	2			\N	2021-10-07 18:24:12	2021-10-07 18:24:12	'calcul':3 'consulting':9 'consumidor':6 'educational':7 'entend':4 'hoj':1 'technology':8
434	420	LOS SUENOS DE MI PADRE: UNA HISTORIA DE RAZA Y HER	OBAMA, BARACK				1	1	1	127	2			\N	2021-10-07 18:45:58	2021-10-07 18:46:33	'barack':13 'her':11 'histori':7 'obam':12 'padr':5 'raz':9 'suen':2
272	284	EDUCACION EMOCIONAL:PROGRAMA DE ACTIVIDADES PARA E	FERRIS,VICENT PASCUAL				1	1	1	91	2			\N	2021-10-06 12:37:56	2021-10-06 12:39:26	'activ':5 'educacion':1 'emocional':2 'ferris':8 'pascual':10 'program':3 'vicent':9
720	679	MITOLOGIA MEXICANA	PENICHE B, ROLDAN				1	1	1	155	2			\N	2021-10-15 17:30:57	2021-10-15 17:31:07	'b':4 'mexican':2 'mitologi':1 'penich':3 'rold':5
742	697	CUENTOS CLASICOS JUVENILES: ANTOLOGIA	ZULVAGA, CONRADO				1	1	1	5	2			\N	2021-10-15 18:19:39	2021-10-15 18:19:39	'antologi':4 'clasic':2 'conr':6 'cuent':1 'juvenil':3 'zulvag':5
90	88	ESPANOL 2 : CUADERNO DE ACTIVIDADES	ANGELES MANRIQUEZ , ELFEGO				1	1	1	78	2			\N	2021-10-04 19:39:26	2021-10-06 12:46:29	'2':2 'activ':5 'angel':6 'cuadern':3 'elfeg':8 'espanol':1 'manriquez':7
275	57	ESPANOL 1	GUTIERREZ SANDOVAL , GRACIELA				1	1	1	48	2			\N	2021-10-06 12:55:53	2021-10-06 12:55:53	'1':2 'espanol':1 'graciel':5 'gutierrez':3 'sandoval':4
752	707	LOS VALORES EN LA ENSENANZA, FORMACION Y FORTALECI	PULIDO DE LA FUENTE, BLANCA ESTELA				1	1	1	162	2			\N	2021-10-15 18:32:06	2021-10-15 18:32:17	'blanc':13 'ensen':5 'estel':14 'formacion':6 'fortaleci':8 'fuent':12 'pul':9 'valor':2
760	715	LA PINTURA MURAL DEL SIGLO XVI	CAZENAVE TAPIA, CHRISTIANE				1	1	1	72	2			\N	2021-10-15 18:43:27	2021-10-15 18:43:27	'cazenav':7 'christian':9 'mural':3 'pintur':2 'sigl':5 'tapi':8 'xvi':6
314	306	BIOLOGIA 1	CALIXTO FLORES,RAUL				1	1	1	71	2			\N	2021-10-06 15:57:02	2021-10-06 15:57:02	'1':2 'biologi':1 'calixt':3 'flor':4 'raul':5
789	745	BULLYING: ACOSO ESCOLAR	RINCON, MARIA GUADALUPE				1	1	1	60	2			\N	2021-10-18 12:36:48	2021-10-18 12:36:48	'acos':2 'bullying':1 'escol':3 'guadalup':6 'mari':5 'rincon':4
721	680	CANASTA DE CUENTOS MEXICANOS	TRAVEN, B.				1	1	1	156	2			\N	2021-10-15 17:49:59	2021-10-15 17:50:09	'b':6 'canast':1 'cuent':3 'mexican':4 'trav':5
281	217	CIENCIAS : BIOLOGIA	GUILLEN RODRIGUEZ,FEDRO CARLOS				1	1	1	48	2			\N	2021-10-06 13:55:52	2021-10-06 13:55:52	'biologi':2 'carl':6 'cienci':1 'fedr':5 'guill':3 'rodriguez':4
283	192	HISTORIA DE MEXICO.	DELGADO DE CANTU, GLORIA M.				1	1	1	75	2			\N	2021-10-06 13:58:04	2021-10-06 13:58:30	'cantu':6 'delg':4 'glori':7 'histori':1 'm':8 'mexic':3
284	209	INTRODUCCION A LA FISICA Y A LA QUIMICA:SECUNDARIA.	COVARRUBIAS MARTINEZ, HECTOR				1	1	1	51	2			\N	2021-10-06 13:58:58	2021-10-06 13:58:58	'covarrubi':10 'fisic':4 'hector':12 'introduccion':1 'martinez':11 'quimic':8 'secundari':9
285	240	HISTORIA UNIVERSAL	SIN AUTOR				1	1	1	75	2			\N	2021-10-06 14:00:38	2021-10-06 14:00:38	'autor':4 'histori':1 'universal':2
287	254	FISICA:CONCEPTOS Y APLICACIONES.	TIPPENS,PAUL E.				1	1	1	61	2			\N	2021-10-06 14:02:50	2021-10-06 14:02:50	'aplic':4 'concept':2 'fisic':1 'paul':6 'tippens':5
288	270	FISICA.	RESNICK,ROBERT				1	1	1	90	2			\N	2021-10-06 14:03:24	2021-10-06 14:03:24	'fisic':1 'resnick':2 'robert':3
289	278	BIOLOGIA: LA VIDA EN LA TIERRA.	AUDESIRK,TERESA				1	1	1	75	2			\N	2021-10-06 14:04:45	2021-10-06 14:04:45	'audesirk':7 'biologi':1 'teres':8 'tierr':6 'vid':3
291	283	GEOGRAFIA: ENFOQUE BASADO EN COMPETENCIAS.	SALINAS LUNA, ADOLFO				1	1	1	75	2			\N	2021-10-06 14:08:04	2021-10-06 14:08:04	'adolf':8 'bas':3 'competent':5 'enfoqu':2 'geografi':1 'lun':7 'salin':6
292	285	USOS Y FORMAS DE LA LENGUA ESCRITA:REENSENAR LA ES	RIESTRA, DORA				1	1	1	92	2			\N	2021-10-06 14:29:43	2021-10-06 14:30:50	'dor':12 'escrit':7 'form':3 'lengu':6 'reensen':8 'riestr':11 'usos':1
293	286	LA INVESTIGACION EDUCATIVA:UNA HERRAMIENTA DE CONO	SVERDLICK,INGRID				1	1	1	92	2			\N	2021-10-06 14:31:28	2021-10-06 14:31:28	'con':7 'educ':3 'herramient':5 'ingrid':9 'investigacion':2 'sverdlick':8
339	331	OXFORD WORD POWER DICTIONARY.	SIN AUTOR				1	1	1	64	2			\N	2021-10-06 17:02:51	2021-10-06 17:02:51	'autor':6 'dictionary':4 'oxford':1 'pow':3 'word':2
346	338	LAROUSSE. DICCIONARIO ENCICLOPEDICO VISUAL	GARCIA CEREZO, TOMAS				1	1	1	59	2			\N	2021-10-06 17:14:27	2021-10-06 17:14:27	'cerez':6 'diccionari':2 'encicloped':3 'garci':5 'larouss':1 'tom':7 'visual':4
352	344	DICCIONARIO DE LA LENGUA ESPANOLA	SIN AUTOR				1	1	1	97	2			\N	2021-10-06 17:23:40	2021-10-06 17:23:40	'autor':7 'diccionari':1 'espanol':5 'lengu':4
399	390	NERVIOS, CEREBRO Y SENTIDOS	PARKER, STEVE				1	1	1	4	2			\N	2021-10-06 18:54:19	2021-10-06 18:54:19	'cerebr':2 'nervi':1 'park':5 'stev':6
294	287	EL CONCEPTO DE COMPETENCIAS DESDE LA COMPLEJIDAD:H	RUIZ IGLESIAS,MAGALYS				1	1	1	60	2			\N	2021-10-06 14:32:00	2021-10-06 14:32:00	'competent':4 'complej':7 'concept':2 'h':8 'iglesi':10 'magalys':11 'ruiz':9
295	288	EVALUACION DE LOS APRENDIZAJES:MANUAL PARA DOCENTE	BONVECCHIO DE ARUANI,MIRTA				1	1	1	92	2			\N	2021-10-06 14:32:51	2021-10-06 14:32:51	'aprendizaj':4 'aruani':10 'bonvecchi':8 'docent':7 'evaluacion':1 'manual':5 'mirt':11
296	289	COMO ENSENAR MEJOR:TECNICAS DE ASESORAMIENTO PARA	PONCE,MIRIAM				1	1	1	29	2			\N	2021-10-06 14:33:31	2021-10-06 14:33:31	'asesor':6 'ensen':2 'mejor':3 'miriam':9 'ponc':8 'tecnic':4
297	290	EDUCACION PARA UNA SOCIEDAD DEL CONOCIMIENTO	CARRION CARRANZA,CARMEN				1	1	1	60	2			\N	2021-10-06 14:34:15	2021-10-06 14:34:15	'carm':9 'carranz':8 'carrion':7 'conoc':6 'educacion':1 'socied':4
298	291	ENSENAR A PENSAR:LIBRO-GUIA PARA DOCENTES	BEYER,BARRY				1	1	1	93	2			\N	2021-10-06 15:16:20	2021-10-06 15:17:01	'barry':10 'bey':9 'docent':8 'ensen':1 'gui':6 'libr':5 'libro-gui':4 'pens':3
299	292	DIDACTICA INTEGRATIVA Y EL PROCESO DE APRENDIZAJE	VILLALOBOS PEREZ-CORTES,ELVIA MARVEYA				1	1	1	60	2			\N	2021-10-06 15:17:56	2021-10-06 15:17:56	'aprendizaj':7 'cort':11 'didact':1 'elvi':12 'integr':2 'marvey':13 'perez':10 'perez-cort':9 'proces':5 'villalob':8
300	293	EDUCACION BASADA EN COMPETENCIAS	ARGUDIN,YOLANDA				1	1	1	60	2			\N	2021-10-06 15:18:43	2021-10-06 15:18:43	'argudin':5 'bas':2 'competent':4 'educacion':1 'yoland':6
301	294	ENSENAR EN CLAVE DE JUEGO:ENLAZANDO JUEGOS Y CONTE	SARLE,PATRICIA				1	1	1	92	2			\N	2021-10-06 15:20:08	2021-10-06 15:20:08	'clav':3 'cont':9 'enlaz':6 'ensen':1 'jueg':5,7 'patrici':11 'sarl':10
302	295	CONCEPCIONES Y PRACTICAS EN EL APRENDIZAJE Y LA EN	SIN AUTOR				1	1	1	92	2			\N	2021-10-06 15:21:14	2021-10-06 15:21:14	'aprendizaj':6 'autor':11 'concepcion':1 'practic':3
303	296	MEDIACION ESCOLAR:APORTES E INTERROGANTES,RESOLUCI	SIN AUTOR				1	1	1	92	2			\N	2021-10-06 15:22:05	2021-10-06 15:22:05	'aport':3 'autor':8 'escol':2 'interrog':5 'mediacion':1 'resoluci':6
304	297	EL TALLER DE CIENCIAS SOCIALES:LA ENSENANZA DE LOS	SVARZMAN,JOSE H.				1	1	1	92	2			\N	2021-10-06 15:32:12	2021-10-06 15:32:12	'cienci':4 'ensen':7 'h':12 'jos':11 'social':5 'svarzm':10 'tall':2
305	298	TECNICAS GRUPALES:ELEMENTOS PARA EL AULA FLEXIBLE	PASUT,MARTA				1	1	1	92	2			\N	2021-10-06 15:32:50	2021-10-06 15:32:50	'aul':6 'element':3 'flexibl':7 'grupal':2 'mart':9 'pasut':8 'tecnic':1
306	299	ESCUELAS,FAMILIAS Y MUJERES	BRAVIN,CLARA				1	1	1	92	2			\N	2021-10-06 15:41:57	2021-10-06 15:41:57	'bravin':5 'clar':6 'escuel':1 'famili':2 'mujer':4
340	332	OXFORD ADVANCED LEARNER`S DICTIONARY	HURNBY, A. S.				1	1	1	64	2			\N	2021-10-06 17:05:13	2021-10-06 17:05:13	'advanc':2 'dictionary':5 'hurnby':6 'learn':3 'oxford':1 's':4,8
307	300	INTERES,MOTIVACION DESEO:LA PEDAGOGIA QUE MIRA AL	BRAILOVSKY,DANIEL				1	1	1	92	2			\N	2021-10-06 15:43:36	2021-10-06 15:43:36	'brailovsky':9 'daniel':10 'dese':3 'inter':1 'mir':7 'motivacion':2 'pedagogi':5
308	301	LA TUTORIA,ORGANIZACION Y TAREA	PERE,ARNAIZ SOFIA ISUS				1	1	1	69	2			\N	2021-10-06 15:44:44	2021-10-06 15:44:44	'arnaiz':7 'isus':9 'organizacion':3 'per':6 'sofi':8 'tare':5 'tutori':2
722	681	LOS ROMANOS	GUY, JOHN				1	1	1	60	2			\N	2021-10-15 17:50:59	2021-10-15 17:50:59	'guy':3 'john':4 'roman':2
310	302	LA MATEMATICA A TRAVES DE LOS ESPEJOS	ROSS,NANCY				1	1	1	92	2			\N	2021-10-06 15:51:42	2021-10-06 15:51:42	'espej':7 'matemat':2 'nancy':9 'ross':8 'trav':4
311	303	FUNDAMENTOS DE ECOLOGIA:SU ENSENANZA CON UN ENFOQU	SIN AUTOR				1	1	1	92	2			\N	2021-10-06 15:52:37	2021-10-06 15:52:37	'autor':10 'ecologi':3 'enfoqu':8 'ensen':5 'fundament':1
312	304	BIOLOGIA PRACTICA 1:CURSO DE BIOLOGIA PARA PRIMER	RAMOS FUMAGALLI,GUSTAVO				1	1	1	65	2			\N	2021-10-06 15:53:53	2021-10-06 15:53:53	'1':3 'biologi':1,6 'curs':4 'fumagalli':10 'gustav':11 'practic':2 'prim':8 'ram':9
313	305	BIOLOGIA GRAFICA ACTIVA 1	SANCHEZ BASURTO,RAUL				1	1	1	71	2			\N	2021-10-06 15:55:40	2021-10-06 15:55:40	'1':4 'activ':3 'basurt':6 'biologi':1 'grafic':2 'raul':7 'sanchez':5
315	307	PRACTICAS DE BIOLOGIA 1	LEON P.,SARA				1	1	1	52	2			\N	2021-10-06 16:01:37	2021-10-06 16:01:37	'1':4 'biologi':3 'leon':5 'p':6 'practic':1 'sar':7
316	308	PRACTICAS DE BIOLOGIA 2	LEON P.,SARA				1	1	1	52	2			\N	2021-10-06 16:02:16	2021-10-06 16:02:16	'2':4 'biologi':3 'leon':5 'p':6 'practic':1 'sar':7
317	309	BIOLOGIA 1:CUADERNO DE EJERCICIOS	BELTRAN MARTINEZ DE CASTRO,MARGARITA				1	1	1	65	2			\N	2021-10-06 16:02:49	2021-10-06 16:02:49	'1':2 'beltr':6 'biologi':1 'castr':9 'cuadern':3 'ejercici':5 'margarit':10 'martinez':7
318	310	BIOLOGIA 1:CUADERNO DE TRABAJO	GARDUNO ESQUIVEL,LAURA				1	1	1	59	2			\N	2021-10-06 16:03:30	2021-10-06 16:03:30	'1':2 'biologi':1 'cuadern':3 'esquivel':7 'gardun':6 'laur':8 'trabaj':5
319	311	BIOLOGIA : GUIA DIDACTICA PARA LOS CUADERNOS DE TR	QUERO MOTA, ARTURO				1	1	1	59	2			\N	2021-10-06 16:04:16	2021-10-06 16:04:16	'artur':11 'biologi':1 'cuad':6 'didact':3 'gui':2 'mot':10 'quer':9 'tr':8
320	312	QUIMICA GENERAL	PETRUCCI,RALPH H.				1	1	1	55	2			\N	2021-10-06 16:04:58	2021-10-06 16:04:58	'general':2 'h':5 'petrucci':3 'quimic':1 'ralph':4
744	699	LEYENDAS DE FANTASMAS DE MEXICO	LOPEZ, HECTOR				1	1	1	133	2			\N	2021-10-15 18:20:40	2021-10-15 18:20:40	'fantasm':3 'hector':7 'leyend':1 'lopez':6 'mexic':5
820	774	DIVERTIDA	BERRY, BRENDA				1	1	1	164	2			\N	2021-10-18 18:30:23	2021-10-18 18:30:23	'berry':2 'brend':3 'divert':1
321	313	THE NEW ENCYCLOPAEDIA BRITANNICA	SIN AUTOR				1	1	1	95	2			\N	2021-10-06 16:06:21	2021-10-06 16:06:51	'autor':6 'britann':4 'encyclopaedi':3 'new':2 'the':1
322	314	NUEVA ENCICLOPEDIA TEMATICA: EL MUNDO DEL ESTUDIAN	SIN AUTOR				1	1	1	97	2			\N	2021-10-06 16:09:17	2021-10-06 16:11:15	'autor':9 'enciclopedi':2 'estudi':7 'mund':5 'nuev':1 'temat':3
324	316	HISTORIA UNIVERSAL	PIJOAN, JOSE				1	1	1	98	2			\N	2021-10-06 16:11:53	2021-10-06 16:12:25	'histori':1 'jos':4 'pij':3 'universal':2
325	317	ANTIGUAS CIVILIZACIONES: COMO ERAN Y QUE DEJARON	SIN AUTOR				1	1	1	76	2			\N	2021-10-06 16:13:27	2021-10-06 16:13:27	'antigu':1 'autor':9 'civiliz':2 'dej':7
326	319	ENCICLOPEDIA DE LAS CIENCIAS	SIN AUTOR				1	1	1	96	2			\N	2021-10-06 16:41:26	2021-10-06 16:41:26	'autor':6 'cienci':4 'enciclopedi':1
327	320	GRAN ENCICLOPEDIA DE LA CIENCIA Y DE LA TECNICA	SIN AUTOR				1	1	1	97	2			\N	2021-10-06 16:43:29	2021-10-06 16:43:29	'autor':11 'cienci':5 'enciclopedi':2 'gran':1 'tecnic':9
328	321	ENCICLOPEDIA DE MEXICO	ALVAREZ, JOSE ROGELIO				1	1	1	100	2			\N	2021-10-06 16:44:16	2021-10-06 16:45:13	'alvarez':4 'enciclopedi':1 'jos':5 'mexic':3 'rogeli':6
341	333	COLLINS DICCIONARIO ESPANOL-INGLES	SMITH, COLIN				1	1	1	84	2			\N	2021-10-06 17:05:49	2021-10-06 17:05:49	'colin':7 'collins':1 'diccionari':2 'espanol':4 'espanol-ingl':3 'ingles':5 'smith':6
329	322	HISTORIA DEL ARTE	MARTINEZ, ROSA				1	1	1	97	2			\N	2021-10-06 16:46:03	2021-10-06 16:46:03	'arte':3 'histori':1 'martinez':4 'ros':5
330	323	ENCICLOPEDIA DE LA MUSICA	HAMEL, FRED				1	1	1	84	2			\N	2021-10-06 16:46:41	2021-10-06 16:46:41	'enciclopedi':1 'fred':6 'hamel':5 'music':4
331	324	GRAN ENCICLOPEDIA DE LA MUSICA CLASICA	SIN AUTOR				1	1	1	101	2			\N	2021-10-06 16:47:17	2021-10-06 16:47:52	'autor':8 'clasic':6 'enciclopedi':2 'gran':1 'music':5
342	334	DICCIONARIO ESPANOL - INGLES, INGLES - ESPANOL	SIN AUTOR				1	1	1	97	2			\N	2021-10-06 17:09:40	2021-10-06 17:09:40	'autor':7 'diccionari':1 'espanol':2,5 'ingles':3,4
343	335	NORMA DICCIONARIO BILINGUE ESPANOL - INGLES POCKET	SIN AUTOR				1	1	1	56	2			\N	2021-10-06 17:10:30	2021-10-06 17:11:37	'autor':8 'biling':3 'diccionari':2 'espanol':4 'ingles':5 'norm':1 'pocket':6
353	345	LAROUSSE DICCIONARIO ESCOLAR	GARCIA PELAYO Y GROSS, RAMON				1	1	1	59	2			\N	2021-10-06 17:24:12	2021-10-06 17:24:12	'diccionari':2 'escol':3 'garci':4 'gross':7 'larouss':1 'pelay':5 'ramon':8
400	391	BODY	FARNDON, JOHN				1	1	1	119	2			\N	2021-10-06 18:56:49	2021-10-06 18:57:24	'body':1 'farndon':2 'john':3
455	441	CAUDILLOS MEXICANOS	CASTANEDA, CECILIA				1	1	1	74	2			\N	2021-10-07 19:50:12	2021-10-07 19:50:12	'castaned':3 'caudill':1 'cecili':4 'mexican':2
332	325	HISTORIA DE LOS GRANDES COMPOSITORES CLASICOS	GORTAZAR, ISABEL				1	1	1	102	2			\N	2021-10-06 16:55:29	2021-10-06 16:55:40	'clasic':6 'compositor':5 'gortaz':7 'grand':4 'histori':1 'isabel':8
745	700	ALGARABIA POCKET	MONTES DE OCA SICILIA, MARIA DEL PILAR				1	1	1	97	2			\N	2021-10-15 18:21:23	2021-10-15 18:21:23	'algarabi':1 'mari':7 'mont':3 'oca':5 'pil':9 'pocket':2 'sicili':6
333	326	GRAN HISTORIA DE MEXICO ILUSTRADA	SIN AUTOR				1	1	1	103	2			\N	2021-10-06 16:56:32	2021-10-06 16:56:54	'autor':7 'gran':1 'histori':2 'ilustr':5 'mexic':4
334	327	GRAN ENCICLOPEDIA VISUAL DE MEXICO	SIN AUTOR				1	1	1	81	2			\N	2021-10-06 16:58:22	2021-10-06 16:58:22	'autor':7 'enciclopedi':2 'gran':1 'mexic':5 'visual':3
335	328	MEXICO: TU HISTORIA. DESCUBRIMIENTO DE MEXICO	SALVAT, JUAN				1	1	1	98	2			\N	2021-10-06 16:58:56	2021-10-06 16:58:56	'descubr':4 'histori':3 'juan':8 'mexic':1,6 'salvat':7
336	329	THE HEINLE PICTURE DICTIONARY FOR CHILDREN	O`SULLIVAN, JILL KOREY				1	1	1	54	2			\N	2021-10-06 17:00:41	2021-10-06 17:00:41	'childr':6 'dictionary':4 'for':5 'heinl':2 'jill':9 'korey':10 'pictur':3 'sulliv':8 'the':1
337	330	OXFORD WORD POWER DICTIONARY	SIN AUTOR				1	1	1	64	2			\N	2021-10-06 17:01:26	2021-10-06 17:01:26	'autor':6 'dictionary':4 'oxford':1 'pow':3 'word':2
355	347	ANATOMIA HUMANA: TEXTO Y ATLAS	SIN AUTOR				1	1	1	61	2			\N	2021-10-06 17:25:41	2021-10-06 17:25:41	'anatomi':1 'atlas':5 'autor':7 'human':2 'text':3
356	348	ANATOMIA CROMODINAMICA	KAPIT, WYNN				1	1	1	65	2			\N	2021-10-06 17:26:20	2021-10-06 17:26:20	'anatomi':1 'cromodinam':2 'kapit':3 'wynn':4
357	349	ENCICLOPEDIA DE LA SEXUALIDAD	FARRE MARTI, JOSE MARIA				1	1	1	97	2			\N	2021-10-06 17:27:01	2021-10-06 17:27:01	'enciclopedi':1 'farr':5 'jos':7 'mari':8 'marti':6 'sexual':4
358	350	DERECHOS DEL PUEBLO MEXICANO: MEXICO A TRAVES DE S	SIN AUTOR				1	1	1	105	2			\N	2021-10-06 17:28:34	2021-10-06 17:29:12	'autor':11 'derech':1 'mexic':5 'mexican':4 'puebl':3 's':9 'trav':7
359	351	ENCICLOPEDIA AUDIOVISUAL EDUCATIVA: CIENCIAS NATUR	GISPERT, CARLOS				1	1	1	106	2			\N	2021-10-06 17:31:16	2021-10-06 17:31:25	'audiovisual':2 'carl':7 'cienci':4 'educ':3 'enciclopedi':1 'gispert':6 'natur':5
371	362	DICCIONARIO DE DERECHO	PINA VARA, RAFAEL DE				1	1	1	82	2			\N	2021-10-06 17:52:55	2021-10-06 17:52:55	'derech':3 'diccionari':1 'pin':4 'rafael':6 'var':5
373	364	DICCIONARIO DE ECONOMIA POLITICA Y ADMINISTRACION:	ORTEGA BLAKE, ARTURO				1	1	1	60	2			\N	2021-10-06 17:54:27	2021-10-06 17:54:27	'administracion':6 'artur':9 'blak':8 'diccionari':1 'economi':3 'orteg':7 'polit':4
381	372	ATLAS DEL NUEVO ORDEN MUNDIAL	CHALIAND, GERARD				1	1	1	29	2			\N	2021-10-06 18:20:07	2021-10-06 18:20:07	'atlas':1 'chaliand':6 'gerard':7 'mundial':5 'nuev':3 'orden':4
360	352	EDUCANDO: ENCICLOPEDIA TEMATICA PARA TODOS	MOLINA IGLESIAS, LUIS ENRIQUE				1	1	1	107	2			\N	2021-10-06 17:32:54	2021-10-06 17:33:27	'educ':1 'enciclopedi':2 'enriqu':9 'iglesi':7 'luis':8 'molin':6 'temat':3
361	353	ENCICLOPEDIA HISPANICA	SIN AUTOR				1	1	1	95	2			\N	2021-10-06 17:34:25	2021-10-06 17:34:25	'autor':4 'enciclopedi':1 'hispan':2
362	354	ENCICLOPEDIA TEMATICA ILUSTRADA	SIN AUTOR				1	1	1	108	2			\N	2021-10-06 17:36:20	2021-10-06 17:36:28	'autor':5 'enciclopedi':1 'ilustr':3 'temat':2
372	363	DICCIONARIO DE ECONOMIA	BANNOCK, GRAHAM				1	1	1	60	2			\N	2021-10-06 17:53:45	2021-10-06 17:53:45	'bannock':4 'diccionari':1 'economi':3 'graham':5
374	365	DICCIONARIO DE TERMINOLOGIA CONTABLE Y FINANCIERA	CADENA, RICHARD J.				1	1	1	112	2			\N	2021-10-06 17:55:58	2021-10-06 17:57:15	'caden':7 'contabl':4 'diccionari':1 'financ':6 'j':9 'richard':8 'terminologi':3
375	366	DICCIONARIO BASICO DE DERECHOS HUMANOS: CULTURA DE	FLORES MARCELLO				1	1	1	113	2			\N	2021-10-06 17:59:38	2021-10-06 18:00:40	'basic':2 'cultur':6 'derech':4 'diccionari':1 'flor':8 'human':5 'marcell':9
379	370	ATLAS DE GEOGRAFIA UNIVERSAL: EDUCACION PRIMARIA	SECRETARIA DE EDUCACION PUBLICA				1	1	1	114	2			\N	2021-10-06 18:03:47	2021-10-06 18:04:06	'atlas':1 'educacion':5,9 'geografi':3 'primari':6 'public':10 'secretari':7 'universal':4
363	355	GRAN ENCICLOPEDIA TIME LIFE	SIN AUTOR				1	1	1	109	2			\N	2021-10-06 17:38:06	2021-10-06 17:39:05	'autor':6 'enciclopedi':2 'gran':1 'lif':4 'tim':3
364	356	ENCICLOPEDIA TEMATICA SECUNDARIA	SIN AUTOR				1	1	1	84	2			\N	2021-10-06 17:39:43	2021-10-06 17:39:43	'autor':5 'enciclopedi':1 'secundari':3 'temat':2
365	357	COSTUMBRES Y TRADICIONES MEXICANAS	ALVAREZ, JOSE ROGELIO				1	1	1	96	2			\N	2021-10-06 17:41:16	2021-10-06 17:41:16	'alvarez':5 'costumbr':1 'jos':6 'mexican':4 'rogeli':7 'tradicion':3
376	367	MATEMATICAS: DICCIONARIO ESENCIAL LAROUSSE	SIN AUTOR				1	1	1	59	2			\N	2021-10-06 18:01:36	2021-10-06 18:01:36	'autor':6 'diccionari':2 'esencial':3 'larouss':4 'matemat':1
380	371	ATLAS LAROUSSE DE LOS PAISES DEL MUNDO	SIN AUTOR				1	1	1	59	2			\N	2021-10-06 18:19:26	2021-10-06 18:19:26	'atlas':1 'autor':9 'larouss':2 'mund':7 'pais':5
389	380	CODIGO CIVIL PARA EL ESTADO DE TABASCO	TABASCO, LEYES Y CODIGOS				1	1	1	116	2			\N	2021-10-06 18:38:27	2021-10-06 18:39:58	'civil':2 'codig':1,11 'ley':9 'tabasc':7,8
421	408	TAREAS ESCOLARES CON WORD	CASTELLANOS CASAS, RICARDO				1	1	1	83	2			\N	2021-10-07 18:21:15	2021-10-07 18:21:15	'cas':6 'castellan':5 'escolar':2 'ricard':7 'tar':1 'word':4
437	423	EINSTEIN: SU VIDA Y SU UNIVERSO	ISAACSON, WALTER				1	1	1	15	2			\N	2021-10-07 18:48:58	2021-10-07 18:48:58	'einstein':1 'isaacson':7 'univers':6 'vid':3 'walt':8
366	358	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEXICA	MEXICO, LEYES Y CODIGOS DE				1	1	1	111	2			\N	2021-10-06 17:43:15	2021-10-06 17:44:19	'codig':11 'constitucion':1 'ley':9 'mexic':7,8 'polit':2 'unid':6
723	682	BRITAIN´S KINGS &AMP; QUEENS	JOHN PARKER, MICHAEL ST.				1	1	1	157	2			\N	2021-10-15 17:56:45	2021-10-15 17:57:10	'britain':1 'john':5 'kings':3 'michael':7 'park':6 'queens':4 's':2 'st':8
368	359	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEXICANOS	MEXICO, LEYES Y CODIGOS DE				1	1	1	111	2			\N	2021-10-06 17:46:20	2021-10-06 17:46:20	'codig':11 'constitucion':1 'ley':9 'mexic':8 'mexican':7 'polit':2 'unid':6
369	360	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEXICANOS.	MEXICO, LEYES Y CODIGOS DE				1	1	1	111	2			\N	2021-10-06 17:47:46	2021-10-06 17:47:46	'codig':11 'constitucion':1 'ley':9 'mexic':8 'mexican':7 'polit':2 'unid':6
370	361	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEX.	MEXICO, LEYES Y CODIGOS DE				1	1	1	111	2			\N	2021-10-06 17:48:38	2021-10-06 17:48:38	'codig':11 'constitucion':1 'ley':9 'mex':7 'mexic':8 'polit':2 'unid':6
810	764	GEOMETRIAS	LENERO FRANCO, ISABEL				1	1	1	179	2			\N	2021-10-18 13:31:58	2021-10-18 13:32:36	'franc':3 'geometri':1 'isabel':4 'lener':2
382	373	ATLAS DE LOS IMPERIOS: DE BABILONIA A LA RUSIA SOV	CHALIAND, GERARD				1	1	1	29	2			\N	2021-10-06 18:20:50	2021-10-06 18:20:50	'atlas':1 'babiloni':6 'chaliand':11 'gerard':12 'imperi':4 'rusi':9 'sov':10
383	374	INTRODUCCION  A LA INFORMATICA	PLASENCIA LOPEZ, ZOE				1	1	1	111	2			\N	2021-10-06 18:21:33	2021-10-06 18:21:33	'informat':4 'introduccion':1 'lopez':6 'plasenci':5 'zoe':7
724	683	OBRAS COMPLETAS Y OTROS CUENTOS	MONTERROSA, AUGUSTO				1	1	1	56	2			\N	2021-10-15 18:00:20	2021-10-15 18:00:20	'august':7 'complet':2 'cuent':5 'monterr':6 'obras':1
384	375	ATLAS DE GEOGRAFIA UNIVERSAL	SIN AUTOR				1	1	1	115	2			\N	2021-10-06 18:22:02	2021-10-06 18:22:32	'atlas':1 'autor':6 'geografi':3 'universal':4
385	376	MICROSOFT VISUAL BASIC 6.0: INICIACION Y REFERENCI	JOYANES AGUILAR, LUIS				1	1	1	61	2			\N	2021-10-06 18:23:40	2021-10-06 18:23:40	'6.0':4 'aguil':9 'basic':3 'iniciacion':5 'joyan':8 'luis':10 'microsoft':1 'referenci':7 'visual':2
386	377	TECNOLOGIAS DE LA INFORMACION: LAS NUEVAS COMUNIDA	BECERRIL, FRANCISCO				1	1	1	64	2			\N	2021-10-06 18:24:12	2021-10-06 18:24:12	'becerril':8 'comun':7 'francisc':9 'informacion':4 'nuev':6 'tecnologi':1
387	378	TAREAS ESCOLARES CON WINDOWS	ALFIE, GABRIELA				1	1	1	83	2			\N	2021-10-06 18:25:48	2021-10-06 18:25:48	'alfi':5 'escolar':2 'gabriel':6 'tar':1 'windows':4
821	775	TU ESTILO FASHION	BERRY, BRENDA				1	1	1	164	2			\N	2021-10-18 18:31:35	2021-10-18 18:31:35	'berry':4 'brend':5 'estil':2 'fashion':3
388	379	WORD 2007 PASO A PASO	HART DAVIS, GUY				1	1	1	61	2			\N	2021-10-06 18:34:40	2021-10-06 18:37:51	'2007':2 'davis':7 'guy':8 'hart':6 'pas':3,5 'word':1
393	384	ESTRUCTURA DE DATOS: LIBRO DE PROBLEMAS	JOYANES AGUILAR, LUIS				1	1	1	61	2			\N	2021-10-06 18:43:32	2021-10-06 18:43:32	'aguil':8 'dat':3 'estructur':1 'joyan':7 'libr':4 'luis':9 'problem':6
394	385	POWER POINT 2007 PASO A PASO	FINKELSTEINT, ELLEN				1	1	1	61	2			\N	2021-10-06 18:45:23	2021-10-06 18:45:23	'2007':3 'ellen':8 'finkelsteint':7 'pas':4,6 'point':2 'pow':1
395	386	ATLAS DE LOS PUEBLOS DEL ASIA MERIDIONAL Y ORIENTA	SELLIER, JEAN				1	1	1	29	2			\N	2021-10-06 18:46:17	2021-10-06 18:46:17	'asi':6 'atlas':1 'jean':11 'meridional':7 'orient':9 'puebl':4 'selli':10
405	392	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS  MEXICANOS	MEXICO, LEYES Y CODIGOS DE				1	1	1	120	2			\N	2021-10-06 19:02:32	2021-10-06 19:02:32	'codig':11 'constitucion':1 'ley':9 'mexic':8 'mexican':7 'polit':2 'unid':6
406	393	CONSTITUCION POLITICA DE LOS ESTADOS  UNIDOS MEXICANOS	MEXICO, LEYES Y CODIGOS DE				1	1	1	61	2			\N	2021-10-06 19:04:39	2021-10-06 19:04:39	'codig':11 'constitucion':1 'ley':9 'mexic':8 'mexican':7 'polit':2 'unid':6
466	453	CIENCIA: LA GUIA VISUAL DEFINITIVA	HART - DAVIS, ADAM				1	1	1	48	2			\N	2021-10-08 18:18:05	2021-10-08 18:18:05	'adam':8 'cienci':1 'davis':7 'definit':5 'gui':3 'hart':6 'visual':4
489	477	EL AGUA	GUERRERO LEGARRETA, MANUEL				1	1	1	141	2			\N	2021-10-08 19:44:34	2021-10-08 19:44:53	'agu':2 'guerrer':3 'legarret':4 'manuel':5
528	516	¿POR QUE NO ME ENTIENDEN MIS PADRES?	MARTIN GONZALEZ, EMILIANO				1	1	1	143	2			\N	2021-10-11 13:05:56	2021-10-11 14:22:35	'emilian':10 'entiend':5 'gonzalez':9 'martin':8 'padr':7
536	524	LA VIDA SIN DROGAS	CALAFAT FAR, AMADOR				1	1	1	143	2			\N	2021-10-11 14:54:17	2021-10-11 14:54:17	'amador':7 'calafat':5 'drog':4 'far':6 'vid':2
537	525	REDES SOCIALES	BECONA IGLESIAS, ELISARDO				1	1	1	143	2			\N	2021-10-11 14:54:46	2021-10-11 14:54:46	'becon':3 'elisard':5 'iglesi':4 'red':1 'social':2
538	526	ALCOHOL	LORENZO PONTEVEDRA, MA. CARMEN				1	1	1	143	2			\N	2021-10-11 14:55:11	2021-10-11 14:55:11	'alcohol':1 'carm':5 'lorenz':2 'ma':4 'pontevedr':3
565	544	LA NOVELA Y SUS CAMINOS	PATAN, FEDERICO				1	1	1	48	2			\N	2021-10-12 14:18:45	2021-10-12 14:18:45	'camin':5 'feder':7 'novel':2 'pat':6
407	394	DICCIONARIOS DE VERBOS	BASURTO, HILDA				1	1	1	60	2			\N	2021-10-06 19:05:24	2021-10-06 19:05:24	'basurt':4 'diccionari':1 'hild':5 'verb':3
408	395	DICCIONARIO DE SINONIMOS Y ANTONIMOS	SIN AUTOR				1	1	1	97	2			\N	2021-10-06 19:05:54	2021-10-06 19:05:54	'anton':5 'autor':7 'diccionari':1 'sinon':3
410	397	DICCIONARIO DE SINONIMOS, ANTONIMOS E IDEAS AFINES	ALBOUKYCK, AARON				1	1	1	59	2			\N	2021-10-06 19:06:57	2021-10-06 19:06:57	'aaron':9 'afin':7 'alboukyck':8 'anton':4 'diccionari':1 'ide':6 'sinon':3
411	398	DICCIONARIO DE SINONIMOS, ANTONIMOS E IDEAS AFINES	ALBOUKYEK, AARON				1	1	1	59	2			\N	2021-10-06 19:07:29	2021-10-06 19:07:29	'aaron':9 'afin':7 'alboukyek':8 'anton':4 'diccionari':1 'ide':6 'sinon':3
412	400	ENGLISH IDIOMS IN USE: 60 UNITS OF VOCABULARY REFE	MCCARTHY, MICHAEL				1	1	1	121	2			\N	2021-10-07 16:58:10	2021-10-07 16:58:22	'60':5 'english':1 'idioms':2 'in':3 'mccarthy':10 'michael':11 'of':7 'ref':9 'units':6 'use':4 'vocabulary':8
422	409	PROCESADOR DE TEXTOS 1: DOCUMENTOS EN LA EMPRESA	EDUCATIONAL TECHNOLOGY CONSULTING				1	1	1	69	2			\N	2021-10-07 18:21:52	2021-10-07 18:21:52	'1':4 'consulting':11 'document':5 'educational':9 'empres':8 'proces':1 'technology':10 'text':3
424	411	MULTIMEDIA: EL MUNDO DE LA PUBLICIDAD	EDUCATIONAL TECHNOLOGY CONSULTING				1	1	1	122	2			\N	2021-10-07 18:24:51	2021-10-07 18:24:51	'consulting':9 'educational':7 'multimedi':1 'mund':3 'public':6 'technology':8
436	422	HABLANDO CON EL DIABLO: ENTREVISTAS CON DICTADORES	ORIZIO, RICCARDO				1	1	1	16	2			\N	2021-10-07 18:48:09	2021-10-07 18:48:09	'diabl':4 'dictador':7 'entrev':5 'habl':1 'orizi':8 'riccard':9
413	401	ENGLISH PHRASEL VERBS IN USE: 70 UNITS OF VOCABULA	MCCARTHY, MICHAEL				1	1	1	121	2			\N	2021-10-07 16:59:25	2021-10-07 16:59:25	'70':6 'english':1 'in':4 'mccarthy':10 'michael':11 'of':8 'phrasel':2 'units':7 'use':5 'verbs':3 'vocabul':9
414	402	INFORMATICA II	IBANEZ CARRASCO, PATRICIA				1	1	1	74	2			\N	2021-10-07 17:00:07	2021-10-07 17:00:07	'carrasc':4 'ibanez':3 'ii':2 'informat':1 'patrici':5
415	403	INFORMATICA: ELABORADO SEGUN LA REFORMA CURRICULAR	BIELSA FERNANDEZ, ISABEL				1	1	1	48	2			\N	2021-10-07 17:00:52	2021-10-07 17:00:52	'biels':7 'curricul':6 'elabor':2 'fernandez':8 'informat':1 'isabel':9 'reform':5 'segun':3
416	404	INFORMATICA 1: ENFOQUE POR COMPETENCIAS	RASSO MORA, HECTOR				1	1	1	61	2			\N	2021-10-07 17:39:26	2021-10-07 17:39:26	'1':2 'competent':5 'enfoqu':3 'hector':8 'informat':1 'mor':7 'rass':6
417	405	COMPETENCIAS INFORMATICAS II: ENFOQUE INTERCULTURA	PEREZ MARTINEZ, MARIA JOSEFINA				1	1	1	83	2			\N	2021-10-07 17:40:57	2021-10-07 17:40:57	'competent':1 'enfoqu':4 'ii':3 'informat':2 'intercultur':5 'josefin':9 'mari':8 'martinez':7 'perez':6
725	684	LEYENDAS DE DUENDES, NAHUALES Y BRUJAS	LOPEZ, HECTOR				1	1	1	133	2			\N	2021-10-15 18:01:23	2021-10-15 18:01:23	'bruj':6 'duend':3 'hector':8 'leyend':1 'lopez':7 'nahual':4
418	406	INTRODUCCION A LA COMPUTACION PARA BACHILLERATO	NORTON, PETER				1	1	1	61	2			\N	2021-10-07 17:55:03	2021-10-07 17:55:50	'bachillerat':6 'computacion':4 'introduccion':1 'norton':7 'pet':8
419	407	TAREAS ESCOLARES CON EXCEL	CASTELLANOS CASAS, RICARDO				1	1	1	83	2			\N	2021-10-07 18:14:03	2021-10-07 18:14:03	'cas':6 'castellan':5 'escolar':2 'excel':4 'ricard':7 'tar':1
425	412	LITERACIA COMPUTACIONAL: INTERNET AND COMPUTING CO	EDUCATIONAL TECHNOLOGY CONSULTING				1	1	1	122	2			\N	2021-10-07 18:25:34	2021-10-07 18:25:34	'and':4 'co':6 'computacional':2 'computing':5 'consulting':9 'educational':7 'internet':3 'literaci':1 'technology':8
426	413	ALMANAQUE MUNDIAL 2014	SIN AUTOR				1	1	1	42	2			\N	2021-10-07 18:26:41	2021-10-07 18:26:41	'2014':3 'almanaqu':1 'autor':5 'mundial':2
427	414	CAMBRIDGE ICT STARTERS THROUGHT REAL JOURNEYS IN T	FUTUREKIDS				1	1	1	124	2			\N	2021-10-07 18:30:18	2021-10-07 18:30:35	'cambridg':1 'futurekids':9 'ict':2 'in':7 'journeys':6 'real':5 'starters':3 't':8 'throught':4
428	415	MIS MEMORIAS	KISSINGER, HENRY				1	1	1	125	2			\N	2021-10-07 18:32:01	2021-10-07 18:32:30	'henry':4 'kissing':3 'memori':2
470	458	RELACION ENTRE MATERIA Y ENERGIA	MARTIN M., ANTONIA				1	1	1	48	2			\N	2021-10-08 19:01:20	2021-10-08 19:01:20	'antoni':8 'energi':5 'm':7 'martin':6 'materi':3 'relacion':1
429	416	GANDHI: EL JOVEN MANIFESTANTE QUE FORMO UNA NACION	WILKINSON, PHILIP				1	1	1	48	2			\N	2021-10-07 18:33:21	2021-10-07 18:33:21	'form':6 'gandhi':1 'jov':3 'manifest':4 'nacion':8 'philip':10 'wilkinson':9
431	417	ANNA FRANK: LA JOVEN ESCRITORA QUE LE CANTO AL MUN	KRAMER, ANN				1	1	1	48	2			\N	2021-10-07 18:40:20	2021-10-07 18:40:20	'ann':12 'anna':1 'cant':8 'escritor':5 'frank':2 'jov':4 'kram':11 'mun':10
432	418	MICHAEL JACKSON, 1958 - 2009	NIETO, GEMA				1	1	1	126	2			\N	2021-10-07 18:41:26	2021-10-07 18:41:35	'1958':3 '2009':4 'gem':6 'jackson':2 'michael':1 'niet':5
433	419	MICHAEL JACKSON, 1958 - 2009: VIDA DE UNA LEYENDA	HEATLEY, MICHAEL				1	1	1	49	2			\N	2021-10-07 18:42:47	2021-10-07 18:42:47	'1958':3 '2009':4 'heatley':9 'jackson':2 'leyend':8 'michael':1,10 'vid':5
435	421	LOS KENNEDY: MI FAMILIA	KENNEDY, EDWARD M.				1	1	1	127	2			\N	2021-10-07 18:47:30	2021-10-07 18:47:30	'edward':6 'famili':4 'kennedy':2,5 'm':7
438	424	PARA ENTENDER A DARWIN	BARAHONA, ANA				1	1	1	66	2			\N	2021-10-07 18:49:38	2021-10-07 18:49:38	'ana':6 'barahon':5 'darwin':4 'entend':2
439	425	STEVE JOBS: LA BIOGRAFIA	ISAACSON, WALTER				1	1	1	97	2			\N	2021-10-07 18:51:03	2021-10-07 18:51:03	'biografi':4 'isaacson':5 'jobs':2 'stev':1 'walt':6
440	426	LA SONRISA DE MANDELA	CARLIN, JOHN				1	1	1	33	2			\N	2021-10-07 18:52:11	2021-10-07 18:52:11	'carlin':5 'john':6 'mandel':4 'sonris':2
441	427	REINOS MALDITOS	MORATO, CRISTINA				1	1	1	33	2			\N	2021-10-07 18:53:16	2021-10-07 18:53:16	'cristin':4 'maldit':2 'morat':3 'rein':1
442	428	THE COLD WAR: SUPERPOWER TENSIONS AND RIVALRIES, C	MAMAUX, ALEXIS				1	1	1	64	2			\N	2021-10-07 18:53:47	2021-10-07 18:53:47	'alexis':10 'and':6 'c':8 'cold':2 'mamaux':9 'rivalri':7 'superpow':4 'tensions':5 'the':1 'war':3
443	429	MAQUIAVELO	BRION, MARCEL				1	1	1	99	2			\N	2021-10-07 18:54:18	2021-10-07 18:54:18	'brion':2 'maquiavel':1 'marcel':3
444	430	FIDEL CASTRO	HUERTAS, PILAR				1	1	1	130	2			\N	2021-10-07 18:55:37	2021-10-07 18:57:12	'castr':2 'fidel':1 'huert':3 'pil':4
454	440	MUJERES CELEBRES	MARIAUD, MARLIK				1	1	1	60	2			\N	2021-10-07 19:49:27	2021-10-07 19:49:27	'celebr':2 'mariaud':3 'marlik':4 'mujer':1
456	443	JUAREZ, EL REPUBLICANO	ZORAIDA VAZQUEZ, JOSEFINA				1	1	1	135	2			\N	2021-10-07 19:51:09	2021-10-07 19:51:37	'josefin':6 'juarez':1 'republican':3 'vazquez':5 'zor':4
445	431	ENCICLOPEDIA DE MALOS ALUMNOS Y REBELDES QUE LLEGA	POUY, JEAN - BERNARD				1	1	1	131	2			\N	2021-10-07 18:56:39	2021-10-07 18:57:00	'alumn':4 'bernard':11 'enciclopedi':1 'jean':10 'lleg':8 'mal':3 'pouy':9 'rebeld':6
446	432	ENCICLOPEDIA DE REBELDES, INSUMISOS Y DEMAS REVOLU	BLANCHARD, ANNE				1	1	1	131	2			\N	2021-10-07 19:42:21	2021-10-07 19:42:21	'anne':9 'blanchard':8 'dem':6 'enciclopedi':1 'insumis':4 'rebeld':3 'revolu':7
447	433	10 LIDERES QUE CAMBIARON EL MUNDO	GIFFORD, CLIVE				1	1	1	132	2			\N	2021-10-07 19:43:32	2021-10-07 19:43:59	'10':1 'cambi':4 'cliv':8 'gifford':7 'lider':2 'mund':6
448	434	LOS BEATLES	GASPAR MOSQUEDA, SERGIO				1	1	1	133	2			\N	2021-10-07 19:44:55	2021-10-07 19:45:30	'beatl':2 'gasp':3 'mosqued':4 'sergi':5
449	435	JIM MORRINSON	GONZALEZ, ANA CECILIA				1	1	1	133	2			\N	2021-10-07 19:46:18	2021-10-07 19:46:18	'ana':4 'cecili':5 'gonzalez':3 'jim':1 'morrinson':2
450	436	JOHN LENON	GASPAR MOSQUEDA, SERGIO				1	1	1	133	2			\N	2021-10-07 19:47:02	2021-10-07 19:47:02	'gasp':3 'john':1 'lenon':2 'mosqued':4 'sergi':5
451	437	BOB MARLEY: UNA HISTORIA Y UN DESTINO	GOMEZ SANCHEZ, MARLENE				1	1	1	133	2			\N	2021-10-07 19:47:30	2021-10-07 19:47:30	'bob':1 'destin':7 'gomez':8 'histori':4 'marlen':10 'marley':2 'sanchez':9
452	438	GANDHI	TORRES PACHECO, JOSEFINA				1	1	1	133	2			\N	2021-10-07 19:48:16	2021-10-07 19:48:16	'gandhi':1 'josefin':4 'pachec':3 'torr':2
453	439	ADOLFO HITLER	GASCA FLORES, EDGAR RODRIGO				1	1	1	133	2			\N	2021-10-07 19:48:58	2021-10-07 19:48:58	'adolf':1 'edgar':5 'flor':4 'gasc':3 'hitl':2 'rodrig':6
457	444	VOCABULARIO TABASQUENO: COLECCION DE LOCUCIONES US	COMISION ESTATAL DE LEXICOGRAFIA. TABASCO				1	1	1	136	2			\N	2021-10-07 19:52:51	2021-10-07 19:53:06	'coleccion':3 'comision':7 'estatal':8 'lexicografi':10 'locucion':5 'tabasc':11 'tabasquen':2 'us':6 'vocabulari':1
458	445	MENTES BRILLANTES: GRANDES PINTORES	CRUZ O, OSCAR RENE				1	1	1	137	2			\N	2021-10-07 19:53:45	2021-10-07 19:54:04	'brillant':2 'cruz':5 'grand':3 'ment':1 'oscar':7 'pintor':4 'ren':8
459	446	PREMIOS NOBEL DE LA LITERATURA EN LA HISTORIA: UN	SOLA VALDES, JORGE				1	1	1	80	2			\N	2021-10-08 16:59:50	2021-10-08 16:59:50	'histori':8 'jorg':12 'literatur':5 'nobel':2 'premi':1 'sol':10 'vald':11
460	447	MENTES BRILLANTES: GRANDES VISIONARIOS	CRUZ O, OSCAR RENE				1	1	1	137	2			\N	2021-10-08 18:04:55	2021-10-08 18:04:55	'brillant':2 'cruz':5 'grand':3 'ment':1 'oscar':7 'ren':8 'visionari':4
461	448	VIDAS SECRETAS DE GRANDES COMPOSITORES: LO QUE NUN	LUNDAY, ELIZABETH				1	1	1	97	2			\N	2021-10-08 18:05:54	2021-10-08 18:05:54	'compositor':5 'elizabeth':10 'grand':4 'lunday':9 'nun':8 'secret':2 'vid':1
462	449	CHICAS MALAS: REYNAS, LOCAS Y OTRAS COSAS PELIGROS	MONTES DE OCA SICILIA, MARIA DEL PILAR				1	1	1	138	2			\N	2021-10-08 18:07:46	2021-10-08 18:08:05	'chic':1 'cos':7 'loc':4 'mal':2 'mari':13 'mont':9 'oca':11 'peligr':8 'pil':15 'reyn':3 'sicili':12
463	450	HISTORIA: LA GUIA VISUAL DEFINITIVA DEL AMANECER D	HART - DAVIS, ADAM				1	1	1	48	2			\N	2021-10-08 18:10:00	2021-10-08 18:10:00	'adam':11 'amanec':7 'd':8 'davis':10 'definit':5 'gui':3 'hart':9 'histori':1 'visual':4
464	451	HUMANO	WINSTON, ROBERT				1	1	1	48	2			\N	2021-10-08 18:11:14	2021-10-08 18:11:14	'human':1 'robert':3 'winston':2
465	452	TIERRA	LUHR, JAMES F.				1	1	1	48	2			\N	2021-10-08 18:17:27	2021-10-08 18:17:27	'f':4 'jam':3 'luhr':2 'tierr':1
467	454	LOS GRANDES MAESTROS DE LA PINTURA UNIVERSAL	RUSSOLI, FRANCO				1	1	1	139	2			\N	2021-10-08 18:20:02	2021-10-08 18:20:11	'franc':9 'grand':2 'maestr':3 'pintur':6 'russoli':8 'universal':7
469	457	LA MEDICION Y SUS UNIDADES	TONDA MAZON, JUAN				1	1	1	48	2			\N	2021-10-08 19:00:23	2021-10-08 19:00:23	'juan':8 'mazon':7 'medicion':2 'tond':6 'unidad':5
468	456	CHOCOLATE: CULTIVO Y CULTURA DEL MEXICO ANTIGUO	SANCHEZ LACY, ALBERTO RUY				1	1	1	140	2			\N	2021-10-08 18:20:39	2021-10-08 19:00:49	'albert':10 'antigu':7 'chocolat':1 'cultiv':2 'cultur':4 'lacy':9 'mexic':6 'ruy':11 'sanchez':8
474	462	GENES Y ADN	WALKER, RICHARD				1	1	1	48	2			\N	2021-10-08 19:05:58	2021-10-08 19:05:58	'adn':3 'gen':1 'richard':5 'walk':4
475	463	ANIMALES GIGANTES	TAYLOR, BARBARA				1	1	1	48	2			\N	2021-10-08 19:32:29	2021-10-08 19:32:29	'animal':1 'barb':4 'gigant':2 'taylor':3
476	464	VIDA MICROSCOPICA	WALKER, RICHARD				1	1	1	48	2			\N	2021-10-08 19:33:04	2021-10-08 19:33:04	'microscop':2 'richard':4 'vid':1 'walk':3
477	465	CRIATURAS PELIGROSAS	WILKES, ANGELA				1	1	1	48	2			\N	2021-10-08 19:33:29	2021-10-08 19:33:29	'angel':4 'criatur':1 'peligr':2 'wilk':3
822	776	TU ESTILO COOL	BERRY, BRENDA				1	1	1	164	2			\N	2021-10-18 18:32:31	2021-10-18 18:32:31	'berry':4 'brend':5 'cool':3 'estil':2
482	470	LAROUSSE ENCICLOPEDIA DE LAS CIENCIAS	SIN AUTOR				1	1	1	59	2			\N	2021-10-08 19:38:12	2021-10-08 19:38:12	'autor':7 'cienci':5 'enciclopedi':2 'larouss':1
483	471	LAROUSSE DOKEO: LA ENCICLOPEDIA DE LA NUEVA GENERA	DUBOIS, PHILIPPE				1	1	1	59	2			\N	2021-10-08 19:40:23	2021-10-08 19:40:23	'doke':2 'dubois':9 'enciclopedi':4 'gener':8 'larouss':1 'nuev':7 'philipp':10
484	472	ENCICLOPEDIA VISUAL DE LOS DEPORTES	FORTIN, JAQUES				1	1	1	60	2			\N	2021-10-08 19:40:59	2021-10-08 19:40:59	'deport':5 'enciclopedi':1 'fortin':6 'jaqu':7 'visual':2
485	473	TOCANDO EL CIELO: MAS ALLA DE LA CANCHA DE BALONCE	LOPEZ VARELA, RAQUEL				1	1	1	110	2			\N	2021-10-08 19:41:32	2021-10-08 19:41:32	'alla':5 'balonc':10 'canch':8 'ciel':3 'lopez':11 'mas':4 'raquel':13 'toc':1 'varel':12
486	474	AVENTURAS EN EL HIELO: LA DIFICIL LUCHA  POR LLEGA	LOPEZ VARELA, RAQUEL				1	1	1	110	2			\N	2021-10-08 19:42:24	2021-10-08 19:42:24	'aventur':1 'dificil':6 'hiel':4 'lleg':9 'lopez':10 'luch':7 'raquel':12 'varel':11
487	475	LA MAGIA DEL CINE: LOS INVENTOS DE LOS HERMANOS LU	LOPEZ VARELA, RAQUEL				1	1	1	110	2			\N	2021-10-08 19:43:00	2021-10-08 19:43:00	'cin':4 'herman':9 'invent':6 'lopez':11 'lu':10 'magi':2 'raquel':13 'varel':12
488	476	CUESTION DE TACTO: LAS COMBINACIONES DE PUNTOS DE	LOPEZ VARELA RAQUEL				1	1	1	110	2			\N	2021-10-08 19:43:58	2021-10-08 19:43:58	'combin':5 'cuestion':1 'lopez':9 'punt':7 'raquel':11 'tact':3 'varel':10
490	478	EL MUNDO MAGICO DEL VIDRIO	LOPEZ TESSY				1	1	1	141	2			\N	2021-10-08 19:46:19	2021-10-08 19:46:19	'lopez':6 'magic':3 'mund':2 'tessy':7 'vidri':5
491	479	LA MORADA COSMICA DEL HOMBRE: IDEAS E INVESTIGACIO	MORENO CORRAL, MARCOS ARTURO				1	1	1	141	2			\N	2021-10-08 19:49:05	2021-10-08 19:49:05	'artur':12 'corral':10 'cosmic':3 'hombr':5 'ide':6 'investigaci':8 'marc':11 'mor':2 'moren':9
492	480	LAS AMIBAS, ENEMIGOS INVISIBLES	MARTINEZ PALOMO, ADOLFO				1	1	1	141	2			\N	2021-10-08 19:49:34	2021-10-08 19:49:34	'adolf':7 'amib':2 'enemig':3 'invis':4 'martinez':5 'palom':6
493	481	MELATONINA: UN DESTELLO DE VIDA EN LA OBSCURIDAD	BENITEZ-KING, GLORIA				1	1	1	141	2			\N	2021-10-08 19:53:31	2021-10-08 19:53:31	'benitez':10 'benitez-king':9 'destell':3 'glori':12 'king':11 'melatonin':1 'obscur':8 'vid':5
494	482	EL SABER Y LOS SENTIDOS	BRAUN, ELIEZER				1	1	1	141	2			\N	2021-10-08 19:53:59	2021-10-08 19:53:59	'braun':6 'eliez':7 'sab':2
496	483	ECOLOGIA DE POBLACIONES	SOBERON MAINERO, JORGE				1	1	1	141	2			\N	2021-10-08 19:57:47	2021-10-08 19:57:47	'ecologi':1 'jorg':6 'mainer':5 'poblacion':3 'soberon':4
497	485	CULTIVOS TRANSGENICOS PARA LA AGRICULTURA LATINOAM	BLANCO, CARLOS A.				1	1	1	141	2			\N	2021-10-11 12:20:10	2021-10-11 12:20:10	'agricultur':5 'blanc':7 'carl':8 'cultiv':1 'latinoam':6 'transgen':2
498	486	DE LAS BACTERIAS AL HOMBRE: LA EVOLUCION	PINERO, DANIEL				1	1	1	141	2			\N	2021-10-11 12:20:36	2021-10-11 12:20:36	'bacteri':3 'daniel':9 'evolucion':7 'hombr':5 'piner':8
499	487	GENESIS Y TRANSFIGURACION DE LAS ESTRELLAS	BOHIGAS, JOAQUIN				1	1	1	141	2			\N	2021-10-11 12:21:05	2021-10-11 12:21:05	'bohig':7 'estrell':6 'genesis':1 'joaquin':8 'transfiguracion':3
500	488	UNA VENTANA A LA INCERTIDUMBRE	BOSH GIRAL, CARLOS				1	1	1	48	2			\N	2021-10-11 12:21:39	2021-10-11 12:21:39	'bosh':6 'carl':8 'giral':7 'incertidumbr':5 'ventan':2
501	489	UNA VENTANA AL INFINITO	BOSCH GIRAL, CARLOS				1	1	1	48	2			\N	2021-10-11 12:22:22	2021-10-11 12:22:22	'bosch':5 'carl':7 'giral':6 'infinit':4 'ventan':2
502	490	REPRESENTACION NUMERICA	MARVAN, LUZ MARIA				1	1	1	48	2			\N	2021-10-11 12:27:42	2021-10-11 12:27:42	'luz':4 'mari':5 'marv':3 'numer':2 'representacion':1
503	491	CRONICAS GEOMETRICAS	RUIZ, CONCEPCION				1	1	1	48	2			\N	2021-10-11 12:30:03	2021-10-11 12:30:03	'concepcion':4 'cronic':1 'geometr':2 'ruiz':3
504	492	LA TIERRA	LOMNITZ, CINNA				1	1	1	48	2			\N	2021-10-11 12:31:57	2021-10-11 12:31:57	'cinn':4 'lomnitz':3 'tierr':2
505	493	MEXICO: RECURSOS NATURALES	GUILLEN, FEDRO CARLOS				1	1	1	48	2			\N	2021-10-11 12:36:24	2021-10-11 12:36:24	'carl':6 'fedr':5 'guill':4 'mexic':1 'natural':3 'recurs':2
506	494	SONIDO, LUZ Y OTRAS ONDAS	DOMINGUEZ HECTOR				1	1	1	48	2			\N	2021-10-11 12:38:21	2021-10-11 12:38:21	'dominguez':6 'hector':7 'luz':2 'ondas':5 'son':1
507	495	LA TIERRA Y EL UNIVERSO	FIERRO, JULIETA				1	1	1	48	2			\N	2021-10-11 12:38:53	2021-10-11 12:38:53	'fierr':6 'juliet':7 'tierr':2 'univers':5
508	496	UNA VENTANA A LAS FORMAS	BOSCH GIRAL, CARLOS				1	1	1	48	2			\N	2021-10-11 12:40:03	2021-10-11 12:40:03	'bosch':6 'carl':8 'form':5 'giral':7 'ventan':2
509	497	UNA VENTANA A LAS INCOGNITAS	BOSH GIRAL, CARLOS				1	1	1	48	2			\N	2021-10-11 12:53:26	2021-10-11 12:53:26	'bosh':6 'carl':8 'giral':7 'incognit':5 'ventan':2
510	498	CALOR Y TEMPERATURA	TAGUENA, JULIA				1	1	1	48	2			\N	2021-10-11 12:54:17	2021-10-11 12:54:17	'calor':1 'juli':5 'taguen':4 'temperatur':3
511	499	MATEMATICAS Y DEPORTE	HERNANDEZ GARCIADIEGO, CARLOS				1	1	1	48	2			\N	2021-10-11 12:55:13	2021-10-11 12:55:13	'carl':6 'deport':3 'garciadieg':5 'hernandez':4 'matemat':1
512	500	LA GEOMETRIA EN EL DEPORTE	HERNANDEZ GARCIADIEGO, CARLOS				1	1	1	48	2			\N	2021-10-11 12:55:42	2021-10-11 12:55:42	'carl':8 'deport':5 'garciadieg':7 'geometri':2 'hernandez':6
513	501	ESTRELLAS BINARIAS INTERACTIUN	ECHEVERRIA, JUAN				1	1	1	48	2			\N	2021-10-11 12:56:03	2021-10-11 12:56:03	'binari':2 'echeverri':4 'estrell':1 'interactiun':3 'juan':5
514	502	EL MUNDO DEL PETROLEO: ORIGEN, USOS Y ESCENARIOS	ORTUNO ARZATE, SALVADOR				1	1	1	16	2			\N	2021-10-11 12:56:33	2021-10-11 12:56:33	'arzat':10 'escenari':8 'mund':2 'orig':5 'ortun':9 'petrole':4 'salvador':11 'usos':6
515	503	EL ESTRES: QUE ES Y COMO EVITARLO	ORLANDINI, ALBERTO				1	1	1	16	2			\N	2021-10-11 12:57:04	2021-10-11 12:57:04	'albert':9 'estres':2 'evit':7 'orlandini':8
516	504	EL COLESTOROL: LO BUENO Y LO MALO	TUDELA, VICTORIA				1	1	1	16	2			\N	2021-10-11 12:57:38	2021-10-11 12:57:38	'buen':4 'colestorol':2 'mal':7 'tudel':8 'victori':9
517	505	ALGEBRA EN TODAS PARTES	PENA, JOSE ANTONIO DE LA				1	1	1	16	2			\N	2021-10-11 12:58:06	2021-10-11 12:58:06	'algebr':1 'antoni':7 'jos':6 'part':4 'pen':5 'tod':3
518	506	EL MUNDO DE LOS MICROBIOS	DREYFUS CORTES, GEORGES				1	1	1	48	2			\N	2021-10-11 12:58:32	2021-10-11 12:58:32	'cort':7 'dreyfus':6 'georg':8 'microbi':5 'mund':2
519	507	LOS MICROBIOS, ¿AMIGOS O ENEMIGOS?	JORGE, DORA E.				1	1	1	16	2			\N	2021-10-11 12:59:05	2021-10-11 12:59:05	'amig':3 'dor':7 'enemig':5 'jorg':6 'microbi':2
520	508	ANIMALES DESCONOCIDOS: RELATOS ACAROLOGICOS	HOFFMANN, ANITA				1	1	1	16	2			\N	2021-10-11 12:59:39	2021-10-11 12:59:39	'acarolog':4 'animal':1 'anit':6 'desconoc':2 'hoffmann':5 'relat':3
521	509	HORMONAS: MENSAJEROS QUIMICOS Y COMUNICACION CELUL	GARCIA SAINZ, JESUS ADOLFO				1	1	1	16	2			\N	2021-10-11 13:00:10	2021-10-11 13:00:10	'adolf':10 'celul':6 'comunicacion':5 'garci':7 'hormon':1 'jesus':9 'mensajer':2 'quimic':3 'sainz':8
522	510	LA QUIMICA Y LA COCINA	CORDOVA FRUNZ, JOSE LUIS				1	1	1	16	2			\N	2021-10-11 13:00:53	2021-10-11 13:00:53	'cocin':5 'cordov':6 'frunz':7 'jos':8 'luis':9 'quimic':2
523	511	CALOR Y MOVIMIENTO	RIOS DE RIEPEN, MAGDALENA				1	1	1	16	2			\N	2021-10-11 13:01:21	2021-10-11 13:01:21	'calor':1 'magdalen':7 'movimient':3 'riep':6 'rios':4
524	512	LA MUERTE Y SUS VENTAJAS	CEREIJIDO, MARCELINO				1	1	1	16	2			\N	2021-10-11 13:01:50	2021-10-11 13:01:50	'cereij':6 'marcelin':7 'muert':2 'ventaj':5
525	513	SEXUALIDAD	R., LIDIA				1	1	1	70	2			\N	2021-10-11 13:02:30	2021-10-11 13:02:30	'lidi':3 'r':2 'sexual':1
527	515	TRASTORNOS DE LA ALIMENTACION	SENRA RIVERA, CARMEN				1	1	1	142	2			\N	2021-10-11 13:04:57	2021-10-11 13:04:57	'alimentacion':4 'carm':7 'river':6 'senr':5 'trastorn':1
526	514	DROGAS	PEREIRO GOMEZ, CESAR				1	1	1	143	2			\N	2021-10-11 13:03:49	2021-10-11 14:22:23	'ces':4 'drog':1 'gomez':3 'pereir':2
529	517	AUTOESTIMA	LORENZO PONTEVEDRA, MA. CARMEN				1	1	1	143	2			\N	2021-10-11 13:07:01	2021-10-11 14:22:49	'autoestim':1 'carm':5 'lorenz':2 'ma':4 'pontevedr':3
530	518	LA COMUNICACION	LORENZO PONTEVEDRA, MA. CARMEN				1	1	1	143	2			\N	2021-10-11 13:08:10	2021-10-11 14:23:03	'carm':6 'comunicacion':2 'lorenz':3 'ma':5 'pontevedr':4
531	519	VIOLENCIA ESCOLAR	ARMAS CASTRO, MANUEL				1	1	1	143	2			\N	2021-10-11 13:14:01	2021-10-11 14:23:15	'armas':3 'castr':4 'escol':2 'manuel':5 'violenci':1
534	522	GLOBALIZACION	VAZQUEZ VARELA, JUAN MANUEL				1	1	1	143	2			\N	2021-10-11 14:21:08	2021-10-11 14:25:18	'globalizacion':1 'juan':4 'manuel':5 'varel':3 'vazquez':2
533	521	ADICCION A NUEVAS TECNOLOGIAS	BECONA IGLESIAS, ELISARDO				1	1	1	143	2			\N	2021-10-11 13:30:42	2021-10-11 14:25:31	'adiccion':1 'becon':5 'elisard':7 'iglesi':6 'nuev':3 'tecnologi':4
532	520	HABILIDADES SOCIALES	LOPEZ DURAN, ANA				1	1	1	143	2			\N	2021-10-11 13:30:09	2021-10-11 14:25:43	'ana':5 'dur':4 'habil':1 'lopez':3 'social':2
535	523	COMO MEJORAR MI COMPORTAMIENTO	PASTOR GIMENO, CARMEN				1	1	1	143	2			\N	2021-10-11 14:27:47	2021-10-11 14:27:47	'carm':7 'comport':4 'gimen':6 'mejor':2 'pastor':5
727	685	8VO. CONCURSO NACIONAL DE CUENTO PREUNIVERSITARIO	UNIVERSIDAD IBEROAMERICANA				1	1	1	91	2			\N	2021-10-15 18:03:08	2021-10-15 18:03:08	'8vo':1 'concurs':2 'cuent':5 'iberoamerican':8 'nacional':3 'preuniversitari':6 'univers':7
746	701	LA SVASTICA: ¿UN SIMBOLO MAS ALLA DE LA REDENCION?	HELLER, STEVEN				1	1	1	97	2			\N	2021-10-15 18:22:28	2021-10-15 18:22:28	'alla':6 'hell':10 'mas':5 'redencion':9 'simbol':4 'stev':11 'svastic':2
542	484	LA INGENIERIA GENETICA, LA NUEVA BIOTECNOLOGIA Y L	SOBERON MAINERO, FRANCISCO JAVIER				1	1	1	141	2			\N	2021-10-11 17:30:57	2021-10-11 17:30:57	'biotecnologi':6 'francisc':11 'genet':3 'ingenieri':2 'javi':12 'l':8 'mainer':10 'nuev':5 'soberon':9
543	527	EL MUNDO HOY	BURGOS RUIZ, ESTRELLA				1	1	1	48	2			\N	2021-10-11 17:36:54	2021-10-11 17:36:54	'burg':4 'estrell':6 'hoy':3 'mund':2 'ruiz':5
544	528	A JUGAR CON LA GRAMATICA	VITAL, ALBERTO				1	1	1	48	2			\N	2021-10-11 18:01:29	2021-10-11 18:01:29	'albert':7 'gramat':5 'jug':2 'vital':6
545	529	LEYES E INSTITUCIONES EN MEXICO	CARBAJAL HUERTA, JUAN				1	1	1	48	2			\N	2021-10-11 20:02:09	2021-10-11 20:02:09	'carbajal':6 'huert':7 'institu':3 'juan':8 'ley':1 'mexic':5
546	530	SER ADOLESCENTE	CARBAJAL HUERTA, ELIZABETH				1	1	1	48	2			\N	2021-10-11 20:02:49	2021-10-11 20:02:49	'adolescent':2 'carbajal':3 'elizabeth':5 'huert':4 'ser':1
753	708	ESPIRITUALIDAD Y ETICA PARA LA VIDA POLITICA Y SOC	SPEZZIBOTTIANI, MARIO				1	1	1	163	2			\N	2021-10-15 18:33:41	2021-10-15 18:35:26	'espiritual':1 'etic':3 'mari':11 'polit':7 'soc':9 'spezzibottiani':10 'vid':6
761	716	RECURSOS DIDACTICOS: ELEMENTOS INDISPENSABLES PARA	FERNANDEZ LOMELIN, ANA GRACIELA				1	1	1	89	2			\N	2021-10-15 18:44:24	2021-10-15 18:44:24	'ana':8 'didact':2 'element':3 'fernandez':6 'graciel':9 'indispens':4 'lomelin':7 'recurs':1
548	531	LA NACION QUE CONSTRUIMOS	REYES JUAREZ, ALEJANDRO				1	1	1	48	2			\N	2021-10-12 13:17:45	2021-10-12 13:17:45	'alejandr':7 'constru':4 'juarez':6 'nacion':2 'rey':5
549	532	ESTUDIO, TRABAJO Y REALIZACION	VILLEGAS REYES, REYNA ADELA				1	1	1	48	2			\N	2021-10-12 13:18:26	2021-10-12 13:18:26	'adel':8 'estudi':1 'realizacion':4 'rey':6 'reyn':7 'trabaj':2 'villeg':5
550	533	DEMOCRACIA Y PARTICIPACION	RICO GALEANA, OLAFF				1	1	1	48	2			\N	2021-10-12 13:23:44	2021-10-12 13:23:44	'democraci':1 'galean':5 'olaff':6 'participacion':3 'ric':4
551	534	MEDIOS DE COMUNICACION	HUCHIM, EDUARDO R.				1	1	1	48	2			\N	2021-10-12 13:30:08	2021-10-12 13:30:08	'comunicacion':3 'eduard':5 'huchim':4 'medi':1 'r':6
552	535	LA GRAMATICA ELECTRONICA	VITAL, ALBERTO				1	1	1	48	2			\N	2021-10-12 13:33:28	2021-10-12 13:33:28	'albert':5 'electron':3 'gramat':2 'vital':4
728	686	RELATOS MEXICANOS POSMODERNOS: ANTOLOGIA DE PROSA,	ZAVALA, LAURO				1	1	1	5	2			\N	2021-10-15 18:05:30	2021-10-15 18:05:30	'antologi':4 'laur':8 'mexican':2 'posmod':3 'pros':6 'relat':1 'zaval':7
747	702	VALORES: CON CUENTOS Y ACTIVIDADES PARA NINOS	RODRIGUEZ OSORIO, ELSA				1	1	1	133	2			\N	2021-10-15 18:23:02	2021-10-15 18:23:02	'activ':5 'cuent':3 'elsa':10 'nin':7 'osori':9 'rodriguez':8 'valor':1
555	537	RELACION ENTRE MATERIA Y ENERGIA	MARTIN M, ANTONIA				1	1	1	48	2			\N	2021-10-12 13:37:35	2021-10-12 13:37:35	'antoni':8 'energi':5 'm':7 'martin':6 'materi':3 'relacion':1
556	538	DOS CIENCIAS QUE ESTUDIAN MI MUNDO	MARTIN M., ANTONIA				1	1	1	48	2			\N	2021-10-12 13:38:25	2021-10-12 13:38:25	'antoni':9 'cienci':2 'dos':1 'estudi':4 'm':8 'martin':7 'mund':6
729	687	ANTOLOGIA POETICA: CON EJERCICIOS ESCOLARES	MAGANA P, MARIA CRISTINA				1	1	1	52	2			\N	2021-10-15 18:10:29	2021-10-15 18:10:29	'antologi':1 'cristin':9 'ejercici':4 'escolar':5 'magan':6 'mari':8 'p':7 'poetic':2
558	539	LOS CONTINENTES	BURGOS RUIZ, ESTRELLA				1	1	1	48	2			\N	2021-10-12 13:42:21	2021-10-12 13:42:21	'burg':3 'continent':2 'estrell':5 'ruiz':4
559	1229	TALLER DE LECTURA Y REDACCION 1	CID GARZON, MARIA DE LOURDES				1	1	1	49	2			\N	2021-10-12 13:44:56	2021-10-12 13:44:56	'1':6 'cid':7 'garzon':8 'lectur':3 'lourd':11 'mari':9 'redaccion':5 'tall':1
560	1322	TALLER DE LECTURA Y REDACCION 1	TORRE ZERMENO, FRANCISCO JAVIER DE LA				1	1	1	61	2			\N	2021-10-12 13:46:13	2021-10-12 13:46:13	'1':6 'francisc':9 'javi':10 'lectur':3 'redaccion':5 'tall':1 'torr':7 'zermen':8
561	540	GENEROS VIEJOS Y NUEVOS	VITAL, ALBERTO				1	1	1	48	2			\N	2021-10-12 14:14:33	2021-10-12 14:14:33	'albert':6 'gener':1 'nuev':4 'viej':2 'vital':5
562	541	EL MOVIMIENTO	TONDA MAZON, JUAN				1	1	1	48	2			\N	2021-10-12 14:15:36	2021-10-12 14:15:36	'juan':5 'mazon':4 'movimient':2 'tond':3
563	542	SOLIDOS Y FLUIDOS	TAGUENA, CARMEN				1	1	1	48	2			\N	2021-10-12 14:16:30	2021-10-12 14:16:30	'carm':5 'flu':3 'sol':1 'taguen':4
564	543	TRAER A CUENTO	ESPEJO, BEATRIZ				1	1	1	48	2			\N	2021-10-12 14:18:01	2021-10-12 14:18:01	'beatriz':5 'cuent':3 'espej':4 'tra':1
566	545	QUE HACEMOS CON LA NATURALEZA	ALCOCER, MARTA				1	1	1	48	2			\N	2021-10-12 14:19:30	2021-10-12 14:19:30	'alcoc':6 'hac':2 'mart':7 'naturalez':5
567	546	LA METAMORFOSIS DEL ESPANOL	VITAL, ALBERTO				1	1	1	48	2			\N	2021-10-12 14:46:40	2021-10-12 14:46:40	'albert':6 'espanol':4 'metamorfosis':2 'vital':5
568	547	MANIFESTACIONES DE LA MATERIA	GARCIA SAIZ, JOSE MARIA				1	1	1	48	2			\N	2021-10-12 14:55:36	2021-10-12 14:55:36	'garci':5 'jos':7 'manifest':1 'mari':8 'materi':4 'saiz':6
569	548	ORILLAS DEL ESPANOL	SEGURA, FRANCISCO				1	1	1	48	2			\N	2021-10-12 14:56:22	2021-10-12 14:56:22	'espanol':3 'francisc':5 'orill':1 'segur':4
570	549	LITERATURA Y LOTERIA	VITAL, ALBERTO				1	1	1	48	2			\N	2021-10-12 14:57:05	2021-10-12 14:57:05	'albert':5 'literatur':1 'loteri':3 'vital':4
571	550	FLOR Y CANTO	NAVARRETE, FEDERICO				1	1	1	48	2			\N	2021-10-12 14:57:44	2021-10-12 14:57:44	'cant':3 'feder':5 'flor':1 'navarret':4
572	551	NATURALEZA HUMANA	CARBAJAL HUERTA, ELIZABETH				1	1	1	48	2			\N	2021-10-12 14:58:27	2021-10-12 14:58:27	'carbajal':3 'elizabeth':5 'huert':4 'human':2 'naturalez':1
573	552	EL AGUA: LA LUCHA POR LA VIDA	LACOSTE, IVES				1	1	1	59	2			\N	2021-10-12 14:59:51	2021-10-12 14:59:51	'agu':2 'ives':9 'lacost':8 'luch':4 'vid':7
574	553	EL CARACOL Y LA ROSA	MARTINEZ TORRES, JOSE				1	1	1	48	2			\N	2021-10-12 15:00:39	2021-10-12 15:00:39	'caracol':2 'jos':8 'martinez':6 'ros':5 'torr':7
823	777	TU ESTILO ROMANTICO	BERRY, BRENDA				1	1	1	164	2			\N	2021-10-18 18:33:07	2021-10-18 18:33:07	'berry':4 'brend':5 'estil':2 'romant':3
579	558	LA ATMOSFERA	GAY GARCIA, CARLOS				1	1	1	48	2			\N	2021-10-12 19:39:09	2021-10-12 19:39:09	'atmosfer':2 'carl':5 'garci':4 'gay':3
580	559	MANIFESTACIONES DE LA ENERGIA	MARTIN M., ANTONIA				1	1	1	48	2			\N	2021-10-12 19:40:26	2021-10-12 19:40:26	'antoni':7 'energi':4 'm':6 'manifest':1 'martin':5
581	560	LA MATERIA	MARTIN M., ANTONIA				1	1	1	48	2			\N	2021-10-12 19:51:01	2021-10-12 19:51:01	'antoni':5 'm':4 'martin':3 'materi':2
582	561	MEXICO ENVUELTO EN MARES	CRUZ WILSON, LUCI				1	1	1	48	2			\N	2021-10-12 19:53:44	2021-10-12 19:53:44	'cruz':5 'envuelt':2 'luci':7 'mar':4 'mexic':1 'wilson':6
609	589	EL ARTE GRIEGO	MONTEMAYOR GARCIA, ALICIA				1	1	1	72	2			\N	2021-10-14 15:18:10	2021-10-14 15:18:10	'alici':6 'arte':2 'garci':5 'grieg':3 'montemayor':4
583	562	DEL ATOMO AL HOMBRE	GARCIA, HORACIO				1	1	1	48	2			\N	2021-10-12 19:54:49	2021-10-12 19:54:49	'atom':2 'garci':5 'hombr':4 'horaci':6
584	564	NUESTRO CUERPO	ROSENSTEIN, YVONNE				1	1	1	48	2			\N	2021-10-13 12:18:26	2021-10-13 12:18:26	'cuerp':2 'rosenstein':3 'yvonn':4
585	565	DE LOS PIES A LA CABEZA	ZUBIETA LOPEZ, PALOMA				1	1	1	48	2			\N	2021-10-13 12:19:31	2021-10-13 12:19:31	'cabez':6 'lopez':8 'palom':9 'pies':3 'zubiet':7
586	566	LA EVOLUCION Y EL HOMBRE	NUNEZ FARFAN, JUAN				1	1	1	48	2			\N	2021-10-13 12:25:49	2021-10-13 12:25:49	'evolucion':2 'farf':7 'hombr':5 'juan':8 'nunez':6
587	567	CUERPO SALUDABLE	ROSENSTEIN, YVONNE				1	1	1	48	2			\N	2021-10-13 13:49:19	2021-10-13 13:49:19	'cuerp':1 'rosenstein':3 'salud':2 'yvonn':4
588	568	MEXICO: DOS PROYECTOS DE MODERNIDAD	GAMBOA RAMIREZ, RICARDO				1	1	1	48	2			\N	2021-10-13 13:51:22	2021-10-13 13:51:22	'dos':2 'gambo':6 'mexic':1 'modern':5 'proyect':3 'ramirez':7 'ricard':8
730	688	LOS MITOS MAS ASOMBROSOS DE LA ANTIGUA GRECIA: ENT	GUEVARA, ANA LILIA				1	1	1	133	2			\N	2021-10-15 18:11:44	2021-10-15 18:11:44	'ana':11 'antigu':7 'asombr':4 'ent':9 'greci':8 'guev':10 'lili':12 'mas':3 'mit':2
590	569	PANORAMA DEL SIGLO XX	ORTEGA, MARTHA				1	1	1	48	2			\N	2021-10-13 13:52:48	2021-10-13 13:52:48	'marth':6 'orteg':5 'panoram':1 'sigl':3 'xx':4
656	631	EL LIBRO DE LA FILOSOFIA	SIN AUTOR				1	1	1	118	2			\N	2021-10-14 17:34:36	2021-10-14 17:34:36	'autor':7 'filosofi':5 'libr':2
591	570	LA QUIMICA DE LA VIDA Y EL AMBIENTE	IRAZOQUE, GLINDA				1	1	1	48	2			\N	2021-10-13 13:53:22	2021-10-13 13:53:22	'ambient':8 'glind':10 'irazoqu':9 'quimic':2 'vid':5
592	571	LA QUIMICA DE LOS FLUIDOS NATURALES	IRAZOQUE, GLINDA				1	1	1	48	2			\N	2021-10-13 13:53:51	2021-10-13 13:53:51	'flu':5 'glind':8 'irazoqu':7 'natural':6 'quimic':2
593	573	EL UNIVERSO DE LA QUIMICA	GARCIA, HORACIO				1	1	1	48	2			\N	2021-10-13 13:54:23	2021-10-13 13:54:23	'garci':6 'horaci':7 'quimic':5 'univers':2
594	574	EDAD MEDIA EN EUROPA	FRIAS, JORGE				1	1	1	48	2			\N	2021-10-13 13:55:01	2021-10-13 13:55:01	'edad':1 'europ':4 'fri':5 'jorg':6 'medi':2
595	575	DE LA PREHISTORIA A LAS CIVILIZACIONES AGRICOLAS	LUISELLI, DANIELA				1	1	1	48	2			\N	2021-10-13 13:55:29	2021-10-13 13:55:29	'agricol':7 'civiliz':6 'daniel':9 'luiselli':8 'prehistori':3
596	576	LAS TRANSFORMACIONES DEL SIGLO XX	GAMBOA RAMIREZ, RICARDO				1	1	1	48	2			\N	2021-10-13 13:56:16	2021-10-13 13:56:16	'gambo':6 'ramirez':7 'ricard':8 'sigl':4 'transform':2 'xx':5
597	577	EL SIGLO XIX A VUELO DE PAJARO	POBLETT, MARTHA				1	1	1	48	2			\N	2021-10-13 13:57:11	2021-10-13 13:57:11	'marth':9 'pajar':7 'poblett':8 'sigl':2 'vuel':5 'xix':3
598	578	DEL ABSOLUTISMO A LAS REVOLUCIONES	GAMBOA RAMIREZ, RICARDO				1	1	1	48	2			\N	2021-10-13 13:58:17	2021-10-13 13:58:17	'absolut':2 'gambo':6 'ramirez':7 'revolu':5 'ricard':8
599	579	LA CIVILIZACION MESOAMERICANA	ESCALANTE GONZALBO, PABLO				1	1	1	48	2			\N	2021-10-13 13:58:46	2021-10-13 13:58:46	'civilizacion':2 'escal':4 'gonzalb':5 'mesoamerican':3 'pabl':6
603	583	LA CASA ECOLOGICA	CALVILLO UNNA, JORGE				1	1	1	72	2			\N	2021-10-14 12:54:39	2021-10-14 12:54:39	'calvill':4 'cas':2 'ecolog':3 'jorg':6 'unna':5
604	584	GRANDES IDEAS DE LA CIENCIA DEL SIGLO XX	CHAMIZO, JOSE ANTONIO				1	1	1	72	2			\N	2021-10-14 12:56:52	2021-10-14 12:56:52	'antoni':11 'chamiz':9 'cienci':5 'grand':1 'ide':2 'jos':10 'sigl':7 'xx':8
605	585	LA BIOETICA	KRAUS, ARNALDO				1	1	1	72	2			\N	2021-10-14 13:02:22	2021-10-14 13:02:22	'arnald':4 'bioetic':2 'kraus':3
606	586	LA DIVERSIDAD BIOLOGICA DE MEXICO	CARRILLO TRUEBA, CESAR				1	1	1	72	2			\N	2021-10-14 13:02:58	2021-10-14 13:02:58	'biolog':3 'carrill':6 'ces':8 'divers':2 'mexic':5 'trueb':7
607	587	LA ETICA	GARZON BATES, MERCEDES				1	1	1	72	2			\N	2021-10-14 14:42:24	2021-10-14 14:42:24	'bat':4 'etic':2 'garzon':3 'merced':5
608	588	LOS MAYAS	VALVERDE VALDES; MARIA DEL CARMEN				1	1	1	72	2			\N	2021-10-14 14:42:57	2021-10-14 14:42:57	'carm':7 'mari':5 'may':2 'vald':4 'valverd':3
610	590	LA MUSICA CONTEMPORANEA	HELGUERA, LUIS IGNACIO				1	1	1	72	2			\N	2021-10-14 15:20:38	2021-10-14 15:20:38	'contemporane':3 'helguer':4 'ignaci':6 'luis':5 'music':2
611	591	LAS DROGAS	VALEK VALDES, GLORIA				1	1	1	72	2			\N	2021-10-14 15:22:12	2021-10-14 15:22:12	'drog':2 'glori':5 'vald':4 'valek':3
612	592	LA ANTROPOLOGIA	TEJERA GAONA, HECTOR				1	1	1	72	2			\N	2021-10-14 15:35:40	2021-10-14 15:35:40	'antropologi':2 'gaon':4 'hector':5 'tejer':3
613	593	ARTE PREHISPANICO	ESCALANTE GONZALBO, PABLO				1	1	1	72	2			\N	2021-10-14 15:36:12	2021-10-14 15:36:12	'arte':1 'escal':3 'gonzalb':4 'pabl':5 'prehispan':2
614	594	LA BIOTECNOLOGIA	LOPEZ-MUNGUIA CANALES, AGUSTIN				1	1	1	72	2			\N	2021-10-14 15:36:49	2021-10-14 15:36:49	'agustin':7 'biotecnologi':2 'canal':6 'lopez':4 'lopez-mungui':3 'mungui':5
615	595	LA INCREIBLE Y TRISTE HISTORIA DE LA CANDIDA EREND	GARCIA MARQUEZ, GABRIEL				1	1	1	146	2			\N	2021-10-14 15:37:47	2021-10-14 15:38:17	'cand':8 'erend':9 'gabriel':12 'garci':10 'histori':5 'increibl':2 'marquez':11 'trist':4
616	596	CRONICA DE UNA MUERTE ANUNCIADA	GARCIA MARQUEZ, GABRIEL				1	1	1	146	2			\N	2021-10-14 15:38:50	2021-10-14 15:38:50	'anunci':5 'cronic':1 'gabriel':8 'garci':6 'marquez':7 'muert':4
617	597	DEL AMOR Y OTROS DEMONIOS	GARCIA MARQUEZ, GABRIEL				1	1	1	146	2			\N	2021-10-14 15:39:16	2021-10-14 15:39:16	'amor':2 'demoni':5 'gabriel':8 'garci':6 'marquez':7
618	598	CIEN ANOS DE SOLEDAD	GARCIA MARQUEZ, GABRIEL				1	1	1	146	2			\N	2021-10-14 15:39:39	2021-10-14 15:39:39	'anos':2 'cien':1 'gabriel':7 'garci':5 'marquez':6 'soled':4
622	602	COMO ELEGIR MI PROFESION	LOUREIRO SILVA, RUBEN				1	1	1	143	2			\N	2021-10-14 15:46:51	2021-10-14 15:46:51	'eleg':2 'loureir':5 'profesion':4 'rub':7 'silv':6
623	603	AUTOCONTROL	FERNANDEZ DEL RIO, ELENA				1	1	1	143	2			\N	2021-10-14 15:47:52	2021-10-14 15:47:52	'autocontrol':1 'elen':5 'fernandez':2 'rio':4
624	604	LAS BATALLAS EN EL DESIERTO	PACHECO, JOSE EMILIO				1	1	1	58	2			\N	2021-10-14 15:48:36	2021-10-14 15:48:36	'batall':2 'desiert':5 'emili':8 'jos':7 'pachec':6
625	605	TRES DIAS Y UN CENICERO Y OTROS CUENTOS	ARREOLA, JUAN JOSE				1	1	1	48	2			\N	2021-10-14 16:07:08	2021-10-14 16:07:08	'arreol':9 'cenicer':5 'cuent':8 'dias':2 'jos':11 'juan':10 'tres':1
626	606	GEOMETRIA Y EL MUNDO	PENA, JOSE ANTONIO DE LA				1	1	1	48	2			\N	2021-10-14 16:09:22	2021-10-14 16:09:22	'antoni':7 'geometri':1 'jos':6 'mund':4 'pen':5
627	607	MATEMATICAS Y VIDA COTIDIANA	PENA, JOSE ANTONIO DE LA				1	1	1	48	2			\N	2021-10-14 16:15:28	2021-10-14 16:15:28	'antoni':7 'cotidian':4 'jos':6 'matemat':1 'pen':5 'vid':3
628	608	EL HOLOCAUSTO ESPANOL: ODIO Y EXTERMINIO EN LA GUE	PRESTON, PAUL				1	1	1	128	2			\N	2021-10-14 16:16:02	2021-10-14 16:16:02	'espanol':3 'extermini':6 'gue':9 'holocaust':2 'odi':4 'paul':11 'preston':10
630	610	THE COMPLETE PERSEPOLIS	SATRAPI, MARJANE				1	1	1	147	2			\N	2021-10-14 16:17:31	2021-10-14 16:18:22	'complet':2 'marjan':5 'persepolis':3 'satrapi':4 'the':1
631	611	CAMBIO CLIMATICO	GARNIER, LISA				1	1	1	59	2			\N	2021-10-14 16:19:14	2021-10-14 16:19:14	'cambi':1 'climat':2 'garni':3 'lis':4
632	613	CONSUMISMO	RODRIGUEZ VILLARINO, RAFAEL				1	1	1	143	2			\N	2021-10-14 16:19:45	2021-10-14 16:19:45	'consum':1 'rafael':4 'rodriguez':2 'villarin':3
633	614	HIGIENE PERSONAL	SMYTH CHAMOSA, ERNESTO				1	1	1	143	2			\N	2021-10-14 16:20:12	2021-10-14 16:20:12	'chamos':4 'ernest':5 'higien':1 'personal':2 'smyth':3
634	615	ALCOHOL	LORENZO PONTEVEDRA, MARIA DEL CARMEN				1	1	1	143	2			\N	2021-10-14 16:20:50	2021-10-14 16:20:50	'alcohol':1 'carm':6 'lorenz':2 'mari':4 'pontevedr':3
635	616	TABACO	BECONA IGLESIAS, ELISARDO				1	1	1	143	2			\N	2021-10-14 16:21:16	2021-10-14 16:21:16	'becon':2 'elisard':4 'iglesi':3 'tabac':1
636	618	TIMIDEZ	OLIVARES RODRIGUEZ, JOSE				1	1	1	143	2			\N	2021-10-14 16:47:43	2021-10-14 16:47:43	'jos':4 'olivar':2 'rodriguez':3 'timidez':1
637	619	HISTORIA DE LAS DOCTRINAS FILOSOFICAS	CHAVEZ CALDERON, PEDRO				1	1	1	75	2			\N	2021-10-14 16:51:20	2021-10-14 16:51:20	'calderon':7 'chavez':6 'doctrin':4 'filosof':5 'histori':1 'pedr':8
678	645	LA REVOLUCIONCITA MEXICANA	RIUS				1	1	1	84	2			\N	2021-10-14 19:18:51	2021-10-14 19:18:51	'mexican':3 'revolucioncit':2 'rius':4
638	620	RAICES DE LA SABIDURIA: UN TAPIZ DE TRADICIONES FI	MITCHELL, HELEN BUS				1	1	1	74	2			\N	2021-10-14 16:51:49	2021-10-14 16:51:49	'bus':12 'fi':9 'hel':11 'mitchell':10 'raic':1 'sabiduri':4 'tapiz':6 'tradicion':8
731	689	ACROBATA DEL CIELO: ANTOLOGIA BREVE	HUIDOBRO, VICENTE				1	1	1	72	2			\N	2021-10-15 18:12:24	2021-10-15 18:12:24	'acrobat':1 'antologi':4 'brev':5 'ciel':3 'huidobr':6 'vicent':7
640	621	RAICES DE LA SABIDURIA	MITCHELL, HELEN BUS				1	1	1	54	2			\N	2021-10-14 16:55:37	2021-10-14 16:55:37	'bus':7 'hel':6 'mitchell':5 'raic':1 'sabiduri':4
748	703	UNIVERSO ESCULTORICO MESOAMERICANO	ORTEGA, ANA				1	1	1	72	2			\N	2021-10-15 18:23:32	2021-10-15 18:23:32	'ana':5 'escultor':2 'mesoamerican':3 'orteg':4 'univers':1
754	709	TU ADOLESCENTE Y SUS EMOCIONES: COMO AYUDARLOS A M	DELGADILLO, DONANIN				1	1	1	133	2			\N	2021-10-15 18:37:04	2021-10-15 18:37:04	'adolescent':2 'ayud':7 'delgadill':10 'donanin':11 'emocion':5 'm':9
762	717	BULLYING: EL ASECHO COTIDIANO EN LAS ESCUELAS	COBO, PALOMA				1	1	1	89	2			\N	2021-10-15 18:45:24	2021-10-15 18:45:24	'asech':3 'bullying':1 'cob':8 'cotidian':4 'escuel':7 'palom':9
773	728	AMIGOS PARA SIEMPRE: EL VERDADERO VALOR DE LA AMIS	TREVOR GREIVE, BRADLEY				1	1	1	164	2			\N	2021-10-18 12:21:11	2021-10-18 12:21:11	'amig':1 'amis':9 'bradley':12 'greiv':11 'siempr':3 'trevor':10 'valor':6 'verdader':5
645	622	FILOSOFIA: BACHILLERATO	LEON SANTANDER, ROBERTO				1	1	1	63	2			\N	2021-10-14 17:03:35	2021-10-14 17:03:35	'bachillerat':2 'filosofi':1 'leon':3 'robert':5 'santand':4
647	623	FILOSOFIA PARA NINOS	ECHEVERRIA, EUGENIO				1	1	1	148	2			\N	2021-10-14 17:09:41	2021-10-14 17:09:53	'echeverri':4 'eugeni':5 'filosofi':1 'nin':3
649	624	TEMAS SELECTOS DE FILOSOFIA	CADENA MAGANA, ANTONIO				1	1	1	54	2			\N	2021-10-14 17:12:35	2021-10-14 17:12:35	'antoni':7 'caden':5 'filosofi':4 'magan':6 'select':2 'tem':1
650	625	INTRODUCCION AL PENSAMIENTO FILOSOFICO EN MEXICO	ESCOBAR, GUSTAVO				1	1	1	89	2			\N	2021-10-14 17:14:03	2021-10-14 17:14:03	'escob':7 'filosof':4 'gustav':8 'introduccion':1 'mexic':6 'pensamient':3
651	626	LOGICA	SUAREZ RUIZ, JAVIER A.				1	1	1	48	2			\N	2021-10-14 17:29:47	2021-10-14 17:29:47	'javi':4 'logic':1 'ruiz':3 'suarez':2
652	627	HISTORIA DE LAS DOCTRINAS FILOSOFICAS	ZAGAL ARREGUIN, HECTOR JESUS				1	1	1	48	2			\N	2021-10-14 17:30:19	2021-10-14 17:30:19	'arreguin':7 'doctrin':4 'filosof':5 'hector':8 'histori':1 'jesus':9 'zagal':6
653	628	THEORY OF KNOWLEDGE: COURSE COMPANION	DOMBROWSKI, EILEEN				1	1	1	64	2			\N	2021-10-14 17:30:45	2021-10-14 17:30:45	'companion':5 'cours':4 'dombrowski':6 'eil':7 'knowledg':3 'of':2 'theory':1
654	629	FILOSOFIA: UNA GUIA GRAFICA DE LA HISTORIA DEL PEN	ROBINSON, DAVE				1	1	1	29	2			\N	2021-10-14 17:31:17	2021-10-14 17:31:17	'dav':11 'filosofi':1 'grafic':4 'gui':3 'histori':7 'pen':9 'robinson':10
655	630	LO QUE PIENSAN LOS FILOSOFOS	BAGGINI, JULIAN				1	1	1	29	2			\N	2021-10-14 17:34:03	2021-10-14 17:34:03	'baggini':6 'filosof':5 'juli':7 'piens':3
657	632	LOS GRANDES FILOSOFOS: DE SOCRATES A FAUCAULT	STANGROON, JEREMY				1	1	1	19	2			\N	2021-10-14 18:04:41	2021-10-14 18:04:41	'faucault':7 'filosof':3 'grand':2 'jeremy':9 'socrat':5 'stangroon':8
732	690	ERNESTINA O EL NACIMIENTO DEL AMOR	STANDHAL				1	1	1	72	2			\N	2021-10-15 18:12:56	2021-10-15 18:12:56	'amor':6 'ernestin':1 'nacimient':4 'standhal':7
749	704	TEATRO PARA ESTUDIANTES DE TEATRO: OBRAS BREVES PA	SIN AUTOR				1	1	1	160	2			\N	2021-10-15 18:24:16	2021-10-15 18:24:43	'autor':10 'brev':7 'estudi':3 'obras':6 'pa':8 'teatr':1,5
755	710	EN BUSCA DEL SENTIDO: LOS PRINCIPIOS DE VIKTOR FRA	PATTAKOS, ALEX				1	1	1	29	2			\N	2021-10-15 18:37:40	2021-10-15 18:38:21	'alex':11 'busc':2 'fra':9 'pattak':10 'principi':6 'viktor':8
663	634	EMOCIONES Y SENTIMIENTOS	MIGUEZ VARELA, MA. DEL CARMEN				1	1	1	143	2			\N	2021-10-14 18:11:24	2021-10-14 18:11:24	'carm':8 'emocion':1 'ma':6 'miguez':4 'sentimient':3 'varel':5
778	733	EL SENTIDO DE LA VIDA	TREVOR GREIVE, BRADLEY				1	1	1	89	2			\N	2021-10-18 12:24:26	2021-10-18 12:24:26	'bradley':8 'greiv':7 'trevor':6 'vid':5
665	633	VIOLENCIA  ESCOLAR	ARMAS CASTRO, MANUEL				1	1	1	143	2			\N	2021-10-14 18:51:32	2021-10-14 18:51:32	'armas':3 'castr':4 'escol':2 'manuel':5 'violenci':1
779	734	EL SENTIDO  DE LA VIDA	TREVOR GREIVE, BRADLEY				1	1	1	164	2			\N	2021-10-18 12:25:26	2021-10-18 12:25:26	'bradley':8 'greiv':7 'trevor':6 'vid':5
783	738	ETICA Y VALORES II	PINA OSORIO, JUAN				1	1	1	53	2			\N	2021-10-18 12:28:38	2021-10-18 12:28:38	'etic':1 'ii':4 'juan':7 'osori':6 'pin':5 'valor':3
666	635	RECICLAJE	PRECIOSO, JOSE				1	1	1	143	2			\N	2021-10-14 18:52:21	2021-10-14 18:52:21	'jos':3 'precios':2 'reciclaj':1
667	636	VALORES SOCIALES	VAZQUEZ FREIRE, MIGUEL				1	1	1	143	2			\N	2021-10-14 18:52:53	2021-10-14 18:52:53	'freir':4 'miguel':5 'social':2 'valor':1 'vazquez':3
668	637	RESPETO A LA IGUALDAD	RADL PHILIPP, RITA				1	1	1	143	2			\N	2021-10-14 18:53:52	2021-10-14 18:53:52	'iguald':4 'philipp':6 'radl':5 'respet':1 'rit':7
669	638	THEORY OF KNOWLEDGE FOR THE IB DIPLOMA	LAGEMAAT, RICHARD VAN DE				1	1	1	121	2			\N	2021-10-14 18:54:31	2021-10-14 18:54:31	'diplom':7 'for':4 'ib':6 'knowledg':3 'lagemaat':8 'of':2 'richard':9 'the':5 'theory':1 'van':10
670	639	CUENTOS Y LEYENDAS DE AFRICA	SOLER PONT, ANNA				1	1	1	32	2			\N	2021-10-14 19:00:39	2021-10-14 19:00:39	'afric':5 'anna':8 'cuent':1 'leyend':3 'pont':7 'sol':6
733	691	EL PERSEGUIDOR	CORTAZAR, JULIO				1	1	1	6	2			\N	2021-10-15 18:13:33	2021-10-15 18:13:33	'cortaz':3 'juli':4 'perseguidor':2
672	640	COMO HABLARLE A LOS HIJOS: PALABRAS QUE ENSENAN Y	MOORMAN, CHICK				1	1	1	135	2			\N	2021-10-14 19:03:19	2021-10-14 19:03:19	'chick':11 'ensen':8 'habl':2 'hij':5 'moorm':10 'palabr':6
673	641	VALORES PARA NINOS	OJEDA, RAMON				1	1	1	149	2			\N	2021-10-14 19:10:36	2021-10-14 19:10:36	'nin':3 'ojed':4 'ramon':5 'valor':1
675	642	LA REVOLUCION FEMENINA DE LAS MUJERES	RIUS				1	1	1	15	2			\N	2021-10-14 19:16:50	2021-10-14 19:16:50	'femenin':3 'mujer':6 'revolucion':2 'rius':7
676	643	EL DIABLO SE LLAMA TROTSKY	RIUS				1	1	1	15	2			\N	2021-10-14 19:17:23	2021-10-14 19:17:23	'diabl':2 'llam':4 'rius':6 'trotsky':5
677	644	LENIN PARA PRINCIPIANTES	RIUS				1	1	1	15	2			\N	2021-10-14 19:17:53	2021-10-14 19:17:53	'lenin':1 'principi':3 'rius':4
680	647	COCA COLA: LA DROGA QUE REFRESCA	RIUS				1	1	1	15	2			\N	2021-10-14 19:20:34	2021-10-14 19:20:34	'coc':1 'col':2 'drog':4 'refresc':6 'rius':7
756	711	EL LIBRO DE LAS CHICAS AUDACES	WONDER, EMMA				1	1	1	47	2			\N	2021-10-15 18:38:55	2021-10-15 18:38:55	'audac':6 'chic':5 'emma':8 'libr':2 'wond':7
763	718	PENSAMIENTO CRITICO Y APRENDIZAJE: UNA COMPETENCIA	RODRIGUEZ Y DIAZ, MA. DEL PILAR				1	1	1	89	2			\N	2021-10-15 18:46:40	2021-10-15 18:46:40	'aprendizaj':4 'competent':6 'critic':2 'diaz':9 'ma':10 'pensamient':1 'pil':12 'rodriguez':7
805	759	POR EL PLACER DE VIVIR	LOZANO, CESAR				1	1	1	2	2			\N	2021-10-18 13:27:03	2021-10-18 13:27:03	'ces':7 'lozan':6 'plac':3 'viv':5
684	648	LA  REVOLUCIONCITA MEXICANA	RIUS				1	1	1	84	2			\N	2021-10-14 19:23:57	2021-10-14 19:23:57	'mexican':3 'revolucioncit':2 'rius':4
685	649	LA TRUKULENTA HISTORIA DEL KAPITALISMO	RIUS				1	1	1	30	2			\N	2021-10-14 19:54:17	2021-10-14 19:54:17	'histori':3 'kapital':5 'rius':6 'trukulent':2
686	650	MACHISMO, FEMINISMO Y HOMOSEXUALISMO	RIUS				1	1	1	15	2			\N	2021-10-15 13:54:50	2021-10-15 13:54:50	'femin':2 'homosexual':4 'machism':1 'rius':5
687	651	LA ALIMENTACION: ¿QUE COMEMOS?	CHARVET, JEAN PAUL				1	1	1	59	2			\N	2021-10-15 16:23:39	2021-10-15 16:23:39	'alimentacion':2 'charvet':5 'com':4 'jean':6 'paul':7
688	652	CUENTOS MEXICANOS: ANTOLOGIA	ALATRISTE, SEALTIEL				1	1	1	5	2			\N	2021-10-15 16:24:07	2021-10-15 16:24:07	'alatr':4 'antologi':3 'cuent':1 'mexican':2 'sealtiel':5
689	653	MARES Y OCEANOS: ¿EL PLANETA LIQUIDO?	LEFEVRE BALLEYDIER, ANNE				1	1	1	59	2			\N	2021-10-15 16:24:33	2021-10-15 16:24:33	'anne':9 'balleydi':8 'lefevr':7 'liqu':6 'mar':1 'ocean':3 'planet':5
690	654	LA NUEVA GEOPOLITICA: ¿ES POSIBLE LA PAZ?	GERE, FRANCOIS				1	1	1	59	2			\N	2021-10-15 16:25:00	2021-10-15 16:25:00	'francois':9 'geopolit':3 'ger':8 'nuev':2 'paz':7 'posibl':5
691	655	LA POBLACION EN EL MUNDO: 6000 MILLONES ¿Y MANANA?	ROLLET, CATHERINE				1	1	1	59	2			\N	2021-10-15 16:25:38	2021-10-15 16:25:38	'6000':6 'catherin':11 'manan':9 'millon':7 'mund':5 'poblacion':2 'rollet':10
692	656	FENOMENOS NATURALES: LAS FUERZAS DE LA TIERRA	DEBROISE, ANNE				1	1	1	59	2			\N	2021-10-15 16:26:32	2021-10-15 16:26:32	'anne':9 'debrois':8 'fenomen':1 'fuerz':4 'natural':2 'tierr':7
693	657	LA CLONACION: RIESGOS Y EXPECTATIVAS	ROBERT, ODILE				1	1	1	59	2			\N	2021-10-15 16:27:06	2021-10-15 16:27:06	'clonacion':2 'expect':5 'odil':7 'riesg':3 'robert':6
694	658	PUEBLOS PRIMEROS: CULTURAS ANCESTRALES	BIMBENET, JEROME				1	1	1	59	2			\N	2021-10-15 16:27:49	2021-10-15 16:27:49	'ancestral':4 'bimbenet':5 'cultur':3 'jerom':6 'primer':2 'puebl':1
695	659	RELIGIONESEN EL MUNDO: ¿EN QUE CREEMOS?	GIRA, DENNIS				1	1	1	59	2			\N	2021-10-15 16:28:55	2021-10-15 16:28:55	'cre':6 'dennis':8 'gir':7 'mund':3 'religiones':1
696	660	DESDE EL AZUL DEL CIELO	BOMBARA, PAULA				1	1	1	56	2			\N	2021-10-15 16:29:31	2021-10-15 16:29:31	'azul':3 'bomb':6 'ciel':5 'paul':7
697	661	GRACIAS POR EL FUEGO	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 16:38:38	2021-10-15 16:39:00	'benedetti':5 'fueg':4 'graci':1 'mari':6
698	662	LA SIRENA VIUDA	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 16:57:56	2021-10-15 16:57:56	'benedetti':4 'mari':5 'siren':2 'viud':3
700	663	VIENTO DEL EXILIO	VIENTO DEL EXILIO				1	1	1	150	2			\N	2021-10-15 16:59:48	2021-10-15 16:59:48	'exili':3,6 'vient':1,4
701	664	COTIDIANAS (1978-1979)	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 17:02:04	2021-10-15 17:02:04	'-1979':3 '1978':2 'benedetti':4 'cotidian':1 'mari':5
704	665	EL AMOR, LAS MUJERES Y LA VIDA	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 17:03:51	2021-10-15 17:03:51	'amor':2 'benedetti':8 'mari':9 'mujer':4 'vid':7
705	666	POEMAS DE LA OFICINA (1953-1956)	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 17:04:51	2021-10-15 17:04:51	'-1956':6 '1953':5 'benedetti':7 'mari':8 'oficin':4 'poem':1
750	705	HISTORIA DEL FEMINISMO: SIGLOS XIX Y XX	SOLE ROMEO, GLORIA				1	1	1	161	2			\N	2021-10-15 18:26:12	2021-10-15 18:26:37	'femin':3 'glori':10 'histori':1 'rome':9 'sigl':4 'sol':8 'xix':5 'xx':7
707	668	LAS SOLEDADES DE BABEL	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 17:07:34	2021-10-15 17:07:34	'babel':4 'benedetti':5 'mari':6 'soledad':2
706	667	LA BURRA DEL CAFE	BENEDETTI, MARIO				1	1	1	150	2			\N	2021-10-15 17:07:05	2021-10-15 17:08:02	'benedetti':5 'burr':2 'caf':4 'mari':6
757	712	¿PORQUE ES TAN DIFICIL SER PADRE HOY?. SIMETRIA IN	MESSING, CLAUDIA				1	1	1	114	2			\N	2021-10-15 18:40:18	2021-10-15 18:40:18	'claudi':11 'dificil':4 'hoy':7 'in':9 'messing':10 'padr':6 'ser':5 'simetri':8 'tan':3
709	669	BIOGRAFIA PARA ENCONTRARME	BENEDETTI, MARIO				1	1	1	5	2			\N	2021-10-15 17:15:34	2021-10-15 17:15:34	'benedetti':4 'biografi':1 'encontr':3 'mari':5
710	670	PARA ENTENDER LA DIVERSIDAD CULTURAL Y LA AUTONOMI	DIAZ POLANCO HECTOR				1	1	1	151	2			\N	2021-10-15 17:16:11	2021-10-15 17:17:05	'autonomi':8 'cultural':5 'diaz':9 'divers':4 'entend':2 'hector':11 'polanc':10
764	719	INTELIGENCIAS MULTIPLES: YO SOY INTELIGENTE, TU ER	GUTIERREZ, MARIA ARACELI				1	1	1	89	2			\N	2021-10-15 18:47:41	2021-10-15 18:48:27	'araceli':10 'er':7 'gutierrez':8 'inteligent':1,5 'mari':9 'multipl':2
765	720	MAPAS MENTALES: ASOCIANDO, CONECTANDO Y APRENDIEND	GUTIERREZ; MARIA ARACELI				1	1	1	89	2			\N	2021-10-15 19:42:37	2021-10-15 19:42:37	'aprendiend':6 'araceli':9 'asoci':3 'conect':4 'gutierrez':7 'map':1 'mari':8 'mental':2
766	721	RESOLUCION DE CONFLICTOS EN EL AULA: COMO ENCONTRA	CANALE AGUILAR, JOSE ANTONIO				1	1	1	89	2			\N	2021-10-18 12:16:36	2021-10-18 12:16:36	'aguil':10 'antoni':12 'aul':6 'canal':9 'conflict':3 'encontr':8 'jos':11 'resolucion':1
767	722	EL CURRICULO POR COMPETENCIAS DESDE LA SOCIOFORMAC	TOBON TOBON, SERGIO				1	1	1	89	2			\N	2021-10-18 12:17:18	2021-10-18 12:17:18	'competent':4 'curricul':2 'sergi':10 'socioformac':7 'tobon':8,9
768	723	PIAGET Y VYGOTSKI EN EL AULA: EL CONTRUCTIVISMO CO	GANEM, PATRICIA				1	1	1	89	2			\N	2021-10-18 12:18:01	2021-10-18 12:18:01	'aul':6 'co':9 'contructiv':8 'ganem':10 'patrici':11 'piaget':1 'vygotski':3
769	724	LA CREATIVIDAD Y EL APRENDIZAJE: COMO LOGRAR UNA E	DABDOUB, LILIAN				1	1	1	89	2			\N	2021-10-18 12:18:45	2021-10-18 12:18:45	'aprendizaj':5 'creativ':2 'dabdoub':10 'lili':11 'logr':7
771	726	PARA CAMBIAR UN MAL DIA	RAY, DOLLY				1	1	1	164	2			\N	2021-10-18 12:20:00	2021-10-18 12:20:00	'cambi':2 'dia':5 'dolly':7 'mal':4 'ray':6
785	740	ETICA Y VALORES 2: UN ACERCAMIENTO PRACTICO	SIN AUTOR				1	1	1	54	2			\N	2021-10-18 12:31:16	2021-10-18 12:31:16	'2':4 'acerc':6 'autor':9 'etic':1 'practic':7 'valor':3
786	741	ETICA Y VALORES 1	ANGULO PARRA, YOLANDA				1	1	1	48	2			\N	2021-10-18 12:31:52	2021-10-18 12:31:52	'1':4 'angul':5 'etic':1 'parr':6 'valor':3 'yoland':7
787	742	FORMACION CIVICA Y ETICA 1 SEGUNDO DE SECUNDARIA	GURROLA CASTRO, GLORIA				1	1	1	166	2			\N	2021-10-18 12:32:56	2021-10-18 12:33:40	'1':5 'castr':10 'civic':2 'etic':4 'formacion':1 'glori':11 'gurrol':9 'secundari':8 'segund':6
788	743	FORMACION CIVICA Y ETICA 1	SCHMILL, VIDAL				1	1	1	89	2			\N	2021-10-18 12:35:02	2021-10-18 12:35:02	'1':5 'civic':2 'etic':4 'formacion':1 'schmill':6 'vidal':7
790	746	LOS CALCETINES SOLITARIOS: UNA HISTORIA SOBRE BULL	AMARA, LUIGI				1	1	1	39	2			\N	2021-10-18 12:37:29	2021-10-18 12:37:29	'amar':8 'bull':7 'calcetin':2 'histori':5 'luigi':9 'solitari':3
791	747	BULLYING. ESTAMPAS INFANTILES DE LA VIOLENCIA ESCO	OROZCO GUMAN, MARIO				1	1	1	168	2			\N	2021-10-18 12:38:12	2021-10-18 12:38:50	'bullying':1 'esco':7 'estamp':2 'gum':9 'infantil':3 'mari':10 'orozc':8 'violenci':6
797	752	NINOS DE VALOR: VIVIR LOS VALORES	MUNOZ SALDANA, RAFAEL				1	1	1	171	2			\N	2021-10-18 12:51:31	2021-10-18 12:52:06	'munoz':7 'nin':1 'rafael':9 'saldan':8 'valor':3,6 'viv':4
798	753	MANEJO DE CONFLICTOS: DESDE LA SABIDURIA DEL CINE	DIAZ, LUIS MIGUEL				1	1	1	160	2			\N	2021-10-18 13:14:16	2021-10-18 13:14:16	'cin':8 'conflict':3 'diaz':9 'luis':10 'manej':1 'miguel':11 'sabiduri':6
799	754	LAS VIRTUDES FAMILIARES	KAVELIN POPOV, LINDA				1	1	1	172	2			\N	2021-10-18 13:14:57	2021-10-18 13:15:38	'familiar':3 'kavelin':4 'lind':6 'popov':5 'virtud':2
800	755	MI LIBRO DE VALORES	ALMARAZ ELIZALDE, VANESSA				1	1	1	173	2			\N	2021-10-18 13:17:59	2021-10-18 13:18:34	'almaraz':5 'elizald':6 'libr':2 'valor':4 'vaness':7
801	756	PRACTICA Y ETICA DE LA EUTANASIA	ALVAREZ DEL RIO, ASUNCION				1	1	1	174	2			\N	2021-10-18 13:19:52	2021-10-18 13:20:17	'alvarez':7 'asuncion':10 'etic':3 'eutanasi':6 'practic':1 'rio':9
803	757	ETICA Y REDES SOCIALES	PRADO FLORES, ROGELIO DEL				1	1	1	175	2			\N	2021-10-18 13:24:10	2021-10-18 13:24:42	'etic':1 'flor':6 'prad':5 'red':3 'rogeli':7 'social':4
806	760	20 PASOS HACIA ADELANTE	BUCAY, JORGE				1	1	1	97	2			\N	2021-10-18 13:27:47	2021-10-18 13:27:47	'20':1 'adel':4 'bucay':5 'haci':3 'jorg':6 'pas':2
811	765	LA DEVALUACION DEL PESO	SIN AUTOR				1	1	1	180	2			\N	2021-10-18 13:33:34	2021-10-18 13:34:06	'autor':6 'devaluacion':2 'pes':4
804	758	¿COMO VIVIMOS LOS MEXICANOS? DATOS CURIOSOS E IMAG	LOPEZ ROMO, HERIBERTO				1	1	1	176	2			\N	2021-10-18 13:25:59	2021-10-18 13:26:32	'curios':6 'dat':5 'heribert':11 'imag':8 'lopez':9 'mexican':4 'rom':10 'viv':2
807	761	EL LENGUAJE DEL PODER PERSONAL: RECUPERA EL CONTRO	MOORMAN, CHICK				1	1	1	149	2			\N	2021-10-18 13:28:43	2021-10-18 13:28:43	'chick':10 'contr':8 'lenguaj':2 'moorm':9 'personal':5 'pod':4 'recuper':6
808	762	¿QUE ES EL PODER JUDICIAL DE LA FEDERACION?	SUPREMA CORTE DE JUSTICIA DE LA NACION				1	1	1	148	2			\N	2021-10-18 13:29:25	2021-10-18 13:29:25	'cort':10 'federacion':8 'judicial':5 'justici':12 'nacion':15 'pod':4 'suprem':9
809	763	QUE ES LA INFLACION	VOSTRILLOV, P				1	1	1	178	2			\N	2021-10-18 13:30:49	2021-10-18 13:31:09	'inflacion':4 'p':6 'vostrillov':5
813	767	GUIA DE LOS BUENOS MODALES	TRADD, VERONICA				1	1	1	133	2			\N	2021-10-18 13:38:38	2021-10-18 13:38:38	'buen':4 'gui':1 'modal':5 'tradd':6 'veron':7
814	768	NO MAS OSOS, MEJOR CONTROLA A TUS PAPAS: UNA GUIA	SIN AUTOR				1	1	1	32	2			\N	2021-10-18 18:26:40	2021-10-18 18:26:40	'autor':12 'control':5 'gui':10 'mas':2 'mejor':4 'osos':3 'pap':8
815	769	EXPLOTA TUS EMOCIONES PARA AVANZAR EN LA VIDA SOLT	BAROCIO, ROSA				1	1	1	60	2			\N	2021-10-18 18:27:11	2021-10-18 18:27:11	'avanz':5 'baroci':10 'emocion':3 'explot':1 'ros':11 'solt':9 'vid':8
816	770	¿DE QUE TE RIES? LAS CARICATURAS Y SU RELACION CON	JUAREZ SALAZAR, ANGELICA				1	1	1	60	2			\N	2021-10-18 18:27:54	2021-10-18 18:27:54	'angel':13 'caricatur':6 'juarez':11 'relacion':9 'ries':4 'salaz':12
817	771	COMO ENTENDER A LOS CHICOS Y CONQUISTAR SU CORAZON	ALEMANY, CRISTINA				1	1	1	164	2			\N	2021-10-18 18:28:25	2021-10-18 18:28:25	'alemany':10 'chic':5 'conquist':7 'corazon':9 'cristin':11 'entend':2
818	772	GRACIAS	WYBRANIETZ, KRISTIANE				1	1	1	164	2			\N	2021-10-18 18:28:55	2021-10-18 18:28:55	'graci':1 'kristian':3 'wybranietz':2
819	773	TE FELICITO POR TU PROYECTO	RIBA, LIDIA MARIA				1	1	1	164	2			\N	2021-10-18 18:29:43	2021-10-18 18:29:43	'felicit':2 'lidi':7 'mari':8 'proyect':5 'rib':6
824	778	PNL PARA FORMADORES: MANUAL PARA DIRECTIVOS, FORMA	O´CONNOR, JOSEPH				1	1	1	181	2			\N	2021-10-18 18:33:50	2021-10-18 18:34:37	'connor':9 'direct':6 'form':7 'formador':3 'joseph':10 'manual':4 'pnl':1
825	779	EL PODER DE LOS HABITOS: PORQUE HACEMOS LO QUE HAC	DUHIGG, CHARLES				1	1	1	181	2			\N	2021-10-18 18:35:18	2021-10-18 18:35:18	'charl':12 'duhigg':11 'habit':5 'hac':7,10 'pod':2
826	780	ADOLESCENTES, MALOS ROLLOS, COMPLEJOS Y COMEDURAS	MARCELLI, DANIEL				2	1	1	182	2			\N	2021-10-18 18:36:10	2021-10-18 18:36:34	'adolescent':1 'comedur':6 'complej':4 'daniel':8 'mal':2 'marcelli':7 'roll':3
827	781	EUROPA AL BORDE DEL ABISMO: ECONOMISTAS ATERRADOS	SIN AUTOR				1	1	1	183	2			\N	2021-10-18 18:37:18	2021-10-18 18:38:13	'abism':5 'aterr':7 'autor':9 'bord':3 'econom':6 'europ':1
828	782	365 DIAS PARA ACERCARCE A DIOS	AGUILAR VALDES, JOSE DE JESUS				1	1	1	68	2			\N	2021-10-18 18:39:00	2021-10-18 18:39:00	'365':1 'acercarc':4 'aguil':7 'dias':2 'dios':6 'jesus':11 'jos':9 'vald':8
829	783	OPTIMIZA TU MENTE: EL PROGRAMA VISUAL COMPLETO	BUZAN, TONY				1	1	1	118	2			\N	2021-10-18 18:39:43	2021-10-18 18:40:10	'buz':8 'complet':7 'ment':3 'optimiz':1 'program':5 'tony':9 'visual':6
830	784	EL DESARROLLO DEL CAPITALISMO EN AMERICA LATINA: E	CUEVA, AGUSTIN				1	1	1	40	2			\N	2021-10-18 18:42:28	2021-10-18 18:42:28	'agustin':10 'amer':6 'capital':4 'cuev':9 'desarroll':2 'latin':7
831	785	CONSUMIDORES Y CIUDADANOS: CONFLICTOS MULTICULTURA	GARCIA CANCLINI, NESTOR				1	1	1	15	2			\N	2021-10-18 18:42:56	2021-10-18 18:42:56	'canclini':7 'ciudadan':3 'conflict':4 'consumidor':1 'garci':6 'multicultur':5 'nestor':8
832	786	LAS 5 HERIDAS QUE INPIDEN SER UNO MISMO: RECHAZO,	BOURBEAN, LISE				1	1	1	185	2			\N	2021-10-18 18:43:36	2021-10-18 18:43:58	'5':2 'bourb':10 'her':3 'inpid':5 'lis':11 'mism':8 'rechaz':9 'ser':6
833	787	¿PARA QUE SIRVE UNA PREPOSICION?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:44:57	2021-10-18 18:45:13	'dehes':6 'ines':8 'juan':7 'preposicion':5 'sirv':3
834	788	¿PARA QUE SIRVE UN ARTICULO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:46:06	2021-10-18 18:46:06	'articul':5 'dehes':6 'ines':8 'juan':7 'sirv':3
835	789	¿PARA QUE SIRVE UN VERBO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:46:58	2021-10-18 18:46:58	'dehes':6 'ines':8 'juan':7 'sirv':3 'verb':5
836	790	¿PARA QUE SIRVE UN ADVERBIO	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:47:45	2021-10-18 18:47:45	'adverbi':5 'dehes':6 'ines':8 'juan':7 'sirv':3
837	791	¿PARA QUE SIRVE UN ADJETIVO	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:48:25	2021-10-18 18:48:25	'adjet':5 'dehes':6 'ines':8 'juan':7 'sirv':3
838	792	¿PARA QUE SIRVE UN SUSTANTIVO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:48:51	2021-10-18 18:48:51	'dehes':6 'ines':8 'juan':7 'sirv':3 'sustant':5
839	793	LOS CONSEJOS DE LA JUDICATURA: DESARROLLO INSTITUC	VALADES, DIEGO				1	1	1	187	2			\N	2021-10-18 18:50:28	2021-10-18 18:51:01	'consej':2 'desarroll':6 'dieg':9 'instituc':7 'judicatur':5 'valad':8
840	794	TITULO REQUIEM PARA EL MINISTERIO PUBLICO EN EL AMPARO	CASTRO CASTRO, JUVENTINO V.				1	1	1	97	2			\N	2021-10-18 18:51:54	2021-10-18 18:51:54	'ampar':9 'castr':10,11 'juventin':12 'ministeri':5 'public':6 'requiem':2 'titul':1 'v':13
841	794	REQUIEM PARA EL MINISTERIO PUBLICO EN EL AMPARO	CASTRO CASTRO, JUVENTINO V.				1	1	1	177	2			\N	2021-10-18 18:52:34	2021-10-18 18:52:34	'ampar':8 'castr':9,10 'juventin':11 'ministeri':4 'public':5 'requiem':1 'v':12
842	795	EL LIBRO DE LAS GRANDES APUESTAS PSICOLOGICAS	BRENIFIER, OSCAR				1	1	1	97	2			\N	2021-10-18 18:53:14	2021-10-18 18:53:14	'apuest':6 'brenifi':8 'grand':5 'libr':2 'oscar':9 'psicolog':7
843	796	EL AMOR Y LA AMISTAD	BRENIFIER, OSCAR				1	1	1	97	2			\N	2021-10-18 18:54:21	2021-10-18 18:54:21	'amist':5 'amor':2 'brenifi':6 'oscar':7
844	797	HEREJES; DE BOGUMILO Y LOS CATARES A WYVLIF Y HUS	FRASSETO, MICHAEL				1	1	1	10	2			\N	2021-10-18 18:54:51	2021-10-28 19:41:49	'bogumil':3 'catar':6 'frasset':11 'herej':1 'hus':10 'michael':12 'wyvlif':8
847	800	HISTORIA DE LAS RELIGIONES	BOVO, ELISABETTA				1	1	1	189	2			\N	2021-10-18 18:57:01	2021-10-18 18:57:30	'bov':5 'elisabett':6 'histori':1 'religion':4
848	801	ISRAEL: LAS TIERRAS DE LA BIBLIA	KOCHAV, SARAH				1	1	1	189	2			\N	2021-10-18 18:58:09	2021-10-18 18:58:09	'bibli':6 'israel':1 'kochav':7 'sarah':8 'tierr':3
849	802	WORLD RELIGIONS: AN ILUSTRATED GUIDE	MCLOUGHLIN, SEAN				1	1	1	190	2			\N	2021-10-18 18:58:57	2021-10-18 18:59:21	'an':3 'guid':5 'ilustrat':4 'mcloughlin':6 'religions':2 'world':1
850	803	IDENTIDADES DE GENEROS: MAS ALLA DE CUERPOS Y MITO	ROCHA SANCHEZ, TANIA ESMERALDA				1	1	1	60	2			\N	2021-10-18 19:01:12	2021-10-18 19:01:12	'alla':5 'cuerp':7 'esmerald':13 'gener':3 'ident':1 'mas':4 'mit':9 'roch':10 'sanchez':11 'tani':12
851	804	REVISTA INTERCONTINENTAL DE PSICOLOGIA Y EDUCACION	TORRES HERNANDEZ, ROSA MARIA				1	1	1	191	2			\N	2021-10-18 19:04:15	2021-10-18 19:04:24	'educacion':6 'hernandez':8 'intercontinental':2 'mari':10 'psicologi':4 'revist':1 'ros':9 'torr':7
852	805	PSICOLOGIA EDUCATIVA PARA AFRONTAR LOS DESAFIOS DE	SIN AUTOR				1	1	1	61	2			\N	2021-10-18 19:25:38	2021-10-18 19:25:38	'afront':4 'autor':9 'desafi':6 'educ':2 'psicologi':1
853	806	ADOLESCENTES 50 CASOS PROBLEMATICOS: ANALISIS PICO	NUEVO GONZALEZ, ELISEO				1	1	1	192	2			\N	2021-10-18 19:27:29	2021-10-18 19:27:55	'50':2 'adolescent':1 'analisis':5 'cas':3 'elise':9 'gonzalez':8 'nuev':7 'pic':6 'problemat':4
854	807	CODIGO DE ETICA DEL PSICOLOGO	SOCIEDAD MEXICANA DE PSICOLOGIA				1	1	1	60	2			\N	2021-10-18 19:28:51	2021-10-18 19:28:51	'codig':1 'etic':3 'mexican':7 'psicolog':5 'psicologi':9 'socied':6
863	816	JUEGOS EN QUE PARTICIPAMOS: PSICOLOGIA DE LAS RELA	BERNE, ERIC				1	1	1	185	2			\N	2021-10-18 19:37:25	2021-10-18 19:37:25	'bern':9 'eric':10 'jueg':1 'particip':4 'psicologi':5 'rel':8
855	808	INTRODUCCION A LA PSICOLOGIA: UN ENFOQUE ECOSISTEM	DIAZ GUERRERO, ROGELIO				1	1	1	60	2			\N	2021-10-18 19:29:34	2021-10-18 19:29:34	'diaz':8 'ecosistem':7 'enfoqu':6 'guerrer':9 'introduccion':1 'psicologi':4 'rogeli':10
856	809	EL SIGNIFICADO DE LOS COLORES	ORTIZ HERNANDEZ, GEORGINA				1	1	1	60	2			\N	2021-10-18 19:30:24	2021-10-18 19:30:24	'color':5 'georgin':8 'hernandez':7 'ortiz':6 'signific':2
857	810	EL SIGNIFICADO DE  LOS COLORES	ORTIZ HERNANDEZ, GEORGINA				1	1	1	60	2			\N	2021-10-18 19:30:55	2021-10-18 19:30:55	'color':5 'georgin':8 'hernandez':7 'ortiz':6 'signific':2
858	811	EL LIBRO DE LA PSICOLOGIA	SIN AUTOR				1	1	1	118	2			\N	2021-10-18 19:31:52	2021-10-18 19:31:52	'autor':7 'libr':2 'psicologi':5
859	812	PSICOLOGIA 2	NAVARRO CRUZ, RUTH				1	1	1	49	2			\N	2021-10-18 19:35:15	2021-10-18 19:35:15	'2':2 'cruz':4 'navarr':3 'psicologi':1 'ruth':5
860	813	TEMAS BASICOS DE PSICOLOGIA: UNA APROXIMACION CONS	HEREDIA ANCONA, BERTHA				1	1	1	60	2			\N	2021-10-18 19:35:44	2021-10-18 19:35:44	'ancon':9 'aproximacion':6 'basic':2 'berth':10 'cons':7 'heredi':8 'psicologi':4 'tem':1
861	814	LOS JOVENES Y SUS HABITOS DE SALUD: UNA INVESTIGAC	ALVAREZ BERMUDES, JAVIER				1	1	1	60	2			\N	2021-10-18 19:36:17	2021-10-18 19:36:17	'alvarez':10 'bermud':11 'habit':5 'investigac':9 'javi':12 'joven':2 'salud':7
862	815	SOCIOPSICOANALISIS DEL CAMPESINO MEXICANO: ESTUDIO	FROMM, ERICH				1	1	1	174	2			\N	2021-10-18 19:36:53	2021-10-18 19:36:53	'campesin':3 'erich':7 'estudi':5 'fromm':6 'mexican':4 'sociopsicoanalisis':1
896	849	LOS ELEMENTOS DE LA DANZA	DALLAL, ALBERTO				1	1	1	179	2			\N	2021-10-19 17:26:27	2021-10-19 17:26:27	'albert':7 'dallal':6 'danz':5 'element':2
865	818	CELOS Y ENVIDIA: MEDICION ALTERNATIVA	SIN AUTOR				1	1	1	179	2			\N	2021-10-18 19:38:22	2021-10-18 19:38:22	'altern':5 'autor':7 'cel':1 'envidi':3 'medicion':4
866	819	PSICOLOGIA DE LA SALUD Y CALIDAD DE VIDA	OBLITAS GUADALUPE, LUIS A.				1	1	1	54	2			\N	2021-10-18 19:39:02	2021-10-18 19:39:02	'calid':6 'guadalup':10 'luis':11 'oblit':9 'psicologi':1 'salud':4 'vid':8
867	820	ENCICLOPEDIA DE LA PSICOLOGIA	GISPERT, CARLOS				1	1	1	97	2			\N	2021-10-18 19:39:47	2021-10-18 19:39:47	'carl':6 'enciclopedi':1 'gispert':5 'psicologi':4
868	821	LA FELICIDAD ¡AHORA!	MATTHEWS, ANDREW				1	1	1	193	2			\N	2021-10-18 19:40:38	2021-10-18 19:40:55	'ahor':3 'andrew':5 'felic':2 'matthews':4
869	822	¿ERES PERFECCIONISTA?: DESCUBRE LO MALO DE SER DEM	ADDERHOLDT ELLIOT, MIRIAM				1	1	1	88	2			\N	2021-10-18 19:41:22	2021-10-18 19:41:22	'adderholdt':9 'dem':8 'descubr':3 'elliot':10 'mal':5 'miriam':11 'perfeccion':2 'ser':7
870	823	EL VIVE EN LA TIERRA DEL NO : UNA PARABOLA DE TRIU	GALLAGHER, BJ				1	1	1	166	2			\N	2021-10-18 19:41:53	2021-10-18 19:41:53	'bj':13 'gallagh':12 'parabol':9 'tierr':5 'triu':11 'viv':2
871	824	USA TU CABEZA: COMO LIBERAR EL POTENCIAS DE TU MEN	BUZAN, TONY				1	1	1	167	2			\N	2021-10-18 19:42:27	2021-10-18 19:42:27	'buz':11 'cabez':3 'liber':5 'men':10 'potenci':7 'tony':12 'usa':1
872	825	APRENDIZAJE Y MEMORIA: DEL CEREBRO AL COMPORTAMIEN	GLUCK, MARK				1	1	1	61	2			\N	2021-10-18 19:43:00	2021-10-18 19:43:00	'aprendizaj':1 'cerebr':5 'comportami':7 'gluck':8 'mark':9 'memori':3
873	826	PRUEBAS PSICOLOGICAS: HISTORIA, PRINCIPIOS Y APLIC					1	1	1	75	2			\N	2021-10-18 19:43:31	2021-10-18 19:43:31	'aplic':6 'histori':3 'principi':4 'prueb':1 'psicolog':2
874	827	MATHEMATICS: STANDARD LEVEL. DEVELOPED SPECIFICALL	GARRY, TIM				1	1	1	194	2			\N	2021-10-18 19:44:07	2021-10-18 19:44:31	'develop':4 'garry':6 'level':3 'mathematics':1 'specificall':5 'standard':2 'tim':7
875	828	MATHEMATICS HIGHER LEVEL FOR THE IB DIPLOMA	FANNON, PAUL				1	1	1	121	2			\N	2021-10-18 19:44:56	2021-10-18 19:44:56	'diplom':7 'fannon':8 'for':4 'high':2 'ib':6 'level':3 'mathematics':1 'paul':9 'the':5
876	829	DIVAS REBELDES	MORATO, CRISTINA				1	1	1	195	2			\N	2021-10-18 19:45:26	2021-10-18 19:46:55	'cristin':4 'div':1 'morat':3 'rebeld':2
877	830	HEROINAS DE LA SEGUNDA GUERRA MUNDIAL	ATWOOD, KATHRYN J.				1	1	1	182	2			\N	2021-10-18 19:49:02	2021-10-18 19:49:02	'atwood':7 'guerr':5 'heroin':1 'j':9 'kathryn':8 'mundial':6 'segund':4
878	831	LA PSICOLOGIA EN EJEMPLOS	RODRIGUEZ ESTRADA, MAURO				1	1	1	60	2			\N	2021-10-19 12:29:12	2021-10-19 12:29:12	'ejempl':4 'estrad':6 'maur':7 'psicologi':2 'rodriguez':5
879	832	MODELOS DE PSICOLOGIA CLINICA Y SU APLICACION	RODRIGUEZ CAMPUZANO, MARIA DE LOURDES				1	1	1	88	2			\N	2021-10-19 12:30:21	2021-10-19 12:30:21	'aplicacion':7 'campuzan':9 'clinic':4 'lourd':12 'mari':10 'model':1 'psicologi':3 'rodriguez':8
881	834	POESIA EN ACCION: LINEAMIENTOS PARA MOTIVAR LA CRE	SUAREZ CAAMAL, RAMON IVAN				1	1	1	5	2			\N	2021-10-19 12:34:53	2021-10-19 12:34:53	'accion':3 'caamal':10 'cre':8 'ivan':12 'lineamient':4 'motiv':6 'poesi':1 'ramon':11 'suarez':9
885	838	ANTOLOGIA NARRATIVA: LITERATURA 1	MERODIO LOPEZ, CLEMENTE				1	1	1	48	2			\N	2021-10-19 12:42:27	2021-10-19 12:42:27	'1':4 'antologi':1 'clement':7 'literatur':3 'lopez':6 'merodi':5 'narrat':2
886	839	ANTOLOGIA DE POESIA MODERNISTA: EL CISNE EN LA SOM	ARISTIDES, CESAR				1	1	1	5	2			\N	2021-10-19 17:13:50	2021-10-19 17:13:50	'antologi':1 'aristid':10 'ces':11 'cisn':6 'modern':4 'poesi':3 'som':9
887	840	LA FUENTE, LOS DESTELLOS Y LA SOMBRA: ANTOLOGIA PO	HUERTA, DAVID				1	1	1	5	2			\N	2021-10-19 17:14:37	2021-10-19 17:14:37	'antologi':8 'dav':11 'destell':4 'fuent':2 'huert':10 'po':9 'sombr':7
888	841	LA MANO JUNTO AL MURO: VEINTE CUENTOS LATINOAMERIC	SAMPERIO, GUILLERMO				1	1	1	5	2			\N	2021-10-19 17:16:05	2021-10-19 17:16:05	'cuent':7 'guillerm':10 'junt':3 'latinoameric':8 'man':2 'mur':5 'samperi':9 'veint':6
889	842	MUJERES: SEXISMO Y LIBERACION	PILAR, MARIA DEL				1	1	1	138	2			\N	2021-10-19 17:17:11	2021-10-19 17:17:11	'liberacion':4 'mari':6 'mujer':1 'pil':5 'sexism':2
890	843	ENSENANZA Y APRENDIZAJE EN LA EDUCACION FISICA ESC	TORRES SOLIS, JOSE ANTONIO				1	1	1	60	2			\N	2021-10-19 17:17:45	2021-10-19 17:17:45	'antoni':12 'aprendizaj':3 'educacion':6 'ensen':1 'esc':8 'fisic':7 'jos':11 'solis':10 'torr':9
891	844	GENERACION HIP-HOP: DE LA GUERRA DE PANDILLAS Y EL	CHANG, JEFF				1	1	1	5	2			\N	2021-10-19 17:18:14	2021-10-19 17:18:14	'chang':12 'generacion':1 'guerr':7 'hip':3 'hip-hop':2 'hop':4 'jeff':13 'pandill':9
892	845	HISTORY OF ROCK: THE DEFINITIVE GUIDE TO ROCK, PUN	PAYTRESS, MARK				1	1	1	29	2			\N	2021-10-19 17:21:13	2021-10-19 17:21:13	'definitiv':5 'guid':6 'history':1 'mark':11 'of':2 'paytress':10 'pun':9 'rock':3,8 'the':4 'to':7
893	846	EL FABULOSO MUNDO DEL ROCK	BONIS, NORA				1	1	1	164	2			\N	2021-10-19 17:23:19	2021-10-19 17:23:19	'bonis':6 'fabul':2 'mund':3 'nor':7 'rock':5
894	847	EXPEDIENTE ROCK: ENCICLOPEDIA DEL ROCK. INICIO, OR	SIN AUTOR				1	1	1	199	2			\N	2021-10-19 17:24:40	2021-10-19 17:24:55	'autor':9 'enciclopedi':3 'expedient':1 'inici':6 'or':7 'rock':2,5
895	848	DANZA: ARTE EN MOVIMIENTO PARA SECUNDARIA	ECHEVERRIA RAMON, IVAN				1	1	1	199	2			\N	2021-10-19 17:25:49	2021-10-19 17:25:49	'arte':2 'danz':1 'echeverri':7 'ivan':9 'movimient':4 'ramon':8 'secundari':6
897	850	DANZA FOLKLORICA MEXICANA EN EDUCACION BASICA	ARELLANO CHAVEZ, JOSEFINA				1	1	1	60	2			\N	2021-10-19 17:27:13	2021-10-19 17:27:13	'arellan':7 'basic':6 'chavez':8 'danz':1 'educacion':5 'folklor':2 'josefin':9 'mexican':3
898	851	WILMA UNLIMITED: HOW WILMA RUDOLPH BECAME THE WORD	KRULL, KATHLEEN				1	1	1	200	2			\N	2021-10-19 17:28:35	2021-10-19 17:32:42	'becam':6 'how':3 'kathl':10 'krull':9 'rudolph':5 'the':7 'unlimit':2 'wilm':1,4 'word':8
899	852	A PICTURE BOOK OF JESSE OWENS	ADLER, DAVID A.				1	1	1	200	2			\N	2021-10-19 17:34:11	2021-10-19 17:34:11	'adler':7 'book':3 'dav':8 'jess':5 'of':4 'owens':6 'pictur':2
901	854	LAS FORMAS MUSICALES A TRAVES DE LA HISTORIA	CASTRO, RICARDO DE				1	1	1	180	2			\N	2021-10-19 17:40:33	2021-10-19 17:40:33	'castr':9 'form':2 'histori':8 'musical':3 'ricard':10 'trav':5
902	855	ARTE MUSICA 2: DESAROLLO DE COMPETENCIAS	CUERVO VERA, ESTELA				1	1	1	201	2			\N	2021-10-19 17:42:12	2021-10-19 17:42:12	'2':3 'arte':1 'competent':6 'cuerv':7 'desaroll':4 'estel':9 'music':2 'ver':8
900	853	ARTES TEATRO: CON ENFOQUE EN COMPETENCIAS	ZUNIGA, DENISSE				1	1	1	201	2			\N	2021-10-19 17:38:05	2021-10-19 17:42:33	'artes':1 'competent':6 'deniss':8 'enfoqu':4 'teatr':2 'zunig':7
903	856	ARTES MUSICA CON ENFOQUE EN CONPETENCIAS 3	GOMEZ SOTOLONGO, ANTONIO				1	1	1	201	2			\N	2021-10-19 17:43:51	2021-10-19 17:43:51	'3':7 'antoni':10 'artes':1 'conpetent':6 'enfoqu':4 'gomez':8 'music':2 'sotolong':9
904	857	EXPRESION Y APRECIACION ARTISTICAS 2: EDUCACION SE	GARCIA CASTRO, BLANCA IDALIA				2	1	1	66	2			\N	2021-10-19 17:46:59	2021-10-19 17:46:59	'2':5 'apreciacion':3 'artist':4 'blanc':10 'castr':9 'educacion':6 'expresion':1 'garci':8 'idali':11
905	858	ORIENTACION Y TUTORIA	GARCIA CANSINO, EVERARDO				2	1	1	64	2			\N	2021-10-19 17:48:35	2021-10-19 17:48:35	'cansin':5 'everard':6 'garci':4 'orientacion':1 'tutori':3
908	860	ORIENTACION EDUCATIVA 1: UN ENFOQUE CONSTRUCTIVIST	VALDES SALMERON, VERONICA				1	1	1	75	2			\N	2021-10-19 17:53:46	2021-10-19 17:57:59	'1':3 'constructivist':6 'educ':2 'enfoqu':5 'orientacion':1 'salmeron':8 'vald':7 'veron':9
907	859	ORIENTACION  Y  TUTORIA	CAMARA GUADARRAMA, RAMON				1	1	1	66	2			\N	2021-10-19 17:52:33	2021-10-19 17:58:18	'cam':4 'guadarram':5 'orientacion':1 'ramon':6 'tutori':3
909	861	ORIENTACION EDUCATIVA 1	CUENCA RENDON, ELIZABETH				1	1	1	54	2			\N	2021-10-19 17:59:18	2021-10-19 17:59:18	'1':3 'cuenc':4 'educ':2 'elizabeth':6 'orientacion':1 'rendon':5
910	862	ORIENTACION VOCACIONAL	CAZARES GONZALEZ, YOLANDA MA.				1	1	1	55	2			\N	2021-10-19 17:59:47	2021-10-19 17:59:47	'cazar':3 'gonzalez':4 'ma':6 'orientacion':1 'vocacional':2 'yoland':5
911	863	ORIENTACION VOCACIONAL BACCHILLERATO	MARCUS CHAMER STAVCHANSKY, EVA				1	1	1	61	2			\N	2021-10-19 18:00:48	2021-10-19 18:00:48	'bacchillerat':3 'cham':5 'eva':7 'marcus':4 'orientacion':1 'stavchansky':6 'vocacional':2
912	864	METODOLOGIA DE LA INVESTIGACION	CONTRERAS BURGOS, ANA EUGENIA				1	1	1	63	2			\N	2021-10-19 18:01:56	2021-10-19 18:01:56	'ana':7 'burg':6 'contrer':5 'eugeni':8 'investigacion':4 'metodologi':1
913	865	FUNDAMENTOS DE METODOLOGIA DE LA INVESTIGACION: BA	HERNANDEZ SAMPIERI, ROBERTO				1	1	1	61	2			\N	2021-10-19 18:02:54	2021-10-19 18:02:54	'ba':7 'fundament':1 'hernandez':8 'investigacion':6 'metodologi':3 'robert':10 'sampieri':9
914	866	METODOLOGIA DE LA INVESTIGACION: CONTABILIDAD, ECO	ARIAS GALICIA, FERNANDO				1	1	1	60	2			\N	2021-10-19 18:03:24	2021-10-19 18:03:24	'ari':7 'contabil':5 'eco':6 'fern':9 'galici':8 'investigacion':4 'metodologi':1
915	867	COMO ESCRIBIR TRABAJOS DE INVESTIGACION	WALKER, MELISSA				1	1	1	204	2			\N	2021-10-19 18:04:02	2021-10-19 18:04:59	'escrib':2 'investigacion':5 'meliss':7 'trabaj':3 'walk':6
916	868	LA TESIS Y EL TRABAJO DE TESIS: RECOMENDACIONES ME	GARCIA CORDOVA, FERNANDO				1	1	1	205	2			\N	2021-10-19 18:05:51	2021-10-19 18:06:20	'cordov':11 'fern':12 'garci':10 'recomend':8 'tesis':2,7 'trabaj':5
917	869	SEMINARIO DE APRENDIZAJE Y DESARROLLO	CUENCA RENDON, ELIZABETH				1	1	1	54	2			\N	2021-10-20 12:57:44	2021-10-20 12:57:44	'aprendizaj':3 'cuenc':6 'desarroll':5 'elizabeth':8 'rendon':7 'seminari':1
918	870	ELEMENTOS DEL PROCESO DE INVESTIGACION	ELEMENTOS DEL PROCESO DE INVESTIGACION				1	1	1	179	2			\N	2021-10-21 12:24:43	2021-10-21 12:24:43	'element':1,6 'investigacion':5,10 'proces':3,8
919	871	EL ESTUDIO DE CASOS: UN ENFOQUE COGNITIVO	MENDOZA NUNEZ, ALEJANDRO				1	1	1	60	2			\N	2021-10-21 12:29:29	2021-10-21 12:29:29	'alejandr':10 'cas':4 'cognit':7 'enfoqu':6 'estudi':2 'mendoz':8 'nunez':9
920	872	CREATIVIDAD EN LA INVESTIGACION	RODRIGUEZ ESTRADA, MAURO				1	1	1	60	2			\N	2021-10-21 12:30:23	2021-10-21 12:30:23	'creativ':1 'estrad':6 'investigacion':4 'maur':7 'rodriguez':5
921	873	GESTION DE PROYECTOS DE E-LEARNING	SIN AUTOR				1	1	1	83	2			\N	2021-10-21 12:30:55	2021-10-21 12:30:55	'autor':9 'e-learning':5 'gestion':1 'learning':7 'proyect':3
922	874	PROGRAMA DE FORMACION ETICA: DESARROLLO DE UNA CUL	WEIS, RAUL				1	1	1	206	2			\N	2021-10-21 12:33:03	2021-10-21 12:33:16	'cul':8 'desarroll':5 'etic':4 'formacion':3 'program':1 'raul':10 'weis':9
924	876	DIDACTICA DE LA MATEMATICAS: ¿COMO APRENDER? ¿COMO	CABANNE, NORA				1	1	1	207	2			\N	2021-10-21 12:35:25	2021-10-21 12:35:25	'aprend':6 'cabann':8 'didact':1 'matemat':4 'nor':9
925	877	DIDACTICA DE LA LENGUA: ¿COMO ENSENAR? ¿COMO APREN	LUCHETTI, ELENA				1	1	1	207	2			\N	2021-10-21 12:35:55	2021-10-21 12:35:55	'apren':8 'didact':1 'elen':10 'ensen':6 'lengu':4 'luchetti':9
926	878	DIDACTICA DE LAS CIENCIAS SOCIALES ¿COMO ENSENAR?	CALDAROLA, GABRIEL CARLOS				1	1	1	207	2			\N	2021-10-21 12:36:25	2021-10-21 12:36:25	'caldarol':8 'carl':10 'cienci':4 'didact':1 'ensen':7 'gabriel':9 'social':5
927	879	NUEVAS TECNOLOGIAS EN LA BIBLIOTECA ESCOLAR	BORSANI, ZELMA				1	1	1	206	2			\N	2021-10-21 12:37:36	2021-10-21 12:37:36	'bibliotec':5 'borsani':7 'escol':6 'nuev':1 'tecnologi':2 'zelm':8
928	880	LECTURA Y ESCRITURA: TEORIAS Y PROMOCION, 60 ACTIV	ESPINOZA ARANGO, CAROLINA				1	1	1	206	2			\N	2021-10-21 12:38:16	2021-10-21 12:38:16	'60':7 'activ':8 'arang':10 'carolin':11 'escritur':3 'espinoz':9 'lectur':1 'promocion':6 'teori':4
\.


--
-- TOC entry 2771 (class 0 OID 40728)
-- Dependencies: 197
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
25	2014_10_12_000000_create_users_table	1
26	2014_10_12_100000_create_password_resets_table	1
27	2019_08_19_000000_create_failed_jobs_table	1
28	2021_04_26_230845_create_permission_tables	1
29	2021_05_05_184239_create_sessions_table	1
30	2021_09_10_180549_create_biblos_table	1
33	2021_10_04_133326_update_biblos_1_tables	2
34	2021_10_11_173249_update_biblos_2_tables	3
35	2021_10_26_235937_update_biblos_3_tables	4
36	2021_10_28_185127_update_biblos_4_tables	4
\.


--
-- TOC entry 2795 (class 0 OID 44051)
-- Dependencies: 221
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
1	App\\Models\\User\\Role	1
11	App\\Models\\User\\Role	2
7	App\\Models\\User\\Role	3
7	App\\Models\\User\\Role	4
7	App\\Models\\User\\Role	5
\.


--
-- TOC entry 2796 (class 0 OID 44063)
-- Dependencies: 222
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 43997)
-- Dependencies: 214
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 44131)
-- Dependencies: 229
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (id, role_id, permission_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 44111)
-- Dependencies: 227
-- Data for Name: permission_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_user (id, user_id, permission_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N
2	2	11	\N	\N	\N
\.


--
-- TOC entry 2792 (class 0 OID 44020)
-- Dependencies: 218
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, descripcion, color, guard_name, created_at, updated_at) FROM stdin;
1	all	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
2	crear	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
3	guardar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
4	editar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
5	modificar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
6	eliminar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
7	consultar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
8	imprimir	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
9	asignar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
10	desasignar	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
11	sysop	\N	#7986cb	web	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2816 (class 0 OID 44349)
-- Dependencies: 242
-- Data for Name: portadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portadas (id, root, filename, filename_png, filename_thumb, pie_de_foto, status_portada, empresa_id, creado_por_id, ip, host, deleted_at, created_at, updated_at) FROM stdin;
1		7a6fc68444d8884585256e8c5e36f3a1721145ec-627-1.jpg	1	_thumb_7a6fc68444d8884585256e8c5e36f3a1721145ec-627-1.png		1	1	2			\N	2021-10-26 12:55:44	2021-10-26 12:55:44
2		d4feca3be08690264f598356e04dbd3424f6c3bd-932-2.jpg	1	_thumb_d4feca3be08690264f598356e04dbd3424f6c3bd-932-2.png		1	1	1			\N	2021-10-26 12:56:24	2021-10-26 12:56:25
11		456849ced7c13a783890c7d68602e936657cb69a-517-11.jpg	1	_thumb_456849ced7c13a783890c7d68602e936657cb69a-517-11.png		1	1	2			\N	2021-10-26 13:13:39	2021-10-26 13:13:39
13		1e34ce2588ad6117dee9b6b4b05aed9ad3f53b4f-398-13.jpg	1	_thumb_1e34ce2588ad6117dee9b6b4b05aed9ad3f53b4f-398-13.png		1	1	2			\N	2021-10-26 18:29:17	2021-10-26 18:29:17
\.


--
-- TOC entry 2797 (class 0 OID 44074)
-- Dependencies: 223
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 44091)
-- Dependencies: 225
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_user (id, user_id, role_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N
2	2	2	\N	\N	\N
\.


--
-- TOC entry 2794 (class 0 OID 44035)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, descripcion, color, abreviatura, guard_name, created_at, updated_at) FROM stdin;
1	ADMIN	Administrator	#263238	adm	web	2021-10-01 20:45:41	2021-10-01 20:45:41
2	SYSOP	System Operator	#455a64	sys	web	2021-10-01 20:45:41	2021-10-01 20:45:41
3	Invitado	Invitado	#607d8b	inv	web	2021-10-01 20:45:41	2021-10-01 20:45:41
4	ALUMNO	Alumno	#558b2f	alu	web	2021-10-01 20:45:41	2021-10-01 20:45:41
5	PROFESOR	Profesor	#dd2c00	pro	web	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2804 (class 0 OID 44149)
-- Dependencies: 230
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 44222)
-- Dependencies: 236
-- Data for Name: tipomaterial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipomaterial (id, tipo_material, empresa_id, creado_por_id, deleted_at, created_at, updated_at, searchtext) FROM stdin;
1	LIBRO	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'libr':1
2	REVISTA	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'revist':1
3	CD	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'cd':1
4	DVD	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'dvd':1
\.


--
-- TOC entry 2777 (class 0 OID 43873)
-- Dependencies: 203
-- Data for Name: user_adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_adress (id, calle, num_ext, num_int, colonia, localidad, municipio, estado, pais, cp, user_id, deleted_at, created_at, updated_at) FROM stdin;
1							TABASCO	MÉXICO		1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2							TABASCO	MÉXICO		2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2779 (class 0 OID 43898)
-- Dependencies: 205
-- Data for Name: user_extend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_extend (id, ocupacion, profesion, lugar_trabajo, lugar_nacimiento, user_id, deleted_at, created_at, updated_at) FROM stdin;
1					1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2					2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2781 (class 0 OID 43918)
-- Dependencies: 207
-- Data for Name: user_social; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_social (id, red_social, username_red_social, alias_red_social, user_id, deleted_at, created_at, updated_at) FROM stdin;
1				1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2				2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2775 (class 0 OID 43830)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, nombre, ap_paterno, ap_materno, curp, emails, celulares, telefonos, fecha_nacimiento, genero, root, filename, filename_png, filename_thumb, admin, session_id, status_user, empresa_id, creado_por_id, user_id_anterior, ip, host, logged, logged_at, logout_at, email_verified_at, id_sistema_anterior, deleted_at, remember_token, created_at, updated_at, searchtext) FROM stdin;
1	Admin	sentauro@gmail.com	$2y$10$aRnBNUUWDzO8tw5cKPXrYun.nTTHLZ2E.vpPoluNBqFpgaxRbYnf6	Administrador	\N	\N					\N	1	profile/	1.png	_1_.png	_thumb_1.png	t	\N	1	1	1	0	192.168.255.1	192.168.255.1	f	\N	\N	2021-10-01 20:45:41	0	\N	wGolBtHStaAsRyBUl95GPkH7DpEj2T1mNJwsgn9vrhLFZPQEQjF7MlaHFhWT	2021-10-01 20:45:41	2021-10-01 21:00:06	'administr':1
2	SysOp	sysop@example.com	$2y$10$r6CkO9lCsJkmryvqSge/l.ChypwxQsqEkCPMuWLEoK1UPMGEcAvvO	System Operator	\N	\N					\N	0	profile/	2.jpg	_2_.png	_thumb_2.png	f	\N	1	1	1	0	187.141.121.144	187.141.121.144	f	\N	\N	2021-10-01 20:45:41	0	\N	eGgVQr9mN74ac0QCzVbZ1SWMYS35S9mkaR3gtdWpx5en8DwcggLh1hLrowMv	2021-10-01 20:45:41	2021-10-11 17:14:08	'operator':2 'system':1
\.


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 208
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 1, false);


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 231
-- Name: codigopaises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.codigopaises_id_seq', 1, false);


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 243
-- Name: editoriale_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriale_libro_id_seq', 1, false);


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 233
-- Name: editoriales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_seq', 224, true);


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 198
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresas_id_seq', 1, true);


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 215
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 247
-- Name: historiallibros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historiallibros_id_seq', 1, false);


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 212
-- Name: imagen_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagen_user_id_seq', 1, false);


--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 210
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_id_seq', 1, false);


--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 245
-- Name: inventariolibro_portada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventariolibro_portada_id_seq', 1, true);


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 239
-- Name: inventariolibros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventariolibros_id_seq', 5, true);


--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 249
-- Name: libro_portada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_portada_id_seq', 13, true);


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 237
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_seq', 932, true);


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 36, true);


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 228
-- Name: permission_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_role_id_seq', 1, false);


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 226
-- Name: permission_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_user_id_seq', 2, true);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 217
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 11, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 241
-- Name: portadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portadas_id_seq', 13, true);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 224
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_user_id_seq', 2, true);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipomaterial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipomaterial_id_seq', 4, true);


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_adress_id_seq', 2, true);


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_extend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_extend_id_seq', 2, true);


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_social_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_social_id_seq', 2, true);


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 2483 (class 2606 OID 43940)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 44172)
-- Name: codigopaises codigopaises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 44405)
-- Name: editoriale_libro editoriale_libro_editoriale_id_libro_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_editoriale_id_libro_id_unique UNIQUE (editoriale_id, libro_id);


--
-- TOC entry 2580 (class 2606 OID 44403)
-- Name: editoriale_libro editoriale_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 44219)
-- Name: editoriales editoriales_editorial_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_editorial_unique UNIQUE (editorial);


--
-- TOC entry 2543 (class 2606 OID 44204)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 40749)
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 44015)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 44017)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2590 (class 2606 OID 44462)
-- Name: historiallibros historiallibros_libro_id_inventariolibro_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_libro_id_inventariolibro_id_user_id_unique UNIQUE (libro_id, inventariolibro_id, user_id);


--
-- TOC entry 2592 (class 2606 OID 44455)
-- Name: historiallibros historiallibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 43982)
-- Name: imagen_user imagen_user_imagen_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_imagen_id_user_id_unique UNIQUE (imagen_id, user_id);


--
-- TOC entry 2492 (class 2606 OID 43980)
-- Name: imagen_user imagen_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 43958)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 44427)
-- Name: inventariolibro_portada inventariolibro_portada_inventariolibro_id_portada_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_inventariolibro_id_portada_id_unique UNIQUE (inventariolibro_id, portada_id);


--
-- TOC entry 2584 (class 2606 OID 44425)
-- Name: inventariolibro_portada inventariolibro_portada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 44320)
-- Name: inventariolibros inventariolibros_codebar_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_codebar_unique UNIQUE (codebar);


--
-- TOC entry 2567 (class 2606 OID 44318)
-- Name: inventariolibros inventariolibros_isbn_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_isbn_unique UNIQUE (isbn);


--
-- TOC entry 2569 (class 2606 OID 44316)
-- Name: inventariolibros inventariolibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 58492)
-- Name: libro_portada libro_portada_libro_id_portada_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_libro_id_portada_id_unique UNIQUE (libro_id, portada_id);


--
-- TOC entry 2597 (class 2606 OID 58490)
-- Name: libro_portada libro_portada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 44268)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 58462)
-- Name: libros libros_titulo_autor_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_titulo_autor_unique UNIQUE (titulo, autor);


--
-- TOC entry 2464 (class 2606 OID 40733)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 44062)
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- TOC entry 2514 (class 2606 OID 44073)
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- TOC entry 2526 (class 2606 OID 44136)
-- Name: permission_role permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 44138)
-- Name: permission_role permission_role_role_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_permission_id_unique UNIQUE (role_id, permission_id);


--
-- TOC entry 2522 (class 2606 OID 44116)
-- Name: permission_user permission_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 44118)
-- Name: permission_user permission_user_user_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_permission_id_unique UNIQUE (user_id, permission_id);


--
-- TOC entry 2500 (class 2606 OID 44032)
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 2502 (class 2606 OID 44030)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 44369)
-- Name: portadas portadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 44088)
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 2518 (class 2606 OID 44096)
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 44098)
-- Name: role_user role_user_user_id_role_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_role_id_unique UNIQUE (user_id, role_id);


--
-- TOC entry 2504 (class 2606 OID 44050)
-- Name: roles roles_abreviatura_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_abreviatura_unique UNIQUE (abreviatura);


--
-- TOC entry 2506 (class 2606 OID 44048)
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 2508 (class 2606 OID 44046)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 44156)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 44230)
-- Name: tipomaterial tipomaterial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 43890)
-- Name: user_adress user_adress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 43910)
-- Name: user_extend user_extend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend
    ADD CONSTRAINT user_extend_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 43926)
-- Name: user_social user_social_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social
    ADD CONSTRAINT user_social_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 43854)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 43866)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 2533 (class 1259 OID 44184)
-- Name: codigopaises_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_creado_por_id_index ON public.codigopaises USING btree (creado_por_id);


--
-- TOC entry 2534 (class 1259 OID 44173)
-- Name: codigopaises_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_empresa_id_index ON public.codigopaises USING btree (empresa_id);


--
-- TOC entry 2535 (class 1259 OID 44185)
-- Name: codigopaises_migration_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_migration_id_index ON public.codigopaises USING btree (migration_id);


--
-- TOC entry 2538 (class 1259 OID 44207)
-- Name: editoriales_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_creado_por_id_index ON public.editoriales USING btree (creado_por_id);


--
-- TOC entry 2541 (class 1259 OID 44206)
-- Name: editoriales_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_empresa_id_index ON public.editoriales USING btree (empresa_id);


--
-- TOC entry 2544 (class 1259 OID 44205)
-- Name: editoriales_predeterminado_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_predeterminado_index ON public.editoriales USING btree (predeterminado);


--
-- TOC entry 2545 (class 1259 OID 44497)
-- Name: editoriales_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_searchtext_gin ON public.editoriales USING gin (searchtext);


--
-- TOC entry 2585 (class 1259 OID 44460)
-- Name: historiallibros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_creado_por_id_index ON public.historiallibros USING btree (creado_por_id);


--
-- TOC entry 2586 (class 1259 OID 44459)
-- Name: historiallibros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_empresa_id_index ON public.historiallibros USING btree (empresa_id);


--
-- TOC entry 2587 (class 1259 OID 44457)
-- Name: historiallibros_inventariolibro_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_inventariolibro_id_index ON public.historiallibros USING btree (inventariolibro_id);


--
-- TOC entry 2588 (class 1259 OID 44456)
-- Name: historiallibros_libro_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_libro_id_index ON public.historiallibros USING btree (libro_id);


--
-- TOC entry 2593 (class 1259 OID 44458)
-- Name: historiallibros_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_user_id_index ON public.historiallibros USING btree (user_id);


--
-- TOC entry 2488 (class 1259 OID 43993)
-- Name: imagen_user_imagen_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagen_user_imagen_id_index ON public.imagen_user USING btree (imagen_id);


--
-- TOC entry 2493 (class 1259 OID 43994)
-- Name: imagen_user_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagen_user_user_id_index ON public.imagen_user USING btree (user_id);


--
-- TOC entry 2484 (class 1259 OID 43960)
-- Name: imagenes_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagenes_creado_por_id_index ON public.imagenes USING btree (creado_por_id);


--
-- TOC entry 2487 (class 1259 OID 43959)
-- Name: imagenes_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagenes_user_id_index ON public.imagenes USING btree (user_id);


--
-- TOC entry 2560 (class 1259 OID 44323)
-- Name: inventariolibros_apartado_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_apartado_user_id_index ON public.inventariolibros USING btree (apartado_user_id);


--
-- TOC entry 2563 (class 1259 OID 44326)
-- Name: inventariolibros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_creado_por_id_index ON public.inventariolibros USING btree (creado_por_id);


--
-- TOC entry 2564 (class 1259 OID 44324)
-- Name: inventariolibros_editorial_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_editorial_id_index ON public.inventariolibros USING btree (editorial_id);


--
-- TOC entry 2565 (class 1259 OID 44325)
-- Name: inventariolibros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_empresa_id_index ON public.inventariolibros USING btree (empresa_id);


--
-- TOC entry 2570 (class 1259 OID 44322)
-- Name: inventariolibros_prestado_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_prestado_user_id_index ON public.inventariolibros USING btree (prestado_user_id);


--
-- TOC entry 2571 (class 1259 OID 58522)
-- Name: inventariolibros_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_searchtext_gin ON public.inventariolibros USING gin (searchtext);


--
-- TOC entry 2572 (class 1259 OID 44321)
-- Name: inventariolibros_uuid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_uuid_index ON public.inventariolibros USING btree (uuid);


--
-- TOC entry 2551 (class 1259 OID 44272)
-- Name: libros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_creado_por_id_index ON public.libros USING btree (creado_por_id);


--
-- TOC entry 2552 (class 1259 OID 44271)
-- Name: libros_editorial_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_editorial_id_index ON public.libros USING btree (editorial_id);


--
-- TOC entry 2553 (class 1259 OID 44273)
-- Name: libros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_empresa_id_index ON public.libros USING btree (empresa_id);


--
-- TOC entry 2556 (class 1259 OID 58520)
-- Name: libros_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_searchtext_gin ON public.libros USING gin (searchtext);


--
-- TOC entry 2557 (class 1259 OID 44269)
-- Name: libros_tipo_material_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_tipo_material_id_index ON public.libros USING btree (tipo_material_id);


--
-- TOC entry 2509 (class 1259 OID 44054)
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- TOC entry 2512 (class 1259 OID 44066)
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- TOC entry 2494 (class 1259 OID 44003)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2573 (class 1259 OID 44373)
-- Name: portadas_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX portadas_creado_por_id_index ON public.portadas USING btree (creado_por_id);


--
-- TOC entry 2574 (class 1259 OID 44372)
-- Name: portadas_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX portadas_empresa_id_index ON public.portadas USING btree (empresa_id);


--
-- TOC entry 2467 (class 1259 OID 43995)
-- Name: searchtext_user_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX searchtext_user_gin ON public.users USING gin (searchtext);


--
-- TOC entry 2529 (class 1259 OID 44158)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 2532 (class 1259 OID 44157)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 2546 (class 1259 OID 44232)
-- Name: tipomaterial_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipomaterial_creado_por_id_index ON public.tipomaterial USING btree (creado_por_id);


--
-- TOC entry 2547 (class 1259 OID 44231)
-- Name: tipomaterial_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipomaterial_empresa_id_index ON public.tipomaterial USING btree (empresa_id);


--
-- TOC entry 2550 (class 1259 OID 44495)
-- Name: tm_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tm_searchtext_gin ON public.tipomaterial USING gin (searchtext);


--
-- TOC entry 2468 (class 1259 OID 43869)
-- Name: users_logged_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logged_at_index ON public.users USING btree (logged_at);


--
-- TOC entry 2469 (class 1259 OID 43868)
-- Name: users_logged_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logged_index ON public.users USING btree (logged);


--
-- TOC entry 2470 (class 1259 OID 43870)
-- Name: users_logout_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logout_at_index ON public.users USING btree (logout_at);


--
-- TOC entry 2473 (class 1259 OID 43867)
-- Name: users_user_id_anterior_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_id_anterior_index ON public.users USING btree (user_id_anterior);


--
-- TOC entry 2644 (class 2620 OID 43996)
-- Name: users ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.users FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'ap_paterno', 'ap_materno', 'nombre', 'curp');


--
-- TOC entry 2646 (class 2620 OID 44496)
-- Name: tipomaterial ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.tipomaterial FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'tipo_material');


--
-- TOC entry 2645 (class 2620 OID 44498)
-- Name: editoriales ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.editoriales FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'editorial', 'representante', 'telefonos', 'email');


--
-- TOC entry 2647 (class 2620 OID 58521)
-- Name: libros ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.libros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'titulo', 'autor');


--
-- TOC entry 2648 (class 2620 OID 58523)
-- Name: inventariolibros ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.inventariolibros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'isbn', 'clasificacion', 'edicion', 'codebar', 'etiqueta_smarth');


--
-- TOC entry 2618 (class 2606 OID 44179)
-- Name: codigopaises codigopaises_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2617 (class 2606 OID 44174)
-- Name: codigopaises codigopaises_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2634 (class 2606 OID 44411)
-- Name: editoriale_libro editoriale_libro_editoriale_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_editoriale_id_foreign FOREIGN KEY (editoriale_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 2633 (class 2606 OID 44406)
-- Name: editoriale_libro editoriale_libro_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2620 (class 2606 OID 44213)
-- Name: editoriales editoriales_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2619 (class 2606 OID 44208)
-- Name: editoriales editoriales_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2641 (class 2606 OID 44483)
-- Name: historiallibros historiallibros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2640 (class 2606 OID 44478)
-- Name: historiallibros historiallibros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2638 (class 2606 OID 44468)
-- Name: historiallibros historiallibros_inventariolibro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_inventariolibro_id_foreign FOREIGN KEY (inventariolibro_id) REFERENCES public.inventariolibros(id) ON DELETE CASCADE;


--
-- TOC entry 2637 (class 2606 OID 44463)
-- Name: historiallibros historiallibros_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2639 (class 2606 OID 44473)
-- Name: historiallibros historiallibros_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2605 (class 2606 OID 43983)
-- Name: imagen_user imagen_user_imagen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_imagen_id_foreign FOREIGN KEY (imagen_id) REFERENCES public.imagenes(id) ON DELETE CASCADE;


--
-- TOC entry 2606 (class 2606 OID 43988)
-- Name: imagen_user imagen_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2604 (class 2606 OID 43966)
-- Name: imagenes imagenes_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2603 (class 2606 OID 43961)
-- Name: imagenes imagenes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2635 (class 2606 OID 44428)
-- Name: inventariolibro_portada inventariolibro_portada_inventariolibro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_inventariolibro_id_foreign FOREIGN KEY (inventariolibro_id) REFERENCES public.inventariolibros(id) ON DELETE CASCADE;


--
-- TOC entry 2636 (class 2606 OID 44433)
-- Name: inventariolibro_portada inventariolibro_portada_portada_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_portada_id_foreign FOREIGN KEY (portada_id) REFERENCES public.portadas(id) ON DELETE CASCADE;


--
-- TOC entry 2630 (class 2606 OID 44342)
-- Name: inventariolibros inventariolibros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2628 (class 2606 OID 44332)
-- Name: inventariolibros inventariolibros_editorial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_editorial_id_foreign FOREIGN KEY (editorial_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 2629 (class 2606 OID 44337)
-- Name: inventariolibros inventariolibros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2627 (class 2606 OID 44327)
-- Name: inventariolibros inventariolibros_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2642 (class 2606 OID 58493)
-- Name: libro_portada libro_portada_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2643 (class 2606 OID 58498)
-- Name: libro_portada libro_portada_portada_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_portada_id_foreign FOREIGN KEY (portada_id) REFERENCES public.portadas(id) ON DELETE CASCADE;


--
-- TOC entry 2626 (class 2606 OID 44289)
-- Name: libros libros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2623 (class 2606 OID 44274)
-- Name: libros libros_editorial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_editorial_id_foreign FOREIGN KEY (editorial_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 2625 (class 2606 OID 44284)
-- Name: libros libros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2624 (class 2606 OID 44279)
-- Name: libros libros_tipo_material_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_tipo_material_id_foreign FOREIGN KEY (tipo_material_id) REFERENCES public.tipomaterial(id) ON DELETE CASCADE;


--
-- TOC entry 2607 (class 2606 OID 44056)
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2608 (class 2606 OID 44067)
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2616 (class 2606 OID 44144)
-- Name: permission_role permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2615 (class 2606 OID 44139)
-- Name: permission_role permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2614 (class 2606 OID 44124)
-- Name: permission_user permission_user_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2613 (class 2606 OID 44119)
-- Name: permission_user permission_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2632 (class 2606 OID 44389)
-- Name: portadas portadas_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2631 (class 2606 OID 44384)
-- Name: portadas portadas_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2609 (class 2606 OID 44077)
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2610 (class 2606 OID 44082)
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2612 (class 2606 OID 44104)
-- Name: role_user role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2611 (class 2606 OID 44099)
-- Name: role_user role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2622 (class 2606 OID 44238)
-- Name: tipomaterial tipomaterial_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2621 (class 2606 OID 44233)
-- Name: tipomaterial tipomaterial_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2600 (class 2606 OID 43891)
-- Name: user_adress user_adress_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2601 (class 2606 OID 43911)
-- Name: user_extend user_extend_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend
    ADD CONSTRAINT user_extend_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2602 (class 2606 OID 43927)
-- Name: user_social user_social_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social
    ADD CONSTRAINT user_social_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2599 (class 2606 OID 43860)
-- Name: users users_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2598 (class 2606 OID 43855)
-- Name: users users_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


-- Completed on 2021-10-29 18:46:43 CDT

--
-- PostgreSQL database dump complete
--

