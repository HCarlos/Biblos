--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

-- Started on 2022-02-10 17:59:08 CST

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
-- TOC entry 2833 (class 0 OID 0)
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
-- TOC entry 2834 (class 0 OID 0)
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
-- TOC entry 2835 (class 0 OID 0)
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
-- TOC entry 2836 (class 0 OID 0)
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
-- TOC entry 2837 (class 0 OID 0)
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
-- TOC entry 2838 (class 0 OID 0)
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
-- TOC entry 2839 (class 0 OID 0)
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
-- TOC entry 2840 (class 0 OID 0)
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
-- TOC entry 2841 (class 0 OID 0)
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
-- TOC entry 2842 (class 0 OID 0)
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
-- TOC entry 2843 (class 0 OID 0)
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
    searchtext tsvector,
    ficha_no character varying(25) DEFAULT ''::character varying
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
-- TOC entry 2844 (class 0 OID 0)
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
-- TOC entry 2845 (class 0 OID 0)
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
-- TOC entry 2846 (class 0 OID 0)
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
-- TOC entry 2847 (class 0 OID 0)
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
-- TOC entry 2848 (class 0 OID 0)
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
-- TOC entry 2849 (class 0 OID 0)
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
-- TOC entry 2850 (class 0 OID 0)
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
-- TOC entry 2851 (class 0 OID 0)
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
-- TOC entry 2852 (class 0 OID 0)
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
-- TOC entry 2853 (class 0 OID 0)
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
-- TOC entry 2854 (class 0 OID 0)
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
-- TOC entry 2855 (class 0 OID 0)
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
-- TOC entry 2856 (class 0 OID 0)
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
-- TOC entry 2857 (class 0 OID 0)
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
-- TOC entry 2858 (class 0 OID 0)
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
-- TOC entry 2447 (class 2604 OID 44399)
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
-- TOC entry 2453 (class 2604 OID 44443)
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
-- TOC entry 2450 (class 2604 OID 44421)
-- Name: inventariolibro_portada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada ALTER COLUMN id SET DEFAULT nextval('public.inventariolibro_portada_id_seq'::regclass);


--
-- TOC entry 2420 (class 2604 OID 44299)
-- Name: inventariolibros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros ALTER COLUMN id SET DEFAULT nextval('public.inventariolibros_id_seq'::regclass);


--
-- TOC entry 2461 (class 2604 OID 58486)
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
-- TOC entry 2436 (class 2604 OID 44352)
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
-- TOC entry 2784 (class 0 OID 43934)
-- Dependencies: 209
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, categoria, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 44161)
-- Dependencies: 232
-- Data for Name: codigopaises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.codigopaises (id, codigo, lenguaje, tipo, empresa_id, status_lenguaje, creado_por_id, migration_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 44396)
-- Dependencies: 244
-- Data for Name: editoriale_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriale_libro (id, editoriale_id, libro_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 44188)
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
83	EDITORIAL ALFAOMEGA				f	1	1	2	\N	2021-10-05 16:41:46	2021-11-08 13:37:09	'alfaomeg':2 'editorial':1
225	GRUPO CARSO				f	1	1	2	\N	2021-11-08 14:33:28	2021-11-08 14:33:28	'cars':2 'grup':1
226	EDITORIAL GHANDI				f	1	1	2	\N	2021-11-30 19:22:09	2021-11-30 19:22:09	'editorial':1 'ghandi':2
227	EMPRESA ACTIVA				f	1	1	2	\N	2021-12-01 13:44:00	2021-12-01 13:44:00	'activ':2 'empres':1
228	SEMARNAT				f	1	1	2	\N	2021-12-01 18:57:29	2021-12-01 18:57:29	'semarnat':1
229	LIBRERO				f	1	1	2	\N	2021-12-01 20:13:19	2021-12-01 20:13:19	'librer':1
230	EDITORIAL BLUME				f	1	1	2	\N	2021-12-01 20:26:49	2021-12-01 20:26:49	'blum':2 'editorial':1
231	FLUSBOOKS				f	1	1	2	\N	2021-12-01 21:00:29	2021-12-01 21:00:29	'flusbooks':1
232	H.F. ULMANN				f	1	1	2	\N	2021-12-02 13:20:38	2021-12-02 13:20:38	'h.f':1 'ulmann':2
233	SERVILIBROS EDICIONES				f	1	1	2	\N	2021-12-02 13:25:27	2021-12-02 13:25:27	'edicion':2 'servilibr':1
234	PARRAMóN EDICIONES				f	1	1	2	\N	2021-12-02 13:50:26	2021-12-02 13:50:26	'edicion':2 'parramon':1
235	WALKER BOOKS				f	1	1	2	\N	2021-12-07 14:21:57	2021-12-07 14:21:57	'books':2 'walk':1
236	RICHMOND PUBLISHING				f	1	1	2	\N	2021-12-09 14:23:56	2021-12-09 14:23:56	'publishing':2 'richmond':1
237	CASTILLO				f	1	1	2	\N	2021-12-09 14:31:28	2021-12-09 14:31:28	'castill':1
238	IMSS, EDITORIAL MéXICO				f	1	1	2	\N	2021-12-09 14:40:16	2021-12-09 14:40:16	'editorial':2 'imss':1 'mexic':3
239	PLAZA Y VALDéS EDITORES				f	1	1	2	\N	2021-12-09 14:54:22	2021-12-09 14:54:22	'editor':4 'plaz':1 'valdes':3
240	VISTO BUENO EDITORES				f	1	1	2	\N	2021-12-09 15:13:00	2021-12-09 15:13:00	'buen':2 'editor':3 'vist':1
241	T. F. EDITORES				f	1	1	2	\N	2021-12-09 20:55:41	2021-12-09 20:55:41	'editor':3 'f':2 't':1
242	GOBIERNO DEL ESTADO DE TABASCO. INSTITUTO DE CULTURA DE TABASCO				f	1	1	2	\N	2021-12-10 13:37:12	2021-12-10 13:37:12	'cultur':8 'gobiern':1 'institut':6 'tabasc':5,10
243	EDICIONES ERA, EL COLEGIO NACIONAL				f	1	1	2	\N	2021-12-10 14:06:31	2021-12-10 14:06:31	'colegi':4 'edicion':1 'nacional':5
244	EL ATENEO				f	1	1	2	\N	2022-01-04 19:43:15	2022-01-04 19:43:15	'atene':2
245	SIN EDITORIAL				f	1	1	2	\N	2022-01-04 19:50:40	2022-01-04 19:50:40	'editorial':2
246	DIDIEER / HARTIER				f	1	1	2	\N	2022-01-11 16:51:54	2022-01-11 16:51:54	'didi':1 'harti':2
247	HACHETTE				f	1	1	2	\N	2022-01-11 16:57:29	2022-01-11 16:57:35	'hachett':1
248	C L E				f	1	1	2	\N	2022-01-11 18:25:13	2022-01-11 18:25:13	'c':1 'l':2
249	MARCOMBO EDICIONES MEXICANAS				f	1	1	2	\N	2022-01-12 15:58:53	2022-01-12 15:58:53	'edicion':2 'marcomb':1 'mexican':3
250	ESFINGE				f	1	1	2	\N	2022-01-26 14:27:24	2022-01-26 14:27:24	'esfing':1
\.


--
-- TOC entry 2774 (class 0 OID 40736)
-- Dependencies: 199
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresas (id, razon_social, domicilio_fiscal, rfc, ip, host, deleted_at, created_at, updated_at) FROM stdin;
1	Nombre Institución	rfc				\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2791 (class 0 OID 44006)
-- Dependencies: 216
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 44440)
-- Dependencies: 248
-- Data for Name: historiallibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historiallibros (id, libro_id, inventariolibro_id, user_id, fecha, tipo_movto, observaciones, empresa_id, creado_por_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 43973)
-- Dependencies: 213
-- Data for Name: imagen_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagen_user (id, imagen_id, user_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 43943)
-- Dependencies: 211
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenes (id, root, filename, filename_png, filename_thumb, pie_de_foto, user_id, creado_por_id, status_imagen, ip, host, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 44418)
-- Dependencies: 246
-- Data for Name: inventariolibro_portada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventariolibro_portada (id, inventariolibro_id, portada_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	11	\N	\N	\N
3	7	41	\N	\N	\N
4	9	42	\N	\N	\N
5	10	43	\N	\N	\N
6	11	44	\N	\N	\N
7	12	45	\N	\N	\N
9	14	46	\N	\N	\N
10	15	47	\N	\N	\N
12	17	49	\N	\N	\N
13	20	50	\N	\N	\N
14	22	51	\N	\N	\N
15	23	52	\N	\N	\N
16	26	53	\N	\N	\N
17	27	54	\N	\N	\N
18	28	55	\N	\N	\N
19	29	56	\N	\N	\N
20	30	57	\N	\N	\N
21	31	58	\N	\N	\N
22	32	59	\N	\N	\N
23	33	60	\N	\N	\N
24	34	61	\N	\N	\N
25	35	62	\N	\N	\N
26	36	63	\N	\N	\N
27	37	64	\N	\N	\N
28	38	65	\N	\N	\N
29	39	66	\N	\N	\N
30	40	67	\N	\N	\N
31	41	69	\N	\N	\N
32	42	70	\N	\N	\N
33	43	71	\N	\N	\N
34	44	73	\N	\N	\N
35	45	74	\N	\N	\N
36	46	75	\N	\N	\N
37	48	76	\N	\N	\N
38	49	77	\N	\N	\N
39	50	77	\N	\N	\N
40	51	78	\N	\N	\N
41	52	79	\N	\N	\N
42	53	80	\N	\N	\N
43	54	82	\N	\N	\N
44	55	83	\N	\N	\N
45	57	84	\N	\N	\N
46	58	85	\N	\N	\N
47	59	86	\N	\N	\N
48	60	87	\N	\N	\N
49	61	88	\N	\N	\N
50	62	89	\N	\N	\N
51	63	90	\N	\N	\N
52	64	91	\N	\N	\N
53	65	92	\N	\N	\N
54	67	93	\N	\N	\N
55	68	94	\N	\N	\N
56	69	95	\N	\N	\N
57	70	96	\N	\N	\N
58	71	97	\N	\N	\N
59	73	99	\N	\N	\N
60	74	100	\N	\N	\N
61	75	101	\N	\N	\N
62	76	102	\N	\N	\N
63	77	103	\N	\N	\N
64	78	104	\N	\N	\N
65	79	105	\N	\N	\N
66	80	107	\N	\N	\N
67	81	108	\N	\N	\N
68	83	109	\N	\N	\N
69	84	110	\N	\N	\N
70	86	110	\N	\N	\N
71	87	110	\N	\N	\N
72	88	111	\N	\N	\N
73	89	112	\N	\N	\N
74	90	113	\N	\N	\N
75	91	115	\N	\N	\N
76	92	116	\N	\N	\N
77	93	117	\N	\N	\N
78	94	118	\N	\N	\N
79	95	119	\N	\N	\N
80	96	120	\N	\N	\N
81	97	121	\N	\N	\N
82	98	122	\N	\N	\N
83	99	123	\N	\N	\N
84	100	124	\N	\N	\N
85	101	125	\N	\N	\N
86	102	126	\N	\N	\N
87	103	127	\N	\N	\N
88	105	128	\N	\N	\N
89	106	129	\N	\N	\N
90	107	130	\N	\N	\N
91	108	131	\N	\N	\N
92	109	132	\N	\N	\N
93	110	134	\N	\N	\N
94	111	135	\N	\N	\N
95	112	136	\N	\N	\N
96	113	137	\N	\N	\N
97	114	139	\N	\N	\N
98	115	140	\N	\N	\N
99	116	141	\N	\N	\N
100	117	142	\N	\N	\N
101	118	143	\N	\N	\N
102	119	144	\N	\N	\N
103	120	145	\N	\N	\N
104	121	146	\N	\N	\N
105	122	147	\N	\N	\N
106	123	148	\N	\N	\N
107	124	149	\N	\N	\N
108	125	150	\N	\N	\N
109	126	151	\N	\N	\N
110	127	152	\N	\N	\N
111	129	153	\N	\N	\N
112	130	154	\N	\N	\N
113	131	155	\N	\N	\N
115	133	157	\N	\N	\N
116	134	158	\N	\N	\N
117	135	159	\N	\N	\N
118	136	161	\N	\N	\N
119	137	162	\N	\N	\N
120	138	163	\N	\N	\N
121	139	164	\N	\N	\N
122	140	165	\N	\N	\N
123	141	166	\N	\N	\N
124	142	167	\N	\N	\N
125	143	168	\N	\N	\N
126	144	169	\N	\N	\N
127	145	170	\N	\N	\N
128	146	171	\N	\N	\N
129	147	172	\N	\N	\N
130	148	173	\N	\N	\N
131	149	175	\N	\N	\N
132	150	176	\N	\N	\N
133	152	177	\N	\N	\N
134	153	178	\N	\N	\N
135	154	179	\N	\N	\N
136	155	180	\N	\N	\N
137	156	181	\N	\N	\N
138	157	182	\N	\N	\N
139	159	183	\N	\N	\N
140	160	184	\N	\N	\N
141	161	185	\N	\N	\N
142	162	186	\N	\N	\N
143	163	187	\N	\N	\N
144	164	188	\N	\N	\N
145	165	189	\N	\N	\N
146	166	190	\N	\N	\N
147	167	191	\N	\N	\N
148	168	192	\N	\N	\N
149	169	193	\N	\N	\N
150	170	194	\N	\N	\N
151	171	195	\N	\N	\N
152	172	196	\N	\N	\N
153	173	197	\N	\N	\N
154	174	198	\N	\N	\N
155	175	199	\N	\N	\N
156	176	200	\N	\N	\N
157	178	201	\N	\N	\N
158	179	202	\N	\N	\N
159	180	203	\N	\N	\N
160	181	204	\N	\N	\N
161	182	205	\N	\N	\N
162	183	206	\N	\N	\N
163	184	207	\N	\N	\N
164	185	208	\N	\N	\N
165	186	209	\N	\N	\N
166	187	210	\N	\N	\N
167	188	211	\N	\N	\N
168	189	212	\N	\N	\N
169	190	213	\N	\N	\N
170	192	214	\N	\N	\N
171	193	215	\N	\N	\N
172	194	216	\N	\N	\N
173	195	217	\N	\N	\N
174	196	218	\N	\N	\N
175	197	219	\N	\N	\N
176	198	220	\N	\N	\N
177	199	221	\N	\N	\N
178	200	222	\N	\N	\N
179	201	223	\N	\N	\N
180	202	224	\N	\N	\N
181	203	225	\N	\N	\N
182	204	226	\N	\N	\N
183	205	227	\N	\N	\N
184	206	229	\N	\N	\N
185	207	230	\N	\N	\N
186	208	231	\N	\N	\N
187	209	233	\N	\N	\N
188	210	234	\N	\N	\N
189	211	235	\N	\N	\N
190	212	236	\N	\N	\N
191	213	237	\N	\N	\N
192	214	238	\N	\N	\N
193	215	239	\N	\N	\N
194	216	240	\N	\N	\N
195	217	241	\N	\N	\N
196	218	242	\N	\N	\N
197	219	243	\N	\N	\N
198	220	244	\N	\N	\N
199	221	245	\N	\N	\N
200	222	246	\N	\N	\N
201	224	247	\N	\N	\N
202	225	248	\N	\N	\N
203	226	249	\N	\N	\N
204	227	250	\N	\N	\N
205	228	251	\N	\N	\N
206	229	252	\N	\N	\N
207	230	253	\N	\N	\N
208	231	255	\N	\N	\N
209	232	256	\N	\N	\N
210	233	257	\N	\N	\N
211	234	258	\N	\N	\N
212	235	259	\N	\N	\N
213	236	260	\N	\N	\N
214	237	261	\N	\N	\N
215	238	262	\N	\N	\N
216	239	263	\N	\N	\N
217	240	264	\N	\N	\N
218	241	267	\N	\N	\N
219	242	269	\N	\N	\N
220	243	270	\N	\N	\N
221	244	271	\N	\N	\N
222	245	272	\N	\N	\N
223	246	273	\N	\N	\N
224	247	275	\N	\N	\N
225	248	277	\N	\N	\N
226	249	278	\N	\N	\N
227	250	279	\N	\N	\N
228	251	280	\N	\N	\N
229	252	282	\N	\N	\N
230	253	283	\N	\N	\N
231	254	284	\N	\N	\N
232	255	285	\N	\N	\N
233	256	286	\N	\N	\N
234	257	287	\N	\N	\N
235	258	290	\N	\N	\N
236	259	291	\N	\N	\N
237	260	292	\N	\N	\N
238	261	293	\N	\N	\N
239	262	295	\N	\N	\N
240	263	296	\N	\N	\N
241	264	297	\N	\N	\N
242	265	298	\N	\N	\N
243	266	299	\N	\N	\N
244	267	300	\N	\N	\N
245	268	302	\N	\N	\N
246	269	303	\N	\N	\N
247	270	304	\N	\N	\N
248	271	305	\N	\N	\N
249	272	306	\N	\N	\N
250	273	307	\N	\N	\N
251	274	308	\N	\N	\N
252	275	309	\N	\N	\N
253	276	310	\N	\N	\N
254	277	311	\N	\N	\N
255	278	312	\N	\N	\N
256	279	313	\N	\N	\N
257	280	314	\N	\N	\N
258	281	315	\N	\N	\N
259	282	317	\N	\N	\N
260	283	318	\N	\N	\N
261	284	319	\N	\N	\N
262	285	320	\N	\N	\N
263	286	323	\N	\N	\N
264	287	324	\N	\N	\N
265	288	325	\N	\N	\N
266	289	326	\N	\N	\N
267	290	327	\N	\N	\N
268	291	328	\N	\N	\N
271	294	330	\N	\N	\N
272	296	331	\N	\N	\N
273	297	332	\N	\N	\N
274	298	333	\N	\N	\N
275	299	334	\N	\N	\N
276	300	335	\N	\N	\N
277	301	337	\N	\N	\N
278	302	338	\N	\N	\N
279	303	339	\N	\N	\N
280	304	340	\N	\N	\N
281	305	341	\N	\N	\N
282	306	342	\N	\N	\N
283	307	343	\N	\N	\N
284	308	344	\N	\N	\N
285	309	345	\N	\N	\N
286	310	346	\N	\N	\N
287	311	347	\N	\N	\N
288	312	348	\N	\N	\N
289	313	349	\N	\N	\N
290	314	350	\N	\N	\N
291	315	351	\N	\N	\N
292	316	352	\N	\N	\N
293	317	353	\N	\N	\N
294	318	354	\N	\N	\N
295	319	355	\N	\N	\N
296	320	356	\N	\N	\N
297	321	357	\N	\N	\N
298	322	358	\N	\N	\N
299	323	359	\N	\N	\N
300	324	360	\N	\N	\N
301	325	361	\N	\N	\N
302	326	362	\N	\N	\N
303	327	363	\N	\N	\N
304	328	364	\N	\N	\N
305	329	365	\N	\N	\N
306	330	366	\N	\N	\N
307	331	367	\N	\N	\N
308	332	368	\N	\N	\N
309	333	369	\N	\N	\N
310	334	370	\N	\N	\N
313	337	372	\N	\N	\N
314	338	373	\N	\N	\N
315	339	374	\N	\N	\N
317	341	375	\N	\N	\N
318	342	376	\N	\N	\N
319	344	377	\N	\N	\N
320	345	378	\N	\N	\N
321	346	379	\N	\N	\N
322	347	380	\N	\N	\N
323	348	381	\N	\N	\N
324	349	382	\N	\N	\N
325	350	383	\N	\N	\N
326	351	384	\N	\N	\N
327	352	385	\N	\N	\N
328	353	386	\N	\N	\N
329	354	387	\N	\N	\N
330	355	389	\N	\N	\N
331	356	390	\N	\N	\N
332	357	391	\N	\N	\N
333	358	391	\N	\N	\N
334	359	392	\N	\N	\N
335	360	392	\N	\N	\N
336	361	393	\N	\N	\N
337	362	393	\N	\N	\N
338	363	394	\N	\N	\N
339	364	394	\N	\N	\N
340	365	395	\N	\N	\N
341	366	395	\N	\N	\N
342	367	396	\N	\N	\N
343	368	396	\N	\N	\N
344	369	397	\N	\N	\N
345	370	397	\N	\N	\N
346	372	155	\N	\N	\N
347	373	155	\N	\N	\N
348	374	155	\N	\N	\N
349	375	155	\N	\N	\N
350	376	155	\N	\N	\N
351	377	155	\N	\N	\N
352	378	212	\N	\N	\N
353	379	308	\N	\N	\N
354	380	308	\N	\N	\N
355	381	308	\N	\N	\N
356	382	308	\N	\N	\N
357	383	308	\N	\N	\N
358	384	308	\N	\N	\N
359	385	308	\N	\N	\N
360	386	308	\N	\N	\N
361	387	308	\N	\N	\N
362	388	168	\N	\N	\N
363	389	169	\N	\N	\N
364	390	363	\N	\N	\N
365	391	363	\N	\N	\N
366	392	363	\N	\N	\N
367	393	363	\N	\N	\N
368	394	145	\N	\N	\N
369	395	146	\N	\N	\N
370	396	148	\N	\N	\N
371	397	150	\N	\N	\N
372	398	150	\N	\N	\N
373	399	346	\N	\N	\N
374	400	398	\N	\N	\N
375	401	399	\N	\N	\N
376	402	399	\N	\N	\N
377	403	399	\N	\N	\N
378	404	400	\N	\N	\N
379	405	400	\N	\N	\N
380	406	400	\N	\N	\N
381	408	400	\N	\N	\N
382	409	400	\N	\N	\N
383	410	400	\N	\N	\N
384	411	400	\N	\N	\N
385	412	400	\N	\N	\N
386	413	400	\N	\N	\N
387	414	400	\N	\N	\N
388	415	400	\N	\N	\N
389	416	400	\N	\N	\N
390	417	400	\N	\N	\N
391	418	401	\N	\N	\N
392	419	401	\N	\N	\N
393	420	401	\N	\N	\N
394	421	401	\N	\N	\N
395	422	401	\N	\N	\N
396	423	401	\N	\N	\N
397	424	402	\N	\N	\N
398	425	402	\N	\N	\N
399	426	402	\N	\N	\N
400	427	402	\N	\N	\N
401	428	403	\N	\N	\N
402	429	403	\N	\N	\N
403	430	403	\N	\N	\N
404	431	403	\N	\N	\N
405	432	403	\N	\N	\N
406	433	403	\N	\N	\N
407	434	403	\N	\N	\N
408	435	403	\N	\N	\N
409	436	404	\N	\N	\N
410	437	404	\N	\N	\N
411	438	404	\N	\N	\N
412	440	404	\N	\N	\N
413	441	405	\N	\N	\N
414	442	406	\N	\N	\N
415	443	407	\N	\N	\N
416	444	407	\N	\N	\N
417	445	407	\N	\N	\N
418	446	407	\N	\N	\N
419	447	407	\N	\N	\N
420	448	407	\N	\N	\N
421	449	407	\N	\N	\N
422	450	407	\N	\N	\N
423	451	407	\N	\N	\N
424	452	408	\N	\N	\N
425	453	408	\N	\N	\N
426	454	408	\N	\N	\N
427	455	408	\N	\N	\N
428	456	408	\N	\N	\N
429	457	408	\N	\N	\N
430	458	408	\N	\N	\N
431	459	408	\N	\N	\N
432	460	409	\N	\N	\N
433	461	409	\N	\N	\N
434	463	409	\N	\N	\N
435	464	409	\N	\N	\N
436	465	409	\N	\N	\N
437	466	409	\N	\N	\N
438	467	409	\N	\N	\N
439	468	409	\N	\N	\N
440	469	409	\N	\N	\N
441	470	409	\N	\N	\N
442	471	410	\N	\N	\N
443	472	410	\N	\N	\N
444	473	410	\N	\N	\N
445	474	410	\N	\N	\N
446	475	410	\N	\N	\N
447	476	410	\N	\N	\N
448	477	410	\N	\N	\N
449	478	410	\N	\N	\N
450	479	411	\N	\N	\N
451	480	411	\N	\N	\N
452	481	411	\N	\N	\N
453	482	411	\N	\N	\N
454	483	411	\N	\N	\N
455	484	411	\N	\N	\N
456	485	411	\N	\N	\N
457	486	411	\N	\N	\N
458	487	412	\N	\N	\N
459	488	412	\N	\N	\N
460	489	413	\N	\N	\N
461	490	413	\N	\N	\N
462	491	413	\N	\N	\N
463	493	413	\N	\N	\N
464	494	413	\N	\N	\N
465	495	413	\N	\N	\N
466	496	414	\N	\N	\N
467	497	414	\N	\N	\N
468	498	414	\N	\N	\N
469	499	414	\N	\N	\N
470	500	414	\N	\N	\N
471	501	415	\N	\N	\N
472	502	415	\N	\N	\N
473	503	415	\N	\N	\N
474	504	415	\N	\N	\N
475	505	415	\N	\N	\N
476	506	416	\N	\N	\N
477	507	416	\N	\N	\N
478	508	416	\N	\N	\N
479	509	416	\N	\N	\N
480	510	416	\N	\N	\N
481	511	416	\N	\N	\N
482	512	416	\N	\N	\N
483	513	416	\N	\N	\N
484	514	417	\N	\N	\N
485	515	417	\N	\N	\N
486	516	417	\N	\N	\N
487	517	417	\N	\N	\N
488	518	417	\N	\N	\N
489	519	417	\N	\N	\N
490	520	418	\N	\N	\N
491	521	418	\N	\N	\N
492	522	418	\N	\N	\N
493	523	418	\N	\N	\N
494	524	419	\N	\N	\N
495	525	419	\N	\N	\N
496	526	419	\N	\N	\N
497	527	419	\N	\N	\N
498	528	419	\N	\N	\N
499	529	419	\N	\N	\N
500	530	420	\N	\N	\N
501	531	420	\N	\N	\N
502	532	420	\N	\N	\N
503	533	420	\N	\N	\N
504	534	420	\N	\N	\N
505	535	421	\N	\N	\N
506	536	421	\N	\N	\N
507	537	421	\N	\N	\N
508	538	421	\N	\N	\N
509	539	421	\N	\N	\N
510	540	422	\N	\N	\N
511	541	422	\N	\N	\N
512	542	422	\N	\N	\N
513	543	422	\N	\N	\N
514	544	422	\N	\N	\N
515	545	423	\N	\N	\N
516	546	423	\N	\N	\N
517	547	424	\N	\N	\N
518	548	425	\N	\N	\N
519	549	425	\N	\N	\N
520	550	426	\N	\N	\N
521	551	426	\N	\N	\N
522	552	427	\N	\N	\N
523	553	427	\N	\N	\N
524	554	427	\N	\N	\N
525	555	427	\N	\N	\N
526	556	428	\N	\N	\N
527	557	428	\N	\N	\N
528	558	429	\N	\N	\N
529	560	430	\N	\N	\N
530	561	431	\N	\N	\N
531	562	431	\N	\N	\N
532	563	432	\N	\N	\N
533	564	433	\N	\N	\N
534	565	434	\N	\N	\N
535	566	435	\N	\N	\N
536	567	435	\N	\N	\N
537	568	436	\N	\N	\N
538	569	437	\N	\N	\N
539	570	437	\N	\N	\N
540	571	437	\N	\N	\N
541	575	438	\N	\N	\N
542	577	438	\N	\N	\N
543	578	439	\N	\N	\N
544	579	439	\N	\N	\N
545	580	439	\N	\N	\N
547	582	440	\N	\N	\N
548	583	440	\N	\N	\N
549	584	440	\N	\N	\N
550	585	440	\N	\N	\N
551	586	440	\N	\N	\N
552	587	440	\N	\N	\N
553	588	440	\N	\N	\N
554	589	440	\N	\N	\N
555	590	440	\N	\N	\N
556	591	440	\N	\N	\N
557	592	441	\N	\N	\N
558	593	441	\N	\N	\N
559	594	442	\N	\N	\N
562	597	444	\N	\N	\N
563	598	444	\N	\N	\N
564	599	446	\N	\N	\N
565	600	446	\N	\N	\N
566	601	446	\N	\N	\N
567	602	446	\N	\N	\N
568	603	446	\N	\N	\N
569	604	446	\N	\N	\N
570	605	447	\N	\N	\N
571	606	447	\N	\N	\N
572	607	449	\N	\N	\N
573	608	449	\N	\N	\N
574	609	449	\N	\N	\N
575	610	449	\N	\N	\N
576	611	449	\N	\N	\N
577	612	449	\N	\N	\N
578	614	450	\N	\N	\N
579	615	450	\N	\N	\N
580	616	450	\N	\N	\N
581	617	450	\N	\N	\N
582	618	450	\N	\N	\N
583	619	451	\N	\N	\N
584	620	451	\N	\N	\N
585	621	452	\N	\N	\N
586	622	453	\N	\N	\N
587	623	453	\N	\N	\N
588	624	454	\N	\N	\N
589	625	454	\N	\N	\N
590	626	455	\N	\N	\N
591	627	455	\N	\N	\N
592	628	456	\N	\N	\N
593	629	457	\N	\N	\N
594	630	458	\N	\N	\N
595	631	459	\N	\N	\N
596	632	460	\N	\N	\N
597	634	460	\N	\N	\N
598	635	460	\N	\N	\N
599	636	460	\N	\N	\N
600	637	460	\N	\N	\N
601	638	460	\N	\N	\N
602	639	460	\N	\N	\N
603	640	461	\N	\N	\N
604	641	461	\N	\N	\N
605	642	461	\N	\N	\N
606	643	461	\N	\N	\N
607	644	461	\N	\N	\N
608	645	461	\N	\N	\N
\.


--
-- TOC entry 2815 (class 0 OID 44296)
-- Dependencies: 240
-- Data for Name: inventariolibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventariolibros (id, libro_id, isbn, clasificacion, edicion, codebar, prestado_user_id, fecha_prestamo, fecha_entrega, apartado_user_id, fecha_apartado, editorial_id, uuid, observaciones, empresa_id, status_libro, creado_por_id, deleted_at, created_at, updated_at, etiqueta_smarth, no_coleccion, searchtext, ficha_no) FROM stdin;
1	517	9789681660529	461.52 S211 2006	2a. Ed.	0009706382127	0	\N	\N	0	\N	16	4a18bc4f-ca63-4f4c-a9ec-36d8763e7b88		1	1	2	\N	2021-10-26 13:20:34	2021-10-26 13:20:34			'0009706382127':7 '2006':4 '2a':5 '461.52':2 '9789681660529':1 'ed':6 's211':3	
2	398	9681864271	C 912.972 G881 2007	\N	0789681850067	0	\N	\N	0	\N	117	dc44fd60-8f5f-4595-bfec-49a09ee7ee27		1	1	2	\N	2021-10-26 18:14:44	2021-10-26 18:14:44			'0789681850067':6 '2007':5 '912.972':3 '9681864271':1 'c':2 'g881':4	
5	398	9681850068	C 912.972 G881 2003	\N	0009681850068	0	\N	\N	0	\N	117	00edd4c3-343d-4f20-90a0-45f9aef18b36		1	1	2	\N	2021-10-26 18:17:17	2021-10-26 18:17:17			'0009681850068':6 '2003':5 '912.972':3 '9681850068':1 'c':2 'g881':4	
6	933	978-607-606-124-4	500 S211 2013	2501a. Ed.	\N	0	\N	\N	0	\N	162	85e4ec9c-3516-4517-a318-515abe24580d		1	1	2	\N	2021-11-08 14:20:22	2021-11-08 14:20:22	¦020978-607-606-124-4¦082500 S211 2013¦100SANCHEZ TIQUE, MARIA GUADALUPE¦245¡ AH QUé HUEVOS TIENE LA CIENCIA ! / MARIA GUADALUPE SANCHEZ TIQUE¦2501A. ED.¦260MéXICO : UJAT¦30081 PAG.¦440COLEC. HéCTOR OCHOA BACELIS¦6501. CIENCIA - ESTUDIO Y ENSEñANZA¦700I. MALDONADO LóPEZ, LUIS EDUARDO, COAUT.Ì	COLEC. HéCTOR OCHOA BACELIS	'-124':4,14 '-4':5,15 '-606':3,13 '-607':2,12 '020978':11 '082500':16 '100sanchez':19 '2013':8,18 '245':23 '2501a':9,34 '260méxico':36 '30081':38 '440colec':40 '500':6 '6501':44 '700i':49 '978':1 'ah':24 'bacelis':43 'cienci':29,45 'coaut':54 'ed':10,35 'eduard':53 'enseñ':48 'estudi':46 'guadalup':22,31 'hector':41 'huev':26 'lopez':51 'luis':52 'maldon':50 'mari':21,30 'ocho':42 'pag':39 's211':7,17 'sanchez':32 'tiqu':20,33 'ujat':37 'ì':55	
7	934	978-987-629-166-8	612.405 C167 2011	2501a. Ed.	\N	0	\N	\N	0	\N	40	4b0398c8-6f2a-47de-ac1a-92e25175bcb7		1	1	2	\N	2021-11-08 14:31:49	2021-11-08 14:31:49	¦020978-987-629-166-8¦082612.405 C167 2011¦100CALVA, JUAN CARLOS¦245¡PORQUE! PORQUERIA LAS HORMONAS: SOBRE GRANITOS, CRECIMIENTO, SEXO Y OTRAS SEñALES EN EL CUERPO / JUAN CARLOS CALVA¦2501A. ED.¦260ARGENTINA : SIGLO VEINTIUNO EDITORES¦300122 PAG.¦440COLEC. CIENCIA QUE LADRA¦6501. EDUCACIóN SEXUAL 2. HORMONAS SEXUALES 3. GLANDULAS ENDOCRINAS¦700I. GOLOMBEK, DIEGO, SERÌ	COLEC. CIENCIA QUE LADRA	'-166':4,14 '-629':3,13 '-8':5,15 '-987':2,12 '020978':11 '082612.405':16 '100calva':19 '2':55 '2011':8,18 '245':22 '2501a':9,40 '260argentina':42 '3':58 '300122':46 '440colec':48 '612.405':6 '6501':52 '700i':61 '978':1 'c167':7,17 'calv':39 'carl':21,38 'cienci':49 'crecimient':29 'cuerp':36 'dieg':63 'ed':10,41 'editor':45 'educ':53 'endocrin':60 'glandul':59 'golombek':62 'granit':28 'hormon':26,56 'juan':20,37 'ladr':51 'pag':47 'porqueri':24 'serì':64 'sex':30 'sexual':54,57 'señal':33 'sigl':43 'veintiun':44	
9	935	968-6815-29-5	779.25 M754 2005	2501a. Ed.	\N	0	\N	\N	0	\N	225	aa703058-9014-4b75-b444-f99cdc1909d8		1	1	2	\N	2021-11-08 14:43:26	2021-11-08 14:43:26	¦020968-6815-29-5¦082779.25 M754 2005¦100MONSIVáIS, CARLOS¦245¡QUIETOS POR FAVOR! / CARLOS MONSIVáIS¦2501A. ED.¦260MéXICO : GRUPO CARSO¦300239 PAG.¦6501. FOTOGRAFíA DE NIñOS 2. FOTOGRAFíA ARTíSTICA¦700I. RAMOS MEDINA, MANUEL, EDIT.Ì		'-29':3,12 '-5':4,13 '-6815':2,11 '020968':10 '082779.25':14 '100monsiváis':17 '2':36 '2005':7,16 '245':19 '2501a':8,25 '260méxico':27 '300239':30 '6501':32 '700i':39 '779.25':5 '968':1 'artist':38 'carl':18,23 'cars':29 'ed':9,26 'edit':43 'favor':22 'fotograf':33,37 'grup':28 'm754':6,15 'manuel':42 'medin':41 'monsiv':24 'niñ':35 'pag':31 'quiet':20 'ram':40 'ì':44	
10	246	13-968-18-5329-7	510.076 S669 2007	\N	\N	0	\N	\N	0	\N	89	2a3a02ab-114d-4717-bee5-5abe0de8286a		1	1	2	\N	2021-11-08 15:28:39	2021-11-08 15:28:39	¦02013-968-18-5329-7¦050510.076 S669 2007¦100SNAPE,CHARLES¦245¡SAL SI PUEDES!:LABERINTOS Y ROMPECABEZAS MATEMáTICOS/CHARLES SNAPE¦260MéXICO:EDITORIAL LIMUSA¦30048 P./ 27 CM.¦600SNAPE,CHARLES.¦6501.MATEMáTICAS-JUEGOS DE ESTRATEGIA¦700I.HEATHER,SCOTT.Ì		'-18':3,11 '-5329':4,12 '-7':5,13 '-968':2,10 '/charles':27 '02013':9 '050510.076':14 '100snape':17 '13':1 '2007':8,16 '245':19 '260méxico':29 '27':34 '30048':32 '510.076':6 '600snape':36 '6501.matem':38 '700i.heather':44 'atic':40 'aticas-jueg':39 'charl':18,37 'cm':35 'editorial':30 'estrategi':43 'jueg':41 'laberint':23 'limus':31 'matemat':26 'p':33 'pued':22 'rompecabez':25 's669':7,15 'sal':20 'scott':45 'si':21 'snap':28 'ì':46	
11	936	01-89637-028-3	737.4972 B154 2005	2501a. Ed.	\N	0	\N	\N	0	\N	220	635fa7f9-d3ac-4e56-9a62-87e3d3087161		1	1	2	\N	2021-11-08 15:39:36	2021-11-08 15:39:36	¦02001-89637-028-3¦082737.4972 B154 2005¦100BAILEY, DON¦245¡VIVA LA REVOLUCIóN!: THE MONEY OF THE MEXICAN REVOLUTION / BY DON BAILEY¦2501A. ED.¦260ESTADOS UNIDOS DE AMéRICA : AMERICAN NUMISMATIC ASSOCIATION MONEY MUSEUM¦300159 PAG.¦6501. NUMISMáTICA - MéXICO 2. MéXICO - HISTORIA - REVOLUCIóN, 1910 - 1917¦700I. FLORES COLORADO, JOE, COAUT.Ì		'-028':3,12 '-3':4,13 '-89637':2,11 '01':1 '02001':10 '082737.4972':14 '100bailey':17 '1910':52 '1917':53 '2':48 '2005':7,16 '245':19 '2501a':8,32 '260estados':34 '300159':43 '6501':45 '700i':54 '737.4972':5 'amer':37 'americ':38 'association':40 'b154':6,15 'bailey':31 'by':29 'coaut':58 'color':56 'don':18,30 'ed':9,33 'flor':55 'histori':50 'joe':57 'mexic':27,47,49 'money':24,41 'museum':42 'numismat':46 'numismatic':39 'of':25 'pag':44 'revolu':22,51 'revolution':28 'the':23,26 'unid':35 'viv':20 'ì':59	
12	937	978-607-95359-5-7	371.58 C657 2011	2501a. Ed.	\N	0	\N	\N	0	\N	167	ebadec61-8cb9-47f4-9368-16d833938950		1	1	2	\N	2021-11-17 13:28:11	2021-11-17 13:28:11	¦020978-607-95359-5-7¦082371.58 C657 2011¦100COBO, PALOMA¦245¿BULLYING?: LIBERATE DEL ACOSO ESCOLAR / PALOMA COBO¦2501A. ED.¦260MéXICO : PRODUCCIONES EDUCACIóN APLICADA¦30087 PAG.¦6501. BULLYING 2. VIOLENCIA ESCOLAR 2. ACOSO ESCOLAR¦700I. TELLO, ROMEO, COAUT.Ì		'-5':4,14 '-607':2,12 '-7':5,15 '-95359':3,13 '020978':11 '082371.58':16 '100cobo':19 '2':39,42 '2011':8,18 '245':21 '2501a':9,29 '260méxico':31 '30087':35 '371.58':6 '6501':37 '700i':45 '978':1 'acos':25,43 'aplic':34 'bullying':22,38 'c657':7,17 'coaut':48 'cob':28 'ed':10,30 'educ':33 'escol':26,41,44 'liberat':23 'pag':36 'palom':20,27 'produccion':32 'rome':47 'tell':46 'violenci':40 'ì':49	
15	938	ISSN18703186	R 505 U58 2000	2501a. Ed.	\N	0	\N	\N	0	\N	179	3b3ec078-0adc-4d90-abca-6de115ff40f9		1	1	2	\N	2021-11-25 18:37:27	2021-11-25 18:37:27	¦020ISSN-1870-3186¦082R 505 U58 2000¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG,¦5001. MARZO (AñO 2, NUM. 16)¦5051. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ		'-1870':9 '-3186':10 '020issn':8 '082r':11 '100universidad':15 '16':45 '2':43,50 '2000':5,14 '245':20 '2501a':6,34 '260méxico':36 '30040':38 '5001':40 '505':3,12 '5051':46 'autonom':17,31 'año':42 'cienci':28,47 'divulg':25 'ed':7,35 'issn18703186':1 'marz':41 'mexic':19,33 'nacional':16,30 'num':44 'pag':39 'period':49 'periodicasì':53 'public':48,52 'r':2 'revist':23 'tecnolog':51 'u58':4,13 'unam':37 'univers':29 'ves':22	
14	938	18703186	R 505 U58 2000	2501a. Ed.	\N	0	\N	\N	0	\N	179	e9950994-2dc0-4697-ada1-ff5439e3fc19		1	1	2	\N	2021-11-25 17:40:48	2021-11-25 19:41:37	¦020ISSN-1870-3186¦082R 505 U58 2000¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG,¦5001. MARZO (AñO 2, NUM. 16)¦5051. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ	VOL. 1 (MARZO) 2. VOL. 2 (ABRIL) 3. VOL. 3 (JULIO)	'-1870':9 '-3186':10 '020issn':8 '082r':11 '100universidad':15 '16':45 '18703186':1 '2':43,50 '2000':5,14 '245':20 '2501a':6,34 '260méxico':36 '30040':38 '5001':40 '505':3,12 '5051':46 'autonom':17,31 'año':42 'cienci':28,47 'divulg':25 'ed':7,35 'marz':41 'mexic':19,33 'nacional':16,30 'num':44 'pag':39 'period':49 'periodicasì':53 'public':48,52 'r':2 'revist':23 'tecnolog':51 'u58':4,13 'unam':37 'univers':29 'ves':22	
17	938	1870-3186	R 505 U58 2006	2501a. Ed.	\N	0	\N	\N	0	\N	179	fb015587-0a90-4096-bbb4-5bacc3988f61		1	1	2	\N	2021-11-25 20:02:42	2021-11-25 20:02:42	¦020ISSN-1870-3186¦082R 505 U58 2006¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG.¦500LA BIBLIOTECA SOLAMENTE TIENE EL EJEMPLAR DEL MES DE JUNIO DEL 2006¦5051. JUNIO (AñO 8, NUM. 91)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ	VOL. 1 (JUNIO) 2. VOL. 2 (SEPTIEMBRE) 3. VOL. 3 (OCTUBRE)	'-1870':10 '-3186':2,11 '020issn':9 '082r':12 '100universidad':16 '1870':1 '2':63 '2006':6,15,52 '245':21 '2501a':7,35 '260méxico':37 '30040':39 '500la':41 '505':4,13 '5051':53 '6501':59 '8':56 '91':58 'autonom':18,32 'año':55 'bibliotec':42 'cienci':29,60 'divulg':26 'ed':8,36 'ejempl':46 'juni':50,54 'mes':48 'mexic':20,34 'nacional':17,31 'num':57 'pag':40 'period':62 'periodicasì':66 'public':61,65 'r':3 'revist':24 'sol':43 'tecnolog':64 'u58':5,14 'unam':38 'univers':30 'ves':23	
20	938	ISSN 18703186	R 505 U58 2008	\N	\N	0	\N	\N	0	\N	179	b29d7d45-94c3-4b3f-a1fa-898391fbff3a		1	1	2	\N	2021-11-25 20:14:14	2021-11-25 20:14:14	&QUOT;¦020ISSN-1870-3186¦082R 505 U58 2008¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦3003 VOL.¦500LA BIBLIOTECA SOLAMENTE TIENE LOS EJEMPLARES DE LOS MESES DE: JUNIO, SEPTIEMBRE Y OCTUBRE¦5051. VOL. 1 (JUNIO) 2. VOL. 2 (SEPTIEMBRE) 3. VOL. 3 (OCTUBRE) ¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ&QUOT;	VOL. 1 (JUNIO) 2. VOL. 2 (SEPTIEMBRE) 3. VOL. 3 (OCTUBRE)	'-1870':8 '-3186':9 '020issn':7 '082r':10 '1':55 '100universidad':14 '18703186':2 '2':57,59,69 '2008':6,13 '245':19 '2501a':33 '260méxico':35 '3':61,63 '3003':37 '500la':39 '505':4,11 '5051':53 '6501':65 'autonom':16,30 'bibliotec':40 'cienci':27,66 'divulg':24 'ed':34 'ejemplar':44 'issn':1 'juni':49,56 'mes':47 'mexic':18,32 'nacional':15,29 'octubr':52,64 'period':68 'periodicasì':72 'public':67,71 'r':3 'revist':22 'septiembr':50,60 'sol':41 'tecnolog':70 'u58':5,12 'unam':36 'univers':28 'ves':21 'vol':38,54,58,62	
43	944	9684037368	616.9792 F711 1998	2501a. Ed.	\N	0	\N	\N	0	\N	156	4fe9ac03-4803-46d7-8983-cd94e098d922		1	1	2	\N	2021-11-30 20:27:22	2021-11-30 20:27:22	¦020968-403-736-8¦082616.9792 F711 1998¦100FORD, MICHAEL THOMAS¦245¿QUé ONDA CON EL SIDA / MICHAEL THOMAS FORD¦2501A. ED.¦260MéXICO : SELECTOR¦300199 PAG.¦440COLEC. SELECTOR¦6501. SIDA 2. ENFERMEDADES TRASMITIBLESÌ	COLEC. SELECTOR	'-403':8 '-736':9 '-8':10 '020968':7 '082616.9792':11 '100ford':14 '1998':4,13 '2':36 '245':17 '2501a':5,26 '260méxico':28 '300199':30 '440colec':32 '616.9792':2 '6501':34 '9684037368':1 'ed':6,27 'enfermedad':37 'f711':3,12 'ford':25 'michael':15,23 'onda':19 'pag':31 'selector':29,33 'sid':22,35 'thom':16,24 'trasmitiblesì':38	
22	938	ISSN  18703186	R 505 U58 2009	2501a. Ed.	\N	0	\N	\N	0	\N	179	96bd5d51-94a2-4a56-8492-827a614aaee2		1	1	2	\N	2021-11-25 20:17:59	2021-11-25 20:17:59	&QUOT;¦020ISSN-1870-3186¦082R 505 U58 2009¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTONOMA DE MéXICO¦2501A. ED.¦260MéXICO: UNAM¦3004 VOL.¦500LA BIBLIOTECA SOLAMENTE TIENE LOS EJEMPLARES DE LOS MESES DE: FEBRERO, MARZO, ABRIL Y JUNIO¦5051. VOL. 1 (FEBRERO) 2. VOL. 2 (MARZO) 3. VOL. 3 (ABRIL) 4. VOL. 4 (JUNIO)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ&QUOT;	VOL. 1 (FEBRERO) 2. VOL. 2 (MARZO) 3. VOL. 3 (ABRIL) 4. VOL. 4 (JUNIO)	'-1870':10 '-3186':11 '020issn':9 '082r':12 '1':58 '100universidad':16 '18703186':2 '2':60,62,76 '2009':6,15 '245':21 '2501a':7,35 '260méxico':37 '3':64,66 '3004':39 '4':68,70 '500la':41 '505':4,13 '5051':56 '6501':72 'abril':53,67 'autonom':18,32 'bibliotec':42 'cienci':29,73 'divulg':26 'ed':8,36 'ejemplar':46 'febrer':51,59 'issn':1 'juni':55,71 'marz':52,63 'mes':49 'mexic':20,34 'nacional':17,31 'period':75 'periodicasì':79 'public':74,78 'r':3 'revist':24 'sol':43 'tecnolog':77 'u58':5,14 'unam':38 'univers':30 'ves':23 'vol':40,57,61,65,69	
23	938	ISSN   18703186	R 505 U58 2010	2501a. Ed.	\N	0	\N	\N	0	\N	179	8d3c5eab-4932-430a-a88c-ad8196055a16		1	1	2	\N	2021-11-25 20:21:23	2021-11-25 20:21:23	"¦020ISSN-1870-3186¦082R 505 U58 2010¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦3002 VOL.¦500LA BIBLIOTECA SOLAMENTE TIENE LOS EJEMPLARES DE LOS MESES DE: AGOSTO Y NOVIEMBRE¦5051. VOL. 1 (AGOSTO) 2. VOL. 2 (NOVIEMBRE)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ"	VOL. 1 (AGOSTO) 2. VOL. 2 (NOVIEMBRE)	'-1870':10 '-3186':11 '020issn':9 '082r':12 '1':56 '100universidad':16 '18703186':2 '2':58,60,66 '2010':6,15 '245':21 '2501a':7,35 '260méxico':37 '3002':39 '500la':41 '505':4,13 '5051':54 '6501':62 'agost':51,57 'autonom':18,32 'bibliotec':42 'cienci':29,63 'divulg':26 'ed':8,36 'ejemplar':46 'issn':1 'mes':49 'mexic':20,34 'nacional':17,31 'noviembr':53,61 'period':65 'periodicasì':69 'public':64,68 'r':3 'revist':24 'sol':43 'tecnolog':67 'u58':5,14 'unam':38 'univers':30 'ves':23 'vol':40,55,59	
26	938	ISSN    18703186	R 505 U58 2012	2501a. Ed.	\N	0	\N	\N	0	\N	179	cc191a06-7f5c-4bc5-902c-dd4559cfd5ba		1	1	2	\N	2021-11-25 20:25:40	2021-11-25 20:25:40	¦020ISSN-1870-3186¦082R 505 U58 2012¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG.¦500LA BIBLIOTECA SOLAMENTE TIENE EL EJEMPLAR DEL MES DE ENERO¦5051. VOL. 1 (ENERO)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ	VOL. 1 (ENERO)	'-1870':10 '-3186':11 '020issn':9 '082r':12 '1':53 '100universidad':16 '18703186':2 '2':59 '2012':6,15 '245':21 '2501a':7,35 '260méxico':37 '30040':39 '500la':41 '505':4,13 '5051':51 '6501':55 'autonom':18,32 'bibliotec':42 'cienci':29,56 'divulg':26 'ed':8,36 'ejempl':46 'ener':50,54 'issn':1 'mes':48 'mexic':20,34 'nacional':17,31 'pag':40 'period':58 'periodicasì':62 'public':57,61 'r':3 'revist':24 'sol':43 'tecnolog':60 'u58':5,14 'unam':38 'univers':30 'ves':23 'vol':52	
27	804	978-607-9192-02-0	330.972 R864 2012	2501a. Ed.	\N	0	\N	\N	0	\N	176	1b27825b-0a69-4ca6-ad68-552282a6d8e1		1	1	2	\N	2021-11-30 13:59:42	2021-11-30 13:59:42	¦020978-607-9192-02-0¦082330.972 R864 2012¦100LóPEZ ROMO, HERIBERTO¦245¿CóMO VIVIMOS LOS MEXICANOS? DATOS CURIOSOS E IMAGENES SOBRE LOS NIVELES SOCIECONóMICOS EN MéXICO / HERIBERTO LóPEZ ROMO¦2501A. ED.¦260MéXICO : INSTIRUTO DE INVESTIGACIONES SOCIALES S.C.¦300279 PAG.¦6501. MéXICO - CONDICIONES ECONóMICAS 2. PODER ADQUISITIVO - MéXICOÌ		'-0':5,15 '-02':4,14 '-607':2,12 '-9192':3,13 '020978':11 '082330.972':16 '100lópez':19 '2':54 '2012':8,18 '245':22 '2501a':9,40 '260méxico':42 '300279':48 '330.972':6 '6501':50 '978':1 'adquisit':56 'com':23 'condicion':52 'curios':28 'dat':27 'econom':53 'ed':10,41 'heribert':21,37 'imagen':30 'instirut':43 'investig':45 'lopez':38 'mexic':36,51 'mexican':26 'mexicoì':57 'nivel':33 'pag':49 'pod':55 'r864':7,17 'rom':20,39 's.c':47 'social':46 'socieconom':34 'viv':24	
44	945	978-970-07-7516-6	583.79 S914 2007	2501a. Ed.	\N	0	\N	\N	0	\N	82	8dd6d40d-99e4-4aca-a271-6906d8f9f04b		1	1	2	\N	2021-11-30 20:30:51	2021-11-30 20:30:51	¦020978-970-07-7516-6¦082583.79 S914 2007¦100STREPPONI, BLANCA¦245¿QUIEN DIJO KARTOFEL? / BLANCA STREPPONI¦2501A. ED.¦260MéXICO : EDITORIAL PORRúA¦30056 PAG.¦6501. PAPA - CULTIVO¦700I. PANTIN, YOLANDA, COAUT.Ì		'-07':3,13 '-6':5,15 '-7516':4,14 '-970':2,12 '020978':11 '082583.79':16 '100strepponi':19 '2007':8,18 '245':21 '2501a':9,27 '260méxico':29 '30056':32 '583.79':6 '6501':34 '700i':37 '978':1 'blanc':20,25 'coaut':40 'cultiv':36 'dij':23 'ed':10,28 'editorial':30 'kartofel':24 'pag':33 'pantin':38 'pap':35 'porru':31 's914':7,17 'strepponi':26 'yoland':39 'ì':41	
28	816	968-24-6043-3	155.8972 J91 2000	2501a. Ed.	\N	0	\N	\N	0	\N	60	a6609666-e487-4761-9965-48d0fe729998		1	1	2	\N	2021-11-30 14:06:14	2021-11-30 14:06:14	¦020968-24-6043-3¦082155.8972 J91 2000¦100JUáREZ SALAZAR, ANGéLICA¦245¿DE QUE TE RIES? LAS CARICATURAS Y SU RELACIóN CON EL INCONCIENTE / ANGéLICA JUáREZ SALAZAR¦2501A. ED.¦260MéXICO : EDITORIAL TRILLAS¦300226 PAG.¦6501. MEXICANO - PSICOLOGíA 2. MéXICO - VIDA SOCIAL Y COSTUMBRESÌ		'-24':2,11 '-3':4,13 '-6043':3,12 '020968':10 '082155.8972':14 '100juárez':17 '155.8972':5 '2':46 '2000':7,16 '245':20 '2501a':8,36 '260méxico':38 '300226':41 '6501':43 '968':1 'angel':19,33 'caricatur':26 'costumbresì':51 'ed':9,37 'editorial':39 'inconcient':32 'j91':6,15 'juarez':34 'mexic':47 'mexican':44 'pag':42 'psicolog':45 'relacion':29 'ries':24 'salaz':18,35 'social':49 'trill':40 'vid':48	
29	869	978-968-860-710-7	158 A223 2007	2502a. Ed.	\N	0	\N	\N	0	\N	88	22113b76-1ad7-46ee-b0a4-d311e8636993		1	1	2	\N	2021-11-30 14:15:44	2021-11-30 14:15:44	¦020978-968-860-710-7¦082158 A223 2007¦100ADDERHOLDT ELLIOT, MIRIAM¦245¿ERES PERFECCIONISTA?: DESCUBRE LO MALO DE SER DEMASIADO BUENO / MIRIAM ADDERHOLDT ELLIOT¦2502A. ED.¦260MéXICO : PAX MéXICO¦300149 PAG.¦6501. PERFECCIóNISMO¦700I. GOLDBERG, JAN, COAUT.Ì		'-7':5,15 '-710':4,14 '-860':3,13 '-968':2,12 '020978':11 '082158':16 '100adderholdt':19 '158':6 '2007':8,18 '245':22 '2502a':9,35 '260méxico':37 '300149':40 '6501':42 '700i':44 '978':1 'a223':7,17 'adderholdt':33 'buen':31 'coaut':47 'demasi':30 'descubr':25 'ed':10,36 'elliot':20,34 'goldberg':45 'jan':46 'mal':27 'mexic':39 'miriam':21,32 'pag':41 'pax':38 'perfeccion':24,43 'ser':29 'ì':48	
34	833	978-968-5950-37-4	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	5b0a8d48-5610-4110-920a-7730221f4032		1	1	2	\N	2021-11-30 14:44:35	2021-11-30 14:44:35	¦020978-968-5950-37-4¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UNA PREPOSICIóN? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. PREPOSICIONES 2. ESPAñOL - GRAMáTICA GENERAL¦700FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-37':4,14 '-4':5,15 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '700fernández':48 '978':1 'bernard':49 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'general':47 'gramat':46 'herramient':41 'il':50 'ines':21,29 'juan':20,28 'pag':37 'preposicion':27,43 'serpentin':35 'sirv':25 'ì':51	
30	837	978-968-5950-35-0	468.2 D322 2008	2501A. ED.	\N	0	\N	\N	0	\N	186	a712b02d-62e5-4b9d-8ede-55078827278b		1	1	2	\N	2021-11-30 14:24:32	2021-11-30 14:45:15	¦020978-968-5950-35-0¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN ADJETIVO / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. ADJETIVOS 2. ESPAñOL - GRAMáTICAÌ	COLEC. CAJA DE HERRAMIENTAS	'-0':5,15 '-35':4,14 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '978':1 'adjet':27,43 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'gramaticaì':46 'herramient':41 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25	
35	836	978-968-5950-34-3	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	7ec4d1ca-bb21-4801-875d-e93301244fca		1	1	2	\N	2021-11-30 14:48:53	2021-11-30 14:48:53	¦020978-968-5950-34-3¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN ADVERBIO / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. ADVERBIOS 2. ESPAñOL - GRAMáTICA GENERALÌ	COLEC. CAJA DE HERRAMIENTAS	'-3':5,15 '-34':4,14 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '978':1 'adverbi':27,43 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'generalì':47 'gramat':46 'herramient':41 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25	
32	838	978-968-5950-36-7	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	1aa27cfb-fc80-4451-a66f-e74d31e895e0		1	1	2	\N	2021-11-30 14:31:32	2021-11-30 14:51:03	¦020978-968-5950-36-7¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN SUSTANTIVO? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA  DE HERRAMIENTAS¦6501. SUSTANTIVOS 2. ESPAñOL - GRAMáTICA GENERAL¦700I. FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-36':4,14 '-5950':3,13 '-7':5,15 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '700i':48 '978':1 'bernard':50 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'fernandez':49 'general':47 'gramat':46 'herramient':41 'il':51 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25 'sustant':27,43 'ì':52	
33	835	978-968-595038-1	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	c3cc0439-a4fb-435e-823f-65355232dc9b		1	1	2	\N	2021-11-30 14:41:30	2021-11-30 14:51:16	¦020978-968-595038-1¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN VERBO? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. VERBOS 2. ESPAñOL - GRAMáTICA GENERAL¦700I. FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-1':4,13 '-595038':3,12 '-968':2,11 '020978':10 '082468.2':14 '100dehesa':17 '2':42 '2008':7,16 '245':20 '2501a':8,29 '260méxico':31 '30031':34 '440colec':36 '468.2':5 '6501':40 '700i':46 '978':1 'bernard':48 'caj':37 'd322':6,15 'dehes':28 'ed':9,30 'editorial':32 'español':43 'fernandez':47 'general':45 'gramat':44 'herramient':39 'il':49 'ines':19,27 'juan':18,26 'pag':35 'serpentin':33 'sirv':23 'verb':25,41 'ì':50	
31	834	978-968-5950-48-0	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	ce138d7c-1fbd-495a-a03d-a9c1345acf35		1	1	2	\N	2021-11-30 14:27:30	2021-11-30 14:50:29	¦020978-968-5950-48-0¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN ARTICULO? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. ARTICULOS 2. ESPAñOL - GRAMáTICA GENERAL¦700I. FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-0':5,15 '-48':4,14 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '700i':48 '978':1 'articul':27,43 'bernard':50 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'fernandez':49 'general':47 'gramat':46 'herramient':41 'il':51 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25 'ì':52	
36	939	978-607-7511-03-8	743.8 F181 2012	2501a. Ed.	\N	0	\N	\N	0	\N	167	8e47fd4c-6370-4936-bc47-5041c22f6df1		1	1	2	\N	2021-11-30 14:57:51	2021-11-30 14:57:51	¦020978-607-7511-03-8¦082743.8 F181 2012¦100FALCóN, GLORIA¦245¿PINTAMOS MANDALAS?: APARTIR DE 5 AñOS / ILUSTRACIONES DE GLORIA FALCóN¦2501A. ED.¦260MéXICO : PRODUCCIONES EDUCACIóN APLICADA¦30071 PAG.¦500LIBRO PARA COLOREAR¦6501. MANDALAS 2. DIBUJOS 3. LIBROS PARA ILUMINARÌ		'-03':4,14 '-607':2,12 '-7511':3,13 '-8':5,15 '020978':11 '082743.8':16 '100falcón':19 '2':45 '2012':8,18 '245':21 '2501a':9,32 '260méxico':34 '3':47 '30071':38 '5':26 '500libro':40 '6501':43 '743.8':6 '978':1 'apart':24 'aplic':37 'años':27 'color':42 'dibuj':46 'ed':10,33 'educ':36 'f181':7,17 'falcon':31 'glori':20,30 'iluminarì':50 'ilustr':28 'libr':48 'mandal':23,44 'pag':39 'pint':22 'produccion':35	
37	528	84-85401-23-9	305.2355 M381 2006	\N	\N	0	\N	\N	0	\N	143	f2adbe50-b7f1-462f-a298-f40b4bef7b9d		1	1	2	\N	2021-11-30 15:04:18	2021-11-30 15:04:18	¦02084-85401-23-9¦082305.2355 M381 2006¦100MARTIN GONZáLEZ, EMILIANO¦245¿POR QUé NO ME ENTIENDEN MIS PADRES? / EMILIANO MARTIN GONZáLEZ¦260VIGO, ESPAñA : NOVA GALICIA EDICIONES¦30053 PAG.¦440SABER PARA VIVIR¦6501. ADOLESCENCIA - PSICOLOGíA 2. PADRES E HIJOSÌ	SABER PARA VIVIR	'-23':3,10 '-85401':2,9 '-9':4,11 '02084':8 '082305.2355':12 '100martin':15 '2':42 '2006':7,14 '245':18 '260vigo':29 '30053':34 '305.2355':5 '440saber':36 '6501':39 '84':1 'adolescent':40 'edicion':33 'emilian':17,26 'entiend':23 'españ':30 'galici':32 'gonzalez':16,28 'hijosì':45 'm381':6,13 'martin':27 'nov':31 'padr':25,43 'pag':35 'psicolog':41 'viv':38	
38	757	978-987-538-322-7	155.646 M585 2011	2501a. Ed.	\N	0	\N	\N	0	\N	114	11bb369a-c927-417c-b17a-576d5a426607		1	1	2	\N	2021-11-30 15:07:16	2021-11-30 15:07:16	¦020978-987-538-322-7¦082155.646 M585 2011¦100MESSING, CLAUDIA¦245¿PORQUé ES TAN DIFICIL SER PADRE HOY?. SIMETRIA INCONCIENTE DE NIñOS Y JOVENES. CONSTRUCCIóN DE NUEVOS MODELOS DE AUTORIDAD / CLAUDIA MESSING¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦30096 PAG.¦6501. PADRES E HIJOSÌ		'-322':4,14 '-538':3,13 '-7':5,15 '-987':2,12 '020978':11 '082155.646':16 '100messing':19 '155.646':6 '2011':8,18 '245':21 '2501a':9,43 '260argentina':45 '30096':53 '6501':55 '978':1 'autor':40 'centr':46 'claudi':20,41 'construccion':35 'didact':52 'dificil':25 'ed':10,44 'educ':49 'hijosì':58 'hoy':28 'inconcient':30 'joven':34 'm585':7,17 'material':51 'messing':42 'model':38 'niñ':32 'nuev':37 'padr':27,56 'pag':54 'porqu':22 'public':48 'ser':26 'simetri':29 'tan':24	
39	808	970-712-406-7	328.34 S959 2005	2504a. Ed.	\N	0	\N	\N	0	\N	148	958ab936-3483-4588-aadb-1a81f321f982		1	1	2	\N	2021-11-30 15:09:43	2021-11-30 15:09:43	¦020970-712-406-7¦082328.34 S959 2005¦100SUPREMA CORTE DE JUSTICIA DE LA NACIóN¦245¿QUE ES EL PODER JUDICIAL DE LA FEDERACIóN? / SUPREMA CORTE DE JUSTICIA DE LA NACIóN¦2504A. ED.¦260MéXICO : SUPREMA CORTE DE JUSTICIA DE LA NACIóN¦30091 PAG.¦6501. PODERES JUDICIALES - MéXICOÌ		'-406':3,12 '-7':4,13 '-712':2,11 '020970':10 '082328.34':14 '100suprema':17 '2005':7,16 '245':24 '2504a':8,40 '260méxico':42 '30091':50 '328.34':5 '6501':52 '970':1 'cort':18,34,44 'ed':9,41 'feder':32 'judicial':29,54 'justici':20,36,46 'mexicoì':55 'nacion':23,39,49 'pag':51 'pod':28 'poder':53 's959':6,15 'suprem':33,43	
40	940	978-968-16-8461-7	320.0973 F363 2008	2501a. Ed.	\N	0	\N	\N	0	\N	16	d282a7ec-132d-4b8b-8f78-54b50c26f49a		1	1	2	\N	2021-11-30 19:12:31	2021-11-30 19:12:31	¦020978-968-16-8461-7¦082320.0973 F363 2008¦100FERNáNDEZ DE CASTRO, RAFAEL¦245¿QUE ES ESTADOA UNIDOS? / RAFAEL FERNáNDEZ DE CASTRO¦2501A. ED.¦260MéXICO : FONDO DE CULTURA ECONóMICA¦300516 PAG.¦440COLEC. SECCIóN DE OBRAS DE POLíTICA Y DERECHO¦6501. E.U.A - POLíTICA Y GOBIERNO 2. E.U.A - HISTORIA¦700I. BLACKMORE, HAZAL, COORD.Ì	COLEC. SECCIóN DE OBRAS DE POLíTICA Y DERECHO	'-16':3,13 '-7':5,15 '-8461':4,14 '-968':2,12 '020978':11 '082320.0973':16 '100fernández':19 '2':54 '2008':8,18 '245':23 '2501a':9,32 '260méxico':34 '300516':39 '320.0973':6 '440colec':41 '6501':49 '700i':57 '978':1 'blackmor':58 'castr':21,31 'coord':60 'cultur':37 'derech':48 'e.u.a':50,55 'econom':38 'ed':10,33 'estado':26 'f363':7,17 'fernandez':29 'fond':35 'gobiern':53 'hazal':59 'histori':56 'obras':44 'pag':40 'polit':46,51 'rafael':22,28 'seccion':42 'unid':27 'ì':61	
41	942	978-987-3743-14-6	346.0482 F762 2015	2502a. Ed.	\N	0	\N	\N	0	\N	226	6e397d78-8df4-4c0a-82ee-d1c1160968ff		1	1	2	\N	2021-11-30 19:39:24	2021-11-30 19:39:24	¦020978-987-3743-14-6¦082346.0482 F762 2015¦100FOUCAULT, MICHEL¦245¿QUé ES UN AUTOR / MICHEL FOUCAULT¦2502A. ED.¦260MéXICO : EDITORIAL GHANDI¦30086 PAG.¦440COLEC. FILOSOFíA ENSAYO; 276¦6501. AUTORES 2. AUTOR¦700I. MATTANI, SILVIO, TR.Ì	COLEC. FILOSOFíA ENSAYO; 276	'-14':4,14 '-3743':3,13 '-6':5,15 '-987':2,12 '020978':11 '082346.0482':16 '100foucault':19 '2':41 '2015':8,18 '245':21 '2502a':9,28 '260méxico':30 '276':38 '30086':33 '346.0482':6 '440colec':35 '6501':39 '700i':43 '978':1 'autor':25,40,42 'ed':10,29 'editorial':31 'ensay':37 'f762':7,17 'filosof':36 'foucault':27 'ghandi':32 'mattani':44 'michel':20,26 'pag':34 'silvi':45 'tr':46 'ì':47	
42	943	978-968-24-7757-7	370.302812 L616 2007	\N	\N	0	\N	\N	0	\N	60	a837f874-48b8-48ab-91a8-7f49888191ab		1	1	2	\N	2021-11-30 19:43:13	2021-11-30 19:43:13	¦020978-968-24-7757-7¦082370.302812 L616 2007¦100LERMA JASSO, HéCTOR¦245¿QUé TIPO DE ALUMNO SOY? UNA GUíA PARA MEJORAR EN EL ESTUDIO / HéCTOR LERMA JASSO¦2502A. ED.¦260MéXICO : EDITORIAL TRILLAS¦300196 PAG.¦500INCLUYE ÍNDICE¦6501. ESTUDIO Y ENSEñANZA 2. ESTUDIO - MéTODO 3. PSICOLOGíA PEDAGOGICAÌ		'-24':3,11 '-7':5,13 '-7757':4,12 '-968':2,10 '020978':9 '082370.302812':14 '100lerma':17 '2':49 '2007':8,16 '245':20 '2502a':36 '260méxico':38 '3':52 '300196':41 '370.302812':6 '500incluye':43 '6501':45 '978':1 'alumn':24 'ed':37 'editorial':39 'enseñ':48 'estudi':32,46,50 'gui':27 'hector':19,33 'indic':44 'jass':18,35 'l616':7,15 'lerm':34 'mejor':29 'metod':51 'pag':42 'pedagogicaì':54 'psicolog':53 'tip':22 'trill':40	
45	946	978-970-07-7515-9	583.79 S914 2007	2501a. Ed.	\N	0	\N	\N	0	\N	82	5f486e1a-2830-4ca4-a4ee-1239354d498c		1	1	2	\N	2021-11-30 20:35:03	2021-11-30 20:35:03	¦020978-970-07-7515-9¦082583.79 S914 2007¦100STREPPONI, BLANCA¦245¿QUIéN DIJO POMODORO? / BLANCA STREPPONI¦2501A. ED.¦260MéXICO : EDITORIAL PORRúA¦30032 PAG.¦6501. JITOMATE - HISTORIA 2. JITOMATE - MERCADOTECNIAÌ		'-07':3,13 '-7515':4,14 '-9':5,15 '-970':2,12 '020978':11 '082583.79':16 '100strepponi':19 '2':37 '2007':8,18 '245':21 '2501a':9,27 '260méxico':29 '30032':32 '583.79':6 '6501':34 '978':1 'blanc':20,25 'dij':23 'ed':10,28 'editorial':30 'histori':36 'jitomat':35,38 'mercadotecniaì':39 'pag':33 'pomodor':24 'porru':31 'quien':22 's914':7,17 'strepponi':26	
46	947	978-970-07-7524-1	583.46 S914 2007	2501a. Ed.	\N	0	\N	\N	0	\N	82	781ede51-114c-4bf4-b766-1229af70ae8c		1	1	2	\N	2021-11-30 20:37:42	2021-11-30 20:37:42	¦020978-970-07-7524-1¦082583.46 S914 2007¦100STREPPONI, BLANCA¦245¿QUIéN DIJO ZAPALLO? / BLANCA STREPPONI¦2501A. ED.¦260MéXICO : EDITORIAL PORRúA¦30044 PAG.¦6501. CALABAZA - CULTIVOÌ		'-07':3,13 '-1':5,15 '-7524':4,14 '-970':2,12 '020978':11 '082583.46':16 '100strepponi':19 '2007':8,18 '245':21 '2501a':9,27 '260méxico':29 '30044':32 '583.46':6 '6501':34 '978':1 'blanc':20,25 'calabaz':35 'cultivoì':36 'dij':23 'ed':10,28 'editorial':30 'pag':33 'porru':31 'quien':22 's914':7,17 'strepponi':26 'zapall':24	
48	948	968-889-320-X	FT 863 G9856 2006	2502a. Ed.	\N	0	\N	\N	0	\N	136	0f9ed7a5-926e-4ace-88c2-fbd5357f27af		1	1	2	\N	2021-11-30 20:55:49	2021-11-30 20:55:49	"¦020968-889-320-X¦082FT 863 G9856 2006¦100GUTIéRREZ LOMASTO, GABRIELA¦245¿QUIéN LES CORTA LAS ALAS A LOS PáJAROS? / GABRIELA GUTIéRREZ LOMASTO¦2502A. ED.¦260MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦300108 PAG. / 20 CM.¦500INCLUYE ÍNDICE¦5051. CHANO CULEBRO 2. LA SOMBRA DEL CUERVO 3. ¿QUIéN LE CORTA LAS ALAS A LOS PáJAROS? 4. EL RIO GUARDA EL SECRETO 5. LA TIERRA MUERTA¦6501. CUENTOS MEXICANOS 2. ESCRITORES TABASQUEñOSÌ"		'-320':3,13 '-889':2,12 '020968':11 '082ft':15 '100gutiérrez':19 '2':51,78 '20':44 '2006':8,18 '245':22 '2502a':9,34 '260méxico':36 '3':56 '300108':42 '4':65 '5':71 '500incluye':46 '5051':48 '6501':75 '863':6,16 '968':1 'alas':27,61 'chan':49 'cm':45 'cort':25,59 'cuent':76 'cuerv':55 'culebr':50 'ed':10,35 'escritor':79 'ft':5 'g9856':7,17 'gabriel':21,31 'gobiern':37 'guard':68 'gutierrez':32 'indic':47 'lomast':20,33 'mexican':77 'muert':74 'pag':43 'pajar':30,64 'quien':23,57 'rio':67 'secret':70 'sombr':53 'tabasc':41 'tabasqueñosì':80 'tierr':73 'x':4,14	
49	949	84-7953-338-2	153.85 J69 1999	25013a. Ed.	\N	0	\N	\N	0	\N	227	1a9508b8-e508-40ea-bf88-f1800985dee3		1	1	2	\N	2021-12-01 13:56:45	2021-12-01 13:56:45	¦02084-7953-338-2¦082153.85 J69 1999¦100JOHNSON, SPENCER¦245¿QUIéN SE A LLEVADO MI QUESO?: UNA MANERA SORPRENDENTE DE AFRONTAR EL CAMBIO EN EL TRABAJO Y EN LA VIDA PRIVADA / SPENCER JOHNSON¦25013A. ED.¦260ESPAñA : EMPRESA ACTIVA¦30093 PAG.¦6501. LIBROS DE MOTIVACIóN PERSONAL 2. MOTIVACIóN DEL ÉXITOÌ		'-2':4,13 '-338':3,12 '-7953':2,11 '02084':10 '082153.85':14 '100johnson':17 '153.85':5 '1999':7,16 '2':55 '245':19 '25013a':8,43 '260españa':45 '30093':48 '6501':50 '84':1 'activ':47 'afront':30 'cambi':32 'ed':9,44 'empres':46 'exitoì':58 'j69':6,15 'johnson':42 'libr':51 'llev':23 'maner':27 'motiv':53,56 'pag':49 'personal':54 'priv':40 'ques':25 'quien':20 'sorprendent':28 'spenc':18,41 'trabaj':35 'vid':39	
50	949	84-7953-445-1	153.85 J69 2001	25025a. Ed.	\N	0	\N	\N	0	\N	227	72bdf72f-69b1-407a-b914-9ee78f04e19c		1	1	2	\N	2021-12-01 14:47:14	2021-12-01 14:47:14	¦02084-7953-445-1¦082153.85 J69 2001¦100JOHNSON, SPENCER¦245¿QUIéN SE HA LLEVADO MI QUESO?: UNA MANERA SORPRENDENTE DE AFRONTAR EL CAMBIO EN EL TRABAJO Y EN LA VIDA PRIVADA / SPENCER JOHNSON¦25025A. ED.¦260ESPAñA : EMPRESA ACTIVA¦300106 PAG.¦6501. LIBROS DE MOTIVACIóN PERSONAL 2. MOTIVACIóN DEL ÉXITOÌ		'-1':4,13 '-445':3,12 '-7953':2,11 '02084':10 '082153.85':14 '100johnson':17 '153.85':5 '2':55 '2001':7,16 '245':19 '25025a':8,43 '260españa':45 '300106':48 '6501':50 '84':1 'activ':47 'afront':30 'cambi':32 'ed':9,44 'empres':46 'exitoì':58 'j69':6,15 'johnson':42 'libr':51 'llev':23 'maner':27 'motiv':53,56 'pag':49 'personal':54 'priv':40 'ques':25 'quien':20 'sorprendent':28 'spenc':18,41 'trabaj':35 'vid':39	
51	950	978-987-538-212-1	371.9 A995 2008	2501a. Ed.	\N	0	\N	\N	0	\N	165	512c7983-28e2-4787-a5cb-be8c7ea7a499		1	1	2	\N	2021-12-01 18:55:07	2021-12-01 18:55:07	¦020978-987-538-212-1¦082371.9 A995 2008¦100AZNER, ANDREA S.¦245¿SON O SE HACEN? EL CAMPO DE LA DISCAPACIDAD INTELECTUAL ESTUDIADA A TRAVEZ DE RECORRIDOS MULTIPLES / ANDREA S. AZNER¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦300248 PAG.¦440COLEC. COLEC. DISCAPACIDAD¦500INCLUYE ÍNDICE¦6501. EDUCACIóN ESPECIAL 2. DEFICIENCIA INTELECTUAL 3. DISCAPACIDAD¦700I. GONZáLEZ CASTAñON, DIEGO, COAUT. II. SIEDE, ISABELINA A, PRóL.Ì	COLEC. COLEC. DISCAPACIDAD	'-1':5,15 '-212':4,14 '-538':3,13 '-987':2,12 '020978':11 '082371.9':16 '100azner':19 '2':62 '2008':8,18 '245':22 '2501a':9,42 '260argentina':44 '3':65 '300248':52 '371.9':6 '440colec':54 '500incluye':57 '6501':59 '700i':67 '978':1 'a995':7,17 'andre':20,39 'azner':41 'camp':28 'castañon':69 'centr':45 'coaut':71 'colec':55 'deficient':63 'didact':51 'dieg':70 'discapac':31,56,66 'ed':10,43 'educ':48,60 'especial':61 'estudi':33 'gonzalez':68 'hac':26 'ii':72 'indic':58 'intelectual':32,64 'isabelin':74 'material':50 'multipl':38 'pag':53 'prol':76 'public':47 'recorr':37 's':21,40 'sied':73 'travez':35 'ì':77	
52	951	978-968-817-877-5	333.70972 M479 2008	2501a. Ed.	\N	0	\N	\N	0	\N	38	793aeb23-db6d-40f4-873b-57851934b3ef		1	1	2	\N	2021-12-01 19:50:08	2021-12-01 19:50:08	¦020978-968-817-877-5¦082333.70972 M479 2008¦100MéXICO, SECRETARIA DE MEDIO AMBIENTE Y RECURSOS NATURALEZ¦245¿Y EL MEDIO AMBIENTE? / SEMARNAT¦2501A. ED.¦260MéXICO : SEMARNAT¦300192 PAG.¦6501. MéXICO - POLíTICA AMBIENTAL 2. MEDIO AMBIENTE - MéXICO 3. RECURSOS NATURALEZ - MéXICOÌ		'-5':5,15 '-817':3,13 '-877':4,14 '-968':2,12 '020978':11 '082333.70972':16 '100méxico':19 '2':43 '2008':8,18 '245':27 '2501a':9,33 '260méxico':35 '3':47 '300192':37 '333.70972':6 '6501':39 '978':1 'ambient':23,31,45 'ambiental':42 'ed':10,34 'm479':7,17 'medi':22,30,44 'mexic':40,46 'mexicoì':50 'naturalez':26,49 'pag':38 'polit':41 'recurs':25,48 'secretari':20 'semarnat':32,36	
53	447	978-84-96609-21-1	923.6 G458 2008	\N	\N	0	\N	\N	0	\N	132	1c71ec8f-e0a3-4652-80ee-8f9be0ba125f		1	1	2	\N	2021-12-01 19:55:38	2021-12-01 19:55:38	¦020978-84-96609-21-1¦082923.6 G458 2008¦100GIFFORD, CLIVE¦24510 LIDERES QUE CAMBIARON EL MUNDO / CLIVE GIFFORD¦260SINGAPORE : EDILUPA¦30063 PAG.¦6501. HUMANISTAS - BIOGRAFIAS 2. ESTADISTAS - BIOGRAFIíAS¦700I. COUSENS, DAVID, IL. II. SáNCHEZ ALMAGRO, IRENE, TR.Ì		'-1':5,13 '-21':4,12 '-84':2,10 '-96609':3,11 '020978':9 '082923.6':14 '100gifford':17 '2':34 '2008':8,16 '24510':19 '260singapore':27 '30063':29 '6501':31 '700i':37 '923.6':6 '978':1 'almagr':43 'biografi':33,36 'cambi':22 'cliv':18,25 'cousens':38 'dav':39 'edilup':28 'estad':35 'g458':7,15 'gifford':26 'human':32 'ii':41 'il':40 'iren':44 'lider':20 'mund':24 'pag':30 'sanchez':42 'tr':45 'ì':46	
54	953	978-90-8998-205-6	502 L664 2012	2501a. Ed.	\N	0	\N	\N	0	\N	229	f838642d-c77e-416b-a270-5d5367ed2611		1	1	2	\N	2021-12-01 20:22:19	2021-12-01 20:22:19	¦020978-90-8998-205-6¦082502 L664 2012¦100LEVY, JOEL¦245100 ANALOGíAS CIENTíFICAS / JOEL LEVY¦2501A. ED.¦260ESPAñA : LIBRERO¦300224 PAG.¦500INCLUYE ÍNDICE¦6501. CIENCIA - ESTUDIO Y ENSEñANZA 2. CIENCIA - LENGUAJE 3. CIENCIA - TERMINOLOGíA¦700I. CILLERO & DE MOTA, TR.Ì		'-205':4,14 '-6':5,15 '-8998':3,13 '-90':2,12 '020978':11 '082502':16 '100levy':19 '2':39 '2012':8,18 '245100':21 '2501a':9,26 '260españa':28 '3':42 '300224':30 '500incluye':32 '502':6 '6501':34 '700i':45 '978':1 'analog':22 'cienci':35,40,43 'cientif':23 'ciller':46 'ed':10,27 'enseñ':38 'estudi':36 'indic':33 'joel':20,24 'l664':7,17 'lenguaj':41 'levy':25 'librer':29 'mot':48 'pag':31 'terminolog':44 'tr':49 'ì':50	
55	954	978-84-9801-624-6	709 B618 2012	2501a. Ed.	\N	0	\N	\N	0	\N	230	6bfa2983-d214-4085-9047-ccb38bab9c4d		1	1	2	\N	2021-12-01 20:30:22	2021-12-01 20:30:22	¦020978-84-9801-624-6¦082709 B618 2012¦100BIRD, MICHAEL¦245100 IDEAS QUE CAMBIARóN EL ARTE / MICHAEL BIRD¦2501A. ED.¦260ESPAñA : EDITORIAL BLUME¦300216 PAG.¦6501. ARTE - HISTORIA 2. ARTE - INDUSTRIA Y COMERCIO¦700I. RODRíGUEZ FISCHER, MAITE, TR. II. RODRIGUEZ FISCHER, CRISTINA, TR.Ì		'-6':5,15 '-624':4,14 '-84':2,12 '-9801':3,13 '020978':11 '082709':16 '100bird':19 '2':39 '2012':8,18 '245100':21 '2501a':9,29 '260españa':31 '300216':34 '6501':36 '700i':44 '709':6 '978':1 'arte':26,37,40 'b618':7,17 'bird':28 'blum':33 'cambiaron':24 'comerci':43 'cristin':52 'ed':10,30 'editorial':32 'fisch':46,51 'histori':38 'ide':22 'ii':49 'industri':41 'mait':47 'michael':20,27 'pag':35 'rodriguez':45,50 'tr':48,53 'ì':54	
57	955	978-84-938183-6-4	720.9 S341 2010	2501a. Ed.	\N	0	\N	\N	0	\N	231	18542652-b7fa-4409-a8c2-04a7fb1ea18f		1	1	2	\N	2021-12-02 13:17:42	2021-12-02 13:17:42	¦020978-84-938183-6-4¦082720.9 S341 2010¦100SCHLEIFER, SIMONE K.¦2451000 ELEMENTOS DE ARQUITECTURA / COORDINACIóN EDITORIAL SIMONE K. SCHLEIFER¦2501A. ED.¦260ESPAñA : FLUSBOOKS¦300615 PAG.¦6501. ARQUITECTURA MODERNA - SIGLO XX 2. DECORACIóN Y ORNAMENTACIóN ARQUITECTONICAÌ		'-4':5,15 '-6':4,14 '-84':2,12 '-938183':3,13 '020978':11 '082720.9':16 '100schleifer':19 '2':42 '2010':8,18 '2451000':22 '2501a':9,31 '260españa':33 '300615':35 '6501':37 '720.9':6 '978':1 'arquitectonicaì':46 'arquitectur':25,38 'coordin':26 'decor':43 'ed':10,32 'editorial':27 'element':23 'flusbooks':34 'k':21,29 'modern':39 'ornament':45 'pag':36 's341':7,17 'schleif':30 'sigl':40 'simon':20,28 'xx':41	
58	956	978-3-8331-6111-7	759 S934 2011	2501a. Ed.	\N	0	\N	\N	0	\N	232	0f472200-0091-42f4-9c0b-c99a488a3d2f		1	1	2	\N	2021-12-02 13:24:13	2021-12-02 13:24:13	¦020978-3-8331-6111-7¦082759 S934 2011¦100STUKENBROCK, CHRISTIANE¦2451000 OBRAS MAESTRAS DE LA PINTURA / CHRISTIANE STUKENBROCK¦2501A. ED.¦260ESPAñA : H.F. ULMANN¦3001007 PAG.¦6501. PINTURA - TRABAJOS ANTERIORES A 1800 2. PINTURA - COLECCIONES¦700I. TOPPER, BARBARA, COAUT.Ì		'-3':2,12 '-6111':4,14 '-7':5,15 '-8331':3,13 '020978':11 '082759':16 '100stukenbrock':19 '1800':41 '2':42 '2011':8,18 '2451000':21 '2501a':9,29 '260españa':31 '3001007':34 '6501':36 '700i':45 '759':6 '978':1 'anterior':39 'barb':47 'christian':20,27 'coaut':48 'coleccion':44 'ed':10,30 'h.f':32 'maestr':23 'obras':22 'pag':35 'pintur':26,37,43 's934':7,17 'stukenbrock':28 'topp':46 'trabaj':38 'ulmann':33 'ì':49	
59	958	978-970-683-312-9	028 O66 2007	2501a. Ed.	\N	0	\N	\N	0	\N	140	3bd1e5fa-44bd-45a0-8d7a-255f73e6830b		1	1	2	\N	2021-12-02 13:39:21	2021-12-02 13:39:21	¦020978-970-683-312-9¦082028 O66 2007¦100ORELLANA, MARGARITA DE¦245101 AVENTURAS DE LA LECTURA / MARGARITA DE ORELLANA¦2501A. ED.¦260MéXICO : ARTES DE MéXICO / IBBY MéXICO¦300223 PAG.¦500INCLUYE ÍNDICE¦6501. LECTURAS - CITAS - MAXIMAS¦700I. GEDOVIUS, JUAN, IL.Ì		'-312':4,14 '-683':3,13 '-9':5,15 '-970':2,12 '020978':11 '028':6 '082028':16 '100orellana':19 '2007':8,18 '245101':22 '2501a':9,30 '260méxico':32 '300223':38 '500incluye':40 '6501':42 '700i':46 '978':1 'artes':33 'aventur':23 'cit':44 'ed':10,31 'gedovius':47 'ibby':36 'il':49 'indic':41 'juan':48 'lectur':26,43 'margarit':20,27 'maxim':45 'mexic':35,37 'o66':7,17 'orellan':29 'pag':39 'ì':50	
60	959	978-84-8076-833-7	778.37 F855 2015	2501a. Ed.	\N	0	\N	\N	0	\N	230	e7dbccb6-ea49-4e26-94ee-46a70e58f5c8		1	1	2	\N	2021-12-02 13:49:12	2021-12-02 13:49:12	¦020978-84-8076-833-7¦082778.37 F855 2015¦100FREEMAN, MICHAEL¦245101 CONSEJOS, FOTOGRAFíA DIGITAL: LOS SECRETOS DE LOS MEJORES FOTOGRáFOS DEL MUNDO / MICHAEL FREEMAN¦2501A. ED.¦260ESPAñA : EDITORIAL BLUME¦300176 PAG.¦6501. FOTOGRAFíA DIGITAL - ESTUDIO Y ENSEñANZA¦700I. BABER CASASNOVAS, CRISTOBAL, TR.Ì		'-7':5,15 '-8076':3,13 '-833':4,14 '-84':2,12 '020978':11 '082778.37':16 '100freeman':19 '2015':8,18 '245101':21 '2501a':9,35 '260españa':37 '300176':40 '6501':42 '700i':48 '778.37':6 '978':1 'bab':49 'blum':39 'casasnov':50 'consej':22 'cristobal':51 'digital':24,44 'ed':10,36 'editorial':38 'enseñ':47 'estudi':45 'f855':7,17 'fotograf':23,30,43 'freem':34 'mejor':29 'michael':20,33 'mund':32 'pag':41 'secret':26 'tr':52 'ì':53	
61	960	9788434237957	751.45 C212 2012	2501a. Ed.	\N	0	\N	\N	0	\N	234	c40b7a32-d719-4b2f-961c-f0468f10eae8		1	1	2	\N	2021-12-02 13:53:20	2021-12-02 13:53:20	¦020978-84-342-3795-7¦082751.45 C212 2012¦100CANAL, MA. FERNANDA¦245101 TéCNICAS OLEO / DIRECCIóN EDITORIAL DE MA. FERNANDA CANAL¦2501A. ED.¦260ESPAñA : PARRAMóN EDICIONES¦300144 PAG.¦6501. PINTURA - ESTUDIO Y ENSEñANZA¦700I. SAN MIGUEL, DAVID, EDIT.Ì		'-342':9 '-3795':10 '-7':11 '-84':8 '020978':7 '082751.45':12 '100canal':15 '2012':4,14 '245101':18 '2501a':5,27 '260españa':29 '300144':32 '6501':34 '700i':39 '751.45':2 '9788434237957':1 'c212':3,13 'canal':26 'dav':42 'direccion':21 'ed':6,28 'edicion':31 'edit':43 'editorial':22 'enseñ':38 'estudi':36 'fernand':17,25 'ma':16,24 'miguel':41 'ole':20 'pag':33 'parramon':30 'pintur':35 'san':40 'tecnic':19 'ì':44	
62	961	978-607-02-1520-9	972.0831 D671 2010	2501a. Ed.	\N	0	\N	\N	0	\N	179	061d2c9b-fcd7-4217-8464-295a50404452		1	1	2	\N	2021-12-03 15:03:23	2021-12-03 15:03:23	¦020978-607-02-1520-9¦082972.0831 D671 2010¦100DOMíNGUEZ NAVA, CUAUHTEMOC¦2451968 LA ESCUELA Y LOS ESTUDIANTES / CUAUHTEMOC DOMíNGUEZ NAVA¦2501A. ED.¦260MéXICO : UNAM¦300175 PAG.¦6501. MOVIMIENTO ESTUDIANTIL - MéXICO 2. MéXICO - CONFLICTO SOCIAL¦700I. AGUIRRE ROJAS, CARLOS ANTONIO, PRóL.Ì		'-02':3,13 '-1520':4,14 '-607':2,12 '-9':5,15 '020978':11 '082972.0831':16 '100domínguez':19 '2':41 '2010':8,18 '2451968':22 '2501a':9,31 '260méxico':33 '300175':35 '6501':37 '700i':45 '972.0831':6 '978':1 'aguirr':46 'antoni':49 'carl':48 'conflict':43 'cuauhtemoc':21,28 'd671':7,17 'dominguez':29 'ed':10,32 'escuel':24 'estudi':27 'estudiantil':39 'mexic':40,42 'movimient':38 'nav':20,30 'pag':36 'prol':50 'roj':47 'social':44 'unam':34 'ì':51	
63	806	978-970-777-338-7	158 B918 2007	2501a. Ed.	\N	0	\N	\N	0	\N	97	a824cac6-27a1-4c68-80e2-6a0591632f7a		1	1	2	\N	2021-12-07 13:31:07	2021-12-07 13:31:07	¦020978-970-777-338-7¦082158 B918 2007¦100BUCAY, JORGE¦24520 PASOS HACIA ADELANTE / JORGE BUCAY¦2501A. ED.¦260MéXICO : EDITORIAL OCEANO¦300177 PAG.¦440BIBLIOTECA JORGE BUCAY¦6501. MOTIVACIóN 2. SUPERACIóN PERSONALÌ		'-338':4,14 '-7':5,15 '-777':3,13 '-970':2,12 '020978':11 '082158':16 '100bucay':19 '158':6 '2':39 '2007':8,18 '24520':21 '2501a':9,27 '260méxico':29 '300177':32 '440biblioteca':34 '6501':37 '978':1 'adel':24 'b918':7,17 'bucay':26,36 'ed':10,28 'editorial':30 'haci':23 'jorg':20,25,35 'motiv':38 'ocean':31 'pag':33 'pas':22 'personalì':41 'super':40	
64	883	968-494-079-3	861 S487 2012	2501a. Ed.	\N	0	\N	\N	0	\N	197	5f55d275-1d77-4583-95cf-51b14d6aebd8		1	1	2	\N	2021-12-07 13:38:55	2021-12-07 13:38:55	¦020968-494-079-3¦082861 S487 2012¦100SERRANO, FRANCISCO¦24524 POETAS LATINOAMERICANOS / FRANCISCO SERRANO¦2501A. ED.¦260MéXICO : CERLALC, LATINOAMERICANA¦300254 PAG.¦6501. POESIA LATINOAMERICANA - SIGLO XX 2. POETAS LATINOAMERICANOS - SIGLO XXÌ		'-079':3,12 '-3':4,13 '-494':2,11 '020968':10 '082861':14 '100serrano':17 '2':36 '2012':7,16 '24524':19 '2501a':8,24 '260méxico':26 '300254':29 '6501':31 '861':5 '968':1 'cerlalc':27 'ed':9,25 'francisc':18,22 'latinoamerican':21,28,33,38 'pag':30 'poesi':32 'poet':20,37 's487':6,15 'serran':23 'sigl':34,39 'xx':35 'xxì':40	
65	962	978-07148-7012-0	709 T787 2015	2502a. Ed.	\N	0	\N	\N	0	\N	31	24484ae2-00e4-438f-95de-5c730811f7b5		1	1	2	\N	2021-12-07 14:19:07	2021-12-07 14:19:07	¦020978-07148-7012-0¦082709 T787 2015¦24530,000 AñOS DE ARTE: LA HISTORIA DE LA CREATIVIDAD HUMANA A TRAVéZ DEL TIEMPO Y EL ESPACIO / EDICIóN REVISADA Y ACTUALIZADA POR MIGUEL SERRANO LARRAZ Y LAURA AYALA¦2502A. ED.¦260ESTADOS UNIDOS DE AMéRICA : PHAIDON¦300656 PAG.¦6501. ARTE - HISTORIA¦700I. SERRANO LARRAZ, MIGUEL, EDIT. II. AYALA, LAURA, EDIT.Ì		'-0':4,13 '-07148':2,11 '-7012':3,12 '000':18 '020978':10 '082709':14 '2015':7,16 '24530':17 '2502a':8,46 '260estados':48 '300656':53 '6501':55 '700i':58 '709':5 '978':1 'actualiz':38 'amer':51 'arte':21,56 'ayal':45,64 'años':19 'creativ':26 'ed':9,47 'edicion':35 'edit':62,66 'espaci':34 'histori':23,57 'human':27 'ii':63 'larraz':42,60 'laur':44,65 'miguel':40,61 'pag':54 'phaidon':52 'revis':36 'serran':41,59 't787':6,15 'tiemp':31 'travez':29 'unid':49 'ì':67	
67	963	978-1-4063-2715-1	428 S786 2010	2501a. Ed.	\N	0	\N	\N	0	\N	235	dd11da6e-96fb-4486-8eb0-a9355f30b2d8		1	1	2	\N	2021-12-07 18:53:05	2021-12-07 18:53:05	¦020978-1-4063-2715-1¦082428 S786 2010¦100STANHOPE, NICK¦24531 WAYS TO CHANGE THE WORLD: BY 4,381 CHILDREN, WE ARE WHAT WE DO AND YOU / NICK STANHOPE¦2501A. ED.¦260INGLATERRA : WALKER BOOKS¦30073 PAG.¦6501. MUNDO - CAMBIOS 2. NIñOS EN EL MUNDO¦700I. NEW FUTURE GRAPHIC, IL. II. TAYLOR, TANIS, COAUT.Ì		'-1':2,5,12,15 '-2715':4,14 '-4063':3,13 '020978':11 '082428':16 '100stanhope':19 '2':50 '2010':8,18 '24531':21 '2501a':9,40 '260inglaterra':42 '30073':45 '381':29 '4':28 '428':6 '6501':47 '700i':55 '978':1 'and':36 'are':32 'books':44 'by':27 'cambi':49 'chang':24 'childr':30 'coaut':63 'do':35 'ed':10,41 'futur':57 'graphic':58 'ii':60 'il':59 'mund':48,54 'new':56 'nick':20,38 'niñ':51 'pag':46 's786':7,17 'stanhop':39 'tanis':62 'taylor':61 'the':25 'to':23 'walk':43 'ways':22 'we':31,34 'what':33 'world':26 'you':37 'ì':64	
68	828	978-607-07-0978-4	231.042 A283 2011	2501a. Ed.	\N	0	\N	\N	0	\N	68	ec736a9d-8639-4d3a-ad34-dd5c2eaf2b24		1	1	2	\N	2021-12-07 20:08:36	2021-12-07 20:08:36	¦020978-607-07-0978-4¦082231.042 A283 2011¦100AGUILAR VALDéS, JOSé DE JESúS¦245365 DIAS PARA ACERCARCE A DIOS / JOSé DE JESúS AGUILAR VALDéS¦2501A. ED.¦260MéXICO : MR EDICIONES¦300716 PAG.¦6501. DIOS - CULTO Y AMOR¦700I. OSORIO, MARIANO, PROL.Ì		'-07':3,13 '-0978':4,14 '-4':5,15 '-607':2,12 '020978':11 '082231.042':16 '100aguilar':19 '2011':8,18 '231.042':6 '245365':24 '2501a':9,35 '260méxico':37 '300716':40 '6501':42 '700i':47 '978':1 'a283':7,17 'acercarc':27 'aguil':33 'amor':46 'cult':44 'dias':25 'dios':29,43 'ed':10,36 'edicion':39 'jesus':23,32 'jos':21,30 'marian':49 'mr':38 'osori':48 'pag':41 'prol':50 'valdes':20,34 'ì':51	
91	978	\N	FT 745.097263 P784 1988	2501a. Ed.	\N	0	\N	\N	0	\N	136	6d74d60a-8588-40c2-a3c8-f8425e4a3525		1	1	2	\N	2021-12-09 15:05:46	2021-12-09 15:05:46	¦082FT 745.097263 P784 1988¦100POMAR, MARIA TERESA¦245ACERCA DEL ARTE POPULAR / MARIA TERESA POMAR¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦30025 PAG.¦440COLEC. CUADERNOS¦6501. ARTESANOS - TABASCO 2. ARTE POPULAR - TABASCOÌ	COLEC. CUADERNOS	'082ft':7 '100pomar':11 '1988':4,10 '2':38 '245acerca':14 '2501a':5,21 '260villahermosa':23 '30025':31 '440colec':33 '6501':35 '745.097263':2,8 'arte':16,39 'artesan':36 'cuad':34 'ed':6,22 'ft':1 'gobiern':26 'mari':12,18 'mexic':25 'p784':3,9 'pag':32 'pom':20 'popul':17,40 'tabasc':24,30,37 'tabascoì':41 'teres':13,19	
109	453	978-607-14-1200-3	923.2 G111 2013	\N	\N	0	\N	\N	0	\N	133	29a02451-785a-4d8d-b99e-e8d4cc7f220d		1	1	2	\N	2021-12-10 13:35:54	2021-12-10 13:35:54	¦020978-607-14-1200-3¦082923.2 G111 2013¦100GASCA FLORES, EDGAR RODRIGO¦245ADOLFO HITLER / EDGAR GASCA FLORES¦260MéXICO : EDITORES MEXICANOS UNIDOS¦30084 PAG.¦440SERIE BIOGRAFíAS: LIDERES POLíTICOS¦6501. HITLER, ADOLFO, 1889 - 1945 - BIOGRAFíAÌ		'-1200':4,12 '-14':3,11 '-3':5,13 '-607':2,10 '020978':9 '082923.2':14 '100gasca':17 '1889':39 '1945':40 '2013':8,16 '245adolfo':21 '260méxico':26 '30084':30 '440serie':32 '6501':36 '923.2':6 '978':1 'adolf':38 'biograf':33 'biografiaì':41 'edgar':19,23 'editor':27 'flor':18,25 'g111':7,15 'gasc':24 'hitl':22,37 'lider':34 'mexican':28 'pag':31 'polit':35 'rodrig':20 'unid':29	
69	964	978-607-02-1537-7	972.0831 A958 2010	2501a. Ed.	\N	0	\N	\N	0	\N	179	bf3e8ac1-37b2-46be-a493-cfbb575dfcf2		1	1	2	\N	2021-12-07 20:27:31	2021-12-07 20:27:50	&QUOT;¦020978-607-02-1537-7¦082972.0831 A958 2010¦100AVILéS CAVASOLA, JUNCIA¦24540 AñOS MOVIMIENTO ESTUDIANTIL DEL 68 / JUNCIA AVILéS CAVASOLA¦2501A. ED.¦260MéXICO : UNAM¦3002 VOL.¦5051. VOL. 1 EL 68: TODO EL DIA Y TODA LA NOCHE, CONFERENCIAS MAGISTRALES 2. VOL. 2 EL ORDEN INVISIBLE: ARTE, ESCENA Y ESPACIO PúBLICO.¦6501. MOVIMIENTOS ESTUDIANTILES - MéXICO 2. MéXICO - CONFLICTO SOCIAL 3. MéXICO - HISTORIA - 1968 - 1970Ì&QUOT;		'-02':3,13 '-1537':4,14 '-607':2,12 '-7':5,15 '020978':11 '082972.0831':16 '1':39 '100avilés':19 '1968':73 '1970ì':74 '2':51,53,66 '2010':8,18 '24540':22 '2501a':9,31 '260méxico':33 '3':70 '3002':35 '5051':37 '6501':62 '68':27,41 '972.0831':6 '978':1 'a958':7,17 'arte':57 'aviles':29 'años':23 'cavasol':20,30 'conferent':49 'conflict':68 'dia':44 'ed':10,32 'escen':58 'espaci':60 'estudiantil':25,64 'histori':72 'invis':56 'junci':21,28 'magistral':50 'mexic':65,67,71 'movimient':24,63 'noch':48 'orden':55 'public':61 'social':69 'tod':46 'unam':34 'vol':36,38,52	
70	965	978-84-344-6937-2	720.2 W684 2010	2501a. Ed.	\N	0	\N	\N	0	\N	10	31c6d406-d0fb-4c07-81cd-ed31b3e04177		1	1	2	\N	2021-12-07 20:36:08	2021-12-07 20:36:08	¦020978-84-344-6937-2¦082720.2 W684 2010¦100WILKINSON, PHILIP¦24550 COSAS QUE HAY QUE SABER SOBRE ARQUITECTURA / PHILIP WILKINSON¦2501A. ED.¦260ESPAñA : EDITORIAL ARIEL¦300217 PAG,¦440SERIE CLAVES¦500INCLUYE ÍNDICE¦6501. ARQUITECTURA - ESTUDIO Y ENSEñANZA¦700I. ENGUIX TERCERO, MARIA, TR.Ì		'-2':5,15 '-344':3,13 '-6937':4,14 '-84':2,12 '020978':11 '082720.2':16 '100wilkinson':19 '2010':8,18 '24550':21 '2501a':9,31 '260españa':33 '300217':36 '440serie':38 '500incluye':40 '6501':42 '700i':47 '720.2':6 '978':1 'ariel':35 'arquitectur':28,43 'clav':39 'cos':22 'ed':10,32 'editorial':34 'enguix':48 'enseñ':46 'estudi':44 'indic':41 'mari':50 'pag':37 'philip':20,29 'sab':26 'tercer':49 'tr':51 'w684':7,17 'wilkinson':30 'ì':52	
71	966	950-724-909-5	302.3 F919 2007	2501a. Ed.	\N	0	\N	\N	0	\N	26	c0d5ef1d-d15f-4150-b224-7cf91d96acbc		1	1	2	\N	2021-12-08 14:40:51	2021-12-08 14:40:51	¦020950-724-909-5¦082302.3 F919 2007¦100FRITZEN, SILVINO JOSé¦24570 JUEGOS PARA DINáMICA DE GRUPOS / SILVINO JOSé FRITZEN¦2501A. ED.¦260ARGENTINA : EDITORIAL LUMEN¦300287 PAG.¦440COLEC. LUMEN BOLSILLO¦6501. ORGANIZACIóN DE GRUPOS ESCOLARES 2. GRUPOS SOCIALESÌ		'-5':4,13 '-724':2,11 '-909':3,12 '020950':10 '082302.3':14 '100fritzen':17 '2':44 '2007':7,16 '24570':20 '2501a':8,29 '260argentina':31 '300287':34 '302.3':5 '440colec':36 '6501':39 '950':1 'bolsill':38 'dinam':23 'ed':9,30 'editorial':32 'escolar':43 'f919':6,15 'fritz':28 'grup':25,42,45 'jos':19,27 'jueg':21 'lum':33,37 'organiz':40 'pag':35 'silvin':18,26 'socialesì':46	
73	727	\N	863.01 U58 2007	2501a. Ed.	\N	0	\N	\N	0	\N	91	b9e51620-aa4d-4b10-a726-f9ca9a104d75		1	1	2	\N	2021-12-09 13:46:26	2021-12-09 13:46:26	¦082863.01 U58 2007¦100UNIVERSIDAD IBEROAMéRICANA¦2458VO. CONCURSO NACIONAL DE CUENTO PREUNIVERSITARIO JUAN RULFO / UNIVERSIDAD IBEROAMéRICANA¦2501A. ED.¦260MéXICO : UNIVERSIDAD IBEROAMéRICANA¦30075 PAG.¦6501. CUENTOS MEXICANOS - SIGLO XXÌ		'082863.01':6 '100universidad':9 '2007':3,8 '2458vo':11 '2501a':4,21 '260méxico':23 '30075':26 '6501':28 '863.01':1 'concurs':12 'cuent':15,29 'ed':5,22 'iberoamerican':10,20,25 'juan':17 'mexican':30 'nacional':13 'pag':27 'preuniversitari':16 'rulf':18 'sigl':31 'u58':2,7 'univers':19,24 'xxì':32	
74	967	968-889-225-4	FT 861 R173 1991	2501a. Ed.	\N	0	\N	\N	0	\N	136	2c0168e4-f75e-43a2-a336-69200c768e9b		1	1	2	\N	2021-12-09 14:06:15	2021-12-09 14:06:15	¦020968-889-225-4¦082FT 861 R173 1991¦100RAMíREZ, KARMINA¦245A CUERPO ABIERTO / KARMINA RAMíREZ¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦300220 PAG.¦440COLEC. CREACIóN / POESíA¦6501. POESíA MEXICANA - TABASCO - SIGLO XX 2. AUTORES MEXICANOS - TABASCO - SIGLO XXÌ		'-225':3,13 '-4':4,14 '-889':2,12 '020968':11 '082ft':15 '100ramírez':19 '1991':8,18 '2':47 '245a':21 '2501a':9,26 '260villahermosa':28 '300220':36 '440colec':38 '6501':41 '861':6,16 '968':1 'abiert':23 'autor':48 'creacion':39 'cuerp':22 'ed':10,27 'ft':5 'gobiern':31 'karmin':20,24 'mexic':30 'mexican':43,49 'pag':37 'poes':40,42 'r173':7,17 'ramirez':25 'sigl':45,51 'tabasc':29,35,44,50 'xx':46 'xxì':52	
75	968	970-15-1073-9	371.30282 G2121 2010	2509a. Ed.	\N	0	\N	\N	0	\N	213	81a58843-d946-4d7b-95f7-7db01737daef		1	1	2	\N	2021-12-09 14:10:16	2021-12-09 14:10:16	¦020970-15-1073-9¦082371.30282 G2121 2010¦100GARCíA HIDOBRO B, CECILIA¦245A ESTUDIAR SE APRENDE: METODOLOGíA DE ESTUDIO SESION POR SESION / CECILIA GARCíA HIDOBRO B.¦2509A. ED.¦260MéXICO : ALFAOMEGA GRUPO EDITOR¦300191 PAG.¦500LIBRO CON EJERCICIOS¦6501. ESTUDIO - MéTODOS 2. ESTUDIANTES - ENSEñANZA¦700I. GUTIéRREZ G, MARIA CRISTINA, COAUT. II. CONDEMARíN G., ELIANA, COAUT.Ì		'-1073':3,12 '-15':2,11 '-9':4,13 '020970':10 '082371.30282':14 '100garcía':17 '2':49 '2010':7,16 '245a':21 '2509a':8,35 '260méxico':37 '300191':41 '371.30282':5 '500libro':43 '6501':46 '700i':52 '970':1 'alfaomeg':38 'aprend':24 'b':19,34 'cecili':20,31 'coaut':57,62 'condemarin':59 'cristin':56 'ed':9,36 'editor':40 'ejercici':45 'elian':61 'enseñ':51 'estudi':22,27,47,50 'g':54,60 'g2121':6,15 'garc':32 'grup':39 'gutierrez':53 'hidobr':18,33 'ii':58 'mari':55 'metod':48 'metodolog':25 'pag':42 'sesion':28,30 'ì':63	
76	544	970-29-0034-4	465 V836 2004	2501a. Ed.	\N	0	\N	\N	0	\N	48	7e0f546a-cb23-4209-a926-5b9b5ab913db		1	1	2	\N	2021-12-09 14:19:48	2021-12-09 14:19:48	¦020970-29-0034-4¦082465 V836 2004¦100VITAL, ALBERTO¦245A JUGAR CON LA GRAMáTICA / ALBERTO VITAL¦2501A. ED.¦260MéXICO : EDITORIAL SANTILLANA¦30063 PAG.¦440BIBLIOTECA JUVENIL ILUSTRADA¦6501. ESPAñOL - GRAMáTICA COMPARADAÌ		'-0034':3,12 '-29':2,11 '-4':4,13 '020970':10 '082465':14 '100vital':17 '2004':7,16 '245a':19 '2501a':8,26 '260méxico':28 '30063':31 '440biblioteca':33 '465':5 '6501':36 '970':1 'albert':18,24 'comparadaì':39 'ed':9,27 'editorial':29 'español':37 'gramat':23,38 'ilustr':35 'jug':20 'juvenil':34 'pag':32 'santillan':30 'v836':6,15 'vital':25	
77	969	968-29-9793-3	972.0816 A283 1997	2501a. Ed.	\N	0	\N	\N	0	\N	58	7c52d57f-e7ae-46e6-a16c-37e67f25fbd5		1	1	2	\N	2021-12-09 14:22:26	2021-12-09 14:22:26	¦020968-29-9793-3¦082972.0816 A283 1997¦100AGUILAR CAMíN, HéCTOR¦245A LA SOMBRA DE LA REVOLUCIóN MEXICANA / HéCTOR AGUILAR CAMíN¦2501A. ED.¦260MéXICO : SEP¦300293 PAG.¦440COLEC. BIBLIOTECA PARA LA ACTUALIZACIóN DEL MAESTRO¦6501. MéXICO - HISTORIA - REVOLUCIóN, 1910 - 1917¦700I. MEYER, LORENZO, COAUT.Ì		'-29':2,11 '-3':4,13 '-9793':3,12 '020968':10 '082972.0816':14 '100aguilar':17 '1910':47 '1917':48 '1997':7,16 '245a':20 '2501a':8,30 '260méxico':32 '300293':34 '440colec':36 '6501':43 '700i':49 '968':1 '972.0816':5 'a283':6,15 'actualiz':40 'aguil':28 'bibliotec':37 'camin':18,29 'coaut':52 'ed':9,31 'hector':19,27 'histori':45 'lorenz':51 'maestr':42 'mexic':44 'mexican':26 'mey':50 'pag':35 'revolu':25,46 'sep':33 'sombr':22 'ì':53	
78	970	978-19-068-6122-3	791.43612 B766 2010	2501a. Ed.	\N	0	\N	\N	0	\N	236	ad010382-f098-433d-8490-95a7d6f7eb92		1	1	2	\N	2021-12-09 14:25:51	2021-12-09 14:25:51	¦020978-19-068-6122-3¦082791.43612 B766 2010¦100BOURKE, ANTHONY¦245A LION CALLED CHRISTIAN / ANTHONY BOURKE¦2501A. ED.¦260INGLATERRA : RICHMOND PUBLISHING¦30088 PAG.¦440RICHMOND READERS LEVEL 4¦500WITH AUDIO CD¦6501. PELICULAS DE ANIMALES 2. PELICULAS DOCUMENTALES 3. LIBROS Y LECTURAS PARA LA JUVENTUD¦700I. REVELL, JANE, EDIT. II. RENDALL, JOHN, COAUT.Ì		'-068':3,13 '-19':2,12 '-3':5,15 '-6122':4,14 '020978':11 '082791.43612':16 '100bourke':19 '2':45 '2010':8,18 '245a':21 '2501a':9,27 '260inglaterra':29 '3':48 '30088':32 '4':37 '440richmond':34 '500with':38 '6501':41 '700i':55 '791.43612':6 '978':1 'animal':44 'anthony':20,25 'audi':39 'b766':7,17 'bourk':26 'call':23 'cd':40 'christi':24 'coaut':62 'documental':47 'ed':10,28 'edit':58 'ii':59 'jan':57 'john':61 'juventud':54 'lectur':51 'level':36 'libr':49 'lion':22 'pag':33 'pelicul':42,46 'publishing':31 'readers':35 'rendall':60 'revell':56 'richmond':30 'ì':63	
79	971	968-19-0554-7	863 R763 2001	2501a. Ed.	\N	0	\N	\N	0	\N	5	95ad638c-9dd3-48c2-83b5-a99bbff60a2a		1	1	2	\N	2021-12-09 14:28:10	2021-12-09 14:28:10	¦020968-19-0554-7¦082863 R763 2001¦100ROMEU, EMMA¦245A MISSISIPPI POR EL MAR: NUEVAS AVENTURAS DE GREGORIO / EMMA ROMEU¦2501A. ED.¦260MéXICO : ALFAGUARA¦300150 PAG.¦440COLEC. ALFAGUARA INFANTIL¦6501. NOVELA CUBANA - SIGLO XX¦700I. MORA, ANGEL, IL.Ì	COLEC. ALFAGUARA INFANTIL	'-0554':3,12 '-19':2,11 '-7':4,13 '020968':10 '082863':14 '100romeu':17 '2001':7,16 '245a':19 '2501a':8,30 '260méxico':32 '300150':34 '440colec':36 '6501':39 '700i':44 '863':5 '968':1 'alfagu':33,37 'angel':46 'aventur':25 'cuban':41 'ed':9,31 'emma':18,28 'gregori':27 'il':47 'infantil':38 'mar':23 'missisippi':20 'mor':45 'novel':40 'nuev':24 'pag':35 'r763':6,15 'romeu':29 'sigl':42 'xx':43 'ì':48	
80	972	978-607-463-718-2	510.076 O39 2013	2501a. Ed.	\N	0	\N	\N	0	\N	237	9d614aaa-8ef0-4032-8f9a-065550e783d8		1	1	2	\N	2021-12-09 14:32:44	2021-12-09 14:32:44	¦020978-607-463-718-2¦082510.076 O39 2013¦100OJEDA ANIMAS, LUIS FERNANDO¦245A PRáCTICAR MATEMáTICAS: CUADERNO DE TRABAJO 1 / LUIS FERNANDO OJEDA ANIMAS¦2501A. ED.¦260MéXICO : CASTILLO¦300156 PAG.¦500LIBRO CON EJERCICIOS¦6501. MATEMáTICAS - ESTUDIO Y ENSEñANZA (SECUNDARIA) 2. MATEMáTICAS - PROBLEMAS - EJERCICIOS¦700I. MARTíNEZ LARA, CARLOS, COAUT. II. MONJARREZ CóRDOVA, ELIA, COAUT.Ì		'-2':5,15 '-463':3,13 '-607':2,12 '-718':4,14 '020978':11 '082510.076':16 '1':29 '100ojeda':19 '2':49 '2013':8,18 '245a':23 '2501a':9,34 '260méxico':36 '300156':38 '500libro':40 '510.076':6 '6501':43 '700i':53 '978':1 'anim':20,33 'carl':56 'castill':37 'coaut':57,62 'cordov':60 'cuadern':26 'ed':10,35 'ejercici':42,52 'eli':61 'enseñ':47 'estudi':45 'fern':22,31 'ii':58 'lar':55 'luis':21,30 'martinez':54 'matemat':25,44,50 'monjarrez':59 'o39':7,17 'ojed':32 'pag':39 'practic':24 'problem':51 'secundari':48 'trabaj':28 'ì':63	
81	973	0-852-41940-9	823 D548 1999	2501a. Ed.	\N	0	\N	\N	0	\N	30	25f3e67d-2a2a-4c1f-980a-1c56d6ac1800		1	1	2	\N	2021-12-09 14:35:29	2021-12-09 14:35:29	¦0200-852-41940-9¦082823 D548 1999¦100DICKENS, CHARLES¦245A TALES OF TWO CITIES / CHARLES DICKENS¦2501A. ED.¦260ESTADOS UNIDOS DE AMéRICA : PENGUIN BOOKS¦300135 PAG.¦440PENGUIN READER LEVEL 5¦6501. NOVELA INGLESA - SIGLO XIX 2. LIBROS Y LECTURAS PARA LA JUVENTUD¦700I: HOPKINS, ANDY, EDIT. II. POTTER, JOCELYN, EDITÌ		'-41940':3,12 '-852':2,11 '-9':4,13 '0':1 '0200':10 '082823':14 '100dickens':17 '1999':7,16 '2':45 '245a':19 '2501a':8,26 '260estados':28 '300135':34 '440penguin':36 '5':39 '6501':40 '700i':52 '823':5 'amer':31 'andy':54 'books':33 'charl':18,24 'citi':23 'd548':6,15 'dickens':25 'ed':9,27 'edit':55 'editì':59 'hopkins':53 'ii':56 'ingles':42 'jocelyn':58 'juventud':51 'lectur':48 'level':38 'libr':46 'novel':41 'of':21 'pag':35 'penguin':32 'pott':57 'read':37 'sigl':43 'tal':20 'two':22 'unid':29 'xix':44	
83	974	978-968-16-6441-1	056.1 P348 2001	2501a. Ed.	\N	0	\N	\N	0	\N	16	da6db3e6-a4aa-4723-844d-6ed16d4a0239		1	1	2	\N	2021-12-09 14:38:43	2021-12-09 14:38:43	¦020978-968-16-6441-1¦082056.1 P348 2001¦100PAZ, MARIE JOSé¦245A TREINTA AñOS DE PLURAL ( 1971 - 1976 ): REVISTA FUNDADA POR OCTAVIO PAZ / MARIE JOSé PAZ¦2501A. ED.¦260MéXICO : FONDO DE CULTURA ECONOMICA¦300178 PAG.¦6501. PUBLICACIONES PERIODICAS MEXICANAS 2. PLURA: CRíTICA, ARTE, LITERATURA - PUBLICACIONES¦700I. CASTAñóN, ADOLFO, COAUT. II. TORRES FIERRO, DANUBIO, COAUT.Ì		'-1':5,15 '-16':3,13 '-6441':4,14 '-968':2,12 '020978':11 '056.1':6 '082056.1':16 '100paz':19 '1971':27 '1976':28 '2':50 '2001':8,18 '245a':22 '2501a':9,37 '260méxico':39 '300178':44 '6501':46 '700i':56 '978':1 'adolf':58 'arte':53 'años':24 'castañon':57 'coaut':59,64 'critic':52 'cultur':42 'danubi':63 'econom':43 'ed':10,38 'fierr':62 'fond':40 'fund':30 'ii':60 'jos':21,35 'literatur':54 'mari':20,34 'mexican':49 'octavi':32 'p348':7,17 'pag':45 'paz':33,36 'period':48 'plur':51 'plural':26 'public':47,55 'revist':29 'torr':61 'treint':23 'ì':65	
84	975	ISSN-1665-8523	R 613.005 I59 2006	2501a. Ed.	\N	0	\N	\N	0	\N	22	4b884b65-61bc-49f7-ae05-6c219e7684b3		1	1	2	\N	2021-12-09 14:42:28	2021-12-09 14:42:28	¦020ISSN-1665-8523¦082R 613.005 I59 2006¦100INSTITUTO MEXICANO DEL SEGURO SOCIAL¦245A Tú SALUD / INSTITUTO MEXICANO DEL SEGURO SOCIAL¦2501A. ED.¦260MéXICO : IMSS, EDITORIAL MéXICO¦30096 PAG.¦500LA BIBLIOTECA SOLO CUENTA CON EL EJEMPLAR DEL MES DE ENERO DEL 2006¦6501. HIGIENE - PUBLICACIONES PERIODICAS 2. SALUD - PUBLICACIONES PERIODICAS 3. MEDICINA PREVENTIVA - PUBLICACIONES PERIODICASÌ		'-1665':2,11 '-8523':3,12 '020issn':10 '082r':13 '100instituto':17 '2':55 '2006':7,16,50 '245a':22 '2501a':8,30 '260méxico':32 '3':59 '30096':36 '500la':38 '613.005':5,14 '6501':51 'bibliotec':39 'cuent':41 'ed':9,31 'editorial':34 'ejempl':44 'ener':48 'higien':52 'i59':6,15 'imss':33 'institut':25 'issn':1 'medicin':60 'mes':46 'mexic':35 'mexican':18,26 'pag':37 'period':54,58 'periodicasì':63 'prevent':61 'public':53,57,62 'r':4 'salud':24,56 'segur':20,28 'social':21,29 'sol':40	
92	261	970-22-0384-8	540. J37 2002	\N	\N	0	\N	\N	0	\N	59	f20ecdfc-062a-44df-a232-bdca92353b85		1	1	2	\N	2021-12-09 15:11:40	2021-12-09 15:11:40	¦020970-22-0384-8¦050540. J37 2002¦100JARA REYES,SILVIA¦245ACéRCATE A LA QUíMICA 1/SILVIA JARA REYES¦260MéXICO: LAROUSSE¦300212 P./ 25 CM.¦500INCLUYE BIBLIOGRAFíA PARA EL ALUMNO Y PARA EL MAESTRO,ANEXO Y TABLA DE ELEMENTOS QUíMICOS.¦600JARA REYES,SILVIA¦6501.QUíMICA-ESTUDIO Y ENSEñANZA (SECUNDARIA)¦700I.LóPEZ VILLA,NORMA MóNICA.Ì		'-0384':3,10 '-22':2,9 '-8':4,11 '020970':8 '050540':12 '1/silvia':22 '100jara':15 '2002':7,14 '245acércate':18 '25':29 '260méxico':25 '300212':27 '500incluye':31 '540':5 '600jara':46 '6501.qu':49 '700i.l':56 '970':1 'alumn':35 'anex':40 'bibliograf':32 'cm':30 'element':44 'enseñ':54 'estudi':52 'imic':51 'imica-estudi':50 'j37':6,13 'jar':23 'larouss':26 'maestr':39 'monic':60 'norm':59 'opez':57 'p':28 'quimic':21,45 'rey':16,24,47 'secundari':55 'silvi':17,48 'tabl':42 'vill':58 'ì':61	
86	975	ISSN- 1665-8523	R 613.005 I59 2008	2501a. Ed.	\N	0	\N	\N	0	\N	238	0ced844f-c33e-4f5b-aad0-fe63e64098c2		1	1	2	\N	2021-12-09 14:49:01	2021-12-09 14:49:01	&QUOT;¦020ISSN-1665-8523¦082R 613.005 I59 2008¦100INSTITUTO MEXICANO DEL SEGURO SOCIAL¦245A Tú SALUD / INSTITUTO MEXICANO DEL SEGURO SOCIAL¦2501A. ED.¦260MéXICO : IMSS, EDITORIAL MéXICO¦3005 VOL.¦500LA BIBLIOTECA SOLO CUENTA CON LOS EJEMPLARES DE LOS MESES DE: JUNIO, AGOSTO, SEPTIEMBRE, NOVIEMBRE Y DICIEMBRE DE 2008¦5051. VOL. 1 (JUNIO) 2. VOL. 2 (AGOSTO) 3. VOL. 3 (SEPTIEMBRE) 4. VOL. 4 (NOVIEMBRE) 5. VOL. 5 (DICIEMBRE)¦6501. HIGIENE - PUBLICACIONES PERIODICAS 2. SALUD - PUBLICACIONES PERIODICAS 3. MEDICINA PEVENTIVA - PUBLICACIONES PERIODICASÌ&QUOT;		'-1665':11 '-8523':3,12 '020issn':10 '082r':13 '1':59 '100instituto':17 '1665':2 '2':61,63,81 '2008':7,16,56 '245a':22 '2501a':8,30 '260méxico':32 '3':65,67,85 '3005':36 '4':69,71 '5':73,75 '500la':38 '5051':57 '613.005':5,14 '6501':77 'agost':50,64 'bibliotec':39 'cuent':41 'diciembr':54,76 'ed':9,31 'editorial':34 'ejemplar':44 'higien':78 'i59':6,15 'imss':33 'institut':25 'issn':1 'juni':49,60 'medicin':86 'mes':47 'mexic':35 'mexican':18,26 'noviembr':52,72 'period':80,84 'periodicasì':89 'pevent':87 'public':79,83,88 'r':4 'salud':24,82 'segur':20,28 'septiembr':51,68 'social':21,29 'sol':40 'vol':37,58,62,66,70,74	
87	975	ISSN-1665- 8523	R 613.005 I59 2008	2501a. Ed.	\N	0	\N	\N	0	\N	238	e476c0a0-5ae5-4c5a-8d55-58b484af7c43		1	1	2	\N	2021-12-09 14:49:23	2021-12-09 14:49:23	"¦020ISSN-1665-8523¦082R 613.005 I59 2008¦100INSTITUTO MEXICANO DEL SEGURO SOCIAL¦245A Tú SALUD / INSTITUTO MEXICANO DEL SEGURO SOCIAL¦2501A. ED.¦260MéXICO : IMSS, EDITORIAL MéXICO¦3005 VOL.¦500LA BIBLIOTECA SOLO CUENTA CON LOS EJEMPLARES DE LOS MESES DE: JUNIO, AGOSTO, SEPTIEMBRE, NOVIEMBRE Y DICIEMBRE DE 2008¦5051. VOL. 1 (JUNIO) 2. VOL. 2 (AGOSTO) 3. VOL. 3 (SEPTIEMBRE) 4. VOL. 4 (NOVIEMBRE) 5. VOL. 5 (DICIEMBRE)¦6501. HIGIENE - PUBLICACIONES PERIODICAS 2. SALUD - PUBLICACIONES PERIODICAS 3. MEDICINA PEVENTIVA - PUBLICACIONES PERIODICASÌ"		'-1665':2,11 '-8523':12 '020issn':10 '082r':13 '1':59 '100instituto':17 '2':61,63,81 '2008':7,16,56 '245a':22 '2501a':8,30 '260méxico':32 '3':65,67,85 '3005':36 '4':69,71 '5':73,75 '500la':38 '5051':57 '613.005':5,14 '6501':77 '8523':3 'agost':50,64 'bibliotec':39 'cuent':41 'diciembr':54,76 'ed':9,31 'editorial':34 'ejemplar':44 'higien':78 'i59':6,15 'imss':33 'institut':25 'issn':1 'juni':49,60 'medicin':86 'mes':47 'mexic':35 'mexican':18,26 'noviembr':52,72 'period':80,84 'periodicasì':89 'pevent':87 'public':79,83,88 'r':4 'salud':24,82 'segur':20,28 'septiembr':51,68 'social':21,29 'sol':40 'vol':37,58,62,66,70,74	
88	976	968-23-2279-0	809.923 G643 2001	2501a. Ed.	\N	0	\N	\N	0	\N	40	b755cf78-5879-41ed-b071-569fc35a47b8		1	1	2	\N	2021-12-09 14:53:06	2021-12-09 14:53:06	¦020968-23-2279-0¦082809.923 G643 2001¦100GONZáLEZ, ANIBAL¦245ABUSOS Y ADMONICIONES: ÉTICA Y ESCRITURA EN LA NARRATIVA HISPANOAMERICANA MODERNA / ANIBAL GONZáLEZ¦2501A. ED.¦260MéXICO : SIGLO XXI EDITORES¦300205 PAG.¦440COLEC. LINGUISTICA Y TEORíA LITERARIA¦6501. LITERATURA HISANOAMERICANA - HISTORIA Y CRíTICA 2. NARRATIVA HISPANOAMERICANAÌ		'-0':4,13 '-2279':3,12 '-23':2,11 '020968':10 '082809.923':14 '100gonzález':17 '2':51 '2001':7,16 '245abusos':19 '2501a':8,32 '260méxico':34 '300205':38 '440colec':40 '6501':45 '809.923':5 '968':1 'admonicion':21 'anibal':18,30 'critic':50 'ed':9,33 'editor':37 'escritur':24 'etic':22 'g643':6,15 'gonzalez':31 'hisanoamerican':47 'hispanoamerican':28 'hispanoamericanaì':53 'histori':48 'linguist':41 'literari':44 'literatur':46 'modern':29 'narrat':27,52 'pag':39 'sigl':35 'teor':43 'xxi':36	
89	977	9786074024081	361.61 C676 2012	\N	\N	0	\N	\N	0	\N	239	9a8abe10-6d24-4633-bdb7-fa8aec8817f9		1	1	2	\N	2021-12-09 14:56:47	2021-12-09 14:56:47	¦020978-607-402-408-1¦082361.61 C676 2012¦100COGCO CALDERóN, ADOLFO ROGELIO¦245ACCIONES Y REFLEXIONES PARA LA RECONSTRUCCIóN DE LA POLíTICA SOCIAL EN MéXICO. UNA MIRADA DESDE LO LOCAL / ADOLFO ROGELIO COGCO CALDERóN¦2501A. ED.¦260MéXICO : PLAZA Y VALDéS EDITORES¦300166 PAG.¦440COLEC. CIENCIAS SOCIALES¦6501. POLíTICA SOCIAL - MéXICO¦700I. RODRíGUEZ VARGAS, MIRIAM, COAUT. II. PéREZ CRUZ, JORGE ALBERTO, COAUT.Ì		'-1':9 '-402':7 '-408':8 '-607':6 '020978':5 '082361.61':10 '100cogco':13 '2012':4,12 '245acciones':17 '2501a':38 '260méxico':40 '300166':45 '361.61':2 '440colec':47 '6501':50 '700i':54 '9786074024081':1 'adolf':15,34 'albert':63 'c676':3,11 'calderon':14,37 'cienci':48 'coaut':58,64 'cogc':36 'cruz':61 'ed':39 'editor':44 'ii':59 'jorg':62 'local':33 'mexic':28,53 'mir':30 'miriam':57 'pag':46 'perez':60 'plaz':41 'polit':25,51 'reconstruccion':22 'reflexion':19 'rodriguez':55 'rogeli':16,35 'social':26,49,52 'valdes':43 'varg':56 'ì':65	
90	84	958-04-4292-4	461.076 S211 2003	2501a. Ed.	\N	0	\N	\N	0	\N	56	fdf42cf5-6557-4869-a38d-e98f7e28c3a5		1	1	2	\N	2021-12-09 14:59:23	2021-12-09 14:59:23	¦020958-04-4292-4¦082461.076 S211 2003¦100SáNCHEZ LOZANO, CARLOS¦245ACENTO 2 : CUADERNO DE TRABAJO / CARLOS SáNCHEZ LOZANO¦2501A. ED.¦260MéXICO : GRUPO EDITORIAL NORMA¦300148 P 27 CM¦6501. ESPAñOL - ORTOGRAFíA Y DELETREO 2. ESPAñOL - LEXICOGRAFíAÌ		'-04':2,11 '-4':4,13 '-4292':3,12 '020958':10 '082461.076':14 '100sánchez':17 '2':21,43 '2003':7,16 '245acento':20 '2501a':8,28 '260méxico':30 '27':36 '300148':34 '461.076':5 '6501':38 '958':1 'carl':19,25 'cm':37 'cuadern':22 'deletre':42 'ed':9,29 'editorial':32 'español':39,44 'grup':31 'lexicografiaì':45 'lozan':18,27 'norm':33 'ortograf':40 'p':35 's211':6,15 'sanchez':26 'trabaj':24	
93	979	978-607-7556-17-6	616.53 S399 2007	\N	\N	0	\N	\N	0	\N	240	9db2d3dd-73cf-42a5-bb61-a55f1f2f22c2		1	1	2	\N	2021-12-09 18:30:54	2021-12-09 18:30:54	¦020978-607-7556-17-6¦082616.53 S399 2007¦100SCHWARSTZBERG, JESSE SNOWFLAKE¦245ACNé JUVENIL: PUNTO Y APARTE / JESSE SNOWFLAKE SCHWARSTZBERG¦2501A. ED.¦260MéXICO : VISTO BUENO EDITORES¦30045 PAG.¦440COLEC. SALUD ADULTOS¦500PUBLICACIóN AVALADA POR COMEPA¦6501. PIEL - ENFERMEDADES 2. ACNéÌ	COLEC. SALUD ADULTOS	'-17':4,12 '-6':5,13 '-607':2,10 '-7556':3,11 '020978':9 '082616.53':14 '100schwarstzberg':17 '2':46 '2007':8,16 '245acné':20 '2501a':28 '260méxico':30 '30045':34 '440colec':36 '500publicación':39 '616.53':6 '6501':43 '978':1 'acneì':47 'adult':38 'apart':24 'aval':40 'buen':32 'comep':42 'ed':29 'editor':33 'enfermedad':45 'jess':18,25 'juvenil':21 'pag':35 'piel':44 'punt':22 's399':7,15 'salud':37 'schwarstzberg':27 'snowflak':19,26 'vist':31	
94	980	978-84-342-2186-4	751.426 C212 2008	2505a. Ed.	\N	0	\N	\N	0	\N	234	2e18df1d-bedb-4dac-8c25-ff4d29521965		1	1	2	\N	2021-12-09 18:38:53	2021-12-09 18:39:00	¦020978-84-342-2186-4¦082751.426 C212 2008¦100CANAL, MARIA FERNANDA¦245ACRíLICO: EJERCICIOS PARRAMóN / DIRECCIóN EDITORIAL DE MARIA FERNANDA CANAL¦2505A. ED.¦260ESPAñA : EDITORIAL PARRAMóN¦30032 PAG.¦440COLEC. EJERCICIOS PARRAMóN, 18¦500INCLUYE ÍNDICE¦6501. PINTURA EN ACRíLICO - ESTUDIO Y ENSAñANZAÌ	COLEC. EJERCICIOS PARRAMóN, 18	'-2186':4,14 '-342':3,13 '-4':5,15 '-84':2,12 '020978':11 '082751.426':16 '100canal':19 '18':41 '2008':8,18 '245acrílico':22 '2505a':9,31 '260españa':33 '30032':36 '440colec':38 '500incluye':42 '6501':44 '751.426':6 '978':1 'acril':47 'c212':7,17 'canal':30 'direccion':25 'ed':10,32 'editorial':26,34 'ejercici':23,39 'ensañanzaì':50 'estudi':48 'fernand':21,29 'indic':43 'mari':20,28 'pag':37 'parramon':24,35,40 'pintur':45	
95	731	978-607-11-0748-0	861 H899 2010	2501a. Ed.	\N	0	\N	\N	0	\N	72	5c3774c1-c96b-421d-95c2-34b66733ac20		1	1	2	\N	2021-12-09 18:43:01	2021-12-09 18:43:01	¦020978-607-11-0748-0¦082861 H899 2010¦100HUIDOBRO, VICENTE¦245ACRóBATA DEL CIELO: ANTOLOGíA BREVE / VIVENTE HUIDOBRO¦2501A. ED.¦260MéXICO : EDITORIAL ALFAGUARA¦300119 PAG.¦500INCLUYE ANTOLOGíA BREVE DE RODOLFO FONSECA¦6501. POESíA CHILENA - SIGLO XXÌ		'-0':5,15 '-0748':4,14 '-11':3,13 '-607':2,12 '020978':11 '082861':16 '100huidobro':19 '2010':8,18 '245acróbata':21 '2501a':9,28 '260méxico':30 '300119':33 '500incluye':35 '6501':41 '861':6 '978':1 'alfagu':32 'antolog':24,36 'brev':25,37 'chilen':43 'ciel':23 'ed':10,29 'editorial':31 'fonsec':40 'h899':7,17 'huidobr':27 'pag':34 'poes':42 'rodolf':39 'sigl':44 'vicent':20 'vivent':26 'xxì':45	
96	981	978-84-342-3722-3	751.422 C212 2015	2502a. Ed.	\N	0	\N	\N	0	\N	234	9b4c5090-3b5d-4d96-82bc-9d6c3f706c8b		1	1	2	\N	2021-12-09 18:53:00	2021-12-09 18:53:00	¦020978-84-342-3722-3¦082751.422 C212 2015¦100CANAL, MARIA FERNANDA¦245ACUARELA: 101 TéCNICAS / DIRECCIóN EDITORIAL DE MARIA FERNANDA CANAL¦2502A. ED.¦260ESPAñA : EDITORIAL PARRAMóN¦300144 PAG.¦500INCLUYE ÍNDICE¦6501. ACUARELAS - ESTUDIO Y ENSEñANZA 2. PINTURA - ESTUDIO Y ENSEñANZA¦700I. BERENGUER, ENRIC, IL.Ì		'-3':5,15 '-342':3,13 '-3722':4,14 '-84':2,12 '020978':11 '082751.422':16 '100canal':19 '101':23 '2':45 '2015':8,18 '245acuarela':22 '2502a':9,31 '260españa':33 '300144':36 '500incluye':38 '6501':40 '700i':50 '751.422':6 '978':1 'acuarel':41 'berengu':51 'c212':7,17 'canal':30 'direccion':25 'ed':10,32 'editorial':26,34 'enric':52 'enseñ':44,49 'estudi':42,47 'fernand':21,29 'il':53 'indic':39 'mari':20,28 'pag':37 'parramon':35 'pintur':46 'tecnic':24 'ì':54	
97	982	978-987-538-201-5	616.8589 B456 2007	2501a. Ed.	\N	0	\N	\N	0	\N	165	b31853f3-d7f3-4701-aca4-05954910aaba		1	1	2	\N	2021-12-09 18:56:07	2021-12-09 18:56:07	¦020978-987-538-201-5¦082616.8589 B456 2007¦100BENASAYAG, LEóN¦245ADDH. NIñOS CON DEFICIT DE ATENCIóN E HIPERACTIVIDAD: ¿UNA PATOLOGíA DE MERCADO? / LEóN BENASAYAG¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦300254 PAG.¦440COLEC. CONJUNCIONES¦6501. NIñOS PROBLEMA 2. TRASTORNOS DE ATENCIóN 3. DEFICIENCIA INTELECTUALÌ	COLEC. CONJUNCIONES	'-201':4,14 '-5':5,15 '-538':3,13 '-987':2,12 '020978':11 '082616.8589':16 '100benasayag':19 '2':52 '2007':8,18 '245addh':21 '2501a':9,35 '260argentina':37 '3':56 '300254':45 '440colec':47 '616.8589':6 '6501':49 '978':1 'atencion':26,55 'b456':7,17 'benasayag':34 'centr':38 'conjuncion':48 'deficient':57 'deficit':24 'didact':44 'ed':10,36 'educ':41 'hiperact':28 'intelectualì':58 'leon':20,33 'material':43 'merc':32 'niñ':22,50 'pag':46 'patolog':30 'problem':51 'public':40 'trastorn':53	
98	533	\N	303.4833 B388 2006	2501a. Ed.	\N	0	\N	\N	0	\N	143	6db3306e-7af8-44ac-b0b5-29f1ab04f298		1	1	2	\N	2021-12-09 19:08:31	2021-12-09 19:08:31	¦082303.4833 B388 2006¦100BECOñA IGLESIAS, ELISARDO¦245ADICCIóN A NUEVAS TECNOLOGíAS / ELISARDO BECOñA IGLESIAS¦2501A. ED.¦260VIGO, ESPAñA : NOVA GALICIA EDICIONES¦30053 PAG.¦440SABER PARA VIVIR¦6501. TECNOLOGíA - ADICCIóNÌ	SABER PARA VIVIR	'082303.4833':6 '100becoña':9 '2006':3,8 '245adicción':12 '2501a':4,19 '260vigo':21 '30053':26 '303.4833':1 '440saber':28 '6501':31 'adiccionì':33 'b388':2,7 'becoñ':17 'ed':5,20 'edicion':25 'elisard':11,16 'españ':22 'galici':24 'iglesi':10,18 'nov':23 'nuev':14 'pag':27 'tecnolog':15,32 'viv':30	
99	983	968-880-685-4	658.00711 S878 1996	2506a. Ed.	\N	0	\N	\N	0	\N	75	c5662816-9eff-491e-8b85-76565dbc0014		1	1	2	\N	2021-12-09 19:12:14	2021-12-09 19:12:14	¦020968-880-685-4¦082658.00711 S878 1996¦100STONER, JAMES A. F.¦245ADMINISTRACIóN / JAMES A. F. STONER¦2506A. ED.¦260MéXICO : PEARSON EDUCACIóN¦300688 PAG.¦500INCLUYE EJERCICIOS Y APENDICE¦6501. ADMINISTRACIóN - ESTUDIO Y ENSEñANZA¦700I. FREEMAN, R. EDWARD, COAUT. II. GILBERT, DANIEL E., COAUT. III. MASCARO SACRISTAN, PILAR, TR.Ì		'-4':4,13 '-685':3,12 '-880':2,11 '020968':10 '082658.00711':14 '100stoner':17 '1996':7,16 '245administración':21 '2506a':8,26 '260méxico':28 '300688':31 '500incluye':33 '6501':37 '658.00711':5 '700i':42 '968':1 'administr':38 'apendic':36 'coaut':46,51 'daniel':49 'ed':9,27 'educ':30 'edward':45 'ejercici':34 'enseñ':41 'estudi':39 'f':20,24 'freem':43 'gilbert':48 'ii':47 'iii':52 'jam':18,22 'mascar':53 'pag':32 'pearson':29 'pil':55 'r':44 's878':6,15 'sacrist':54 'ston':25 'tr':56 'ì':57	
108	988	84-951833-595	730.944 A239 2001	2501a. Ed,	\N	0	\N	\N	0	\N	108	8b467878-d412-4e46-990c-c8a18ec81e93		1	1	2	\N	2021-12-09 20:59:06	2021-12-09 20:59:06	¦02084-951833-595¦082730.944 A239 2001¦245ADOLFO BARNATáN / DISEñO GRáFICO JUAN GATTI¦2501A. ED,¦260ESPAñA : T. F. EDITORES¦300236 PAG,¦6501. BERNATáN, ADOLFO, 1951 - EXPOSICIONES 2. ESCULTURA FRANCESA - SIGLO XX 3. DIBUJOS FRANCESES - SIGLO XX¦700I. GATTI, JUAN, IL.Ì		'-595':3,11 '-951833':2,10 '02084':9 '082730.944':12 '1951':32 '2':34 '2001':6,14 '245adolfo':15 '2501a':7,21 '260españa':23 '3':39 '300236':27 '6501':29 '700i':44 '730.944':4 '84':1 'a239':5,13 'adolf':31 'barnatan':16 'bernatan':30 'dibuj':40 'diseñ':17 'ed':8,22 'editor':26 'escultur':35 'exposicion':33 'f':25 'frances':36,41 'gatti':20,45 'grafic':18 'il':47 'juan':19,46 'pag':28 'sigl':37,42 't':24 'xx':38,43 'ì':48	
100	984	978-607-32-0249-7	658.3 D475 2011	2505a. Ed.	\N	0	\N	\N	0	\N	55	2f1d638b-4413-4e9c-8420-8ba369b2bd59		1	1	2	\N	2021-12-09 19:49:49	2021-12-09 19:49:49	¦020978-607-32-0249-7¦082658.3 D475 2011¦100DESSLER, GARY¦245ADMINISTRACIóN DE RECURSOS HUMANOS: ENFOQUE LATINOAMERICANO / GARY DESSLER¦2505A. ED.¦260MéXICO : PRENTICE HALL¦300515 PAG.¦6501. RECURSOS HUMANOS 2. PERSONAL - DIRECCIóN¦700I. VARELA JUáREZ, RICARDO ALFREDO, COAUT. II. PINEDA AYALA, LETICIA ESTHER, TR. III. CAMPOS OLGUIN, VíCTOR, TR.Ì		'-0249':4,14 '-32':3,13 '-607':2,12 '-7':5,15 '020978':11 '082658.3':16 '100dessler':19 '2':39 '2011':8,18 '245administración':21 '2505a':9,29 '260méxico':31 '300515':34 '6501':36 '658.3':6 '700i':42 '978':1 'alfred':46 'ayal':50 'camp':55 'coaut':47 'd475':7,17 'dessl':28 'direccion':41 'ed':10,30 'enfoqu':25 'esther':52 'gary':20,27 'hall':33 'human':24,38 'ii':48 'iii':54 'juarez':44 'latinoamerican':26 'letici':51 'olguin':56 'pag':35 'personal':40 'pined':49 'prentic':32 'recurs':23,37 'ricard':45 'tr':53,58 'varel':43 'victor':57 'ì':59	
101	985	970-26-0785-X	658.00711 M963 2007	2501a. Ed.	\N	0	\N	\N	0	\N	75	87581935-d9b6-47d7-9d34-015b2afee6aa		1	1	2	\N	2021-12-09 20:05:20	2021-12-09 20:05:20	¦020970-26-0785-X¦082658.00711 M963 2007¦100MüNCH, LOURDES¦245ADMINISTRACIóN: ESCUELAS, PROCESO ADMINISTRATIVO, ÁREAS FUNCIONALES Y DESARROLLO EMPRENDEDOR / LOURDES MüNCH¦2501A. ED.¦260MéXICO : PEARSON EDUCACIóN¦300292 PAG.¦500LIBRO CON EJERCICIOS¦6501. ADMINISTRACIóN - ESTUDIO Y ENSEñANZA¦700I. RICALDE, ESPERANZA, COAUT.Ì		'-0785':3,12 '-26':2,11 '020970':10 '082658.00711':14 '100münch':17 '2007':7,16 '245administración':19 '2501a':8,30 '260méxico':32 '300292':35 '500libro':37 '6501':40 '658.00711':5 '700i':45 '970':1 'administr':22,41 'are':23 'coaut':48 'desarroll':26 'ed':9,31 'educ':34 'ejercici':39 'emprendedor':27 'enseñ':44 'escuel':20 'esper':47 'estudi':42 'funcional':24 'lourd':18,28 'm963':6,15 'münch':29 'pag':36 'pearson':33 'proces':21 'ricald':46 'x':4,13 'ì':49	
102	986	978-607-7629-06-1	305.234 R456 2009	2501a. Ed.	\N	0	\N	\N	0	\N	113	9fa7c885-80a1-458e-b0d1-4a6c3b573879		1	1	2	\N	2021-12-09 20:12:34	2021-12-09 20:12:34	¦020978-607-7629-06-1¦082305.234 R456 2009¦100REYES JUáREZ, ALEJANDRO¦245ADOLESCENCIA ENTRE MUROS: ESCUELA SECUNDARIA Y LA CONSTRUCCIóN DE IDENTIDADES JUVENILES / ALEJANDRO REYES JUáREZ¦2501A. ED.¦260MéXICO : FLACSO¦300196 PAG.¦440COLEC. TESIS PREMIADAS¦6501. ADOLESCENCIA, PSICOLOGíA DE LAÌ	COLEC. TESIS PREMIADAS	'-06':4,14 '-1':5,15 '-607':2,12 '-7629':3,13 '020978':11 '082305.234':16 '100reyes':19 '2009':8,18 '245adolescencia':22 '2501a':9,36 '260méxico':38 '300196':40 '305.234':6 '440colec':42 '6501':45 '978':1 'adolescent':46 'alejandr':21,33 'construccion':29 'ed':10,37 'escuel':25 'flacs':39 'ident':31 'juarez':20,35 'juvenil':32 'laì':49 'mur':24 'pag':41 'premi':44 'psicolog':47 'r456':7,17 'rey':34 'secundari':26 'tesis':43	
103	987	978-987-538-203-9	\N	2501a. Ed.	\N	0	\N	\N	0	\N	165	f9be0320-efd4-4295-b648-7844d686e32f		1	1	2	\N	2021-12-09 20:33:08	2021-12-09 20:33:08	¦020978-987-538-203-9¦082371.71 J95 2007¦100JUNGMAN, EVA¦245ADOLESCENCIA, TUTORIAS Y ESCUELA: TRABAJO PARTICIPATIVO Y PROMOCIóN DE LA SALUD / EVA JUNGMAN¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦300109 PAG.¦440COLEC. ENSAYOS Y EXPERIENCIAS; 67¦500INCLUYE ÍNDICE¦6501. JOVENES - CONDUCTA DE VIDA 2. ORIENTACIóN VOCACIONAL 3. TUTELAÌ	COLEC. ENSAYOS Y EXPERIENCIAS; 67	'-203':4,11 '-538':3,10 '-9':5,12 '-987':2,9 '020978':8 '082371.71':13 '100jungman':16 '2':55 '2007':15 '245adolescencia':18 '2501a':6,31 '260argentina':33 '3':58 '300109':41 '440colec':43 '500incluye':48 '6501':50 '67':47 '978':1 'centr':34 'conduct':52 'didact':40 'ed':7,32 'educ':37 'ensay':44 'escuel':21 'eva':17,29 'experient':46 'indic':49 'j95':14 'joven':51 'jungm':30 'material':39 'orient':56 'pag':42 'particip':23 'promocion':25 'public':36 'salud':28 'trabaj':22 'tutelaì':59 'tutori':19 'vid':54 'vocacional':57	
105	853	978-84-9842-255-9	305.235 N962 2009	2501a. Ed.	\N	0	\N	\N	0	\N	192	ace30205-f9c0-4a88-bc3d-e229f9927406		1	1	2	\N	2021-12-09 20:44:37	2021-12-09 20:44:37	¦020978-84-9842-255-9¦082305.235 N962 2009¦100NUEVO GONZáLEZ, ELISEO¦245ADOLESCENTES 50 CASOS PROBLEMáTICOS: ANáLISIS PICOLóGICO Y PROPUESTAS EDUCATIVAS / ELISEO NUEVO GONZáLEZ¦2501A. ED.¦260ESPAñA : EDITORIAL CCS¦300352 PAG.¦440COLECCIóN EDUCAR, 51¦6501. ADOLESCENCIA, PSICOLOGíA DE LA 2. ADOLESCENCIA - ESTUDIO DE CASOS¦700I. SáNCHEZ, DIANA, COAUT.Ì	COLECCIóN EDUCAR, 51	'-255':4,14 '-84':2,12 '-9':5,15 '-9842':3,13 '020978':11 '082305.235':16 '100nuevo':19 '2':49 '2009':8,18 '245adolescentes':22 '2501a':9,34 '260españa':36 '300352':39 '305.235':6 '440colección':41 '50':23 '51':43 '6501':44 '700i':54 '978':1 'adolescent':45,50 'analisis':26 'cas':24,53 'ccs':38 'coaut':57 'dian':56 'ed':10,35 'editorial':37 'educ':30,42 'elise':21,31 'estudi':51 'gonzalez':20,33 'n962':7,17 'nuev':32 'pag':40 'picolog':27 'problemat':25 'propuest':29 'psicolog':46 'sanchez':55 'ì':58	
106	793	978-84-92892-25-9	154.24 M722 2012	2501a. Ed.	\N	0	\N	\N	0	\N	169	e84fc215-43c4-4918-b08d-b819e2c0e46f		1	1	2	\N	2021-12-09 20:51:04	2021-12-09 20:51:04	¦020978-84-92892-25-9¦082154.24 M722 2012¦100MOLINERO, CARLOS¦245ADOLESCENTES EN CONFLICTO: COMO RECUPERAR LA ARMONIA PERDIDA / CARLOS MOLLINERO¦2501A. ED.¦260MADRID, ESPAñA : MESTAS EDICIONES¦300157 PAG.¦440COLECCIóN EL MUNDO EN TUS MANOS¦6501. ADOLESCENCIA PSICOLOGíA DE LA 2. CONFLICTOS - SOLUCIONESÌ	COLECCIóN EL MUNDO EN TUS MANOS	'-25':4,14 '-84':2,12 '-9':5,15 '-92892':3,13 '020978':11 '082154.24':16 '100molinero':19 '154.24':6 '2':50 '2012':8,18 '245adolescentes':21 '2501a':9,31 '260madrid':33 '300157':37 '440colección':39 '6501':45 '978':1 'adolescent':46 'armoni':27 'carl':20,29 'conflict':23,51 'ed':10,32 'edicion':36 'españ':34 'm722':7,17 'man':44 'mest':35 'molliner':30 'mund':41 'pag':38 'perd':28 'psicolog':47 'recuper':25 'solucionesì':52	
107	826	84-414-1689-3	155.5 M314 2005	Colección Tú Hijo y Tu; 22	\N	0	\N	\N	0	\N	182	3f581e0e-4df0-4182-be7e-f6be92737587		1	1	2	\N	2021-12-09 20:52:53	2021-12-09 20:52:53	¦02084-414-1689-3¦082155.5 M314 2005¦100MARCELLI, DANIEL¦245ADOLESCENTES, MALOS ROLLOS, COMPLEJOS Y COMEDURAS DE LOCO / DANIEL MARCELLI¦2501A. ED.¦260BARCELONA, ESPAñA : EDAF¦300292 PAG.¦440COLECCIóN Tú HIJO Y TU; 22¦6501. ADOLESCENCIA, PSICOLOGíA DE LA 2. PADRES E HIJOS¦700I. BORIE, GUILLEMETTE DE LA, COAUT.  II. TASTET, PHILIPPE, ILÌ	COLECCIóN Tú HIJO Y TU; 22	'-1689':3,16 '-3':4,17 '-414':2,15 '02084':14 '082155.5':18 '100marcelli':21 '155.5':5 '2':51 '2005':7,20 '22':13,45 '245adolescentes':23 '2501a':33 '260barcelona':35 '300292':38 '440colección':40 '6501':46 '700i':55 '84':1 'adolescent':47 'bori':56 'coaut':60 'coleccion':8 'comedur':28 'complej':26 'daniel':22,31 'ed':34 'edaf':37 'españ':36 'guillemett':57 'hij':10,42,54 'ii':61 'ilì':64 'loc':30 'm314':6,19 'mal':24 'marcelli':32 'padr':52 'pag':39 'philipp':63 'psicolog':48 'roll':25 'tastet':62	
110	990	968-889-122-3	FT 808.831 L55 1988	2501a. Ed.	\N	0	\N	\N	0	\N	242	cd01eac6-c52b-4094-ace4-f0e3695ad6d5		1	1	2	\N	2021-12-10 13:42:29	2021-12-10 13:42:29	¦020968-889-122-3¦082FT 808.831 L55 1988¦100LILLE FUENTES, MARIO DE¦245ADVERTENCIAS AMORALES AL LECTOR Y CIERTO TIPO DE CUENTOS SUMAMENTE INOCENTES / MARIO DE LILLE FUENTES¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO. INSTITUTO DE CULTURA DE TABASCO¦300257 PAG.¦440AUTORES TABASQUEñOS CONTEMPORáNEOS; 7¦6501. CUENTOS MEXICANOS - TABASCOÌ		'-122':3,13 '-3':4,14 '-889':2,12 '020968':11 '082ft':15 '100lille':19 '1988':8,18 '245advertencias':23 '2501a':9,38 '260villahermosa':40 '300257':53 '440autores':55 '6501':59 '7':58 '808.831':6,16 '968':1 'amoral':24 'ciert':28 'contemporane':57 'cuent':31,60 'cultur':50 'ed':10,39 'ft':5 'fuent':20,37 'gobiern':43 'inocent':33 'institut':48 'l55':7,17 'lector':26 'lill':36 'mari':21,34 'mexic':42 'mexican':61 'pag':54 'sum':32 'tabasc':41,47,52 'tabascoì':62 'tabasqueñ':56 'tip':29	
111	991	978-970-58-0010-8	863.01 F954 2012	2501a. Ed.	\N	0	\N	\N	0	\N	5	fad91e6e-36d3-4d10-a5ff-14f3ab84cbd3		1	1	2	\N	2021-12-10 13:50:25	2021-12-10 13:50:25	¦020978-970-58-0010-8¦082863.01 F954 2012¦100FUENTES, CARLOS¦245AGUA QUEMADA: CUARTETO / CARLOS FUENTES¦2501A. ED.¦260MéXICO : ALFAGUARA¦300173 PAG.¦6501. CUENTOS MEXICANOS - SIGLO XXÌ		'-0010':4,14 '-58':3,13 '-8':5,15 '-970':2,12 '020978':11 '082863.01':16 '100fuentes':19 '2012':8,18 '245agua':21 '2501a':9,26 '260méxico':28 '300173':30 '6501':32 '863.01':6 '978':1 'alfagu':29 'carl':20,24 'cuartet':23 'cuent':33 'ed':10,27 'f954':7,17 'fuent':25 'mexican':34 'pag':31 'quem':22 'sigl':35 'xxì':36	
112	992	968-889-259-9	FT 863.01 S687 1994	2501a. Ed.	\N	0	\N	\N	0	\N	136	e9b8f9f0-1e13-42b7-b011-1aab2f728e1e		1	1	2	\N	2021-12-10 14:01:21	2021-12-10 14:01:21	¦020968-889-259-9¦082FT 863.01 S687 1994¦100SOLIS CALVILLO, ANTONIO¦245AH, LAS HISTORIAS CONOCIDAS / ANTONIO SOLIS CALVILLO¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦30057 PAG.¦440SERIE ALIENTO¦6501. CUENTOS MEXICANOS - TABASCO - SIGLO XX 2. AUTORES MEXICANOS - TABASCO - SIGLO XXÌ		'-259':3,13 '-889':2,12 '-9':4,14 '020968':11 '082ft':15 '100solis':19 '1994':8,18 '2':49 '245ah':22 '2501a':9,29 '260villahermosa':31 '30057':39 '440serie':41 '6501':43 '863.01':6,16 '968':1 'alient':42 'antoni':21,26 'autor':50 'calvill':20,28 'conoc':25 'cuent':44 'ed':10,30 'ft':5 'gobiern':34 'histori':24 'mexic':33 'mexican':45,51 'pag':40 's687':7,17 'sigl':47,53 'solis':27 'tabasc':32,38,46,52 'xx':48 'xxì':54	
113	993	968-23-2667-2	614.4 L925 2006	2501a. Ed.	\N	0	\N	\N	0	\N	40	226b3046-ea2c-4677-843e-12e8ab1a30e7		1	1	2	\N	2021-12-10 14:04:56	2021-12-10 14:04:56	¦020968-23-2667-2¦082614.4 L925 2006¦100LOZANO, MARIO E.¦245AHI VIENE LA PLAGA: VIRUS EMERGENTES, EPIDEMIAS Y PANDEMIAS / MARIO E. LOZANO¦2501A. ED.¦260ARGENTINA : SIGLO XXI EDITORES¦300126 PAG.¦440COLEC. CIENCIA QUE LADRA¦6501. EPIDEMIOLOGíAÌ	COLEC. CIENCIA QUE LADRA	'-2':4,13 '-23':2,11 '-2667':3,12 '020968':10 '082614.4':14 '100lozano':17 '2006':7,16 '245ahi':20 '2501a':8,32 '260argentina':34 '300126':38 '440colec':40 '614.4':5 '6501':44 '968':1 'cienci':41 'ed':9,33 'editor':37 'emergent':25 'epidemi':26 'epidemiologiaì':45 'l925':6,15 'ladr':43 'lozan':31 'mari':18,29 'pag':39 'pandemi':28 'plag':23 'sigl':35 'vien':21 'virus':24 'xxi':36	
114	995	968-889-109-6	FT 398.27 S211 1987	2501a. Ed.	\N	0	\N	\N	0	\N	136	902d55d0-27e9-46d5-b4f1-9177b0991563		1	1	2	\N	2021-12-10 14:10:58	2021-12-10 14:10:58	¦020968-889-109-6¦082FT 398.27 S211 1987¦100SáNCHEZ CHABLE, TORIBIO¦245AJK´ ECH BUCH: EL PESCADOR / RELATO DE TORIBIO SáNCHEZ CHABLE¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦30020 PAG.¦440COLEC. TESTIMONIOS¦6501. PESCA - TABASCO - MéXICO - CUENTOS Y LEYENDAS 2. FOLKLORE - TABASCO - MéXICO¦700I. LóPEZ, MARCIO, IL. II. HERNáNDEZ JERóNIMO, ALEJANDRINA, TR.Ì	COLEC. TESTIMONIOS	'-109':3,13 '-6':4,14 '-889':2,12 '020968':11 '082ft':15 '100sánchez':19 '1987':8,18 '2':53 '245ajk':22 '2501a':9,32 '260villahermosa':34 '30020':42 '398.27':6,16 '440colec':44 '6501':46 '700i':57 '968':1 'alejandrin':64 'buch':24 'chabl':20,31 'cuent':50 'ech':23 'ed':10,33 'folklor':54 'ft':5 'gobiern':37 'hernandez':62 'ii':61 'il':60 'jeronim':63 'leyend':52 'lopez':58 'marci':59 'mexic':36,49,56 'pag':43 'pesc':47 'pescador':26 'relat':27 's211':7,17 'sanchez':30 'tabasc':35,41,48,55 'testimoni':45 'toribi':21,29 'tr':65 'ì':66	
115	996	978-958-04-7984-0	925.3 CH532 2004	2501a. Ed.	\N	0	\N	\N	0	\N	56	a294ecd4-4e22-481e-8c3c-3a9111e04959		1	1	2	\N	2021-12-10 14:15:27	2021-12-10 14:15:27	¦020978-958-04-7984-0¦082925.3 CH532 2004¦100CHIRINOS, JUAN CARLOS¦245ALBERT EINSTEIN: CARTAS PROBABLES / JUAN CARLOS CHIRINOS¦2501A. ED.¦260COLOMBIA : EDITORIAL NORMA¦440COLEC. SOL & LUNA¦6501. EINSTEIN, ALBERT, 1879 - 1955 - BIOGRAFíA 2. EINSTEIN, ALBERT, 1879 - 1955 - CORRESPONDENCIA - MEMORIAS¦700I. HERNáNDEZ, DECKERS, COAUT.Ì	COLEC. SOL & LUNA	'-0':5,15 '-04':3,13 '-7984':4,14 '-958':2,12 '020978':11 '082925.3':16 '100chirinos':19 '1879':40,46 '1955':41,47 '2':43 '2004':8,18 '245albert':22 '2501a':9,29 '260colombia':31 '440colec':34 '6501':37 '700i':50 '925.3':6 '978':1 'albert':39,45 'biograf':42 'carl':21,27 'cart':24 'ch532':7,17 'chirin':28 'coaut':53 'correspondent':48 'deckers':52 'ed':10,30 'editorial':32 'einstein':23,38,44 'hernandez':51 'juan':20,26 'lun':36 'memori':49 'norm':33 'probabl':25 'sol':35 'ì':54	
116	538	978-84-96950-35-1	362.292 L869 2007	2501a. Ed.	\N	0	\N	\N	0	\N	143	c84f33a3-7de7-46e5-8712-7c8868a185af		1	1	2	\N	2021-12-10 14:19:50	2021-12-10 14:19:50	¦020978-84-96950-35-1¦082362.292 L869 2007¦100LORENZO PONTEVEDRA, MA. CARMEN¦245ALCOHOL / MA. CARMEN LORENZO PONTEVEDRA¦2501A. ED.¦260VIGO, ESPAñA : NOVA GALICIA EDICIONES¦30053 PAG.¦440SABER PARA VIVIR¦6501. ALCOHOL 2. ALCOHOLISMOÌ		'-1':5,15 '-35':4,14 '-84':2,12 '-96950':3,13 '020978':11 '082362.292':16 '100lorenzo':19 '2':42 '2007':8,18 '245alcohol':23 '2501a':9,28 '260vigo':30 '30053':35 '362.292':6 '440saber':37 '6501':40 '978':1 'alcohol':41 'alcoholismoì':43 'carm':22,25 'ed':10,29 'edicion':34 'españ':31 'galici':33 'l869':7,17 'lorenz':26 'ma':21,24 'nov':32 'pag':36 'pontevedr':20,27 'viv':39	
117	538	978-84-85401-25-3	362.292 L868 2006	2501a. Ed.	\N	0	\N	\N	0	\N	143	7e10475e-5b25-46c3-98e2-e50029d8b47d		1	1	2	\N	2021-12-10 14:22:13	2021-12-10 14:22:13	¦020978-84-85401-25-3¦082362.292 L868 2006¦100LORENZO PONTEVEDRA, MARIA DEL CARMEN¦245ALCOHOL / MARIA DEL CARMEN LORENZO PONTEVEDRA¦2501A. ED.¦260VIGO, ESPAñA : NOVA GALICIA EDICIONS¦30053 PAG.¦440QUé ME DICES DE....¦6501. ALCOHOLISMO 2. ALCOHOL - PROBLEMASÌ		'-25':4,14 '-3':5,15 '-84':2,12 '-85401':3,13 '020978':11 '082362.292':16 '100lorenzo':19 '2':45 '2006':8,18 '245alcohol':24 '2501a':9,30 '260vigo':32 '30053':37 '362.292':6 '440qué':39 '6501':43 '978':1 'alcohol':44,46 'carm':23,27 'dic':41 'ed':10,31 'edicions':36 'españ':33 'galici':35 'l868':7,17 'lorenz':28 'mari':21,25 'nov':34 'pag':38 'pontevedr':20,29 'problemasì':47	
118	997	958-04-7986-0	923.1 CH532 2004	2501a. Ed.	\N	0	\N	\N	0	\N	56	d30dffa0-20a1-4433-8659-ef80584a0913		1	1	2	\N	2021-12-10 14:29:22	2021-12-10 14:29:22	¦020958-04-7986-0¦082923.1 CH532 2004¦100CHIRINOS, JUAN CARLOS¦245ALEJANDRO MAGNO: EL VIVO ANHELO DE CONOCER / JUAN CARLOS CHIRINOS¦2501A. ED.¦260COLOMBIA : GRUPO EDITORIAL NORMA¦300202 PAG.¦440COLEC. SOL & LUNA¦6501. ALAEJANDRO MAGNO, 356 - 323 A.D - BIOGRAFíA 2. GRECIA - HISTORIA SIGLO IV¦700I. ALEJANDRO III DE MACEDONIAÌ	COLEC. SOL & LUNA	'-0':4,13 '-04':2,11 '-7986':3,12 '020958':10 '082923.1':14 '100chirinos':17 '2':48 '2004':7,16 '245alejandro':20 '2501a':8,30 '260colombia':32 '300202':36 '323':45 '356':44 '440colec':38 '6501':41 '700i':53 '923.1':5 '958':1 'a.d':46 'alaejandr':42 'alejandr':54 'anhel':24 'biograf':47 'carl':19,28 'ch532':6,15 'chirin':29 'conoc':26 'ed':9,31 'editorial':34 'greci':49 'grup':33 'histori':50 'iii':55 'iv':52 'juan':18,27 'lun':40 'macedoniaì':57 'magn':21,43 'norm':35 'pag':37 'sigl':51 'sol':39 'viv':23	
124	1003	\N	001.42 T326T	\N	\N	0	\N	\N	0	\N	245	4d020021-43f1-4cfe-96a9-f3637fb5a6e5		1	1	2	\N	2022-01-05 14:31:51	2022-01-05 14:31:51			'001.42':1 't326t':2	
127	1006	\N	004 C656	\N	\N	0	\N	\N	0	\N	245	854649af-8fa7-403b-8e13-151dcb67de09		1	1	2	\N	2022-01-05 14:38:12	2022-01-05 14:38:12			'004':1 'c656':2	
129	1007	\N	001.42 P373M 1989	\N	\N	0	\N	\N	0	\N	245	55a9a78a-5590-475e-9282-46f1007643cd		1	1	2	\N	2022-01-05 14:40:59	2022-01-05 14:40:59			'001.42':1 '1989':3 'p373m':2	
130	1008	\N	001.42 S245M 1998	\N	\N	0	\N	\N	0	\N	245	fc86946d-2241-477c-8d0a-bff127b423e3		1	1	2	\N	2022-01-05 19:44:22	2022-01-05 19:44:22			'001.42':1 '1998':3 's245m':2	
133	1010	\N	001.4 I584	\N	\N	0	\N	\N	0	\N	245	53f5ffce-a722-49fc-8dcc-77b71975b2ca		1	1	2	\N	2022-01-06 15:00:50	2022-01-06 15:00:50			'001.4':1 'i584':2	
134	1012	\N	003 B872D	\N	\N	0	\N	\N	0	\N	245	d4cd208a-9c52-45aa-b67e-c0cd3838c325		1	1	2	\N	2022-01-06 15:05:13	2022-01-06 15:05:13			'003':1 'b872d':2	
135	1013	\N	001.42 M486	\N	\N	0	\N	\N	0	\N	245	f8532f98-cf87-4f21-909b-b9ea006f8c07		1	1	2	\N	2022-01-06 19:26:28	2022-01-06 19:26:28			'001.42':1 'm486':2	
136	1015	\N	001.42 N353M	\N	\N	0	\N	\N	0	\N	245	dc6d5db7-265b-497e-bb4a-b06cb49233be		1	1	2	\N	2022-01-06 19:33:23	2022-01-06 19:33:23			'001.42':1 'n353m':2	
145	1025	\N	398.21 V358B	\N	\N	0	\N	\N	0	\N	179	94730968-5a67-4751-8425-4fe34dd3f9e1		1	1	2	\N	2022-01-11 15:18:40	2022-01-11 15:18:40			'398.21':1 'v358b':2	\N
146	1026	\N	398.41 E863	\N	\N	0	\N	\N	0	\N	245	a24e93f9-a119-4d12-bcbe-e2793a50b138		1	1	2	\N	2022-01-11 15:21:23	2022-01-11 15:21:23			'398.41':1 'e863':2	\N
137	1017	\N	400 C837	\N	\N	0	\N	\N	0	\N	162	70705d5f-2115-4947-ab50-7958a88878e9		1	1	2	\N	2022-01-07 14:10:26	2022-01-07 14:13:56			'400':1 'c837':2	\N
138	1018	\N	400 C388	\N	\N	0	\N	\N	0	\N	245	fac9caf9-dc33-4e87-9814-1c23c1b6c458		1	1	2	\N	2022-01-07 14:17:06	2022-01-07 14:17:06			'400':1 'c388':2	\N
139	1019	\N	400 C372U	\N	\N	0	\N	\N	0	\N	245	3e53b673-1fff-40af-a1f7-558b833220a8		1	1	2	\N	2022-01-07 14:26:24	2022-01-07 14:26:24			'400':1 'c372u':2	\N
140	1020	\N	400 C356A	\N	\N	0	\N	\N	0	\N	245	926642b4-f8f8-41b8-bd1b-70505452c17c		1	1	2	\N	2022-01-07 14:29:19	2022-01-07 14:29:19			'400':1 'c356a':2	\N
141	1021	\N	400 B377S	\N	\N	0	\N	\N	0	\N	245	6246c9a4-581a-456e-906e-c7c4c3abfa15		1	1	2	\N	2022-01-07 14:45:31	2022-01-07 14:45:31			'400':1 'b377s':2	\N
142	1022	\N	400 B372L	\N	\N	0	\N	\N	0	\N	245	5d2130dd-c2e0-43bc-b062-6f79ab659cad		1	1	2	\N	2022-01-07 14:49:22	2022-01-07 14:49:22			'400':1 'b372l':2	\N
147	1028	\N	440.1 G573C	\N	\N	0	\N	\N	0	\N	245	a3144e9c-e81d-4d9f-bcde-a3467cf1b119		1	1	2	\N	2022-01-11 16:39:12	2022-01-11 16:39:12			'440.1':1 'g573c':2	\N
148	1029	\N	440.1 C345	\N	\N	0	\N	\N	0	\N	245	feca3c7c-6699-4fb7-8fd5-ab31cca8520b		1	1	2	\N	2022-01-11 16:43:26	2022-01-11 16:43:26			'440.1':1 'c345':2	\N
149	1030	\N	440.1 G573C	\N	\N	0	\N	\N	0	\N	245	cb148501-42f4-4205-b6f3-0811e4a44d5d		1	1	2	\N	2022-01-11 16:45:44	2022-01-11 16:45:44			'440.1':1 'g573c':2	\N
150	1031	\N	440.0 T456 1996	\N	\N	0	\N	\N	0	\N	246	92506df1-84ba-4bfc-9b74-8838f1bf64cd		1	1	2	\N	2022-01-11 16:53:04	2022-01-11 16:53:04			'1996':3 '440.0':1 't456':2	\N
152	1032	\N	440.1 C364E 2001	\N	\N	0	\N	\N	0	\N	245	9ade206e-de91-44f6-93fd-3c379b2037cb		1	1	2	\N	2022-01-11 16:56:00	2022-01-11 16:56:00			'2001':3 '440.1':1 'c364e':2	\N
153	1033	\N	440.1 F678 2000	\N	\N	0	\N	\N	0	\N	247	f04540ae-af59-494e-9079-0505548e6811		1	1	2	\N	2022-01-11 18:21:08	2022-01-11 18:21:08			'2000':3 '440.1':1 'f678':2	\N
131	1009	\N	001.42 M472C 2008	\N	02840	0	\N	\N	0	\N	245	6d2f29e3-ce60-46ed-9d1a-6a9372c967f0		1	1	2	\N	2022-01-05 19:47:30	2022-02-08 14:21:26			'001.42':1 '02840':4 '2008':3 'm472c':2	676
143	1023	\N	400 A283	\N	00776	0	\N	\N	0	\N	245	0cb40a4d-98c0-4a45-bec9-df0ec00f3186		1	1	2	\N	2022-01-11 15:14:04	2022-02-08 14:46:56			'00776':3 '400':1 'a283':2	385
144	1024	\N	400 A283	\N	00851	0	\N	\N	0	\N	245	f6c358d6-22e5-4e97-8ec0-b896122d390b		1	1	2	\N	2022-01-11 15:16:22	2022-02-08 14:50:36			'00851':3 '400':1 'a283':2	419
121	1000	\N	001.42 A537G 2003	\N	00004	0	\N	\N	0	\N	245	d5db96b3-515f-47c5-868e-df4efae10146		1	1	2	\N	2022-01-04 19:55:04	2022-02-08 14:57:04			'00004':4 '001.42':1 '2003':3 'a537g':2	3
122	1001	\N	001.42 P474C	\N	00007	0	\N	\N	0	\N	245	fe175659-faec-40ac-bd33-e2ea24ce5d1a		1	1	2	\N	2022-01-05 14:23:54	2022-02-08 14:57:44			'00007':3 '001.42':1 'p474c':2	5
123	1002	\N	001.42 R433	\N	00008	0	\N	\N	0	\N	245	3313563c-8930-4e8e-90d9-de08a5aac270		1	1	2	\N	2022-01-05 14:26:33	2022-02-08 14:58:23			'00008':3 '001.42':1 'r433':2	6
125	1004	\N	001.539 K323L 1997	\N	00037	0	\N	\N	0	\N	245	4ec7147b-0505-4074-8b0c-ca2bc0b12eda		1	1	2	\N	2022-01-05 14:33:48	2022-02-08 14:59:18			'00037':4 '001.539':1 '1997':3 'k323l':2	7
126	1005	\N	002 A354C	\N	00041	0	\N	\N	0	\N	245	e2592ce8-6f0c-4c9a-ac72-20f04f100f77		1	1	2	\N	2022-01-05 14:35:43	2022-02-08 17:14:16			'00041':3 '002':1 'a354c':2	8
154	1034	\N	440.1 F678 2001	\N	\N	0	\N	\N	0	\N	247	88c041f5-6faf-4b3c-a518-690e6e990678		1	1	2	\N	2022-01-11 18:22:35	2022-01-11 18:22:35			'2001':3 '440.1':1 'f678':2	\N
155	1035	\N	440.1 A584 2008	\N	\N	0	\N	\N	0	\N	247	872d0317-1cd9-4f46-b17f-c320a3093a7f		1	1	2	\N	2022-01-11 18:24:26	2022-01-11 18:24:26			'2008':3 '440.1':1 'a584':2	\N
156	1036	\N	440.1 N688	\N	\N	0	\N	\N	0	\N	248	98a6fc5e-fae0-437d-8a30-b77f099f2d2f		1	1	2	\N	2022-01-11 18:27:44	2022-01-11 18:27:44			'440.1':1 'n688':2	\N
157	1037	\N	440.1 C334 1997	\N	\N	0	\N	\N	0	\N	247	579b9816-91c2-4e71-9223-c74a1a8fa109		1	1	2	\N	2022-01-11 18:32:48	2022-01-11 18:32:48			'1997':3 '440.1':1 'c334':2	\N
159	1040	\N	440.1 C364E VOL. 1	\N	\N	0	\N	\N	0	\N	247	523f2f55-2b03-49a6-9bf7-d5b250d31132		1	1	2	\N	2022-01-11 18:40:55	2022-01-11 18:40:55			'1':4 '440.1':1 'c364e':2 'vol':3	\N
160	1041	\N	371.36 A385P 1990	\N	\N	0	\N	\N	0	\N	60	644a4c83-4613-45e4-85ac-987ee13006ed		1	1	2	\N	2022-01-11 19:26:52	2022-01-11 19:26:52			'1990':3 '371.36':1 'a385p':2	306
161	1042	\N	372.6 L453	\N	\N	0	\N	\N	0	\N	179	d76db139-a92f-45c2-8cf1-7e2ddec2fb61		1	1	2	\N	2022-01-11 19:29:22	2022-01-11 19:29:22			'372.6':1 'l453':2	235
162	1043	\N	423 O936	\N	\N	0	\N	\N	0	\N	245	e2dfbbf9-6ade-416e-acd3-d15fde7c0879		1	1	2	\N	2022-01-11 19:33:11	2022-01-11 19:33:11			'423':1 'o936':2	1092
163	1044	\N	378.006 P655	\N	\N	0	\N	\N	0	\N	245	2a894cd5-42ab-495c-be27-0cb9dcb773eb		1	1	2	\N	2022-01-11 19:35:10	2022-01-11 19:35:10			'378.006':1 'p655':2	233
164	1045	\N	379.82 G368P	\N	\N	0	\N	\N	0	\N	179	d132c8d1-0b18-4476-a0b7-f8113d64e3df		1	1	2	\N	2022-01-11 19:54:06	2022-01-11 19:54:06			'379.82':1 'g368p':2	232
165	1046	\N	380 F343F	\N	\N	0	\N	\N	0	\N	245	2c75c9bd-505e-4956-8de7-c469dc0f6d5f		1	1	2	\N	2022-01-11 19:57:32	2022-01-11 19:57:32			'380':1 'f343f':2	270
166	1047	\N	380 V458F 2001	\N	\N	0	\N	\N	0	\N	245	4691b6fa-b8dc-40ea-9d9a-cacd7a37e360		1	1	2	\N	2022-01-11 19:59:58	2022-01-11 19:59:58			'2001':3 '380':1 'v458f':2	1450
167	1048	\N	378 U558	\N	\N	0	\N	\N	0	\N	245	5b2c5b95-a0d2-4473-bb98-a8c910a56301		1	1	2	\N	2022-01-11 20:02:16	2022-01-11 20:02:16			'378':1 'u558':2	1454
168	1050	\N	371.425 C383P	\N	\N	0	\N	\N	0	\N	117	43620f5c-289e-4eea-9565-6808eea4f703		1	1	2	\N	2022-01-11 20:06:24	2022-01-11 20:06:24			'371.425':1 'c383p':2	1663
169	1051	\N	371.7 S352V	\N	\N	0	\N	\N	0	\N	245	3d766698-a75b-463c-a1de-fea4a4ea3cc4		1	1	2	\N	2022-01-11 20:11:20	2022-01-11 20:11:20			'371.7':1 's352v':2	1741
170	1052	\N	380 145 104 R355C	\N	\N	0	\N	\N	0	\N	60	0c3e7b67-d5ce-4a5e-bcd7-c72abe1cd8b2		1	1	2	\N	2022-01-11 20:14:44	2022-01-11 20:14:44			'104':3 '145':2 '380':1 'r355c':4	1543
171	1053	\N	380 145 91 C438E	\N	\N	0	\N	\N	0	\N	60	cc500197-c5bf-4c07-8b2d-f67813eb706d		1	1	2	\N	2022-01-11 20:18:23	2022-01-11 20:18:23			'145':2 '380':1 '91':3 'c438e':4	1545
172	1054	\N	004.6 F676T 2007	\N	\N	0	\N	\N	0	\N	245	e65a501d-f994-4128-be06-82bfdca2b473		1	1	2	\N	2022-01-12 15:55:02	2022-01-12 15:55:02			'004.6':1 '2007':3 'f676t':2	1052
173	1055	\N	004 D873E	\N	\N	0	\N	\N	0	\N	68	58e6dc02-1148-4e74-9764-5b4f866b37d7		1	1	2	\N	2022-01-14 14:56:55	2022-01-14 14:56:55			'004':1 'd873e':2	1376
174	1056	\N	004 M555W	\N	\N	0	\N	\N	0	\N	111	7255c043-c137-49e5-a0ba-6251acab229a		1	1	2	\N	2022-01-14 15:01:26	2022-01-14 15:01:26			'004':1 'm555w':2	1048
175	1057	\N	004 N678I 2006	\N	\N	0	\N	\N	0	\N	245	ed59aa6c-26bb-42e5-8c06-8633bc2b496f		1	1	2	\N	2022-01-14 15:06:08	2022-01-14 15:06:08			'004':1 '2006':3 'n678i':2	1051
176	1059	\N	004 C656	\N	\N	0	\N	\N	0	\N	245	341a8b5d-d2e3-40d8-9932-1d6614693190		1	1	2	\N	2022-01-14 16:29:39	2022-01-14 16:29:39			'004':1 'c656':2	1674
178	1060	\N	004 Z365A	\N	\N	0	\N	\N	0	\N	61	2466eb0e-3e0d-4001-87dc-4bb1f533b686		1	1	2	\N	2022-01-14 16:32:43	2022-01-14 16:32:43			'004':1 'z365a':2	1712
179	1061	\N	004.6 C425J	\N	\N	0	\N	\N	0	\N	217	26573605-9fa8-4b91-abef-5fdce4c04ab6		1	1	2	\N	2022-01-14 16:35:11	2022-01-14 16:35:11			'004.6':1 'c425j':2	1713
180	1062	\N	421 S883	\N	\N	0	\N	\N	0	\N	68	bec4bfbb-f6e7-4541-814f-23bcf668c18e		1	1	2	\N	2022-01-14 22:36:47	2022-01-14 22:36:47			'421':1 's883':2	437
183	1066	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	883b1569-525f-481d-a7cb-18779035b7e3		1	1	2	\N	2022-01-14 23:56:04	2022-01-14 23:56:04			'421':1 'w674':2	431
184	1067	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	9a82c9cb-7608-4bf1-8c78-d1167723bbf9		1	1	2	\N	2022-01-14 23:57:54	2022-01-14 23:57:54			'421':1 'w674':2	433
185	1068	\N	421 T432	\N	\N	0	\N	\N	0	\N	245	47f29538-b01e-46dd-bc2f-ca826c8555b1		1	1	2	\N	2022-01-14 23:59:12	2022-01-14 23:59:12			'421':1 't432':2	435
186	1069	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	bf3bbb93-83a1-4ac0-b32c-b7bf09bd14a1		1	1	2	\N	2022-01-15 00:01:01	2022-01-15 00:01:01			'421':1 'w674':2	436
187	1070	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	17053ab8-2000-4dd4-b106-d40027f39411		1	1	2	\N	2022-01-15 00:02:56	2022-01-15 00:02:56			'421':1 'w674':2	438
188	1071	\N	421 S883	\N	\N	0	\N	\N	0	\N	245	a5f784ce-51b4-47c4-b2d4-eae6abcf33ae		1	1	2	\N	2022-01-15 00:05:10	2022-01-15 00:05:10			'421':1 's883':2	439
190	1073	\N	\N	\N	380.145 910 4 C388P	0	\N	\N	0	\N	60	c69cc65d-617e-46f1-9957-a6983f301317		1	1	2	\N	2022-01-15 00:22:18	2022-01-15 00:22:18			'380.145':1 '4':3 '910':2 'c388p':4	1559
192	1074	\N	380-.145 338 4 A823M	\N	\N	0	\N	\N	0	\N	60	68a28c0f-3e0e-4ad2-89fa-e155f0b32ed0		1	1	2	\N	2022-01-15 00:25:46	2022-01-15 00:25:46			'145':2 '338':3 '380':1 '4':4 'a823m':5	1732
193	1075	\N	380.145 338 4 R355M	\N	\N	0	\N	\N	0	\N	60	e8618a8d-7646-4249-bb90-31312a286978		1	1	2	\N	2022-01-15 00:27:34	2022-01-15 00:27:34			'338':2 '380.145':1 '4':3 'r355m':4	1700
194	1076	\N	380.145 910 4 B685A	\N	\N	0	\N	\N	0	\N	60	4f6b1558-daee-41f9-912d-dae58b13989c		1	1	2	\N	2022-01-15 00:29:51	2022-01-15 00:29:51			'380.145':1 '4':3 '910':2 'b685a':4	1556
195	1077	\N	380.145 910 4 A247C	\N	\N	0	\N	\N	0	\N	60	551321e6-6ffa-43c9-b554-f2603cf368ae		1	1	2	\N	2022-01-15 00:33:39	2022-01-15 00:33:39			'380.145':1 '4':3 '910':2 'a247c':4	1553
196	1078	\N	380.14 P445D	\N	\N	0	\N	\N	0	\N	245	58f4ba18-b911-4ed5-8973-30d5d0e162b6		1	1	2	\N	2022-01-15 00:39:03	2022-01-15 00:39:03			'380.14':1 'p445d':2	227
197	1079	\N	380.145 910 4 A247P	\N	\N	0	\N	\N	0	\N	245	ce664063-7373-414e-9066-05a59926e557		1	1	2	\N	2022-01-15 00:41:13	2022-01-15 00:41:13			'380.145':1 '4':3 '910':2 'a247p':4	1490
198	1080	\N	380.145 910 4 A247A	\N	\N	0	\N	\N	0	\N	60	7bd6d4ab-97b8-4020-94dd-274b54b58b0e		1	1	2	\N	2022-01-15 00:43:51	2022-01-15 00:43:51			'380.145':1 '4':3 '910':2 'a247a':4	1493
200	1082	\N	425 S247E 2003	\N	\N	0	\N	\N	0	\N	245	5cc5e6bf-dc06-4c57-bc70-e812e095a518		1	1	2	\N	2022-01-18 15:39:36	2022-01-18 15:39:36			'2003':3 '425':1 's247e':2	1059
201	1083	\N	428 G858S	\N	\N	0	\N	\N	0	\N	245	53787103-1c7e-4bfd-8402-24848106e841		1	1	2	\N	2022-01-18 15:42:07	2022-01-18 15:42:07			'428':1 'g858s':2	365
202	1084	\N	380.145 9104 C373M	\N	\N	0	\N	\N	0	\N	60	252fbe4e-b414-4c4d-a535-cbbde2d89896		1	1	2	\N	2022-01-18 18:00:26	2022-01-18 18:00:26			'380.145':1 '9104':2 'c373m':3	228
203	1085	\N	380.145 910 V535G	\N	\N	0	\N	\N	0	\N	245	1b3bee35-cfec-491a-8fd2-63730ebf6084		1	1	2	\N	2022-01-19 15:18:46	2022-01-19 15:18:46			'380.145':1 '910':2 'v535g':3	1488
204	1086	\N	380.145 910 48 T677A	\N	\N	0	\N	\N	0	\N	60	0cde5d32-07f7-493e-82d6-fed5a2f68231		1	1	2	\N	2022-01-19 15:23:20	2022-01-19 15:23:20			'380.145':1 '48':3 '910':2 't677a':4	1496
199	1081	\N	425 C655	\N	01517	0	\N	\N	0	\N	245	981d0600-5149-4eaf-9753-f469c0e3f928		1	1	2	\N	2022-01-18 15:35:27	2022-02-08 14:33:25			'01517':3 '425':1 'c655':2	424
182	1065	\N	421 T354A	\N	00863	0	\N	\N	0	\N	245	15cfcdc5-044f-4b67-a18e-a57854b72fc2		1	1	2	\N	2022-01-14 23:53:57	2022-02-08 14:38:33			'00863':3 '421':1 't354a':2	430
205	1087	\N	380.145 910 72 E865A	\N	\N	0	\N	\N	0	\N	60	3e14b7e7-bb3c-49e5-9704-bd49eda1cbe5		1	1	2	\N	2022-01-19 15:30:07	2022-01-19 15:30:07			'380.145':1 '72':3 '910':2 'e865a':4	1561
206	1091	\N	380.145 910 4 T677T	\N	\N	0	\N	\N	0	\N	60	3472de7f-2f27-4bb5-84be-c961b66f4f30		1	1	2	\N	2022-01-19 21:06:45	2022-01-19 21:06:45	4816		'380.145':1 '4':3 '4816':5 '910':2 't677t':4	1551
207	1092	\N	400 M456	\N	\N	0	\N	\N	0	\N	245	2112e88a-29bb-40a2-86e9-8ea200543568		1	1	2	\N	2022-01-21 15:50:34	2022-01-21 15:50:34			'400':1 'm456':2	386
208	1093	\N	400 M456	\N	\N	0	\N	\N	0	\N	245	946daf87-8289-48a5-833c-019fc0e04e43		1	1	2	\N	2022-01-21 15:52:16	2022-01-21 15:52:16			'400':1 'm456':2	387
209	1095	\N	400 T365E	\N	\N	0	\N	\N	0	\N	245	a367e32d-75b1-4fd7-87c5-c3e693fbe327		1	1	2	\N	2022-01-21 16:06:35	2022-01-21 16:06:35			'400':1 't365e':2	395
210	1097	\N	400 S837G	\N	\N	0	\N	\N	0	\N	245	7f90f5a6-c6c0-43a5-8158-1065cd51cd35		1	1	2	\N	2022-01-21 16:08:22	2022-01-21 16:08:22			'400':1 's837g':2	396
211	1098	\N	440 C465C 2005	\N	\N	0	\N	\N	0	\N	245	385d06cb-1a81-4b6b-a1ad-59e2d3612bb0		1	1	2	\N	2022-01-21 16:12:48	2022-01-21 16:12:48			'2005':3 '440':1 'c465c':2	806
212	1099	\N	400 R494E	\N	\N	0	\N	\N	0	\N	245	ec49a40f-f04f-4fe0-acfe-3d03040c0ef9		1	1	2	\N	2022-01-21 16:16:57	2022-01-21 16:16:57			'400':1 'r494e':2	400
213	1100	\N	400 P474G	\N	\N	0	\N	\N	0	\N	245	3911d3b5-b462-4916-83e0-568627864b02		1	1	2	\N	2022-01-24 14:36:55	2022-01-24 14:37:09			'400':1 'p474g':2	402
214	1101	\N	400 R859I	\N	\N	0	\N	\N	0	\N	245	a17fecd9-3b41-489f-a201-44c74a7202e0		1	1	2	\N	2022-01-24 14:39:52	2022-01-24 14:39:52			'400':1 'r859i':2	403
215	1103	\N	400 R688P	\N	\N	0	\N	\N	0	\N	245	eb0db02f-bfcb-49df-8f4b-9f5f0092fb14		1	1	2	\N	2022-01-24 14:43:35	2022-01-24 14:43:35			'400':1 'r688p':2	404
216	1104	\N	400 R494H	\N	\N	0	\N	\N	0	\N	245	739c8f6d-4c29-4ddb-a514-180918e972e1		1	1	2	\N	2022-01-24 14:46:06	2022-01-24 14:46:06			'400':1 'r494h':2	405
217	1105	\N	400 L853 I584	\N	\N	0	\N	\N	0	\N	245	5ac3a13b-3a00-4d2a-83f2-ea43e44e895f		1	1	2	\N	2022-01-24 14:49:14	2022-01-24 14:49:14			'400':1 'i584':3 'l853':2	417
218	1106	\N	400 L853 I584	\N	\N	0	\N	\N	0	\N	245	639c506b-1a0d-4919-85bd-a5bb6365899b		1	1	2	\N	2022-01-24 14:52:29	2022-01-24 14:52:29			'400':1 'i584':3 'l853':2	417
219	1107	\N	400 U558 J675	\N	\N	0	\N	\N	0	\N	245	ad35aa3b-6e4c-4db8-8187-08b227feb7e0		1	1	2	\N	2022-01-24 15:52:18	2022-01-24 15:52:18			'400':1 'j675':3 'u558':2	380
220	1108	\N	403 D522	\N	\N	0	\N	\N	0	\N	245	811bc505-b738-4008-b45c-dafe82a53e2a		1	1	2	\N	2022-01-24 15:54:05	2022-01-24 15:54:05			'403':1 'd522':2	381
221	1109	\N	401.4 V723A	\N	\N	0	\N	\N	0	\N	245	3e1685cb-7670-44c2-b338-82845ea56821		1	1	2	\N	2022-01-24 16:02:16	2022-01-24 16:02:16			'401.4':1 'v723a':2	383
222	1110	\N	401.4 B623	\N	\N	0	\N	\N	0	\N	245	aa17b482-d4c2-4178-9a3b-9b2d6f0e6bca		1	1	2	\N	2022-01-24 16:06:54	2022-01-24 16:06:54			'401.4':1 'b623':2	384
224	1112	\N	400 U558	\N	\N	0	\N	\N	0	\N	245	6d1de138-4db7-4e2d-a78f-18d078f65c20		1	1	2	\N	2022-01-24 16:11:01	2022-01-24 16:11:01			'400':1 'u558':2	390
225	1115	\N	401.4 A285A	\N	\N	0	\N	\N	0	\N	245	c34b4fa3-37bd-4261-9227-44a2558ef961		1	1	2	\N	2022-01-24 20:05:06	2022-01-24 20:05:06			'401.4':1 'a285a':2	394
226	1116	\N	428 E535	\N	\N	0	\N	\N	0	\N	245	f5c69e9e-b30e-4153-aef5-d63ca5a09f5b		1	1	2	\N	2022-01-24 20:08:58	2022-01-24 20:08:58			'428':1 'e535':2	1097
227	1117	\N	428 H373G	\N	\N	0	\N	\N	0	\N	245	459e879d-9d52-4195-af0c-fcaf4c2c092c		1	1	2	\N	2022-01-24 20:11:06	2022-01-24 20:11:06			'428':1 'h373g':2	1101
228	1118	\N	428 S537	\N	\N	0	\N	\N	0	\N	64	bfce6a11-9658-4e4a-98e8-72108298c49e		1	1	2	\N	2022-01-25 13:45:25	2022-01-25 13:45:25			'428':1 's537':2	1035
229	1119	\N	428.007 B532G	\N	\N	0	\N	\N	0	\N	245	9f4ab2aa-df29-4da3-8cdb-8364fb21a526		1	1	2	\N	2022-01-25 13:52:22	2022-01-25 13:52:22			'428.007':1 'b532g':2	457
230	1120	\N	428 W558S	\N	\N	0	\N	\N	0	\N	64	d827ec30-7cf5-4505-81d3-432c4dba9ee3		1	1	2	\N	2022-01-25 13:57:59	2022-01-25 13:57:59			'428':1 'w558s':2	1036
231	1122	\N	428 W558S	\N	\N	0	\N	\N	0	\N	64	a18610c8-5127-4237-b056-96d818c663c3		1	1	2	\N	2022-01-25 14:03:28	2022-01-25 14:03:28			'428':1 'w558s':2	1128
232	1123	\N	664.122 A233I	\N	\N	0	\N	\N	0	\N	57	76bcefb0-5b6c-4bb7-ad9a-1f0c7507b29d		1	1	2	\N	2022-01-25 15:32:46	2022-01-25 15:32:46			'664.122':1 'a233i':2	1581
233	1124	\N	004 G837E	\N	\N	0	\N	\N	0	\N	245	b14de0e1-1c91-434a-b7ff-1967c7cfa78b		1	1	2	\N	2022-01-25 15:34:40	2022-01-25 15:34:40			'004':1 'g837e':2	1076
234	1126	\N	004.6 O365G 2008	\N	\N	0	\N	\N	0	\N	245	988c3e5c-c349-46eb-ad24-ae14569213d6		1	1	2	\N	2022-01-25 15:37:28	2022-01-25 15:37:28			'004.6':1 '2008':3 'o365g':2	1381
235	1127	\N	004.6 O365G 2008	\N	\N	0	\N	\N	0	\N	245	2ef24bcb-66d7-4553-a9f8-98a151af3d8a		1	1	2	\N	2022-01-25 15:39:49	2022-01-25 15:39:49			'004.6':1 '2008':3 'o365g':2	756
236	1129	\N	428.007 S868H	\N	\N	0	\N	\N	0	\N	64	2296ced3-8789-4c3a-83a9-8561c24183d7		1	1	2	\N	2022-01-26 13:33:36	2022-01-26 13:33:36			'428.007':1 's868h':2	458
237	1128	\N	428.007 S868H	\N	\N	0	\N	\N	0	\N	64	569fd6f9-1728-4c47-90d2-6c939c24c06f		1	1	2	\N	2022-01-26 13:34:22	2022-01-26 13:34:22			'428.007':1 's868h':2	458
238	1130	\N	428.2 S637A 2002	\N	\N	0	\N	\N	0	\N	64	055a62db-3942-437c-ba5c-8f72e89343c9		1	1	2	\N	2022-01-26 13:51:42	2022-01-26 13:51:42			'2002':3 '428.2':1 's637a':2	452
239	1131	\N	428.2 S637A 2001	\N	\N	0	\N	\N	0	\N	64	d872f69d-b91d-44a3-9d4f-732a43f8bbfe		1	1	2	\N	2022-01-26 13:54:08	2022-01-26 13:54:08			'2001':3 '428.2':1 's637a':2	453
240	1132	\N	339 C384P	\N	\N	0	\N	\N	0	\N	245	25ef7d9d-ace2-434c-9b54-0f58d9f43e86		1	1	2	\N	2022-01-26 14:11:24	2022-01-26 14:11:24			'339':1 'c384p':2	292
241	1135	\N	340 C555L	\N	\N	0	\N	\N	0	\N	122	32aeff1e-80b9-4a6d-b0ca-3c80dba7f1fa		1	1	2	\N	2022-01-26 14:27:09	2022-01-26 14:27:09			'340':1 'c555l':2	1738
242	1134	\N	340 S625	\N	\N	0	\N	\N	0	\N	245	c6e0f848-b0f8-4285-b4e5-f0c3c7536bda		1	1	2	\N	2022-01-26 14:36:00	2022-01-26 14:36:00			'340':1 's625':2	1385
243	1133	\N	339 D675M 1991	\N	\N	0	\N	\N	0	\N	245	d4de9c3f-9c45-476b-96f8-6178e48c12c1		1	1	2	\N	2022-01-26 14:38:41	2022-01-26 14:38:41			'1991':3 '339':1 'd675m':2	223
244	1136	\N	340 M686E 2007	\N	\N	0	\N	\N	0	\N	139	68bb6532-4868-426b-a6c0-c9387e53f95d		1	1	2	\N	2022-01-26 14:43:24	2022-01-26 14:43:24			'2007':3 '340':1 'm686e':2	1136
245	1139	\N	340 M686E 2006	\N	\N	0	\N	\N	0	\N	82	20b77de4-38fc-479f-b708-8377643c7be4		1	1	2	\N	2022-01-26 14:47:30	2022-01-26 14:47:30			'2006':3 '340':1 'm686e':2	2560
246	1140	\N	406 R637G	\N	\N	0	\N	\N	0	\N	217	89998987-3e45-4a84-90fa-5853136a56a8		1	1	2	\N	2022-01-26 14:55:18	2022-01-26 14:55:18			'406':1 'r637g':2	1736
247	1142	\N	410 E888	\N	\N	0	\N	\N	0	\N	179	21d4876e-e3da-49c4-b539-bf24d6be9734		1	1	2	\N	2022-01-26 15:12:03	2022-01-26 15:12:03			'410':1 'e888':2	374
248	1143	\N	410 L584	\N	\N	0	\N	\N	0	\N	179	6d2e3c86-2ee7-42a7-b4dc-c16d1b6392f8		1	1	2	\N	2022-01-26 15:17:58	2022-01-26 15:17:58			'410':1 'l584':2	375
249	1144	\N	410 T355 1992	\N	\N	0	\N	\N	0	\N	60	d274608f-8214-4ead-8169-cb71ff1b0ce6		1	1	2	\N	2022-01-26 15:20:59	2022-01-26 15:20:59			'1992':3 '410':1 't355':2	367
250	1145	\N	410 T688C 1990	\N	\N	0	\N	\N	0	\N	60	5dfc0559-d4f6-4ca5-8552-952d30ffd3f8		1	1	2	\N	2022-01-26 15:24:45	2022-01-26 15:24:45			'1990':3 '410':1 't688c':2	360
251	1146	\N	410 U558	\N	\N	0	\N	\N	0	\N	179	48d92b6d-52ab-42fc-96f3-94ea422921fb		1	1	2	\N	2022-01-26 15:27:08	2022-01-26 15:27:08			'410':1 'u558':2	369
252	1147	\N	410 W524D	\N	\N	0	\N	\N	0	\N	179	134dd0cc-e91a-41e8-8e12-e7433573f202		1	1	2	\N	2022-01-26 15:30:56	2022-01-26 15:30:56			'410':1 'w524d':2	325
253	1148	\N	410 Z383L	\N	\N	0	\N	\N	0	\N	179	048f75db-fa19-4fa7-8d4b-59a3b1ff60c2		1	1	2	\N	2022-01-26 15:35:38	2022-01-26 15:35:38			'410':1 'z383l':2	370
254	1149	\N	809.5 P853 D582	\N	\N	0	\N	\N	0	\N	250	2f7a2025-5b2b-4bc4-ac34-3e42283bd29a		1	1	2	\N	2022-01-26 15:40:53	2022-01-26 15:40:53			'809.5':1 'd582':3 'p853':2	1170
255	1150	\N	411 R683O	\N	\N	0	\N	\N	0	\N	245	7c2fb1e2-b06d-49c7-a1fd-5c6caa6d9a29		1	1	2	\N	2022-01-26 15:44:29	2022-01-26 15:44:29			'411':1 'r683o':2	1069
256	1151	\N	413 C653D	\N	\N	0	\N	\N	0	\N	59	d2fe7e2a-18a7-49a6-b556-2a7b24759363		1	1	2	\N	2022-01-26 15:48:25	2022-01-26 15:48:25			'413':1 'c653d':2	1639
257	1152	\N	413 D522	\N	\N	0	\N	\N	0	\N	245	f6fb6359-09db-4c49-8ce3-1e8984054a3e		1	1	2	\N	2022-01-26 15:52:09	2022-01-26 15:52:09			'413':1 'd522':2	1672
258	1153	\N	4149	\N	\N	0	\N	\N	0	\N	245	6f46d910-2b31-419d-b332-e8ac884470aa		1	1	2	\N	2022-01-26 15:56:02	2022-01-26 15:56:02			'4149':1	1420
259	1154	\N	413.21 O936 2002	\N	\N	0	\N	\N	0	\N	64	8d793b83-a7ea-41fa-bc0a-b76492c696ed		1	1	2	\N	2022-01-26 16:01:08	2022-01-26 16:01:08			'2002':3 '413.21':1 'o936':2	461
260	1155	\N	413.21 D528 2005	\N	\N	0	\N	\N	0	\N	59	07e2b405-9932-46fa-90c7-34ca1a2172ae		1	1	2	\N	2022-01-26 16:05:08	2022-01-26 16:05:08			'2005':3 '413.21':1 'd528':2	1414
261	1156	\N	413.21 D522 2008	\N	\N	0	\N	\N	0	\N	59	22792e26-9196-400f-801c-129e46034d6e		1	1	2	\N	2022-01-26 16:09:32	2022-01-26 16:09:32			'2008':3 '413.21':1 'd522':2	267
262	1157	\N	413.21 D528	\N	\N	0	\N	\N	0	\N	245	acf3f5f7-88bd-4e13-99a9-3ad0135b29cf		1	1	2	\N	2022-01-26 16:14:01	2022-01-26 16:14:01			'413.21':1 'd528':2	460
263	1158	\N	413 D649D	\N	\N	0	\N	\N	0	\N	245	a7341155-f6a6-4c15-885d-e40c85bb08f1		1	1	2	\N	2022-01-26 16:17:46	2022-01-26 16:17:46			'413':1 'd649d':2	1045
264	1159	\N	428.007 I546	\N	\N	0	\N	\N	0	\N	245	26a0fafa-bceb-4744-8985-cbe0d871a5c5		1	1	2	\N	2022-01-26 16:24:21	2022-01-26 16:24:21			'428.007':1 'i546':2	456
265	1160	\N	428.007 W665B	\N	\N	0	\N	\N	0	\N	245	81ab3017-8f04-4f91-a4bc-dcbdae7ad71c		1	1	2	\N	2022-01-26 16:27:06	2022-01-26 16:27:06			'428.007':1 'w665b':2	1130
266	1161	\N	340 T784L 2004	\N	\N	0	\N	\N	0	\N	82	15051e5d-5ffd-4367-9983-604f8c680d87		1	1	2	\N	2022-01-27 13:26:50	2022-01-27 13:26:50			'2004':3 '340':1 't784l':2	295
267	1162	\N	340.07 C635 2002	\N	\N	0	\N	\N	0	\N	245	4b2cecb7-f3e5-4baa-a64b-3989a19c90cc		1	1	2	\N	2022-01-27 13:35:38	2022-01-27 13:35:38			'2002':3 '340.07':1 'c635':2	313
268	1164	\N	340.54 C658	\N	\N	0	\N	\N	0	\N	245	d1327154-a63e-44ec-9ae1-c152ad329196		1	1	2	\N	2022-01-27 13:44:50	2022-01-27 13:44:50			'340.54':1 'c658':2	314
269	1165	\N	340.54 F733	\N	\N	0	\N	\N	0	\N	179	716cd41c-7808-44d2-9d8e-1d71bb95bb09		1	1	2	\N	2022-01-27 13:54:31	2022-01-27 13:54:31			'340.54':1 'f733':2	319
270	1166	\N	340.54 L527	\N	\N	0	\N	\N	0	\N	179	5b644e81-245f-465e-aa76-19f4b0e04b47		1	1	2	\N	2022-01-27 13:58:08	2022-01-27 13:58:08			'340.54':1 'l527':2	320
271	1167	\N	340.54 U558	\N	\N	0	\N	\N	0	\N	179	685d54bc-e4e5-4351-a9c6-2ad626030cf9		1	1	2	\N	2022-01-27 14:01:21	2022-01-27 14:01:21			'340.54':1 'u558':2	315
272	1168	\N	340.54 V558 1995	\N	\N	0	\N	\N	0	\N	179	ac2bd16c-1918-40f0-b5bf-ba64e2319d24		1	1	2	\N	2022-01-27 14:05:25	2022-01-27 14:05:25			'1995':3 '340.54':1 'v558':2	316
273	1169	\N	340.87 C658	\N	\N	0	\N	\N	0	\N	245	1b88acfd-b83a-4dbe-b260-1738b3f4aa84		1	1	2	\N	2022-01-27 14:12:12	2022-01-27 14:12:12			'340.87':1 'c658':2	272
275	1171	\N	004.6 T354R	\N	\N	0	\N	\N	0	\N	75	2b837ffe-b679-47b6-8eda-22dc02cfda36		1	1	2	\N	2022-01-27 14:23:37	2022-01-27 14:23:37			'004.6':1 't354r':2	1796
276	1172	\N	005.1 P748I 2005	\N	\N	0	\N	\N	0	\N	245	4b8c7fe5-e12e-427a-824a-ada512f7c244		1	1	2	\N	2022-01-27 15:50:47	2022-01-27 15:50:47			'005.1':1 '2005':3 'p748i':2	1040
277	1173	\N	004.6 T473R	\N	\N	0	\N	\N	0	\N	213	7bb52215-6b19-4fba-a7de-e88b4ac7351b		1	1	2	\N	2022-01-27 16:01:34	2022-01-27 16:01:34			'004.6':1 't473r':2	1710
278	1174	\N	005.1 K455A 2005	\N	\N	0	\N	\N	0	\N	245	531c4a5b-363c-49e9-a168-a9e5ba7b66d6		1	1	2	\N	2022-01-27 16:05:09	2022-01-27 16:05:09			'005.1':1 '2005':3 'k455a':2	1120
279	1175	\N	005.1 M486	\N	\N	0	\N	\N	0	\N	245	e5cdc0b2-8fba-43a1-b7c7-f10d0213b9a7		1	1	2	\N	2022-01-27 16:06:59	2022-01-27 16:06:59			'005.1':1 'm486':2	1138
280	1176	\N	005.1 P474A 2007	\N	\N	0	\N	\N	0	\N	245	e6efb295-3c7c-4487-b6bc-1f4c17c36c94		1	1	2	\N	2022-01-27 16:09:00	2022-01-27 16:09:00			'005.1':1 '2007':3 'p474a':2	1090
281	1177	\N	415 P544A 1982	\N	\N	0	\N	\N	0	\N	179	351b66c7-ec58-4194-8220-69c6500dc428		1	1	2	\N	2022-01-27 16:17:13	2022-01-27 16:17:13			'1982':3 '415':1 'p544a':2	354
282	1178	\N	415 B456B	\N	\N	0	\N	\N	0	\N	179	f0a14bc0-5d20-4990-b78e-d398bad6c4ad		1	1	2	\N	2022-01-27 16:25:23	2022-01-27 16:25:23			'415':1 'b456b':2	366
283	1179	\N	414.6 H325	\N	\N	0	\N	\N	0	\N	179	80797370-ea0e-492a-8a81-ef88fa361a1f		1	1	2	\N	2022-01-27 16:28:56	2022-01-27 16:28:56			'414.6':1 'h325':2	363
284	1180	\N	415 P353S	\N	\N	0	\N	\N	0	\N	179	797283e5-c99b-418b-bcfb-0a5b19d36126		1	1	2	\N	2022-01-27 16:31:22	2022-01-27 16:31:22			'415':1 'p353s':2	357
285	1181	\N	415 R643C	\N	\N	0	\N	\N	0	\N	179	f75ffe1a-9602-4762-83b8-8577c4fb38f7		1	1	2	\N	2022-01-27 16:37:49	2022-01-27 16:37:49			'415':1 'r643c':2	362
286	1183	\N	415 M494V	\N	\N	0	\N	\N	0	\N	179	1d1f6814-9447-4faa-98c0-f245e6159562		1	1	2	\N	2022-01-27 16:47:06	2022-01-27 16:47:06			'415':1 'm494v':2	420
287	1184	\N	415 L853S	\N	\N	0	\N	\N	0	\N	179	8ff25942-827d-402e-a926-b297df6f25b3		1	1	2	\N	2022-01-27 16:50:13	2022-01-27 16:50:13			'415':1 'l853s':2	359
288	1185	\N	415 L664E	\N	\N	0	\N	\N	0	\N	179	4f7b2156-c922-481a-bf46-502cfc9fe734		1	1	2	\N	2022-01-27 16:53:41	2022-01-27 16:53:41			'415':1 'l664e':2	350
290	1187	\N	\N	\N	415 H477N	0	\N	\N	0	\N	179	8505b5fd-ecf4-4f5b-b0eb-75174d99dbb9		1	1	2	\N	2022-01-31 13:54:30	2022-01-31 13:54:30			'415':1 'h477n':2	3175
291	1188	\N	414 L664E	\N	\N	0	\N	\N	0	\N	245	331bfd97-f050-4fa1-9f64-0c4addde05d7		1	1	2	\N	2022-01-31 18:50:06	2022-01-31 18:50:06			'414':1 'l664e':2	364
294	1189	\N	418.02 B733 P845	\N	\N	0	\N	\N	0	\N	245	ce7e0cce-f278-4e94-83bc-c59bbb3ad3da		1	1	2	\N	2022-01-31 18:53:09	2022-01-31 18:53:19			'418.02':1 'b733':2 'p845':3	351
296	1190	\N	417.7 L664H	\N	\N	0	\N	\N	0	\N	179	cc5e0bcd-f55b-4b01-8b8d-cde1dd09597c		1	1	2	\N	2022-01-31 18:58:44	2022-01-31 18:58:44			'417.7':1 'l664h':2	353
297	1191	\N	417.7 H588	\N	\N	0	\N	\N	0	\N	245	a2783598-e456-4866-a661-446ff6a38d20		1	1	2	\N	2022-01-31 19:02:25	2022-01-31 19:02:25			'417.7':1 'h588':2	352
298	1192	\N	\N	\N	417.7 G885S	0	\N	\N	0	\N	245	39314cdf-95ac-470b-9379-091784bd7744		1	1	2	\N	2022-01-31 19:04:21	2022-01-31 19:04:21			'417.7':1 'g885s':2	346
299	1193	\N	417.7 C656F	\N	\N	0	\N	\N	0	\N	179	bc54ecb4-4ac5-43df-bf9d-a53bba807be0		1	1	2	\N	2022-02-01 14:36:26	2022-02-01 14:36:26			'417.7':1 'c656f':2	347
300	1194	\N	417.7 C352	\N	\N	0	\N	\N	0	\N	179	2d2a0eed-427d-4897-a8fd-945ae320c8ef		1	1	2	\N	2022-02-01 14:37:55	2022-02-01 14:37:55			'417.7':1 'c352':2	348
301	1195	\N	417.2 V473T	\N	\N	0	\N	\N	0	\N	179	28f43316-72d1-413e-a181-9127024ec9a5		1	1	2	\N	2022-02-01 14:46:16	2022-02-01 14:46:16			'417.2':1 'v473t':2	349
302	1196	\N	417 E967	\N	\N	0	\N	\N	0	\N	245	7a54e9dd-2de5-44f9-8c66-abae721e076f		1	1	2	\N	2022-02-01 14:48:45	2022-02-01 14:49:21			'417':1 'e967':2	1407
304	1199	\N	341. 750 6 B684P	\N	\N	0	\N	\N	0	\N	60	6f23e442-5b21-446c-bce9-7390a7b8381a		1	1	2	\N	2022-02-01 14:59:06	2022-02-01 14:59:06			'341':1 '6':3 '750':2 'b684p':4	240
305	1200	\N	341.481 B482D	\N	\N	0	\N	\N	0	\N	179	1fc34d90-a9a2-4631-b056-3536f474b0c6		1	1	2	\N	2022-02-01 15:01:54	2022-02-01 15:01:54			'341.481':1 'b482d':2	1435
306	1201	\N	341.7 R566T	\N	\N	0	\N	\N	0	\N	60	d90c3669-d28c-4513-81b9-2a993cf40e78		1	1	2	\N	2022-02-01 15:03:43	2022-02-01 15:03:43			'341.7':1 'r566t':2	1409
274	1170	\N	004.6 S988G 2004	\N	00079	0	\N	\N	0	\N	245	8a1b0d46-8e35-458a-a63b-e1d9f97d9746		1	1	2	\N	2022-01-27 14:19:27	2022-02-08 14:39:36			'00079':4 '004.6':1 '2004':3 's988g':2	1088
289	1186	\N	154.63 L853 F887	\N	00378	0	\N	\N	0	\N	179	fb4916c7-71ec-48b4-b403-e5cf276abba7		1	1	2	\N	2022-01-27 16:56:10	2022-02-08 17:14:56			'00378':4 '154.63':1 'f887':3 'l853':2	66
307	1202	\N	341.754 L664C	\N	\N	0	\N	\N	0	\N	60	13c8e2c9-6603-41e0-b08d-4168bf0c2f2c		1	1	2	\N	2022-02-01 15:08:39	2022-02-01 15:08:39			'341.754':1 'l664c':2	1564
308	1203	\N	341.754 B685M 2003	\N	\N	0	\N	\N	0	\N	60	3d035332-cf42-40d1-8d76-cd5e2ee16bea		1	1	2	\N	2022-02-01 15:32:25	2022-02-01 15:32:25			'2003':3 '341.754':1 'b685m':2	239
309	1204	\N	341.754 M655P.	\N	\N	0	\N	\N	0	\N	241	a632d731-3075-4f4e-8f88-e3ed948df3c7		1	1	2	\N	2022-02-01 15:34:45	2022-02-01 15:34:45			'341.754':1 'm655p':2	1557
311	1206	\N	341.841 D474	\N	\N	0	\N	\N	0	\N	179	20c9362f-e0e6-4d76-bbe8-2697987ff51f		1	1	2	\N	2022-02-01 15:55:19	2022-02-01 15:55:19			'341.841':1 'd474':2	1436
312	1207	\N	342 A784D	\N	\N	0	\N	\N	0	\N	245	a5728f6f-62ec-4942-bd20-6d95d8ed4359		1	1	2	\N	2022-02-01 15:57:26	2022-02-01 15:57:26			'342':1 'a784d':2	265
313	1208	\N	342.02 C658 2005	\N	\N	0	\N	\N	0	\N	245	861e2fa9-9e9f-4728-bbdb-70b2cd59aeeb		1	1	2	\N	2022-02-01 15:59:44	2022-02-01 15:59:44			'2005':3 '342.02':1 'c658':2	286
314	1209	\N	342.068 0554D 2001	\N	\N	0	\N	\N	0	\N	245	49f03a79-c929-4ed6-ba18-ea4f42f4ad8b		1	1	2	\N	2022-02-01 16:02:03	2022-02-01 16:02:03			'0554d':2 '2001':3 '342.068':1	279
315	1210	\N	005.13 I785I 2008	\N	\N	0	\N	\N	0	\N	245	b79122a7-0f86-45fb-a4ed-596dff9869f8		1	1	2	\N	2022-02-01 16:28:07	2022-02-01 16:28:07			'005.13':1 '2008':3 'i785i':2	1063
316	1211	\N	005.2 A523C	\N	\N	0	\N	\N	0	\N	245	4ebc72a6-5bd3-41ee-95a2-3340c1d1a988		1	1	2	\N	2022-02-01 16:32:09	2022-02-01 16:32:09			'005.2':1 'a523c':2	1516
317	1212	\N	005.2 C762J	\N	\N	0	\N	\N	0	\N	245	a5194a97-432c-492d-bfb5-62ad44650de9		1	1	2	\N	2022-02-02 14:27:04	2022-02-02 14:27:04			'005.2':1 'c762j':2	1519
318	1213	\N	005.2 F535J	\N	\N	0	\N	\N	0	\N	245	a06346fb-c446-47e4-a290-244ec904b5e5		1	1	2	\N	2022-02-02 14:30:14	2022-02-02 14:30:14			'005.2':1 'f535j':2	1521
319	1214	\N	005.3 G488	\N	\N	0	\N	\N	0	\N	245	3f7827af-0986-4cb1-88c5-65f61716e21b		1	1	2	\N	2022-02-02 14:36:19	2022-02-02 14:36:19			'005.3':1 'g488':2	1123
320	1215	\N	005.3 L353P	\N	\N	0	\N	\N	0	\N	245	91efce47-83c3-4518-bc53-30ee93a4a73c		1	1	2	\N	2022-02-02 14:42:14	2022-02-02 14:42:14			'005.3':1 'l353p':2	1426
321	1216	\N	005.3 R463	\N	\N	0	\N	\N	0	\N	245	42f803c9-bc37-41b0-bd99-59cfaa521e95		1	1	2	\N	2022-02-02 14:44:20	2022-02-02 14:44:20			'005.3':1 'r463':2	1124
322	1218	\N	808.83 G377 R428	\N	\N	0	\N	\N	0	\N	245	460f6232-9de5-4edd-8047-ac5bfdfb6372		1	1	2	\N	2022-02-02 14:53:17	2022-02-02 14:53:17			'808.83':1 'g377':2 'r428':3	1268
323	1219	\N	005.5 R552T	\N	\N	0	\N	\N	0	\N	245	03cf99bd-dd72-44eb-9c55-988cf18295c8		1	1	2	\N	2022-02-02 14:56:05	2022-02-02 14:56:05			'005.5':1 'r552t':2	1514
324	1220	\N	005.6 H544A	\N	\N	0	\N	\N	0	\N	245	2b52884b-5c8d-49df-8b83-c521ecda6e37		1	1	2	\N	2022-02-02 14:58:47	2022-02-02 14:58:47			'005.6':1 'h544a':2	1517
325	1221	\N	005.74 D483	\N	\N	0	\N	\N	0	\N	213	fee29460-14e0-4ee8-a990-3f8fbaa1257f		1	1	2	\N	2022-02-02 15:40:42	2022-02-02 15:40:42			'005.74':1 'd483':2	1604
326	1222	\N	420 N488	\N	\N	0	\N	\N	0	\N	64	90c8a8c4-e267-4606-be0d-4eef94d0281d		1	1	2	\N	2022-02-03 13:45:57	2022-02-03 13:45:57			'420':1 'n488':2	449
329	1225	\N	420.1 C655 1986	\N	\N	0	\N	\N	0	\N	245	1d367f4e-382d-4603-a60e-54c4cbf0634d		1	1	2	\N	2022-02-03 13:56:23	2022-02-03 13:56:23			'1986':3 '420.1':1 'c655':2	1483
330	1226	\N	420.1 H485A 2005	\N	\N	0	\N	\N	0	\N	245	f41e50cd-2502-48d5-8f25-f0dab2e88599		1	1	2	\N	2022-02-03 14:00:43	2022-02-03 14:00:43			'2005':3 '420.1':1 'h485a':2	1112
331	1227	\N	420.1 M876B 2002	\N	\N	0	\N	\N	0	\N	245	cfe41386-64c8-4761-930b-d2b5486902dd		1	1	2	\N	2022-02-03 14:03:18	2022-02-03 14:03:18			'2002':3 '420.1':1 'm876b':2	1114
332	1228	\N	420.1 M876E 2004	\N	\N	0	\N	\N	0	\N	245	6be08355-b3d4-41a8-864a-c15cc82b88c8		1	1	2	\N	2022-02-03 14:08:27	2022-02-03 14:10:59			'2004':3 '420.1':1 'm876e':2	1119
333	1229	\N	420.1 M876G 2000	\N	\N	0	\N	\N	0	\N	245	185cc556-817b-47fe-92c3-6b44d41150c7		1	1	2	\N	2022-02-03 14:14:54	2022-02-03 14:14:54			'2000':3 '420.1':1 'm876g':2	1113
334	1230	\N	420.974 152 C673	\N	\N	0	\N	\N	0	\N	245	9c751b1b-2593-4cfa-bb98-156506c93db2		1	1	2	\N	2022-02-03 15:12:54	2022-02-03 15:12:54			'152':2 '420.974':1 'c673':3	344
337	1231	\N	421 G739E 1993	\N	\N	0	\N	\N	0	\N	245	8b6bf210-7b92-4e4b-9014-823e602aa3e3		1	1	2	\N	2022-02-03 15:22:40	2022-02-03 15:22:40			'1993':3 '421':1 'g739e':2	1482
339	1233	\N	421 I587	\N	\N	0	\N	\N	0	\N	245	f0ba9905-5f98-428f-aa7a-e2a4218e81a7		1	1	2	\N	2022-02-03 15:40:02	2022-02-03 15:40:02			'421':1 'i587':2	450
342	1236	\N	421 S883	\N	\N	0	\N	\N	0	\N	245	10958e69-c88e-4f23-b699-c2d9d7279699		1	1	2	\N	2022-02-03 15:44:49	2022-02-03 15:44:49			'421':1 's883':2	432
344	1237	\N	421 S883	\N	\N	0	\N	\N	0	\N	245	f354b8cf-54a1-40e2-a241-851ac0fc2cf8		1	1	2	\N	2022-02-03 15:47:18	2022-02-03 15:47:18			'421':1 's883':2	434
345	1238	\N	428.007 S868A	\N	\N	0	\N	\N	0	\N	245	9505a796-baf8-4de1-9fed-aab62dc4a8ec		1	1	2	\N	2022-02-03 15:52:22	2022-02-03 15:52:22			'428.007':1 's868a':2	1098
346	1239	\N	428 W568S	\N	\N	0	\N	\N	0	\N	245	9765738a-5708-47bf-83e9-923a2f132cfc		1	1	2	\N	2022-02-03 15:55:28	2022-02-03 15:55:28			'428':1 'w568s':2	1129
347	1240	\N	342.3 M358D 1964	\N	\N	0	\N	\N	0	\N	245	79bfa2fe-cdf8-4ffc-870a-0e12011f28a6		1	1	2	\N	2022-02-03 16:01:31	2022-02-03 16:01:31			'1964':3 '342.3':1 'm358d':2	297
348	1241	\N	342.3 P553D 2008	\N	\N	0	\N	\N	0	\N	82	a07bd722-c50d-48d7-9b22-107ed443a1ff		1	1	2	\N	2022-02-03 16:04:40	2022-02-03 16:04:40			'2008':3 '342.3':1 'p553d':2	1135
349	1242	\N	342.3 T453D 2006	\N	\N	0	\N	\N	0	\N	82	5d4b147b-7c1b-4db2-91d7-289366c737d2		1	1	2	\N	2022-02-03 21:05:59	2022-02-03 21:05:59			'2006':3 '342.3':1 't453d':2	1134
350	1243	\N	342.6 R353D	\N	\N	0	\N	\N	0	\N	245	e68fdd9e-0151-423d-816f-e137f3f112b4		1	1	2	\N	2022-02-03 21:07:35	2022-02-03 21:07:35			'342.6':1 'r353d':2	288
351	1245	\N	342.7263029 T323 1991	\N	\N	0	\N	\N	0	\N	245	38f82610-c7c0-404f-b780-b5a024b3d596		1	1	2	\N	2022-02-03 21:10:51	2022-02-03 21:10:51			'1991':3 '342.7263029':1 't323':2	278
352	1246	\N	440 D826	\N	\N	0	\N	\N	0	\N	59	44e1620f-d692-470c-a437-e41b4be1c51e		1	1	2	\N	2022-02-04 13:48:15	2022-02-04 13:48:15			'440':1 'd826':2	421
353	1247	\N	428.2 S637A 2003	\N	\N	0	\N	\N	0	\N	64	54218d2c-e82a-4360-a356-72c70267800c		1	1	2	\N	2022-02-04 13:54:17	2022-02-04 13:54:17			'2003':3 '428.2':1 's637a':2	917
354	1248	\N	428.3028 R524T 2003	\N	\N	0	\N	\N	0	\N	64	f3c28f63-98f3-4561-a573-24116ad1d19f		1	1	2	\N	2022-02-04 14:02:23	2022-02-04 14:02:23			'2003':3 '428.3028':1 'r524t':2	1102
355	1249	\N	428.007 T687	\N	\N	0	\N	\N	0	\N	64	7f6c971a-c19f-4ad2-a570-607e7e53b88e		1	1	2	\N	2022-02-04 14:04:25	2022-02-04 14:04:25			'428.007':1 't687':2	1477
356	1250	\N	428.2 S637A 2005	\N	\N	0	\N	\N	0	\N	64	c1a29063-38c8-472e-a2c3-389f872b2faf		1	1	2	\N	2022-02-04 14:06:23	2022-02-04 14:06:23			'2005':3 '428.2':1 's637a':2	423
357	1251	\N	428.2 S883	\N	00892	0	\N	\N	0	\N	245	741cae3a-182b-4aa5-8fc8-135033ff348d		1	1	2	\N	2022-02-04 14:08:43	2022-02-04 14:17:01			'00892':3 '428.2':1 's883':2	440
358	1251	\N	428.2 S883	\N	00893	0	\N	\N	0	\N	245	e8b98014-5711-44c5-a3d4-06e5de4fe0f9		1	1	2	\N	2022-02-04 14:17:21	2022-02-04 14:17:21			'00893':3 '428.2':1 's883':2	440
338	1232	\N	421 H357A	\N	00861	0	\N	\N	0	\N	245	78c969b1-c016-4aeb-8dc0-3df26d13ff45		1	1	2	\N	2022-02-03 15:37:54	2022-02-08 14:36:23			'00861':3 '421':1 'h357a':2	428
327	1223	\N	421 A534A	\N	04308	0	\N	\N	0	\N	245	4c604a48-cd6c-4d65-9607-bee979c261e8		1	1	2	\N	2022-02-03 13:49:33	2022-02-08 14:51:21			'04308':3 '421':1 'a534a':2	719
310	1205	\N	341.762 G454 2003	\N	02627	0	\N	\N	0	\N	82	2b5b5653-ccc6-4b5b-81ce-760e7f74df67		1	1	2	\N	2022-02-01 15:41:10	2022-02-08 17:15:18			'02627':4 '2003':3 '341.762':1 'g454':2	192
359	1252	\N	428.2 S883	\N	00896	0	\N	\N	0	\N	245	eea51e3c-13d9-427b-971c-3b364ccf06a3		1	1	2	\N	2022-02-04 14:19:18	2022-02-04 14:19:18			'00896':3 '428.2':1 's883':2	442
360	1252	\N	428.2 S883	\N	00897	0	\N	\N	0	\N	245	303e9ee9-c71a-4b18-af3d-0ab2b929c786		1	1	2	\N	2022-02-04 14:19:40	2022-02-04 14:19:40			'00897':3 '428.2':1 's883':2	442
361	1253	\N	428.2 S883	\N	00902	0	\N	\N	0	\N	245	61801acc-539b-4a16-9dc8-323aba7cf513		1	1	2	\N	2022-02-04 14:22:10	2022-02-04 14:22:10			'00902':3 '428.2':1 's883':2	445
362	1253	\N	428.2 S883	\N	00903	0	\N	\N	0	\N	245	242241b6-f3ab-4467-961f-b798d1da1900		1	1	2	\N	2022-02-04 14:22:29	2022-02-04 14:22:29			'00903':3 '428.2':1 's883':2	445
363	1254	\N	428.2 S883	\N	00904	0	\N	\N	0	\N	245	387438d4-653a-4a19-97ba-dea649169f09		1	1	2	\N	2022-02-04 14:24:27	2022-02-04 14:24:27			'00904':3 '428.2':1 's883':2	446
364	1254	\N	428.2 S883	\N	00905	0	\N	\N	0	\N	245	040fbf52-44c2-4087-ab3f-60994002ea11		1	1	2	\N	2022-02-04 14:24:44	2022-02-04 14:24:44			'00905':3 '428.2':1 's883':2	446
366	1255	\N	428.2 W674	\N	00895	0	\N	\N	0	\N	245	84d5a072-05bd-4834-b31c-90aa7230a110		1	1	2	\N	2022-02-04 14:27:03	2022-02-04 14:27:03			'00895':3 '428.2':1 'w674':2	\N
365	1255	\N	428.2 W674	\N	00894	0	\N	\N	0	\N	245	fe928d3b-dff8-4255-846e-15db92ebd63d		1	1	2	\N	2022-02-04 14:26:48	2022-02-04 14:27:09			'00894':3 '428.2':1 'w674':2	441
367	1256	\N	428.2 W674	\N	00898	0	\N	\N	0	\N	245	b686ec4c-ce20-4db3-8f39-686d6ec54341		1	1	2	\N	2022-02-04 14:29:20	2022-02-04 14:29:20			'00898':3 '428.2':1 'w674':2	443
368	1256	\N	428.2 W674	\N	00899	0	\N	\N	0	\N	245	4111f1f0-d246-44d7-ba54-9f54ed3d495a		1	1	2	\N	2022-02-04 14:29:36	2022-02-04 14:29:36			'00899':3 '428.2':1 'w674':2	443
369	1257	\N	428.2 W674	\N	00900	0	\N	\N	0	\N	245	4514cde3-04c9-469f-84ee-1976f036f597		1	1	2	\N	2022-02-04 15:25:08	2022-02-04 15:25:08			'00900':3 '428.2':1 'w674':2	444
370	1257	\N	428.2 W674	\N	00901	0	\N	\N	0	\N	245	e29aca69-2c2f-4f89-a8d6-7e9058084974		1	1	2	\N	2022-02-04 15:25:23	2022-02-04 15:25:23			'00901':3 '428.2':1 'w674':2	444
120	999	\N	001.42 A537D	\N	00002	0	\N	\N	0	\N	245	80ac46a3-dc10-4c89-9272-566724d74423		1	1	2	\N	2022-01-04 19:52:20	2022-02-08 14:14:52			'00002':3 '001.42':1 'a537d':2	\N
119	998	\N	001.42 A534T 1990 001.42 A534T	\N	00001	0	\N	\N	0	\N	244	ce6162ba-524c-4979-9dd6-9f6dd6be43b3		1	1	2	\N	2022-01-04 19:45:46	2022-02-08 14:16:18			'00001':6 '001.42':1,4 '1990':3 'a534t':2,5	1
372	1009	\N	001.42 M472C 2008	\N	02841	0	\N	\N	0	\N	245	f6399286-2f36-4c79-a207-06fa48b44e3c		1	1	2	\N	2022-02-08 14:21:55	2022-02-08 14:21:55			'001.42':1 '02841':4 '2008':3 'm472c':2	676
373	1009	\N	001.42 M472C 2008	\N	02842	0	\N	\N	0	\N	245	7a2b67a3-7caf-49e6-8d6b-72c97b8b8d8b		1	1	2	\N	2022-02-08 14:22:09	2022-02-08 14:22:09			'001.42':1 '02842':4 '2008':3 'm472c':2	676
374	1009	\N	001.42 M472C 2008	\N	02843	0	\N	\N	0	\N	245	99bd8186-2938-4736-ba45-63a2a2406448		1	1	2	\N	2022-02-08 14:22:32	2022-02-08 14:22:32			'001.42':1 '02843':4 '2008':3 'm472c':2	676
375	1009	\N	001.42 M472C 2008	\N	02844	0	\N	\N	0	\N	245	d4c0165f-59dc-4a60-8751-42e1cff0135a		1	1	2	\N	2022-02-08 14:22:54	2022-02-08 14:22:54			'001.42':1 '02844':4 '2008':3 'm472c':2	676
376	1009	\N	001.42 M472C 2008	\N	02845	0	\N	\N	0	\N	245	4a99c582-ad98-4405-8f24-50eb1f8cc8b2		1	1	2	\N	2022-02-08 14:23:12	2022-02-08 14:23:12			'001.42':1 '02845':4 '2008':3 'm472c':2	676
377	1009	\N	001.42 M472C 2008	\N	02846	0	\N	\N	0	\N	245	8c2fdfcb-4dc0-452b-9b1a-14ae33870cde		1	1	2	\N	2022-02-08 14:23:27	2022-02-08 14:23:27			'001.42':1 '02846':4 '2008':3 'm472c':2	676
189	1072	\N	421 W674	\N	00906	0	\N	\N	0	\N	245	3f77be36-041d-4710-9543-4c62ec385596		1	1	2	\N	2022-01-15 00:07:03	2022-02-08 14:24:17			'00906':3 '421':1 'w674':2	447
378	1072	\N	421 W674	\N	00907	0	\N	\N	0	\N	245	f43efcfa-1d20-4c0d-b54d-99ac38f7c66a		1	1	2	\N	2022-02-08 14:24:29	2022-02-08 14:24:29			'00907':3 '421':1 'w674':2	447
303	1197	\N	425 W475A 1996	\N	00862	0	\N	\N	0	\N	245	d61de7ca-a714-41be-977c-cdeddf4318b0		1	1	2	\N	2022-02-01 14:53:08	2022-02-08 14:34:08			'00862':4 '1996':3 '425':1 'w475a':2	429
181	1063	\N	421 W435A	\N	00860	0	\N	\N	0	\N	245	2019f6d5-0047-4da6-a88b-ac5ca811f39a		1	1	2	\N	2022-01-14 23:50:16	2022-02-08 14:34:25			'00860':3 '421':1 'w435a':2	427
328	1224	\N	421 B538A 1996	\N	00858	0	\N	\N	0	\N	245	97a40bc3-2d5b-4123-88d0-c65f3b31f0b3		1	1	2	\N	2022-02-03 13:53:26	2022-02-08 14:34:49			'00858':4 '1996':3 '421':1 'b538a':2	425
341	1234	\N	421 K445A	\N	00859	0	\N	\N	0	\N	245	4a9ec92d-665c-4c8f-a5f8-35bf7c7d82d3		1	1	2	\N	2022-02-03 15:41:49	2022-02-08 14:38:56			'00859':3 '421':1 'k445a':2	426
379	1170	\N	004.6 S988G 2004	\N	00080	0	\N	\N	0	\N	245	8f7627ac-60bc-4a9d-af10-b9dc0da6960d		1	1	2	\N	2022-02-08 14:40:02	2022-02-08 14:40:02			'00080':4 '004.6':1 '2004':3 's988g':2	1088
380	1170	\N	004.6 S988G 2004	\N	00081	0	\N	\N	0	\N	245	545b810d-1860-44fd-a0a4-5f41875686b3		1	1	2	\N	2022-02-08 14:40:16	2022-02-08 14:40:16			'00081':4 '004.6':1 '2004':3 's988g':2	1088
381	1170	\N	004.6 S988G 2004	\N	00082	0	\N	\N	0	\N	245	ca5f3811-2af5-49f1-8c5c-b9fd90d5e562		1	1	2	\N	2022-02-08 14:40:37	2022-02-08 14:40:37			'00082':4 '004.6':1 '2004':3 's988g':2	1088
382	1170	\N	004.6 S988G 2004	\N	00083	0	\N	\N	0	\N	245	683ca6c1-47c0-49f3-85c1-894d3190b82f		1	1	2	\N	2022-02-08 14:41:00	2022-02-08 14:41:00			'00083':4 '004.6':1 '2004':3 's988g':2	1088
383	1170	\N	004.6 S988G 2004	\N	00084	0	\N	\N	0	\N	245	892d9fb6-6e24-4699-ace8-7f112a460996		1	1	2	\N	2022-02-08 14:41:29	2022-02-08 14:41:29			'00084':4 '004.6':1 '2004':3 's988g':2	1088
384	1170	\N	004.6 S988G 2004	\N	00085	0	\N	\N	0	\N	245	3e6cc4b0-a27f-4926-babf-07cd5dc5a118		1	1	2	\N	2022-02-08 14:41:59	2022-02-08 14:41:59			'00085':4 '004.6':1 '2004':3 's988g':2	1088
385	1170	\N	004.6 S988G 2004	\N	00086	0	\N	\N	0	\N	245	9ff58f1f-b60e-4bd7-b049-37810daeae35		1	1	2	\N	2022-02-08 14:42:31	2022-02-08 14:42:31			'00086':4 '004.6':1 '2004':3 's988g':2	1088
386	1170	\N	004.6 S988G 2004	\N	00087	0	\N	\N	0	\N	245	70ddc066-6412-422f-8fc8-19cf806ace81		1	1	2	\N	2022-02-08 14:43:21	2022-02-08 14:43:21			'00087':4 '004.6':1 '2004':3 's988g':2	1088
387	1170	\N	004.6 S988G 2004	\N	00088	0	\N	\N	0	\N	245	d885f98f-a0cb-44cd-af8f-877465d856c8		1	1	2	\N	2022-02-08 14:43:35	2022-02-08 14:43:35			'00088':4 '004.6':1 '2004':3 's988g':2	1088
388	1023	\N	400 A283	\N	00777	0	\N	\N	0	\N	245	ff745349-d9b1-491a-9854-44cc819d619b		1	1	2	\N	2022-02-08 14:47:20	2022-02-08 14:47:20			'00777':3 '400':1 'a283':2	385
389	1024	\N	400 A283	\N	00852	0	\N	\N	0	\N	245	69c529e4-665a-4021-8382-a05057a2b46d		1	1	2	\N	2022-02-08 14:50:56	2022-02-08 14:50:56			'00852':3 '400':1 'a283':2	419
390	1223	\N	421 A534A	\N	004309	0	\N	\N	0	\N	245	25213346-4e46-4dd9-8c32-47c22c9137de		1	1	2	\N	2022-02-08 14:52:44	2022-02-08 14:52:44			'004309':3 '421':1 'a534a':2	719
391	1223	\N	421 A534A	\N	004310	0	\N	\N	0	\N	245	50b333a5-bb45-459b-8f24-7a3b766694be		1	1	2	\N	2022-02-08 14:53:03	2022-02-08 14:53:03			'004310':3 '421':1 'a534a':2	719
392	1223	\N	421 A534A	\N	04311	0	\N	\N	0	\N	245	5692c1db-6023-4aec-86a1-4adf312c25bf		1	1	2	\N	2022-02-08 14:53:37	2022-02-08 14:53:37			'04311':3 '421':1 'a534a':2	719
393	1223	\N	421 A534A	\N	04312	0	\N	\N	0	\N	245	1f53296c-3213-4f79-93b6-3f056c05463f		1	1	2	\N	2022-02-08 14:54:17	2022-02-08 14:54:17			'04312':3 '421':1 'a534a':2	719
394	999	\N	001.42 A537D	\N	00003	0	\N	\N	0	\N	245	bca3f090-d93d-41c4-ab7a-7cdb4e84f548		1	1	2	\N	2022-02-08 14:56:35	2022-02-08 14:56:35			'00003':3 '001.42':1 'a537d':2	2
395	1000	\N	001.42 A537G 2003	\N	00005	0	\N	\N	0	\N	245	42887846-2d85-43d7-b8b9-c9b3a946211b		1	1	2	\N	2022-02-08 14:57:16	2022-02-08 14:57:16			'00005':4 '001.42':1 '2003':3 'a537g':2	3
396	1002	\N	001.42 R433	\N	00009	0	\N	\N	0	\N	245	c44c248c-2d4f-4d6a-93dc-097429f84640		1	1	2	\N	2022-02-08 14:58:33	2022-02-08 14:58:33			'00009':3 '001.42':1 'r433':2	6
397	1004	\N	001.539 K323L 1997	\N	00038	0	\N	\N	0	\N	245	d24393af-4faa-4540-bc6d-de9122d335f1		1	1	2	\N	2022-02-08 17:12:17	2022-02-08 17:12:17			'00038':4 '001.539':1 '1997':3 'k323l':2	7
398	1004	\N	001.539 K323L 1997	\N	00039	0	\N	\N	0	\N	245	587c5d11-916f-4d3b-8a03-5a37ab5c79f4		1	1	2	\N	2022-02-08 17:12:33	2022-02-08 17:12:33			'00039':4 '001.539':1 '1997':3 'k323l':2	7
399	1205	\N	341.762 G454 2003	\N	02628	0	\N	\N	0	\N	82	7b37b3f6-9f0f-417d-b890-4b6883f5c328		1	1	2	\N	2022-02-08 17:15:28	2022-02-08 17:15:28			'02628':4 '2003':3 '341.762':1 'g454':2	192
400	840	\N	339 D675M 1991	\N	02421	0	\N	\N	0	\N	97	65711a14-7a5e-4841-bd67-50de045b68b1		1	1	2	\N	2022-02-08 17:17:28	2022-02-08 17:17:28			'02421':4 '1991':3 '339':1 'd675m':2	223
401	1258	\N	344.099 026 L664F	\N	04810	0	\N	\N	0	\N	60	d42b14c1-874c-432c-9e86-e4f4628265ae		1	1	2	\N	2022-02-08 17:37:31	2022-02-08 17:37:31			'026':2 '04810':4 '344.099':1 'l664f':3	1549
402	1258	\N	344.099 026 L664F	\N	04811	0	\N	\N	0	\N	60	77e1558c-97c6-41da-bb3b-f4d2403eff19		1	1	2	\N	2022-02-08 17:37:55	2022-02-08 17:37:55			'026':2 '04811':4 '344.099':1 'l664f':3	04810
403	1258	\N	344.099 026 L664F	\N	04812	0	\N	\N	0	\N	60	ca64ea26-691f-40b8-aa8b-ccccc6627b22		1	1	2	\N	2022-02-08 17:38:06	2022-02-08 17:38:06			'026':2 '04812':4 '344.099':1 'l664f':3	1549
404	1259	\N	006.6 D584	\N	00148	0	\N	\N	0	\N	245	a3e93ba5-754b-4655-8c62-7c2d9c50c850		1	1	2	\N	2022-02-08 18:09:19	2022-02-08 18:09:19			'00148':3 '006.6':1 'd584':2	1041
405	1259	\N	006.6 D584	\N	00149	0	\N	\N	0	\N	245	25d7e9d4-dacf-4e1e-87be-2f900ae1cd61		1	1	2	\N	2022-02-08 18:09:31	2022-02-08 18:09:31			'00149':3 '006.6':1 'd584':2	1041
406	1259	\N	006.6 D584	\N	00150	0	\N	\N	0	\N	245	857d760b-0a50-46e0-99f4-35dfca0d8bdc		1	1	2	\N	2022-02-08 18:09:48	2022-02-08 18:09:48			'00150':3 '006.6':1 'd584':2	1041
408	1259	\N	006.6 D584	\N	00151	0	\N	\N	0	\N	245	e25afc28-3608-4486-9e8a-f8b68bc8408e		1	1	2	\N	2022-02-08 18:10:23	2022-02-08 18:10:23			'00151':3 '006.6':1 'd584':2	1041
409	1259	\N	006.6 D584	\N	00152	0	\N	\N	0	\N	245	302e7682-df7b-40f3-9009-eda9ae2ad5e7		1	1	2	\N	2022-02-08 18:10:40	2022-02-08 18:10:40			'00152':3 '006.6':1 'd584':2	1041
410	1259	\N	006.6 D584	\N	00153	0	\N	\N	0	\N	245	9d74e44f-3d01-40a4-878e-4105e32d015e		1	1	2	\N	2022-02-08 18:11:03	2022-02-08 18:11:03			'00153':3 '006.6':1 'd584':2	1041
411	1259	\N	006.6 D584	\N	00154	0	\N	\N	0	\N	245	668028c9-fd2b-481b-a14d-e2a3e35eccb1		1	1	2	\N	2022-02-08 18:11:16	2022-02-08 18:11:16			'00154':3 '006.6':1 'd584':2	1041
412	1259	\N	006.6 D584	\N	00155	0	\N	\N	0	\N	245	025aff43-e7e4-4436-9019-c7b9f7d74d02		1	1	2	\N	2022-02-08 18:11:30	2022-02-08 18:11:30			'00155':3 '006.6':1 'd584':2	1041
413	1259	\N	006.6 D584	\N	04103	0	\N	\N	0	\N	245	486a6d28-b50f-4452-8062-e6fcd605451a		1	1	2	\N	2022-02-08 18:11:45	2022-02-08 18:11:45			'006.6':1 '04103':3 'd584':2	1041
414	1259	\N	006.6 D584	\N	04104	0	\N	\N	0	\N	245	f660b71e-0e2b-4a4d-a390-352301332a5d		1	1	2	\N	2022-02-08 18:11:57	2022-02-08 18:11:57			'006.6':1 '04104':3 'd584':2	1041
415	1259	\N	006.6 D584	\N	04105	0	\N	\N	0	\N	245	18efd508-6ba5-44a7-a0c6-3a46f2f51213		1	1	2	\N	2022-02-08 18:12:12	2022-02-08 18:12:12			'006.6':1 '04105':3 'd584':2	1041
416	1259	\N	006.6 D584	\N	04512	0	\N	\N	0	\N	245	e9e535e1-fd73-40d5-9c3c-93c88a0db2f0		1	1	2	\N	2022-02-08 18:12:23	2022-02-08 18:12:23			'006.6':1 '04512':3 'd584':2	1041
417	1259	\N	006.6 D584	\N	04513	0	\N	\N	0	\N	245	bf5d7dc9-10bb-49be-b476-562fa4df2896		1	1	2	\N	2022-02-08 18:12:38	2022-02-08 18:12:38			'006.6':1 '04513':3 'd584':2	1041
418	1260	\N	006.7 V383M 2008	\N	00165	0	\N	\N	0	\N	61	020f37db-b315-4393-ae3d-65d9b8ee082d		1	1	2	\N	2022-02-08 18:23:18	2022-02-08 18:23:18			'00165':4 '006.7':1 '2008':3 'v383m':2	1082
419	1260	\N	006.7 V383M 2008	\N	00166	0	\N	\N	0	\N	61	ed7de12c-d002-4df1-8069-5888392c34f5		1	1	2	\N	2022-02-08 18:23:32	2022-02-08 18:23:32			'00166':4 '006.7':1 '2008':3 'v383m':2	1082
420	1260	\N	006.7 V383M 2008	\N	00167	0	\N	\N	0	\N	61	cbb83c9e-6181-495f-8b15-18f86b3fe43d		1	1	2	\N	2022-02-08 18:27:09	2022-02-08 18:27:09			'00167':4 '006.7':1 '2008':3 'v383m':2	1082
421	1260	\N	006.7 V383M 2008	\N	00168	0	\N	\N	0	\N	61	11d0179a-54d1-4376-8a28-a4dbc2275951		1	1	2	\N	2022-02-08 18:27:36	2022-02-08 18:27:36			'00168':4 '006.7':1 '2008':3 'v383m':2	10821082
422	1260	\N	006.7 V383M 2008	\N	00169	0	\N	\N	0	\N	61	cea74975-6853-465c-95e0-90594e4bb04c		1	1	2	\N	2022-02-08 18:27:59	2022-02-08 18:27:59			'00169':4 '006.7':1 '2008':3 'v383m':2	1082
423	1260	\N	006.7 V383M 2008	\N	00170	0	\N	\N	0	\N	61	1c767dd1-3083-4599-b264-11e1ac382bb6		1	1	2	\N	2022-02-08 18:28:16	2022-02-08 18:28:16			'00170':4 '006.7':1 '2008':3 'v383m':2	1082
424	1261	\N	v	\N	01082	0	\N	\N	0	\N	245	0ee7aac4-bf08-4466-a266-7a4c9b71a47a		1	1	2	\N	2022-02-08 19:05:27	2022-02-08 19:05:27			'01082':2 'v':1	542
425	1261	\N	543 Q855 2001	\N	01083	0	\N	\N	0	\N	245	5fcd88f4-c659-4ca4-8f89-2461d2dba9d8		1	1	2	\N	2022-02-08 19:05:40	2022-02-08 19:05:40			'01083':4 '2001':3 '543':1 'q855':2	542
426	1261	\N	543 Q855 2001	\N	01084	0	\N	\N	0	\N	245	de9ca4e8-ab34-4739-9354-07d6e89dbf60		1	1	2	\N	2022-02-08 19:05:55	2022-02-08 19:05:55			'01084':4 '2001':3 '543':1 'q855':2	542
427	1261	\N	543 Q855 2001	\N	01085	0	\N	\N	0	\N	245	ef32f061-11d3-4772-b81b-627d7a14cab7		1	1	2	\N	2022-02-08 19:06:10	2022-02-08 19:06:10			'01085':4 '2001':3 '543':1 'q855':2	542
428	1262	\N	343 C658 2008	\N	02328	0	\N	\N	0	\N	116	b50bbb03-3abf-4976-83d6-63d77fc07e37		1	1	2	\N	2022-02-08 19:16:27	2022-02-08 19:16:27			'02328':4 '2008':3 '343':1 'c658':2	1438
429	1262	\N	343 C658 2008	\N	03467	0	\N	\N	0	\N	116	78a763ea-997b-45d6-8c19-07a8202d6c61		1	1	2	\N	2022-02-08 19:16:39	2022-02-08 19:16:39			'03467':4 '2008':3 '343':1 'c658':2	1438
430	1262	\N	343 C658 2008	\N	04218	0	\N	\N	0	\N	116	949969cc-fccb-4a6e-b958-591746c55b6d		1	1	2	\N	2022-02-08 19:16:56	2022-02-08 19:16:56			'04218':4 '2008':3 '343':1 'c658':2	1438
431	1262	\N	343 C658 2008	\N	04219	0	\N	\N	0	\N	116	b731297d-adf2-4858-a425-e96ad72b046d		1	1	2	\N	2022-02-08 19:17:21	2022-02-08 19:17:21			'04219':4 '2008':3 '343':1 'c658':2	1438
432	1262	\N	343 C658 2008	\N	04220	0	\N	\N	0	\N	116	93818bc0-932a-4688-a33e-1a945c6158fa		1	1	2	\N	2022-02-08 19:17:43	2022-02-08 19:17:43			'04220':4 '2008':3 '343':1 'c658':2	1438
433	1262	\N	343 C658 2008	\N	04221	0	\N	\N	0	\N	116	a6083aa4-2d0c-406f-a8a8-52ef6d18d7af		1	1	2	\N	2022-02-08 19:17:56	2022-02-08 19:17:56			'04221':4 '2008':3 '343':1 'c658':2	1438
434	1262	\N	343 C658 2008	\N	04384	0	\N	\N	0	\N	116	2c184612-c222-4360-95f1-6fcf83c07606		1	1	2	\N	2022-02-08 19:18:29	2022-02-08 19:18:29			'04384':4 '2008':3 '343':1 'c658':2	1438
435	1262	\N	343 C658 2008	\N	04385	0	\N	\N	0	\N	116	c254b301-a822-43b0-8821-88d6cf76011d		1	1	2	\N	2022-02-08 19:19:10	2022-02-08 19:19:10			'04385':4 '2008':3 '343':1 'c658':2	1438
436	1264	\N	343 C372L 2004	\N	02653	0	\N	\N	0	\N	245	0f97b167-1efd-4183-abf3-9155d4c46610		1	1	2	\N	2022-02-08 19:24:57	2022-02-08 19:24:57			'02653':4 '2004':3 '343':1 'c372l':2	287
437	1264	\N	343 C372L 2004	\N	02654	0	\N	\N	0	\N	245	4d3d1ab7-3881-4b49-b56a-1791d43ea8c5		1	1	2	\N	2022-02-08 19:25:48	2022-02-08 19:25:48			'02654':4 '2004':3 '343':1 'c372l':2	287
438	1264	\N	343 C372L 2004	\N	02655	0	\N	\N	0	\N	245	d624c812-2be9-4605-a694-e447cfe7342e		1	1	2	\N	2022-02-08 19:26:00	2022-02-08 19:26:00			'02655':4 '2004':3 '343':1 'c372l':2	287
440	1264	\N	343 C372L 2004	\N	02656	0	\N	\N	0	\N	245	aa05b389-102d-4ed1-b767-567d624f90a2		1	1	2	\N	2022-02-08 19:26:34	2022-02-08 19:26:34			'02656':4 '2004':3 '343':1 'c372l':2	287
441	1265	\N	343.091 M372	\N	02657	0	\N	\N	0	\N	245	bdab3274-6931-4a7a-9844-b2abadfa7a77		1	1	2	\N	2022-02-08 19:30:58	2022-02-08 19:30:58			'02657':3 '343.091':1 'm372':2	277
442	1266	\N	344.02 C3721	\N	02658	0	\N	\N	0	\N	245	1da01bc3-125f-43a5-ac3d-0073c96bd37d		1	1	2	\N	2022-02-08 19:33:31	2022-02-08 19:33:31			'02658':3 '344.02':1 'c3721':2	274
443	1267	\N	344.07 S588	\N	02659	0	\N	\N	0	\N	245	73803235-a1ef-4b64-b0fc-980309c471f8		1	1	2	\N	2022-02-08 19:35:47	2022-02-08 19:35:47			'02659':3 '344.07':1 's588':2	284
444	1267	\N	344.07 S588	\N	02660	0	\N	\N	0	\N	245	17050d71-0fc9-426b-a2c2-b5a8aee4511c		1	1	2	\N	2022-02-08 19:36:06	2022-02-08 19:36:06			'02660':3 '344.07':1 's588':2	284
445	1267	\N	344.07 S588	\N	02661	0	\N	\N	0	\N	245	70941984-d6c5-48dd-9e8e-6e2802176718		1	1	2	\N	2022-02-08 19:36:32	2022-02-08 19:36:32			'02661':3 '344.07':1 's588':2	284
446	1267	\N	344.07 S588	\N	02662	0	\N	\N	0	\N	245	88532a26-1145-4481-abc9-f572151985e9		1	1	2	\N	2022-02-08 19:36:46	2022-02-08 19:36:46			'02662':3 '344.07':1 's588':2	284
447	1267	\N	344.07 S588	\N	02663	0	\N	\N	0	\N	245	75e41c7a-601c-4d17-a480-276b175cef20		1	1	2	\N	2022-02-08 19:37:01	2022-02-08 19:37:01			'02663':3 '344.07':1 's588':2	284
448	1267	\N	344.07 S588	\N	02664	0	\N	\N	0	\N	245	87986ea4-1684-4fa4-8c61-6ea93b369130		1	1	2	\N	2022-02-08 19:37:15	2022-02-08 19:37:15			'02664':3 '344.07':1 's588':2	284
449	1267	\N	344.07 S588	\N	02665	0	\N	\N	0	\N	245	8ef95d40-6260-4ab3-b748-f759a97ff901		1	1	2	\N	2022-02-08 19:37:33	2022-02-08 19:37:33			'02665':3 '344.07':1 's588':2	284
450	1267	\N	344.07 S588	\N	02666	0	\N	\N	0	\N	245	ab6edac8-54df-4802-82b2-81cfe0f4f471		1	1	2	\N	2022-02-08 19:38:00	2022-02-08 19:38:00			'02666':3 '344.07':1 's588':2	284
451	1267	\N	344.07 S588	\N	02667	0	\N	\N	0	\N	245	c9392cfa-7dd6-4921-a676-93dbfb713336		1	1	2	\N	2022-02-08 19:38:34	2022-02-08 19:38:34			'02667':3 '344.07':1 's588':2	284
452	1268	\N	006.6 H659A	\N	03771	0	\N	\N	0	\N	245	449238f4-6a75-4360-8d7f-8abf06b2a27f		1	1	2	\N	2022-02-08 20:22:41	2022-02-08 20:22:41			'006.6':1 '03771':3 'h659a':2	1364
453	1268	\N	006.6 H659A	\N	03772	0	\N	\N	0	\N	245	39adc9b6-e510-405b-8a5d-cd2747377637		1	1	2	\N	2022-02-08 20:23:17	2022-02-08 20:23:17			'006.6':1 '03772':3 'h659a':2	1364
454	1268	\N	006.6 H659A	\N	03773	0	\N	\N	0	\N	245	59850cb9-cb62-4a48-ac89-212266071802		1	1	2	\N	2022-02-08 20:23:45	2022-02-08 20:23:45			'006.6':1 '03773':3 'h659a':2	1364
455	1268	\N	006.6 H659A	\N	03774	0	\N	\N	0	\N	245	b11c0cad-d8e6-4736-b37b-5fde6b7823ae		1	1	2	\N	2022-02-08 20:24:20	2022-02-08 20:24:20			'006.6':1 '03774':3 'h659a':2	1364
456	1268	\N	006.6 H659A	\N	03775	0	\N	\N	0	\N	245	cb7b6f2f-f2c9-47b7-8b04-712b31994f53		1	1	2	\N	2022-02-08 20:24:47	2022-02-08 20:24:47			'006.6':1 '03775':3 'h659a':2	1364
457	1268	\N	006.6 H659A	\N	03776	0	\N	\N	0	\N	245	abbc9dad-3929-46b8-9b2f-08c926ca79ed		1	1	2	\N	2022-02-08 20:25:10	2022-02-08 20:25:10			'006.6':1 '03776':3 'h659a':2	1364
458	1268	\N	006.6 H659A	\N	03777	0	\N	\N	0	\N	245	72fe5c14-81bc-4a7b-95cd-d7e20d9db460		1	1	2	\N	2022-02-08 20:25:24	2022-02-08 20:25:24			'006.6':1 '03777':3 'h659a':2	\N
459	1268	\N	006.6 H659A	\N	03778	0	\N	\N	0	\N	245	d1fb6544-572b-47a4-85f1-0fa2e468bb7e		1	1	2	\N	2022-02-08 20:25:38	2022-02-08 20:27:48			'006.6':1 '03778':3 'h659a':2	1364
460	1269	\N	006.6 S835B	\N	00161	0	\N	\N	0	\N	245	fdf35758-b0fa-42db-9a5a-a2a3a8a2c4ba		1	1	2	\N	2022-02-08 20:43:12	2022-02-08 20:43:12			'00161':3 '006.6':1 's835b':2	1111
461	1269	\N	006.6 S835B	\N	00162	0	\N	\N	0	\N	245	f04f6114-9248-4fd6-92a7-1c753664ae66		1	1	2	\N	2022-02-08 20:43:45	2022-02-08 20:43:45			'00162':3 '006.6':1 's835b':2	\N
463	1269	\N	006.6 S835B	\N	00163	0	\N	\N	0	\N	245	563f060f-388e-4924-8ab7-e7f9f4fe5a1e		1	1	2	\N	2022-02-08 20:44:18	2022-02-08 20:44:18			'00163':3 '006.6':1 's835b':2	1111
464	1269	\N	006.6 S835B	\N	00164	0	\N	\N	0	\N	245	d0a140c6-6e7f-4631-98a5-80cf0b8a91b0		1	1	2	\N	2022-02-08 20:44:44	2022-02-08 20:44:44			'00164':3 '006.6':1 's835b':2	1111
465	1269	\N	006.6 S835B	\N	03836	0	\N	\N	0	\N	245	3bd48cd0-ff06-4c6a-91d4-26ec038c12da		1	1	2	\N	2022-02-08 20:45:12	2022-02-08 20:45:12			'006.6':1 '03836':3 's835b':2	1111
466	1269	\N	006.6 S835B	\N	03837	0	\N	\N	0	\N	245	a05c4565-9f54-4ed1-9766-fb38aa1c820b		1	1	2	\N	2022-02-08 20:45:35	2022-02-08 20:45:35			'006.6':1 '03837':3 's835b':2	1111
467	1269	\N	006.6 S835B	\N	03838	0	\N	\N	0	\N	245	29896cbc-dc44-4bde-9e4a-906fd5764396		1	1	2	\N	2022-02-08 20:45:56	2022-02-08 20:45:56			'006.6':1 '03838':3 's835b':2	1111
468	1269	\N	006.6 S835B	\N	03839	0	\N	\N	0	\N	245	a694fc53-0935-4913-a897-be17033ca368		1	1	2	\N	2022-02-08 20:46:23	2022-02-08 20:46:23			'006.6':1 '03839':3 's835b':2	1111
469	1269	\N	006.6 S835B	\N	03840	0	\N	\N	0	\N	245	b37c93be-b915-4603-9ab6-b2ebce4af77e		1	1	2	\N	2022-02-08 20:46:57	2022-02-08 20:46:57			'006.6':1 '03840':3 's835b':2	1111
470	1269	\N	006.6 S835B	\N	03841	0	\N	\N	0	\N	245	bdb4f5c9-b70f-4db8-8b1a-23cd3cab05c6		1	1	2	\N	2022-02-08 20:47:23	2022-02-08 20:47:23			'006.6':1 '03841':3 's835b':2	1111
471	1270	\N	343.05 C654 2009	\N	03907	0	\N	\N	0	\N	245	3fc89e88-c4e8-4ef0-ac3c-db3aaecd3450		1	1	2	\N	2022-02-08 20:52:31	2022-02-08 20:52:31			'03907':4 '2009':3 '343.05':1 'c654':2	1382
472	1270	\N	343.05 C654 2009	\N	03908	0	\N	\N	0	\N	245	0823fcc0-8ca5-4203-bfa5-d4acc042d6c8		1	1	2	\N	2022-02-08 20:53:00	2022-02-08 20:53:00			'03908':4 '2009':3 '343.05':1 'c654':2	1382
473	1270	\N	343.05 C654 2009	\N	03909	0	\N	\N	0	\N	245	01432840-b1d8-4b1f-acb4-f23cfaff8e2f		1	1	2	\N	2022-02-08 20:54:07	2022-02-08 20:54:07			'03909':4 '2009':3 '343.05':1 'c654':2	1382
474	1270	\N	343.05 C654 2009	\N	03910	0	\N	\N	0	\N	245	7fa872e9-6f02-4483-986b-7280ee9e15dc		1	1	2	\N	2022-02-08 20:54:31	2022-02-08 20:54:31			'03910':4 '2009':3 '343.05':1 'c654':2	1382
475	1270	\N	343.05 C654 2009	\N	03911	0	\N	\N	0	\N	245	c43ee25a-e391-484c-af5d-b46e1f8400cd		1	1	2	\N	2022-02-08 20:54:53	2022-02-08 20:54:53			'03911':4 '2009':3 '343.05':1 'c654':2	1382
476	1270	\N	343.05 C654 2009	\N	03912	0	\N	\N	0	\N	245	94d609da-b37a-455e-99cd-43d8a7ca72cd		1	1	2	\N	2022-02-08 20:55:23	2022-02-08 20:55:23			'03912':4 '2009':3 '343.05':1 'c654':2	1382
477	1270	\N	343.05 C654 2009	\N	03913	0	\N	\N	0	\N	245	a3febd4d-9cf3-4a28-85b2-2ef38acc6cb9		1	1	2	\N	2022-02-08 20:55:35	2022-02-08 20:55:35			'03913':4 '2009':3 '343.05':1 'c654':2	1382
478	1270	\N	343.05 C654 2009	\N	03914	0	\N	\N	0	\N	245	81a66e85-eb20-4a09-a60c-1b1b72d245fb		1	1	2	\N	2022-02-08 20:55:51	2022-02-08 20:55:51			'03914':4 '2009':3 '343.05':1 'c654':2	1382
479	1271	\N	005.74 S846D	\N	04117	0	\N	\N	0	\N	111	ef1657c8-e7cd-4ae2-8f13-14987e788f95		1	1	2	\N	2022-02-08 22:19:25	2022-02-08 22:19:25			'005.74':1 '04117':3 's846d':2	14131413
480	1271	\N	005.74 S846D	\N	04118	0	\N	\N	0	\N	111	50b6219f-d2c4-4acb-921a-62e5d2c8b2a2		1	1	2	\N	2022-02-08 22:19:50	2022-02-08 22:19:50			'005.74':1 '04118':3 's846d':2	1413
481	1271	\N	005.74 S846D	\N	04119	0	\N	\N	0	\N	111	e65c6363-af52-4e62-bd3e-0a481f1d3298		1	1	2	\N	2022-02-08 22:20:14	2022-02-08 22:20:14			'005.74':1 '04119':3 's846d':2	1413
482	1271	\N	005.74 S846D	\N	04120	0	\N	\N	0	\N	111	520179aa-28c8-47e0-93f2-d711b056135c		1	1	2	\N	2022-02-08 22:20:27	2022-02-08 22:20:27			'005.74':1 '04120':3 's846d':2	1413
483	1271	\N	005.74 S846D	\N	04121	0	\N	\N	0	\N	111	34760d82-fff1-4454-8eba-856516094faf		1	1	2	\N	2022-02-08 22:20:48	2022-02-08 22:20:48			'005.74':1 '04121':3 's846d':2	1413
484	1271	\N	005.74 S846D	\N	04122	0	\N	\N	0	\N	111	5e131b96-45ed-4702-b2dd-124b145acef6		1	1	2	\N	2022-02-08 22:21:09	2022-02-08 22:21:09			'005.74':1 '04122':3 's846d':2	1413
485	1271	\N	005.74 S846D	\N	04123	0	\N	\N	0	\N	111	0053ed88-e015-49f5-b237-c16425323d9f		1	1	2	\N	2022-02-08 22:21:23	2022-02-08 22:21:23			'005.74':1 '04123':3 's846d':2	1413
486	1271	\N	005.74 S846D	\N	04124	0	\N	\N	0	\N	111	3698cb68-2a14-43ef-b8ea-bd152d1af2cb		1	1	2	\N	2022-02-08 22:21:38	2022-02-08 22:21:38			'005.74':1 '04124':3 's846d':2	1413
487	1272	\N	005.74 L383S 2008	\N	04146	0	\N	\N	0	\N	245	196f325f-d33d-4c65-af7f-d46a5ef21455		1	1	2	\N	2022-02-08 22:30:48	2022-02-08 22:30:48			'005.74':1 '04146':4 '2008':3 'l383s':2	1419
488	1272	\N	005.74 L383S 2008	\N	04147	0	\N	\N	0	\N	245	b6de4ecf-5c8f-409b-9bce-2e8384ae99bd		1	1	2	\N	2022-02-08 22:31:08	2022-02-08 22:31:08			'005.74':1 '04147':4 '2008':3 'l383s':2	1419
489	1273	\N	344.02 C393D	\N	04158	0	\N	\N	0	\N	82	096485fc-4529-41a0-8bb6-9c0d802c3b92		1	1	2	\N	2022-02-08 22:43:22	2022-02-08 22:43:22			'04158':3 '344.02':1 'c393d':2	1422
490	1273	\N	344.02 C393D	\N	04159	0	\N	\N	0	\N	82	162de83f-f62e-4b72-9f28-1f0a9cc3100f		1	1	2	\N	2022-02-08 22:43:34	2022-02-08 22:43:34			'04159':3 '344.02':1 'c393d':2	1422
491	1273	\N	344.02 C393D	\N	04160	0	\N	\N	0	\N	82	277b3ea1-b537-411f-b5c5-c9c5504a90fb		1	1	2	\N	2022-02-08 22:43:51	2022-02-08 22:43:51			'04160':3 '344.02':1 'c393d':2	1422
493	1273	\N	344.02 C393D	\N	04161	0	\N	\N	0	\N	82	46e41740-2e0b-4d15-9ac3-96c18d73d9c2		1	1	2	\N	2022-02-08 22:44:12	2022-02-08 22:44:12			'04161':3 '344.02':1 'c393d':2	1422
494	1273	\N	344.02 C393D	\N	04162	0	\N	\N	0	\N	82	0f2a385e-955c-4bcb-8916-5b133446285a		1	1	2	\N	2022-02-08 22:44:28	2022-02-08 22:44:28			'04162':3 '344.02':1 'c393d':2	1422
495	1273	\N	344.02 C393D	\N	04163	0	\N	\N	0	\N	82	3097c1d8-5519-4056-a8f3-dc2a68d4b21d		1	1	2	\N	2022-02-08 22:44:52	2022-02-08 22:44:52			'04163':3 '344.02':1 'c393d':2	1422
496	1274	\N	005.74 P688S 2006	\N	04187	0	\N	\N	0	\N	245	571aedae-c039-49e7-ac4f-ec72a561440b		1	1	2	\N	2022-02-08 22:49:21	2022-02-08 22:49:21			'005.74':1 '04187':4 '2006':3 'p688s':2	1429
497	1274	\N	005.74 P688S 2006	\N	04188	0	\N	\N	0	\N	245	e2742681-0496-4971-8f3d-60e378e962e3		1	1	2	\N	2022-02-08 22:49:33	2022-02-08 22:49:33			'005.74':1 '04188':4 '2006':3 'p688s':2	1429
498	1274	\N	005.74 P688S 2006	\N	04189	0	\N	\N	0	\N	245	f8053f56-307f-4efc-aed2-b4dca22affb1		1	1	2	\N	2022-02-08 22:49:57	2022-02-08 22:49:57			'005.74':1 '04189':4 '2006':3 'p688s':2	1429
499	1274	\N	005.74 P688S 2006	\N	04190	0	\N	\N	0	\N	245	b11b4ff6-db58-4b56-a8c5-8df46bfbbc2a		1	1	2	\N	2022-02-08 22:50:12	2022-02-08 22:50:12			'005.74':1 '04190':4 '2006':3 'p688s':2	1429
500	1274	\N	005.74 P688S 2006	\N	04191	0	\N	\N	0	\N	245	c648f97a-86f5-4183-9232-5b96d83b0974		1	1	2	\N	2022-02-08 22:50:28	2022-02-08 22:50:28			'005.74':1 '04191':4 '2006':3 'p688s':2	1429
501	1275	\N	344 L465I 2009	\N	04386	0	\N	\N	0	\N	60	04dd7607-57d6-4a75-a54b-34f580225443		1	1	2	\N	2022-02-08 22:53:52	2022-02-08 22:53:52			'04386':4 '2009':3 '344':1 'l465i':2	95
502	1275	\N	344 L465I 2009	\N	04387	0	\N	\N	0	\N	60	e9672ef2-629a-4d59-98a5-e9492ba3b19a		1	1	2	\N	2022-02-08 22:54:21	2022-02-08 22:54:21			'04387':4 '2009':3 '344':1 'l465i':2	95
503	1275	\N	344 L465I 2009	\N	04388	0	\N	\N	0	\N	60	7ad7a977-2558-4c77-a5e8-3519837043fa		1	1	2	\N	2022-02-08 22:55:30	2022-02-08 22:55:30			'04388':4 '2009':3 '344':1 'l465i':2	95
504	1275	\N	344 L465I 2009	\N	04389	0	\N	\N	0	\N	60	0d6a4b64-0049-43c0-9b7a-1298064abfa7		1	1	2	\N	2022-02-08 22:56:06	2022-02-08 22:56:06			'04389':4 '2009':3 '344':1 'l465i':2	95
505	1275	\N	344 L465I 2009	\N	04390	0	\N	\N	0	\N	60	ca89d3dc-08fe-4767-a480-122a8b5947b1		1	1	2	\N	2022-02-08 22:56:38	2022-02-08 22:56:38			'04390':4 '2009':3 '344':1 'l465i':2	95
506	1276	\N	006.7 S555D	\N	03795	0	\N	\N	0	\N	245	c44efc5a-5b8a-48e1-a834-3caab6a1bc67		1	1	2	\N	2022-02-08 23:00:11	2022-02-08 23:00:11			'006.7':1 '03795':3 's555d':2	1163
507	1276	\N	006.7 S555D	\N	03796	0	\N	\N	0	\N	245	1e8fed1d-7ecd-40b7-bad9-4d2ce094d13e		1	1	2	\N	2022-02-08 23:00:26	2022-02-08 23:00:26			'006.7':1 '03796':3 's555d':2	1163
508	1276	\N	006.7 S555D	\N	03797	0	\N	\N	0	\N	245	bb67a047-5e7d-4470-956b-a4bf2722a40f		1	1	2	\N	2022-02-08 23:00:55	2022-02-08 23:00:55			'006.7':1 '03797':3 's555d':2	1163
509	1276	\N	006.7 S555D	\N	04514	0	\N	\N	0	\N	245	2ab02042-fd3f-4fd9-9b05-4be66f059baa		1	1	2	\N	2022-02-08 23:01:15	2022-02-08 23:01:15			'006.7':1 '04514':3 's555d':2	1163
510	1276	\N	006.7 S555D	\N	04515	0	\N	\N	0	\N	245	e073f23e-6695-4319-8885-5fb648dcee3d		1	1	2	\N	2022-02-08 23:01:36	2022-02-08 23:01:36			'006.7':1 '04515':3 's555d':2	1163
511	1276	\N	006.7 S555D	\N	04516	0	\N	\N	0	\N	245	07e56a2a-ab27-4b50-a6f3-c1c1784f7232		1	1	2	\N	2022-02-08 23:02:01	2022-02-08 23:02:01			'006.7':1 '04516':3 's555d':2	1163
512	1276	\N	006.7 S555D	\N	04517	0	\N	\N	0	\N	245	1368ac84-6c58-4490-93c4-49bdf2789b10		1	1	2	\N	2022-02-08 23:02:31	2022-02-08 23:02:31			'006.7':1 '04517':3 's555d':2	1163
513	1276	\N	006.7 S555D	\N	04518	0	\N	\N	0	\N	245	d82143ad-fe0a-438a-83bb-a9854896654f		1	1	2	\N	2022-02-08 23:02:56	2022-02-08 23:02:56			'006.7':1 '04518':3 's555d':2	1163
514	1277	\N	006.6 B733H	\N	04677	0	\N	\N	0	\N	245	8f1d3119-2214-45b7-ae8d-18d53f372fc6		1	1	2	\N	2022-02-08 23:07:38	2022-02-08 23:07:38			'006.6':1 '04677':3 'b733h':2	1515
515	1277	\N	006.6 B733H	\N	04678	0	\N	\N	0	\N	245	d51a7654-c384-4262-b836-213eca3acdb3		1	1	2	\N	2022-02-08 23:07:58	2022-02-08 23:07:58			'006.6':1 '04678':3 'b733h':2	1515
516	1277	\N	006.6 B733H	\N	04679	0	\N	\N	0	\N	245	dbcc35ce-2467-4559-8aea-f585e723f002		1	1	2	\N	2022-02-08 23:08:17	2022-02-08 23:08:17			'006.6':1 '04679':3 'b733h':2	1515
517	1277	\N	006.6 B733H	\N	04680	0	\N	\N	0	\N	245	9e6b9c31-03ca-4540-afac-20f371a48bfb		1	1	2	\N	2022-02-08 23:08:55	2022-02-08 23:08:55			'006.6':1 '04680':3 'b733h':2	1515
518	1277	\N	006.6 B733H	\N	04681	0	\N	\N	0	\N	245	c88151b8-d499-4dd3-9687-b7ebbb11274a		1	1	2	\N	2022-02-08 23:09:12	2022-02-08 23:09:12			'006.6':1 '04681':3 'b733h':2	1515
519	1277	\N	006.6 B733H	\N	04682	0	\N	\N	0	\N	245	a8cebab4-3174-43db-8a8c-e0fd1fc066f6		1	1	2	\N	2022-02-08 23:09:33	2022-02-08 23:09:33			'006.6':1 '04682':3 'b733h':2	1515
520	1278	\N	006.7 S225H	\N	04691	0	\N	\N	0	\N	245	de9d1027-879d-43b7-960d-b51a50f1ecc7		1	1	2	\N	2022-02-08 23:13:12	2022-02-08 23:13:12			'006.7':1 '04691':3 's225h':2	1518
521	1278	\N	006.7 S225H	\N	04692	0	\N	\N	0	\N	245	7fd9b514-98d2-43b2-a616-87641767093a		1	1	2	\N	2022-02-08 23:13:48	2022-02-08 23:13:48			'006.7':1 '04692':3 's225h':2	1518
522	1278	\N	006.7 S225H	\N	04693	0	\N	\N	0	\N	245	85ab8e78-788f-4f6d-a3d1-aebffd5a058a		1	1	2	\N	2022-02-08 23:14:30	2022-02-08 23:14:30			'006.7':1 '04693':3 's225h':2	1518
523	1278	\N	006.7 S225H	\N	04694	0	\N	\N	0	\N	245	33ddd9f9-18da-45a7-9e13-7ac5acd6f349		1	1	2	\N	2022-02-08 23:14:50	2022-02-08 23:14:50			'006.7':1 '04694':3 's225h':2	1518
524	1279	\N	006.6 A362	\N	04699	0	\N	\N	0	\N	245	39dbde13-8d52-4488-9b27-9b49d1b35802		1	1	2	\N	2022-02-08 23:22:27	2022-02-08 23:22:27			'006.6':1 '04699':3 'a362':2	1520
525	1279	\N	006.6 A362	\N	04700	0	\N	\N	0	\N	245	1ec02386-76e7-4c57-89a6-92aa0d20e4da		1	1	2	\N	2022-02-08 23:22:45	2022-02-08 23:22:45			'006.6':1 '04700':3 'a362':2	1520
526	1279	\N	006.6 A362	\N	04701	0	\N	\N	0	\N	245	febb9c9b-2a2a-4e83-88c3-3021cf239401		1	1	2	\N	2022-02-08 23:23:07	2022-02-08 23:23:07			'006.6':1 '04701':3 'a362':2	1520
527	1279	\N	006.6 A362	\N	04702	0	\N	\N	0	\N	245	698fdb8b-69d9-40d2-aa9d-4b8b5a2a7168		1	1	2	\N	2022-02-08 23:23:26	2022-02-08 23:23:26			'006.6':1 '04702':3 'a362':2	1520
528	1279	\N	006.6 A362	\N	04703	0	\N	\N	0	\N	245	42267019-54f6-408d-b313-54edf0e68876		1	1	2	\N	2022-02-08 23:23:54	2022-02-08 23:23:54			'006.6':1 '04703':3 'a362':2	1520
529	1279	\N	006.6 A362	\N	04704	0	\N	\N	0	\N	245	9718a77c-16af-4e2d-a46e-610ffd531105		1	1	2	\N	2022-02-08 23:24:05	2022-02-08 23:24:05			'006.6':1 '04704':3 'a362':2	1520
530	1280	\N	006.6 S553P	\N	04709	0	\N	\N	0	\N	245	288d0a68-5843-4a9c-a997-cf9fa3169eb7		1	1	2	\N	2022-02-08 23:26:30	2022-02-08 23:26:30			'006.6':1 '04709':3 's553p':2	1522
531	1280	\N	006.6 S553P	\N	04710	0	\N	\N	0	\N	245	dd1a2fd8-76b0-47e1-a8dc-b6029abe53a6		1	1	2	\N	2022-02-08 23:26:41	2022-02-08 23:26:41			'006.6':1 '04710':3 's553p':2	1522
532	1280	\N	006.6 S553P	\N	04711	0	\N	\N	0	\N	245	d065292a-24c7-49cd-9445-842eec777213		1	1	2	\N	2022-02-08 23:27:02	2022-02-08 23:27:02			'006.6':1 '04711':3 's553p':2	1522
533	1280	\N	006.6 S553P	\N	04712	0	\N	\N	0	\N	245	c1e70ca3-b26f-436a-abab-3330b463cc07		1	1	2	\N	2022-02-08 23:27:20	2022-02-08 23:27:20			'006.6':1 '04712':3 's553p':2	1522
534	1280	\N	006.6 S553P	\N	04713	0	\N	\N	0	\N	245	d5d379ca-a9a5-4b4a-8e12-79d9a5a3d434		1	1	2	\N	2022-02-08 23:27:35	2022-02-08 23:27:35			'006.6':1 '04713':3 's553p':2	1522
535	1281	\N	006.7 G768f	\N	04714	0	\N	\N	0	\N	245	41a772b3-0818-4f5c-a0f6-465a49a58735		1	1	2	\N	2022-02-08 23:36:07	2022-02-08 23:36:07			'006.7':1 '04714':3 'g768f':2	1523
536	1281	\N	006.7 G768f	\N	04715	0	\N	\N	0	\N	245	157f002a-53a2-4239-94d8-4233b9812f74		1	1	2	\N	2022-02-08 23:36:21	2022-02-08 23:36:21			'006.7':1 '04715':3 'g768f':2	1523
537	1281	\N	006.7 G768f	\N	04716	0	\N	\N	0	\N	245	4daaafc9-c8fd-4200-84d3-084ef0503ac1		1	1	2	\N	2022-02-08 23:36:37	2022-02-08 23:36:37			'006.7':1 '04716':3 'g768f':2	1523
538	1281	\N	006.7 G768f	\N	04717	0	\N	\N	0	\N	245	753a0e8a-dcd4-4149-a9a3-6c6bde20639c		1	1	2	\N	2022-02-08 23:37:10	2022-02-08 23:37:10			'006.7':1 '04717':3 'g768f':2	1523
539	1281	\N	006.7 G768f	\N	04718	0	\N	\N	0	\N	245	0b758f1b-d0e1-4cb5-b555-9ea2a7864a74		1	1	2	\N	2022-02-08 23:37:32	2022-02-08 23:37:32			'006.7':1 '04718':3 'g768f':2	1523
540	1282	\N	006.6 A362	\N	04719	0	\N	\N	0	\N	245	84a97c6e-9177-4bd2-a687-d9764f87a81f		1	1	2	\N	2022-02-08 23:39:46	2022-02-08 23:39:46			'006.6':1 '04719':3 'a362':2	1524
541	1282	\N	006.6 A362	\N	04720	0	\N	\N	0	\N	245	ffed2af1-8acf-41ad-800d-7f34a37d62d2		1	1	2	\N	2022-02-08 23:40:04	2022-02-08 23:40:04			'006.6':1 '04720':3 'a362':2	1524
542	1282	\N	006.6 A362	\N	04721	0	\N	\N	0	\N	245	16bb49c6-4cca-4d28-9092-b6c25c7fb13b		1	1	2	\N	2022-02-08 23:40:19	2022-02-08 23:40:19			'006.6':1 '04721':3 'a362':2	1524
543	1282	\N	006.6 A362	\N	04722	0	\N	\N	0	\N	245	88ff1aae-30c0-45aa-bbda-199c7e48ffa1		1	1	2	\N	2022-02-08 23:40:33	2022-02-08 23:40:33			'006.6':1 '04722':3 'a362':2	1524
544	1282	\N	006.6 A362	\N	04723	0	\N	\N	0	\N	245	2177fc11-39cb-4849-a6e4-43e5d72a9ade		1	1	2	\N	2022-02-08 23:40:48	2022-02-08 23:40:48			'006.6':1 '04723':3 'a362':2	1524
545	1283	\N	005.74 G555A	\N	04890	0	\N	\N	0	\N	57	2f5404aa-94f0-4f33-8a9c-06cb6958cd11		1	1	2	\N	2022-02-08 23:44:04	2022-02-08 23:44:04			'005.74':1 '04890':3 'g555a':2	1583
546	1283	\N	005.74 G555A	\N	04891	0	\N	\N	0	\N	57	46856a75-9849-48c8-9e78-5a7362152baa		1	1	2	\N	2022-02-08 23:44:29	2022-02-08 23:44:29			'005.74':1 '04891':3 'g555a':2	1583
547	1284	\N	006.6 S527M	\N	04919	0	\N	\N	0	\N	82	19fb576e-b5b6-4f8e-a58a-c3429005e924		1	1	2	\N	2022-02-08 23:46:39	2022-02-08 23:46:39			'006.6':1 '04919':3 's527m':2	1596
548	1285	\N	343.05 C378D	\N	05184	0	\N	\N	0	\N	82	75f3caa0-e154-4170-8125-dfc8fbd7efba		1	1	2	\N	2022-02-08 23:48:57	2022-02-08 23:48:57			'05184':3 '343.05':1 'c378d':2	1721
549	1285	\N	343.05 C378D	\N	05185	0	\N	\N	0	\N	82	56593473-003b-4351-9907-7f67823d0e2e		1	1	2	\N	2022-02-08 23:53:24	2022-02-08 23:53:24			'05185':3 '343.05':1 'c378d':2	1721
550	1286	\N	020 B338A 2002	\N	00182	0	\N	\N	0	\N	245	b9e0f881-68a9-48db-99d9-5826137ed56a		1	1	2	\N	2022-02-09 13:39:57	2022-02-09 13:39:57			'00182':4 '020':1 '2002':3 'b338a':2	21
551	1286	\N	020 B338A 2002	\N	00183	0	\N	\N	0	\N	245	c02b8205-0574-4a0e-a67b-efe925f0456a		1	1	2	\N	2022-02-09 13:40:16	2022-02-09 13:40:16			'00183':4 '020':1 '2002':3 'b338a':2	21
552	1287	\N	020 C674	\N	00185	0	\N	\N	0	\N	245	388a4908-db45-4f91-b173-9670c1efe0e8		1	1	2	\N	2022-02-09 13:44:35	2022-02-09 13:44:35			'00185':3 '020':1 'c674':2	25
553	1287	\N	020 C674	\N	00186	0	\N	\N	0	\N	245	6667b7a6-137c-433b-b172-4a77668f3481		1	1	2	\N	2022-02-09 13:44:48	2022-02-09 13:44:48			'00186':3 '020':1 'c674':2	25
554	1287	\N	020 C674	\N	00187	0	\N	\N	0	\N	245	ff9c28cc-72e7-47d8-9d88-f2de53e3bf76		1	1	2	\N	2022-02-09 13:44:59	2022-02-09 13:44:59			'00187':3 '020':1 'c674':2	25
555	1287	\N	020 C674	\N	00188	0	\N	\N	0	\N	245	7548f0c9-39fb-449d-b9b2-cd167c912634		1	1	2	\N	2022-02-09 13:45:19	2022-02-09 13:45:19			'00188':3 '020':1 'c674':2	25
556	1288	\N	020 G853	\N	00190	0	\N	\N	0	\N	245	c84293ce-467d-4d50-b0eb-eead180e1f1a		1	1	2	\N	2022-02-09 13:50:16	2022-02-09 13:50:16			'00190':3 '020':1 'g853':2	14
557	1288	\N	020 G853	\N	00191	0	\N	\N	0	\N	245	2691a2d6-ac2d-4799-a61a-52b4cbfb7dbe		1	1	2	\N	2022-02-09 13:50:32	2022-02-09 13:50:32			'00191':3 '020':1 'g853':2	14
558	1289	\N	020 H458D	\N	00192	0	\N	\N	0	\N	245	c45c64f0-95de-4a2c-b955-76629883cc87		1	1	2	\N	2022-02-09 13:53:19	2022-02-09 14:14:00			'00192':3 '020':1 'h458d':2	26
560	1290	\N	020 K785D	\N	00195	0	\N	\N	0	\N	245	bf0b30a6-c93f-402e-92d3-19daf16bea25		1	1	2	\N	2022-02-09 14:15:03	2022-02-09 14:15:03			'00195':3 '020':1 'k785d':2	19
561	1291	\N	020 M677A 1994	\N	00197	0	\N	\N	0	\N	245	73c67327-add4-41f8-9c6e-120437e0e6d0		1	1	2	\N	2022-02-09 14:24:17	2022-02-09 14:24:17			'00197':4 '020':1 '1994':3 'm677a':2	12
562	1291	\N	020 M677A 1994	\N	00198	0	\N	\N	0	\N	245	21bd909d-321e-4d01-abd9-84e831a034ff		1	1	2	\N	2022-02-09 14:24:32	2022-02-09 14:24:32			'00198':4 '020':1 '1994':3 'm677a':2	12
563	1292	\N	020 N458R	\N	00199	0	\N	\N	0	\N	245	0e909429-b3c8-45c0-98e1-e7caa5a117a4		1	1	2	\N	2022-02-09 15:09:32	2022-02-09 15:09:32			'00199':3 '020':1 'n458r':2	15
564	1293	\N	020 N784 1993	\N	00200	0	\N	\N	0	\N	245	689e4df9-e064-4399-b4aa-93a2cb5a59ce		1	1	2	\N	2022-02-09 15:11:31	2022-02-09 15:11:31			'00200':4 '020':1 '1993':3 'n784':2	18
565	1294	\N	020 O284	\N	00201	0	\N	\N	0	\N	245	a384e7e1-ae1d-4e5b-9ce6-fb9e4afe9176		1	1	2	\N	2022-02-09 15:14:19	2022-02-09 15:14:19			'00201':3 '020':1 'o284':2	32
566	1295	\N	020 P382D 2001	\N	00202	0	\N	\N	0	\N	213	13335026-da33-47ea-a54b-c63b8a7bfea6		1	1	2	\N	2022-02-09 15:17:03	2022-02-09 15:17:03			'00202':4 '020':1 '2001':3 'p382d':2	33
567	1295	\N	020 P382D 2001	\N	00203	0	\N	\N	0	\N	213	b679979e-d126-46b8-95e6-7bfd794692ff		1	1	2	\N	2022-02-09 15:17:19	2022-02-09 15:17:19			'00203':4 '020':1 '2001':3 'p382d':2	33
568	1296	\N	020 P453G	\N	00209	0	\N	\N	0	\N	111	d0ce8e21-bccb-4f00-8a1e-6d7a9d28d2ab		1	1	2	\N	2022-02-09 15:19:14	2022-02-09 15:19:14			'00209':3 '020':1 'p453g':2	17
569	1297	\N	020 P382N	\N	00206	0	\N	\N	0	\N	213	9164084c-2c58-4925-a626-db03cb5842e9		1	1	2	\N	2022-02-09 15:24:52	2022-02-09 15:24:52			'00206':3 '020':1 'p382n':2	28
570	1297	\N	020 P382N	\N	00207	0	\N	\N	0	\N	213	2124a102-90cc-43e8-b3b2-e6f7c009a766		1	1	2	\N	2022-02-09 15:25:44	2022-02-09 15:25:44			'00207':3 '020':1 'p382n':2	28
571	1297	\N	020 P382N	\N	00208	0	\N	\N	0	\N	213	a5c5cbf8-0805-4286-98b2-dfa77e30467e		1	1	2	\N	2022-02-09 15:26:02	2022-02-09 15:26:02			'00208':3 '020':1 'p382n':2	28
575	1298	\N	020 P382N	\N	00204	0	\N	\N	0	\N	213	c797f170-a78f-46c2-9212-4721ba44d79b		1	1	2	\N	2022-02-09 15:29:27	2022-02-09 15:29:27			'00204':3 '020':1 'p382n':2	16
577	1298	\N	020 P382N	\N	00205	0	\N	\N	0	\N	213	f66b97d9-336d-4fc1-87db-85fbed3270bd		1	1	2	\N	2022-02-09 15:29:56	2022-02-09 15:29:56			'00205':3 '020':1 'p382n':2	16
578	1299	\N	020 R393R 2003	\N	00210	0	\N	\N	0	\N	213	c36ea494-9afb-4c13-bb49-a8fd10c45ec2		1	1	2	\N	2022-02-09 15:32:42	2022-02-09 15:32:42			'00210':4 '020':1 '2003':3 'r393r':2	13
579	1299	\N	020 R393R 2003	\N	00211	0	\N	\N	0	\N	213	166ffe72-42ae-4848-9bc7-0c5ecc6f550a		1	1	2	\N	2022-02-09 15:32:55	2022-02-09 15:32:55			'00211':4 '020':1 '2003':3 'r393r':2	13
580	1299	\N	020 R393R 2003	\N	00212	0	\N	\N	0	\N	213	91e7542d-7ee5-4049-be9c-f3bcf60839ca		1	1	2	\N	2022-02-09 15:33:05	2022-02-09 15:33:05			'00212':4 '020':1 '2003':3 'r393r':2	13
582	1300	\N	345.028 L664D	\N	02668	0	\N	\N	0	\N	245	71765f9a-2a89-4b40-a44e-ce923057c080		1	1	2	\N	2022-02-09 21:06:45	2022-02-09 21:06:45			'02668':3 '345.028':1 'l664d':2	1043
583	1300	\N	345.028 L664D	\N	02669	0	\N	\N	0	\N	245	85a2d238-8d0a-4b0e-9e9a-44a3783dd33f		1	1	2	\N	2022-02-09 21:06:57	2022-02-09 21:06:57			'02669':3 '345.028':1 'l664d':2	1043
584	1300	\N	345.028 L664D	\N	02670	0	\N	\N	0	\N	245	82fcdecb-2179-4992-b634-8d6e6b367161		1	1	2	\N	2022-02-09 21:07:07	2022-02-09 21:07:07			'02670':3 '345.028':1 'l664d':2	1043
585	1300	\N	345.028 L664D	\N	02671	0	\N	\N	0	\N	245	31d85f24-6239-46d9-a4dd-249bbd390567		1	1	2	\N	2022-02-09 21:07:17	2022-02-09 21:07:17			'02671':3 '345.028':1 'l664d':2	1043
586	1300	\N	345.028 L664D	\N	02672	0	\N	\N	0	\N	245	af372ddc-6ef0-435a-8a13-a835947de9c1		1	1	2	\N	2022-02-09 21:07:33	2022-02-09 21:07:33			'02672':3 '345.028':1 'l664d':2	1043
587	1300	\N	345.028 L664D	\N	02673	0	\N	\N	0	\N	245	27640416-90dc-45f3-b74c-d1d973a85b2a		1	1	2	\N	2022-02-09 21:09:29	2022-02-09 21:09:29			'02673':3 '345.028':1 'l664d':2	1043
588	1300	\N	345.028 L664D	\N	02674	0	\N	\N	0	\N	245	f0e88514-8b2e-49f1-936f-ea43eb13d44c		1	1	2	\N	2022-02-09 21:09:46	2022-02-09 21:09:46			'02674':3 '345.028':1 'l664d':2	1043
589	1300	\N	345.028 L664D	\N	02675	0	\N	\N	0	\N	245	f367c029-13ab-47ee-a885-746b1f6d0556		1	1	2	\N	2022-02-09 21:10:27	2022-02-09 21:10:27			'02675':3 '345.028':1 'l664d':2	1043
590	1300	\N	345.028 L664D	\N	02676	0	\N	\N	0	\N	245	0f101e0b-664c-4014-9cf4-b3c5438b9806		1	1	2	\N	2022-02-09 21:10:38	2022-02-09 21:10:38			'02676':3 '345.028':1 'l664d':2	1043
591	1300	\N	345.028 L664D	\N	02677	0	\N	\N	0	\N	245	b91adfd5-2a89-4228-8c07-238b346191bb		1	1	2	\N	2022-02-09 21:10:47	2022-02-09 21:10:47			'02677':3 '345.028':1 'l664d':2	1043
592	1301	\N	346.024 M443C	\N	02678	0	\N	\N	0	\N	64	fe5f85f0-137f-4d5f-8060-4e34651126af		1	1	2	\N	2022-02-10 13:28:16	2022-02-10 13:28:16			'02678':3 '346.024':1 'm443c':2	264
593	1301	\N	346.024 M443C	\N	02679	0	\N	\N	0	\N	64	2de0d123-06d2-4495-b7e2-3d7a5db8b350		1	1	2	\N	2022-02-10 13:28:28	2022-02-10 13:28:28			'02679':3 '346.024':1 'm443c':2	264
594	1302	\N	347 B674T	\N	02680	0	\N	\N	0	\N	82	f9ab976c-5c64-44e0-b726-803a13ac16bf		1	1	2	\N	2022-02-10 13:31:16	2022-02-10 13:31:16			'02680':3 '347':1 'b674t':2	298
597	1303	\N	348 C635 2008	\N	02687	0	\N	\N	0	\N	60	09f9c97e-22d8-4b20-8676-766e3823c7b1		1	1	2	\N	2022-02-10 13:37:53	2022-02-10 13:37:53			'02687':4 '2008':3 '348':1 'c635':2	1075
598	1303	\N	348 C635 2008	\N	02688	0	\N	\N	0	\N	60	d11f18f7-17e9-41eb-902f-b1ecd633deb8		1	1	2	\N	2022-02-10 13:38:08	2022-02-10 13:38:08			'02688':4 '2008':3 '348':1 'c635':2	1075
599	1304	\N	347.01 L388A	\N	02681	0	\N	\N	0	\N	60	42b15240-db12-4419-81af-1e236e35148c		1	1	2	\N	2022-02-10 13:43:26	2022-02-10 13:43:26			'02681':3 '347.01':1 'l388a':2	737
600	1304	\N	347.01 L388A	\N	02682	0	\N	\N	0	\N	60	09f8e203-5438-4eb4-a581-4d95e4bf8d8f		1	1	2	\N	2022-02-10 13:43:41	2022-02-10 13:43:41			'02682':3 '347.01':1 'l388a':2	737
601	1304	\N	347.01 L388A	\N	02683	0	\N	\N	0	\N	60	fa87094e-0b2a-4f00-961b-c0f706d95f2e		1	1	2	\N	2022-02-10 13:44:01	2022-02-10 13:44:01			'02683':3 '347.01':1 'l388a':2	737
602	1304	\N	347.01 L388A	\N	02684	0	\N	\N	0	\N	60	6b263b9e-41b2-4f76-8cee-46f9a11fd12b		1	1	2	\N	2022-02-10 13:44:16	2022-02-10 13:44:16			'02684':3 '347.01':1 'l388a':2	737
603	1304	\N	347.01 L388A	\N	02685	0	\N	\N	0	\N	60	403d5430-dfa4-4980-ab98-936c3684d2a2		1	1	2	\N	2022-02-10 13:44:30	2022-02-10 13:44:30			'02685':3 '347.01':1 'l388a':2	737
604	1304	\N	347.01 L388A	\N	02686	0	\N	\N	0	\N	60	78060e53-c156-4dbf-addc-a11c253d40fb		1	1	2	\N	2022-02-10 13:44:47	2022-02-10 13:44:47			'02686':3 '347.01':1 'l388a':2	737
605	1305	\N	346.065 L465C	\N	03043	0	\N	\N	0	\N	64	ebdf3683-072a-43dd-82b2-7d156c3f593a		1	1	2	\N	2022-02-10 13:47:17	2022-02-10 13:47:17			'03043':3 '346.065':1 'l465c':2	312
606	1305	\N	346.065 L465C	\N	03044	0	\N	\N	0	\N	64	7a0c4959-7136-483a-9c16-bfde5219b958		1	1	2	\N	2022-02-10 13:47:28	2022-02-10 13:47:28			'03044':3 '346.065':1 'l465c':2	312
607	1306	\N	348 C635	\N	03803	0	\N	\N	0	\N	245	500fa59d-cf05-4bd0-b8b2-d312b080bf22		1	1	2	\N	2022-02-10 14:21:06	2022-02-10 14:21:06			'03803':3 '348':1 'c635':2	1365
608	1306	\N	348 C635	\N	03804	0	\N	\N	0	\N	245	c1e2d5b1-c1df-4e19-8fd1-9815aa7be2c3		1	1	2	\N	2022-02-10 14:21:18	2022-02-10 14:21:18			'03804':3 '348':1 'c635':2	1365
609	1306	\N	348 C635	\N	03805	0	\N	\N	0	\N	245	68f912ce-a66d-4bb5-b358-8a4a4a939458		1	1	2	\N	2022-02-10 14:21:28	2022-02-10 14:21:28			'03805':3 '348':1 'c635':2	1365
610	1306	\N	348 C635	\N	03806	0	\N	\N	0	\N	245	b1e7d038-3f44-48e9-bcc7-3b080591bf59		1	1	2	\N	2022-02-10 14:21:47	2022-02-10 14:21:47			'03806':3 '348':1 'c635':2	1365
611	1306	\N	348 C635	\N	03807	0	\N	\N	0	\N	245	43b9cda6-b7de-4c1b-b634-479269e18671		1	1	2	\N	2022-02-10 14:22:04	2022-02-10 14:22:04			'03807':3 '348':1 'c635':2	1365
612	1306	\N	348 C635	\N	04148	0	\N	\N	0	\N	245	549a7032-a55a-4884-8cb5-b2682b45dc92		1	1	2	\N	2022-02-10 14:22:20	2022-02-10 14:22:20			'04148':3 '348':1 'c635':2	1365
614	1307	\N	348 L494 2002	\N	03808	0	\N	\N	0	\N	82	2b8d1b85-0b94-4866-badf-5e71258efc25		1	1	2	\N	2022-02-10 14:33:10	2022-02-10 14:33:19			'03808':4 '2002':3 '348':1 'l494':2	1366
615	1307	\N	348 L494 2002	\N	03809	0	\N	\N	0	\N	82	fe789f62-d859-41c6-970e-4d3fa10e2e97		1	1	2	\N	2022-02-10 14:33:32	2022-02-10 14:33:32			'03809':4 '2002':3 '348':1 'l494':2	1366
616	1307	\N	348 L494 2002	\N	03810	0	\N	\N	0	\N	82	a8687b7d-6e59-4a73-a250-0620bfc71da2		1	1	2	\N	2022-02-10 14:33:41	2022-02-10 14:33:41			'03810':4 '2002':3 '348':1 'l494':2	1366
617	1307	\N	348 L494 2002	\N	03811	0	\N	\N	0	\N	82	055af4fa-5ade-4818-8541-348893ff9d38		1	1	2	\N	2022-02-10 14:33:56	2022-02-10 14:33:56			'03811':4 '2002':3 '348':1 'l494':2	1366
618	1307	\N	348 L494 2002	\N	03812	0	\N	\N	0	\N	82	ea4e9c1e-9034-4114-9108-285822abfafb		1	1	2	\N	2022-02-10 14:34:08	2022-02-10 14:34:08			'03812':4 '2002':3 '348':1 'l494':2	1366
619	1308	\N	348 I568	\N	05229	0	\N	\N	0	\N	245	54530355-4698-457a-8937-f0bf6011e6de		1	1	2	\N	2022-02-10 14:38:05	2022-02-10 14:38:05			'05229':3 '348':1 'i568':2	1737
620	1308	\N	348 I568	\N	05230	0	\N	\N	0	\N	245	c5f1724b-9c82-458c-a715-fcaafdacf32f		1	1	2	\N	2022-02-10 14:38:34	2022-02-10 14:38:34			'05230':3 '348':1 'i568':2	1737
621	1309	\N	020 R393R	4ta Edición	05225	0	\N	\N	0	\N	213	dbe03d69-24cf-4f1e-a0d8-78808ce20e17		1	1	2	\N	2022-02-10 15:14:28	2022-02-10 15:14:28			'020':1 '05225':5 '4ta':3 'edicion':4 'r393r':2	1733
622	1310	\N	020 A537P	\N	00180	0	\N	\N	0	\N	245	7abfc0bc-f57a-47d5-9fab-10c9e7fc7c2d		1	1	2	\N	2022-02-10 15:16:43	2022-02-10 15:16:43			'00180':3 '020':1 'a537p':2	24
623	1310	\N	020 A537P	\N	00181	0	\N	\N	0	\N	245	e90cf124-1e6e-4e1e-83c1-3f70d10f7a46		1	1	2	\N	2022-02-10 15:16:59	2022-02-10 15:16:59			'00181':3 '020':1 'a537p':2	24
624	1311	\N	020 R427R	\N	00213	0	\N	\N	0	\N	60	8e83411f-b279-4d92-a058-4531a97c9f43		1	1	2	\N	2022-02-10 15:27:28	2022-02-10 15:27:28			'00213':3 '020':1 'r427r':2	10
625	1311	\N	020 R427R	\N	00214	0	\N	\N	0	\N	60	41bbb8d1-eeec-4de3-8932-7c0eded62e0e		1	1	2	\N	2022-02-10 15:27:38	2022-02-10 15:27:38			'00214':3 '020':1 'r427r':2	10
626	1312	\N	020 R637I	\N	00215	0	\N	\N	0	\N	245	10ac064e-1d39-411b-bb9c-28e12d4995ca		1	1	2	\N	2022-02-10 15:29:52	2022-02-10 15:29:52			'00215':3 '020':1 'r637i':2	11
627	1312	\N	020 R637I	\N	00216	0	\N	\N	0	\N	245	18861746-b592-4392-af1b-998944ac59ec		1	1	2	\N	2022-02-10 18:11:19	2022-02-10 18:11:19			'00216':3 '020':1 'r637i':2	11
628	1313	\N	020 V548G	\N	00218	0	\N	\N	0	\N	245	3f42058d-2eee-4c6d-82f9-1db6afa07eb4		1	1	2	\N	2022-02-10 18:13:55	2022-02-10 18:13:55			'00218':3 '020':1 'v548g':2	29
629	1314	\N	020 W558	\N	00219	0	\N	\N	0	\N	245	b1c718fd-ac0b-4275-b62f-bf7f24dada9f		1	1	2	\N	2022-02-10 18:19:48	2022-02-10 18:19:48			'00219':3 '020':1 'w558':2	30
630	1315	\N	020 W938M	\N	00220	0	\N	\N	0	\N	245	9c3afbe7-14b6-4a2b-8c04-0719f99165d4		1	1	2	\N	2022-02-10 18:23:09	2022-02-10 18:23:09			'00220':3 '020':1 'w938m':2	31
631	1317	\N	020 S847D	\N	02986	0	\N	\N	0	\N	57	fb585691-9ff4-4443-95a2-1c90b1799873		1	1	2	\N	2022-02-10 19:34:50	2022-02-10 19:34:50			'020':1 '02986':3 's847d':2	23
632	1318	\N	025.04 G654S 2007	\N	03951	0	\N	\N	0	\N	213	747d9a68-ff64-4696-95ef-68ef653849ed		1	1	2	\N	2022-02-10 19:37:17	2022-02-10 19:37:17			'025.04':1 '03951':4 '2007':3 'g654s':2	1390
634	1318	\N	025.04 G654S 2007	\N	03952	0	\N	\N	0	\N	213	443dfb4d-b472-4334-99a7-161ded7855a8		1	1	2	\N	2022-02-10 19:37:32	2022-02-10 19:37:32			'025.04':1 '03952':4 '2007':3 'g654s':2	1390
635	1318	\N	025.04 G654S 2007	\N	04335	0	\N	\N	0	\N	213	2c359d74-db68-40b9-aa70-9cb41d64e243		1	1	2	\N	2022-02-10 19:37:42	2022-02-10 19:37:42			'025.04':1 '04335':4 '2007':3 'g654s':2	1390
636	1318	\N	025.04 G654S 2007	\N	04336	0	\N	\N	0	\N	213	cb833653-8ecc-4b37-bd6f-268f29d6d9ec		1	1	2	\N	2022-02-10 19:38:05	2022-02-10 19:38:05			'025.04':1 '04336':4 '2007':3 'g654s':2	1390
637	1318	\N	025.04 G654S 2007	\N	04337	0	\N	\N	0	\N	213	ccb332ba-04c0-455a-977b-9f4a8c29413e		1	1	2	\N	2022-02-10 19:38:18	2022-02-10 19:38:18			'025.04':1 '04337':4 '2007':3 'g654s':2	1390
638	1318	\N	025.04 G654S 2007	\N	04338	0	\N	\N	0	\N	213	1dd6b59f-2437-45f8-ad09-5f3a292ec92b		1	1	2	\N	2022-02-10 19:38:33	2022-02-10 19:38:33			'025.04':1 '04338':4 '2007':3 'g654s':2	1390
639	1318	\N	025.04 G654S 2007	\N	04339	0	\N	\N	0	\N	213	9ae5c7de-8da6-4057-94dc-da0996ad6d4c		1	1	2	\N	2022-02-10 19:38:51	2022-02-10 19:38:51			'025.04':1 '04339':4 '2007':3 'g654s':2	1390
640	1319	\N	352.5 A247A	\N	02690	0	\N	\N	0	\N	60	d6c8650d-d35a-42c7-bfc2-4cc8f23518e0		1	1	2	\N	2022-02-10 23:57:50	2022-02-10 23:57:50			'02690':3 '352.5':1 'a247a':2	263
641	1319	\N	352.5 A247A	\N	02691	0	\N	\N	0	\N	60	3a0e1fef-3864-4124-be2c-e80bb083f729		1	1	2	\N	2022-02-10 23:58:02	2022-02-10 23:58:02			'02691':3 '352.5':1 'a247a':2	263
642	1319	\N	352.5 A247A	\N	02712	0	\N	\N	0	\N	60	08d402a9-3288-49d8-bc89-6f61dc49e457		1	1	2	\N	2022-02-10 23:58:18	2022-02-10 23:58:18			'02712':3 '352.5':1 'a247a':2	263
643	1319	\N	352.5 A247A	\N	02713	0	\N	\N	0	\N	60	bf64fc15-86f4-4d30-9c80-db1d561e25a3		1	1	2	\N	2022-02-10 23:58:30	2022-02-10 23:58:30			'02713':3 '352.5':1 'a247a':2	263
644	1319	\N	352.5 A247A	\N	02714	0	\N	\N	0	\N	60	62fb5283-1993-460e-9bfa-cc270a3e8a16		1	1	2	\N	2022-02-10 23:58:44	2022-02-10 23:58:44			'02714':3 '352.5':1 'a247a':2	263
645	1319	\N	352.5 A247A	\N	02715	0	\N	\N	0	\N	60	d2b4afc0-e4b6-4d2b-949d-79d904516adf		1	1	2	\N	2022-02-10 23:58:54	2022-02-10 23:58:54			'02715':3 '352.5':1 'a247a':2	263
\.


--
-- TOC entry 2825 (class 0 OID 58483)
-- Dependencies: 250
-- Data for Name: libro_portada; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_portada (id, libro_id, portada_id, deleted_at, created_at, updated_at) FROM stdin;
1	627	1	\N	\N	\N
11	517	11	\N	\N	\N
13	398	13	\N	\N	\N
34	211	34	\N	\N	\N
35	211	35	\N	\N	\N
36	211	36	\N	\N	\N
37	211	37	\N	\N	\N
39	933	39	\N	\N	\N
41	934	41	\N	\N	\N
42	935	42	\N	\N	\N
43	246	43	\N	\N	\N
44	936	44	\N	\N	\N
45	937	45	\N	\N	\N
46	938	46	\N	\N	\N
47	938	47	\N	\N	\N
49	938	49	\N	\N	\N
50	938	50	\N	\N	\N
51	938	51	\N	\N	\N
52	938	52	\N	\N	\N
53	938	53	\N	\N	\N
54	804	54	\N	\N	\N
55	816	55	\N	\N	\N
56	869	56	\N	\N	\N
57	837	57	\N	\N	\N
58	834	58	\N	\N	\N
59	838	59	\N	\N	\N
60	835	60	\N	\N	\N
61	833	61	\N	\N	\N
62	836	62	\N	\N	\N
63	939	63	\N	\N	\N
64	528	64	\N	\N	\N
65	757	65	\N	\N	\N
66	808	66	\N	\N	\N
67	940	67	\N	\N	\N
68	941	68	\N	\N	\N
69	942	69	\N	\N	\N
70	943	70	\N	\N	\N
71	944	71	\N	\N	\N
73	945	73	\N	\N	\N
74	946	74	\N	\N	\N
75	947	75	\N	\N	\N
76	948	76	\N	\N	\N
77	949	77	\N	\N	\N
78	950	78	\N	\N	\N
79	951	79	\N	\N	\N
80	447	80	\N	\N	\N
82	953	82	\N	\N	\N
83	954	83	\N	\N	\N
84	955	84	\N	\N	\N
85	956	85	\N	\N	\N
86	958	86	\N	\N	\N
87	959	87	\N	\N	\N
88	960	88	\N	\N	\N
89	961	89	\N	\N	\N
90	806	90	\N	\N	\N
91	883	91	\N	\N	\N
92	962	92	\N	\N	\N
93	963	93	\N	\N	\N
94	828	94	\N	\N	\N
95	964	95	\N	\N	\N
96	965	96	\N	\N	\N
97	966	97	\N	\N	\N
99	727	99	\N	\N	\N
100	967	100	\N	\N	\N
101	968	101	\N	\N	\N
102	544	102	\N	\N	\N
103	969	103	\N	\N	\N
104	970	104	\N	\N	\N
105	971	105	\N	\N	\N
106	899	106	\N	\N	\N
107	972	107	\N	\N	\N
108	973	108	\N	\N	\N
109	974	109	\N	\N	\N
110	975	110	\N	\N	\N
111	976	111	\N	\N	\N
112	977	112	\N	\N	\N
113	84	113	\N	\N	\N
115	978	115	\N	\N	\N
116	261	116	\N	\N	\N
117	979	117	\N	\N	\N
118	980	118	\N	\N	\N
119	731	119	\N	\N	\N
120	981	120	\N	\N	\N
121	982	121	\N	\N	\N
122	533	122	\N	\N	\N
123	983	123	\N	\N	\N
124	984	124	\N	\N	\N
125	985	125	\N	\N	\N
126	986	126	\N	\N	\N
127	987	127	\N	\N	\N
128	853	128	\N	\N	\N
129	793	129	\N	\N	\N
130	826	130	\N	\N	\N
131	988	131	\N	\N	\N
132	453	132	\N	\N	\N
134	990	134	\N	\N	\N
135	991	135	\N	\N	\N
136	992	136	\N	\N	\N
137	993	137	\N	\N	\N
138	994	138	\N	\N	\N
139	995	139	\N	\N	\N
140	996	140	\N	\N	\N
141	538	141	\N	\N	\N
142	538	142	\N	\N	\N
143	997	143	\N	\N	\N
144	998	144	\N	\N	\N
145	999	145	\N	\N	\N
146	1000	146	\N	\N	\N
147	1001	147	\N	\N	\N
148	1002	148	\N	\N	\N
149	1003	149	\N	\N	\N
150	1004	150	\N	\N	\N
151	1005	151	\N	\N	\N
152	1006	152	\N	\N	\N
153	1007	153	\N	\N	\N
154	1008	154	\N	\N	\N
155	1009	155	\N	\N	\N
157	1010	157	\N	\N	\N
158	1012	158	\N	\N	\N
159	1013	159	\N	\N	\N
160	1014	160	\N	\N	\N
161	1015	161	\N	\N	\N
162	1017	162	\N	\N	\N
163	1018	163	\N	\N	\N
164	1019	164	\N	\N	\N
165	1020	165	\N	\N	\N
166	1021	166	\N	\N	\N
167	1022	167	\N	\N	\N
168	1023	168	\N	\N	\N
169	1024	169	\N	\N	\N
170	1025	170	\N	\N	\N
171	1026	171	\N	\N	\N
172	1028	172	\N	\N	\N
173	1029	173	\N	\N	\N
175	1030	175	\N	\N	\N
176	1031	176	\N	\N	\N
177	1032	177	\N	\N	\N
178	1033	178	\N	\N	\N
179	1034	179	\N	\N	\N
180	1035	180	\N	\N	\N
181	1036	181	\N	\N	\N
182	1037	182	\N	\N	\N
183	1040	183	\N	\N	\N
184	1041	184	\N	\N	\N
185	1042	185	\N	\N	\N
186	1043	186	\N	\N	\N
187	1044	187	\N	\N	\N
188	1045	188	\N	\N	\N
189	1046	189	\N	\N	\N
190	1047	190	\N	\N	\N
191	1048	191	\N	\N	\N
192	1050	192	\N	\N	\N
193	1051	193	\N	\N	\N
194	1052	194	\N	\N	\N
195	1053	195	\N	\N	\N
196	1054	196	\N	\N	\N
197	1055	197	\N	\N	\N
198	1056	198	\N	\N	\N
199	1057	199	\N	\N	\N
200	1059	200	\N	\N	\N
201	1060	201	\N	\N	\N
202	1061	202	\N	\N	\N
203	1062	203	\N	\N	\N
204	1063	204	\N	\N	\N
205	1065	205	\N	\N	\N
206	1066	206	\N	\N	\N
207	1067	207	\N	\N	\N
208	1068	208	\N	\N	\N
209	1069	209	\N	\N	\N
210	1070	210	\N	\N	\N
211	1071	211	\N	\N	\N
212	1072	212	\N	\N	\N
213	1073	213	\N	\N	\N
214	1074	214	\N	\N	\N
215	1075	215	\N	\N	\N
216	1076	216	\N	\N	\N
217	1077	217	\N	\N	\N
218	1078	218	\N	\N	\N
219	1079	219	\N	\N	\N
220	1080	220	\N	\N	\N
221	1081	221	\N	\N	\N
222	1082	222	\N	\N	\N
223	1083	223	\N	\N	\N
224	1084	224	\N	\N	\N
225	1085	225	\N	\N	\N
226	1086	226	\N	\N	\N
227	1087	227	\N	\N	\N
228	1088	228	\N	\N	\N
229	1091	229	\N	\N	\N
230	1092	230	\N	\N	\N
231	1093	231	\N	\N	\N
232	1094	232	\N	\N	\N
233	1095	233	\N	\N	\N
234	1097	234	\N	\N	\N
235	1098	235	\N	\N	\N
236	1099	236	\N	\N	\N
237	1100	237	\N	\N	\N
238	1101	238	\N	\N	\N
239	1103	239	\N	\N	\N
240	1104	240	\N	\N	\N
241	1105	241	\N	\N	\N
242	1106	242	\N	\N	\N
243	1107	243	\N	\N	\N
244	1108	244	\N	\N	\N
245	1109	245	\N	\N	\N
246	1110	246	\N	\N	\N
247	1112	247	\N	\N	\N
248	1115	248	\N	\N	\N
249	1116	249	\N	\N	\N
250	1117	250	\N	\N	\N
251	1118	251	\N	\N	\N
252	1119	252	\N	\N	\N
253	1120	253	\N	\N	\N
254	1121	254	\N	\N	\N
255	1122	255	\N	\N	\N
256	1123	256	\N	\N	\N
257	1124	257	\N	\N	\N
258	1126	258	\N	\N	\N
259	1127	259	\N	\N	\N
260	1129	260	\N	\N	\N
261	1128	261	\N	\N	\N
262	1130	262	\N	\N	\N
263	1131	263	\N	\N	\N
264	1132	264	\N	\N	\N
267	1135	267	\N	\N	\N
269	1134	269	\N	\N	\N
270	1133	270	\N	\N	\N
271	1136	271	\N	\N	\N
272	1139	272	\N	\N	\N
273	1140	273	\N	\N	\N
274	1141	274	\N	\N	\N
275	1142	275	\N	\N	\N
277	1143	277	\N	\N	\N
278	1144	278	\N	\N	\N
279	1145	279	\N	\N	\N
280	1146	280	\N	\N	\N
282	1147	282	\N	\N	\N
283	1148	283	\N	\N	\N
284	1149	284	\N	\N	\N
285	1150	285	\N	\N	\N
286	1151	286	\N	\N	\N
287	1152	287	\N	\N	\N
290	1153	290	\N	\N	\N
291	1154	291	\N	\N	\N
292	1155	292	\N	\N	\N
293	1156	293	\N	\N	\N
295	1157	295	\N	\N	\N
296	1158	296	\N	\N	\N
297	1159	297	\N	\N	\N
298	1160	298	\N	\N	\N
299	1161	299	\N	\N	\N
300	1162	300	\N	\N	\N
301	1163	301	\N	\N	\N
302	1164	302	\N	\N	\N
303	1165	303	\N	\N	\N
304	1166	304	\N	\N	\N
305	1167	305	\N	\N	\N
306	1168	306	\N	\N	\N
307	1169	307	\N	\N	\N
308	1170	308	\N	\N	\N
309	1171	309	\N	\N	\N
310	1172	310	\N	\N	\N
311	1173	311	\N	\N	\N
312	1174	312	\N	\N	\N
313	1175	313	\N	\N	\N
314	1176	314	\N	\N	\N
315	1177	315	\N	\N	\N
317	1178	317	\N	\N	\N
318	1179	318	\N	\N	\N
319	1180	319	\N	\N	\N
320	1181	320	\N	\N	\N
321	1182	321	\N	\N	\N
323	1183	323	\N	\N	\N
324	1184	324	\N	\N	\N
325	1185	325	\N	\N	\N
326	1186	326	\N	\N	\N
327	1187	327	\N	\N	\N
328	1188	328	\N	\N	\N
330	1189	330	\N	\N	\N
331	1190	331	\N	\N	\N
332	1191	332	\N	\N	\N
333	1192	333	\N	\N	\N
334	1193	334	\N	\N	\N
335	1194	335	\N	\N	\N
337	1195	337	\N	\N	\N
338	1196	338	\N	\N	\N
339	1197	339	\N	\N	\N
340	1199	340	\N	\N	\N
341	1200	341	\N	\N	\N
342	1201	342	\N	\N	\N
343	1202	343	\N	\N	\N
344	1203	344	\N	\N	\N
345	1204	345	\N	\N	\N
346	1205	346	\N	\N	\N
347	1206	347	\N	\N	\N
348	1207	348	\N	\N	\N
349	1208	349	\N	\N	\N
350	1209	350	\N	\N	\N
351	1210	351	\N	\N	\N
352	1211	352	\N	\N	\N
353	1212	353	\N	\N	\N
354	1213	354	\N	\N	\N
355	1214	355	\N	\N	\N
356	1215	356	\N	\N	\N
357	1216	357	\N	\N	\N
358	1218	358	\N	\N	\N
359	1219	359	\N	\N	\N
360	1220	360	\N	\N	\N
361	1221	361	\N	\N	\N
362	1222	362	\N	\N	\N
363	1223	363	\N	\N	\N
364	1224	364	\N	\N	\N
365	1225	365	\N	\N	\N
366	1226	366	\N	\N	\N
367	1227	367	\N	\N	\N
368	1228	368	\N	\N	\N
369	1229	369	\N	\N	\N
370	1230	370	\N	\N	\N
372	1231	372	\N	\N	\N
373	1232	373	\N	\N	\N
374	1233	374	\N	\N	\N
375	1234	375	\N	\N	\N
376	1236	376	\N	\N	\N
377	1237	377	\N	\N	\N
378	1238	378	\N	\N	\N
379	1239	379	\N	\N	\N
380	1240	380	\N	\N	\N
381	1241	381	\N	\N	\N
382	1242	382	\N	\N	\N
383	1243	383	\N	\N	\N
384	1245	384	\N	\N	\N
385	1246	385	\N	\N	\N
386	1247	386	\N	\N	\N
387	1248	387	\N	\N	\N
389	1249	389	\N	\N	\N
390	1250	390	\N	\N	\N
391	1251	391	\N	\N	\N
392	1252	392	\N	\N	\N
393	1253	393	\N	\N	\N
394	1254	394	\N	\N	\N
395	1255	395	\N	\N	\N
396	1256	396	\N	\N	\N
397	1257	397	\N	\N	\N
398	840	398	\N	\N	\N
399	1258	399	\N	\N	\N
400	1259	400	\N	\N	\N
401	1260	401	\N	\N	\N
402	1261	402	\N	\N	\N
403	1262	403	\N	\N	\N
404	1264	404	\N	\N	\N
405	1265	405	\N	\N	\N
406	1266	406	\N	\N	\N
407	1267	407	\N	\N	\N
408	1268	408	\N	\N	\N
409	1269	409	\N	\N	\N
410	1270	410	\N	\N	\N
411	1271	411	\N	\N	\N
412	1272	412	\N	\N	\N
413	1273	413	\N	\N	\N
414	1274	414	\N	\N	\N
415	1275	415	\N	\N	\N
416	1276	416	\N	\N	\N
417	1277	417	\N	\N	\N
418	1278	418	\N	\N	\N
419	1279	419	\N	\N	\N
420	1280	420	\N	\N	\N
421	1281	421	\N	\N	\N
422	1282	422	\N	\N	\N
423	1283	423	\N	\N	\N
424	1284	424	\N	\N	\N
425	1285	425	\N	\N	\N
426	1286	426	\N	\N	\N
427	1287	427	\N	\N	\N
428	1288	428	\N	\N	\N
429	1289	429	\N	\N	\N
430	1290	430	\N	\N	\N
431	1291	431	\N	\N	\N
432	1292	432	\N	\N	\N
433	1293	433	\N	\N	\N
434	1294	434	\N	\N	\N
435	1295	435	\N	\N	\N
436	1296	436	\N	\N	\N
437	1297	437	\N	\N	\N
438	1298	438	\N	\N	\N
439	1299	439	\N	\N	\N
440	1300	440	\N	\N	\N
441	1301	441	\N	\N	\N
442	1302	442	\N	\N	\N
444	1303	444	\N	\N	\N
446	1304	446	\N	\N	\N
447	1305	447	\N	\N	\N
449	1306	449	\N	\N	\N
450	1307	450	\N	\N	\N
451	1308	451	\N	\N	\N
452	1309	452	\N	\N	\N
453	1310	453	\N	\N	\N
454	1311	454	\N	\N	\N
455	1312	455	\N	\N	\N
456	1313	456	\N	\N	\N
457	1314	457	\N	\N	\N
458	1315	458	\N	\N	\N
459	1317	459	\N	\N	\N
460	1318	460	\N	\N	\N
461	1319	461	\N	\N	\N
\.


--
-- TOC entry 2813 (class 0 OID 44245)
-- Dependencies: 238
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (id, ficha_no, titulo, autor, datos_fijos, codebar, observaciones, tipo_material_id, status_libro, empresa_id, editorial_id, creado_por_id, ip, host, deleted_at, created_at, updated_at, searchtext) FROM stdin;
933	1584	¡ AH QUE HUEVOS TIENE LA CIENCIA !	SANCHEZ TIQUE, MARIA GUADALUPE				1	1	1	162	2			\N	2021-11-08 14:08:33	2021-11-08 14:08:33	'ah':1 'cienci':6 'guadalup':10 'huev':3 'mari':9 'sanchez':7 'tiqu':8
937	744	¿BULLYING?: LIBERATE DEL ACOSO ESCOLAR	COBO, PALOMA				1	1	1	167	2			\N	2021-11-17 13:15:52	2021-11-17 13:15:52	'acos':4 'bullying':1 'cob':6 'escol':5 'liberat':2 'palom':7
938	2747	¿COMO VES? REVISTA DE DIVULGACIÓN DE LA CIENCIA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO				1	1	1	179	2			\N	2021-11-22 13:55:15	2021-11-22 13:55:15	'autonom':11 'cienci':8 'divulg':5 'mexic':13 'nacional':10 'revist':3 'univers':9 'ves':2
804	758	¿CÓMO VIVIMOS LOS MEXICANOS? DATOS CURIOSOS E IMAGENES SOBRE LOS NIVELES SOCIECONÓMICOS EN MÉXICO	LOPEZ ROMO, HERIBERTO				1	1	1	176	2			\N	2021-10-18 13:25:59	2021-11-30 14:33:35	'com':1 'curios':6 'dat':5 'heribert':17 'imagen':8 'lopez':15 'mexic':14 'mexican':4 'nivel':11 'rom':16 'socieconom':12 'viv':2
951	1737	¿Y EL MEDIO AMBIENTE?	MEXICO, SECRETARIA DE MEDIO AMBIENTE Y RECURSOS NA				1	1	1	38	2			\N	2021-12-01 18:57:44	2021-12-01 18:57:44	'ambient':4,9 'medi':3,8 'mexic':5 'na':12 'recurs':11 'secretari':6
962	2395	30,000 AÑOS DE ARTE: LA HISTORIA DE LA CREATIVIDAD HUMANA A TRAVÉZ DEL TIEMPO Y EL ESPACIO	JOHN POWNER				1	1	1	31	2			\N	2021-12-07 14:15:33	2021-12-07 14:15:33	'000':2 '30':1 'arte':5 'años':3 'creativ':10 'espaci':18 'histori':7 'human':11 'john':19 'pown':20 'tiemp':15 'travez':13
1033	1133	FORUM METHODE DE FRANÇAIS 1	BAYLON, CHRISTIAN; CAMPA, ANGELS; MESTREIT, CLAUDE			3018,3019,3082,3129,3130,3131,3132,3133,3134,3135,3136,3137,3138,3139,3346,3347	1	1	1	247	2			\N	2022-01-11 18:20:11	2022-01-11 18:20:11	'1':5 'angels':9 'baylon':6 'camp':8 'christi':7 'claud':11 'forum':1 'français':4 'mestreit':10 'method':2
998	1	TECNICAS DE INVESTIGACION SOCIAL	ANDER EGG, EZEQUIEL			1	1	1	1	244	2			\N	2022-01-04 19:43:27	2022-01-04 19:46:30	'ander':5 'egg':6 'ezequiel':7 'investigacion':3 'social':4 'tecnic':1
1001	5	COMO HACER UNA INVESTIGACION	PEREZ AVILA, NOE			7	1	1	1	245	2			\N	2022-01-05 14:22:59	2022-01-05 14:22:59	'avil':6 'hac':2 'investigacion':4 'noe':7 'perez':5
1008	689	MANUAL PARA LA PRESENTACION DE ANTEPROYECTOS E INFORMES DE INVESTIGACIÓN	SCHMELKES, CORINA			2823,2829,2830,2831,2832,3757,3758,3759,3760,3761,3762,3763,3764	1	1	1	245	2			\N	2022-01-05 19:43:34	2022-01-05 19:46:55	'anteproyect':6 'corin':12 'inform':8 'investig':10 'manual':1 'presentacion':4 'schmelk':11
1023	385	ACTAS DEL SIMPOSIO DEL MONTEVIDEO ENERO DE 1966	ASOCIACION DE LINGUISTICA Y FILOLOGIA DE LA AMERIC			776,777	1	1	1	245	2			\N	2022-01-11 15:12:45	2022-01-11 15:12:45	'1966':8 'actas':1 'americ':16 'asociacion':9 'ener':6 'filologi':13 'linguist':11 'montevide':5 'simposi':3
1028	1032	CAMPUS METHO DE FRANÇAIS 2	GIRARDET, JACKY Y PECHEUR, JACQUES			2491,2492,2493,2494,2495	1	1	1	245	2			\N	2022-01-11 16:37:46	2022-01-11 16:37:46	'2':5 'campus':1 'français':4 'girardet':6 'jacky':7 'jacqu':10 'meth':2 'pecheur':9
1030	1034	CAMPUS 1 METHODE DE FRANÇAIS	GIRADET, JACKY Y PECHEUR, JACQUES			2501,2502,2503,2504,2505,2506,2507,2508,2509	1	1	1	245	2			\N	2022-01-11 16:44:40	2022-01-11 16:48:08	'1':2 'campus':1 'français':5 'giradet':6 'jacky':7 'jacqu':10 'method':3 'pecheur':9
1029	1033	CAMPUS 1 METHODE DE FRANÇAIS CAHIER D'EXERCICES	GIRADET, JACKY Y PECHEUR, JACQUES			2496,2497,2498,2499,2500,4268,4269,4270,4271	1	1	1	245	2			\N	2022-01-11 16:42:04	2022-01-11 16:48:42	'1':2 'cahi':6 'campus':1 'd':7 'exercic':8 'français':5 'giradet':9 'jacky':10 'jacqu':13 'method':3 'pecheur':12
1031	1096	TEMPO 1 METHODE DE FRANÇAIS	BERARD, EVELYNE; CANIER, YVES Y LAVENNE, CHRISTIAN			2905,2906,2907,3833,3834,4396,	1	1	1	246	2			\N	2022-01-11 16:52:03	2022-01-11 16:52:14	'1':2 'berard':6 'cani':8 'christi':12 'evelyn':7 'français':5 'lavenn':11 'method':3 'temp':1 'yves':9
1041	306	PLANEACION ESCOLAR Y FORMULACION DE PROYECTOS: LEC	AGUILAR,JOSE ANTONIO			2817,2818,2819,2820	1	1	1	60	2			\N	2022-01-11 19:26:03	2022-01-11 19:26:03	'aguil':8 'antoni':10 'escol':2 'formulacion':4 'jos':9 'lec':7 'planeacion':1 'proyect':6
1054	1052	TRANSMISION DE DATOS Y REDES DE COMUNICACIONES	FOROUZAN, BEHROUZ A.			73,74,75,76,77,78	1	1	1	245	2			\N	2022-01-12 15:53:42	2022-01-12 15:53:42	'behrouz':9 'comun':7 'dat':3 'forouz':8 'red':5 'transmision':1
1056	1048	COMO FUNCIONA WINDOWS VISTA	MILLER, MICHAEL			49,50,51,52,53,54,55,56,57,58	1	1	1	111	2			\N	2022-01-14 15:00:42	2022-01-14 15:00:42	'funcion':2 'michael':6 'mill':5 'vist':4 'windows':3
1059		MANUAL AVANZADO DE COMPUTACION	GRUPO EDITORIAL			5094,5095	1	1	1	245	2			\N	2022-01-14 16:27:14	2022-01-14 16:27:14	'avanz':2 'computacion':4 'editorial':6 'grup':5 'manual':1
1062	437	SKYLINE 3 STUDENT'S BOOK	BREWSTER, SIMON / DAVIES, PAUL / ROGERS, MICKEY			887	1	1	1	68	2			\N	2022-01-14 17:33:19	2022-01-14 17:33:19	'3':2 'book':5 'brewst':6 'davi':8 'mickey':11 'paul':9 'rogers':10 's':4 'simon':7 'skylin':1 'student':3
1063	427	A CONTENT-BASED READING BOOK	WEGMANN, BRENDA Y PRIJIC KNEZEVIC MIKI			860	1	1	1	245	2			\N	2022-01-14 23:49:24	2022-01-14 23:49:24	'bas':4 'book':6 'brend':8 'content':3 'content-bas':2 'knezevic':11 'miki':12 'prijic':10 'reading':5 'wegmann':7
1081	424	A COMMUNICATIVE GRAMMAR	KIRN, ELAINE Y JACK, DARCY			1517	1	1	1	245	2			\N	2022-01-18 15:34:24	2022-01-18 15:34:24	'communicativ':2 'darcy':8 'elain':5 'gramm':3 'jack':7 'kirn':4
1082	1059	FUNDAMENTALS OF ENGLISH GRAMMAR	SCHRAMPFER AZAR, BETTY			2692,2693,2694,2695,2696,2697,2698,2699,2700,2701,4106,4107	1	1	1	245	2			\N	2022-01-18 15:37:02	2022-01-18 15:37:02	'azar':6 'betty':7 'english':3 'fundamentals':1 'gramm':4 'of':2 'schrampf':5
1083	365	SIETE ESTUDIOS SOBRE EL ESPANOL DE AMERICA	GUITARTE, GUILLERMO L.			3193,3194	1	1	1	245	2			\N	2022-01-18 15:40:56	2022-01-18 15:41:49	'amer':7 'espanol':5 'estudi':2 'guillerm':9 'guitart':8 'l':10 'siet':1
1085	1488	GESTION DE DESTINOS TURISTICOS: COMO ATRAER PERSON	VIGNATI SCARPATI, FEDERICO			4575,4576,4577,4779,4780,4781	1	1	1	245	2			\N	2022-01-18 18:01:37	2022-01-18 18:01:37	'atra':6 'destin':3 'feder':10 'gestion':1 'person':7 'scarpati':9 'turist':4 'vignati':8
1086	1496	AGENCIAS DE VIAJES: ESTRUCTURA Y OPERACION	TORRE, FRANCISCO DE LA			4600,4601,4602	1	1	1	60	2			\N	2022-01-19 15:22:20	2022-01-19 15:22:20	'agenci':1 'estructur':4 'francisc':8 'operacion':6 'torr':7 'viaj':3
934	1146	¡PORQUE! PORQUERIA LAS HORMONAS: SOBRE GRANITOS, CRECIMIENTO, SEXO Y OTRAS SEÑALES EN EL CUERPO	CALVA, JUAN CARLOS				1	1	1	40	2			\N	2021-11-08 14:24:25	2021-11-08 14:24:25	'calv':15 'carl':17 'crecimient':7 'cuerp':14 'granit':6 'hormon':4 'juan':16 'porqueri':2 'sex':8 'señal':11
869	822	¿ERES PERFECCIONISTA?: DESCUBRE LO MALO DE SER DEMASIADO BUENO	ADDERHOLDT ELLIOT, MIRIAM				1	1	1	88	2			\N	2021-10-18 19:41:22	2021-11-30 14:34:24	'adderholdt':10 'buen':9 'demasi':8 'descubr':3 'elliot':11 'mal':5 'miriam':12 'perfeccion':2 'ser':7
963	1478	31 WAYS TO CHANGE THE WORLD: BY 4,381 CHILDREN, WE	STANHOPE, NICK				1	1	1	235	2			\N	2021-12-07 14:21:32	2021-12-07 14:22:18	'31':1 '381':9 '4':8 'by':7 'chang':4 'childr':10 'nick':13 'stanhop':12 'the':5 'to':3 'ways':2 'we':11 'world':6
999	2	DIDACTICA PARA SEMINARIO DE TESIS...EL PROTOCOLO D	ANDRADE TORRES, JUAN			2,3	1	1	1	245	2			\N	2022-01-04 19:50:59	2022-01-04 19:51:44	'andrad':9 'd':8 'didact':1 'juan':11 'protocol':7 'seminari':3 'tesis':5 'torr':10
1002	6	REDACCION E INVESTIGACION DOCUMENTAL	CENTENO AVILA, JAVIER			8,9	1	1	1	245	2			\N	2022-01-05 14:25:53	2022-01-05 14:26:55	'avil':6 'centen':5 'documental':4 'investigacion':3 'javi':7 'redaccion':1
1009	676	¿COMO HACER UNA TESIS?	MERCADO, SALVADOR			2840,2841,2842,2843,2844,2845,2846	1	1	1	245	2			\N	2022-01-05 19:46:49	2022-01-05 19:46:49	'hac':2 'merc':5 'salvador':6 'tesis':4
1012	1453	DISENO DE SISTEMAS DE INFORMACION: TEORIA Y PRACTICAS	BURCH,JOHN G.,GRUDNITSKI GARY			4319,4320,4321,4332,4333,4915,	1	1	1	57	2			\N	2022-01-06 15:03:53	2022-01-06 19:40:30	'burch':9 'disen':1 'g':11 'gary':13 'grudnitski':12 'informacion':5 'john':10 'practic':8 'sistem':3 'teori':6
1024	419	ACTAS DEL VI CONGRESO INTERNACIONAL DE LA ASOCIACI	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			851,852	1	1	1	245	2			\N	2022-01-11 15:15:48	2022-01-11 15:15:48	'actas':1 'asociaci':8 'autonom':11 'congres':4 'internacional':5 'mexic':13 'nacional':10 'univers':9 'vi':3
1032	1104	LE NOUVEL ESPACES 2 METHODE DE FRANÇAIS	CAPELLE, GUY Y GIDON, NOELLE			2964,2965,2966,2967,2968,	1	1	1	247	2			\N	2022-01-11 16:54:47	2022-01-11 16:58:10	'2':4 'capell':8 'espac':3 'français':7 'gidon':11 'guy':9 'method':5 'noell':12 'nouvel':2
1034	1132	FORUM METHODE DE FRANÇAIS	CAMPA, ANGELS; MURILLO, JULIO; MESTREIT, CLAUDE, T			3128	1	1	1	247	2			\N	2022-01-11 18:21:58	2022-01-11 18:21:58	'angels':6 'camp':5 'claud':10 'forum':1 'français':4 'juli':8 'mestreit':9 'method':2 'murill':7 't':11
1042	235	LENGUA ESCRITA DE ESCOLARES DE PRIMARIA DEL DISTRI	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			2821,2822	1	1	1	179	2			\N	2022-01-11 19:28:39	2022-01-11 19:28:39	'autonom':11 'distri':8 'escolar':4 'escrit':2 'lengu':1 'mexic':13 'nacional':10 'primari':6 'univers':9
1055	1376	AMPLIAR, CONFIGURAS Y REPARAR SU PC	DURAN RODRIGUEZ, LUIS			3884,3885,3886,3887,3888,3889	1	1	1	249	2			\N	2022-01-12 15:57:13	2022-01-14 14:57:44	'ampli':1 'configur':2 'dur':7 'luis':9 'pc':6 'repar':4 'rodriguez':8
1057	1051	INTRODUCCION A LA COMPUTACION	NORTON, PETER			59,60,61,62,63,64,65,66	1	1	1	245	2			\N	2022-01-14 15:05:20	2022-01-14 15:05:20	'computacion':4 'introduccion':1 'norton':5 'pet':6
1060	1712	AUTOCAD 2007 AVANZADO	ZAPIRAIN, J. A. TAJADURA			5173,5174,5175	1	1	1	61	2			\N	2022-01-14 16:31:20	2022-01-14 16:31:20	'2007':2 'autoc':1 'avanz':3 'j':5 'tajadur':7 'zapirain':4
1084	228	MERCADOTECNIA Y PRODUCTIVIDAD TURISTICA	CARDENAS TABARES,FABIO			2855,2856,2857,2858,2859,2860	1	1	1	60	2			\N	2022-01-18 15:45:34	2022-01-18 15:45:34	'carden':5 'fabi':7 'mercadotecni':1 'product':3 'tabar':6 'turist':4
1087	1561	ANTEPROYECTOS DE INVESTIGACION TURISTICA: METODOLO	ESPINOSA CASTILLO, MARIBEL			4843,4844,4845,	1	1	1	60	2			\N	2022-01-19 15:25:27	2022-01-19 15:25:27	'anteproyect':1 'castill':7 'espin':6 'investigacion':3 'maribel':8 'metodol':5 'turist':4
935	2493	¡QUIETOS POR FAVOR!	MONSIVAIS, CARLOS				1	1	1	225	2			\N	2021-11-08 14:33:37	2021-11-08 14:43:40	'carl':5 'favor':3 'monsivais':4 'quiet':1
837	791	¿PARA QUE SIRVE UN ADJETIVO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:48:25	2021-11-30 14:35:02	'adjet':5 'dehes':6 'ines':8 'juan':7 'sirv':3
953	2063	100 ANALOGÍAS CIENTÍFICAS	LEVY, JOEL				1	1	1	229	2			\N	2021-12-01 20:13:51	2021-12-01 20:14:06	'100':1 'analog':2 'cientif':3 'joel':5 'levy':4
964	965	40 AÑOS MOVIMIENTO ESTUDIANTIL DEL 68	AVILES CAVASOLA, JUNCIA				1	1	1	179	2			\N	2021-12-07 20:13:39	2021-12-07 20:13:39	'40':1 '68':6 'avil':7 'años':2 'cavasol':8 'estudiantil':4 'junci':9 'movimient':3
1000	3	GUIA PARA LA REALIZACION DE PROYECTOS DE INVESTIGA	ANDRADE TORRES, JUAN			4,5	1	1	1	245	2			\N	2022-01-04 19:53:58	2022-01-04 19:53:58	'andrad':9 'gui':1 'investig':8 'juan':11 'proyect':6 'realizacion':4 'torr':10
1003	1122	COMO HACER UNA TESIS	TABORGA, HUASCAR			1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36	1	1	1	245	2			\N	2022-01-05 14:28:20	2022-01-05 14:30:44	'hac':2 'huasc':6 'taborg':5 'tesis':4
18	17	LIBRO PARA EL MAESTRO : EDUCACION SECUNDARIA ESPAN	.				1	1	1	58	2			\N	2021-10-04 14:46:47	2021-10-04 14:46:47	'educacion':5 'espan':7 'libr':1 'maestr':4 'secundari':6
8	8	ESPANOL UNO	.				1	1	1	51	2			\N	2021-10-04 14:12:19	2021-10-04 16:30:40	'espanol':1
22	22	ESPANOL 3 CUADERNO DE TRABAJO	GARCIA, PELAYO OLIVIA				1	1	1	52	2			\N	2021-10-04 14:56:35	2021-10-04 14:56:35	'3':2 'cuadern':3 'espanol':1 'garci':6 'olivi':8 'pelay':7 'trabaj':5
1010	1453	COMO FORMAR INVESTIGADORES CASOS EXITOSOS	COMISION DE INVESTIGACION FIMPES			4241	1	1	1	245	2			\N	2022-01-05 19:48:33	2022-01-06 14:57:46	'cas':4 'comision':6 'exit':5 'fimp':9 'form':2 'investig':3 'investigacion':8
1013	1783	METODOLOGIA DE LA INVESTIGACION	DR. HERNANDEZ SAMPIERI ROBERTO			5292,5293	1	1	1	61	2			\N	2022-01-06 15:21:06	2022-01-06 19:39:53	'dr':5 'hernandez':6 'investigacion':4 'metodologi':1 'robert':8 'sampieri':7
1025	1214	BALAM: EL JAGUAR A TRAVES DE LOS TIEMPOS Y LOS ESP	VALVERDE VALDES, MARIA DEL CARMEN			3314,3315	1	1	1	179	2			\N	2022-01-11 15:17:55	2022-01-11 15:17:55	'balam':1 'carm':16 'esp':11 'jagu':3 'mari':14 'tiemp':8 'trav':5 'vald':13 'valverd':12
1035	1411	ALTER EGO METHODE DE FRANÇAIS 2	BERTHET, ANNIE; HUGOT, CATHERINE; KIZIRIAN, VERONI			3389,4110,4111,4112,4113	1	1	1	247	2			\N	2022-01-11 18:23:47	2022-01-11 18:23:47	'2':6 'alter':1 'anni':8 'berthet':7 'catherin':10 'ego':2 'français':5 'hugot':9 'kiziri':11 'method':3 'veroni':12
1043	1092	OXFORD GUIDE TO BRITISH AND AMERICAN CULTURE	OXFORD GUIDE TO BRITISH AND AMERICAN CULTURE			2880,2881,2882,2883,2884,2885,2886,2887,2888,2889,2890,2891,2892	1	1	1	245	2			\N	2022-01-11 19:31:49	2022-01-11 19:31:49	'americ':6,13 'and':5,12 'british':4,11 'cultur':7,14 'guid':2,9 'oxford':1,8 'to':3,10
1058	1091	ANALISIS Y DISENO DE SISTEMAS DE INFORMACION	SENN, JAMES A.			67,68,69,70,71,72	1	1	1	245	2			\N	2022-01-14 15:13:37	2022-01-14 15:13:37	'analisis':1 'disen':3 'informacion':7 'jam':9 'senn':8 'sistem':5
1061	1713	JAVA 2: INTERFACES GRAFICAS Y APLICACIONES PARA IN	CEBALLOS, FRANCISCO JAVIER			5176	1	1	1	217	2			\N	2022-01-14 16:33:51	2022-01-14 16:33:51	'2':2 'aplic':6 'ceball':9 'francisc':10 'grafic':4 'in':8 'interfac':3 'jav':1 'javi':11
1065	430	A LISTENING, SPEAKING SKILLS BOOK	TANKA, JUDITH Y MOST, PAUL			863	1	1	1	245	2			\N	2022-01-14 23:53:13	2022-01-14 23:53:13	'book':5 'judith':7 'listening':2 'most':9 'paul':10 'skills':4 'speaking':3 'tank':6
1088	1727	MARKETING ESTRATEGICO EN TURISMO	CORDERO RAMIREZ, JAVIER			5208	1	1	1	60	2			\N	2022-01-19 21:00:52	2022-01-19 21:00:52	'corder':5 'estrateg':2 'javi':7 'marketing':1 'ramirez':6 'turism':4
1092	778	MEMORIAS DEL PRIMER CONGRESO INTERNACIONAL DE MAYI	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			778,779	1	1	1	245	2			\N	2022-01-21 15:49:45	2022-01-21 15:49:45	'autonom':10 'congres':4 'internacional':5 'mayi':7 'memori':1 'mexic':12 'nacional':9 'prim':3 'univers':8
1093	387	MEMORIA: DE LA V REUNION DE TRABAJO DE LA COMISION	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			780,781	1	1	1	245	2			\N	2022-01-21 15:51:45	2022-01-21 15:51:45	'autonom':13 'comision':10 'memori':1 'mexic':15 'nacional':12 'reunion':5 'trabaj':7 'univers':11 'v':4
1094	391	EL PROBLEMA DE LAS LENGUAS EN CONTACTO	SALA, MARIUS			788,789,790	1	1	1	245	2			\N	2022-01-21 15:53:32	2022-01-21 15:53:32	'contact':7 'lengu':5 'marius':9 'problem':2 'sal':8
1095	395	EN TORNO AL GENERO LITERARIO DEL AGRICOLA DE TACIT	TAPIA ZUNIGA, JOSE			799,800,801,802	1	1	1	245	2			\N	2022-01-21 16:05:56	2022-01-21 16:05:56	'agricol':7 'gener':4 'jos':12 'literari':5 'tacit':9 'tapi':10 'torn':2 'zunig':11
1097	396	GRAVITACION CUBANA EN LA REVISTA AZUL	SUAREZ LEON, CARMEN			803,804	1	1	1	245	2			\N	2022-01-21 16:07:47	2022-01-21 16:07:47	'azul':6 'carm':9 'cuban':2 'gravitacion':1 'leon':8 'revist':5 'suarez':7
1098	806	PRECIS DE CONJUGAISON	CHOLLET, ISABELLE			4502,4503,4504,4505,4506,4507,4508,4509,4510,4511	1	1	1	245	2			\N	2022-01-21 16:12:06	2022-01-21 16:13:04	'chollet':4 'conjugaison':3 'isabell':5 'precis':1
1099	400	EPICHIREMA	REYES CORIA, BULMARO			811,812	1	1	1	245	2			\N	2022-01-21 16:16:18	2022-01-21 16:16:18	'bulmar':4 'cori':3 'epichirem':1 'rey':2
1100	402	LA GENERACION DE MEDIO SIGLO	PEREIRA, ARMANDO			815	1	1	1	245	2			\N	2022-01-24 14:35:09	2022-01-24 14:35:09	'armand':7 'generacion':2 'medi':4 'pereir':6 'sigl':5
1104	405	HOMBRE DE BIEN ORADOR PERFECTO	REYES CORIA, BULMARO			820,821	1	1	1	245	2			\N	2022-01-24 14:45:21	2022-01-24 14:45:21	'bien':3 'bulmar':8 'cori':7 'hombr':1 'orador':4 'perfect':5 'rey':6
1105	417	LA INVESTIGACION FILOLOGICA EN EL CENTRO DE LINGUI	LUNA TRAILL, ELIZABETH			843,844	1	1	1	245	2			\N	2022-01-24 14:48:43	2022-01-24 14:48:43	'centr':6 'elizabeth':11 'filolog':3 'investigacion':2 'lingui':8 'lun':9 'traill':10
1106	417	VLA INVESTIGACION FILOLOGICA EN EL CENTRO DE LINGUI	LUNA TRAILL, ELIZABETH			843,844	2	1	1	245	2			\N	2022-01-24 14:51:55	2022-01-24 14:51:55	'centr':6 'elizabeth':11 'filolog':3 'investigacion':2 'lingui':8 'lun':9 'traill':10 'vla':1
1107	763	JORNADAS FILOLOGICAS 1998 MEMORIA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			762,763	1	1	1	245	2			\N	2022-01-24 15:51:41	2022-01-24 15:51:41	'1998':3 'autonom':7 'filolog':2 'jorn':1 'memori':4 'mexic':9 'nacional':6 'univers':5
246	260	¡SAL SI PUEDES!:LABERINTOS Y ROMPECABEZAS MATEMÁTICOS	SNAPE,CHARLES				1	1	1	89	2			\N	2021-10-05 19:19:09	2021-11-08 15:29:44	'charl':9 'laberint':4 'matemat':7 'pued':3 'rompecabez':6 'sal':1 'si':2 'snap':8
939	2031	¿PINTAMOS MANDALAS?: APARTIR DE 5 AÑOS	FALCON, GLORIA				1	1	1	167	2			\N	2021-11-30 14:55:23	2021-11-30 14:55:23	'5':5 'apart':3 'años':6 'falcon':7 'glori':8 'mandal':2 'pint':1
954	2450	100 IDEAS QUE CAMBIARÓN EL ARTE	BIRD, MICHAEL				1	1	1	230	2			\N	2021-12-01 20:27:00	2021-12-01 20:27:24	'100':1 'arte':6 'bird':7 'cambiaron':4 'ide':2 'michael':8
965	2009	50 COSAS QUE HAY QUE SABER SOBRE ARQUITECTURA	WILKINSON, PHILIP				1	1	1	10	2			\N	2021-12-07 20:30:47	2021-12-07 20:30:47	'50':1 'arquitectur':8 'cos':2 'philip':10 'sab':6 'wilkinson':9
1004	7	LA LECTURA ANALITICO-CRITICA: UN ENFOQUE COGNOSCIT	KABALEN, DONNA MARIE			37,38,39	1	1	1	245	2			\N	2022-01-05 14:32:51	2022-01-05 14:32:51	'analit':4 'analitico-crit':3 'cognoscit':8 'critic':5 'donn':10 'enfoqu':7 'kabal':9 'lectur':2 'mari':11
1014	1666	METODOLOGÍA DE LA INVESTIAGACIÓN CIENTÍFICA Y TECNOLÓGICA	CEGARRA SANCHEZ, JOSE			5079,5080	1	1	1	245	2			\N	2022-01-06 19:28:27	2022-01-06 19:31:12	'cegarr':8 'cientif':5 'investiag':4 'jos':10 'metodolog':1 'sanchez':9 'tecnolog':7
1026	226	ESPACIOS MAYAS : REPRESENTACIONES,USOS,CREENCIAS	UNIVERSIDAD NACIONAL AUTOMA DE MEXICO			2984,2985	1	1	1	245	2			\N	2022-01-11 15:20:47	2022-01-11 15:20:47	'autom':8 'creenci':5 'espaci':1 'may':2 'mexic':10 'nacional':7 'represent':3 'univers':6 'usos':4
1036	1411	LE NOUVEAU SANS FRONTIERES 1	DOMINIQUE, PHILIPPE; GIRARDET, JACKY; VERDALHAN, M			3798,3799,3800,3801,3802,	1	1	1	248	2			\N	2022-01-11 18:26:55	2022-01-11 18:26:55	'1':5 'dominiqu':6 'frontier':4 'girardet':8 'jacky':9 'm':11 'nouveau':2 'philipp':7 'sans':3 'verdalh':10
1044	233	LAS POLITICAS PUBLICAS EN MATERIA EDUCATIVA	DIAZ PINA,ANTONIO			2835,2836	1	1	1	245	2			\N	2022-01-11 19:34:25	2022-01-11 19:34:25	'antoni':9 'diaz':7 'educ':6 'materi':5 'pin':8 'polit':2 'public':3
1066	431	SKYLINE 1 WORKBOOK	FUSCOE, KATE			864,865,866,867,868	1	1	1	245	2			\N	2022-01-14 23:55:34	2022-01-14 23:55:34	'1':2 'fusco':4 'kat':5 'skylin':1 'workbook':3
1089	1731	PROYECTOS TURISTICOS: FORMULACION Y EVALUACION	HERNANDEZ DIAZ, EDGAR ALFONSO			5223	1	1	1	60	2			\N	2022-01-19 21:02:29	2022-01-19 21:02:29	'alfons':9 'diaz':7 'edgar':8 'evaluacion':5 'formulacion':3 'hernandez':6 'proyect':1 'turist':2
1101	403	INDICE DE REVISTAS LITERARIAS DEL SIGLO XIX (CIUDA	RUIZ CASTANEDA, MARIA DEL CARMEN			816,817	1	1	1	245	2			\N	2022-01-24 14:38:40	2022-01-24 14:38:40	'carm':13 'castaned':10 'ciud':8 'indic':1 'literari':4 'mari':11 'revist':3 'ruiz':9 'sigl':6 'xix':7
1108	381	DICCIONARIO DE LITERATURA MEXICANA SIGLO XX	PEREIRA, ARMANDO Y ALBARRAN,CLAUDIA			764,765	1	1	1	245	2			\N	2022-01-24 15:53:26	2022-01-24 15:53:26	'albarr':10 'armand':8 'claudi':11 'diccionari':1 'literatur':3 'mexican':4 'pereir':7 'sigl':5 'xx':6
1110	384	BOCABULARIO DE MAYA THAN	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			772,773,774,775	1	1	1	245	2			\N	2022-01-24 16:05:37	2022-01-24 16:05:37	'autonom':7 'bocabulari':1 'may':3 'mexic':9 'nacional':6 'than':4 'univers':5
936	2652	¡VIVA LA REVOLUCIÓN!: THE MONEY OF THE MEXICAN REVOLUTION	BAILEY, DON				1	1	1	220	2			\N	2021-11-08 15:30:51	2021-11-08 15:30:51	'bailey':10 'don':11 'mexic':8 'money':5 'of':6 'revolu':3 'revolution':9 'the':4,7 'viv':1
757	712	¿PORQUÉ ES TAN DIFICIL SER PADRE HOY?. SIMETRIA INCONCIENTE DE NIÑOS Y JOVENES. CONSTRUCCIÓN DE NUEVOS MODELOS DE AUTORIDAD	MESSING, CLAUDIA				1	1	1	114	2			\N	2021-10-15 18:40:18	2021-11-30 15:05:00	'autor':19 'claudi':21 'construccion':14 'dificil':4 'hoy':7 'inconcient':9 'joven':13 'messing':20 'model':17 'niñ':11 'nuev':16 'padr':6 'porqu':1 'ser':5 'simetri':8 'tan':3
955	1936	1000 ELEMENTOS DE ARQUITECTURA	SCHLEIFER, SIMONE K.				1	1	1	231	2			\N	2021-12-01 21:01:12	2021-12-01 21:01:24	'1000':1 'arquitectur':4 'element':2 'k':7 'schleif':5 'simon':6
966	1358	70 JUEGOS PARA DINÁMICA DE GRUPOS	FRITZEN, SILVINO JOSE				1	1	1	26	2			\N	2021-12-08 14:33:23	2021-12-08 14:33:23	'70':1 'dinam':4 'fritz':7 'grup':6 'jos':9 'jueg':2 'silvin':8
1005	8	COMO LEER UN LIBRO	ADLER, J. MORTIMER			41	1	1	1	245	2			\N	2022-01-05 14:35:02	2022-01-05 14:35:02	'adler':5 'j':6 'leer':2 'libr':4 'mortim':7
1015	1569	METODOLOGIA DE LA INVESTIGACION	NAMAKFOROOSH, MOHAMMAD NAGHI			4865,4866, 5074	1	1	1	117	2			\N	2022-01-06 19:32:37	2022-01-06 19:38:30	'investigacion':4 'metodologi':1 'mohamm':6 'naghi':7 'namakforoosh':5
1027	422	LIVRES DE BORD CONJUGAISON	LIVRES DE BORD CONJUGAISON			856,2329,2330,2331,2332,2333,2334,2335,2336,2337,2338	1	1	1	245	2			\N	2022-01-11 15:32:09	2022-01-11 15:32:09	'bord':3,7 'conjugaison':4,8 'livr':1,5
1037	1377	CAFE CREME 2 METHODE DE FRANCAIS	TREVISI, SANDRA; BEACCO DI GIURA, MARCELLA; CANELA			3890,3891,3892,3893,3894	1	1	1	247	2			\N	2022-01-11 18:29:18	2022-01-11 18:29:18	'2':3 'beacc':9 'caf':1 'canel':13 'crem':2 'di':10 'francais':6 'giur':11 'marcell':12 'method':4 'sandr':8 'trevisi':7
1045	232	PAGINAS CLASICAS ACERCA DE CATILINA	PAGINAS CLASICAS ACERCA DE CATILINA			2849,2850	1	1	1	179	2			\N	2022-01-11 19:53:20	2022-01-11 19:53:20	'acerc':3,8 'catilin':5,10 'clasic':2,7 'pagin':1,6
1067	433	SKYLINE 2 WORKBOOK	GARSIDE, BARBARA			874,875,876,877,878,879	1	1	1	245	2			\N	2022-01-14 23:57:22	2022-01-14 23:57:22	'2':2 'barb':5 'garsid':4 'skylin':1 'workbook':3
1109	383	ARTE BREVE DE LA LENGUA OTOMI Y VOCABULARIO TRILIN	URBANO, ALONSO			768,769,770,771,	1	1	1	245	2			\N	2022-01-24 15:55:21	2022-01-24 15:55:21	'alons':11 'arte':1 'brev':2 'lengu':5 'otomi':6 'trilin':9 'urban':10 'vocabulari':8
1113	392	LA GUERRA DE LAS GALIAS LIBRO II	JULIO CESAR			791,792	1	1	1	245	2			\N	2022-01-24 20:00:23	2022-01-24 20:00:23	'ces':9 'gali':5 'guerr':2 'ii':7 'juli':8 'libr':6
1116	1097	ENGLISH KNOWTTOW STUDENT BOOK 1	BLACKWELL, ANGELA Y NABER, THERESE			2908,2909,2910,2911,2912,	1	1	1	245	2			\N	2022-01-24 20:08:23	2022-01-24 20:08:23	'1':5 'angel':7 'blackwell':6 'book':4 'english':1 'knowttow':2 'nab':9 'student':3 'theres':10
1118	1035	SMART CHOICE WORKBOOK 1	WILSON, KEN; FALLA, TIM Y DAVIS, PAUL A.			546,1015,1073,1100,1217,1566,1837,2511,2512,2513,2514,2515,2516,2517,	1	1	1	64	2			\N	2022-01-25 13:44:43	2022-01-25 13:44:43	'1':4 'choic':2 'davis':10 'fall':7 'ken':6 'paul':11 'smart':1 'tim':8 'wilson':5 'workbook':3
1128	455	BASIC ENGLISH FOR COMPUTING	GLENDINNING,ERIC H. AND MCEWAN, JOHN			918	1	1	1	64	2			\N	2022-01-26 13:31:28	2022-01-26 13:31:28	'and':8 'basic':1 'computing':4 'english':2 'eric':6 'for':3 'glendinning':5 'h':7 'john':10 'mcew':9
1136	1136	ELEMENTOS DE DERECHO	MOTO SALAZAR, EFRAIN Y MOTO, JOSE MIGUEL			2581,2582,2583,2584,2585,	1	1	1	139	2			\N	2022-01-26 14:42:43	2022-01-26 14:42:43	'derech':3 'efrain':6 'element':1 'jos':9 'miguel':10 'mot':4,8 'salaz':5
1149	1170	DISCURSO Y ARGUMENTACION: UN ANALISIS SEMANTICO Y	PUIG, LUISA			3241,3242	1	1	1	250	2			\N	2022-01-26 15:40:11	2022-01-26 15:40:11	'analisis':5 'argumentacion':3 'discurs':1 'luis':9 'puig':8 'semant':6
1151	1639	DICCIONARIO ILUSTRADO DE ECOLOGIA Y MEDIO AMBIENTE	COLAS GIL, JORDI			4983,4984	1	1	1	59	2			\N	2022-01-26 15:47:50	2022-01-26 15:47:50	'ambient':7 'col':8 'diccionari':1 'ecologi':4 'gil':9 'ilustr':2 'jordi':10 'medi':6
1152	1672	DICCIONARIO DE MARKETING	GRUPO EDITORIAL			5091,5092	1	1	1	245	2			\N	2022-01-26 15:51:40	2022-01-26 15:51:40	'diccionari':1 'editorial':5 'grup':4 'marketing':3
1154	461	OXFORD DICCIONARIO BASICO	OXFORD DICCIONARIO BASICO			931,932,933	1	1	1	64	2			\N	2022-01-26 15:59:28	2022-01-26 15:59:28	'basic':3,6 'diccionari':2,5 'oxford':1,4
1155	1414	GRAND GRAND DICTIONNAIRE ESPAGNOL-FRANÇAIS, FRANÇA	GARCIA-PELAYO Y GROSS, RAMON Y TESTAS, JEAN			4125,4126,4127,4128,4129,	1	1	1	59	2			\N	2022-01-26 16:04:03	2022-01-26 16:04:03	'dictionnair':3 'espagnol':5 'espagnol-français':4 'franç':7 'français':6 'garci':9 'garcia-pelay':8 'grand':1,2 'gross':12 'jean':16 'pelay':10 'ramon':13 'test':15
1156	267	DICCIONARIO BASICO	LAROUSSE			4391,4392,4393	1	1	1	59	2			\N	2022-01-26 16:08:55	2022-01-26 16:08:55	'basic':2 'diccionari':1 'larouss':3
1159	456	INFORMATION TECHNOLOGY	DEMETRAIDES, DINOS			919	1	1	1	245	2			\N	2022-01-26 16:23:30	2022-01-26 16:23:30	'demetraid':3 'din':4 'information':1 'technology':2
1160	1130	BUSINESS AND COMMERCE	WOOD, NEIL			3112,3113,3114,3115,3116,3117,3118,3119,3120,3121,	1	1	1	245	2			\N	2022-01-26 16:26:02	2022-01-26 16:26:02	'and':2 'business':1 'commerc':3 'neil':5 'wood':4
1161	295	LEY FEDERAL DEL TRABAJO	TRUEBA BARRERA, JORGE			2564	1	1	1	82	2			\N	2022-01-27 13:26:08	2022-01-27 13:26:08	'barrer':6 'federal':2 'jorg':7 'ley':1 'trabaj':4 'trueb':5
1172	1040	INGENIERIA DEL SOFTWARE UN ENFOQUE PRACTICO	PRESSMAN, ROGER S.			103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,3970,3971,3972,3973,3974,3975,3976,3977,4055,4056,4057,4058,4059,4060,4061,4062,	1	1	1	245	2			\N	2022-01-27 15:50:08	2022-01-27 15:50:08	'enfoqu':5 'ingenieri':1 'practic':6 'pressm':7 'rog':8 's':9 'softwar':3
1178	366	BREVES APUNTES SOBRE LOS CASOS Y LAS ORACIONES	BENOT, EDUARDO			3195,3196	1	1	1	179	2			\N	2022-01-27 16:24:31	2022-01-27 16:24:31	'apunt':2 'benot':9 'brev':1 'cas':5 'eduard':10 'oracion':8
1179	363	EL HABLA POPULAR DE LA REPUBLICA MEXICANA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			3189,3190	1	1	1	179	2			\N	2022-01-27 16:27:29	2022-01-27 16:27:29	'autonom':10 'habl':2 'mexic':12 'mexican':7 'nacional':9 'popul':3 'republ':6 'univers':8
1181	362	LAS CONSTRUCCIONES COORDINADAS SINDETICAS EN EL ES	ROJAS NIETO, CECILIA			3188,4428	1	1	1	179	2			\N	2022-01-27 16:35:06	2022-01-27 16:35:06	'cecili':10 'construccion':2 'coordin':3 'niet':9 'roj':8 'sindet':4
940	2166	¿QUE ES ESTADOA UNIDOS?	FERNANDEZ DE CASTRO, RAFAEL				1	1	1	16	2			\N	2021-11-30 19:08:26	2021-11-30 19:08:26	'castr':7 'estado':3 'fernandez':5 'rafael':8 'unid':4
956	1937	1000 OBRAS MAESTRAS DE LA PINTURA	STUKENBROCK, CHRISTIANE				1	1	1	232	2			\N	2021-12-02 13:20:44	2021-12-02 13:21:00	'1000':1 'christian':8 'maestr':3 'obras':2 'pintur':6 'stukenbrock':7
727	685	8VO. CONCURSO NACIONAL DE CUENTO PREUNIVERSITARIO JUAN RULFO	UNIVERSIDAD IBEROAMERICANA				1	1	1	91	2			\N	2021-10-15 18:03:08	2021-12-09 13:45:50	'8vo':1 'concurs':2 'cuent':5 'iberoamerican':10 'juan':7 'nacional':3 'preuniversitari':6 'rulf':8 'univers':9
1006	1121	COMPUTACION INTERACTIVA	LAUDON, KENNETEH C., ROSENBLATT, KENNETH, LANGLEY,			42,43,44,45,46,47,48	1	1	1	245	2			\N	2022-01-05 14:37:37	2022-01-05 14:37:37	'c':5 'computacion':1 'interact':2 'kenneteh':4 'kenneth':7 'langley':8 'laudon':3 'rosenblatt':6
1016	1595	DISENO Y ANALISIS DE EXPERIMENTOS	MONTGOMERY, DOUGLAS C.			4915,4916,4917,4918	1	1	1	57	2			\N	2022-01-06 19:42:46	2022-01-06 19:42:46	'analisis':3 'c':8 'disen':1 'dougl':7 'experiment':5 'montgomery':6
1046	270	FUNDAMENTOS DE E-COMMERCE	FAJARDO,JORGE			2851,2852	1	1	1	245	2			\N	2022-01-11 19:56:50	2022-01-11 19:56:50	'commerc':5 'e-commerc':3 'fajard':6 'fundament':1 'jorg':7
23	23	ESPANOL 3	CUEVA, HUMBERTO				1	1	1	60	2			\N	2021-10-04 14:57:02	2021-10-04 14:57:02	'3':2 'cuev':3 'espanol':1 'humbert':4
24	24	TALLER DE LECTURA Y REDACCION II	CID GARZON, MARIA DE LOURDES				1	1	1	49	2			\N	2021-10-04 15:04:59	2021-10-04 15:04:59	'cid':7 'garzon':8 'ii':6 'lectur':3 'lourd':11 'mari':9 'redaccion':5 'tall':1
54	54	ESPANOL 2	MAYORGA CORTES, LUCIO				1	1	1	64	2			\N	2021-10-04 17:19:41	2021-10-04 17:19:41	'2':2 'cort':4 'espanol':1 'luci':5 'mayorg':3
1068	435	SKYLINE 2 TEACHER'S GUIDE	LETHABY, CAROL Y MATTE, MARGARITA			885	1	1	1	245	2			\N	2022-01-14 23:58:40	2022-01-14 23:58:40	'2':2 'carol':7 'guid':5 'lethaby':6 'margarit':10 'matt':9 's':4 'skylin':1 'teach':3
1091	1551	TURISMO DE ACTIVIDAD MUNDIAL: ANTECEDENTES HISTORI	TORRE PADILLA, OSCAR DE LA			4816	1	1	1	60	2			\N	2022-01-19 21:06:09	2022-01-19 21:06:09	'activ':3 'antecedent':5 'histori':6 'mundial':4 'oscar':9 'padill':8 'torr':7 'turism':1
1103	404	EL PRIMER RENACIMIENTO FLORENTINO. IDEAS Y PRESAGI	ROSSI, ANNUNZIATA			818,819	1	1	1	245	2			\N	2022-01-24 14:41:58	2022-01-24 14:41:58	'annunziat':9 'florentin':4 'ide':5 'presagi':7 'prim':2 'renac':3 'rossi':8
1112	390	MEMORIAS: JORNADAS FILOLOGICAS 1995	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			786,787	1	1	1	245	2			\N	2022-01-24 16:09:02	2022-01-24 16:09:02	'1995':4 'autonom':7 'filolog':3 'jorn':2 'memori':1 'mexic':9 'nacional':6 'univers':5
1114	393	JORNADAS FILOLOGICAS 1997 MEMORIA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			793,794	1	1	1	245	2			\N	2022-01-24 20:01:23	2022-01-24 20:01:23	'1997':3 'autonom':7 'filolog':2 'jorn':1 'memori':4 'mexic':9 'nacional':6 'univers':5
1117	1101	GOING INTERNATIONAL ENGLISH FOR TOURISM	HARDING, KEITH			2943,2944, 2943,2944,2945, 2943,2944,2945,2946, 2943,2944,2945,2946,2947, 2943,2944,2945,2946,2947,2948, 2943,2944,2945,2946,2947,2948,2949, 2943,2944,2945,2946,2947,2948,2949,2950, 2943,2944,2945,2946,2947,2948,2949,2950,2951, 2943,2944,2945,2946,2947,2948,2949,2950,2951,2952, 2943,2944,2945,2946,2947,2948,2949,2950,2951,2952,2953, 2943,2944,2945,2946,2947,2948,2949,2950,2951,2952,2953,2954, 2943,2944,2945,2946,2947,2948,2949,2950,2951,2952,2953,2954,2955, 2943,2944,2945,2946,2947,2948,2949,2950,2951,2952,2953,2954,2955,2956, 2943,2944,2945,2946,2947,2948,2949,2950,2951,2952,2953,2954,2955,2956,2957	1	1	1	245	2			\N	2022-01-24 20:10:28	2022-01-24 20:10:28	'english':3 'for':4 'going':1 'harding':6 'international':2 'keith':7 'tourism':5
1119	457	GLOBAL LINKS 2	BLACKWELL, ANGELA			920	1	1	1	245	2			\N	2022-01-25 13:47:19	2022-01-25 13:47:19	'2':3 'angel':5 'blackwell':4 'global':1 'links':2
1129	458	HIGHLY RECOMMENDED STUDENT'S BOOK	STOTT, TRISH AND REVELL, ROD			921,2454,2455,2456,2457,2458,2459,2460,2461,2462,2463,2464,2465,2466,2467,2468,	1	1	1	64	2			\N	2022-01-26 13:32:55	2022-01-26 13:32:55	'and':8 'book':5 'highly':1 'recommend':2 'revell':9 'rod':10 's':4 'stott':6 'student':3 'trish':7
1150	1069	ORTOGRAFIA EJERCICIOS	ROSAS, ROSA MARIA			2752,2753,2754,2755,2756,	1	1	1	245	2			\N	2022-01-26 15:43:39	2022-01-26 15:43:39	'ejercici':2 'mari':5 'ortografi':1 'ros':3,4
1153	1420	COLLINS POCKET FRANÇAIS-ESPAGNOL ESPAGNOL-FRANCÉIS	COLLINS POCKET FRANÇAIS-ESPAGNOL ESPAGNOL-FRANÇAIS			4149	1	1	1	245	2			\N	2022-01-26 15:54:28	2022-01-26 15:54:28	'collins':1,9 'espagnol':5,7,13,15 'espagnol-franc':6 'espagnol-français':14 'franc':8 'français':4,12,16 'français-espagnol':3,11 'pocket':2,10
1157	460	DICTIONNAIRE ESPAGNOL	DICTIONNAIRE ESPAGNOL			925,926,928,929,930,985,986,987,988,989,	1	1	1	245	2			\N	2022-01-26 16:12:28	2022-01-26 16:12:28	'dictionnair':1,3 'espagnol':2,4
1162	313	CODIGO FEDERAL DE INSTITUCIONES Y PROCEDIMIENTOS E	INSTITUO FEDERAL ELECTORAL			2565,2566,	1	1	1	245	2			\N	2022-01-27 13:31:17	2022-01-27 13:31:17	'codig':1 'electoral':10 'federal':2,9 'institu':4,8 'proced':6
1173	1710	REDES CONVERGENTES: DISENOS E IMPLEMENTACION	TERAN, DAVID			5167	1	1	1	213	2			\N	2022-01-27 16:01:02	2022-01-27 16:01:02	'convergent':2 'dav':7 'disen':3 'implementacion':5 'red':1 'ter':6
1180	357	SINTAXIS DE LOS RELATIVOS EN EL HABLA CULTA DE LA	PALACIOS DE SAMANO,MARGARITA			3179,3180	1	1	1	179	2			\N	2022-01-27 16:30:21	2022-01-27 16:30:21	'cult':8 'habl':7 'margarit':14 'palaci':11 'relat':4 'saman':13 'sintaxis':1
1182	358	ESTUDIOS SOBRE LOS TIEMPOS VERBALES	MORENO DE ALBA,JOSE G.			3181,3182	1	1	1	179	2			\N	2022-01-27 16:42:03	2022-01-27 16:42:03	'alba':8 'estudi':1 'g':10 'jos':9 'moren':6 'tiemp':4 'verbal':5
941	1706	¿QUÉ ES LA MECÁNICA CUÁNTICA?: UNA AVENTURA EN LA FÍSICA	TRANSNATIONAL COLLAGE OF LEX				1	1	1	179	2			\N	2021-11-30 19:14:40	2021-11-30 19:15:55	'aventur':7 'collag':12 'cuantic':5 'fisic':10 'lex':14 'mecan':4 'of':13 'transnational':11
957	2665	1001 COCHES LEGENDARIOS	DIAZ, MA. JESUS				1	1	1	149	2			\N	2021-12-02 13:30:59	2021-12-02 13:30:59	'1001':1 'coch':2 'diaz':4 'jesus':6 'legendari':3 'ma':5
967	2633	A CUERPO ABIERTO	A CUERPO ABIERTO				1	1	1	136	2			\N	2021-12-09 14:00:40	2021-12-09 14:00:40	'abiert':3,6 'cuerp':2,5
1007	1235	METODOLOGIA Y TECNICAS DE INVESTIGACION EN CIENCIA	PARDINAS, FELIPE			1308	1	1	1	245	2			\N	2022-01-05 14:39:48	2022-01-05 14:39:48	'cienci':7 'felip':9 'investigacion':5 'metodologi':1 'pardin':8 'tecnic':3
1017	388	CUARENTA ANOS DEL CENTRO DE ESTUDIOS LITERARIOS	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			782,783	1	1	1	179	2			\N	2022-01-07 14:09:48	2022-01-07 14:13:45	'anos':2 'autonom':10 'centr':4 'cuarent':1 'estudi':6 'literari':7 'mexic':12 'nacional':9 'univers':8
1039	433	VOCABULAIRE PROGRESSIF DU FRANÇAIS	MIQUEL,CLAIRE,GOLIOT-LETE,ANNE			4313,4314,4315	1	1	1	248	2			\N	2022-01-11 18:34:55	2022-01-11 18:34:55	'anne':10 'clair':6 'du':3 'français':4 'goliot':8 'goliot-let':7 'let':9 'miquel':5 'progressif':2 'vocabulair':1
1047	1450	FUNDAMENTOS DE COMERCIO ELECTRONICO	ELSENPETER, ROBERT C. Y VELTE, TOBY J.			4236	1	1	1	245	2			\N	2022-01-11 19:58:50	2022-01-11 19:58:50	'c':7 'comerci':3 'electron':4 'elsenpet':5 'fundament':1 'j':11 'robert':6 'toby':10 'velt':9
1069	436	SKYLINE 3 WORKBOOK	FUSCOE, KATE			886	1	1	1	245	2			\N	2022-01-15 00:00:21	2022-01-15 00:00:21	'3':2 'fusco':4 'kat':5 'skylin':1 'workbook':3
25	25	TALLER DE LECTURA Y REDACCION 1	DE LA TORRE ZERMENO, FRANCISCO J.				1	1	1	61	2			\N	2021-10-04 15:05:39	2021-10-04 15:05:39	'1':6 'francisc':11 'j':12 'lectur':3 'redaccion':5 'tall':1 'torr':9 'zermen':10
26	26	TALLER DE LECTURA Y REDACCION II	OLMEDO, MARTINEZ DOMINGA				1	1	1	49	2			\N	2021-10-04 15:06:25	2021-10-04 15:06:25	'doming':9 'ii':6 'lectur':3 'martinez':8 'olmed':7 'redaccion':5 'tall':1
1115	394	ARTE BREVE Y VOCABULARIO DE LA LENGUA PO3OM	ACUNA, RENE			795,796,797,798,	1	1	1	245	2			\N	2022-01-24 20:03:28	2022-01-24 20:03:28	'acun':9 'arte':1 'brev':2 'lengu':7 'po3om':8 'ren':10 'vocabulari':4
1120	1036	SMART CHOICE STUDENT BOOK 1	WILSON, KEN			1859,1896,1897,2009,2233,2518,2519,2520,2521,2522,2523,2703,	1	1	1	64	2			\N	2022-01-25 13:56:43	2022-01-25 13:56:43	'1':5 'book':4 'choic':2 'ken':7 'smart':1 'student':3 'wilson':6
1130	452	AMERICAN HEADWAY STARTER STUDENT BOOK	SOARS LIZ, AND JOHN			915,2445,2446,2447,2448,2449,2450,2451,2452,2453,	1	1	1	64	2			\N	2022-01-26 13:35:58	2022-01-26 13:35:58	'americ':1 'and':8 'book':5 'headway':2 'john':9 'liz':7 'soars':6 'start':3 'student':4
1158	1045	DICCIONARIO DE SINONIMOS, ANTONIMOS Y PARONIMOS	DICCIONARIO DE SINONIMOS, ANTONIMOS Y PARONIMOS			2612,2613,2614,2615,2616,	1	1	1	245	2			\N	2022-01-26 16:15:56	2022-01-26 16:16:28	'anton':4,10 'diccionari':1,7 'paron':6,12 'sinon':3,9
1163	273	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEXICA	INTITUTO FEDERAL ELECTORAL			2567,2568	1	1	1	245	2			\N	2022-01-27 13:37:28	2022-01-27 13:37:28	'constitucion':1 'electoral':10 'federal':9 'intitut':8 'mexic':7 'polit':2 'unid':6
1174	1120	ANALISIS Y DISENO DE SISTEMAS	E. KENDALL, KENNETH Y E. KENDALL, JULIE			89,90,91,92,93,	1	1	1	245	2			\N	2022-01-27 16:04:34	2022-01-27 16:04:34	'analisis':1 'disen':3 'juli':12 'kendall':7,11 'kenneth':8 'sistem':5
1183	420	VOCABULARIO FUNDAMENTAL Y CONSTRUCTIVO DEL GRIEGO	MEYER, THOMAS Y STEINTHAL, HERMANN			853,854	1	1	1	179	2			\N	2022-01-27 16:46:10	2022-01-27 16:46:10	'construct':4 'fundamental':2 'grieg':6 'hermann':11 'mey':7 'steinthal':10 'thom':8 'vocabulari':1
1187	355	NEXOS ADVERBIALES EN LAS HABLAS CULTA Y POPULAR DE	HERRERA LIMA,MARIA EUGENIA			3175,3176	1	1	1	179	2			\N	2022-01-31 13:53:38	2022-01-31 13:53:38	'adverbial':2 'cult':6 'eugeni':13 'habl':5 'herrer':10 'lim':11 'mari':12 'nex':1 'popul':8
1188	364	EL ESPANOL HABLADO EN EL SUROESTE DE LOS ESTADOS U	LOPE BLANCH, JUAN M.			3191,3192	1	1	1	245	2			\N	2022-01-31 18:25:55	2022-01-31 18:25:55	'blanch':12 'espanol':2 'habl':3 'juan':13 'lop':11 'm':14 'suroest':6 'u':10
1189	351	LOS PUENTES DE LA TRADUCCION OCTAVIO PAZ Y LA POES	BRADU, FABIENNE			3167,3168	1	1	1	245	2			\N	2022-01-31 18:51:37	2022-01-31 18:51:37	'bradu':11 'fabienn':12 'octavi':6 'paz':7 'poes':10 'puent':2 'traduccion':5
1191	352	DE HISTORIOGRAFIA LINGUISTICA E HISTORIA DE LAS LE	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			3169,3170	1	1	1	245	2			\N	2022-01-31 19:02:01	2022-01-31 19:02:01	'autonom':11 'histori':5 'historiografi':2 'linguist':3 'mexic':13 'nacional':10 'univers':9
1192	346	SER Y ESTAR EN EL HABLA DE MICHOACAN,MEXICO	GUTIERREZ,MANUEL J.			3157,3158	1	1	1	245	2			\N	2022-01-31 19:03:57	2022-01-31 19:03:57	'gutierrez':10 'habl':6 'j':12 'manuel':11 'mexic':9 'michoac':8 'ser':1
1193	347	LA FRASE SUSTANTIVA EN EL ESPANOL MEDIEVAL. CUATRO	COMPANY COMPANY,CONCEPCION			3159,3160	1	1	1	179	2			\N	2022-02-01 14:35:23	2022-02-01 14:35:23	'company':9,10 'concepcion':11 'cuatr':8 'espanol':6 'fras':2 'medieval':7 'sustant':3
1194	348	CAMBIO LINGUISTICO Y NORMATIVIDAD	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			3161,3162	1	1	1	179	2			\N	2022-02-01 14:37:27	2022-02-01 14:37:27	'autonom':7 'cambi':1 'linguist':2 'mexic':9 'nacional':6 'normat':4 'univers':5
1197	429	A CONTENT-BASED GRAMMAR	K. WERNER, PATRICIA			862	1	1	1	245	2			\N	2022-02-01 14:52:23	2022-02-01 14:52:23	'bas':4 'content':3 'content-bas':2 'gramm':5 'k':6 'patrici':8 'wern':7
1199	240	PLANIFICACION ECONOMICA DEL TURISMO: DE UNA ESTRAT	BOTE GOMEZ,VENANCIOBOTE GOMEZ,VENANCIO			2596,2597,2598,2599,2600,2601	1	1	1	60	2			\N	2022-02-01 14:58:02	2022-02-01 14:58:02	'bot':8 'econom':2 'estrat':7 'gomez':9,11 'planificacion':1 'turism':4 'venanci':12 'venanciobot':10
1202	1564	CONCEPTOS MERCATILES Y LABORALES EN EL TURISMO.	LOPEZ RODRIGUEZ, JOSE ALBERTO			4852,4853,4854	1	1	1	60	2			\N	2022-02-01 15:07:49	2022-02-01 15:07:49	'albert':11 'concept':1 'jos':10 'laboral':4 'lopez':8 'mercatil':2 'rodriguez':9 'turism':7
1203	239	LOS MUNICIPIOS TURISTICOS	BOULLON,ROBERTO C.			2602,2603,2604,2605,2625,2626,5193,5194,5195	1	1	1	60	2			\N	2022-02-01 15:31:12	2022-02-01 15:31:12	'boullon':4 'c':6 'municipi':2 'robert':5 'turist':3
1206	1436	DERECHOS HUMANOS FILOSOFIA Y NATURALEZA	VARGAS VALENCIA, AURELIA			4213,4214	1	1	1	179	2			\N	2022-02-01 15:43:12	2022-02-01 15:43:12	'aureli':8 'derech':1 'filosofi':3 'human':2 'naturalez':5 'valenci':7 'varg':6
942	2294	¿QUE ES UN AUTOR?	FOUCAULT, MICHEL				1	1	1	226	2			\N	2021-11-30 19:22:15	2021-11-30 19:22:32	'autor':4 'foucault':5 'michel':6
958	2052	101 AVENTURAS DE LA LECTURA	ORELLANA, MARGARITA DE				1	1	1	140	2			\N	2021-12-02 13:33:38	2021-12-02 13:33:38	'101':1 'aventur':2 'lectur':5 'margarit':7 'orellan':6
968	2124	A ESTUDIAR SE APRENDE: METODOLOGÍA DE ESTUDIO SESION POR SESION	GARCIA HIDOBRO B, CECILIA				1	1	1	213	2			\N	2021-12-09 14:07:11	2021-12-09 14:07:11	'aprend':4 'b':13 'cecili':14 'estudi':2,7 'garci':11 'hidobr':12 'metodolog':5 'sesion':8,10
1018	1319	ESCRITURA Y ACTITUDES: EL CASO DE CHIAPAS	CASTILLO ESPONDA, MARGARITA			3530,3531	1	1	1	245	2			\N	2022-01-07 14:16:15	2022-01-07 14:16:15	'actitud':3 'cas':5 'castill':8 'chiap':7 'escritur':1 'espond':9 'margarit':10
1040	850	LE NOUVEL ESPACES: CAHIER D´EXERCICES 1	LE NOUVEL ESPACES: CAHIER D´EXERCICES 1			4519,4520,4521,4522,4523,4537,4538	1	1	1	247	2			\N	2022-01-11 18:37:30	2022-01-11 18:37:30	'1':7,14 'cahi':4,11 'd':5,12 'espac':3,10 'exercic':6,13 'nouvel':2,9
1048	1454	EL UNIVERSO DE LAS UNIVERSIDADES PARTICULARES EN M	FEDERACION DE INSTITUCIONES MEXICANAS PARTICULARES			4242	1	1	1	245	2			\N	2022-01-11 20:01:16	2022-01-11 20:01:16	'federacion':9 'institu':11 'm':8 'mexican':12 'particular':6,13 'univers':2,5
1070	438	SKYLINE 4 WORKBOOK	FUSCOE, KATE			888,889	1	1	1	245	2			\N	2022-01-15 00:02:24	2022-01-15 00:02:24	'4':2 'fusco':4 'kat':5 'skylin':1 'workbook':3
1121	1038	SMART CHOICE WORKBOOK 3	WILSON, KEN Y WISNIEWSKA, INGRID			2539,2540,2541,2542,2543,2544,2545,2546,2547,2548,2549,2550,2551,2552,2553,	1	1	1	64	2			\N	2022-01-25 14:01:05	2022-01-25 14:01:05	'3':4 'choic':2 'ingrid':9 'ken':6 'smart':1 'wilson':5 'wisniewsk':8 'workbook':3
1131	453	AMERICAN HEADWAY 2 STUDENT BOOK	SOARS, LIZ AND JOHN			916,2435,2436,2437,2438,2439,	1	1	1	64	2			\N	2022-01-26 13:53:29	2022-01-26 13:53:29	'2':3 'americ':1 'and':8 'book':5 'headway':2 'john':9 'liz':7 'soars':6 'student':4
27	28	LITERATURA BACHILLERATO GENERAL 2	LOZANO LUCERO				1	1	1	62	2			\N	2021-10-04 15:11:46	2021-10-04 15:11:46	'2':4 'bachillerat':2 'general':3 'literatur':1 'lozan':5 'lucer':6
679	646	LASTIMA DE CUBA	RIUS				1	1	1	15	2			\N	2021-10-14 19:20:06	2021-10-14 19:20:06	'cub':3 'lastim':1 'rius':4
1139	296	ELEMENTOS DE  DERECHO	MOTO SALAZAR, EFRAIN Y MOTO, JOSE MIGUEL			2560,2561,2562,2563,	1	1	1	82	2			\N	2022-01-26 14:46:01	2022-01-26 14:46:01	'derech':3 'efrain':6 'element':1 'jos':9 'miguel':10 'mot':4,8 'salaz':5
1164	314	CONSULTA DE UN JURISCONSULTO ANTIGUO	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			2569,2570	1	1	1	245	2			\N	2022-01-27 13:43:21	2022-01-27 13:43:29	'antigu':5 'autonom':8 'consult':1 'jurisconsult':4 'mexic':10 'nacional':7 'univers':6
1175	1138	METODOLOGIAS DE INGENIERIA INFORMATICA	OCHOA, MARIA FERNANDA			94	1	1	1	245	2			\N	2022-01-27 16:06:18	2022-01-27 16:06:18	'fernand':7 'informat':4 'ingenieri':3 'mari':6 'metodologi':1 'ocho':5
1184	359	SINTAXIS DE LOS VERBOIDES EN EL HABLA CULTA DE LA	LUNA TRAILL,ELIZABETH			3183,3184	1	1	1	179	2			\N	2022-01-27 16:49:39	2022-01-27 16:49:39	'cult':8 'elizabeth':13 'habl':7 'lun':11 'sintaxis':1 'traill':12 'verboid':4
1190	353	EL HABLA DE DIEGO DE ORDAZ	LOPE BLANCH,JUAN M.			3171,3172	1	1	1	179	2			\N	2022-01-31 18:54:49	2022-01-31 18:54:49	'blanch':8 'dieg':4 'habl':2 'juan':9 'lop':7 'm':10 'ordaz':6
1195	349	TRATADO DE LOS TOPICOS DIALECTICOS	VERA CRUZ, FRAY ALONSO DE LA			3163,3164	1	1	1	179	2			\N	2022-02-01 14:44:36	2022-02-01 14:44:36	'alons':9 'cruz':7 'dialect':5 'fray':8 'topic':4 'trat':1 'ver':6
1198	1367	FUNDAMENTALS OF ENGLISH GRAMMAR WORKBOOK	SCHRAMPFER AZAR, BETTY			4359,4360,4361,4362,4363	1	1	1	245	2			\N	2022-02-01 14:55:02	2022-02-01 14:55:02	'azar':7 'betty':8 'english':3 'fundamentals':1 'gramm':4 'of':2 'schrampf':6 'workbook':5
1200	1435	DERECHOS HUMANOS Y NATURALEZA HUMANA	BEUCHOT, MAURICIO Y SALDANA, JAVIER			4205,4206	1	1	1	179	2			\N	2022-02-01 15:00:59	2022-02-01 15:00:59	'beuchot':6 'derech':1 'human':2,5 'javi':10 'maurici':7 'naturalez':4 'saldan':9
1204	1557	PLANIFICACION INTEGRAL DEL TURISMO: UN ENFOQUE PAR	MOLINA E., SERGIO			4831,4832,4833	1	1	1	241	2			\N	2022-02-01 15:33:48	2022-02-01 15:33:48	'enfoqu':6 'integral':2 'molin':8 'par':7 'planificacion':1 'sergi':10 'turism':4
1207	265	DICCIONARIO JURIDICO HARLA DERECHO CONSTITUCIONAL	ARTEAGA NAVA,ELISUR			2630,2631	1	1	1	245	2			\N	2022-02-01 15:56:48	2022-02-01 15:56:48	'arteag':6 'constitucional':5 'derech':4 'diccionari':1 'elisur':8 'harl':3 'jurid':2 'nav':7
943	2150	¿QUÉ TIPO DE ALUMNO SOY? UNA GUÍA PARA MEJORAR EN EL ESTUDIO	LERMA JASSO, HECTOR				1	1	1	60	2			\N	2021-11-30 19:41:02	2021-11-30 19:41:02	'alumn':4 'estudi':12 'gui':7 'hector':15 'jass':14 'lerm':13 'mejor':9 'tip':2
959	2359	101 CONSEJOS, FOTOGRAFÍA DIGITAL: LOS SECRETOS DE LOS MEJORES FOTÓGRAFOS DEL MUNDO	FREEMAN, MICHAEL				1	1	1	230	2			\N	2021-12-02 13:41:06	2021-12-02 13:41:06	'101':1 'consej':2 'digital':4 'fotograf':3,10 'freem':13 'mejor':9 'michael':14 'mund':12 'secret':6
969	2172	A LA SOMBRA DE LA REVOLUCIÓN MEXICANA	AGUILAR CAMIN, HECTOR				1	1	1	58	2			\N	2021-12-09 14:20:45	2021-12-09 14:20:45	'aguil':8 'camin':9 'hector':10 'mexican':7 'revolu':6 'sombr':3
1019	401	ULISES CRIOLLO CUMPLE SESENTA ANOS	CARBALLO, EMMANUEL			813,814	1	1	1	245	2			\N	2022-01-07 14:19:06	2022-01-07 14:30:38	'anos':5 'carball':6 'crioll':2 'cumpl':3 'emmanuel':7 'sesent':4 'ulis':1
1049	1742	LA VIOLENCIA ESCOLAR: ESTRATEGIAS DE PREVENCION	ORTEGA, ROSARIO			5238	1	1	1	245	2			\N	2022-01-11 20:03:29	2022-01-11 20:03:29	'escol':3 'estrategi':4 'orteg':7 'prevencion':6 'rosari':8 'violenci':2
1071	439	SKYLINE 4 STUDENT'S BOOK	BREWSTER, SIMON / DAVIES, PAUL / ROGERS, MICKEY			890,891	1	1	1	245	2			\N	2022-01-15 00:03:56	2022-01-15 00:03:56	'4':2 'book':5 'brewst':6 'davi':8 'mickey':11 'paul':9 'rogers':10 's':4 'simon':7 'skylin':1 'student':3
1122	1128	SMART CHOICE STUDENT BOOK 2	WILSON, KEN			3098,3099,3100,3101,3102,3103,3104,	1	1	1	64	2			\N	2022-01-25 14:02:49	2022-01-25 14:02:49	'2':5 'book':4 'choic':2 'ken':7 'smart':1 'student':3 'wilson':6
28	29	CONTABILIDAD 1	ILLESCAS, PACHECO APOLONIO				1	1	1	49	2			\N	2021-10-04 15:23:21	2021-10-04 15:23:21	'1':2 'apoloni':5 'contabil':1 'illesc':3 'pachec':4
1132	292	PRINCIPIOS DE MACROECONOMIA	CASE, KARL E. Y FAIR, RAY C.			2403,2404,2419,2420,	1	1	1	245	2			\N	2022-01-26 14:10:23	2022-01-26 14:13:25	'c':10 'cas':4 'fair':8 'karl':5 'macroeconomi':3 'principi':1 'ray':9
1140	1736	DIAGNOSTICO ORGANIZACIONAL	RODRIGUEZ MANSILLA, DARIO			5228	1	1	1	217	2			\N	2022-01-26 14:54:50	2022-01-26 14:54:50	'dari':5 'diagnost':1 'mansill':4 'organizacional':2 'rodriguez':3
1165	319	FRAGMENTOS VATICANOS	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			2571,2572	1	1	1	179	2			\N	2022-01-27 13:50:03	2022-01-27 13:50:03	'autonom':5 'fragment':1 'mexic':7 'nacional':4 'univers':3 'vatican':2
1176	1090	ALGORITMOS Y PROGRAMACION: DISENO DE ALGORITMOS E	PEREZ BERRO, MIRIAM			95,96,97,98,99,100,101,102,	1	1	1	245	2			\N	2022-01-27 16:08:26	2022-01-27 16:08:26	'algoritm':1,6 'berr':9 'disen':4 'miriam':10 'perez':8 'programacion':3
1185	350	ESTUDIOS SOBRE EL ESPANOL DE YUCATAN	LOPE BLANCH, JUAN M.			3165,3166	1	1	1	179	2			\N	2022-01-27 16:53:15	2022-01-27 16:53:15	'blanch':8 'espanol':4 'estudi':1 'juan':9 'lop':7 'm':10 'yucat':6
1196	1407	LA EXPRESION ORAL	ALCOBA RUEDA, SANTIAGO; AGUILAR CUEVAS, LOURDES; L			4083,4084	1	1	1	245	2			\N	2022-02-01 14:48:15	2022-02-01 14:48:15	'aguil':7 'alcob':4 'cuev':8 'expresion':2 'l':10 'lourd':9 'oral':3 'rued':5 'santiag':6
1201	1409	TURISMO POPULAR: INVERSIONES RENTABLES	RIPOLL Y HERNANDEZ, GRACIELA			4089,4090	1	1	1	60	2			\N	2022-02-01 15:03:10	2022-02-01 15:03:10	'graciel':8 'hernandez':7 'inversion':3 'popul':2 'rentabl':4 'ripoll':5 'turism':1
1205	192	LEY GENERAL DEL EQUILIBRIO ECOLOGICO Y LA PROTECCI	LEY GENERAL DEL EQUILIBRIO ECOLOGICO Y LA PROTECCI			2627,2628	1	1	1	82	2			\N	2022-02-01 15:38:24	2022-02-01 15:38:24	'ecolog':5,13 'equilibri':4,12 'general':2,10 'ley':1,9 'protecci':8,16
1208	286	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEXICA	CONSTITUCION POLITICA DE LOS ESTADOS UNIDOS MEXICA			2632	1	1	1	245	2			\N	2022-02-01 15:59:12	2022-02-01 15:59:12	'constitucion':1,8 'mexic':7,14 'polit':2,9 'unid':6,13
944	1204	¿QUÉ ONDA CON EL SIDA?	FORD, MICHAEL THOMAS				1	1	1	156	2			\N	2021-11-30 19:45:30	2021-11-30 19:45:30	'ford':6 'michael':7 'onda':2 'sid':5 'thom':8
960	2356	101 TÉCNICAS OLEO	CANAL, MA. FERNANDA				1	1	1	234	2			\N	2021-12-02 13:46:41	2021-12-02 13:50:57	'101':1 'canal':4 'fernand':6 'ma':5 'ole':3 'tecnic':2
970	1670	A LION CALLED CHRISTIAN	BOURKE, ANTHONY				1	1	1	236	2			\N	2021-12-09 14:23:46	2021-12-09 14:24:34	'anthony':6 'bourk':5 'call':3 'christi':4 'lion':2
712	672	PARA ENTENDER EL PODER JUDICIAL DE LOS ESTADOS UNI	CARBONELL, MIGUEL				1	1	1	151	2			\N	2021-10-15 17:22:28	2021-10-15 17:22:28	'carbonell':10 'entend':2 'judicial':5 'miguel':11 'pod':4 'uni':9
1020	409	LA ACADEMIA DE LETRAN	CAMPOS, MARCO ANTONIO			828,829	1	1	1	245	2			\N	2022-01-07 14:28:04	2022-01-07 14:28:04	'academi':2 'antoni':7 'camp':5 'letr':4 'marc':6
1050	1663	PLANEACION DE VIDA Y CARRERA	CASARES, DAVID			5070,5071,5072	1	1	1	117	2			\N	2022-01-11 20:05:31	2022-01-11 20:05:31	'carrer':5 'casar':6 'dav':7 'planeacion':1 'vid':3
1072	447	A COMMUNICATIVA COURSE IN ENGLISH WORKBOOK 4	P. REIN, DAVID WITH BYRD, DONALD R. H.			906,907	1	1	1	245	2			\N	2022-01-15 00:06:28	2022-01-15 00:06:28	'4':7 'byrd':12 'communic':2 'cours':3 'dav':10 'donald':13 'english':5 'h':15 'in':4 'p':8 'r':14 'rein':9 'with':11 'workbook':6
1123	1581	INTRODUCCION A LA TECNOLOGIA DE ALIMENTOS	ACADEMIA DEL AREA DE PLANTAS PILOTO DE ALIMENTOS			4887,4888	1	1	1	57	2			\N	2022-01-25 15:31:56	2022-01-25 15:31:56	'academi':7 'aliment':6,14 'are':9 'introduccion':1 'pilot':12 'plant':11 'tecnologi':4
1133	223	MACROECONOMIA	DORNBUSCH,RUDIGER Y FISCHER,STANLEY			2421	1	1	1	245	2			\N	2022-01-26 14:14:38	2022-01-26 14:14:38	'dornbusch':2 'fisch':5 'macroeconomi':1 'rudig':3 'stanley':6
1141	1326	DICCIONARIO DE ESCRITORES MEXICANOS SIGLO XX	UNIVERISDAD NACIONAL AUTONOMA DE MEXICO			3577,3578,3579,3580,3581,3582,3583,3584,3585,3586,3587,3588,3589,3590,	1	1	1	179	2			\N	2022-01-26 14:57:31	2022-01-26 14:57:31	'autonom':9 'diccionari':1 'escritor':3 'mexic':11 'mexican':4 'nacional':8 'sigl':5 'univerisd':7 'xx':6
1166	320	LIBRO XVIII DEL DIGESTO SOBRE LA COMPREVENTA	UNIVERISDAD NACIONAL AUTONOMA DE MEXICO			2573,2574,2575,2576,	1	1	1	179	2			\N	2022-01-27 13:56:58	2022-01-27 13:56:58	'autonom':10 'comprevent':7 'digest':4 'libr':1 'mexic':12 'nacional':9 'univerisd':8 'xviii':2
1177	354	ANALISIS GRAMATICAL	PIKE,KENNETH L. Y PIKE EVELYN G.			3173,3174	1	1	1	179	2			\N	2022-01-27 16:16:07	2022-01-27 16:16:07	'analisis':1 'evelyn':8 'g':9 'gramatical':2 'kenneth':4 'l':5 'pik':3,7
1186	66	TU FUTURO EN TUS SUENOS	LUND, REX			378	1	1	1	179	2			\N	2022-01-27 16:55:43	2022-01-27 16:55:43	'futur':2 'lund':6 'rex':7 'suen':5
1209	279	DICCIONARIO PRACTICO DE LA ADMINISTRACION PUBLICA	OLMEDO, RAUL			2633	1	1	1	245	2			\N	2022-02-01 16:01:17	2022-02-01 16:01:17	'administracion':5 'diccionari':1 'olmed':7 'practic':2 'public':6 'raul':8
1210	122	LENGUAJE ENSAMBLADOR PARA COMPUTADORAS BASADAS EN	IRVINE, KIP R.			122,123,124,125,126,127,128,129,	1	1	1	245	2			\N	2022-02-01 16:27:24	2022-02-01 16:27:24	'bas':5 'comput':4 'ensambl':2 'irvin':7 'kip':8 'lenguaj':1 'r':9
1212	1519	JAVASCRIPT: THE GOOD PARTS	CROCKFORD, DOUGLAS.			4695,4696,4697,4698	1	1	1	245	2			\N	2022-02-02 14:19:25	2022-02-02 14:19:25	'crockford':5 'dougl':6 'good':3 'javascript':1 'parts':4 'the':2
1214	1123	GESTION DE PROYECTOS CON MICROSOFT PROJECT 2007	COLMENAR, ANTONIO; CASTRO, MANUEL; SAN CRISTOBAL R			130,131,132,133,134,135,136,137	1	1	1	245	2			\N	2022-02-02 14:35:20	2022-02-02 14:35:20	'2007':7 'antoni':9 'castr':10 'colmen':8 'cristobal':13 'gestion':1 'manuel':11 'microsoft':5 'project':6 'proyect':3 'r':14 'san':12
1216	1124	REPARACION DE PC	COTTINO, DAMIAN; SPACIUK, DIEGO; BUSTAMANTE, DANIE			138,139,140,141,142,143,144,145,	1	1	1	245	2			\N	2022-02-02 14:43:37	2022-02-02 14:43:37	'bustam':8 'cottin':4 'dami':5 'dani':9 'dieg':7 'pc':3 'reparacion':1 'spaciuk':6
1217	1125	REPARACION DE IMPRESORAS	SINGERMANN, DANIEL			146,147	1	1	1	245	2			\N	2022-02-02 14:51:02	2022-02-02 14:51:02	'daniel':5 'impresor':3 'reparacion':1 'singermann':4
1221	1604	DESARROLLO DE BASE DE DATOS	CUADRA, DOLORES			4931	1	1	1	213	2			\N	2022-02-02 15:38:18	2022-02-02 15:38:18	'bas':3 'cuadr':6 'dat':5 'desarroll':1 'dolor':7
1222	449449	NEW ENGLISH FILE	OXENDEN, CLIVE / LATHAM-KOENIG, CHRISTINA / SELIGS				1	1	1	64	2			\N	2022-02-03 13:45:20	2022-02-03 13:45:20	'christin':9 'cliv':5 'english':2 'fil':3 'koenig':8 'latham':7 'latham-koenig':6 'new':1 'oxend':4 'seligs':10
1230	344	DEL CORA AL MAYA YUCATECO ESTUDIOS LINGUISTICOS SO	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			3153,3154	1	1	1	245	2			\N	2022-02-03 15:11:56	2022-02-03 15:11:56	'autonom':11 'cor':2 'estudi':6 'linguist':7 'may':4 'mexic':13 'nacional':10 'so':8 'univers':9 'yucatec':5
1232	428	A LISTENING, SPEAKING SKILLS BOOK	FERRER-HANREDDY, JAMI Y WHALLEY, ELIZABETH			861	1	1	1	245	2			\N	2022-02-03 15:37:17	2022-02-03 15:37:17	'book':5 'elizabeth':12 'ferr':7 'ferrer-hanreddy':6 'hanreddy':8 'jami':9 'listening':2 'skills':4 'speaking':3 'whalley':11
1239	1098	SMART CHOICE WORKBOOK 2	WILSON, KEN Y WISNIEWSKA, INGRID			3105,3106,3107,3108,3109,3110,3111	1	1	1	245	2			\N	2022-02-03 15:54:30	2022-02-03 15:54:30	'2':4 'choic':2 'ingrid':9 'ken':6 'smart':1 'wilson':5 'wisniewsk':8 'workbook':3
1240	297	DERECHO MERCANTIL	MANTILLA MOLINA, ROBERTO L.			2634	1	1	1	245	2			\N	2022-02-03 16:01:00	2022-02-03 16:01:00	'derech':1 'l':6 'mantill':3 'mercantil':2 'molin':4 'robert':5
1241	1135	ELEMENTOS DE DERECHO MERCANTIL MEXICANO	PINA VARA, RAFAEL DE			2635,2636	1	1	1	82	2			\N	2022-02-03 16:03:45	2022-02-03 16:03:45	'derech':3 'element':1 'mercantil':4 'mexican':5 'pin':6 'rafael':8 'var':7
1242	1134	DERECHO MERCANTIL MEXICANO CON EXCLUSION DEL MARIT	J. TENA, FELIPE DE			2637,2638,2639,2640,2641,	1	1	1	82	2			\N	2022-02-03 21:05:29	2022-02-03 21:05:29	'derech':1 'exclusion':5 'felip':10 'j':8 'marit':7 'mercantil':2 'mexican':3 'ten':9
1246	421	LIVRES DE BORD GRAMMAIRE	LIVRES DE BORD GRAMMAIRE			855	1	1	1	59	2			\N	2022-02-04 13:47:38	2022-02-04 13:47:38	'bord':3,7 'grammair':4,8 'livr':1,5
1258	1549	FUNDAMENTOS DE LEGISLACION TURISTICA	LOPEZ RODRIGUEZ, JOSE ALBERTO			04810,04811,04812	1	1	1	60	2			\N	2022-02-08 17:36:48	2022-02-08 17:36:48	'albert':8 'fundament':1 'jos':7 'legislacion':3 'lopez':5 'rodriguez':6 'turist':4
945	1754	¿QUIEN DIJO KARTOFEL?	STREPPONI, BLANCA				1	1	1	82	2			\N	2021-11-30 20:28:32	2021-11-30 20:28:32	'blanc':5 'dij':2 'kartofel':3 'strepponi':4
961	963	1968 LA ESCUELA Y LOS ESTUDIANTES	DOMINGUEZ NAVA, CUAUHTEMOC				1	1	1	179	2			\N	2021-12-02 13:58:58	2021-12-02 13:58:58	'1968':1 'cuauhtemoc':9 'dominguez':7 'escuel':3 'estudi':6 'nav':8
971	1414	A MISSISIPPI POR EL MAR: NUEVAS AVENTURAS DE GREGORIO	ROMEU, EMMA				1	1	1	5	2			\N	2021-12-09 14:26:53	2021-12-09 14:26:53	'aventur':7 'emma':11 'gregori':9 'mar':5 'missisippi':2 'nuev':6 'romeu':10
1021	413	LOS SISTEMAS DE NUMERACION INDOAMERICANOS	BARRIGA PUENTE, FRANCISCO			835,836	1	1	1	245	2			\N	2022-01-07 14:44:13	2022-01-07 14:44:13	'barrig':6 'francisc':8 'indoamerican':5 'numeracion':4 'puent':7 'sistem':2
1051	1741	VIOLENCIA FISICA Y CONSTRUCCION DE IDENTIDADES: PR	SANCHEZ BLANCO, CONCEPCION			5237	1	1	1	245	2			\N	2022-01-11 20:09:27	2022-01-11 20:09:27	'blanc':9 'concepcion':10 'construccion':4 'fisic':2 'ident':6 'pr':7 'sanchez':8 'violenci':1
1073	1559	PLANEACION DE ESPACIO TURISTICO.	CASTELLANOS HERNANDEZ, EULOGIO			4837,4838,4839	1	1	1	60	2			\N	2022-01-15 00:21:19	2022-01-15 00:21:19	'castellan':5 'espaci':3 'eulogi':7 'hernandez':6 'planeacion':1 'turist':4
1124	1076	ESTRUCTURA DE DATOS ORIENTADA A OBJETOS: ALGORITMO	GUARDATI BUEMO, SILVA			2777,2778,2779	1	1	1	245	2			\N	2022-01-25 15:34:11	2022-01-25 15:34:11	'algoritm':7 'buem':9 'dat':3 'estructur':1 'guardati':8 'objet':6 'orient':4 'silv':10
1134	1385	LEY GENERAL DE SOCIEDADES MERCANTILES	LEY GENERAL DE SOCIEDADES MERCANTILES			3924,3925,3926,3927,3928,	1	1	1	245	2			\N	2022-01-26 14:16:43	2022-01-26 14:30:16	'general':2,7 'ley':1,6 'mercantil':5,10 'sociedad':4,9
30	31	INFORMATICA 2	PEREZ, CHAVEZ CECILIA				1	1	1	63	2			\N	2021-10-04 16:24:38	2021-10-04 16:24:38	'2':2 'cecili':5 'chavez':4 'informat':1 'perez':3
31	32	ESPANOL 1	MAYORGA CORTES,LUCIO				1	1	1	64	2			\N	2021-10-04 16:25:39	2021-10-04 16:25:39	'1':2 'cort':4 'espanol':1 'luci':5 'mayorg':3
1142	374	MEMORIA DEL IX ENCUENTRO DE LINGUISTICA EN ACATLAN	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			563,638	1	1	1	179	2			\N	2022-01-26 15:11:36	2022-01-26 15:11:36	'acatl':8 'autonom':11 'encuentr':4 'ix':3 'linguist':6 'memori':1 'mexic':13 'nacional':10 'univers':9
1167	315	JULIO PAULO SETENCIAS A SU HIJO LIBRO SEGUNDO	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			2577,2578	1	1	1	179	2			\N	2022-01-27 14:00:28	2022-01-27 14:00:28	'autonom':11 'hij':6 'juli':1 'libr':7 'mexic':13 'nacional':10 'paul':2 'segund':8 'setenci':3 'univers':9
1211	1516	C# 5.0 IN A NUTSHELL: THE DEFINITIVE REFERENCE	ALBABARI, JOSEPH			4683,4684,4685,4686	1	1	1	245	2			\N	2022-02-01 16:30:38	2022-02-01 16:30:38	'5.0':2 'albabari':9 'c':1 'definitiv':7 'in':3 'joseph':10 'nutshell':5 'referenc':8 'the':6
1213	1521	JAVASCRIPT: THE DEFINITIVE GUIDE	FLANAGAN, DAVID.			4705,4706,4707,4708	1	1	1	245	2			\N	2022-02-02 14:28:54	2022-02-02 14:28:54	'dav':6 'definitiv':3 'flanag':5 'guid':4 'javascript':1 'the':2
1215	1426	CURSO DE PROGRAMACION C#	LANDA COSIO, NICOLAS ARRIOJA			4171,4172,4173,4174,4175	1	1	1	245	2			\N	2022-02-02 14:41:42	2022-02-02 14:41:42	'arrioj':8 'c':4 'cosi':6 'curs':1 'land':5 'nicol':7 'programacion':3
1218	1268	LOS RECUERDOS DEL PORVENIR	GARRO, ELENA			3391	1	1	1	245	2			\N	2022-02-02 14:52:30	2022-02-02 14:52:30	'elen':6 'garr':5 'porven':4 'recuerd':2
1223	719	ACTIVE SKILLS FOR READING: BOOK 1	ANDERSON, NEIL J			4308,4309,4310,4312	1	1	1	245	2			\N	2022-02-03 13:48:54	2022-02-03 13:49:59	'1':6 'activ':1 'anderson':7 'book':5 'for':3 'j':9 'neil':8 'reading':4 'skills':2
1231	1482	ENGLISH FOR LIFE 3	GRAY, CECIL			4555	1	1	1	245	2			\N	2022-02-03 15:14:16	2022-02-03 15:14:16	'3':4 'cecil':6 'english':1 'for':2 'gray':5 'lif':3
1233	450	READING KEYS	CRAVEN, MILES			908,909,910,911,912,913	1	1	1	245	2			\N	2022-02-03 15:39:35	2022-02-03 15:39:35	'crav':3 'keys':2 'mil':4 'reading':1
1243	288	DERECHO DE LOS NEGOCIOS TOPICOS DE DERECHO PRIVADO	RANGEL CHARLES, JUAN ANTONIO Y SANROMAN ARANDA, RO			288,288	1	1	1	245	2			\N	2022-02-03 21:07:03	2022-02-03 21:07:03	'antoni':12 'arand':15 'charl':10 'derech':1,7 'juan':11 'negoci':4 'priv':8 'rangel':9 'ro':16 'sanrom':14 'topic':5
1247	454	AMERICAN HEADWAY 3 STUDENT BOOK	SOARS, LIZ AND JOHN			917	1	1	1	64	2			\N	2022-02-04 13:53:46	2022-02-04 13:53:46	'3':3 'americ':1 'and':8 'book':5 'headway':2 'john':9 'liz':7 'soars':6 'student':4
1259	1041	COMO COMBINAR Y ELEGIR COLORES PARA EL DISENO GRAF	COMO COMBINAR Y ELEGIR COLORES PARA EL DISENO GRAF			00148,00148,00149,00150,00151,00152,00153,00154,00155,04103,04104,04105,04512	1	1	1	245	2			\N	2022-02-08 18:06:54	2022-02-08 18:08:38	'color':5,14 'combin':2,11 'disen':8,17 'eleg':4,13 'graf':9,18
946	1755	¿QUIÉN DIJO POMODORO?	STREPPONI, BLANCA				1	1	1	82	2			\N	2021-11-30 20:32:24	2021-11-30 20:32:24	'blanc':5 'dij':2 'pomodor':3 'quien':1 'strepponi':4
972	1386	A PRÁCTICAR MATEMÁTICAS: CUADERNO DE TRABAJO 1	OJEDA ANIMAS, LUIS FERNANDO				1	1	1	237	2			\N	2021-12-09 14:31:19	2021-12-09 14:31:41	'1':7 'anim':9 'cuadern':4 'fern':11 'luis':10 'matemat':3 'ojed':8 'practic':2 'trabaj':6
1022	398	LA LITERATURA Y LA SOCIEDAD DE FIN DE SIGLO	BARBOSA, JOAO ALEXANDRE			807,808	1	1	1	245	2			\N	2022-01-07 14:48:07	2022-01-07 14:48:07	'alexandr':12 'barbos':10 'fin':7 'joa':11 'literatur':2 'sigl':9 'socied':5
6	6	TALLER DE LECTURA Y REDACCION 1	QUINTERO JARA, CARLOS VALENTE				1	1	1	48	2			\N	2021-10-04 13:14:42	2021-10-04 16:28:45	'1':6 'carl':9 'jar':8 'lectur':3 'quinter':7 'redaccion':5 'tall':1 'valent':10
29	30	LECTURAS PARA ADOLESCENTES	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-04 16:20:36	2021-10-04 16:33:22	'adolescent':3 'lectur':1 'lozan':4 'lucer':5
1052	1543	CALIDAD TOTAL EN LAS EMPRESAS TURISTICAS	RAMIREZ CAVASSA, CESAR			4793,4794,4795	1	1	1	60	2			\N	2022-01-11 20:12:58	2022-01-11 20:12:58	'calid':1 'cavass':8 'ces':9 'empres':5 'ramirez':7 'total':2 'turist':6
1074	1732	MARKETING TURISTICO	ASCANIO GUEVARA, ALFREDO			1732	1	1	1	60	2			\N	2022-01-15 00:24:30	2022-01-15 00:24:30	'alfred':5 'ascani':3 'guev':4 'marketing':1 'turist':2
1125	1369	HACIA LA COMPRENSION DE LA INFORMATICA	BERTRAN SALVANS, MIQUEL;LAWSON, HAROLD W. Y JOVER			3815	1	1	1	245	2			\N	2022-01-25 15:35:31	2022-01-25 15:35:31	'bertr':7 'comprension':3 'haci':1 'harold':11 'informat':6 'jov':14 'lawson':10 'miquel':9 'salvans':8 'w':12
1135	1738	LEY FEDERAL DEL TRABAJO: COMENTARIOS Y JURISPRUDEN	TRUEBA BARRERA, JORGE			5231	1	1	1	250	2			\N	2022-01-26 14:20:17	2022-01-26 14:27:41	'barrer':9 'comentari':5 'federal':2 'jorg':10 'jurisprud':7 'ley':1 'trabaj':4 'trueb':8
1143	375	INVESTIGACIONES LINGUISTICAS EN MESOAMERICA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			837	1	1	1	179	2			\N	2022-01-26 15:16:35	2022-01-26 15:16:35	'autonom':7 'investig':1 'linguist':2 'mesoamer':4 'mexic':9 'nacional':6 'univers':5
1168	316	JULIO PAULO SETENCIAS A SU HIJO LIBRO UNO	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			2579,2580	1	1	1	179	2			\N	2022-01-27 14:04:23	2022-01-27 14:04:23	'autonom':11 'hij':6 'juli':1 'libr':7 'mexic':13 'nacional':10 'paul':2 'setenci':3 'univers':9
1219	1514	TURISMO VIRTUAL: PROGRAME UNAS VACACIIONES MARAVIL	RINCON CORCOLES, ANTONIO			4674,4675,4676	1	1	1	245	2			\N	2022-02-02 14:55:15	2022-02-02 14:55:15	'antoni':9 'corcol':8 'maravil':6 'program':3 'rincon':7 'turism':1 'unas':4 'vacaciion':5 'virtual':2
1224	425	A CONTENT-BASED WRITING BOOK	BLASS, LAURIE Y PIKE-BAKY, MEREDITH			858	1	1	1	245	2			\N	2022-02-03 13:52:58	2022-02-03 13:52:58	'baky':12 'bas':4 'blass':7 'book':6 'content':3 'content-bas':2 'lauri':8 'meredith':13 'pik':11 'pike-baky':10 'writing':5
1234	426	A WRITING PROCESS BOOK	KENNAN SEGAL, MARGARET Y PAVLIK, CHERYL			859	1	1	1	245	2			\N	2022-02-03 15:41:08	2022-02-03 15:41:08	'book':4 'cheryl':10 'kenn':5 'margaret':7 'pavlik':9 'process':3 'segal':6 'writing':2
1248	1102	TACTICS FOR LISTENING	RICHARDS, JACK C.			2958,2959,2960,2961,2962,3835,3883,	1	1	1	64	2			\N	2022-02-04 14:01:47	2022-02-04 14:01:47	'c':6 'for':2 'jack':5 'listening':3 'richards':4 'tactics':1
1260	1082	MULTIMEDIA: MAKING IT WORK	VAUGHAN, TAY			00165,00166,00167,00168,00169,00170,	1	1	1	61	2			\N	2022-02-08 18:22:38	2022-02-08 18:22:38	'it':3 'making':2 'multimedi':1 'tay':6 'vaugh':5 'work':4
1261	542	QUIMICA ANALITICA	SKOOG, DOUGLAS A. , WEST, DONALD M. , HOLLER, F. J			01082,01083,01084,01085,	1	1	1	245	2			\N	2022-02-08 19:05:02	2022-02-08 19:05:02	'analit':2 'donald':7 'dougl':4 'f':10 'holl':9 'j':11 'm':8 'quimic':1 'skoog':3 'west':6
1262	1438	LEY FEDERAL DE PROTECCION AL CONSUMIDOR	LEY FEDERAL DE PROTECCION AL CONSUMIDOR			02328,03467,04218,04219,04220,04221,04384,04385	1	1	1	116	2			\N	2022-02-08 19:15:46	2022-02-08 19:15:46	'consumidor':6,12 'federal':2,8 'ley':1,7 'proteccion':4,10
1265	277	MARCO JURIDICO Y NORMATIVO DE LA CIENCIA Y LA TECNOLOGÍA	CONSEJO DE CIENCIA Y TECNOLOGIA DEL ESTADO DE TABA			02657	1	1	1	245	2			\N	2022-02-08 19:30:25	2022-02-08 19:30:25	'cienci':7,13 'consej':11 'jurid':2 'marc':1 'normat':4 'tab':19 'tecnolog':10 'tecnologi':15
1268	1364	COLOR PARA SITIOS WEB	HOLZSCHLAG, MOLLY E.			03771,03772,03773,03774,03775,03776,03777,03778	1	1	1	245	2			\N	2022-02-08 20:20:34	2022-02-08 20:20:34	'color':1 'holzschlag':5 'molly':6 'siti':3 'web':4
1269	1111	BASES DEL DISENO GRAFICO	SWANN, ALAN			00161,00162,00163,00164,03836,03837,03838,03839,03840,03841,	1	1	1	245	2			\N	2022-02-08 20:30:58	2022-02-08 20:30:58	'alan':6 'bas':1 'disen':3 'grafic':4 'swann':5
1270	1382	COMPENDIO DE DISPOSICIONES SOBRE COMERCIO EXTERIOR	COMPENDIO DE DISPOSICIONES SOBRE COMERCIO EXTERIOR				1	1	1	245	2			\N	2022-02-08 20:51:21	2022-02-08 20:51:21	'comerci':5,11 'compendi':1,7 'disposicion':3,9 'exterior':6,12
1271	1413	DISENO DE BASES DE DATOS	STEPHENS, ROD			04117,04118,04119,04120,04121,04122,04123,04124,	1	1	1	111	2			\N	2022-02-08 22:18:37	2022-02-08 22:18:37	'bas':3 'dat':5 'disen':1 'rod':7 'stephens':6
1272	1419	SISTEMAS DE INFORMACION GERENCIAL: ADMINISTRACION	LAUDON, KENNETH C. Y LAUDON, JANE P.			04146,04147	1	1	1	245	2			\N	2022-02-08 22:29:32	2022-02-08 22:29:32	'administracion':5 'c':8 'gerencial':4 'informacion':3 'jan':11 'kenneth':7 'laudon':6,10 'p':12 'sistem':1
1273	1422	DERECHO DE LA SEGURIDAD SOCIAL	CAZARES GARCIA, GUSTAVO			04158,04159,04160,04161,04162,04163	1	1	1	82	2			\N	2022-02-08 22:42:44	2022-02-08 22:42:44	'cazar':6 'derech':1 'garci':7 'gustav':8 'segur':4 'social':5
1274	1429	SISTEMAS DE ADMINISTRACION DE BASES DE DATOS	POST, GERALD V.			04187,04188,04189,04190,04191,	1	1	1	245	2			\N	2022-02-08 22:48:17	2022-02-08 22:48:17	'administracion':3 'bas':5 'dat':7 'gerald':9 'post':8 'sistem':1 'v':10
1275	95	INTRODUCCION AL DERECHO TURISTICO	LEON GOMEZ,DANIA			04386,04387,04388,04389,04390	1	1	1	60	2			\N	2022-02-08 22:52:44	2022-02-08 22:52:44	'dani':7 'derech':3 'gomez':6 'introduccion':1 'leon':5 'turist':4
1276	1163	DISENO DE LOGOTIPOS 4	SIMMONS, CHRISTOPHER			03795,03796,03797,04514,04515,04516,04517,04518,	1	1	1	245	2			\N	2022-02-08 22:58:55	2022-02-08 22:58:55	'4':4 'christoph':6 'disen':1 'logotip':3 'simmons':5
1277	1515	HTML5 MASTERY: SEMANTICS, STANDARDS, AND STYLING	BRADFORD, ANSELM			04677,04678,04679,04680,04681,04682,	1	1	1	245	2			\N	2022-02-08 23:06:52	2022-02-08 23:06:52	'and':5 'anselm':8 'bradford':7 'html5':1 'mastery':2 'semantics':3 'standards':4 'styling':6
947	1756	¿QUIEN DIJO ZAPALLO?	STREPPONI, BLANCA				1	1	1	82	2			\N	2021-11-30 20:36:24	2021-11-30 20:36:24	'blanc':5 'dij':2 'strepponi':4 'zapall':3
973	1554	A TALES OF TWO CITIES	DICKENS, CHARLES				1	1	1	30	2			\N	2021-12-09 14:33:30	2021-12-09 14:33:30	'charl':7 'citi':5 'dickens':6 'of':3 'tal':2 'two':4
1053	CHAVEZ DE LA PENA, JORGE	ECOTURISMO TAP: METODOLOGIA PARA UN TURISMO AMBIEN	CHAVEZ DE LA PENA, JORGE			4799,4800,4801	1	1	1	60	2			\N	2022-01-11 20:16:00	2022-01-11 20:16:00	'ambi':7 'chavez':8 'ecotur':1 'jorg':12 'metodologi':3 'pen':11 'tap':2 'turism':6
1075	1700	MARKETING TURISTICO	RAMIREZ CAVASSA CESAR			5156	1	1	1	60	2			\N	2022-01-15 00:26:42	2022-01-15 00:26:42	'cavass':4 'ces':5 'marketing':1 'ramirez':3 'turist':2
1126	1381	CCNA ICND2 GUIA OFICIAL PARA EL EXAMEN DE CERTIFIC	CISCO			3905,3906,4374,4375,4376,4377,4378,	1	1	1	245	2			\N	2022-01-25 15:36:46	2022-01-25 15:36:46	'ccna':1 'certific':9 'cisc':10 'exam':7 'gui':3 'icnd2':2 'oficial':4
1144	367	TALLER DE LECTURA Y REDACCION	MEDINA CARBALLO, MANUEL			3197,3198	1	1	1	60	2			\N	2022-01-26 15:20:23	2022-01-26 15:20:23	'carball':7 'lectur':3 'manuel':8 'medin':6 'redaccion':5 'tall':1
1169	272	CONSTITUCION POLITICA DE LAS ESTADOS UNIDOS MEXICA	CONSTITUCION POLITICA DE LAS ESTADOS UNIDOS MEXICA			3037,3343,3344	1	1	1	245	2			\N	2022-01-27 14:11:27	2022-01-27 14:11:27	'constitucion':1,8 'mexic':7,14 'polit':2,9 'unid':6,13
1220	1517	ALGORITHMS IN A NUTSHELL: A DESKTOP QUICK REFERENC	HEINEMAN, GEORGE T.			4687,4688,4689,4690	1	1	1	245	2			\N	2022-02-02 14:57:52	2022-02-02 14:57:52	'algorithms':1 'desktop':6 'georg':10 'heinem':9 'in':2 'nutshell':4 'quick':7 'referenc':8 't':11
1225	1483	COMMUNICATIVE IDEAS: AN APPROACH WITH CLASSROOM AC	NORMAN, DAVID			4556	1	1	1	245	2			\N	2022-02-03 13:55:35	2022-02-03 13:55:35	'ac':7 'an':3 'approach':4 'classroom':6 'communicativ':1 'dav':9 'ide':2 'norm':8 'with':5
1245	278	TABASCO Y SUS CONSTITUCIONES	UNIVERSIDAD JUAREZ AUTONOMA DE TABASCO			2652	1	1	1	245	2			\N	2022-02-03 21:10:17	2022-02-03 21:10:17	'autonom':7 'constitu':4 'juarez':6 'tabasc':1,9 'univers':5
1249	1477	TOURISM AND CATERING	WOOD, NEIL			4427	1	1	1	64	2			\N	2022-02-04 14:03:28	2022-02-04 14:03:28	'and':2 'catering':3 'neil':5 'tourism':1 'wood':4
1264	287	LEY FEDERAL DE PROTECCIÓN AL CONSUMIDOR Y DISPOSICIONES COMPLEMENTARIAS	LEY FEDERAL DE PROTECCION AL CONSUMIDOR			02653,02654,02655,02656	1	1	1	245	2			\N	2022-02-08 19:23:25	2022-02-08 19:23:58	'complementari':9 'consumidor':6,15 'disposicion':8 'federal':2,11 'ley':1,10 'proteccion':4,13
1266	274	LEY GENERAL DE SALUD Y DISPOSICIONES COMPLEMENTARIAS	LEY GENERAL DE SALUD Y DISPOSICIONES COMPLEMENTARI			02658	1	1	1	245	2			\N	2022-02-08 19:33:02	2022-02-08 19:33:02	'complementari':7,14 'disposicion':6,13 'general':2,9 'ley':1,8 'salud':4,11
1278	1518	HTML5 COOKBOOK	SCHMITT, CHRISTOPHER			04691,04692,04693,04694	1	1	1	245	2			\N	2022-02-08 23:11:49	2022-02-08 23:11:49	'christoph':4 'cookbook':2 'html5':1 'schmitt':3
1279	1520	ADOBE FLASH PROFESSIONAL CS6 CLASSROOM IN A BOOK:	ADOBE FLASH PROFESSIONAL CS6 CLASSROOM IN A BOOK:			04699,04700,04701,04702,04703,04704,04699,04700,04701,04702,04703,04704,04699,04700,04701,04702,04703,04704,	1	1	1	245	2			\N	2022-02-08 23:21:47	2022-02-08 23:21:47	'adob':1,9 'book':8,16 'classroom':5,13 'cs6':4,12 'flash':2,10 'in':6,14 'professional':3,11
948	958	¿QUIEN LES CORTA LAS ALAS A LOS PÁJAROS?	GUTIERREZ LOMASTO, GABRIELA				1	1	1	136	2			\N	2021-11-30 20:39:06	2021-11-30 20:39:06	'alas':5 'cort':3 'gabriel':11 'gutierrez':9 'lomast':10 'pajar':8
974	2484	A TREINTA AÑOS DE PLURAL ( 1971 - 1976 ): REVISTA FUNDADA POR OCTAVIO PAZ	PAZ, MARIE JOSE				1	1	1	16	2			\N	2021-12-09 14:36:34	2021-12-09 14:36:34	'1971':6 '1976':7 'años':3 'fund':9 'jos':15 'mari':14 'octavi':11 'paz':12,13 'plural':5 'revist':8 'treint':2
1076	1556	LAS ACTIVIDADES TURISTICAS Y RECREACIONALES: EL HO	BOULLON, ROBERTO C.			4829,4830,5320,5321,5322	1	1	1	60	2			\N	2022-01-15 00:29:10	2022-01-15 00:29:10	'activ':2 'boullon':8 'c':10 'ho':7 'recreacional':5 'robert':9 'turist':3
1127	756	CCENT	ODOM,WENDELL			4379,4380,4381,4382,4383,4398,4399,	1	1	1	245	2			\N	2022-01-25 15:39:09	2022-01-25 15:39:09	'ccent':1 'odom':2 'wendell':3
1145	360	CRITICA DE LA INFORMACION DE MASAS	TOUSSAINT, FLORENCE			3185,3186	1	1	1	60	2			\N	2022-01-26 15:23:46	2022-01-26 15:23:46	'critic':1 'florenc':8 'informacion':4 'mas':6 'toussaint':7
1170	1088	ACADEMIA DE NETWORKING DE CISCO SYSTEMS: GUIA DEL	CISCO SYSTEMS, INC			79,80,81,82,83,84,85,86,87,88,3731,3935,3936,4397,4424,	1	1	1	245	2			\N	2022-01-27 14:18:55	2022-01-27 14:18:55	'academi':1 'cisc':5,9 'gui':7 'inc':11 'networking':3 'systems':6,10
1226	1112	ADVANCED GRAMMAR IN USE	HEWINGS, MARTIN			2992,2993,2994,2995,2996,2997,2998,2999,3861,3862,3863,	1	1	1	245	2			\N	2022-02-03 13:59:41	2022-02-03 13:59:41	'advanc':1 'gramm':2 'hewings':5 'in':3 'martin':6 'use':4
1236	432	SKYLINE 1 STUDENT'S BOOK	BREWSTER, SIMON / DAVIES, PAUL / ROGERS, MICKEY			869,870,871,872,873,	1	1	1	245	2			\N	2022-02-03 15:44:17	2022-02-03 15:44:17	'1':2 'book':5 'brewst':6 'davi':8 'mickey':11 'paul':9 'rogers':10 's':4 'simon':7 'skylin':1 'student':3
1250	423	AMERICAN HEADWAY 4	SOARS,JOHN Y SOARS LIZ			857	1	1	1	64	2			\N	2022-02-04 14:05:56	2022-02-04 14:05:56	'4':3 'americ':1 'headway':2 'john':5 'liz':8 'soars':4,7
1267	284	SISTEMA JURIDICO EDUCATIVO DE TABASCO	PODER LEGISLATIVO DEL ESTADO LIBRE Y SOBERANO DE T			02659,02660,02661,02662,02663,02664,02665,02666,02667,	1	1	1	245	2			\N	2022-02-08 19:35:16	2022-02-08 19:35:16	'educ':3 'jurid':2 'legisl':7 'libr':10 'pod':6 'sistem':1 'soberan':12 't':14 'tabasc':5
1280	1522	PHOTOSHOP CS6: THE MISSING MANUAL	SNIDER, LESA			04709,04710,04711,04712,04713	1	1	1	245	2			\N	2022-02-08 23:26:05	2022-02-08 23:26:05	'cs6':2 'les':7 'manual':5 'missing':4 'photoshop':1 'snid':6 'the':3
1283	1583	ADMINISTRACION DE BASES DE DATOS	GILLENSON, MARK L.			04890,048901	1	1	1	57	2			\N	2022-02-08 23:42:46	2022-02-08 23:43:27	'administracion':1 'bas':3 'dat':5 'gillenson':6 'l':8 'mark':7
1284	1596	METODOLOGIA DEL DISENO	AMBROSE, GAVIN			04919	1	1	1	82	2			\N	2022-02-08 23:46:03	2022-02-08 23:46:03	'ambros':4 'disen':3 'gavin':5 'metodologi':1
1286	21	ALGORITMOS COMPUTACIONALES	BAASE, SARA			00182,00183	1	1	1	245	2			\N	2022-02-09 13:39:13	2022-02-09 13:39:13	'algoritm':1 'baas':3 'computacional':2 'sar':4
1293	18	NET WARE NETWORK COMPUTING PRODUCTS	NOVELL			00200	1	1	1	245	2			\N	2022-02-09 15:11:00	2022-02-09 15:11:00	'computing':4 'net':1 'network':3 'novell':6 'products':5 'war':2
1296	17	GUIA VISUAL DE DISENO DE PAGINAS WEB	PENA TRESANCOS, JAIME			00209	1	1	1	111	2			\N	2022-02-09 15:18:19	2022-02-09 15:18:30	'disen':4 'gui':1 'jaim':10 'pagin':6 'pen':8 'tresanc':9 'visual':2 'web':7
1297	28	NAVEGAR EN INTERNET FRONTPAGE 2000 DISENO Y CR	PASCUAL GONZALEZ FRANCISCO			00206,00207,00208	1	1	1	213	2			\N	2022-02-09 15:23:50	2022-02-09 15:23:50	'2000':5 'cr':8 'disen':6 'francisc':11 'frontpag':4 'gonzalez':10 'internet':3 'naveg':1 'pascual':9
1298	16	NAVEGAR EN INTERNET MICROSOFT INTERNET EXPLORER 6	PASCUAL GONZALEZ, FRANCISCO			00204,00205	1	1	1	213	2			\N	2022-02-09 15:28:51	2022-02-09 15:28:51	'6':7 'explor':6 'francisc':10 'gonzalez':9 'internet':3,5 'microsoft':4 'naveg':1 'pascual':8
1300	1043	LOS DELITOS EN EL TURISMO	LOPEZ RODRIGUEZ, JOSE ALBERTO			02668,02669,02670,02671,02672,02673,02674,02675,02676,02677	1	1	1	245	2			\N	2022-02-09 15:45:07	2022-02-09 21:06:11	'albert':9 'delit':2 'jos':8 'lopez':6 'rodriguez':7 'turism':5
1301	264	CONTRATOS CIVILES AYUDA DE MEMORIA	C. MEJAN, LUIS MANUEL			02678,02679	1	1	1	64	2			\N	2022-02-10 13:27:33	2022-02-10 13:27:33	'ayud':3 'c':6 'civil':2 'contrat':1 'luis':8 'manuel':9 'mej':7 'memori':5
1310	24	MICROSOFT PUBLISHER 2002	ANDRES GAY, MERCEDES			00180,00181	1	1	1	245	2			\N	2022-02-10 15:16:13	2022-02-10 15:16:13	'2002':3 'andres':4 'gay':5 'merced':6 'microsoft':1 'publish':2
1311	10	LA GLOBALIZACION Y LAS NUEVAS TECNOLOGIAS DE INFOR	REBOLLOSO GALLARDO, ROBERTO			00213,00214	1	1	1	60	2			\N	2022-02-10 15:26:58	2022-02-10 15:26:58	'gallard':10 'globalizacion':2 'infor':8 'nuev':5 'reboll':9 'robert':11 'tecnologi':6
1312	11	INTRODUCCION A LA INFORMATICA	RODRIGUEZ VEGA, JORGE			00215,00216	1	1	1	245	2			\N	2022-02-10 15:29:13	2022-02-10 15:29:13	'informat':4 'introduccion':1 'jorg':7 'rodriguez':5 'veg':6
1313	29	GUIA COMPLETA DE MICROSOFT ACCESS 2 PARA WINDOWS	VIESCAS, JOHN L.			00218	1	1	1	245	2			\N	2022-02-10 18:13:06	2022-02-10 18:13:06	'2':6 'access':5 'complet':2 'gui':1 'john':10 'l':11 'microsoft':4 'viesc':9 'windows':8
1314	30	MICROSOFT ACCESS 97 SOLUCIONES INSTANTANEAS	WINTER,RICK			00219	1	1	1	245	2			\N	2022-02-10 18:18:43	2022-02-10 18:18:43	'97':3 'access':2 'instantan':5 'microsoft':1 'rick':7 'solucion':4 'wint':6
1315	31	1001 WORD FOR WINDOWS	WYATT, ALLEN L.				1	1	1	245	2			\N	2022-02-10 18:21:36	2022-02-10 18:21:36	'1001':1 'allen':6 'for':3 'l':7 'windows':4 'word':2 'wyatt':5
1317	23	DIAGRAMAS DE FLUJO: MANUAL DE LOGICA PARA COMPUTAD	STERN, NANCY B.			02986	1	1	1	57	2			\N	2022-02-10 19:34:13	2022-02-10 19:34:13	'b':11 'comput':8 'diagram':1 'fluj':3 'logic':6 'manual':4 'nancy':10 'stern':9
1318	1390	SISTEMAS DE INFORMACION HERRAMINTAS PRACTICAS PARA	GOMEZ VIEITES, ALVARO Y SUAREZ REY, CARLOS			03951,03951,03952,04335,04336,04337,04338,	1	1	1	213	2			\N	2022-02-10 19:36:38	2022-02-10 19:36:38	'alvar':9 'carl':13 'gomez':7 'herramint':4 'informacion':3 'practic':5 'rey':12 'sistem':1 'suarez':11 'vieit':8
949	1002	¿QUIÉN SE A LLEVADO MI QUESO?: UNA MANERA SORPRENDENTE DE AFRONTAR EL CAMBIO EN EL TRABAJO Y EN LA VIDA PRIVADA	JOHNSON, SPENCER				1	1	1	227	2			\N	2021-12-01 13:44:51	2021-12-01 13:45:29	'afront':11 'cambi':13 'johnson':22 'llev':4 'maner':8 'priv':21 'ques':6 'quien':1 'sorprendent':9 'spenc':23 'trabaj':16 'vid':20
975	2717	A TÚ SALUD	INSTITUTO MEXICANO DEL SEGURO SOCIAL				2	1	1	238	2			\N	2021-12-09 14:40:05	2021-12-09 14:44:40	'institut':4 'mexican':5 'salud':3 'segur':7 'social':8
1077	1553	CONCEPTUALIZACION, ORIGEN Y EVOLUCION DEL TURISMO	ACERENZA, MIGUEL ANGEL			4821,4822	1	1	1	60	2			\N	2022-01-15 00:32:55	2022-01-15 00:32:55	'acerenz':7 'angel':9 'conceptualizacion':1 'evolucion':4 'miguel':8 'orig':2 'turism':6
1146	369	EL CENTRO DE LINGUISTICA HISPANICA Y LA LENGUA ESP	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			3201,3202	1	1	1	179	2			\N	2022-01-26 15:26:25	2022-01-26 15:26:25	'autonom':12 'centr':2 'esp':9 'hispan':5 'lengu':8 'linguist':4 'mexic':14 'nacional':11 'univers':10
1171	1796	REDES DE COMPUTADORAS	TANENBAUM, ANDREW S.			5339	1	1	1	75	2			\N	2022-01-27 14:21:57	2022-01-27 14:21:57	'andrew':5 'comput':3 'red':1 's':6 'tanenbaum':4
1227	1114	BASIC GRAMMAR IN USE	MURPHY, RAYMOND Y SMALZER, WILLIAM R.			3004,3005,3006,3007,3008,3009,3010,3011,3012	1	1	1	245	2			\N	2022-02-03 14:02:31	2022-02-03 14:02:31	'basic':1 'gramm':2 'in':3 'murphy':5 'r':10 'raymond':6 'smalz':8 'use':4 'william':9
33	33	NUEVO ESPANOL DE HOY 1	HERRERA SUASTEGUI OMAR				1	1	1	65	2			\N	2021-10-04 16:37:23	2021-10-04 16:37:23	'1':5 'espanol':2 'herrer':6 'hoy':4 'nuev':1 'omar':8 'suastegui':7
1237	434	SKYLINE 2 STUDENT'S BOOK	BREWSTER, SIMON / DAVIES, PAUL / ROGERS, MICKEY			880,881,882,884	1	1	1	245	2			\N	2022-02-03 15:46:03	2022-02-03 15:46:03	'2':2 'book':5 'brewst':6 'davi':8 'mickey':11 'paul':9 'rogers':10 's':4 'simon':7 'skylin':1 'student':3
1251	440	A COMMUNICATIVE COURSE IN ENGLISH STUDENT BOOK	WARSHAWSKY, DIANE Y H. BYRD, DONALD R.			892,893	1	1	1	245	2			\N	2022-02-04 14:08:02	2022-02-04 14:08:02	'book':7 'byrd':12 'communicativ':2 'cours':3 'dian':9 'donald':13 'english':5 'h':11 'in':4 'r':14 'student':6 'warshawsky':8
1281	1523	FLASH CS6: THE MISSING MANUAL	GROVER, CHRIS.			04714,04715,04716,04717,04718	1	1	1	245	2			\N	2022-02-08 23:34:54	2022-02-08 23:34:54	'chris':7 'cs6':2 'flash':1 'grov':6 'manual':5 'missing':4 'the':3
1285	1721	DERECHO ADUANERO	CRAVAJAL CARVAJAL CONTRERAS, MAXIMO			05184,05185	1	1	1	82	2			\N	2022-02-08 23:48:04	2022-02-08 23:48:04	'aduaner':2 'carvajal':4 'contrer':5 'cravajal':3 'derech':1 'maxim':6
1287	188	CORELDRAW 11 SUPERFACIL	CORDOBA MORENO, ENRIQUE			00185,00186,00187,00188	1	1	1	245	2			\N	2022-02-09 13:43:58	2022-02-09 13:43:58	'11':2 'cordob':4 'coreldraw':1 'enriqu':6 'moren':5 'superfacil':3
1294	32	OBTENGA RESULTADOS CON MICROSOFT OFFICE 97	MICROSOFT			00201	1	1	1	245	2			\N	2022-02-09 15:12:17	2022-02-09 15:12:17	'97':6 'microsoft':4,7 'obteng':1 'offic':5 'result':2
1299	13	REDES LOCALES	RAYA, JOSE LUIS			00210,00211,00212	1	1	1	213	2			\N	2022-02-09 15:31:55	2022-02-09 15:31:55	'jos':4 'local':2 'luis':5 'ray':3 'red':1
1302	298	TEORIA GENERAL DE LAS OBLIGACIONES	BORJA SORIANO, MANUEL			02680	1	1	1	82	2			\N	2022-02-10 13:30:43	2022-02-10 13:30:43	'borj':6 'general':2 'manuel':8 'oblig':5 'sorian':7 'teori':1
1319	263	AGENCIAS DE VIAJES: ORGANIZACION Y OPERACION	ACERENZA,MIGUEL ANGEL			02690,02691,02712,02713,02714,02715,	1	1	1	60	2			\N	2022-02-10 23:57:15	2022-02-10 23:57:15	'acerenz':7 'agenci':1 'angel':9 'miguel':8 'operacion':6 'organizacion':4 'viaj':3
950	2106	¿SON O SE HACEN? EL CAMPO DE LA DISCAPACIDAD INTELECTUAL ESTUDIADA A TRAVEZ DE RECORRIDOS MULTIPLES	AZNER, ANDREA S.				1	1	1	165	2			\N	2021-12-01 14:49:00	2021-12-01 14:49:00	'andre':18 'azner':17 'camp':6 'discapac':9 'estudi':11 'hac':4 'intelectual':10 'multipl':16 'recorr':15 's':19 'travez':13
976	2296	ABUSOS Y ADMONICIONES: ÉTICA Y ESCRITURA EN LA NARRATIVA HISPANOAMERICANA MODERNA	GONZALEZ, ANIBAL				1	1	1	40	2			\N	2021-12-09 14:51:35	2021-12-09 14:51:35	'abus':1 'admonicion':3 'anibal':13 'escritur':6 'etic':4 'gonzalez':12 'hispanoamerican':10 'modern':11 'narrat':9
1078	227	DIRECCION DE PRODUCTOS SELECCION DE TEXTOS	PHELPS,D.MAYNARD			2853,2854	1	1	1	245	2			\N	2022-01-15 00:37:59	2022-01-15 00:37:59	'd.maynard':8 'direccion':1 'phelps':7 'product':3 'seleccion':4 'text':6
1147	325	DICCIONARIO ANALITICO DEL POPOLUCA DE TEXISTEPEC	WICHMANN, SOREN			3051,3052	1	1	1	179	2			\N	2022-01-26 15:29:35	2022-01-26 15:29:35	'analit':2 'diccionari':1 'popoluc':4 'sor':8 'texistepec':6 'wichmann':7
1228	1119	ENGLISH GRAMMAR IN USE	MURPHY, RAYMOND			3091,3092,3093,3094,3095,3096,3097,4740,4741,4742,4743	1	1	1	245	2			\N	2022-02-03 14:07:24	2022-02-03 14:10:33	'english':1 'gramm':2 'in':3 'murphy':5 'raymond':6 'use':4
1238	1098	AT YOUR SERVICE ENGLISH FOR THE TRAVEL AND TOURIST	STOTT, TRISH Y BUCKINGHAM, ANGELA			2913,2914,2915,2916,2917,2918,2919,2920,2921,2922,2923,2924,2925,2926,2927,	1	1	1	245	2			\N	2022-02-03 15:51:43	2022-02-03 15:51:43	'and':8 'angel':14 'at':1 'buckingham':13 'english':4 'for':5 'servic':3 'stott':10 'the':6 'tourist':9 'travel':7 'trish':11 'your':2
1252	442	A COMMUNICATIVE COURSE IN ENGLISH STUDENT BOOK 2	COSTINETT, SANDRA Y H. BYRD DONALD R.			896,897	1	1	1	245	2			\N	2022-02-04 14:18:41	2022-02-04 14:18:41	'2':8 'book':7 'byrd':13 'communicativ':2 'costinett':9 'cours':3 'donald':14 'english':5 'h':12 'in':4 'r':15 'sandr':10 'student':6
34	34	COMUNICATE EN ESPANOL 1	DIAZ DE LEON, SANDRA				1	1	1	64	2			\N	2021-10-04 16:38:57	2021-10-04 16:39:08	'1':4 'comunicat':1 'diaz':5 'espanol':3 'leon':7 'sandr':8
1282	1524	ADOBE &#039;PHOTOSHOP&#039; CS6 CLASSROOM IN A BOOK: THE OFF	VADOBE &#039;PHOTOSHOP&#039; CS6 CLASSROOM IN A BOOK: THE OFF			04719,04720,04721,04722,04723,	1	1	1	245	2			\N	2022-02-08 23:38:40	2022-02-08 23:39:02	'adob':1 'book':7,16 'classroom':4,13 'cs6':3,12 'in':5,14 'off':9,18 'photoshop':2,11 'the':8,17 'vadob':10
1288	14	GUIA VISUAL DE MICROSOFT INTERNET EXPLORER 6	RODRIGUEZ FERNANDEZ, OSCARRODRIGUEZ FERNANDEZ, OSCAR			00190,00191	1	1	1	245	2			\N	2022-02-09 13:47:21	2022-02-09 13:47:21	'6':7 'explor':6 'fernandez':9,11 'gui':1 'internet':5 'microsoft':4 'oscar':12 'oscarrodriguez':10 'rodriguez':8 'visual':2
1295	33	DOMINE MICROSOFT OFFICE 2000 PROFESSIONAL	PACUAL GONZALEZ, FRANCISCO			00202,00203	1	1	1	213	2			\N	2022-02-09 15:16:32	2022-02-09 15:16:32	'2000':4 'domin':1 'francisc':8 'gonzalez':7 'microsoft':2 'offic':3 'pacual':6 'professional':5
1303	1075	CODIGO FISCAL DE LA FEDERACION 2008	CODIGO FISCAL DE LA FEDERACION 2008			02687,02688	1	1	1	60	2			\N	2022-02-10 13:33:07	2022-02-10 13:33:07	'2008':6,12 'codig':1,7 'federacion':5,11 'fiscal':2,8
977	904	ACCIONES Y REFLEXIONES PARA LA RECONSTRUCCIÓN DE LA POLÍTICA SOCIAL EN MÉXICO. UNA MIRADA DESDE LO LOCAL	COGCO CALDERON, ADOLFO ROGELIO				1	1	1	239	2			\N	2021-12-09 14:54:03	2021-12-09 14:54:39	'accion':1 'adolf':20 'calderon':19 'cogc':18 'local':17 'mexic':12 'mir':14 'polit':9 'reconstruccion':6 'reflexion':3 'rogeli':21 'social':10
1079	1490	PROMOCION TURISTICA: UN ENFOQUE METODOLOGICO.	ACERENZA, MIGUEL ANGEL			4581,4582,4583	1	1	1	245	2			\N	2022-01-15 00:40:32	2022-01-15 00:40:32	'acerenz':6 'angel':8 'enfoqu':4 'metodolog':5 'miguel':7 'promocion':1 'turist':2
1148	370	EL KANJOBAL DE SAN MIGUEL ACATAN	ZABALA, ROBERTO			3203,3204	1	1	1	179	2			\N	2022-01-26 15:34:32	2022-01-26 15:34:32	'acat':6 'kanjobal':2 'miguel':5 'robert':8 'san':4 'zabal':7
1229	1113	GRAMMAR IN USE INTERMEDIATE	MURPHY, RAYMOND Y SMALZER, WILLIAM R.			3000,3001,3002,3003	1	1	1	245	2			\N	2022-02-03 14:14:18	2022-02-03 14:14:18	'gramm':1 'in':2 'intermediat':4 'murphy':5 'r':10 'raymond':6 'smalz':8 'use':3 'william':9
1253	902	A COMMUNICATIVE COURSE IN ENGLISH STUDENT BOOK 3	WARSHAWASKY, DIANE WITH H. BYRD, DONALD R.			902,903	1	1	1	245	2			\N	2022-02-04 14:21:30	2022-02-04 14:21:30	'3':8 'book':7 'byrd':13 'communicativ':2 'cours':3 'dian':10 'donald':14 'english':5 'h':12 'in':4 'r':15 'student':6 'warshawasky':9 'with':11
1289	26	DESARROLLO DE APLICACIONES CON ACCESS 2000	HENTZEN,WHIL			00192	1	1	1	245	2			\N	2022-02-09 13:52:46	2022-02-09 13:52:46	'2000':6 'access':5 'aplic':3 'desarroll':1 'hentz':7 'whil':8
1304	737	ADMINISTRACION MODERNA DE HOTELES Y MOTELES	LATTIN, GERALD W.			02681,02682,02683,02684,02685,02686	1	1	1	60	2			\N	2022-02-10 13:40:03	2022-02-10 13:40:03	'administracion':1 'gerald':8 'hotel':4 'lattin':7 'modern':2 'motel':6 'w':9
35	35	ESPANOL 1	CARRUS TREVINO, LUZ AMELIA				1	1	1	51	2			\N	2021-10-04 16:40:29	2021-10-04 16:40:29	'1':2 'ameli':6 'carrus':3 'espanol':1 'luz':5 'trevin':4
36	36	ESPANOL 1	CARRASCO, ALMA				1	1	1	66	2			\N	2021-10-04 16:45:35	2021-10-04 16:45:35	'1':2 'alma':4 'carrasc':3 'espanol':1
978	2618	ACERCA DEL ARTE POPULAR	POMAR, MARIA TERESA				1	1	1	136	2			\N	2021-12-09 15:01:56	2021-12-09 15:01:56	'acerc':1 'arte':3 'mari':6 'pom':5 'popul':4 'teres':7
1080	1493	AGENCIAS DE VIAJES: OPERACION Y PLAN DE NEGOCIOS	ACERENZA, MIGUEL ANGEL			4590,4591,4592,4773,4774,4775,	1	1	1	60	2			\N	2022-01-15 00:43:15	2022-01-15 00:43:15	'acerenz':9 'agenci':1 'angel':11 'miguel':10 'negoci':8 'operacion':4 'plan':6 'viaj':3
1254	446	A COMMUNICATIVE COURSE IN ENGLISH STUDENT BOOK 4	WARSHAWSKY, DIANE WITH H. BYRD, DONALD R.			904,905	1	1	1	245	2			\N	2022-02-04 14:23:59	2022-02-04 14:23:59	'4':8 'book':7 'byrd':13 'communicativ':2 'cours':3 'dian':10 'donald':14 'english':5 'h':12 'in':4 'r':15 'student':6 'warshawsky':9 'with':11
1290	19	DBASE III PLUS HERRAMIENTAS PODEROSAS	KRUMM, ROB			00195	1	1	1	245	2			\N	2022-02-09 14:10:50	2022-02-09 14:10:50	'dbas':1 'herramient':4 'iii':2 'krumm':6 'plus':3 'poder':5 'rob':7
1305	312	CONTRATOS MERCANTILES	LEON TOVAR, SOYLA H.			03043,03044	1	1	1	64	2			\N	2022-02-10 13:46:47	2022-02-10 13:46:47	'contrat':1 'h':6 'leon':3 'mercantil':2 'soyl':5 'tov':4
37	37	ESPANOL 1	HERNANDEZ SANDOVAL , ADRIANA				1	1	1	52	2			\N	2021-10-04 16:48:30	2021-10-04 16:48:30	'1':2 'adrian':5 'espanol':1 'hernandez':3 'sandoval':4
979	1209	ACNÉ JUVENIL: PUNTO Y APARTE	SCHWARSTZBERG, JESSE SNOWFLAKE				1	1	1	240	2			\N	2021-12-09 15:12:45	2021-12-09 15:13:12	'acne':1 'apart':5 'jess':7 'juvenil':2 'punt':3 'schwarstzberg':6 'snowflak':8
1255	441	A COMMUNICATIVE COURSE IN ENGLISH WORKBOOK 1	ABRAMS, SHARON / P. REIN, DAVID / H. BYRD, DONALD			894,895	1	1	1	245	2			\N	2022-02-04 14:26:18	2022-02-04 14:26:18	'1':7 'abrams':8 'byrd':14 'communicativ':2 'cours':3 'dav':12 'donald':15 'english':5 'h':13 'in':4 'p':10 'rein':11 'sharon':9 'workbook':6
1291	12	ARQUITECTURA DE COMPUTADORAS	MORRIS MANO, M.			00197,00198	1	1	1	245	2			\N	2022-02-09 14:23:33	2022-02-09 14:23:33	'arquitectur':1 'comput':3 'm':6 'man':5 'morris':4
1306	1365	CODIGO DE COMERCIO LEYES Y REGLAMENTOS COMPLEMENTA	CODIGO DE COMERCIO LEYES Y REGLAMENTOS COMPLEMENTA			03803,03804,03805,03806,03807,04148	1	1	1	245	2			\N	2022-02-10 14:17:08	2022-02-10 14:17:08	'codig':1,8 'comerci':3,10 'complement':7,14 'ley':4,11 'reglament':6,13
38	38	ESPANOL 1	PASTOR, BLANCA				1	1	1	48	2			\N	2021-10-04 16:49:26	2021-10-04 16:49:26	'1':2 'blanc':4 'espanol':1 'pastor':3
39	39	ESPANOL 1: CUADERNO DE TRABAJO	RIVERA LOPEZ SARA				1	1	1	66	2			\N	2021-10-04 16:50:05	2021-10-04 16:50:05	'1':2 'cuadern':3 'espanol':1 'lopez':7 'river':6 'sar':8 'trabaj':5
980	2804	ACRÍLICO: EJERCICIOS PARRAMÓN	CANAL, MARIA FERNANDA				1	1	1	234	2			\N	2021-12-09 18:35:27	2021-12-09 18:35:27	'acril':1 'canal':4 'ejercici':2 'fernand':6 'mari':5 'parramon':3
1256	443	A COMMUNICATIVE COURSE IN ENGLISH WORKBOOK 2	ABRAMS, SHARON / P. REIN, DAVID / H. BYRD DONALD R			898,899	1	1	1	245	2			\N	2022-02-04 14:28:39	2022-02-04 14:28:39	'2':7 'abrams':8 'byrd':14 'communicativ':2 'cours':3 'dav':12 'donald':15 'english':5 'h':13 'in':4 'p':10 'r':16 'rein':11 'sharon':9 'workbook':6
1292	15	MICROSOFT INTERNET EXPLORER 5.0	STEPHEN L. NELSON			00199	1	1	1	245	2			\N	2022-02-09 14:26:43	2022-02-09 14:26:43	'5.0':4 'explor':3 'internet':2 'l':6 'microsoft':1 'nelson':7 'steph':5
1307	1366	LEYES Y CODIGOS DE MEXICO LEY DEL IMPUESTO SOBRE L	LEYES Y CODIGOS DE MEXICO LEY DEL IMPUESTO SOBRE L			03808,03809,03810,03811,03812	1	1	1	82	2			\N	2022-02-10 14:30:59	2022-02-10 14:31:36	'codig':3,13 'impuest':8,18 'l':10,20 'ley':1,6,11,16 'mexic':5,15
40	40	EL NUEVO UNIVERSO DE LAS LETRAS 1	CHAVEZ GONZALEZ PEDRO TEOBALDO				1	1	1	65	2			\N	2021-10-04 16:50:54	2021-10-04 16:50:54	'1':7 'chavez':8 'gonzalez':9 'letr':6 'nuev':2 'pedr':10 'teobald':11 'univers':3
981	2803	ACUARELA: 101 TECNICAS	CANAL, MARIA FERNANDA				1	1	1	234	2			\N	2021-12-09 18:44:19	2021-12-09 18:44:19	'101':2 'acuarel':1 'canal':4 'fernand':6 'mari':5 'tecnic':3
1257	444	A COMMUNICATIVE COURSE IN ENGLISH WORKBOOK 3	P. REIN, DAVID Y H. BYRD, DONALD R.			900,901	1	1	1	245	2			\N	2022-02-04 15:24:34	2022-02-08 14:11:20	'3':7 'byrd':13 'communicativ':2 'cours':3 'dav':10 'donald':14 'english':5 'h':12 'in':4 'p':8 'r':15 'rein':9 'workbook':6
1308	1737	LEY 2013 ISR E IETU	LEY 2013 ISR E IETU			05229,05230	1	1	1	245	2			\N	2022-02-10 14:37:35	2022-02-10 14:37:35	'2013':2,7 'ietu':5,10 'isr':3,8 'ley':1,6
41	41	PALABRAS SIN FRONTERA 1	RIVERO REYNA,FRANCISCO				1	1	1	65	2			\N	2021-10-04 16:51:46	2021-10-04 16:51:46	'1':4 'francisc':7 'fronter':3 'palabr':1 'reyn':6 'river':5
982	2108	ADDH. NIÑOS CON DEFICIT DE ATENCIÓN E HIPERACTIVIDAD: ¿UNA PATOLOGÍA DE MERCADO?	BENASAYAG, LEON				1	1	1	165	2			\N	2021-12-09 18:54:17	2021-12-09 18:54:17	'addh':1 'atencion':6 'benasayag':13 'deficit':4 'hiperact':8 'leon':14 'merc':12 'niñ':2 'patolog':10
1309	1733	REDES LOCALES	RAYAS, JOSE LUIS			05225	1	1	1	213	2			\N	2022-02-10 15:12:42	2022-02-10 15:12:42	'jos':4 'local':2 'luis':5 'ray':3 'red':1
42	42	ESPANOL 1 : NUEVOS HORIZONTES	ARCINIEGA RANGEL, MA. ESTELA				1	1	1	65	2			\N	2021-10-04 16:52:14	2021-10-04 16:52:14	'1':2 'arcinieg':5 'espanol':1 'estel':8 'horizont':4 'ma':7 'nuev':3 'rangel':6
43	43	ESPANOL 1	LOZANO,  LUCERO				1	1	1	62	2			\N	2021-10-04 16:53:13	2021-10-04 16:53:13	'1':2 'espanol':1 'lozan':3 'lucer':4
186	201	IMAGEN COOL	GORDOA,  ALVARO				1	1	1	84	2			\N	2021-10-05 16:53:09	2021-10-05 16:53:26	'alvar':4 'cool':2 'gordo':3 'imag':1
983	2405	ADMINISTRACION	STONERSTONER, JAMES A. F., JAMES A. F.				1	1	1	75	2			\N	2021-12-09 19:09:52	2021-12-09 19:09:52	'administracion':1 'f':5,8 'jam':3,6 'stonerston':2
44	44	ESPANOL 1: VERSION PRELIMINAR	VITAL, ALBERTO				1	1	1	62	2			\N	2021-10-04 16:54:29	2021-10-04 16:54:29	'1':2 'albert':6 'espanol':1 'prelimin':4 'version':3 'vital':5
45	45	ESPANOL 1	VALLE GUERRERO,  ESTELA DEL				1	1	1	66	2			\N	2021-10-04 16:57:37	2021-10-04 16:57:37	'1':2 'espanol':1 'estel':5 'guerrer':4 'vall':3
984	2390	ADMINISTRACIÓN DE RECURSOS HUMANOS: ENFOQUE LATINOAMERICANO	DESSLER, GARY				1	1	1	55	2			\N	2021-12-09 19:12:56	2021-12-09 19:12:56	'administr':1 'dessl':7 'enfoqu':5 'gary':8 'human':4 'latinoamerican':6 'recurs':3
215	229	SOCIOLOGIA	.				1	1	1	61	2			\N	2021-10-05 17:42:26	2021-10-05 17:42:26	'sociologi':1
985	2404	ADMINISTRACIÓN: ESCUELAS, PROCESO ADMINISTRATIVO, ÁREAS FUNCIONALES Y DESARROLLO EMPRENDEDOR	MUNCH, LOURDES				1	1	1	75	2			\N	2021-12-09 20:02:07	2021-12-09 20:02:07	'administr':1,4 'are':5 'desarroll':8 'emprendedor':9 'escuel':2 'funcional':6 'lourd':11 'munch':10 'proces':3
205	220	SOCIOLOGIA 2	AMEZCUA CARDIEL,HECTOR				1	1	1	49	2			\N	2021-10-05 17:21:50	2021-10-05 17:21:50	'2':2 'amezcu':3 'cardiel':4 'hector':5 'sociologi':1
986	899	ADOLESCENCIA ENTRE MUROS: ESCUELA SECUNDARIA Y LA CONSTRUCCIÓN DE IDENTIDADES JUVENILES	REYES JUAREZ, ALEJANDRO				1	1	1	113	2			\N	2021-12-09 20:09:12	2021-12-09 20:09:12	'adolescent':1 'alejandr':14 'construccion':8 'escuel':4 'ident':10 'juarez':13 'juvenil':11 'mur':3 'rey':12 'secundari':5
987	2135	ADOLESCENCIA, TUTORIAS Y ESCUELA: TRABAJO PARTICIPATIVO Y PROMOCIÓN DE LA SALUD	JUNGMAN, EVA				1	1	1	165	2			\N	2021-12-09 20:20:16	2021-12-09 20:20:16	'adolescent':1 'escuel':4 'eva':13 'jungm':12 'particip':6 'promocion':8 'salud':11 'trabaj':5 'tutori':2
46	46	ESPANOL 1: PRIMER GRADO	PRAXEDIS MONTES, NIEVES				1	1	1	67	2			\N	2021-10-04 16:58:39	2021-10-04 16:58:39	'1':2 'espanol':1 'grad':4 'mont':6 'niev':7 'praxedis':5 'prim':3
47	47	ESPANOL 1	GARCIA CARDENAS, LIDIA				1	1	1	67	2			\N	2021-10-04 17:03:16	2021-10-04 17:03:16	'1':2 'carden':4 'espanol':1 'garci':3 'lidi':5
853	806	ADOLESCENTES 50 CASOS PROBLEMÁTICOS: ANÁLISIS PSICOLÓGICO Y PROPUESTAS EDUCATIVAS	NUEVO GONZALEZ, ELISEO				1	1	1	192	2			\N	2021-10-18 19:27:29	2021-12-09 20:37:30	'50':2 'adolescent':1 'analisis':5 'cas':3 'educ':9 'elise':12 'gonzalez':11 'nuev':10 'problemat':4 'propuest':8 'psicolog':6
826	780	ADOLESCENTES, MALOS ROLLOS, COMPLEJOS Y COMEDURAS DE LOCO	MARCELLI, DANIEL				2	1	1	182	2			\N	2021-10-18 18:36:10	2021-12-09 20:51:25	'adolescent':1 'comedur':6 'complej':4 'daniel':10 'loc':8 'mal':2 'marcelli':9 'roll':3
988	2695	ADOLFO BARNATAN	SIN AUTOR				1	1	1	108	2			\N	2021-12-09 20:56:46	2021-12-09 20:56:46	'adolf':1 'autor':4 'barnat':2
112	113	COMUNICATE EN ESPANOL 3	DIAZ DE LEON, SANDRA				1	1	1	65	2			\N	2021-10-05 13:21:47	2021-10-05 13:21:47	'3':4 'comunicat':1 'diaz':5 'espanol':3 'leon':7 'sandr':8
990	2541	ADVERTENCIAS AMORALES AL LECTOR Y CIERTO TIPO DE CUENTOS SUMAMENTE INOCENTES	LILLE FUENTES, MARIO DE				1	1	1	242	2			\N	2021-12-10 13:34:28	2021-12-10 13:37:32	'advertent':1 'amoral':2 'ciert':6 'cuent':9 'fuent':13 'inocent':11 'lector':4 'lill':12 'mari':14 'sum':10 'tip':7
101	100	REDACCION Y ORTOGRAFIA 1 ; CUADERNO DE TRABAJO	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 12:53:19	2021-10-05 13:19:01	'1':4 'cuadern':5 'lozan':8 'lucer':9 'ortografi':3 'redaccion':1 'trabaj':7
991	1327	AGUA QUEMADA: CUARTETO	FUENTES, CARLOS				1	1	1	5	2			\N	2021-12-10 13:48:04	2021-12-10 13:48:04	'agu':1 'carl':5 'cuartet':3 'fuent':4 'quem':2
48	48	ESPANOL 2:CUADERNO DE TRABAJO	FERNANDEZ FUENTES, MARIA ISABEL				1	1	1	66	2			\N	2021-10-04 17:05:22	2021-10-04 17:05:22	'2':2 'cuadern':3 'espanol':1 'fernandez':6 'fuent':7 'isabel':9 'mari':8 'trabaj':5
49	49	ESPANOL : CODIGO 1	OCHOA, DE TERESA ADRIANA				1	1	1	50	2			\N	2021-10-04 17:07:16	2021-10-04 17:07:16	'1':3 'adrian':7 'codig':2 'espanol':1 'ocho':4 'teres':6
267	280	BIOLOGIA 2:UN ENFOQUE CONSTRUCTIVISTA	GAMA FUERTES,MARIA DE LOS ANGELES				1	1	1	75	2			\N	2021-10-06 12:32:22	2021-10-06 12:32:32	'2':2 'angel':11 'biologi':1 'constructiv':5 'enfoqu':4 'fuert':7 'gam':6 'mari':8
268	281	EDUCACION PARA LA SALUD	SALAS CUEVAS,CONSUELO B.				1	1	1	75	2			\N	2021-10-06 12:33:07	2021-10-06 12:33:07	'b':8 'consuel':7 'cuev':6 'educacion':1 'sal':5 'salud':4
269	282	QUIMICA I:UN ENFOQUE CONSTRUCTIVISTA	SIN AUTOR				1	1	1	75	2			\N	2021-10-06 12:34:13	2021-10-06 14:00:54	'autor':7 'constructiv':5 'enfoqu':4 'i':2 'quimic':1
345	337	DICCIONARIO ESCOLAR DE LA LENGUA ESPANOLA	SIN AUTOR				1	1	1	48	2			\N	2021-10-06 17:13:56	2021-10-06 17:13:56	'autor':8 'diccionari':1 'escol':2 'espanol':6 'lengu':5
992	2631	AH, LAS HISTORIAS CONOCIDAS	SOLIS CALVILLO, ANTONIO				1	1	1	136	2			\N	2021-12-10 13:52:28	2021-12-10 13:52:28	'ah':1 'antoni':7 'calvill':6 'conoc':4 'histori':3 'solis':5
993	2214	AHI VIENE LA PLAGA: VIRUS EMERGENTES, EPIDEMIAS Y PANDEMIAS	LOZANO, MARIO E.				1	1	1	40	2			\N	2021-12-10 14:03:03	2021-12-10 14:03:03	'ahi':1 'emergent':6 'epidemi':7 'lozan':10 'mari':11 'pandemi':9 'plag':4 'vien':2 'virus':5
994	2684	ALAS DE PAPEL: OBRA COMPARTIDA CON OCTAVIO PAZ Y OTROS	ROJO, VICENTE				1	1	1	243	2			\N	2021-12-10 14:06:40	2021-12-10 14:07:11	'alas':1 'compart':5 'obra':4 'octavi':7 'papel':3 'paz':8 'roj':11 'vicent':12
995	2614	AJK´ ECH BUCH: EL PESCADOR	SANCHEZ CHABLE, TORIBIO				1	1	1	136	2			\N	2021-12-10 14:09:37	2021-12-10 14:09:37	'ajk':1 'buch':3 'chabl':7 'ech':2 'pescador':5 'sanchez':6 'toribi':8
996	1433	ALBERT EINSTEIN: CARTAS PROBABLES	CHIRINOS, JUAN CARLOS				1	1	1	56	2			\N	2021-12-10 14:13:48	2021-12-10 14:13:48	'albert':1 'carl':7 'cart':3 'chirin':5 'einstein':2 'juan':6 'probabl':4
50	50	ESPANOL 1: CUADERNO DE EJERCICIOS	HERRERA , OMMAR				1	1	1	65	2			\N	2021-10-04 17:15:24	2021-10-04 17:15:24	'1':2 'cuadern':3 'ejercici':5 'espanol':1 'herrer':6 'ommar':7
997	1434	ALEJANDRO MAGNO: EL VIVO ANHELO DE CONOCER	CHIRINOS, JUAN CARLOS				1	1	1	56	2			\N	2021-12-10 14:26:44	2021-12-10 14:26:44	'alejandr':1 'anhel':5 'carl':10 'chirin':8 'conoc':7 'juan':9 'magn':2 'viv':4
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
793	748	ADOLESCENTES EN CONFLICTO: COMO RECUPERAR LA ARMONIA PERDIDA	MOLINERO, CARLOS				1	1	1	169	2			\N	2021-10-18 12:44:39	2021-12-09 20:50:17	'adolescent':1 'armoni':7 'carl':10 'conflict':3 'moliner':9 'perd':8 'recuper':5
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
807	761	EL LENGUAJE DEL PODER PERSONAL: RECUPERA EL CONTRO	MOORMAN, CHICK				1	1	1	149	2			\N	2021-10-18 13:28:43	2021-10-18 13:28:43	'chick':10 'contr':8 'lenguaj':2 'moorm':9 'personal':5 'pod':4 'recuper':6
808	762	¿QUE ES EL PODER JUDICIAL DE LA FEDERACION?	SUPREMA CORTE DE JUSTICIA DE LA NACION				1	1	1	148	2			\N	2021-10-18 13:29:25	2021-10-18 13:29:25	'cort':10 'federacion':8 'judicial':5 'justici':12 'nacion':15 'pod':4 'suprem':9
809	763	QUE ES LA INFLACION	VOSTRILLOV, P				1	1	1	178	2			\N	2021-10-18 13:30:49	2021-10-18 13:31:09	'inflacion':4 'p':6 'vostrillov':5
813	767	GUIA DE LOS BUENOS MODALES	TRADD, VERONICA				1	1	1	133	2			\N	2021-10-18 13:38:38	2021-10-18 13:38:38	'buen':4 'gui':1 'modal':5 'tradd':6 'veron':7
814	768	NO MAS OSOS, MEJOR CONTROLA A TUS PAPAS: UNA GUIA	SIN AUTOR				1	1	1	32	2			\N	2021-10-18 18:26:40	2021-10-18 18:26:40	'autor':12 'control':5 'gui':10 'mas':2 'mejor':4 'osos':3 'pap':8
815	769	EXPLOTA TUS EMOCIONES PARA AVANZAR EN LA VIDA SOLT	BAROCIO, ROSA				1	1	1	60	2			\N	2021-10-18 18:27:11	2021-10-18 18:27:11	'avanz':5 'baroci':10 'emocion':3 'explot':1 'ros':11 'solt':9 'vid':8
817	771	COMO ENTENDER A LOS CHICOS Y CONQUISTAR SU CORAZON	ALEMANY, CRISTINA				1	1	1	164	2			\N	2021-10-18 18:28:25	2021-10-18 18:28:25	'alemany':10 'chic':5 'conquist':7 'corazon':9 'cristin':11 'entend':2
818	772	GRACIAS	WYBRANIETZ, KRISTIANE				1	1	1	164	2			\N	2021-10-18 18:28:55	2021-10-18 18:28:55	'graci':1 'kristian':3 'wybranietz':2
819	773	TE FELICITO POR TU PROYECTO	RIBA, LIDIA MARIA				1	1	1	164	2			\N	2021-10-18 18:29:43	2021-10-18 18:29:43	'felicit':2 'lidi':7 'mari':8 'proyect':5 'rib':6
824	778	PNL PARA FORMADORES: MANUAL PARA DIRECTIVOS, FORMA	O´CONNOR, JOSEPH				1	1	1	181	2			\N	2021-10-18 18:33:50	2021-10-18 18:34:37	'connor':9 'direct':6 'form':7 'formador':3 'joseph':10 'manual':4 'pnl':1
825	779	EL PODER DE LOS HABITOS: PORQUE HACEMOS LO QUE HAC	DUHIGG, CHARLES				1	1	1	181	2			\N	2021-10-18 18:35:18	2021-10-18 18:35:18	'charl':12 'duhigg':11 'habit':5 'hac':7,10 'pod':2
827	781	EUROPA AL BORDE DEL ABISMO: ECONOMISTAS ATERRADOS	SIN AUTOR				1	1	1	183	2			\N	2021-10-18 18:37:18	2021-10-18 18:38:13	'abism':5 'aterr':7 'autor':9 'bord':3 'econom':6 'europ':1
828	782	365 DIAS PARA ACERCARCE A DIOS	AGUILAR VALDES, JOSE DE JESUS				1	1	1	68	2			\N	2021-10-18 18:39:00	2021-10-18 18:39:00	'365':1 'acercarc':4 'aguil':7 'dias':2 'dios':6 'jesus':11 'jos':9 'vald':8
829	783	OPTIMIZA TU MENTE: EL PROGRAMA VISUAL COMPLETO	BUZAN, TONY				1	1	1	118	2			\N	2021-10-18 18:39:43	2021-10-18 18:40:10	'buz':8 'complet':7 'ment':3 'optimiz':1 'program':5 'tony':9 'visual':6
830	784	EL DESARROLLO DEL CAPITALISMO EN AMERICA LATINA: E	CUEVA, AGUSTIN				1	1	1	40	2			\N	2021-10-18 18:42:28	2021-10-18 18:42:28	'agustin':10 'amer':6 'capital':4 'cuev':9 'desarroll':2 'latin':7
831	785	CONSUMIDORES Y CIUDADANOS: CONFLICTOS MULTICULTURA	GARCIA CANCLINI, NESTOR				1	1	1	15	2			\N	2021-10-18 18:42:56	2021-10-18 18:42:56	'canclini':7 'ciudadan':3 'conflict':4 'consumidor':1 'garci':6 'multicultur':5 'nestor':8
816	770	¿DE QUE TE RIES? LAS CARICATURAS Y SU RELACIÓN CON EL INCONCIENTE	JUAREZ SALAZAR, ANGELICA				1	1	1	60	2			\N	2021-10-18 18:27:54	2021-11-30 14:33:57	'angel':15 'caricatur':6 'inconcient':12 'juarez':13 'relacion':9 'ries':4 'salaz':14
832	786	LAS 5 HERIDAS QUE INPIDEN SER UNO MISMO: RECHAZO,	BOURBEAN, LISE				1	1	1	185	2			\N	2021-10-18 18:43:36	2021-10-18 18:43:58	'5':2 'bourb':10 'her':3 'inpid':5 'lis':11 'mism':8 'rechaz':9 'ser':6
833	787	¿PARA QUE SIRVE UNA PREPOSICION?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:44:57	2021-10-18 18:45:13	'dehes':6 'ines':8 'juan':7 'preposicion':5 'sirv':3
834	788	¿PARA QUE SIRVE UN ARTICULO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:46:06	2021-10-18 18:46:06	'articul':5 'dehes':6 'ines':8 'juan':7 'sirv':3
835	789	¿PARA QUE SIRVE UN VERBO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:46:58	2021-10-18 18:46:58	'dehes':6 'ines':8 'juan':7 'sirv':3 'verb':5
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
836	790	¿PARA QUE SIRVE UN ADVERBIO?	DEHESA, JUANA INES				1	1	1	186	2			\N	2021-10-18 18:47:45	2021-11-30 14:35:17	'adverbi':5 'dehes':6 'ines':8 'juan':7 'sirv':3
867	820	ENCICLOPEDIA DE LA PSICOLOGIA	GISPERT, CARLOS				1	1	1	97	2			\N	2021-10-18 19:39:47	2021-10-18 19:39:47	'carl':6 'enciclopedi':1 'gispert':5 'psicologi':4
868	821	LA FELICIDAD ¡AHORA!	MATTHEWS, ANDREW				1	1	1	193	2			\N	2021-10-18 19:40:38	2021-10-18 19:40:55	'ahor':3 'andrew':5 'felic':2 'matthews':4
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
-- TOC entry 2772 (class 0 OID 40728)
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
37	2022_01_06_183850_update_biblos_5_tables	5
\.


--
-- TOC entry 2796 (class 0 OID 44051)
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
-- TOC entry 2797 (class 0 OID 44063)
-- Dependencies: 222
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 43997)
-- Dependencies: 214
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 44131)
-- Dependencies: 229
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (id, role_id, permission_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 44111)
-- Dependencies: 227
-- Data for Name: permission_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_user (id, user_id, permission_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N
2	2	11	\N	\N	\N
\.


--
-- TOC entry 2793 (class 0 OID 44020)
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
-- TOC entry 2817 (class 0 OID 44349)
-- Dependencies: 242
-- Data for Name: portadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portadas (id, root, filename, filename_png, filename_thumb, pie_de_foto, status_portada, empresa_id, creado_por_id, ip, host, deleted_at, created_at, updated_at) FROM stdin;
1		7a6fc68444d8884585256e8c5e36f3a1721145ec-627-1.jpg	1	_thumb_7a6fc68444d8884585256e8c5e36f3a1721145ec-627-1.png		1	1	2			\N	2021-10-26 12:55:44	2021-10-26 12:55:44
44		ba1a67d798f38cd48b657723470c13af76502f1b-936-44.jpg	1	_thumb_ba1a67d798f38cd48b657723470c13af76502f1b-936-44.png		1	1	2			\N	2021-11-08 15:36:46	2021-11-08 15:36:46
45		b9f697f74af1a270ce99540e2a55ab3bf31cd077-937-45.jpg	1	_thumb_b9f697f74af1a270ce99540e2a55ab3bf31cd077-937-45.png		1	1	2			\N	2021-11-17 13:26:34	2021-11-17 13:26:34
46		dd92cc3afe59b2cc8f2e67edcbd428147f734d2a-938-46.jpg	1	_thumb_dd92cc3afe59b2cc8f2e67edcbd428147f734d2a-938-46.png		1	1	2			\N	2021-11-25 14:17:46	2021-11-25 14:17:47
11		456849ced7c13a783890c7d68602e936657cb69a-517-11.jpg	1	_thumb_456849ced7c13a783890c7d68602e936657cb69a-517-11.png		1	1	2			\N	2021-10-26 13:13:39	2021-10-26 13:13:39
13		1e34ce2588ad6117dee9b6b4b05aed9ad3f53b4f-398-13.jpg	1	_thumb_1e34ce2588ad6117dee9b6b4b05aed9ad3f53b4f-398-13.png		1	1	2			\N	2021-10-26 18:29:17	2021-10-26 18:29:17
47		e6fd11a46619352eaa020db59ced2809b44e53df-938-47.jpg	1	_thumb_e6fd11a46619352eaa020db59ced2809b44e53df-938-47.png		1	1	2			\N	2021-11-25 18:36:27	2021-11-25 18:36:27
49		fc3df35c69b46e1f994c7de505f6fefdf366db78-938-49.jpg	1	_thumb_fc3df35c69b46e1f994c7de505f6fefdf366db78-938-49.png		1	1	2			\N	2021-11-25 19:55:26	2021-11-25 19:55:26
50		728fd877fd75372baef046826a448131b773783f-938-50.jpg	1	_thumb_728fd877fd75372baef046826a448131b773783f-938-50.png		1	1	2			\N	2021-11-25 20:11:21	2021-11-25 20:11:21
51		3690b522cadd901ad504fbe12fb721fdd5356e6d-938-51.jpg	1	_thumb_3690b522cadd901ad504fbe12fb721fdd5356e6d-938-51.png		1	1	2			\N	2021-11-25 20:16:53	2021-11-25 20:16:53
52		16ab2bbe016b7127fd2a5bd9e40f538ac0b50eb3-938-52.jpg	1	_thumb_16ab2bbe016b7127fd2a5bd9e40f538ac0b50eb3-938-52.png		1	1	2			\N	2021-11-25 20:20:20	2021-11-25 20:20:20
53		56818c0a6d8dc563c89f0fe60b2b01dc8273358f-938-53.jpg	1	_thumb_56818c0a6d8dc563c89f0fe60b2b01dc8273358f-938-53.png		1	1	2			\N	2021-11-25 20:24:23	2021-11-25 20:24:23
34		d0e99bf09fb6a245f01b8f87aa7cda55f9c37668-211-34.jpg	1	_thumb_d0e99bf09fb6a245f01b8f87aa7cda55f9c37668-211-34.png		1	1	1			\N	2021-10-30 16:35:21	2021-10-30 16:35:21
35		6e01fdb54fa758685ee7eca87d798b8dcb56aaba-211-35.jpg	1	_thumb_6e01fdb54fa758685ee7eca87d798b8dcb56aaba-211-35.png		1	1	1			\N	2021-10-30 16:35:34	2021-10-30 16:35:34
36		e96f4df4e1756b9b57399b27f41ba9731c13969b-211-36.jpg	1	_thumb_e96f4df4e1756b9b57399b27f41ba9731c13969b-211-36.png		1	1	1			\N	2021-10-30 16:35:49	2021-10-30 16:35:49
37		ecea19344a9785c1006b28469264fe0801c81ac5-211-37.jpg	1	_thumb_ecea19344a9785c1006b28469264fe0801c81ac5-211-37.png		1	1	1			\N	2021-10-30 16:35:57	2021-10-30 16:35:57
39		4c514b1bbcd5bf56fe54b0003c1e6915ebe33009-933-39.jpg	1	_thumb_4c514b1bbcd5bf56fe54b0003c1e6915ebe33009-933-39.png		1	1	2			\N	2021-11-08 14:21:31	2021-11-08 14:21:31
41		2c1822b647789842aba86f7b1f8add9c093f12a4-934-41.png	1	_thumb_2c1822b647789842aba86f7b1f8add9c093f12a4-934-41.png		1	1	2			\N	2021-11-08 14:27:24	2021-11-08 14:27:24
42		5d50b6dd3f048b49a9b34d57c94901a100a5271f-935-42.png	1	_thumb_5d50b6dd3f048b49a9b34d57c94901a100a5271f-935-42.png		1	1	2			\N	2021-11-08 14:42:14	2021-11-08 14:42:14
43		f4c4935626e12f967cc9ecf06e21701b1f91a3e9-246-43.jpg	1	_thumb_f4c4935626e12f967cc9ecf06e21701b1f91a3e9-246-43.png		1	1	2			\N	2021-11-08 15:26:23	2021-11-08 15:26:23
54		bb629143b35dc90b5a0f9e4360e89645f3010f85-804-54.jpg	1	_thumb_bb629143b35dc90b5a0f9e4360e89645f3010f85-804-54.png		1	1	2			\N	2021-11-30 13:58:10	2021-11-30 13:58:10
55		2bdd24d5a7d98ef4db6fd58f82e895ad87e81ce7-816-55.jpg	1	_thumb_2bdd24d5a7d98ef4db6fd58f82e895ad87e81ce7-816-55.png		1	1	2			\N	2021-11-30 14:05:27	2021-11-30 14:05:27
56		574a0c05fa0e828c6efd00a7ab926577ba181791-869-56.jpg	1	_thumb_574a0c05fa0e828c6efd00a7ab926577ba181791-869-56.png		1	1	2			\N	2021-11-30 14:14:16	2021-11-30 14:14:16
57		7bc692a6dbcab7c574869d3bae5e4689c6557d48-837-57.jpg	1	_thumb_7bc692a6dbcab7c574869d3bae5e4689c6557d48-837-57.png		1	1	2			\N	2021-11-30 14:23:44	2021-11-30 14:23:44
58		5bd44deb3c398688c3f2cb6ec9883c54866688ce-834-58.jpg	1	_thumb_5bd44deb3c398688c3f2cb6ec9883c54866688ce-834-58.png		1	1	2			\N	2021-11-30 14:26:23	2021-11-30 14:26:23
59		ed3ab2e528605eb4c04836cac8a91534a6b20064-838-59.jpg	1	_thumb_ed3ab2e528605eb4c04836cac8a91534a6b20064-838-59.png		1	1	2			\N	2021-11-30 14:29:07	2021-11-30 14:29:07
60		4d47c2b59a6742ee8818fc1bd283495908879ec1-835-60.jpg	1	_thumb_4d47c2b59a6742ee8818fc1bd283495908879ec1-835-60.png		1	1	2			\N	2021-11-30 14:40:43	2021-11-30 14:40:43
61		93b6325631ac31f894d03817faf2f1fa7e52fa93-833-61.jpg	1	_thumb_93b6325631ac31f894d03817faf2f1fa7e52fa93-833-61.png		1	1	2			\N	2021-11-30 14:43:22	2021-11-30 14:43:22
62		c9f61476924e60354b7ecd52c369752413577510-836-62.jpg	1	_thumb_c9f61476924e60354b7ecd52c369752413577510-836-62.png		1	1	2			\N	2021-11-30 14:47:49	2021-11-30 14:47:49
63		3d44ccc3e3e5af10a616d8da79c979bf806c8f5b-939-63.jpg	1	_thumb_3d44ccc3e3e5af10a616d8da79c979bf806c8f5b-939-63.png		1	1	2			\N	2021-11-30 14:56:30	2021-11-30 14:56:30
64		20b5bcdca42d72f6a02b3f000bd4afbe3858f785-528-64.jpg	1	_thumb_20b5bcdca42d72f6a02b3f000bd4afbe3858f785-528-64.png		1	1	2			\N	2021-11-30 15:03:46	2021-11-30 15:03:46
65		eeff92be4de64f7e30718c8d7422e94f5c358918-757-65.jpg	1	_thumb_eeff92be4de64f7e30718c8d7422e94f5c358918-757-65.png		1	1	2			\N	2021-11-30 15:06:39	2021-11-30 15:06:39
66		f7030072543dae9d036061121efa87472cf89c3d-808-66.jpg	1	_thumb_f7030072543dae9d036061121efa87472cf89c3d-808-66.png		1	1	2			\N	2021-11-30 15:09:06	2021-11-30 15:09:06
67		db70e2416515448dd7c97d90c25573f91c897070-940-67.jpg	1	_thumb_db70e2416515448dd7c97d90c25573f91c897070-940-67.png		1	1	2			\N	2021-11-30 19:11:25	2021-11-30 19:11:25
68		c3d1aa4ecfdf96b6db9ad322d73796b87f85e06f-941-68.jpg	1	_thumb_c3d1aa4ecfdf96b6db9ad322d73796b87f85e06f-941-68.png		1	1	2			\N	2021-11-30 19:17:35	2021-11-30 19:17:35
69		b3fd3ca4853d4f645a66791e19cc1aa0e24ad7c0-942-69.jpg	1	_thumb_b3fd3ca4853d4f645a66791e19cc1aa0e24ad7c0-942-69.png		1	1	2			\N	2021-11-30 19:36:17	2021-11-30 19:36:17
70		55a9db6261372b8fe6c118d915e4904c15ec72c2-943-70.jpg	1	_thumb_55a9db6261372b8fe6c118d915e4904c15ec72c2-943-70.png		1	1	2			\N	2021-11-30 19:41:54	2021-11-30 19:41:54
71		ecd622678d20a30bf36d8eb3ada8168f54927cd4-944-71.jpg	1	_thumb_ecd622678d20a30bf36d8eb3ada8168f54927cd4-944-71.png		1	1	2			\N	2021-11-30 20:26:36	2021-11-30 20:26:36
73		a87cd1ab9aa240e18e0bd91066c13fbc523eb8c5-945-73.jpg	1	_thumb_a87cd1ab9aa240e18e0bd91066c13fbc523eb8c5-945-73.png		1	1	2			\N	2021-11-30 20:30:02	2021-11-30 20:30:02
74		690eba397f093aea395ba7b04c5c493582dee90c-946-74.jpg	1	_thumb_690eba397f093aea395ba7b04c5c493582dee90c-946-74.png		1	1	2			\N	2021-11-30 20:33:44	2021-11-30 20:33:44
75		c5437f6d58f141429571315a3f9cfc896685e9b0-947-75.jpg	1	_thumb_c5437f6d58f141429571315a3f9cfc896685e9b0-947-75.png		1	1	2			\N	2021-11-30 20:37:09	2021-11-30 20:37:09
76		a0e7668164ca80b2e69fe97a4165b76df864793b-948-76.jpg	1	_thumb_a0e7668164ca80b2e69fe97a4165b76df864793b-948-76.png		1	1	2			\N	2021-11-30 20:55:14	2021-11-30 20:55:14
77		2329fed23aff212be0adb1cad591a13f70ea07a9-949-77.jpg	1	_thumb_2329fed23aff212be0adb1cad591a13f70ea07a9-949-77.png		1	1	2			\N	2021-12-01 13:50:59	2021-12-01 13:50:59
78		9a41957290a7ce91a8ba6424d7779118771eaad3-950-78.jpg	1	_thumb_9a41957290a7ce91a8ba6424d7779118771eaad3-950-78.png		1	1	2			\N	2021-12-01 14:50:37	2021-12-01 14:50:37
79		b9969a36c5414e441c926d4d0e67d12510678c2e-951-79.jpg	1	_thumb_b9969a36c5414e441c926d4d0e67d12510678c2e-951-79.png		1	1	2			\N	2021-12-01 19:48:36	2021-12-01 19:48:36
80		f2ae79a5a9c1ed2666d36df5fc95f4173dd4b253-447-80.jpg	1	_thumb_f2ae79a5a9c1ed2666d36df5fc95f4173dd4b253-447-80.png		1	1	2			\N	2021-12-01 19:54:52	2021-12-01 19:54:52
102		373d68e963c2f45108277bf1726e2dc6e1bbeedd-544-102.jpg	1	_thumb_373d68e963c2f45108277bf1726e2dc6e1bbeedd-544-102.png		1	1	2			\N	2021-12-09 14:19:15	2021-12-09 14:19:15
82		eb99e7fe47029d931c08c9f00451507d0c8ac49e-953-82.jpg	1	_thumb_eb99e7fe47029d931c08c9f00451507d0c8ac49e-953-82.png		1	1	2			\N	2021-12-01 20:19:29	2021-12-01 20:19:29
83		c54fa937b6ff77a3e27cb4c7a50727bbaba7abef-954-83.jpg	1	_thumb_c54fa937b6ff77a3e27cb4c7a50727bbaba7abef-954-83.png		1	1	2			\N	2021-12-01 20:28:49	2021-12-01 20:28:49
84		9805bfbf80f7fac12bfa8be2b2fdd538c8a48cfa-955-84.jpg	1	_thumb_9805bfbf80f7fac12bfa8be2b2fdd538c8a48cfa-955-84.png		1	1	2			\N	2021-12-02 13:17:05	2021-12-02 13:17:05
85		2193bcf3ff514e397daf1985fdb1bbf46a787d82-956-85.jpg	1	_thumb_2193bcf3ff514e397daf1985fdb1bbf46a787d82-956-85.png		1	1	2			\N	2021-12-02 13:23:03	2021-12-02 13:23:03
86		72307742a631fb7da19db7533ed8a1c075728db3-958-86.jpg	1	_thumb_72307742a631fb7da19db7533ed8a1c075728db3-958-86.png		1	1	2			\N	2021-12-02 13:34:48	2021-12-02 13:34:48
87		ec14b363e88cd6420885faa13cf7c90e4f1176bb-959-87.jpg	1	_thumb_ec14b363e88cd6420885faa13cf7c90e4f1176bb-959-87.png		1	1	2			\N	2021-12-02 13:43:30	2021-12-02 13:43:30
88		c3534344166cf2e168396b7ef70562c6efcc02ef-960-88.jpg	1	_thumb_c3534344166cf2e168396b7ef70562c6efcc02ef-960-88.png		1	1	2			\N	2021-12-02 13:51:42	2021-12-02 13:51:42
89		7f64106854149aacc0fd840438275cc272e9441c-961-89.jpg	1	_thumb_7f64106854149aacc0fd840438275cc272e9441c-961-89.png		1	1	2			\N	2021-12-02 14:04:23	2021-12-02 14:04:23
90		bc839c54b01464eee7bfddfeaaf627df34992252-806-90.jpg	1	_thumb_bc839c54b01464eee7bfddfeaaf627df34992252-806-90.png		1	1	2			\N	2021-12-06 14:02:30	2021-12-06 14:02:31
91		6f65e2168c69b84cad39ff4387f2b7a4c4ef5a7d-883-91.jpg	1	_thumb_6f65e2168c69b84cad39ff4387f2b7a4c4ef5a7d-883-91.png		1	1	2			\N	2021-12-07 13:36:56	2021-12-07 13:36:57
92		33bb76bd44971b0b85f58e36c0d31831e93c8726-962-92.jpg	1	_thumb_33bb76bd44971b0b85f58e36c0d31831e93c8726-962-92.png		1	1	2			\N	2021-12-07 14:17:06	2021-12-07 14:17:06
93		0471bacc170a73b23e1ae37f3c99d5fa1e05e4a2-963-93.jpg	1	_thumb_0471bacc170a73b23e1ae37f3c99d5fa1e05e4a2-963-93.png		1	1	2			\N	2021-12-07 18:52:24	2021-12-07 18:52:24
94		762ea5566aba67015eca4157f270815ea4c5cb58-828-94.jpg	1	_thumb_762ea5566aba67015eca4157f270815ea4c5cb58-828-94.png		1	1	2			\N	2021-12-07 20:05:48	2021-12-07 20:05:48
95		ef098a7954f4fb65f530dbef701d5345fb9d607e-964-95.jpg	1	_thumb_ef098a7954f4fb65f530dbef701d5345fb9d607e-964-95.png		1	1	2			\N	2021-12-07 20:26:52	2021-12-07 20:26:52
96		041eb71f48a24f837687cbbd8f41f26c39f18b08-965-96.jpg	1	_thumb_041eb71f48a24f837687cbbd8f41f26c39f18b08-965-96.png		1	1	2			\N	2021-12-07 20:33:13	2021-12-07 20:33:13
97		b9e8639254ccf52ad23f48d32b420ffa382df13a-966-97.jpg	1	_thumb_b9e8639254ccf52ad23f48d32b420ffa382df13a-966-97.png		1	1	2			\N	2021-12-08 14:36:32	2021-12-08 14:36:32
103		dbb3f90d33758b174a53ac5745ebf4bdc96b0da7-969-103.jpg	1	_thumb_dbb3f90d33758b174a53ac5745ebf4bdc96b0da7-969-103.png		1	1	2			\N	2021-12-09 14:21:50	2021-12-09 14:21:50
99		b07f1623e6e49f12f7fb3b61baac6b2c95e9544f-727-99.jpg	1	_thumb_b07f1623e6e49f12f7fb3b61baac6b2c95e9544f-727-99.png		1	1	2			\N	2021-12-09 13:44:37	2021-12-09 13:44:37
100		afd2ab79aef3718216496dc5fe1115d7960a0162-967-100.jpg	1	_thumb_afd2ab79aef3718216496dc5fe1115d7960a0162-967-100.png		1	1	2			\N	2021-12-09 14:05:38	2021-12-09 14:05:38
101		34149e9afec1aecba30ff6647841aa0e4634f126-968-101.jpg	1	_thumb_34149e9afec1aecba30ff6647841aa0e4634f126-968-101.png		1	1	2			\N	2021-12-09 14:09:07	2021-12-09 14:09:07
104		b763f046ee00e47fc03753777db7fa7e45c3d9cd-970-104.jpg	1	_thumb_b763f046ee00e47fc03753777db7fa7e45c3d9cd-970-104.png		1	1	2			\N	2021-12-09 14:25:22	2021-12-09 14:25:22
105		0ae4afc1d09f097ba3ae0e795d55f3ac1ab96287-971-105.jpg	1	_thumb_0ae4afc1d09f097ba3ae0e795d55f3ac1ab96287-971-105.png		1	1	2			\N	2021-12-09 14:27:32	2021-12-09 14:27:32
106		a5fa567e032945a26551aa6c08117c5dde5748c5-899-106.jpg	1	_thumb_a5fa567e032945a26551aa6c08117c5dde5748c5-899-106.png		1	1	2			\N	2021-12-09 14:29:58	2021-12-09 14:29:58
107		c1877209cd0ade4c051d75aca87e55784f0d9b8b-972-107.jpg	1	_thumb_c1877209cd0ade4c051d75aca87e55784f0d9b8b-972-107.png		1	1	2			\N	2021-12-09 14:32:09	2021-12-09 14:32:09
108		a9da94a719969c6c89f8bf26dd9028fa99d98601-973-108.jpg	1	_thumb_a9da94a719969c6c89f8bf26dd9028fa99d98601-973-108.png		1	1	2			\N	2021-12-09 14:34:46	2021-12-09 14:34:46
109		2bef830d7b28b045a36b07d5be0deccc2cb0b76f-974-109.jpg	1	_thumb_2bef830d7b28b045a36b07d5be0deccc2cb0b76f-974-109.png		1	1	2			\N	2021-12-09 14:38:14	2021-12-09 14:38:14
110		6cae6391a29b77ce3a9ae8ddc021c4eaa62df8dd-975-110.jpg	1	_thumb_6cae6391a29b77ce3a9ae8ddc021c4eaa62df8dd-975-110.png		1	1	2			\N	2021-12-09 14:41:55	2021-12-09 14:41:55
111		72cba11eaddbdf2b2d96b968de11e4e7d765ff3e-976-111.jpg	1	_thumb_72cba11eaddbdf2b2d96b968de11e4e7d765ff3e-976-111.png		1	1	2			\N	2021-12-09 14:52:22	2021-12-09 14:52:22
112		94312f515f98e14722f3336d108d043e1f78bd43-977-112.jpg	1	_thumb_94312f515f98e14722f3336d108d043e1f78bd43-977-112.png		1	1	2			\N	2021-12-09 14:55:51	2021-12-09 14:55:51
113		59b7c9cb7d2e03edb04fa9e1996b63c0bdeb316b-84-113.jpg	1	_thumb_59b7c9cb7d2e03edb04fa9e1996b63c0bdeb316b-84-113.png		1	1	2			\N	2021-12-09 14:58:09	2021-12-09 14:58:09
115		fcbafea7cc1bd159e2090f16e3b78acedf734622-978-115.jpg	1	_thumb_fcbafea7cc1bd159e2090f16e3b78acedf734622-978-115.png		1	1	2			\N	2021-12-09 15:04:41	2021-12-09 15:04:41
116		fb351c9de1f415350930531c05f1fbb027232675-261-116.png	1	_thumb_fb351c9de1f415350930531c05f1fbb027232675-261-116.png		1	1	2			\N	2021-12-09 15:10:50	2021-12-09 15:10:51
117		2d93af6923ce0423029357312aa29c4543a78c85-979-117.jpg	1	_thumb_2d93af6923ce0423029357312aa29c4543a78c85-979-117.png		1	1	2			\N	2021-12-09 18:30:22	2021-12-09 18:30:22
118		ed124507decb714bc1cfd2d60941cd074d3f10ba-980-118.jpg	1	_thumb_ed124507decb714bc1cfd2d60941cd074d3f10ba-980-118.png		1	1	2			\N	2021-12-09 18:37:14	2021-12-09 18:37:14
119		14bbc4148e1480c49d6b592516c52887af860b4f-731-119.jpg	1	_thumb_14bbc4148e1480c49d6b592516c52887af860b4f-731-119.png		1	1	2			\N	2021-12-09 18:41:36	2021-12-09 18:41:36
120		82a03b296f70a04c8029b96df31af7f36e20466e-981-120.jpg	1	_thumb_82a03b296f70a04c8029b96df31af7f36e20466e-981-120.png		1	1	2			\N	2021-12-09 18:45:35	2021-12-09 18:45:35
121		b77ed7d5c255acf9c4ac21fa4772600e9e83133c-982-121.jpg	1	_thumb_b77ed7d5c255acf9c4ac21fa4772600e9e83133c-982-121.png		1	1	2			\N	2021-12-09 18:55:21	2021-12-09 18:55:21
122		3ad7a56cdbd7cc075177199ca8cb76b93895bb0e-533-122.jpg	1	_thumb_3ad7a56cdbd7cc075177199ca8cb76b93895bb0e-533-122.png		1	1	2			\N	2021-12-09 19:07:49	2021-12-09 19:07:49
123		861073edf604f7610586b159a6b0e8a6edf38870-983-123.jpg	1	_thumb_861073edf604f7610586b159a6b0e8a6edf38870-983-123.png		1	1	2			\N	2021-12-09 19:10:30	2021-12-09 19:10:30
124		1c4e7deb4d9c8243b7955abaf682b8ccf5abd618-984-124.jpg	1	_thumb_1c4e7deb4d9c8243b7955abaf682b8ccf5abd618-984-124.png		1	1	2			\N	2021-12-09 19:49:03	2021-12-09 19:49:03
125		613be3e0c10f3fe75fa6a71b128fb37e3e3732f6-985-125.jpg	1	_thumb_613be3e0c10f3fe75fa6a71b128fb37e3e3732f6-985-125.png		1	1	2			\N	2021-12-09 20:03:56	2021-12-09 20:03:56
126		bad23b500f413a2e832ad881ff9618ba1f82652c-986-126.jpg	1	_thumb_bad23b500f413a2e832ad881ff9618ba1f82652c-986-126.png		1	1	2			\N	2021-12-09 20:11:59	2021-12-09 20:11:59
127		5a87278e96e8bed2ace40b42ed961c4071116923-987-127.jpg	1	_thumb_5a87278e96e8bed2ace40b42ed961c4071116923-987-127.png		1	1	2			\N	2021-12-09 20:29:34	2021-12-09 20:29:34
128		ccaeedf2e5b4d57223b97843bebb73e6985a187e-853-128.jpg	1	_thumb_ccaeedf2e5b4d57223b97843bebb73e6985a187e-853-128.png		1	1	2			\N	2021-12-09 20:42:34	2021-12-09 20:42:34
129		564b2ef4bc07f87c45f2a24db6103fd3aa77537a-793-129.jpg	1	_thumb_564b2ef4bc07f87c45f2a24db6103fd3aa77537a-793-129.png		1	1	2			\N	2021-12-09 20:49:17	2021-12-09 20:49:17
130		ac6977c73e54aea1500ff5db2df3324607bb8adf-826-130.jpg	1	_thumb_ac6977c73e54aea1500ff5db2df3324607bb8adf-826-130.png		1	1	2			\N	2021-12-09 20:52:07	2021-12-09 20:52:07
131		7030656bdf7c57e6c83251efeb517e8c37eef2a5-988-131.jpg	1	_thumb_7030656bdf7c57e6c83251efeb517e8c37eef2a5-988-131.png		1	1	2			\N	2021-12-09 20:58:17	2021-12-09 20:58:17
132		399a3157ae1b2bcd71251d161c7f5347bf88bfe0-453-132.jpg	1	_thumb_399a3157ae1b2bcd71251d161c7f5347bf88bfe0-453-132.png		1	1	2			\N	2021-12-10 13:35:08	2021-12-10 13:35:09
134		9b29c8ee6b56f565778b3596009cb2e2305767f8-990-134.jpg	1	_thumb_9b29c8ee6b56f565778b3596009cb2e2305767f8-990-134.png		1	1	2			\N	2021-12-10 13:40:13	2021-12-10 13:40:13
135		9c9302ca08266b24d2dec4a127076fad11b1388b-991-135.jpg	1	_thumb_9c9302ca08266b24d2dec4a127076fad11b1388b-991-135.png		1	1	2			\N	2021-12-10 13:48:52	2021-12-10 13:48:52
136		39209d08b018b7d6c02d34d9ee3af125ed0d280d-992-136.jpg	1	_thumb_39209d08b018b7d6c02d34d9ee3af125ed0d280d-992-136.png		1	1	2			\N	2021-12-10 14:00:25	2021-12-10 14:00:25
137		ceb91842a18dbab976c9e41ffb44ab6fb9c6f643-993-137.jpg	1	_thumb_ceb91842a18dbab976c9e41ffb44ab6fb9c6f643-993-137.png		1	1	2			\N	2021-12-10 14:04:12	2021-12-10 14:04:12
138		07b2f4689accf09abecc36bbc0f23daa2fbc300e-994-138.jpg	1	_thumb_07b2f4689accf09abecc36bbc0f23daa2fbc300e-994-138.png		1	1	2			\N	2021-12-10 14:07:59	2021-12-10 14:07:59
139		68d0412b595116a8108043ad2c24e02fad6f9258-995-139.jpg	1	_thumb_68d0412b595116a8108043ad2c24e02fad6f9258-995-139.png		1	1	2			\N	2021-12-10 14:10:23	2021-12-10 14:10:23
140		d29ca84bd33c4d90ed22bf24ef80f89becf5b449-996-140.jpg	1	_thumb_d29ca84bd33c4d90ed22bf24ef80f89becf5b449-996-140.png		1	1	2			\N	2021-12-10 14:15:16	2021-12-10 14:15:16
141		2938f34810ab5465009170bbe5085de15680db7c-538-141.jpg	1	_thumb_2938f34810ab5465009170bbe5085de15680db7c-538-141.png		1	1	2			\N	2021-12-10 14:19:15	2021-12-10 14:19:15
142		a4e3d53cbb26da094316f7e3b1c3588f2cc7265c-538-142.jpg	1	_thumb_a4e3d53cbb26da094316f7e3b1c3588f2cc7265c-538-142.png		1	1	2			\N	2021-12-10 14:21:26	2021-12-10 14:21:26
143		ffbcdc801671d7e3facbf402f00f509ebdd007bc-997-143.jpg	1	_thumb_ffbcdc801671d7e3facbf402f00f509ebdd007bc-997-143.png		1	1	2			\N	2021-12-10 14:28:29	2021-12-10 14:28:29
144		ae9d346fbced5d955a15454d4b1d065a3c7c9794-998-144.jpg	1	_thumb_ae9d346fbced5d955a15454d4b1d065a3c7c9794-998-144.png		1	1	2			\N	2022-01-04 19:44:59	2022-01-04 19:44:59
145		a5aa710326e7ebc11195cc193fcba81fc486a72b-999-145.jpg	1	_thumb_a5aa710326e7ebc11195cc193fcba81fc486a72b-999-145.png		1	1	2			\N	2022-01-04 19:51:24	2022-01-04 19:51:24
146		64bc6cddb560eb177f90218552902c6aa6b58fed-1000-146.jpg	1	_thumb_64bc6cddb560eb177f90218552902c6aa6b58fed-1000-146.png		1	1	2			\N	2022-01-04 19:54:28	2022-01-04 19:54:28
147		d925eba6cc479d195a14205510dda3de0e7d61ff-1001-147.jpg	1	_thumb_d925eba6cc479d195a14205510dda3de0e7d61ff-1001-147.png		1	1	2			\N	2022-01-05 14:23:29	2022-01-05 14:23:29
148		5cf79fa00b9c205bcbb55f97ad547e34e2e36f7d-1002-148.jpg	1	_thumb_5cf79fa00b9c205bcbb55f97ad547e34e2e36f7d-1002-148.png		1	1	2			\N	2022-01-05 14:26:13	2022-01-05 14:26:13
149		d017754ab0898a0b041a4e0726ac8b2e3f5b185f-1003-149.jpg	1	_thumb_d017754ab0898a0b041a4e0726ac8b2e3f5b185f-1003-149.png		1	1	2			\N	2022-01-05 14:31:28	2022-01-05 14:31:28
150		7e1b7ec33d85cb8d6a76367b9ac00847f9d64a1c-1004-150.jpg	1	_thumb_7e1b7ec33d85cb8d6a76367b9ac00847f9d64a1c-1004-150.png		1	1	2			\N	2022-01-05 14:33:15	2022-01-05 14:33:15
151		e8fe6e43a4d3d16c5696a86a5fbdd73274406ba6-1005-151.jpg	1	_thumb_e8fe6e43a4d3d16c5696a86a5fbdd73274406ba6-1005-151.png		1	1	2			\N	2022-01-05 14:35:21	2022-01-05 14:35:21
152		46551289106b690bcb507d76d3abd7f8b966377b-1006-152.jpg	1	_thumb_46551289106b690bcb507d76d3abd7f8b966377b-1006-152.png		1	1	2			\N	2022-01-05 14:37:55	2022-01-05 14:37:55
153		008eb78a87f6ef4a0772bdf1063484480af6271b-1007-153.jpg	1	_thumb_008eb78a87f6ef4a0772bdf1063484480af6271b-1007-153.png		1	1	2			\N	2022-01-05 14:40:41	2022-01-05 14:40:41
154		506f069d503120eeec0b24a9e1637a54729794d6-1008-154.jpg	1	_thumb_506f069d503120eeec0b24a9e1637a54729794d6-1008-154.png		1	1	2			\N	2022-01-05 19:43:55	2022-01-05 19:43:55
155		b5f77f9e018ecdb6a5cff3f62388e7d67ba5bb66-1009-155.jpg	1	_thumb_b5f77f9e018ecdb6a5cff3f62388e7d67ba5bb66-1009-155.png		1	1	2			\N	2022-01-05 19:47:13	2022-01-05 19:47:13
157		b0bccf0925f2b3378657901b90ebada6894db0c9-1010-157.jpg	1	_thumb_b0bccf0925f2b3378657901b90ebada6894db0c9-1010-157.png		1	1	2			\N	2022-01-06 15:00:31	2022-01-06 15:00:31
158		5bcd3bcd5bcfcb5356044476c498ad593cd62631-1012-158.jpg	1	_thumb_5bcd3bcd5bcfcb5356044476c498ad593cd62631-1012-158.png		1	1	2			\N	2022-01-06 15:04:58	2022-01-06 15:04:58
159		d90ea9d46191e1bddf5ebc69f678ec7ffc36fdb3-1013-159.jpg	1	_thumb_d90ea9d46191e1bddf5ebc69f678ec7ffc36fdb3-1013-159.png		1	1	2			\N	2022-01-06 19:26:11	2022-01-06 19:26:11
160		27fb6b551a669c02a47d78deeb0c518c6106fb61-1014-160.jpg	1	_thumb_27fb6b551a669c02a47d78deeb0c518c6106fb61-1014-160.png		1	1	2			\N	2022-01-06 19:28:45	2022-01-06 19:28:45
161		6ae6af954b78a491504dd3d998d915db81c0dd00-1015-161.jpg	1	_thumb_6ae6af954b78a491504dd3d998d915db81c0dd00-1015-161.png		1	1	2			\N	2022-01-06 19:33:04	2022-01-06 19:33:04
162		c4f3601e2129e1dc805e9753e8792a581afe3cbe-1017-162.jpg	1	_thumb_c4f3601e2129e1dc805e9753e8792a581afe3cbe-1017-162.png		1	1	2			\N	2022-01-07 14:10:04	2022-01-07 14:10:04
163		f3767f3da8b6be5bf165a8453d6a79640e00751e-1018-163.jpg	1	_thumb_f3767f3da8b6be5bf165a8453d6a79640e00751e-1018-163.png		1	1	2			\N	2022-01-07 14:16:38	2022-01-07 14:16:38
164		ddeb1c4303046f6efbf42ff39cc87d35752cd622-1019-164.jpg	1	_thumb_ddeb1c4303046f6efbf42ff39cc87d35752cd622-1019-164.png		1	1	2			\N	2022-01-07 14:19:35	2022-01-07 14:19:35
165		696d2d9ec2e6f9aa2a1a68e11303d681c5b517c8-1020-165.jpg	1	_thumb_696d2d9ec2e6f9aa2a1a68e11303d681c5b517c8-1020-165.png		1	1	2			\N	2022-01-07 14:28:47	2022-01-07 14:28:47
166		3584c71da75d603043887a5008802cd490c342f1-1021-166.jpg	1	_thumb_3584c71da75d603043887a5008802cd490c342f1-1021-166.png		1	1	2			\N	2022-01-07 14:45:04	2022-01-07 14:45:04
167		4db50ff50fcade9f379339b607c0705afe759399-1022-167.jpg	1	_thumb_4db50ff50fcade9f379339b607c0705afe759399-1022-167.png		1	1	2			\N	2022-01-07 14:48:54	2022-01-07 14:48:55
168		fbd5dc675e5fbe3e63c1a5ab2a52cefdc6b22bf2-1023-168.jpg	1	_thumb_fbd5dc675e5fbe3e63c1a5ab2a52cefdc6b22bf2-1023-168.png		1	1	2			\N	2022-01-11 15:13:06	2022-01-11 15:13:06
169		3960ed98e4ac729d2c62b6831727c4f1a355fc9a-1024-169.jpg	1	_thumb_3960ed98e4ac729d2c62b6831727c4f1a355fc9a-1024-169.png		1	1	2			\N	2022-01-11 15:16:06	2022-01-11 15:16:06
170		b395b00c89b78d8e1a345a8db53dcb1a8a418847-1025-170.jpg	1	_thumb_b395b00c89b78d8e1a345a8db53dcb1a8a418847-1025-170.png		1	1	2			\N	2022-01-11 15:18:14	2022-01-11 15:18:14
171		dca8c43f625d52c8c7340bdf6304e46aa953ff0d-1026-171.jpg	1	_thumb_dca8c43f625d52c8c7340bdf6304e46aa953ff0d-1026-171.png		1	1	2			\N	2022-01-11 15:21:09	2022-01-11 15:21:09
172		b842bd98d8c0cd2f08c83230ead6fb4856265f3c-1028-172.jpg	1	_thumb_b842bd98d8c0cd2f08c83230ead6fb4856265f3c-1028-172.png		1	1	2			\N	2022-01-11 16:38:52	2022-01-11 16:38:52
173		8fc51ec5eb05c83fd3afa7702d894dfc4280a1b3-1029-173.jpg	1	_thumb_8fc51ec5eb05c83fd3afa7702d894dfc4280a1b3-1029-173.png		1	1	2			\N	2022-01-11 16:43:10	2022-01-11 16:43:10
175		f6a8181954b3afb0f6be2b90ad0d073bbfe398a0-1030-175.jpg	1	_thumb_f6a8181954b3afb0f6be2b90ad0d073bbfe398a0-1030-175.png		1	1	2			\N	2022-01-11 16:45:16	2022-01-11 16:45:16
176		906a17027083a235d5e09bc5b755f13d51b2e0c9-1031-176.jpg	1	_thumb_906a17027083a235d5e09bc5b755f13d51b2e0c9-1031-176.png		1	1	2			\N	2022-01-11 16:52:35	2022-01-11 16:52:35
177		b2d1cbb7931d0fb2e4e13daa0ec8f0264b77ba54-1032-177.jpg	1	_thumb_b2d1cbb7931d0fb2e4e13daa0ec8f0264b77ba54-1032-177.png		1	1	2			\N	2022-01-11 16:55:32	2022-01-11 16:55:32
178		7f5f1a5ef26952373ce4e484ee9db8ca2e63188c-1033-178.jpg	1	_thumb_7f5f1a5ef26952373ce4e484ee9db8ca2e63188c-1033-178.png		1	1	2			\N	2022-01-11 18:20:50	2022-01-11 18:20:50
179		3e2ffb573404420bbb9ed976e33a019b1d6400b7-1034-179.jpg	1	_thumb_3e2ffb573404420bbb9ed976e33a019b1d6400b7-1034-179.png		1	1	2			\N	2022-01-11 18:22:15	2022-01-11 18:22:15
180		0ebcf68daf89a7a1f8b2043fc60afb5835fac3f0-1035-180.jpg	1	_thumb_0ebcf68daf89a7a1f8b2043fc60afb5835fac3f0-1035-180.png		1	1	2			\N	2022-01-11 18:24:06	2022-01-11 18:24:06
181		ce9b8f7bc384ec59b0c4b60a06a1c8500ff12e82-1036-181.jpg	1	_thumb_ce9b8f7bc384ec59b0c4b60a06a1c8500ff12e82-1036-181.png		1	1	2			\N	2022-01-11 18:27:13	2022-01-11 18:27:13
182		bd699b11863491b27cd7c4a503bb05eb118d4d05-1037-182.jpg	1	_thumb_bd699b11863491b27cd7c4a503bb05eb118d4d05-1037-182.png		1	1	2			\N	2022-01-11 18:29:46	2022-01-11 18:29:46
183		bcb01d6e1011b72d050343743561d7757611c658-1040-183.jpg	1	_thumb_bcb01d6e1011b72d050343743561d7757611c658-1040-183.png		1	1	2			\N	2022-01-11 18:40:24	2022-01-11 18:40:25
184		660199ad8c7b712095bcecc25ac6dbe9b1b91797-1041-184.jpg	1	_thumb_660199ad8c7b712095bcecc25ac6dbe9b1b91797-1041-184.png		1	1	2			\N	2022-01-11 19:26:27	2022-01-11 19:26:27
185		71e2fef867260bca1e670e612030141266e62e0b-1042-185.jpg	1	_thumb_71e2fef867260bca1e670e612030141266e62e0b-1042-185.png		1	1	2			\N	2022-01-11 19:29:00	2022-01-11 19:29:00
186		1d3097d912db9033ef9e13c56909729552265e95-1043-186.jpg	1	_thumb_1d3097d912db9033ef9e13c56909729552265e95-1043-186.png		1	1	2			\N	2022-01-11 19:32:18	2022-01-11 19:32:19
187		faf50d4d83042bf87306d0c45494ce6dc220870a-1044-187.jpg	1	_thumb_faf50d4d83042bf87306d0c45494ce6dc220870a-1044-187.png		1	1	2			\N	2022-01-11 19:34:47	2022-01-11 19:34:47
188		fff0fffca15c510aee0cde13fce9591f35c90846-1045-188.jpg	1	_thumb_fff0fffca15c510aee0cde13fce9591f35c90846-1045-188.png		1	1	2			\N	2022-01-11 19:53:43	2022-01-11 19:53:43
189		c245ac09fa27a6c3e7632c202dc5269fab1b2586-1046-189.jpg	1	_thumb_c245ac09fa27a6c3e7632c202dc5269fab1b2586-1046-189.png		1	1	2			\N	2022-01-11 19:57:03	2022-01-11 19:57:03
190		795e34f8589d9671d8de016fa50f86fcf6034678-1047-190.jpg	1	_thumb_795e34f8589d9671d8de016fa50f86fcf6034678-1047-190.png		1	1	2			\N	2022-01-11 19:59:26	2022-01-11 19:59:26
191		f9f4c641135ebea4d4a422aaf35579edee1c4dc4-1048-191.jpg	1	_thumb_f9f4c641135ebea4d4a422aaf35579edee1c4dc4-1048-191.png		1	1	2			\N	2022-01-11 20:01:50	2022-01-11 20:01:50
192		56d0e2ba4303e87f66ae06ed7eb7aec1396c90e9-1050-192.jpg	1	_thumb_56d0e2ba4303e87f66ae06ed7eb7aec1396c90e9-1050-192.png		1	1	2			\N	2022-01-11 20:06:03	2022-01-11 20:06:03
193		cc25d0545ca7fc3bb47a8d5410d8c7759ccb712f-1051-193.jpg	1	_thumb_cc25d0545ca7fc3bb47a8d5410d8c7759ccb712f-1051-193.png		1	1	2			\N	2022-01-11 20:10:01	2022-01-11 20:10:01
194		c772c41ae434d843274613651477debce80bda42-1052-194.jpg	1	_thumb_c772c41ae434d843274613651477debce80bda42-1052-194.png		1	1	2			\N	2022-01-11 20:13:15	2022-01-11 20:13:15
195		c5717b09632cb7b08acd7838787fbb315309946f-1053-195.jpg	1	_thumb_c5717b09632cb7b08acd7838787fbb315309946f-1053-195.png		1	1	2			\N	2022-01-11 20:17:44	2022-01-11 20:17:44
196		8d8e2eb5203e03ad8b6b4477bc4f7c635a73fecd-1054-196.jpg	1	_thumb_8d8e2eb5203e03ad8b6b4477bc4f7c635a73fecd-1054-196.png		1	1	2			\N	2022-01-12 15:54:35	2022-01-12 15:54:35
197		c54cabbb57f93091990a2c3b31824ba96d4d7fed-1055-197.jpg	1	_thumb_c54cabbb57f93091990a2c3b31824ba96d4d7fed-1055-197.png		1	1	2			\N	2022-01-14 14:56:25	2022-01-14 14:56:25
198		7cb0d230f9dc2f63bc93198fdff0d409861de632-1056-198.jpg	1	_thumb_7cb0d230f9dc2f63bc93198fdff0d409861de632-1056-198.png		1	1	2			\N	2022-01-14 15:01:02	2022-01-14 15:01:02
199		ecd0a9a7967182742e9c02a2d35f9c692f55ad5a-1057-199.jpg	1	_thumb_ecd0a9a7967182742e9c02a2d35f9c692f55ad5a-1057-199.png		1	1	2			\N	2022-01-14 15:05:42	2022-01-14 15:05:42
200		fc1d87af9c60197241f82b844201912007be761f-1059-200.jpg	1	_thumb_fc1d87af9c60197241f82b844201912007be761f-1059-200.png		1	1	2			\N	2022-01-14 16:28:41	2022-01-14 16:28:41
201		0deeb7960eec5e59fc21e156df8d90106c129204-1060-201.jpg	1	_thumb_0deeb7960eec5e59fc21e156df8d90106c129204-1060-201.png		1	1	2			\N	2022-01-14 16:32:24	2022-01-14 16:32:24
202		ae53c49e3277c6ef017c349760bf6aabb476ce79-1061-202.jpg	1	_thumb_ae53c49e3277c6ef017c349760bf6aabb476ce79-1061-202.png		1	1	2			\N	2022-01-14 16:34:47	2022-01-14 16:34:47
203		89393b06da6a13e5b88e681d29e51ddddce7ddb9-1062-203.jpg	1	_thumb_89393b06da6a13e5b88e681d29e51ddddce7ddb9-1062-203.png		1	1	2			\N	2022-01-14 17:33:57	2022-01-14 17:33:58
204		ee77e200da42b3bff69a9e7d764643e739b673fc-1063-204.jpg	1	_thumb_ee77e200da42b3bff69a9e7d764643e739b673fc-1063-204.png		1	1	2			\N	2022-01-14 23:49:54	2022-01-14 23:49:54
205		beaf6c25b00f0af97e6401bf41cede48606e1e7c-1065-205.jpg	1	_thumb_beaf6c25b00f0af97e6401bf41cede48606e1e7c-1065-205.png		1	1	2			\N	2022-01-14 23:53:32	2022-01-14 23:53:32
206		98cb53e7645cd884247a89ad07f84dc343fab6d7-1066-206.jpg	1	_thumb_98cb53e7645cd884247a89ad07f84dc343fab6d7-1066-206.png		1	1	2			\N	2022-01-14 23:55:47	2022-01-14 23:55:47
207		fd534d64c579e9c695993ab63912ccd90ef66f53-1067-207.jpg	1	_thumb_fd534d64c579e9c695993ab63912ccd90ef66f53-1067-207.png		1	1	2			\N	2022-01-14 23:57:38	2022-01-14 23:57:38
208		f4ce86663b9650f33ae5dc68af9f16c071793cb9-1068-208.jpg	1	_thumb_f4ce86663b9650f33ae5dc68af9f16c071793cb9-1068-208.png		1	1	2			\N	2022-01-14 23:58:52	2022-01-14 23:58:53
209		f345ceafac40d5a91caca50d0070fca203f7faa1-1069-209.jpg	1	_thumb_f345ceafac40d5a91caca50d0070fca203f7faa1-1069-209.png		1	1	2			\N	2022-01-15 00:00:33	2022-01-15 00:00:33
210		e8264a0085fbefcc7ba414545ce4506dd47426d0-1070-210.jpg	1	_thumb_e8264a0085fbefcc7ba414545ce4506dd47426d0-1070-210.png		1	1	2			\N	2022-01-15 00:02:34	2022-01-15 00:02:34
211		413f9816922a6a9426bf8f8935a5a2afa2b274bf-1071-211.jpg	1	_thumb_413f9816922a6a9426bf8f8935a5a2afa2b274bf-1071-211.png		1	1	2			\N	2022-01-15 00:04:47	2022-01-15 00:04:47
212		ee5f95285f67514fd967ba73601782cd450f6eff-1072-212.jpg	1	_thumb_ee5f95285f67514fd967ba73601782cd450f6eff-1072-212.png		1	1	2			\N	2022-01-15 00:06:41	2022-01-15 00:06:41
213		bbf31c2d9b811316b13aed55f0a63990c136f2b9-1073-213.jpg	1	_thumb_bbf31c2d9b811316b13aed55f0a63990c136f2b9-1073-213.png		1	1	2			\N	2022-01-15 00:21:53	2022-01-15 00:21:53
214		71d17aa86e699e1bb0ac3b8860eaa4fccd542db7-1074-214.jpg	1	_thumb_71d17aa86e699e1bb0ac3b8860eaa4fccd542db7-1074-214.png		1	1	2			\N	2022-01-15 00:25:23	2022-01-15 00:25:23
215		982031c7da424011e29634e3f673e6ab7a93cba2-1075-215.jpg	1	_thumb_982031c7da424011e29634e3f673e6ab7a93cba2-1075-215.png		1	1	2			\N	2022-01-15 00:27:00	2022-01-15 00:27:00
216		035e3080905be16101af0b2bdf8b24b7746e27e9-1076-216.jpg	1	_thumb_035e3080905be16101af0b2bdf8b24b7746e27e9-1076-216.png		1	1	2			\N	2022-01-15 00:29:29	2022-01-15 00:29:30
217		22053cc5910db0e28d6f511b28a4592b374c811b-1077-217.jpg	1	_thumb_22053cc5910db0e28d6f511b28a4592b374c811b-1077-217.png		1	1	2			\N	2022-01-15 00:33:18	2022-01-15 00:33:18
218		8c813a9b104efac4b1b1cd7c2288c5533c612516-1078-218.jpg	1	_thumb_8c813a9b104efac4b1b1cd7c2288c5533c612516-1078-218.png		1	1	2			\N	2022-01-15 00:38:37	2022-01-15 00:38:37
219		b7e5f5727978923eb8d5c8a6ee20a78ccf3d1774-1079-219.jpg	1	_thumb_b7e5f5727978923eb8d5c8a6ee20a78ccf3d1774-1079-219.png		1	1	2			\N	2022-01-15 00:40:46	2022-01-15 00:40:46
220		4a2242814f3b676e5e7f6e7ed85b1956d798d8d7-1080-220.jpg	1	_thumb_4a2242814f3b676e5e7f6e7ed85b1956d798d8d7-1080-220.png		1	1	2			\N	2022-01-15 00:43:33	2022-01-15 00:43:33
221		6888f1e4fab17de446cb2a14af7bdbfdce94e0f0-1081-221.jpg	1	_thumb_6888f1e4fab17de446cb2a14af7bdbfdce94e0f0-1081-221.png		1	1	2			\N	2022-01-18 15:35:10	2022-01-18 15:35:10
222		94b6ee6f877d88bf3026ac0dac3d636ef2248960-1082-222.jpg	1	_thumb_94b6ee6f877d88bf3026ac0dac3d636ef2248960-1082-222.png		1	1	2			\N	2022-01-18 15:39:09	2022-01-18 15:39:09
223		4a3bbf1ab1be7b210a60a6e3bc6a3abd2457a39f-1083-223.jpg	1	_thumb_4a3bbf1ab1be7b210a60a6e3bc6a3abd2457a39f-1083-223.png		1	1	2			\N	2022-01-18 15:41:35	2022-01-18 15:41:35
224		b9444dd6aa9bed588bc86654826b05953a073058-1084-224.jpg	1	_thumb_b9444dd6aa9bed588bc86654826b05953a073058-1084-224.png		1	1	2			\N	2022-01-18 15:45:51	2022-01-18 15:45:51
225		9f57de8ba13ff39b1cb864efc5623fe1ed080e45-1085-225.jpg	1	_thumb_9f57de8ba13ff39b1cb864efc5623fe1ed080e45-1085-225.png		1	1	2			\N	2022-01-19 15:18:29	2022-01-19 15:18:29
226		b872f8ffd92bca291a73e00598b63a41b80e25af-1086-226.jpg	1	_thumb_b872f8ffd92bca291a73e00598b63a41b80e25af-1086-226.png		1	1	2			\N	2022-01-19 15:22:43	2022-01-19 15:22:43
227		46d8529aa7e32b538a94e187f88c2cf716e22916-1087-227.jpg	1	_thumb_46d8529aa7e32b538a94e187f88c2cf716e22916-1087-227.png		1	1	2			\N	2022-01-19 15:25:48	2022-01-19 15:25:48
228		7c865175564dd8e4003a8755f52e05599582bf0a-1088-228.jpg	1	_thumb_7c865175564dd8e4003a8755f52e05599582bf0a-1088-228.png		1	1	2			\N	2022-01-19 21:01:12	2022-01-19 21:01:12
229		dac911daf57bb6b1a49de13a056915534f21519e-1091-229.jpg	1	_thumb_dac911daf57bb6b1a49de13a056915534f21519e-1091-229.png		1	1	2			\N	2022-01-19 21:06:19	2022-01-19 21:06:19
230		7d3f11fbc3d84bd0a83bb922957820a5e41ce5d9-1092-230.jpg	1	_thumb_7d3f11fbc3d84bd0a83bb922957820a5e41ce5d9-1092-230.png		1	1	2			\N	2022-01-21 15:50:04	2022-01-21 15:50:04
231		4d12c1e506a0947e2437c7744fd9fa067fea29d4-1093-231.jpg	1	_thumb_4d12c1e506a0947e2437c7744fd9fa067fea29d4-1093-231.png		1	1	2			\N	2022-01-21 15:51:59	2022-01-21 15:51:59
232		bef225145f53a3ab1d308ecb49c7296ab0d63dab-1094-232.jpg	1	_thumb_bef225145f53a3ab1d308ecb49c7296ab0d63dab-1094-232.png		1	1	2			\N	2022-01-21 15:53:41	2022-01-21 15:53:41
233		f93a1c866e813046858837cf3a95174a48f966f8-1095-233.jpg	1	_thumb_f93a1c866e813046858837cf3a95174a48f966f8-1095-233.png		1	1	2			\N	2022-01-21 16:06:07	2022-01-21 16:06:07
234		4056745637aad882b7bd768717003bb6b309198a-1097-234.jpg	1	_thumb_4056745637aad882b7bd768717003bb6b309198a-1097-234.png		1	1	2			\N	2022-01-21 16:07:59	2022-01-21 16:07:59
235		a76410023bbebb1abc75862f35a6dec938ce8a87-1098-235.jpg	1	_thumb_a76410023bbebb1abc75862f35a6dec938ce8a87-1098-235.png		1	1	2			\N	2022-01-21 16:12:18	2022-01-21 16:12:18
236		97369b3699a15d8463d14272d08301f056ed0e49-1099-236.jpg	1	_thumb_97369b3699a15d8463d14272d08301f056ed0e49-1099-236.png		1	1	2			\N	2022-01-21 16:16:40	2022-01-21 16:16:40
237		7ed457f7edae47d8b4f2289883a7889f0de030ae-1100-237.jpg	1	_thumb_7ed457f7edae47d8b4f2289883a7889f0de030ae-1100-237.png		1	1	2			\N	2022-01-24 14:36:31	2022-01-24 14:36:31
238		55ab6258d3a4f33bf57d9910fe05b4d330658b19-1101-238.jpg	1	_thumb_55ab6258d3a4f33bf57d9910fe05b4d330658b19-1101-238.png		1	1	2			\N	2022-01-24 14:39:29	2022-01-24 14:39:29
239		89437b9082e950051f69c642c07793078e6f49eb-1103-239.jpg	1	_thumb_89437b9082e950051f69c642c07793078e6f49eb-1103-239.png		1	1	2			\N	2022-01-24 14:42:27	2022-01-24 14:42:27
240		1fff73e56952b98d22a014c8f982607d54ab9aca-1104-240.jpg	1	_thumb_1fff73e56952b98d22a014c8f982607d54ab9aca-1104-240.png		1	1	2			\N	2022-01-24 14:45:46	2022-01-24 14:45:46
241		26d54c29f3002e243204052b3652ca00d8ea8a7f-1105-241.jpg	1	_thumb_26d54c29f3002e243204052b3652ca00d8ea8a7f-1105-241.png		1	1	2			\N	2022-01-24 14:48:55	2022-01-24 14:48:56
242		9711e2f71d111db8c0056cab52fc2ecd5a847384-1106-242.jpg	1	_thumb_9711e2f71d111db8c0056cab52fc2ecd5a847384-1106-242.png		1	1	2			\N	2022-01-24 14:52:08	2022-01-24 14:52:08
243		2b72106974d97dce16662b1e4aa022a84b6b7ebd-1107-243.jpg	1	_thumb_2b72106974d97dce16662b1e4aa022a84b6b7ebd-1107-243.png		1	1	2			\N	2022-01-24 15:52:02	2022-01-24 15:52:02
244		2e8b5fd3538913f704dcd7c16d6c848316178b93-1108-244.jpg	1	_thumb_2e8b5fd3538913f704dcd7c16d6c848316178b93-1108-244.png		1	1	2			\N	2022-01-24 15:53:50	2022-01-24 15:53:50
245		30457da401ec8cc29fa0a256bf0576f48d60a666-1109-245.jpg	1	_thumb_30457da401ec8cc29fa0a256bf0576f48d60a666-1109-245.png		1	1	2			\N	2022-01-24 16:01:52	2022-01-24 16:01:52
246		a153b7f475838403222bf44ca7befdc27af48791-1110-246.jpg	1	_thumb_a153b7f475838403222bf44ca7befdc27af48791-1110-246.png		1	1	2			\N	2022-01-24 16:06:34	2022-01-24 16:06:34
247		4e65be052fcc35c9254ab5b943a8bf8a619bed38-1112-247.jpg	1	_thumb_4e65be052fcc35c9254ab5b943a8bf8a619bed38-1112-247.png		1	1	2			\N	2022-01-24 16:10:40	2022-01-24 16:10:40
248		071f1ed5656f2915b31925e37d24d88b0d2e6b5c-1115-248.jpg	1	_thumb_071f1ed5656f2915b31925e37d24d88b0d2e6b5c-1115-248.png		1	1	2			\N	2022-01-24 20:04:49	2022-01-24 20:04:49
249		3d0614a795bfd3f5bacf253aac8ac9dc471bd961-1116-249.jpg	1	_thumb_3d0614a795bfd3f5bacf253aac8ac9dc471bd961-1116-249.png		1	1	2			\N	2022-01-24 20:08:42	2022-01-24 20:08:42
250		baf0235d664f4c6f9fd2ae085ce72f90b3a12fd6-1117-250.jpg	1	_thumb_baf0235d664f4c6f9fd2ae085ce72f90b3a12fd6-1117-250.png		1	1	2			\N	2022-01-24 20:10:40	2022-01-24 20:10:40
251		6ef0035106aedec72de194a59963c8aaa66acb86-1118-251.jpg	1	_thumb_6ef0035106aedec72de194a59963c8aaa66acb86-1118-251.png		1	1	2			\N	2022-01-25 13:45:00	2022-01-25 13:45:00
252		db222a2264b4b17004458e8a668e0adfcacfaea5-1119-252.jpg	1	_thumb_db222a2264b4b17004458e8a668e0adfcacfaea5-1119-252.png		1	1	2			\N	2022-01-25 13:47:41	2022-01-25 13:47:41
253		241476e00f17d7fdefcc81b0529f2560a1db7c28-1120-253.jpg	1	_thumb_241476e00f17d7fdefcc81b0529f2560a1db7c28-1120-253.png		1	1	2			\N	2022-01-25 13:57:30	2022-01-25 13:57:30
254		066252697cc903813a2c88829eb93d4454d31405-1121-254.jpg	1	_thumb_066252697cc903813a2c88829eb93d4454d31405-1121-254.png		1	1	2			\N	2022-01-25 14:01:20	2022-01-25 14:01:20
255		39cb70695ac4fa20889e5995f8b491e5a552ce77-1122-255.jpg	1	_thumb_39cb70695ac4fa20889e5995f8b491e5a552ce77-1122-255.png		1	1	2			\N	2022-01-25 14:03:05	2022-01-25 14:03:05
256		a62073a48dc7c62742bdc76ad8d37170669f268c-1123-256.jpg	1	_thumb_a62073a48dc7c62742bdc76ad8d37170669f268c-1123-256.png		1	1	2			\N	2022-01-25 15:32:32	2022-01-25 15:32:32
257		fbfa7694b38f68a854d9d9539622821dc3f22686-1124-257.jpg	1	_thumb_fbfa7694b38f68a854d9d9539622821dc3f22686-1124-257.png		1	1	2			\N	2022-01-25 15:34:26	2022-01-25 15:34:26
258		18634a8b48910d9f32a6e309696102671f4ed7e4-1126-258.jpg	1	_thumb_18634a8b48910d9f32a6e309696102671f4ed7e4-1126-258.png		1	1	2			\N	2022-01-25 15:37:05	2022-01-25 15:37:05
259		209f61189c54b706d802af5b224e42b10dcc5dfc-1127-259.jpg	1	_thumb_209f61189c54b706d802af5b224e42b10dcc5dfc-1127-259.png		1	1	2			\N	2022-01-25 15:39:27	2022-01-25 15:39:27
260		01bb668c349586f2902454517505f9a9783b9d13-1129-260.jpg	1	_thumb_01bb668c349586f2902454517505f9a9783b9d13-1129-260.png		1	1	2			\N	2022-01-26 13:33:18	2022-01-26 13:33:18
261		cadd02265d6135f821ed0ad10e30b645bf73eb12-1128-261.jpg	1	_thumb_cadd02265d6135f821ed0ad10e30b645bf73eb12-1128-261.png		1	1	2			\N	2022-01-26 13:34:07	2022-01-26 13:34:07
262		8cd35db0e4cd443c1e8c67df51e685ed127bcc50-1130-262.jpg	1	_thumb_8cd35db0e4cd443c1e8c67df51e685ed127bcc50-1130-262.png		1	1	2			\N	2022-01-26 13:51:24	2022-01-26 13:51:24
263		8e6865aa77d65ff27500849fe3cf2e7710700840-1131-263.jpg	1	_thumb_8e6865aa77d65ff27500849fe3cf2e7710700840-1131-263.png		1	1	2			\N	2022-01-26 13:53:41	2022-01-26 13:53:41
264		3865254a8e8c626e11fb59ef2a8e913e2eb70455-1132-264.jpg	1	_thumb_3865254a8e8c626e11fb59ef2a8e913e2eb70455-1132-264.png		1	1	2			\N	2022-01-26 14:10:50	2022-01-26 14:10:50
270		eafe56b15c2a7274df5eb96b728f8abec2a84724-1133-270.jpg	1	_thumb_eafe56b15c2a7274df5eb96b728f8abec2a84724-1133-270.png		1	1	2			\N	2022-01-26 14:38:00	2022-01-26 14:38:00
267		c0b8c85901335de22179d8597deb390540ba6eed-1135-267.jpg	1	_thumb_c0b8c85901335de22179d8597deb390540ba6eed-1135-267.png		1	1	2			\N	2022-01-26 14:26:43	2022-01-26 14:26:43
269		a3627e9712c8378402af99dd0a7facf80b30b2a7-1134-269.jpg	1	_thumb_a3627e9712c8378402af99dd0a7facf80b30b2a7-1134-269.png		1	1	2			\N	2022-01-26 14:34:58	2022-01-26 14:34:58
271		babaeb50d57525a4429c8c24ceaac71bfe2e1ee2-1136-271.jpg	1	_thumb_babaeb50d57525a4429c8c24ceaac71bfe2e1ee2-1136-271.png		1	1	2			\N	2022-01-26 14:43:00	2022-01-26 14:43:00
272		607250c5d0fa819612ec3ea42e003e72f05abc41-1139-272.jpg	1	_thumb_607250c5d0fa819612ec3ea42e003e72f05abc41-1139-272.png		1	1	2			\N	2022-01-26 14:47:02	2022-01-26 14:47:02
273		bb244a90e675fc93da9cf736c42d09da545f7670-1140-273.jpg	1	_thumb_bb244a90e675fc93da9cf736c42d09da545f7670-1140-273.png		1	1	2			\N	2022-01-26 14:54:59	2022-01-26 14:54:59
274		363f8a2aadb9d4bbb24afe7a6a74dbda39501e2b-1141-274.jpg	1	_thumb_363f8a2aadb9d4bbb24afe7a6a74dbda39501e2b-1141-274.png		1	1	2			\N	2022-01-26 14:57:58	2022-01-26 14:57:58
275		f7a8cf453a7a6d950a0e42b577822f1b46cabffc-1142-275.jpg	1	_thumb_f7a8cf453a7a6d950a0e42b577822f1b46cabffc-1142-275.png		1	1	2			\N	2022-01-26 15:11:48	2022-01-26 15:11:48
279		f21cd9968880221c208d054a0022ee266601da10-1145-279.jpg	1	_thumb_f21cd9968880221c208d054a0022ee266601da10-1145-279.png		1	1	2			\N	2022-01-26 15:24:00	2022-01-26 15:24:00
277		85f2caf1fdd4f9f7ebe4ac0220508e32e447f516-1143-277.jpg	1	_thumb_85f2caf1fdd4f9f7ebe4ac0220508e32e447f516-1143-277.png		1	1	2			\N	2022-01-26 15:17:37	2022-01-26 15:17:37
278		4930f88a71b790ecbb3b9a51db89104902fb9218-1144-278.jpg	1	_thumb_4930f88a71b790ecbb3b9a51db89104902fb9218-1144-278.png		1	1	2			\N	2022-01-26 15:20:38	2022-01-26 15:20:38
280		fe3b6373e6a8c86bdde2a0a5f2cc0c770e3cbd87-1146-280.jpg	1	_thumb_fe3b6373e6a8c86bdde2a0a5f2cc0c770e3cbd87-1146-280.png		1	1	2			\N	2022-01-26 15:26:44	2022-01-26 15:26:44
282		16fad614a9d89c7f37e6bf1a83d6a3662f028408-1147-282.jpg	1	_thumb_16fad614a9d89c7f37e6bf1a83d6a3662f028408-1147-282.png		1	1	2			\N	2022-01-26 15:30:21	2022-01-26 15:30:21
283		5e5c7370d270643884402d0b60751cffcea287cf-1148-283.jpg	1	_thumb_5e5c7370d270643884402d0b60751cffcea287cf-1148-283.png		1	1	2			\N	2022-01-26 15:35:13	2022-01-26 15:35:13
284		6c4ebefdf33a6ce3a21760021497b871092f4c07-1149-284.jpg	1	_thumb_6c4ebefdf33a6ce3a21760021497b871092f4c07-1149-284.png		1	1	2			\N	2022-01-26 15:40:27	2022-01-26 15:40:27
285		d6c616b6557e3f1c211e5a0a72fc4c0a3847da24-1150-285.jpg	1	_thumb_d6c616b6557e3f1c211e5a0a72fc4c0a3847da24-1150-285.png		1	1	2			\N	2022-01-26 15:43:58	2022-01-26 15:43:58
286		9ad43001096fe67e83dee4280650d6ac97f40ec6-1151-286.jpg	1	_thumb_9ad43001096fe67e83dee4280650d6ac97f40ec6-1151-286.png		1	1	2			\N	2022-01-26 15:48:05	2022-01-26 15:48:05
287		1ad3d5d8ee42f65ca85e3a41e3a20e96223f3cd7-1152-287.jpg	1	_thumb_1ad3d5d8ee42f65ca85e3a41e3a20e96223f3cd7-1152-287.png		1	1	2			\N	2022-01-26 15:51:54	2022-01-26 15:51:54
290		7de56fd12faefe8be3e1fc0b358f83a0a72c72f2-1153-290.jpg	1	_thumb_7de56fd12faefe8be3e1fc0b358f83a0a72c72f2-1153-290.png		1	1	2			\N	2022-01-26 15:55:38	2022-01-26 15:55:38
291		3ebb8912121f758cfd039ad8c8e62dbeebb62d90-1154-291.jpg	1	_thumb_3ebb8912121f758cfd039ad8c8e62dbeebb62d90-1154-291.png		1	1	2			\N	2022-01-26 16:00:52	2022-01-26 16:00:52
292		9cceb998403bc2d8f5640cf02fa8de01f9857c34-1155-292.jpg	1	_thumb_9cceb998403bc2d8f5640cf02fa8de01f9857c34-1155-292.png		1	1	2			\N	2022-01-26 16:04:16	2022-01-26 16:04:16
293		d895c987cdf4423a442b3f08891038cfd7ee79f8-1156-293.jpg	1	_thumb_d895c987cdf4423a442b3f08891038cfd7ee79f8-1156-293.png		1	1	2			\N	2022-01-26 16:09:08	2022-01-26 16:09:08
315		8b74cc79e84e1a5094568412921ca52312d98be3-1177-315.jpg	1	_thumb_8b74cc79e84e1a5094568412921ca52312d98be3-1177-315.png		1	1	2			\N	2022-01-27 16:16:35	2022-01-27 16:16:35
295		b3abcff65c9827f3565acd6da0f03940f1efbaf9-1157-295.jpg	1	_thumb_b3abcff65c9827f3565acd6da0f03940f1efbaf9-1157-295.png		1	1	2			\N	2022-01-26 16:13:18	2022-01-26 16:13:18
296		f2db8bd3e87e8c886767221cbcb58fffd4c94dec-1158-296.jpg	1	_thumb_f2db8bd3e87e8c886767221cbcb58fffd4c94dec-1158-296.png		1	1	2			\N	2022-01-26 16:16:50	2022-01-26 16:16:50
297		00bfe4a6dabf6950ee65bf68b03f9c9a575b2df6-1159-297.jpg	1	_thumb_00bfe4a6dabf6950ee65bf68b03f9c9a575b2df6-1159-297.png		1	1	2			\N	2022-01-26 16:24:05	2022-01-26 16:24:05
298		b3deef89764b93d677f98a238559de8dcf450e8d-1160-298.jpg	1	_thumb_b3deef89764b93d677f98a238559de8dcf450e8d-1160-298.png		1	1	2			\N	2022-01-26 16:26:40	2022-01-26 16:26:40
299		7689592cf19447174947e23792014a60ecb4594d-1161-299.jpg	1	_thumb_7689592cf19447174947e23792014a60ecb4594d-1161-299.png		1	1	2			\N	2022-01-27 13:26:30	2022-01-27 13:26:30
300		98b2e105cf3e310681cc14638b30acfda89bcbdd-1162-300.jpg	1	_thumb_98b2e105cf3e310681cc14638b30acfda89bcbdd-1162-300.png		1	1	2			\N	2022-01-27 13:35:13	2022-01-27 13:35:13
301		dea408dd51493655da061ef552dce2a7bc03cc8d-1163-301.jpg	1	_thumb_dea408dd51493655da061ef552dce2a7bc03cc8d-1163-301.png		1	1	2			\N	2022-01-27 13:38:07	2022-01-27 13:38:07
302		170288634995e6761e85373d6ce85465859ac622-1164-302.jpg	1	_thumb_170288634995e6761e85373d6ce85465859ac622-1164-302.png		1	1	2			\N	2022-01-27 13:44:08	2022-01-27 13:44:08
303		aeab9b7369201f006298641baf4ebd0b33a1ed0e-1165-303.jpg	1	_thumb_aeab9b7369201f006298641baf4ebd0b33a1ed0e-1165-303.png		1	1	2			\N	2022-01-27 13:54:16	2022-01-27 13:54:16
304		95bb89835a16ae9e164536b0406c0c0253ab6b6b-1166-304.jpg	1	_thumb_95bb89835a16ae9e164536b0406c0c0253ab6b6b-1166-304.png		1	1	2			\N	2022-01-27 13:57:25	2022-01-27 13:57:25
305		3bab162ff9a09b6c30942b1ad1cb8af923ec2068-1167-305.jpg	1	_thumb_3bab162ff9a09b6c30942b1ad1cb8af923ec2068-1167-305.png		1	1	2			\N	2022-01-27 14:00:55	2022-01-27 14:00:55
306		602e3a300fc1d05c7390652ed4ee11f6d77927f2-1168-306.jpg	1	_thumb_602e3a300fc1d05c7390652ed4ee11f6d77927f2-1168-306.png		1	1	2			\N	2022-01-27 14:04:38	2022-01-27 14:04:38
307		5ca83070eb00271bded441eed596cf7cbd64accd-1169-307.jpg	1	_thumb_5ca83070eb00271bded441eed596cf7cbd64accd-1169-307.png		1	1	2			\N	2022-01-27 14:11:47	2022-01-27 14:11:47
308		5e44938e09fb619bf0cb032e8beca67bb091be03-1170-308.jpg	1	_thumb_5e44938e09fb619bf0cb032e8beca67bb091be03-1170-308.png		1	1	2			\N	2022-01-27 14:19:11	2022-01-27 14:19:11
309		d2b7dbd8cb829803b34f329d94aea7bc0cd3b1ba-1171-309.jpg	1	_thumb_d2b7dbd8cb829803b34f329d94aea7bc0cd3b1ba-1171-309.png		1	1	2			\N	2022-01-27 14:22:30	2022-01-27 14:22:30
310		d5f3bfd5688e9b5ef4270483e21c809e3e29b991-1172-310.jpg	1	_thumb_d5f3bfd5688e9b5ef4270483e21c809e3e29b991-1172-310.png		1	1	2			\N	2022-01-27 15:50:30	2022-01-27 15:50:30
311		45e69a1da03ec69e314805a52d47693d232df8fa-1173-311.jpg	1	_thumb_45e69a1da03ec69e314805a52d47693d232df8fa-1173-311.png		1	1	2			\N	2022-01-27 16:01:17	2022-01-27 16:01:17
312		f3fec05d00e4e296a78584cd60c1ab8203d17029-1174-312.jpg	1	_thumb_f3fec05d00e4e296a78584cd60c1ab8203d17029-1174-312.png		1	1	2			\N	2022-01-27 16:04:54	2022-01-27 16:04:54
313		83a022ca8b86446c9f3013c28952c5e24791bece-1175-313.jpg	1	_thumb_83a022ca8b86446c9f3013c28952c5e24791bece-1175-313.png		1	1	2			\N	2022-01-27 16:06:31	2022-01-27 16:06:31
314		6a4e5869f2a089d48df184313a6c962d7af7bfde-1176-314.jpg	1	_thumb_6a4e5869f2a089d48df184313a6c962d7af7bfde-1176-314.png		1	1	2			\N	2022-01-27 16:08:38	2022-01-27 16:08:38
324		c7112e80009d039300c7979a54ee0259492de3ad-1184-324.jpg	1	_thumb_c7112e80009d039300c7979a54ee0259492de3ad-1184-324.png		1	1	2			\N	2022-01-27 16:49:52	2022-01-27 16:49:52
317		028e53d6ada68ea3b881c8586a666601c734f168-1178-317.jpg	1	_thumb_028e53d6ada68ea3b881c8586a666601c734f168-1178-317.png		1	1	2			\N	2022-01-27 16:25:07	2022-01-27 16:25:07
318		b65ea4711f01bc3f6219d8547151cc888e149e42-1179-318.jpg	1	_thumb_b65ea4711f01bc3f6219d8547151cc888e149e42-1179-318.png		1	1	2			\N	2022-01-27 16:28:19	2022-01-27 16:28:19
319		2fd52ca230cba6a395a820236469a2c0a7951f81-1180-319.jpg	1	_thumb_2fd52ca230cba6a395a820236469a2c0a7951f81-1180-319.png		1	1	2			\N	2022-01-27 16:30:57	2022-01-27 16:30:57
320		4dc797e0783e8a6949793552bf0b00cb2a34c532-1181-320.jpg	1	_thumb_4dc797e0783e8a6949793552bf0b00cb2a34c532-1181-320.png		1	1	2			\N	2022-01-27 16:37:30	2022-01-27 16:37:30
321		23856615fedd8ac08aadae2bd3d30315a72d5aa9-1182-321.jpg	1	_thumb_23856615fedd8ac08aadae2bd3d30315a72d5aa9-1182-321.png		1	1	2			\N	2022-01-27 16:42:32	2022-01-27 16:42:33
323		324540f4c3f06159e9e019dd2255ea2de2fecfbc-1183-323.jpg	1	_thumb_324540f4c3f06159e9e019dd2255ea2de2fecfbc-1183-323.png		1	1	2			\N	2022-01-27 16:46:48	2022-01-27 16:46:48
325		bb253d26b12fdbba57684ed3fd42d8d17561af6f-1185-325.jpg	1	_thumb_bb253d26b12fdbba57684ed3fd42d8d17561af6f-1185-325.png		1	1	2			\N	2022-01-27 16:53:29	2022-01-27 16:53:29
326		44cf3ef9697d1e3f31523ab93fdb949cf4dbc8a8-1186-326.jpg	1	_thumb_44cf3ef9697d1e3f31523ab93fdb949cf4dbc8a8-1186-326.png		1	1	2			\N	2022-01-27 16:55:55	2022-01-27 16:55:55
327		e9999a1273dfcb8ec54b3a0e17f2308c7fb4cb51-1187-327.jpg	1	_thumb_e9999a1273dfcb8ec54b3a0e17f2308c7fb4cb51-1187-327.png		1	1	2			\N	2022-01-31 13:54:11	2022-01-31 13:54:11
328		a812b16b2b3f94f77f5a269a755adefd74d9e671-1188-328.jpg	1	_thumb_a812b16b2b3f94f77f5a269a755adefd74d9e671-1188-328.png		1	1	2			\N	2022-01-31 18:26:40	2022-01-31 18:26:40
330		16e72a7cd68e751cc4e3eb0a5602c22c76e3637c-1189-330.jpg	1	_thumb_16e72a7cd68e751cc4e3eb0a5602c22c76e3637c-1189-330.png		1	1	2			\N	2022-01-31 18:52:50	2022-01-31 18:52:50
331		1882470263d9673bd8e43fae7406e839497ca3b8-1190-331.jpg	1	_thumb_1882470263d9673bd8e43fae7406e839497ca3b8-1190-331.png		1	1	2			\N	2022-01-31 18:55:21	2022-01-31 18:55:21
332		251a5b1e5fc17d3ceb4ec7759b2cc2bc02aa88dc-1191-332.jpg	1	_thumb_251a5b1e5fc17d3ceb4ec7759b2cc2bc02aa88dc-1191-332.png		1	1	2			\N	2022-01-31 19:02:10	2022-01-31 19:02:10
333		a9f1de76af8ec687ce791d3cbdbf631bc07f9bca-1192-333.jpg	1	_thumb_a9f1de76af8ec687ce791d3cbdbf631bc07f9bca-1192-333.png		1	1	2			\N	2022-01-31 19:04:05	2022-01-31 19:04:05
334		6349aa86cabc5af279642ddfb9010d3d59aa1363-1193-334.jpg	1	_thumb_6349aa86cabc5af279642ddfb9010d3d59aa1363-1193-334.png		1	1	2			\N	2022-02-01 14:36:02	2022-02-01 14:36:02
335		c5d30019e7ec6faebe77c96592c4db44e0adb679-1194-335.jpg	1	_thumb_c5d30019e7ec6faebe77c96592c4db44e0adb679-1194-335.png		1	1	2			\N	2022-02-01 14:37:41	2022-02-01 14:37:41
337		6b72adfb0ddb15438c7f43deeb92dee40426ee8f-1195-337.jpg	1	_thumb_6b72adfb0ddb15438c7f43deeb92dee40426ee8f-1195-337.png		1	1	2			\N	2022-02-01 14:45:57	2022-02-01 14:45:57
338		52727e9b0630b9261fa26e7f27ac3e7cf7c43418-1196-338.jpg	1	_thumb_52727e9b0630b9261fa26e7f27ac3e7cf7c43418-1196-338.png		1	1	2			\N	2022-02-01 14:48:27	2022-02-01 14:48:27
339		b6ab4f2247dd0ee6c7c860f38115d7a6f5e35143-1197-339.jpg	1	_thumb_b6ab4f2247dd0ee6c7c860f38115d7a6f5e35143-1197-339.png		1	1	2			\N	2022-02-01 14:52:38	2022-02-01 14:52:38
340		9bb8980e09b383940277d34dd924134e7eb6edd7-1199-340.jpg	1	_thumb_9bb8980e09b383940277d34dd924134e7eb6edd7-1199-340.png		1	1	2			\N	2022-02-01 14:58:44	2022-02-01 14:58:44
341		f8e60563d0b8c3df02846c3c26b0ab3fae9e8dec-1200-341.jpg	1	_thumb_f8e60563d0b8c3df02846c3c26b0ab3fae9e8dec-1200-341.png		1	1	2			\N	2022-02-01 15:01:36	2022-02-01 15:01:36
342		877e09eafabe4b04a640c25ed520c22dadad3787-1201-342.jpg	1	_thumb_877e09eafabe4b04a640c25ed520c22dadad3787-1201-342.png		1	1	2			\N	2022-02-01 15:03:22	2022-02-01 15:03:22
343		cf2343b818a0ce5b5e62b62c8074b47fe76b5313-1202-343.jpg	1	_thumb_cf2343b818a0ce5b5e62b62c8074b47fe76b5313-1202-343.png		1	1	2			\N	2022-02-01 15:08:16	2022-02-01 15:08:16
344		524227cf52e96b0fb8a71bde96f89ae6bded82eb-1203-344.jpg	1	_thumb_524227cf52e96b0fb8a71bde96f89ae6bded82eb-1203-344.png		1	1	2			\N	2022-02-01 15:32:09	2022-02-01 15:32:09
345		d8b28cf779f5bac4fa484e79180f3d2a67256ea5-1204-345.jpg	1	_thumb_d8b28cf779f5bac4fa484e79180f3d2a67256ea5-1204-345.png		1	1	2			\N	2022-02-01 15:34:15	2022-02-01 15:34:15
346		7ab8c71d62819533426a27a3a6d5b51dfa4a3bc2-1205-346.jpg	1	_thumb_7ab8c71d62819533426a27a3a6d5b51dfa4a3bc2-1205-346.png		1	1	2			\N	2022-02-01 15:40:34	2022-02-01 15:40:34
347		e855196ba5587e695911fc5aeb76444fbf333dc9-1206-347.jpg	1	_thumb_e855196ba5587e695911fc5aeb76444fbf333dc9-1206-347.png		1	1	2			\N	2022-02-01 15:43:27	2022-02-01 15:43:27
348		0c3cc5ccf39c87e90acab040bf5efeeebd3419a1-1207-348.jpg	1	_thumb_0c3cc5ccf39c87e90acab040bf5efeeebd3419a1-1207-348.png		1	1	2			\N	2022-02-01 15:57:04	2022-02-01 15:57:04
349		1c5ac02b9889d9d6fc561b513d81ae478a0978f6-1208-349.jpg	1	_thumb_1c5ac02b9889d9d6fc561b513d81ae478a0978f6-1208-349.png		1	1	2			\N	2022-02-01 15:59:30	2022-02-01 15:59:30
350		aae29165558ee8d94b65d6a10503435b0468f9e8-1209-350.jpg	1	_thumb_aae29165558ee8d94b65d6a10503435b0468f9e8-1209-350.png		1	1	2			\N	2022-02-01 16:01:30	2022-02-01 16:01:30
351		66992645fc71491ee45873e2b0f0d888f059719e-1210-351.jpg	1	_thumb_66992645fc71491ee45873e2b0f0d888f059719e-1210-351.png		1	1	2			\N	2022-02-01 16:27:51	2022-02-01 16:27:51
352		7f707c45b9e062caadae7be9c8384c79e4ced68f-1211-352.jpg	1	_thumb_7f707c45b9e062caadae7be9c8384c79e4ced68f-1211-352.png		1	1	2			\N	2022-02-01 16:31:23	2022-02-01 16:31:23
353		0947966a2098f0915a1743428359a4c4602f8567-1212-353.jpg	1	_thumb_0947966a2098f0915a1743428359a4c4602f8567-1212-353.png		1	1	2			\N	2022-02-02 14:19:40	2022-02-02 14:19:40
354		41abd8176c35eeec168e96881dec3dca74e5d418-1213-354.jpg	1	_thumb_41abd8176c35eeec168e96881dec3dca74e5d418-1213-354.png		1	1	2			\N	2022-02-02 14:29:57	2022-02-02 14:29:57
355		155c9f549c3a1188b13a6b96ea8a3bc8cff7757f-1214-355.jpg	1	_thumb_155c9f549c3a1188b13a6b96ea8a3bc8cff7757f-1214-355.png		1	1	2			\N	2022-02-02 14:35:37	2022-02-02 14:35:37
356		e1c0e3ac5fce6fa7fd3d5e2e72dc422faf8a8427-1215-356.jpg	1	_thumb_e1c0e3ac5fce6fa7fd3d5e2e72dc422faf8a8427-1215-356.png		1	1	2			\N	2022-02-02 14:41:56	2022-02-02 14:41:56
357		5d8dd5c6e756c1914c419750cac43ca62a94589f-1216-357.jpg	1	_thumb_5d8dd5c6e756c1914c419750cac43ca62a94589f-1216-357.png		1	1	2			\N	2022-02-02 14:43:57	2022-02-02 14:43:57
358		f3caea82f36a4b362ca630aeb327b39a14198e9c-1218-358.jpg	1	_thumb_f3caea82f36a4b362ca630aeb327b39a14198e9c-1218-358.png		1	1	2			\N	2022-02-02 14:52:53	2022-02-02 14:52:53
359		dcca948218c443b3b4cc05d08fe4472680257053-1219-359.jpg	1	_thumb_dcca948218c443b3b4cc05d08fe4472680257053-1219-359.png		1	1	2			\N	2022-02-02 14:55:31	2022-02-02 14:55:31
360		4665088934760826f42030e7eed1fa06a46e147e-1220-360.jpg	1	_thumb_4665088934760826f42030e7eed1fa06a46e147e-1220-360.png		1	1	2			\N	2022-02-02 14:58:28	2022-02-02 14:58:28
361		a8ddd8471a4cf929e13d64d93d8a585ab19ebb01-1221-361.jpg	1	_thumb_a8ddd8471a4cf929e13d64d93d8a585ab19ebb01-1221-361.png		1	1	2			\N	2022-02-02 15:40:21	2022-02-02 15:40:21
362		09e741bea801188f4ccf1a49140433daa553fb67-1222-362.jpg	1	_thumb_09e741bea801188f4ccf1a49140433daa553fb67-1222-362.png		1	1	2			\N	2022-02-03 13:45:40	2022-02-03 13:45:40
363		485d660d89b9d4887f35b394fb7cc08b1ffea418-1223-363.jpg	1	_thumb_485d660d89b9d4887f35b394fb7cc08b1ffea418-1223-363.png		1	1	2			\N	2022-02-03 13:49:08	2022-02-03 13:49:08
364		d190ca4d6c68619ee542bc9fc71017933a79d79a-1224-364.jpg	1	_thumb_d190ca4d6c68619ee542bc9fc71017933a79d79a-1224-364.png		1	1	2			\N	2022-02-03 13:53:10	2022-02-03 13:53:10
365		402011f63f5f9ffeb6999809544054af7221ed16-1225-365.jpg	1	_thumb_402011f63f5f9ffeb6999809544054af7221ed16-1225-365.png		1	1	2			\N	2022-02-03 13:56:05	2022-02-03 13:56:05
366		dcef82ab23f15f7e1257c2c3e7de8d6e2725168c-1226-366.jpg	1	_thumb_dcef82ab23f15f7e1257c2c3e7de8d6e2725168c-1226-366.png		1	1	2			\N	2022-02-03 14:00:25	2022-02-03 14:00:25
367		48f1476ae154d10089146810944a9ec7e6e263a5-1227-367.jpg	1	_thumb_48f1476ae154d10089146810944a9ec7e6e263a5-1227-367.png		1	1	2			\N	2022-02-03 14:02:59	2022-02-03 14:02:59
368		e1ca23a43ff6c930e969b35679f056ba040ef25c-1228-368.jpg	1	_thumb_e1ca23a43ff6c930e969b35679f056ba040ef25c-1228-368.png		1	1	2			\N	2022-02-03 14:07:54	2022-02-03 14:07:54
369		556ce98a4118d335f716a3dfe24941fb8706eed8-1229-369.jpg	1	_thumb_556ce98a4118d335f716a3dfe24941fb8706eed8-1229-369.png		1	1	2			\N	2022-02-03 14:14:35	2022-02-03 14:14:35
370		92a880c2cbdc27a7a9e7b1688ef9f914fa1563e0-1230-370.jpg	1	_thumb_92a880c2cbdc27a7a9e7b1688ef9f914fa1563e0-1230-370.png		1	1	2			\N	2022-02-03 15:12:23	2022-02-03 15:12:23
372		17dffa6eb763099be93dd8c84daf4a587429e547-1231-372.jpg	1	_thumb_17dffa6eb763099be93dd8c84daf4a587429e547-1231-372.png		1	1	2			\N	2022-02-03 15:14:40	2022-02-03 15:14:40
373		725b51408de8de52430ad75177e8c8255466a89c-1232-373.jpg	1	_thumb_725b51408de8de52430ad75177e8c8255466a89c-1232-373.png		1	1	2			\N	2022-02-03 15:37:40	2022-02-03 15:37:40
374		f0bc4cd5dde8014b074ee59c911264f5b8deb63a-1233-374.jpg	1	_thumb_f0bc4cd5dde8014b074ee59c911264f5b8deb63a-1233-374.png		1	1	2			\N	2022-02-03 15:39:49	2022-02-03 15:39:49
375		682730149267913ba467ea73dcfc542dfd33cbec-1234-375.jpg	1	_thumb_682730149267913ba467ea73dcfc542dfd33cbec-1234-375.png		1	1	2			\N	2022-02-03 15:41:37	2022-02-03 15:41:37
376		7a3a74c983e8c4bada543b6f18f259cfbb6eafd5-1236-376.jpg	1	_thumb_7a3a74c983e8c4bada543b6f18f259cfbb6eafd5-1236-376.png		1	1	2			\N	2022-02-03 15:44:31	2022-02-03 15:44:31
377		449f002b1e98bbf1eba072cc927b77fca5f055b6-1237-377.jpg	1	_thumb_449f002b1e98bbf1eba072cc927b77fca5f055b6-1237-377.png		1	1	2			\N	2022-02-03 15:47:06	2022-02-03 15:47:06
378		d957e6ab3cc8b89d738f922014e8dbb671c4a1ca-1238-378.jpg	1	_thumb_d957e6ab3cc8b89d738f922014e8dbb671c4a1ca-1238-378.png		1	1	2			\N	2022-02-03 15:52:05	2022-02-03 15:52:05
379		e074fb97b5548c319f1bf420de9c5e035b189e17-1239-379.jpg	1	_thumb_e074fb97b5548c319f1bf420de9c5e035b189e17-1239-379.png		1	1	2			\N	2022-02-03 15:55:10	2022-02-03 15:55:10
380		71a3877727c8c825b0b4eb053ed2352a8b052ba9-1240-380.jpg	1	_thumb_71a3877727c8c825b0b4eb053ed2352a8b052ba9-1240-380.png		1	1	2			\N	2022-02-03 16:01:15	2022-02-03 16:01:15
381		79670bb51539f7eca99bb0a0482a30367708541e-1241-381.jpg	1	_thumb_79670bb51539f7eca99bb0a0482a30367708541e-1241-381.png		1	1	2			\N	2022-02-03 16:04:07	2022-02-03 16:04:07
382		3e41cf6d199ac0a06ad3f24c3d598c82ef67ce64-1242-382.jpg	1	_thumb_3e41cf6d199ac0a06ad3f24c3d598c82ef67ce64-1242-382.png		1	1	2			\N	2022-02-03 21:05:50	2022-02-03 21:05:50
383		6125a4d1a4ed186097fc4e23dc5e1a9c54e9d47b-1243-383.jpg	1	_thumb_6125a4d1a4ed186097fc4e23dc5e1a9c54e9d47b-1243-383.png		1	1	2			\N	2022-02-03 21:07:24	2022-02-03 21:07:24
384		2bf8590700bfe066400db2b9b4aaee721dc5a4a8-1245-384.jpg	1	_thumb_2bf8590700bfe066400db2b9b4aaee721dc5a4a8-1245-384.png		1	1	2			\N	2022-02-03 21:10:40	2022-02-03 21:10:40
385		972fdfa420e73d900c2b54f17fa553d1d102932c-1246-385.jpg	1	_thumb_972fdfa420e73d900c2b54f17fa553d1d102932c-1246-385.png		1	1	2			\N	2022-02-04 13:47:53	2022-02-04 13:47:53
386		efabf6c1d4f69e65bf9925b788f6cfced4c9226f-1247-386.jpg	1	_thumb_efabf6c1d4f69e65bf9925b788f6cfced4c9226f-1247-386.png		1	1	2			\N	2022-02-04 13:54:02	2022-02-04 13:54:02
387		00ed9188118fbe989c68e6781e408259d1e79105-1248-387.jpg	1	_thumb_00ed9188118fbe989c68e6781e408259d1e79105-1248-387.png		1	1	2			\N	2022-02-04 14:02:09	2022-02-04 14:02:09
389		ece4c07dda2a6c95ecedfd9f76139dd1d7ee04c5-1249-389.jpg	1	_thumb_ece4c07dda2a6c95ecedfd9f76139dd1d7ee04c5-1249-389.png		1	1	2			\N	2022-02-04 14:04:06	2022-02-04 14:04:07
390		8b0ac5cddd93ce3690c1bf118ed782fd4142cd04-1250-390.jpg	1	_thumb_8b0ac5cddd93ce3690c1bf118ed782fd4142cd04-1250-390.png		1	1	2			\N	2022-02-04 14:06:09	2022-02-04 14:06:09
391		195a79b02ab07bfb073a2a890444f498fce3bdc5-1251-391.jpg	1	_thumb_195a79b02ab07bfb073a2a890444f498fce3bdc5-1251-391.png		1	1	2			\N	2022-02-04 14:08:26	2022-02-04 14:08:26
392		e59ea2689a12b1b500ff05e16b1960722480a562-1252-392.jpg	1	_thumb_e59ea2689a12b1b500ff05e16b1960722480a562-1252-392.png		1	1	2			\N	2022-02-04 14:18:56	2022-02-04 14:18:56
393		1c749f0134511f33cfb3c4c9c98c7e2b194cdbba-1253-393.jpg	1	_thumb_1c749f0134511f33cfb3c4c9c98c7e2b194cdbba-1253-393.png		1	1	2			\N	2022-02-04 14:21:40	2022-02-04 14:21:40
394		986030537171e964402343286edb9e3865fe7933-1254-394.jpg	1	_thumb_986030537171e964402343286edb9e3865fe7933-1254-394.png		1	1	2			\N	2022-02-04 14:24:10	2022-02-04 14:24:10
395		7edf00bbd9731e874326c609a02fb0eb72318ac7-1255-395.jpg	1	_thumb_7edf00bbd9731e874326c609a02fb0eb72318ac7-1255-395.png		1	1	2			\N	2022-02-04 14:26:28	2022-02-04 14:26:28
396		366f3178e8a7606d06925d93328b5f9083227286-1256-396.jpg	1	_thumb_366f3178e8a7606d06925d93328b5f9083227286-1256-396.png		1	1	2			\N	2022-02-04 14:28:55	2022-02-04 14:28:55
397		7f864520e1b787ce006f584f75215ffef4a44575-1257-397.jpg	1	_thumb_7f864520e1b787ce006f584f75215ffef4a44575-1257-397.png		1	1	2			\N	2022-02-04 15:24:47	2022-02-04 15:24:47
398		e0923dc12a478691ca5f56bde3cbd207cc9d4e74-840-398.jpg	1	_thumb_e0923dc12a478691ca5f56bde3cbd207cc9d4e74-840-398.png		1	1	2			\N	2022-02-08 17:17:15	2022-02-08 17:17:15
399		2161a588e5492f61046bd8213593a33f644e39ab-1258-399.jpg	1	_thumb_2161a588e5492f61046bd8213593a33f644e39ab-1258-399.png		1	1	2			\N	2022-02-08 17:37:16	2022-02-08 17:37:16
400		a02451bd3433187b0183c6fdbdc93a2a51d5e276-1259-400.jpg	1	_thumb_a02451bd3433187b0183c6fdbdc93a2a51d5e276-1259-400.png		1	1	2			\N	2022-02-08 18:08:54	2022-02-08 18:08:54
401		96f7477fc83ad8e8664067ea4faf4ab16ab6cb10-1260-401.jpg	1	_thumb_96f7477fc83ad8e8664067ea4faf4ab16ab6cb10-1260-401.png		1	1	2			\N	2022-02-08 18:22:53	2022-02-08 18:22:53
402		47e0a2e0c4c804b6c16601d15ca4a35c3f926e96-1261-402.jpg	1	_thumb_47e0a2e0c4c804b6c16601d15ca4a35c3f926e96-1261-402.png		1	1	2			\N	2022-02-08 19:05:12	2022-02-08 19:05:12
403		a0a91cf8e922e3562d9d0cbb50a50e263e0f8a2e-1262-403.jpg	1	_thumb_a0a91cf8e922e3562d9d0cbb50a50e263e0f8a2e-1262-403.png		1	1	2			\N	2022-02-08 19:16:09	2022-02-08 19:16:09
404		d773095e6a495cf9bae6aeae6852a6806971a04e-1264-404.jpg	1	_thumb_d773095e6a495cf9bae6aeae6852a6806971a04e-1264-404.png		1	1	2			\N	2022-02-08 19:24:08	2022-02-08 19:24:08
405		dd469161848ecb0f36deb32b46a7d397c268b483-1265-405.jpg	1	_thumb_dd469161848ecb0f36deb32b46a7d397c268b483-1265-405.png		1	1	2			\N	2022-02-08 19:30:44	2022-02-08 19:30:44
406		9d495bc8b0b8b2e30a4fefc0ee20b34d010a1e79-1266-406.jpg	1	_thumb_9d495bc8b0b8b2e30a4fefc0ee20b34d010a1e79-1266-406.png		1	1	2			\N	2022-02-08 19:33:12	2022-02-08 19:33:12
407		1e2f4ffe0383842e27d2d300d9fd30715d69a69b-1267-407.jpg	1	_thumb_1e2f4ffe0383842e27d2d300d9fd30715d69a69b-1267-407.png		1	1	2			\N	2022-02-08 19:35:30	2022-02-08 19:35:30
408		492ff2d16393786ecdef97cf1a34c8fd67e20a15-1268-408.jpg	1	_thumb_492ff2d16393786ecdef97cf1a34c8fd67e20a15-1268-408.png		1	1	2			\N	2022-02-08 20:21:37	2022-02-08 20:21:37
409		acaa4367af1033b97f50be864023d05fada5c047-1269-409.jpg	1	_thumb_acaa4367af1033b97f50be864023d05fada5c047-1269-409.png		1	1	2			\N	2022-02-08 20:32:19	2022-02-08 20:32:19
410		bfc599fd0aa0a0b0598ccad179afcd807e741be3-1270-410.jpg	1	_thumb_bfc599fd0aa0a0b0598ccad179afcd807e741be3-1270-410.png		1	1	2			\N	2022-02-08 20:51:40	2022-02-08 20:51:40
411		79e823a3accc51422ae3345188d1c45ae26026b7-1271-411.jpg	1	_thumb_79e823a3accc51422ae3345188d1c45ae26026b7-1271-411.png		1	1	2			\N	2022-02-08 22:18:51	2022-02-08 22:18:51
412		70b6695f67bd584ec08889821986286b2903114a-1272-412.jpg	1	_thumb_70b6695f67bd584ec08889821986286b2903114a-1272-412.png		1	1	2			\N	2022-02-08 22:30:04	2022-02-08 22:30:04
413		64963f51535c37b25a835ea08031e5f0ce02a2dc-1273-413.jpg	1	_thumb_64963f51535c37b25a835ea08031e5f0ce02a2dc-1273-413.png		1	1	2			\N	2022-02-08 22:43:01	2022-02-08 22:43:01
414		4b9a5507a2b5391921b703e40d588f755ae2daae-1274-414.jpg	1	_thumb_4b9a5507a2b5391921b703e40d588f755ae2daae-1274-414.png		1	1	2			\N	2022-02-08 22:48:56	2022-02-08 22:48:56
415		26e5480c3a686649e649652044adb68c9506e457-1275-415.jpg	1	_thumb_26e5480c3a686649e649652044adb68c9506e457-1275-415.png		1	1	2			\N	2022-02-08 22:53:04	2022-02-08 22:53:04
416		c7566acc41374d06b1dc0acc2c418967a8ac5de8-1276-416.jpg	1	_thumb_c7566acc41374d06b1dc0acc2c418967a8ac5de8-1276-416.png		1	1	2			\N	2022-02-08 22:59:34	2022-02-08 22:59:34
417		e96f878ba20da153c6b386c89f3a23eb19d70e6a-1277-417.jpg	1	_thumb_e96f878ba20da153c6b386c89f3a23eb19d70e6a-1277-417.png		1	1	2			\N	2022-02-08 23:07:15	2022-02-08 23:07:15
418		f8baeb2835b039145184fb41e567bea7000762df-1278-418.jpg	1	_thumb_f8baeb2835b039145184fb41e567bea7000762df-1278-418.png		1	1	2			\N	2022-02-08 23:12:25	2022-02-08 23:12:25
419		3ae2edd0db583f7f4e69d6b74838ed9acbd9e754-1279-419.jpg	1	_thumb_3ae2edd0db583f7f4e69d6b74838ed9acbd9e754-1279-419.png		1	1	2			\N	2022-02-08 23:22:04	2022-02-08 23:22:04
420		5507d96518992c2a54f9a0eac2a0d2be24459a0e-1280-420.jpg	1	_thumb_5507d96518992c2a54f9a0eac2a0d2be24459a0e-1280-420.png		1	1	2			\N	2022-02-08 23:26:14	2022-02-08 23:26:14
421		94e5e58b2021708c2fa5a999268b910239433514-1281-421.jpg	1	_thumb_94e5e58b2021708c2fa5a999268b910239433514-1281-421.png		1	1	2			\N	2022-02-08 23:35:16	2022-02-08 23:35:16
422		3b6dc4b501a957a5eefd8f0393a08895efbc0980-1282-422.jpg	1	_thumb_3b6dc4b501a957a5eefd8f0393a08895efbc0980-1282-422.png		1	1	2			\N	2022-02-08 23:39:21	2022-02-08 23:39:21
423		f06a87e630cccfeb95ecf9c983d71516baed13f9-1283-423.jpg	1	_thumb_f06a87e630cccfeb95ecf9c983d71516baed13f9-1283-423.png		1	1	2			\N	2022-02-08 23:42:57	2022-02-08 23:42:57
424		cd7529e002c71c81822d1764d4976fe1c767912a-1284-424.jpg	1	_thumb_cd7529e002c71c81822d1764d4976fe1c767912a-1284-424.png		1	1	2			\N	2022-02-08 23:46:20	2022-02-08 23:46:20
425		fc8e0f0d58183ab8155fd6ca1501f3bd6c3c27e0-1285-425.jpg	1	_thumb_fc8e0f0d58183ab8155fd6ca1501f3bd6c3c27e0-1285-425.png		1	1	2			\N	2022-02-08 23:48:37	2022-02-08 23:48:37
426		990712d9275a8b362e803f159397dcc97901f94e-1286-426.jpg	1	_thumb_990712d9275a8b362e803f159397dcc97901f94e-1286-426.png		1	1	2			\N	2022-02-09 13:39:30	2022-02-09 13:39:30
427		dc180502d46321f8e12ece1f7a3dd202ed6eb9ba-1287-427.jpg	1	_thumb_dc180502d46321f8e12ece1f7a3dd202ed6eb9ba-1287-427.png		1	1	2			\N	2022-02-09 13:44:13	2022-02-09 13:44:13
428		a611e5e12cfdcde3f43e6d80711f6f439bc93c7a-1288-428.jpg	1	_thumb_a611e5e12cfdcde3f43e6d80711f6f439bc93c7a-1288-428.png		1	1	2			\N	2022-02-09 13:47:49	2022-02-09 13:47:49
429		399e35479a4508ba4105ca170f968c784f6271b8-1289-429.jpg	1	_thumb_399e35479a4508ba4105ca170f968c784f6271b8-1289-429.png		1	1	2			\N	2022-02-09 13:53:01	2022-02-09 13:53:01
430		18971b8d852e46149749de4a03c5f10b7f43595c-1290-430.jpg	1	_thumb_18971b8d852e46149749de4a03c5f10b7f43595c-1290-430.png		1	1	2			\N	2022-02-09 14:11:26	2022-02-09 14:11:26
431		6c7bed8c2118fe228f242f63b2520dc2f812ef64-1291-431.jpg	1	_thumb_6c7bed8c2118fe228f242f63b2520dc2f812ef64-1291-431.png		1	1	2			\N	2022-02-09 14:23:56	2022-02-09 14:23:56
432		c4310134851f9caa0fb46d96f390934061f2c038-1292-432.jpg	1	_thumb_c4310134851f9caa0fb46d96f390934061f2c038-1292-432.png		1	1	2			\N	2022-02-09 14:27:15	2022-02-09 14:27:15
433		b7027ab0ac4b27c08ef564a5f00667293bffdc90-1293-433.jpg	1	_thumb_b7027ab0ac4b27c08ef564a5f00667293bffdc90-1293-433.png		1	1	2			\N	2022-02-09 15:11:13	2022-02-09 15:11:14
434		2251109f684fd64a538ad39f072c44fdb5f96088-1294-434.jpg	1	_thumb_2251109f684fd64a538ad39f072c44fdb5f96088-1294-434.png		1	1	2			\N	2022-02-09 15:13:59	2022-02-09 15:13:59
435		d5626467b73f2ad8562eca70dd3499fa55325470-1295-435.jpg	1	_thumb_d5626467b73f2ad8562eca70dd3499fa55325470-1295-435.png		1	1	2			\N	2022-02-09 15:16:44	2022-02-09 15:16:44
436		0008a2512f08a41124c9d9035e5dc6b0dbb8ac2a-1296-436.jpg	1	_thumb_0008a2512f08a41124c9d9035e5dc6b0dbb8ac2a-1296-436.png		1	1	2			\N	2022-02-09 15:18:47	2022-02-09 15:18:47
437		5ee5920323bcca1bb83ac1a29c012cc3c2fd8546-1297-437.jpg	1	_thumb_5ee5920323bcca1bb83ac1a29c012cc3c2fd8546-1297-437.png		1	1	2			\N	2022-02-09 15:24:29	2022-02-09 15:24:29
438		0ea4c3c91b420a712b9f14908a73081d531776e4-1298-438.jpg	1	_thumb_0ea4c3c91b420a712b9f14908a73081d531776e4-1298-438.png		1	1	2			\N	2022-02-09 15:29:04	2022-02-09 15:29:04
439		31f54e3e7b6bfe0b422616dca9b491b9f87e4d84-1299-439.jpg	1	_thumb_31f54e3e7b6bfe0b422616dca9b491b9f87e4d84-1299-439.png		1	1	2			\N	2022-02-09 15:32:12	2022-02-09 15:32:12
440		28bf9db265bf4a73dcd890f41a894ff3f4c3418d-1300-440.jpg	1	_thumb_28bf9db265bf4a73dcd890f41a894ff3f4c3418d-1300-440.png		1	1	2			\N	2022-02-09 15:45:19	2022-02-09 15:45:19
441		b72355d6805d30be257c17aeb5b64c7bc6869587-1301-441.jpg	1	_thumb_b72355d6805d30be257c17aeb5b64c7bc6869587-1301-441.png		1	1	2			\N	2022-02-10 13:27:54	2022-02-10 13:27:54
442		3d02f21dc1468306c97041ff10535af899294cb8-1302-442.jpg	1	_thumb_3d02f21dc1468306c97041ff10535af899294cb8-1302-442.png		1	1	2			\N	2022-02-10 13:30:59	2022-02-10 13:30:59
444		06b209c3fd6543518174f72d551875cb15f6e6a5-1303-444.jpg	1	_thumb_06b209c3fd6543518174f72d551875cb15f6e6a5-1303-444.png		1	1	2			\N	2022-02-10 13:36:53	2022-02-10 13:36:53
451		0658133485f12a739c24e94e3dbc264cbabbb348-1308-451.jpg	1	_thumb_0658133485f12a739c24e94e3dbc264cbabbb348-1308-451.png		1	1	2			\N	2022-02-10 14:37:45	2022-02-10 14:37:45
446		eebd3be1d20b1c47cef16770e82a036c9b2bdea3-1304-446.jpg	1	_thumb_eebd3be1d20b1c47cef16770e82a036c9b2bdea3-1304-446.png		1	1	2			\N	2022-02-10 13:42:00	2022-02-10 13:42:00
447		c76325d8e2684531e16c2b547c257529548c35d3-1305-447.jpg	1	_thumb_c76325d8e2684531e16c2b547c257529548c35d3-1305-447.png		1	1	2			\N	2022-02-10 13:47:03	2022-02-10 13:47:03
449		8bdc4b7e9eac50f1995e3100b5ca9a822f4389cb-1306-449.jpg	1	_thumb_8bdc4b7e9eac50f1995e3100b5ca9a822f4389cb-1306-449.png		1	1	2			\N	2022-02-10 14:20:38	2022-02-10 14:20:38
450		c863c3dc206989cf5234689dcc1523a1866447da-1307-450.jpg	1	_thumb_c863c3dc206989cf5234689dcc1523a1866447da-1307-450.png		1	1	2			\N	2022-02-10 14:32:39	2022-02-10 14:32:39
452		1e26acc92760c2f344ba763b61831626aa70c87d-1309-452.jpg	1	_thumb_1e26acc92760c2f344ba763b61831626aa70c87d-1309-452.png		1	1	2			\N	2022-02-10 15:13:00	2022-02-10 15:13:00
453		c7807e127545734f416991dd990596ce3ec44daf-1310-453.jpg	1	_thumb_c7807e127545734f416991dd990596ce3ec44daf-1310-453.png		1	1	2			\N	2022-02-10 15:16:25	2022-02-10 15:16:25
454		62118e0f4d318ef74b8f1a26d2c57fe757da661d-1311-454.jpg	1	_thumb_62118e0f4d318ef74b8f1a26d2c57fe757da661d-1311-454.png		1	1	2			\N	2022-02-10 15:27:16	2022-02-10 15:27:16
455		ec87bb8d7cccee9d630010f820cd45dc5fe71ebf-1312-455.jpg	1	_thumb_ec87bb8d7cccee9d630010f820cd45dc5fe71ebf-1312-455.png		1	1	2			\N	2022-02-10 15:29:26	2022-02-10 15:29:26
456		d9da824972d987bb3fbfb65fc1ed11e5ab9d191d-1313-456.jpg	1	_thumb_d9da824972d987bb3fbfb65fc1ed11e5ab9d191d-1313-456.png		1	1	2			\N	2022-02-10 18:13:34	2022-02-10 18:13:34
457		855bfece29a710c9bdf2fb2ca2e11ce2754c031b-1314-457.jpg	1	_thumb_855bfece29a710c9bdf2fb2ca2e11ce2754c031b-1314-457.png		1	1	2			\N	2022-02-10 18:19:15	2022-02-10 18:19:15
458		faee5a28c6f3829e6d2bc8629803bb819d1dddd0-1315-458.jpg	1	_thumb_faee5a28c6f3829e6d2bc8629803bb819d1dddd0-1315-458.png		1	1	2			\N	2022-02-10 18:22:53	2022-02-10 18:22:54
459		a3939deabce2177b38adbbfb2b0b40692091bd83-1317-459.jpg	1	_thumb_a3939deabce2177b38adbbfb2b0b40692091bd83-1317-459.png		1	1	2			\N	2022-02-10 19:34:31	2022-02-10 19:34:31
460		da7f796f3f8d37f7478295a78342aea9425aca8b-1318-460.jpg	1	_thumb_da7f796f3f8d37f7478295a78342aea9425aca8b-1318-460.png		1	1	2			\N	2022-02-10 19:36:58	2022-02-10 19:36:58
461		5831cac6425a890b8fbef114e64db8a6c6cb64b3-1319-461.jpg	1	_thumb_5831cac6425a890b8fbef114e64db8a6c6cb64b3-1319-461.png		1	1	2			\N	2022-02-10 23:57:32	2022-02-10 23:57:32
\.


--
-- TOC entry 2798 (class 0 OID 44074)
-- Dependencies: 223
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 44091)
-- Dependencies: 225
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_user (id, user_id, role_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N
2	2	2	\N	\N	\N
\.


--
-- TOC entry 2795 (class 0 OID 44035)
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
-- TOC entry 2805 (class 0 OID 44149)
-- Dependencies: 230
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 44222)
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
-- TOC entry 2778 (class 0 OID 43873)
-- Dependencies: 203
-- Data for Name: user_adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_adress (id, calle, num_ext, num_int, colonia, localidad, municipio, estado, pais, cp, user_id, deleted_at, created_at, updated_at) FROM stdin;
1							TABASCO	MÉXICO		1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2							TABASCO	MÉXICO		2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2780 (class 0 OID 43898)
-- Dependencies: 205
-- Data for Name: user_extend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_extend (id, ocupacion, profesion, lugar_trabajo, lugar_nacimiento, user_id, deleted_at, created_at, updated_at) FROM stdin;
1					1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2					2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2782 (class 0 OID 43918)
-- Dependencies: 207
-- Data for Name: user_social; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_social (id, red_social, username_red_social, alias_red_social, user_id, deleted_at, created_at, updated_at) FROM stdin;
1				1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2				2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 2776 (class 0 OID 43830)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, nombre, ap_paterno, ap_materno, curp, emails, celulares, telefonos, fecha_nacimiento, genero, root, filename, filename_png, filename_thumb, admin, session_id, status_user, empresa_id, creado_por_id, user_id_anterior, ip, host, logged, logged_at, logout_at, email_verified_at, id_sistema_anterior, deleted_at, remember_token, created_at, updated_at, searchtext) FROM stdin;
1	Admin	sentauro@gmail.com	$2y$10$aRnBNUUWDzO8tw5cKPXrYun.nTTHLZ2E.vpPoluNBqFpgaxRbYnf6	Administrador	\N	\N					\N	1	profile/	1.png	_1_.png	_thumb_1.png	t	\N	1	1	1	0	192.168.255.1	192.168.255.1	f	\N	\N	2021-10-01 20:45:41	0	\N	wGolBtHStaAsRyBUl95GPkH7DpEj2T1mNJwsgn9vrhLFZPQEQjF7MlaHFhWT	2021-10-01 20:45:41	2021-10-01 21:00:06	'administr':1
2	SysOp	sysop@example.com	$2y$10$r6CkO9lCsJkmryvqSge/l.ChypwxQsqEkCPMuWLEoK1UPMGEcAvvO	System Operator	\N	\N					\N	0	profile/	2.jpg	_2_.png	_thumb_2.png	f	\N	1	1	1	0	187.141.121.144	187.141.121.144	f	\N	\N	2021-10-01 20:45:41	0	\N	eGgVQr9mN74ac0QCzVbZ1SWMYS35S9mkaR3gtdWpx5en8DwcggLh1hLrowMv	2021-10-01 20:45:41	2021-10-11 17:14:08	'operator':2 'system':1
\.


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 208
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 1, false);


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 231
-- Name: codigopaises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.codigopaises_id_seq', 1, false);


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 243
-- Name: editoriale_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriale_libro_id_seq', 1, false);


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 233
-- Name: editoriales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_seq', 250, true);


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 198
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresas_id_seq', 1, true);


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 215
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 247
-- Name: historiallibros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historiallibros_id_seq', 1, false);


--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 212
-- Name: imagen_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagen_user_id_seq', 1, false);


--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 210
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_id_seq', 1, false);


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 245
-- Name: inventariolibro_portada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventariolibro_portada_id_seq', 608, true);


--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 239
-- Name: inventariolibros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventariolibros_id_seq', 645, true);


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 249
-- Name: libro_portada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_portada_id_seq', 461, true);


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 237
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_seq', 1319, true);


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 196
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 37, true);


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 228
-- Name: permission_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_role_id_seq', 1, false);


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 226
-- Name: permission_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_user_id_seq', 2, true);


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 217
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 11, true);


--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 241
-- Name: portadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portadas_id_seq', 461, true);


--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 224
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_user_id_seq', 2, true);


--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipomaterial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipomaterial_id_seq', 4, true);


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_adress_id_seq', 2, true);


--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_extend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_extend_id_seq', 2, true);


--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_social_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_social_id_seq', 2, true);


--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 2484 (class 2606 OID 43940)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 44172)
-- Name: codigopaises codigopaises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 44405)
-- Name: editoriale_libro editoriale_libro_editoriale_id_libro_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_editoriale_id_libro_id_unique UNIQUE (editoriale_id, libro_id);


--
-- TOC entry 2581 (class 2606 OID 44403)
-- Name: editoriale_libro editoriale_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 44219)
-- Name: editoriales editoriales_editorial_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_editorial_unique UNIQUE (editorial);


--
-- TOC entry 2544 (class 2606 OID 44204)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 40749)
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 44015)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 44017)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2591 (class 2606 OID 44462)
-- Name: historiallibros historiallibros_libro_id_inventariolibro_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_libro_id_inventariolibro_id_user_id_unique UNIQUE (libro_id, inventariolibro_id, user_id);


--
-- TOC entry 2593 (class 2606 OID 44455)
-- Name: historiallibros historiallibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 43982)
-- Name: imagen_user imagen_user_imagen_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_imagen_id_user_id_unique UNIQUE (imagen_id, user_id);


--
-- TOC entry 2493 (class 2606 OID 43980)
-- Name: imagen_user imagen_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 43958)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 44427)
-- Name: inventariolibro_portada inventariolibro_portada_inventariolibro_id_portada_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_inventariolibro_id_portada_id_unique UNIQUE (inventariolibro_id, portada_id);


--
-- TOC entry 2585 (class 2606 OID 44425)
-- Name: inventariolibro_portada inventariolibro_portada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 44320)
-- Name: inventariolibros inventariolibros_codebar_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_codebar_unique UNIQUE (codebar);


--
-- TOC entry 2568 (class 2606 OID 44318)
-- Name: inventariolibros inventariolibros_isbn_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_isbn_unique UNIQUE (isbn);


--
-- TOC entry 2570 (class 2606 OID 44316)
-- Name: inventariolibros inventariolibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 58492)
-- Name: libro_portada libro_portada_libro_id_portada_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_libro_id_portada_id_unique UNIQUE (libro_id, portada_id);


--
-- TOC entry 2598 (class 2606 OID 58490)
-- Name: libro_portada libro_portada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 44268)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 58462)
-- Name: libros libros_titulo_autor_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_titulo_autor_unique UNIQUE (titulo, autor);


--
-- TOC entry 2465 (class 2606 OID 40733)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 44062)
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- TOC entry 2515 (class 2606 OID 44073)
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- TOC entry 2527 (class 2606 OID 44136)
-- Name: permission_role permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 44138)
-- Name: permission_role permission_role_role_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_permission_id_unique UNIQUE (role_id, permission_id);


--
-- TOC entry 2523 (class 2606 OID 44116)
-- Name: permission_user permission_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 44118)
-- Name: permission_user permission_user_user_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_permission_id_unique UNIQUE (user_id, permission_id);


--
-- TOC entry 2501 (class 2606 OID 44032)
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 2503 (class 2606 OID 44030)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 44369)
-- Name: portadas portadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 44088)
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 2519 (class 2606 OID 44096)
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 44098)
-- Name: role_user role_user_user_id_role_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_role_id_unique UNIQUE (user_id, role_id);


--
-- TOC entry 2505 (class 2606 OID 44050)
-- Name: roles roles_abreviatura_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_abreviatura_unique UNIQUE (abreviatura);


--
-- TOC entry 2507 (class 2606 OID 44048)
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 2509 (class 2606 OID 44046)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 44156)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 44230)
-- Name: tipomaterial tipomaterial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 43890)
-- Name: user_adress user_adress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 43910)
-- Name: user_extend user_extend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend
    ADD CONSTRAINT user_extend_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 43926)
-- Name: user_social user_social_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social
    ADD CONSTRAINT user_social_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 43854)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 43866)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 2534 (class 1259 OID 44184)
-- Name: codigopaises_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_creado_por_id_index ON public.codigopaises USING btree (creado_por_id);


--
-- TOC entry 2535 (class 1259 OID 44173)
-- Name: codigopaises_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_empresa_id_index ON public.codigopaises USING btree (empresa_id);


--
-- TOC entry 2536 (class 1259 OID 44185)
-- Name: codigopaises_migration_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_migration_id_index ON public.codigopaises USING btree (migration_id);


--
-- TOC entry 2539 (class 1259 OID 44207)
-- Name: editoriales_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_creado_por_id_index ON public.editoriales USING btree (creado_por_id);


--
-- TOC entry 2542 (class 1259 OID 44206)
-- Name: editoriales_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_empresa_id_index ON public.editoriales USING btree (empresa_id);


--
-- TOC entry 2545 (class 1259 OID 44205)
-- Name: editoriales_predeterminado_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_predeterminado_index ON public.editoriales USING btree (predeterminado);


--
-- TOC entry 2546 (class 1259 OID 44497)
-- Name: editoriales_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_searchtext_gin ON public.editoriales USING gin (searchtext);


--
-- TOC entry 2586 (class 1259 OID 44460)
-- Name: historiallibros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_creado_por_id_index ON public.historiallibros USING btree (creado_por_id);


--
-- TOC entry 2587 (class 1259 OID 44459)
-- Name: historiallibros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_empresa_id_index ON public.historiallibros USING btree (empresa_id);


--
-- TOC entry 2588 (class 1259 OID 44457)
-- Name: historiallibros_inventariolibro_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_inventariolibro_id_index ON public.historiallibros USING btree (inventariolibro_id);


--
-- TOC entry 2589 (class 1259 OID 44456)
-- Name: historiallibros_libro_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_libro_id_index ON public.historiallibros USING btree (libro_id);


--
-- TOC entry 2594 (class 1259 OID 44458)
-- Name: historiallibros_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_user_id_index ON public.historiallibros USING btree (user_id);


--
-- TOC entry 2489 (class 1259 OID 43993)
-- Name: imagen_user_imagen_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagen_user_imagen_id_index ON public.imagen_user USING btree (imagen_id);


--
-- TOC entry 2494 (class 1259 OID 43994)
-- Name: imagen_user_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagen_user_user_id_index ON public.imagen_user USING btree (user_id);


--
-- TOC entry 2485 (class 1259 OID 43960)
-- Name: imagenes_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagenes_creado_por_id_index ON public.imagenes USING btree (creado_por_id);


--
-- TOC entry 2488 (class 1259 OID 43959)
-- Name: imagenes_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagenes_user_id_index ON public.imagenes USING btree (user_id);


--
-- TOC entry 2561 (class 1259 OID 44323)
-- Name: inventariolibros_apartado_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_apartado_user_id_index ON public.inventariolibros USING btree (apartado_user_id);


--
-- TOC entry 2564 (class 1259 OID 44326)
-- Name: inventariolibros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_creado_por_id_index ON public.inventariolibros USING btree (creado_por_id);


--
-- TOC entry 2565 (class 1259 OID 44324)
-- Name: inventariolibros_editorial_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_editorial_id_index ON public.inventariolibros USING btree (editorial_id);


--
-- TOC entry 2566 (class 1259 OID 44325)
-- Name: inventariolibros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_empresa_id_index ON public.inventariolibros USING btree (empresa_id);


--
-- TOC entry 2571 (class 1259 OID 44322)
-- Name: inventariolibros_prestado_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_prestado_user_id_index ON public.inventariolibros USING btree (prestado_user_id);


--
-- TOC entry 2572 (class 1259 OID 58522)
-- Name: inventariolibros_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_searchtext_gin ON public.inventariolibros USING gin (searchtext);


--
-- TOC entry 2573 (class 1259 OID 44321)
-- Name: inventariolibros_uuid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_uuid_index ON public.inventariolibros USING btree (uuid);


--
-- TOC entry 2552 (class 1259 OID 44272)
-- Name: libros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_creado_por_id_index ON public.libros USING btree (creado_por_id);


--
-- TOC entry 2553 (class 1259 OID 44271)
-- Name: libros_editorial_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_editorial_id_index ON public.libros USING btree (editorial_id);


--
-- TOC entry 2554 (class 1259 OID 44273)
-- Name: libros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_empresa_id_index ON public.libros USING btree (empresa_id);


--
-- TOC entry 2557 (class 1259 OID 58520)
-- Name: libros_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_searchtext_gin ON public.libros USING gin (searchtext);


--
-- TOC entry 2558 (class 1259 OID 44269)
-- Name: libros_tipo_material_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_tipo_material_id_index ON public.libros USING btree (tipo_material_id);


--
-- TOC entry 2510 (class 1259 OID 44054)
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- TOC entry 2513 (class 1259 OID 44066)
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- TOC entry 2495 (class 1259 OID 44003)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2574 (class 1259 OID 44373)
-- Name: portadas_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX portadas_creado_por_id_index ON public.portadas USING btree (creado_por_id);


--
-- TOC entry 2575 (class 1259 OID 44372)
-- Name: portadas_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX portadas_empresa_id_index ON public.portadas USING btree (empresa_id);


--
-- TOC entry 2468 (class 1259 OID 43995)
-- Name: searchtext_user_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX searchtext_user_gin ON public.users USING gin (searchtext);


--
-- TOC entry 2530 (class 1259 OID 44158)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 2533 (class 1259 OID 44157)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 2547 (class 1259 OID 44232)
-- Name: tipomaterial_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipomaterial_creado_por_id_index ON public.tipomaterial USING btree (creado_por_id);


--
-- TOC entry 2548 (class 1259 OID 44231)
-- Name: tipomaterial_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipomaterial_empresa_id_index ON public.tipomaterial USING btree (empresa_id);


--
-- TOC entry 2551 (class 1259 OID 44495)
-- Name: tm_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tm_searchtext_gin ON public.tipomaterial USING gin (searchtext);


--
-- TOC entry 2469 (class 1259 OID 43869)
-- Name: users_logged_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logged_at_index ON public.users USING btree (logged_at);


--
-- TOC entry 2470 (class 1259 OID 43868)
-- Name: users_logged_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logged_index ON public.users USING btree (logged);


--
-- TOC entry 2471 (class 1259 OID 43870)
-- Name: users_logout_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logout_at_index ON public.users USING btree (logout_at);


--
-- TOC entry 2474 (class 1259 OID 43867)
-- Name: users_user_id_anterior_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_id_anterior_index ON public.users USING btree (user_id_anterior);


--
-- TOC entry 2645 (class 2620 OID 43996)
-- Name: users ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.users FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'ap_paterno', 'ap_materno', 'nombre', 'curp');


--
-- TOC entry 2647 (class 2620 OID 44496)
-- Name: tipomaterial ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.tipomaterial FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'tipo_material');


--
-- TOC entry 2646 (class 2620 OID 44498)
-- Name: editoriales ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.editoriales FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'editorial', 'representante', 'telefonos', 'email');


--
-- TOC entry 2648 (class 2620 OID 58521)
-- Name: libros ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.libros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'titulo', 'autor');


--
-- TOC entry 2649 (class 2620 OID 58523)
-- Name: inventariolibros ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.inventariolibros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'isbn', 'clasificacion', 'edicion', 'codebar', 'etiqueta_smarth');


--
-- TOC entry 2619 (class 2606 OID 44179)
-- Name: codigopaises codigopaises_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2618 (class 2606 OID 44174)
-- Name: codigopaises codigopaises_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2635 (class 2606 OID 44411)
-- Name: editoriale_libro editoriale_libro_editoriale_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_editoriale_id_foreign FOREIGN KEY (editoriale_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 2634 (class 2606 OID 44406)
-- Name: editoriale_libro editoriale_libro_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2621 (class 2606 OID 44213)
-- Name: editoriales editoriales_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2620 (class 2606 OID 44208)
-- Name: editoriales editoriales_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2642 (class 2606 OID 44483)
-- Name: historiallibros historiallibros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2641 (class 2606 OID 44478)
-- Name: historiallibros historiallibros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2639 (class 2606 OID 44468)
-- Name: historiallibros historiallibros_inventariolibro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_inventariolibro_id_foreign FOREIGN KEY (inventariolibro_id) REFERENCES public.inventariolibros(id) ON DELETE CASCADE;


--
-- TOC entry 2638 (class 2606 OID 44463)
-- Name: historiallibros historiallibros_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2640 (class 2606 OID 44473)
-- Name: historiallibros historiallibros_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2606 (class 2606 OID 43983)
-- Name: imagen_user imagen_user_imagen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_imagen_id_foreign FOREIGN KEY (imagen_id) REFERENCES public.imagenes(id) ON DELETE CASCADE;


--
-- TOC entry 2607 (class 2606 OID 43988)
-- Name: imagen_user imagen_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2605 (class 2606 OID 43966)
-- Name: imagenes imagenes_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2604 (class 2606 OID 43961)
-- Name: imagenes imagenes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2636 (class 2606 OID 44428)
-- Name: inventariolibro_portada inventariolibro_portada_inventariolibro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_inventariolibro_id_foreign FOREIGN KEY (inventariolibro_id) REFERENCES public.inventariolibros(id) ON DELETE CASCADE;


--
-- TOC entry 2637 (class 2606 OID 44433)
-- Name: inventariolibro_portada inventariolibro_portada_portada_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_portada_id_foreign FOREIGN KEY (portada_id) REFERENCES public.portadas(id) ON DELETE CASCADE;


--
-- TOC entry 2631 (class 2606 OID 44342)
-- Name: inventariolibros inventariolibros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2629 (class 2606 OID 44332)
-- Name: inventariolibros inventariolibros_editorial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_editorial_id_foreign FOREIGN KEY (editorial_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 2630 (class 2606 OID 44337)
-- Name: inventariolibros inventariolibros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2628 (class 2606 OID 44327)
-- Name: inventariolibros inventariolibros_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2643 (class 2606 OID 58493)
-- Name: libro_portada libro_portada_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 2644 (class 2606 OID 58498)
-- Name: libro_portada libro_portada_portada_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_portada_id_foreign FOREIGN KEY (portada_id) REFERENCES public.portadas(id) ON DELETE CASCADE;


--
-- TOC entry 2627 (class 2606 OID 44289)
-- Name: libros libros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2624 (class 2606 OID 44274)
-- Name: libros libros_editorial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_editorial_id_foreign FOREIGN KEY (editorial_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 2626 (class 2606 OID 44284)
-- Name: libros libros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2625 (class 2606 OID 44279)
-- Name: libros libros_tipo_material_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_tipo_material_id_foreign FOREIGN KEY (tipo_material_id) REFERENCES public.tipomaterial(id) ON DELETE CASCADE;


--
-- TOC entry 2608 (class 2606 OID 44056)
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2609 (class 2606 OID 44067)
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2617 (class 2606 OID 44144)
-- Name: permission_role permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2616 (class 2606 OID 44139)
-- Name: permission_role permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2615 (class 2606 OID 44124)
-- Name: permission_user permission_user_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2614 (class 2606 OID 44119)
-- Name: permission_user permission_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2633 (class 2606 OID 44389)
-- Name: portadas portadas_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2632 (class 2606 OID 44384)
-- Name: portadas portadas_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2610 (class 2606 OID 44077)
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 2611 (class 2606 OID 44082)
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2613 (class 2606 OID 44104)
-- Name: role_user role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 2612 (class 2606 OID 44099)
-- Name: role_user role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2623 (class 2606 OID 44238)
-- Name: tipomaterial tipomaterial_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2622 (class 2606 OID 44233)
-- Name: tipomaterial tipomaterial_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 2601 (class 2606 OID 43891)
-- Name: user_adress user_adress_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2602 (class 2606 OID 43911)
-- Name: user_extend user_extend_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend
    ADD CONSTRAINT user_extend_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2603 (class 2606 OID 43927)
-- Name: user_social user_social_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social
    ADD CONSTRAINT user_social_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2600 (class 2606 OID 43860)
-- Name: users users_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 2599 (class 2606 OID 43855)
-- Name: users users_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


-- Completed on 2022-02-10 17:59:15 CST

--
-- PostgreSQL database dump complete
--
