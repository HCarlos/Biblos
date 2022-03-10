--
-- PostgreSQL database dump
--

-- Dumped from database version 10.20
-- Dumped by pg_dump version 10.20

-- Started on 2022-02-22 10:32:06 CST

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

--
-- TOC entry 1 (class 3079 OID 13794)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 19259)
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
-- TOC entry 197 (class 1259 OID 19263)
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
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 197
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 198 (class 1259 OID 19265)
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
-- TOC entry 199 (class 1259 OID 19274)
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
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 199
-- Name: codigopaises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.codigopaises_id_seq OWNED BY public.codigopaises.id;


--
-- TOC entry 200 (class 1259 OID 19276)
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
-- TOC entry 201 (class 1259 OID 19281)
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
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 201
-- Name: editoriale_libro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriale_libro_id_seq OWNED BY public.editoriale_libro.id;


--
-- TOC entry 202 (class 1259 OID 19283)
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
-- TOC entry 203 (class 1259 OID 19297)
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
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 203
-- Name: editoriales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.editoriales_id_seq OWNED BY public.editoriales.id;


--
-- TOC entry 204 (class 1259 OID 19299)
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
-- TOC entry 205 (class 1259 OID 19310)
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
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 205
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresas_id_seq OWNED BY public.empresas.id;


--
-- TOC entry 206 (class 1259 OID 19312)
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
-- TOC entry 207 (class 1259 OID 19319)
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
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 207
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 208 (class 1259 OID 19321)
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
-- TOC entry 209 (class 1259 OID 19334)
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
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 209
-- Name: historiallibros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historiallibros_id_seq OWNED BY public.historiallibros.id;


--
-- TOC entry 210 (class 1259 OID 19336)
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
-- TOC entry 211 (class 1259 OID 19341)
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
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 211
-- Name: imagen_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagen_user_id_seq OWNED BY public.imagen_user.id;


--
-- TOC entry 212 (class 1259 OID 19343)
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
-- TOC entry 213 (class 1259 OID 19356)
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
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 213
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenes_id_seq OWNED BY public.imagenes.id;


--
-- TOC entry 214 (class 1259 OID 19358)
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
-- TOC entry 215 (class 1259 OID 19363)
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
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 215
-- Name: inventariolibro_portada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventariolibro_portada_id_seq OWNED BY public.inventariolibro_portada.id;


--
-- TOC entry 216 (class 1259 OID 19365)
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
    ficha_no character varying(25) DEFAULT ''::character varying,
    fecha_apartado_vencimiento timestamp(0) without time zone,
    fecha_prestamo_vencimiento timestamp(0) without time zone,
    fecha_entrega_vencimiento timestamp(0) without time zone
);


ALTER TABLE public.inventariolibros OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19386)
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
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 217
-- Name: inventariolibros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventariolibros_id_seq OWNED BY public.inventariolibros.id;


--
-- TOC entry 218 (class 1259 OID 19388)
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
-- TOC entry 219 (class 1259 OID 19393)
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
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 219
-- Name: libro_portada_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_portada_id_seq OWNED BY public.libro_portada.id;


--
-- TOC entry 220 (class 1259 OID 19395)
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
-- TOC entry 221 (class 1259 OID 19414)
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
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 221
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_seq OWNED BY public.libros.id;


--
-- TOC entry 222 (class 1259 OID 19416)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19419)
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
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 223
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 224 (class 1259 OID 19421)
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19424)
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 19427)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19433)
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
-- TOC entry 228 (class 1259 OID 19436)
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
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 228
-- Name: permission_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_role_id_seq OWNED BY public.permission_role.id;


--
-- TOC entry 229 (class 1259 OID 19438)
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
-- TOC entry 230 (class 1259 OID 19441)
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
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 230
-- Name: permission_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_user_id_seq OWNED BY public.permission_user.id;


--
-- TOC entry 231 (class 1259 OID 19443)
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
-- TOC entry 232 (class 1259 OID 19451)
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
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 232
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 233 (class 1259 OID 19453)
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
-- TOC entry 234 (class 1259 OID 19469)
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
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 234
-- Name: portadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.portadas_id_seq OWNED BY public.portadas.id;


--
-- TOC entry 235 (class 1259 OID 19471)
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 19474)
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
-- TOC entry 237 (class 1259 OID 19477)
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
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 237
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_user_id_seq OWNED BY public.role_user.id;


--
-- TOC entry 238 (class 1259 OID 19479)
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
-- TOC entry 239 (class 1259 OID 19488)
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
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 239
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 240 (class 1259 OID 19490)
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
-- TOC entry 241 (class 1259 OID 19496)
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
-- TOC entry 242 (class 1259 OID 19505)
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
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 242
-- Name: tipomaterial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipomaterial_id_seq OWNED BY public.tipomaterial.id;


--
-- TOC entry 243 (class 1259 OID 19507)
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
-- TOC entry 244 (class 1259 OID 19522)
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
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 244
-- Name: user_adress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_adress_id_seq OWNED BY public.user_adress.id;


--
-- TOC entry 245 (class 1259 OID 19524)
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
-- TOC entry 246 (class 1259 OID 19534)
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
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 246
-- Name: user_extend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_extend_id_seq OWNED BY public.user_extend.id;


--
-- TOC entry 247 (class 1259 OID 19536)
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
-- TOC entry 248 (class 1259 OID 19542)
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
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_social_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_social_id_seq OWNED BY public.user_social.id;


--
-- TOC entry 249 (class 1259 OID 19544)
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
-- TOC entry 250 (class 1259 OID 19566)
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
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 250
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3720 (class 2604 OID 19568)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 3727 (class 2604 OID 19569)
-- Name: codigopaises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises ALTER COLUMN id SET DEFAULT nextval('public.codigopaises_id_seq'::regclass);


--
-- TOC entry 3730 (class 2604 OID 19570)
-- Name: editoriale_libro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro ALTER COLUMN id SET DEFAULT nextval('public.editoriale_libro_id_seq'::regclass);


--
-- TOC entry 3739 (class 2604 OID 19571)
-- Name: editoriales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales ALTER COLUMN id SET DEFAULT nextval('public.editoriales_id_seq'::regclass);


--
-- TOC entry 3745 (class 2604 OID 19572)
-- Name: empresas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas ALTER COLUMN id SET DEFAULT nextval('public.empresas_id_seq'::regclass);


--
-- TOC entry 3747 (class 2604 OID 19573)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3755 (class 2604 OID 19574)
-- Name: historiallibros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros ALTER COLUMN id SET DEFAULT nextval('public.historiallibros_id_seq'::regclass);


--
-- TOC entry 3758 (class 2604 OID 19575)
-- Name: imagen_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user ALTER COLUMN id SET DEFAULT nextval('public.imagen_user_id_seq'::regclass);


--
-- TOC entry 3766 (class 2604 OID 19576)
-- Name: imagenes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes ALTER COLUMN id SET DEFAULT nextval('public.imagenes_id_seq'::regclass);


--
-- TOC entry 3769 (class 2604 OID 19577)
-- Name: inventariolibro_portada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada ALTER COLUMN id SET DEFAULT nextval('public.inventariolibro_portada_id_seq'::regclass);


--
-- TOC entry 3785 (class 2604 OID 19578)
-- Name: inventariolibros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros ALTER COLUMN id SET DEFAULT nextval('public.inventariolibros_id_seq'::regclass);


--
-- TOC entry 3788 (class 2604 OID 19579)
-- Name: libro_portada id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada ALTER COLUMN id SET DEFAULT nextval('public.libro_portada_id_seq'::regclass);


--
-- TOC entry 3802 (class 2604 OID 19580)
-- Name: libros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id SET DEFAULT nextval('public.libros_id_seq'::regclass);


--
-- TOC entry 3803 (class 2604 OID 19581)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3804 (class 2604 OID 19582)
-- Name: permission_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role ALTER COLUMN id SET DEFAULT nextval('public.permission_role_id_seq'::regclass);


--
-- TOC entry 3805 (class 2604 OID 19583)
-- Name: permission_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user ALTER COLUMN id SET DEFAULT nextval('public.permission_user_id_seq'::regclass);


--
-- TOC entry 3808 (class 2604 OID 19584)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3819 (class 2604 OID 19585)
-- Name: portadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas ALTER COLUMN id SET DEFAULT nextval('public.portadas_id_seq'::regclass);


--
-- TOC entry 3820 (class 2604 OID 19586)
-- Name: role_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user ALTER COLUMN id SET DEFAULT nextval('public.role_user_id_seq'::regclass);


--
-- TOC entry 3824 (class 2604 OID 19587)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3828 (class 2604 OID 19588)
-- Name: tipomaterial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial ALTER COLUMN id SET DEFAULT nextval('public.tipomaterial_id_seq'::regclass);


--
-- TOC entry 3838 (class 2604 OID 19589)
-- Name: user_adress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress ALTER COLUMN id SET DEFAULT nextval('public.user_adress_id_seq'::regclass);


--
-- TOC entry 3843 (class 2604 OID 19590)
-- Name: user_extend id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend ALTER COLUMN id SET DEFAULT nextval('public.user_extend_id_seq'::regclass);


--
-- TOC entry 3847 (class 2604 OID 19591)
-- Name: user_social id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social ALTER COLUMN id SET DEFAULT nextval('public.user_social_id_seq'::regclass);


--
-- TOC entry 3864 (class 2604 OID 19592)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4172 (class 0 OID 19259)
-- Dependencies: 196
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, categoria, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4174 (class 0 OID 19265)
-- Dependencies: 198
-- Data for Name: codigopaises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.codigopaises (id, codigo, lenguaje, tipo, empresa_id, status_lenguaje, creado_por_id, migration_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4176 (class 0 OID 19276)
-- Dependencies: 200
-- Data for Name: editoriale_libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editoriale_libro (id, editoriale_id, libro_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 19283)
-- Dependencies: 202
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
251	REVERTÉ S.A.				f	1	1	2	\N	2022-02-11 14:40:44	2022-02-11 14:40:44	'revert':1 's.a':2
252	EDITORIAL CRÍTICA				f	1	1	2	\N	2022-02-17 16:05:48	2022-02-17 16:05:48	'critic':2 'editorial':1
253	EDERE				f	1	1	2	\N	2022-02-17 20:40:47	2022-02-17 20:40:47	'eder':1
254	MANUAL MODERNO				f	1	1	2	\N	2022-02-17 20:56:24	2022-02-17 20:56:24	'manual':1 'modern':2
255	SUDAMERICANA				f	1	1	2	\N	2022-02-17 21:26:32	2022-02-17 21:26:32	'sudamerican':1
256	POSADA				f	1	1	2	\N	2022-02-18 14:14:32	2022-02-18 14:14:32	'pos':1
257	EL COLEGIO DE MÉXICO				f	1	1	2	\N	2022-02-18 15:35:13	2022-02-18 15:35:13	'colegi':2 'mexic':4
258	UTOPíA				f	1	1	2	\N	2022-02-22 14:38:52	2022-02-22 14:38:52	'utop':1
259	INSTITUTO POLITECNICO NACIONAL				f	1	1	2	\N	2022-02-22 15:12:40	2022-02-22 15:12:40	'institut':1 'nacional':3 'politecn':2
\.


--
-- TOC entry 4180 (class 0 OID 19299)
-- Dependencies: 204
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresas (id, razon_social, domicilio_fiscal, rfc, ip, host, deleted_at, created_at, updated_at) FROM stdin;
1	Nombre Institución	rfc				\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 4182 (class 0 OID 19312)
-- Dependencies: 206
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 19321)
-- Dependencies: 208
-- Data for Name: historiallibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historiallibros (id, libro_id, inventariolibro_id, user_id, fecha, tipo_movto, observaciones, empresa_id, creado_por_id, deleted_at, created_at, updated_at) FROM stdin;
1	1004	125	1	2022-02-17 00:00:00	RESERVADO/APARTADO	PRUEBA DE RESERVATION...	1	1	\N	2022-02-17 23:33:04	2022-02-17 23:33:04
3	1144	249	1	2022-02-18 00:00:00	RESERVADO/APARTADO	APARTADO POR MI	1	1	\N	2022-02-18 15:38:04	2022-02-18 15:38:04
4	1331	676	2	2022-02-18 00:00:00	RESERVADO/APARTADO		1	2	\N	2022-02-18 17:17:36	2022-02-18 17:17:36
\.


--
-- TOC entry 4186 (class 0 OID 19336)
-- Dependencies: 210
-- Data for Name: imagen_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagen_user (id, imagen_id, user_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 19343)
-- Dependencies: 212
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenes (id, root, filename, filename_png, filename_thumb, pie_de_foto, user_id, creado_por_id, status_imagen, ip, host, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 19358)
-- Dependencies: 214
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
609	646	462	\N	\N	\N
610	647	462	\N	\N	\N
611	648	463	\N	\N	\N
612	649	463	\N	\N	\N
613	650	463	\N	\N	\N
614	651	463	\N	\N	\N
615	652	463	\N	\N	\N
616	653	463	\N	\N	\N
617	654	463	\N	\N	\N
618	655	464	\N	\N	\N
619	656	465	\N	\N	\N
620	657	465	\N	\N	\N
621	658	465	\N	\N	\N
622	659	465	\N	\N	\N
623	660	465	\N	\N	\N
624	661	466	\N	\N	\N
625	662	466	\N	\N	\N
626	663	467	\N	\N	\N
627	664	467	\N	\N	\N
628	665	467	\N	\N	\N
629	666	468	\N	\N	\N
630	667	469	\N	\N	\N
631	668	469	\N	\N	\N
632	669	469	\N	\N	\N
633	670	469	\N	\N	\N
634	671	470	\N	\N	\N
635	672	470	\N	\N	\N
636	673	470	\N	\N	\N
637	674	470	\N	\N	\N
638	675	471	\N	\N	\N
639	676	473	\N	\N	\N
643	680	474	\N	\N	\N
644	681	474	\N	\N	\N
645	682	474	\N	\N	\N
646	683	475	\N	\N	\N
647	684	475	\N	\N	\N
648	685	475	\N	\N	\N
649	686	475	\N	\N	\N
650	687	475	\N	\N	\N
651	688	475	\N	\N	\N
652	689	475	\N	\N	\N
653	690	475	\N	\N	\N
658	695	476	\N	\N	\N
659	696	476	\N	\N	\N
660	698	476	\N	\N	\N
661	699	476	\N	\N	\N
662	701	476	\N	\N	\N
663	702	476	\N	\N	\N
664	703	476	\N	\N	\N
665	705	476	\N	\N	\N
666	707	476	\N	\N	\N
667	708	477	\N	\N	\N
668	709	478	\N	\N	\N
669	710	478	\N	\N	\N
670	711	478	\N	\N	\N
671	712	478	\N	\N	\N
672	713	478	\N	\N	\N
673	714	478	\N	\N	\N
674	715	478	\N	\N	\N
675	716	478	\N	\N	\N
676	717	478	\N	\N	\N
677	718	478	\N	\N	\N
678	719	479	\N	\N	\N
679	720	480	\N	\N	\N
680	721	480	\N	\N	\N
681	722	481	\N	\N	\N
682	723	482	\N	\N	\N
683	724	483	\N	\N	\N
684	725	483	\N	\N	\N
685	726	485	\N	\N	\N
686	727	486	\N	\N	\N
687	728	486	\N	\N	\N
688	729	486	\N	\N	\N
689	730	486	\N	\N	\N
690	731	487	\N	\N	\N
691	732	487	\N	\N	\N
692	733	488	\N	\N	\N
693	734	489	\N	\N	\N
694	735	491	\N	\N	\N
695	736	492	\N	\N	\N
696	737	492	\N	\N	\N
697	738	492	\N	\N	\N
698	739	492	\N	\N	\N
699	740	492	\N	\N	\N
700	741	492	\N	\N	\N
701	742	492	\N	\N	\N
702	743	492	\N	\N	\N
703	744	493	\N	\N	\N
704	745	494	\N	\N	\N
705	746	495	\N	\N	\N
706	747	495	\N	\N	\N
707	748	496	\N	\N	\N
708	749	496	\N	\N	\N
709	750	498	\N	\N	\N
710	751	498	\N	\N	\N
711	752	499	\N	\N	\N
712	754	499	\N	\N	\N
713	755	500	\N	\N	\N
714	756	500	\N	\N	\N
715	757	501	\N	\N	\N
716	758	501	\N	\N	\N
717	759	502	\N	\N	\N
718	760	503	\N	\N	\N
719	761	504	\N	\N	\N
720	762	504	\N	\N	\N
721	763	504	\N	\N	\N
722	764	504	\N	\N	\N
723	765	504	\N	\N	\N
724	766	504	\N	\N	\N
725	767	504	\N	\N	\N
726	768	504	\N	\N	\N
727	769	504	\N	\N	\N
728	770	504	\N	\N	\N
729	771	505	\N	\N	\N
730	772	506	\N	\N	\N
731	773	507	\N	\N	\N
732	774	508	\N	\N	\N
733	775	509	\N	\N	\N
734	776	510	\N	\N	\N
735	777	511	\N	\N	\N
736	778	511	\N	\N	\N
737	779	512	\N	\N	\N
738	780	513	\N	\N	\N
739	781	513	\N	\N	\N
740	782	514	\N	\N	\N
741	783	514	\N	\N	\N
742	784	515	\N	\N	\N
743	785	515	\N	\N	\N
744	786	516	\N	\N	\N
745	787	516	\N	\N	\N
746	788	517	\N	\N	\N
747	789	517	\N	\N	\N
748	790	518	\N	\N	\N
749	792	518	\N	\N	\N
750	793	519	\N	\N	\N
751	794	520	\N	\N	\N
752	795	520	\N	\N	\N
753	796	521	\N	\N	\N
754	797	521	\N	\N	\N
755	798	522	\N	\N	\N
756	799	522	\N	\N	\N
757	800	523	\N	\N	\N
758	801	523	\N	\N	\N
761	804	525	\N	\N	\N
762	805	525	\N	\N	\N
763	806	526	\N	\N	\N
764	807	526	\N	\N	\N
765	808	526	\N	\N	\N
766	809	526	\N	\N	\N
767	810	526	\N	\N	\N
768	811	526	\N	\N	\N
769	812	526	\N	\N	\N
770	813	526	\N	\N	\N
771	814	526	\N	\N	\N
772	815	526	\N	\N	\N
773	816	526	\N	\N	\N
774	817	527	\N	\N	\N
775	818	527	\N	\N	\N
776	819	528	\N	\N	\N
777	820	528	\N	\N	\N
778	821	528	\N	\N	\N
779	822	528	\N	\N	\N
780	824	529	\N	\N	\N
781	825	530	\N	\N	\N
782	826	531	\N	\N	\N
783	827	532	\N	\N	\N
784	828	533	\N	\N	\N
785	829	534	\N	\N	\N
786	830	535	\N	\N	\N
787	831	536	\N	\N	\N
788	832	537	\N	\N	\N
789	833	538	\N	\N	\N
790	834	539	\N	\N	\N
791	835	540	\N	\N	\N
792	836	541	\N	\N	\N
793	837	542	\N	\N	\N
794	838	542	\N	\N	\N
795	839	542	\N	\N	\N
796	840	542	\N	\N	\N
797	841	542	\N	\N	\N
798	842	542	\N	\N	\N
799	843	543	\N	\N	\N
800	844	543	\N	\N	\N
801	845	543	\N	\N	\N
802	846	543	\N	\N	\N
803	847	543	\N	\N	\N
804	848	543	\N	\N	\N
805	849	543	\N	\N	\N
806	850	543	\N	\N	\N
807	851	543	\N	\N	\N
808	852	543	\N	\N	\N
809	853	543	\N	\N	\N
810	854	543	\N	\N	\N
811	855	544	\N	\N	\N
812	856	544	\N	\N	\N
813	857	545	\N	\N	\N
814	858	545	\N	\N	\N
815	859	545	\N	\N	\N
816	860	545	\N	\N	\N
825	870	547	\N	\N	\N
826	871	547	\N	\N	\N
827	872	547	\N	\N	\N
828	873	547	\N	\N	\N
829	874	547	\N	\N	\N
830	875	547	\N	\N	\N
831	876	547	\N	\N	\N
832	877	547	\N	\N	\N
833	878	548	\N	\N	\N
834	879	549	\N	\N	\N
835	880	550	\N	\N	\N
836	881	550	\N	\N	\N
837	882	551	\N	\N	\N
838	883	551	\N	\N	\N
839	884	552	\N	\N	\N
840	885	552	\N	\N	\N
841	886	552	\N	\N	\N
842	887	552	\N	\N	\N
843	888	553	\N	\N	\N
844	889	553	\N	\N	\N
845	890	554	\N	\N	\N
846	891	555	\N	\N	\N
847	892	555	\N	\N	\N
848	893	556	\N	\N	\N
849	894	556	\N	\N	\N
850	895	557	\N	\N	\N
851	896	557	\N	\N	\N
852	897	558	\N	\N	\N
853	898	558	\N	\N	\N
854	899	559	\N	\N	\N
855	900	560	\N	\N	\N
856	901	561	\N	\N	\N
857	902	562	\N	\N	\N
858	903	562	\N	\N	\N
859	904	563	\N	\N	\N
860	905	563	\N	\N	\N
861	906	564	\N	\N	\N
862	907	565	\N	\N	\N
863	908	567	\N	\N	\N
864	909	568	\N	\N	\N
865	910	568	\N	\N	\N
866	911	568	\N	\N	\N
867	912	568	\N	\N	\N
868	913	568	\N	\N	\N
869	914	568	\N	\N	\N
871	917	569	\N	\N	\N
872	918	569	\N	\N	\N
873	919	569	\N	\N	\N
874	920	569	\N	\N	\N
875	921	569	\N	\N	\N
876	922	569	\N	\N	\N
877	923	569	\N	\N	\N
878	924	570	\N	\N	\N
879	925	570	\N	\N	\N
880	926	570	\N	\N	\N
881	927	570	\N	\N	\N
882	928	570	\N	\N	\N
883	929	571	\N	\N	\N
884	930	572	\N	\N	\N
885	931	572	\N	\N	\N
886	932	573	\N	\N	\N
887	933	573	\N	\N	\N
888	934	573	\N	\N	\N
889	935	573	\N	\N	\N
890	936	573	\N	\N	\N
891	937	573	\N	\N	\N
892	938	574	\N	\N	\N
893	939	574	\N	\N	\N
894	940	574	\N	\N	\N
895	941	574	\N	\N	\N
896	942	574	\N	\N	\N
897	943	575	\N	\N	\N
898	944	576	\N	\N	\N
899	945	577	\N	\N	\N
900	946	577	\N	\N	\N
901	947	577	\N	\N	\N
902	948	577	\N	\N	\N
903	949	577	\N	\N	\N
904	950	578	\N	\N	\N
905	951	578	\N	\N	\N
906	952	579	\N	\N	\N
907	953	579	\N	\N	\N
908	954	580	\N	\N	\N
909	955	580	\N	\N	\N
910	956	581	\N	\N	\N
911	957	581	\N	\N	\N
912	958	583	\N	\N	\N
913	959	583	\N	\N	\N
914	960	584	\N	\N	\N
915	961	585	\N	\N	\N
916	962	585	\N	\N	\N
917	963	585	\N	\N	\N
918	964	585	\N	\N	\N
919	965	585	\N	\N	\N
920	966	585	\N	\N	\N
921	967	586	\N	\N	\N
922	968	586	\N	\N	\N
923	969	587	\N	\N	\N
924	970	587	\N	\N	\N
925	971	588	\N	\N	\N
926	972	589	\N	\N	\N
927	973	589	\N	\N	\N
928	974	589	\N	\N	\N
929	975	589	\N	\N	\N
930	976	589	\N	\N	\N
931	977	589	\N	\N	\N
932	978	589	\N	\N	\N
933	979	589	\N	\N	\N
935	981	590	\N	\N	\N
936	982	590	\N	\N	\N
937	983	590	\N	\N	\N
938	984	590	\N	\N	\N
939	985	590	\N	\N	\N
940	986	590	\N	\N	\N
941	987	592	\N	\N	\N
942	988	594	\N	\N	\N
943	989	595	\N	\N	\N
944	990	595	\N	\N	\N
945	991	595	\N	\N	\N
946	992	595	\N	\N	\N
947	993	595	\N	\N	\N
948	994	595	\N	\N	\N
949	995	595	\N	\N	\N
950	996	595	\N	\N	\N
951	997	595	\N	\N	\N
952	998	595	\N	\N	\N
953	999	596	\N	\N	\N
954	1000	596	\N	\N	\N
955	1001	597	\N	\N	\N
956	1002	597	\N	\N	\N
957	1003	598	\N	\N	\N
958	1004	598	\N	\N	\N
959	1005	599	\N	\N	\N
960	1006	600	\N	\N	\N
961	1007	600	\N	\N	\N
962	1008	602	\N	\N	\N
963	1009	602	\N	\N	\N
964	1010	603	\N	\N	\N
965	1011	603	\N	\N	\N
966	1012	604	\N	\N	\N
967	1013	605	\N	\N	\N
968	1014	606	\N	\N	\N
969	1015	606	\N	\N	\N
970	1016	606	\N	\N	\N
971	1017	606	\N	\N	\N
972	1018	607	\N	\N	\N
973	1019	607	\N	\N	\N
974	1020	608	\N	\N	\N
975	1021	608	\N	\N	\N
976	1022	609	\N	\N	\N
977	1023	610	\N	\N	\N
978	1024	610	\N	\N	\N
979	1025	611	\N	\N	\N
980	1026	611	\N	\N	\N
981	1027	612	\N	\N	\N
982	1028	613	\N	\N	\N
983	1029	613	\N	\N	\N
984	1030	614	\N	\N	\N
985	1031	614	\N	\N	\N
986	1032	614	\N	\N	\N
987	1033	614	\N	\N	\N
988	1034	614	\N	\N	\N
989	1035	614	\N	\N	\N
990	1036	614	\N	\N	\N
991	1037	614	\N	\N	\N
992	1038	614	\N	\N	\N
993	1039	614	\N	\N	\N
994	1040	614	\N	\N	\N
995	1041	614	\N	\N	\N
996	1042	615	\N	\N	\N
997	1043	616	\N	\N	\N
998	1044	616	\N	\N	\N
999	1045	616	\N	\N	\N
1000	1046	616	\N	\N	\N
1001	1047	616	\N	\N	\N
1002	1048	616	\N	\N	\N
1003	1049	616	\N	\N	\N
1004	1050	616	\N	\N	\N
1005	1051	617	\N	\N	\N
1006	1052	617	\N	\N	\N
1007	1053	618	\N	\N	\N
1008	1054	618	\N	\N	\N
1009	1055	618	\N	\N	\N
1010	1056	619	\N	\N	\N
1011	1057	619	\N	\N	\N
1012	1058	619	\N	\N	\N
1013	1059	619	\N	\N	\N
1014	1060	619	\N	\N	\N
1015	1061	622	\N	\N	\N
1016	1062	622	\N	\N	\N
1017	1063	623	\N	\N	\N
1018	1064	623	\N	\N	\N
1019	1065	623	\N	\N	\N
1020	1066	623	\N	\N	\N
1021	1067	623	\N	\N	\N
1022	1068	623	\N	\N	\N
1023	1069	624	\N	\N	\N
1024	1070	624	\N	\N	\N
1025	1071	624	\N	\N	\N
1026	1072	625	\N	\N	\N
1027	1073	626	\N	\N	\N
1028	1074	627	\N	\N	\N
1029	1075	628	\N	\N	\N
1030	1076	629	\N	\N	\N
1031	1078	630	\N	\N	\N
1032	1079	631	\N	\N	\N
1033	1080	631	\N	\N	\N
1034	1081	633	\N	\N	\N
1035	1082	633	\N	\N	\N
1036	1083	635	\N	\N	\N
1037	1084	635	\N	\N	\N
1038	1085	635	\N	\N	\N
1039	1086	635	\N	\N	\N
1040	1087	635	\N	\N	\N
1041	1088	635	\N	\N	\N
1042	1089	635	\N	\N	\N
1043	1090	635	\N	\N	\N
1044	1091	635	\N	\N	\N
1045	1092	635	\N	\N	\N
1046	1093	636	\N	\N	\N
1047	1094	637	\N	\N	\N
1048	1095	637	\N	\N	\N
1049	1096	638	\N	\N	\N
1050	1097	639	\N	\N	\N
1051	1099	639	\N	\N	\N
1052	1100	640	\N	\N	\N
1053	1101	640	\N	\N	\N
1054	1102	641	\N	\N	\N
1055	1103	641	\N	\N	\N
1056	1104	641	\N	\N	\N
1057	1105	641	\N	\N	\N
1058	1106	642	\N	\N	\N
1059	1107	642	\N	\N	\N
1060	1108	643	\N	\N	\N
1061	1109	643	\N	\N	\N
1062	1110	644	\N	\N	\N
1063	1111	644	\N	\N	\N
1064	1112	645	\N	\N	\N
1065	1113	645	\N	\N	\N
1066	1114	646	\N	\N	\N
1067	1115	646	\N	\N	\N
1068	1116	646	\N	\N	\N
1069	1117	646	\N	\N	\N
1070	1118	646	\N	\N	\N
1071	1119	646	\N	\N	\N
1072	1120	646	\N	\N	\N
1073	1121	646	\N	\N	\N
1074	1122	646	\N	\N	\N
1075	1123	646	\N	\N	\N
1076	1124	646	\N	\N	\N
1077	1125	646	\N	\N	\N
1078	1126	646	\N	\N	\N
1079	1127	646	\N	\N	\N
1080	1128	646	\N	\N	\N
1081	1129	646	\N	\N	\N
1082	1130	646	\N	\N	\N
1083	1131	647	\N	\N	\N
1084	1132	647	\N	\N	\N
1085	1133	647	\N	\N	\N
1086	1134	647	\N	\N	\N
1087	1135	647	\N	\N	\N
1088	1136	647	\N	\N	\N
1089	1137	648	\N	\N	\N
1090	1138	648	\N	\N	\N
1091	1139	648	\N	\N	\N
1092	1140	648	\N	\N	\N
1093	1141	649	\N	\N	\N
1094	1142	649	\N	\N	\N
1095	1143	649	\N	\N	\N
1096	1144	649	\N	\N	\N
1097	1145	649	\N	\N	\N
1098	1146	650	\N	\N	\N
1099	1147	650	\N	\N	\N
1100	1148	651	\N	\N	\N
1101	1149	651	\N	\N	\N
1102	1150	651	\N	\N	\N
1103	1151	651	\N	\N	\N
1104	1152	651	\N	\N	\N
1105	1153	651	\N	\N	\N
1106	1154	652	\N	\N	\N
1107	1155	653	\N	\N	\N
1108	1156	653	\N	\N	\N
1109	1157	654	\N	\N	\N
1110	1158	655	\N	\N	\N
1111	1159	655	\N	\N	\N
1112	1160	657	\N	\N	\N
1113	1161	658	\N	\N	\N
1114	1162	658	\N	\N	\N
1115	1163	658	\N	\N	\N
1116	1164	658	\N	\N	\N
1117	1165	658	\N	\N	\N
1118	1166	658	\N	\N	\N
1119	1167	659	\N	\N	\N
1120	1168	659	\N	\N	\N
1121	1169	659	\N	\N	\N
1122	1170	659	\N	\N	\N
1123	1171	659	\N	\N	\N
1124	1172	659	\N	\N	\N
1125	1173	659	\N	\N	\N
1126	1174	659	\N	\N	\N
1127	1175	659	\N	\N	\N
1128	1176	659	\N	\N	\N
1129	1177	660	\N	\N	\N
1130	1178	661	\N	\N	\N
1131	1179	662	\N	\N	\N
1132	1180	663	\N	\N	\N
1133	1181	664	\N	\N	\N
1134	1182	665	\N	\N	\N
1135	1184	666	\N	\N	\N
1136	1185	666	\N	\N	\N
1137	1186	666	\N	\N	\N
1138	1187	666	\N	\N	\N
1139	1188	666	\N	\N	\N
1140	1189	666	\N	\N	\N
1141	1190	667	\N	\N	\N
1142	1191	668	\N	\N	\N
1143	1193	668	\N	\N	\N
1144	1194	668	\N	\N	\N
1145	1195	668	\N	\N	\N
1146	1196	668	\N	\N	\N
1147	1197	668	\N	\N	\N
1148	1198	668	\N	\N	\N
1149	1199	668	\N	\N	\N
1150	1200	668	\N	\N	\N
1151	1201	668	\N	\N	\N
1152	1202	668	\N	\N	\N
1153	1203	668	\N	\N	\N
1154	1204	668	\N	\N	\N
1155	1205	668	\N	\N	\N
1156	1206	669	\N	\N	\N
1157	1207	669	\N	\N	\N
1158	1208	670	\N	\N	\N
1159	1209	670	\N	\N	\N
1160	1210	671	\N	\N	\N
1161	1211	671	\N	\N	\N
1162	1212	671	\N	\N	\N
1163	1213	671	\N	\N	\N
1164	1214	671	\N	\N	\N
1165	1215	671	\N	\N	\N
1166	1216	671	\N	\N	\N
1167	1217	672	\N	\N	\N
1168	1218	673	\N	\N	\N
1169	1220	673	\N	\N	\N
\.


--
-- TOC entry 4192 (class 0 OID 19365)
-- Dependencies: 216
-- Data for Name: inventariolibros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventariolibros (id, libro_id, isbn, clasificacion, edicion, codebar, prestado_user_id, fecha_prestamo, fecha_entrega, apartado_user_id, fecha_apartado, editorial_id, uuid, observaciones, empresa_id, status_libro, creado_por_id, deleted_at, created_at, updated_at, etiqueta_smarth, no_coleccion, searchtext, ficha_no, fecha_apartado_vencimiento, fecha_prestamo_vencimiento, fecha_entrega_vencimiento) FROM stdin;
1	517	9789681660529	461.52 S211 2006	2a. Ed.	0009706382127	0	\N	\N	0	\N	16	4a18bc4f-ca63-4f4c-a9ec-36d8763e7b88		1	1	2	\N	2021-10-26 13:20:34	2021-10-26 13:20:34			'0009706382127':7 '2006':4 '2a':5 '461.52':2 '9789681660529':1 'ed':6 's211':3		\N	\N	\N
2	398	9681864271	C 912.972 G881 2007	\N	0789681850067	0	\N	\N	0	\N	117	dc44fd60-8f5f-4595-bfec-49a09ee7ee27		1	1	2	\N	2021-10-26 18:14:44	2021-10-26 18:14:44			'0789681850067':6 '2007':5 '912.972':3 '9681864271':1 'c':2 'g881':4		\N	\N	\N
5	398	9681850068	C 912.972 G881 2003	\N	0009681850068	0	\N	\N	0	\N	117	00edd4c3-343d-4f20-90a0-45f9aef18b36		1	1	2	\N	2021-10-26 18:17:17	2021-10-26 18:17:17			'0009681850068':6 '2003':5 '912.972':3 '9681850068':1 'c':2 'g881':4		\N	\N	\N
6	933	978-607-606-124-4	500 S211 2013	2501a. Ed.	\N	0	\N	\N	0	\N	162	85e4ec9c-3516-4517-a318-515abe24580d		1	1	2	\N	2021-11-08 14:20:22	2021-11-08 14:20:22	¦020978-607-606-124-4¦082500 S211 2013¦100SANCHEZ TIQUE, MARIA GUADALUPE¦245¡ AH QUé HUEVOS TIENE LA CIENCIA ! / MARIA GUADALUPE SANCHEZ TIQUE¦2501A. ED.¦260MéXICO : UJAT¦30081 PAG.¦440COLEC. HéCTOR OCHOA BACELIS¦6501. CIENCIA - ESTUDIO Y ENSEñANZA¦700I. MALDONADO LóPEZ, LUIS EDUARDO, COAUT.Ì	COLEC. HéCTOR OCHOA BACELIS	'-124':4,14 '-4':5,15 '-606':3,13 '-607':2,12 '020978':11 '082500':16 '100sanchez':19 '2013':8,18 '245':23 '2501a':9,34 '260méxico':36 '30081':38 '440colec':40 '500':6 '6501':44 '700i':49 '978':1 'ah':24 'bacelis':43 'cienci':29,45 'coaut':54 'ed':10,35 'eduard':53 'enseñ':48 'estudi':46 'guadalup':22,31 'hector':41 'huev':26 'lopez':51 'luis':52 'maldon':50 'mari':21,30 'ocho':42 'pag':39 's211':7,17 'sanchez':32 'tiqu':20,33 'ujat':37 'ì':55		\N	\N	\N
7	934	978-987-629-166-8	612.405 C167 2011	2501a. Ed.	\N	0	\N	\N	0	\N	40	4b0398c8-6f2a-47de-ac1a-92e25175bcb7		1	1	2	\N	2021-11-08 14:31:49	2021-11-08 14:31:49	¦020978-987-629-166-8¦082612.405 C167 2011¦100CALVA, JUAN CARLOS¦245¡PORQUE! PORQUERIA LAS HORMONAS: SOBRE GRANITOS, CRECIMIENTO, SEXO Y OTRAS SEñALES EN EL CUERPO / JUAN CARLOS CALVA¦2501A. ED.¦260ARGENTINA : SIGLO VEINTIUNO EDITORES¦300122 PAG.¦440COLEC. CIENCIA QUE LADRA¦6501. EDUCACIóN SEXUAL 2. HORMONAS SEXUALES 3. GLANDULAS ENDOCRINAS¦700I. GOLOMBEK, DIEGO, SERÌ	COLEC. CIENCIA QUE LADRA	'-166':4,14 '-629':3,13 '-8':5,15 '-987':2,12 '020978':11 '082612.405':16 '100calva':19 '2':55 '2011':8,18 '245':22 '2501a':9,40 '260argentina':42 '3':58 '300122':46 '440colec':48 '612.405':6 '6501':52 '700i':61 '978':1 'c167':7,17 'calv':39 'carl':21,38 'cienci':49 'crecimient':29 'cuerp':36 'dieg':63 'ed':10,41 'editor':45 'educ':53 'endocrin':60 'glandul':59 'golombek':62 'granit':28 'hormon':26,56 'juan':20,37 'ladr':51 'pag':47 'porqueri':24 'serì':64 'sex':30 'sexual':54,57 'señal':33 'sigl':43 'veintiun':44		\N	\N	\N
9	935	968-6815-29-5	779.25 M754 2005	2501a. Ed.	\N	0	\N	\N	0	\N	225	aa703058-9014-4b75-b444-f99cdc1909d8		1	1	2	\N	2021-11-08 14:43:26	2021-11-08 14:43:26	¦020968-6815-29-5¦082779.25 M754 2005¦100MONSIVáIS, CARLOS¦245¡QUIETOS POR FAVOR! / CARLOS MONSIVáIS¦2501A. ED.¦260MéXICO : GRUPO CARSO¦300239 PAG.¦6501. FOTOGRAFíA DE NIñOS 2. FOTOGRAFíA ARTíSTICA¦700I. RAMOS MEDINA, MANUEL, EDIT.Ì		'-29':3,12 '-5':4,13 '-6815':2,11 '020968':10 '082779.25':14 '100monsiváis':17 '2':36 '2005':7,16 '245':19 '2501a':8,25 '260méxico':27 '300239':30 '6501':32 '700i':39 '779.25':5 '968':1 'artist':38 'carl':18,23 'cars':29 'ed':9,26 'edit':43 'favor':22 'fotograf':33,37 'grup':28 'm754':6,15 'manuel':42 'medin':41 'monsiv':24 'niñ':35 'pag':31 'quiet':20 'ram':40 'ì':44		\N	\N	\N
10	246	13-968-18-5329-7	510.076 S669 2007	\N	\N	0	\N	\N	0	\N	89	2a3a02ab-114d-4717-bee5-5abe0de8286a		1	1	2	\N	2021-11-08 15:28:39	2021-11-08 15:28:39	¦02013-968-18-5329-7¦050510.076 S669 2007¦100SNAPE,CHARLES¦245¡SAL SI PUEDES!:LABERINTOS Y ROMPECABEZAS MATEMáTICOS/CHARLES SNAPE¦260MéXICO:EDITORIAL LIMUSA¦30048 P./ 27 CM.¦600SNAPE,CHARLES.¦6501.MATEMáTICAS-JUEGOS DE ESTRATEGIA¦700I.HEATHER,SCOTT.Ì		'-18':3,11 '-5329':4,12 '-7':5,13 '-968':2,10 '/charles':27 '02013':9 '050510.076':14 '100snape':17 '13':1 '2007':8,16 '245':19 '260méxico':29 '27':34 '30048':32 '510.076':6 '600snape':36 '6501.matem':38 '700i.heather':44 'atic':40 'aticas-jueg':39 'charl':18,37 'cm':35 'editorial':30 'estrategi':43 'jueg':41 'laberint':23 'limus':31 'matemat':26 'p':33 'pued':22 'rompecabez':25 's669':7,15 'sal':20 'scott':45 'si':21 'snap':28 'ì':46		\N	\N	\N
11	936	01-89637-028-3	737.4972 B154 2005	2501a. Ed.	\N	0	\N	\N	0	\N	220	635fa7f9-d3ac-4e56-9a62-87e3d3087161		1	1	2	\N	2021-11-08 15:39:36	2021-11-08 15:39:36	¦02001-89637-028-3¦082737.4972 B154 2005¦100BAILEY, DON¦245¡VIVA LA REVOLUCIóN!: THE MONEY OF THE MEXICAN REVOLUTION / BY DON BAILEY¦2501A. ED.¦260ESTADOS UNIDOS DE AMéRICA : AMERICAN NUMISMATIC ASSOCIATION MONEY MUSEUM¦300159 PAG.¦6501. NUMISMáTICA - MéXICO 2. MéXICO - HISTORIA - REVOLUCIóN, 1910 - 1917¦700I. FLORES COLORADO, JOE, COAUT.Ì		'-028':3,12 '-3':4,13 '-89637':2,11 '01':1 '02001':10 '082737.4972':14 '100bailey':17 '1910':52 '1917':53 '2':48 '2005':7,16 '245':19 '2501a':8,32 '260estados':34 '300159':43 '6501':45 '700i':54 '737.4972':5 'amer':37 'americ':38 'association':40 'b154':6,15 'bailey':31 'by':29 'coaut':58 'color':56 'don':18,30 'ed':9,33 'flor':55 'histori':50 'joe':57 'mexic':27,47,49 'money':24,41 'museum':42 'numismat':46 'numismatic':39 'of':25 'pag':44 'revolu':22,51 'revolution':28 'the':23,26 'unid':35 'viv':20 'ì':59		\N	\N	\N
12	937	978-607-95359-5-7	371.58 C657 2011	2501a. Ed.	\N	0	\N	\N	0	\N	167	ebadec61-8cb9-47f4-9368-16d833938950		1	1	2	\N	2021-11-17 13:28:11	2021-11-17 13:28:11	¦020978-607-95359-5-7¦082371.58 C657 2011¦100COBO, PALOMA¦245¿BULLYING?: LIBERATE DEL ACOSO ESCOLAR / PALOMA COBO¦2501A. ED.¦260MéXICO : PRODUCCIONES EDUCACIóN APLICADA¦30087 PAG.¦6501. BULLYING 2. VIOLENCIA ESCOLAR 2. ACOSO ESCOLAR¦700I. TELLO, ROMEO, COAUT.Ì		'-5':4,14 '-607':2,12 '-7':5,15 '-95359':3,13 '020978':11 '082371.58':16 '100cobo':19 '2':39,42 '2011':8,18 '245':21 '2501a':9,29 '260méxico':31 '30087':35 '371.58':6 '6501':37 '700i':45 '978':1 'acos':25,43 'aplic':34 'bullying':22,38 'c657':7,17 'coaut':48 'cob':28 'ed':10,30 'educ':33 'escol':26,41,44 'liberat':23 'pag':36 'palom':20,27 'produccion':32 'rome':47 'tell':46 'violenci':40 'ì':49		\N	\N	\N
15	938	ISSN18703186	R 505 U58 2000	2501a. Ed.	\N	0	\N	\N	0	\N	179	3b3ec078-0adc-4d90-abca-6de115ff40f9		1	1	2	\N	2021-11-25 18:37:27	2021-11-25 18:37:27	¦020ISSN-1870-3186¦082R 505 U58 2000¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG,¦5001. MARZO (AñO 2, NUM. 16)¦5051. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ		'-1870':9 '-3186':10 '020issn':8 '082r':11 '100universidad':15 '16':45 '2':43,50 '2000':5,14 '245':20 '2501a':6,34 '260méxico':36 '30040':38 '5001':40 '505':3,12 '5051':46 'autonom':17,31 'año':42 'cienci':28,47 'divulg':25 'ed':7,35 'issn18703186':1 'marz':41 'mexic':19,33 'nacional':16,30 'num':44 'pag':39 'period':49 'periodicasì':53 'public':48,52 'r':2 'revist':23 'tecnolog':51 'u58':4,13 'unam':37 'univers':29 'ves':22		\N	\N	\N
242	1134	\N	340 S625	\N	\N	0	\N	\N	0	\N	245	c6e0f848-b0f8-4285-b4e5-f0c3c7536bda		1	1	2	\N	2022-01-26 14:36:00	2022-01-26 14:36:00			'340':1 's625':2	1385	\N	\N	\N
14	938	18703186	R 505 U58 2000	2501a. Ed.	\N	0	\N	\N	0	\N	179	e9950994-2dc0-4697-ada1-ff5439e3fc19		1	1	2	\N	2021-11-25 17:40:48	2021-11-25 19:41:37	¦020ISSN-1870-3186¦082R 505 U58 2000¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG,¦5001. MARZO (AñO 2, NUM. 16)¦5051. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ	VOL. 1 (MARZO) 2. VOL. 2 (ABRIL) 3. VOL. 3 (JULIO)	'-1870':9 '-3186':10 '020issn':8 '082r':11 '100universidad':15 '16':45 '18703186':1 '2':43,50 '2000':5,14 '245':20 '2501a':6,34 '260méxico':36 '30040':38 '5001':40 '505':3,12 '5051':46 'autonom':17,31 'año':42 'cienci':28,47 'divulg':25 'ed':7,35 'marz':41 'mexic':19,33 'nacional':16,30 'num':44 'pag':39 'period':49 'periodicasì':53 'public':48,52 'r':2 'revist':23 'tecnolog':51 'u58':4,13 'unam':37 'univers':29 'ves':22		\N	\N	\N
17	938	1870-3186	R 505 U58 2006	2501a. Ed.	\N	0	\N	\N	0	\N	179	fb015587-0a90-4096-bbb4-5bacc3988f61		1	1	2	\N	2021-11-25 20:02:42	2021-11-25 20:02:42	¦020ISSN-1870-3186¦082R 505 U58 2006¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG.¦500LA BIBLIOTECA SOLAMENTE TIENE EL EJEMPLAR DEL MES DE JUNIO DEL 2006¦5051. JUNIO (AñO 8, NUM. 91)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ	VOL. 1 (JUNIO) 2. VOL. 2 (SEPTIEMBRE) 3. VOL. 3 (OCTUBRE)	'-1870':10 '-3186':2,11 '020issn':9 '082r':12 '100universidad':16 '1870':1 '2':63 '2006':6,15,52 '245':21 '2501a':7,35 '260méxico':37 '30040':39 '500la':41 '505':4,13 '5051':53 '6501':59 '8':56 '91':58 'autonom':18,32 'año':55 'bibliotec':42 'cienci':29,60 'divulg':26 'ed':8,36 'ejempl':46 'juni':50,54 'mes':48 'mexic':20,34 'nacional':17,31 'num':57 'pag':40 'period':62 'periodicasì':66 'public':61,65 'r':3 'revist':24 'sol':43 'tecnolog':64 'u58':5,14 'unam':38 'univers':30 'ves':23		\N	\N	\N
20	938	ISSN 18703186	R 505 U58 2008	\N	\N	0	\N	\N	0	\N	179	b29d7d45-94c3-4b3f-a1fa-898391fbff3a		1	1	2	\N	2021-11-25 20:14:14	2021-11-25 20:14:14	&QUOT;¦020ISSN-1870-3186¦082R 505 U58 2008¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦3003 VOL.¦500LA BIBLIOTECA SOLAMENTE TIENE LOS EJEMPLARES DE LOS MESES DE: JUNIO, SEPTIEMBRE Y OCTUBRE¦5051. VOL. 1 (JUNIO) 2. VOL. 2 (SEPTIEMBRE) 3. VOL. 3 (OCTUBRE) ¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ&QUOT;	VOL. 1 (JUNIO) 2. VOL. 2 (SEPTIEMBRE) 3. VOL. 3 (OCTUBRE)	'-1870':8 '-3186':9 '020issn':7 '082r':10 '1':55 '100universidad':14 '18703186':2 '2':57,59,69 '2008':6,13 '245':19 '2501a':33 '260méxico':35 '3':61,63 '3003':37 '500la':39 '505':4,11 '5051':53 '6501':65 'autonom':16,30 'bibliotec':40 'cienci':27,66 'divulg':24 'ed':34 'ejemplar':44 'issn':1 'juni':49,56 'mes':47 'mexic':18,32 'nacional':15,29 'octubr':52,64 'period':68 'periodicasì':72 'public':67,71 'r':3 'revist':22 'septiembr':50,60 'sol':41 'tecnolog':70 'u58':5,12 'unam':36 'univers':28 'ves':21 'vol':38,54,58,62		\N	\N	\N
43	944	9684037368	616.9792 F711 1998	2501a. Ed.	\N	0	\N	\N	0	\N	156	4fe9ac03-4803-46d7-8983-cd94e098d922		1	1	2	\N	2021-11-30 20:27:22	2021-11-30 20:27:22	¦020968-403-736-8¦082616.9792 F711 1998¦100FORD, MICHAEL THOMAS¦245¿QUé ONDA CON EL SIDA / MICHAEL THOMAS FORD¦2501A. ED.¦260MéXICO : SELECTOR¦300199 PAG.¦440COLEC. SELECTOR¦6501. SIDA 2. ENFERMEDADES TRASMITIBLESÌ	COLEC. SELECTOR	'-403':8 '-736':9 '-8':10 '020968':7 '082616.9792':11 '100ford':14 '1998':4,13 '2':36 '245':17 '2501a':5,26 '260méxico':28 '300199':30 '440colec':32 '616.9792':2 '6501':34 '9684037368':1 'ed':6,27 'enfermedad':37 'f711':3,12 'ford':25 'michael':15,23 'onda':19 'pag':31 'selector':29,33 'sid':22,35 'thom':16,24 'trasmitiblesì':38		\N	\N	\N
22	938	ISSN  18703186	R 505 U58 2009	2501a. Ed.	\N	0	\N	\N	0	\N	179	96bd5d51-94a2-4a56-8492-827a614aaee2		1	1	2	\N	2021-11-25 20:17:59	2021-11-25 20:17:59	&QUOT;¦020ISSN-1870-3186¦082R 505 U58 2009¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTONOMA DE MéXICO¦2501A. ED.¦260MéXICO: UNAM¦3004 VOL.¦500LA BIBLIOTECA SOLAMENTE TIENE LOS EJEMPLARES DE LOS MESES DE: FEBRERO, MARZO, ABRIL Y JUNIO¦5051. VOL. 1 (FEBRERO) 2. VOL. 2 (MARZO) 3. VOL. 3 (ABRIL) 4. VOL. 4 (JUNIO)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ&QUOT;	VOL. 1 (FEBRERO) 2. VOL. 2 (MARZO) 3. VOL. 3 (ABRIL) 4. VOL. 4 (JUNIO)	'-1870':10 '-3186':11 '020issn':9 '082r':12 '1':58 '100universidad':16 '18703186':2 '2':60,62,76 '2009':6,15 '245':21 '2501a':7,35 '260méxico':37 '3':64,66 '3004':39 '4':68,70 '500la':41 '505':4,13 '5051':56 '6501':72 'abril':53,67 'autonom':18,32 'bibliotec':42 'cienci':29,73 'divulg':26 'ed':8,36 'ejemplar':46 'febrer':51,59 'issn':1 'juni':55,71 'marz':52,63 'mes':49 'mexic':20,34 'nacional':17,31 'period':75 'periodicasì':79 'public':74,78 'r':3 'revist':24 'sol':43 'tecnolog':77 'u58':5,14 'unam':38 'univers':30 'ves':23 'vol':40,57,61,65,69		\N	\N	\N
23	938	ISSN   18703186	R 505 U58 2010	2501a. Ed.	\N	0	\N	\N	0	\N	179	8d3c5eab-4932-430a-a88c-ad8196055a16		1	1	2	\N	2021-11-25 20:21:23	2021-11-25 20:21:23	"¦020ISSN-1870-3186¦082R 505 U58 2010¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦3002 VOL.¦500LA BIBLIOTECA SOLAMENTE TIENE LOS EJEMPLARES DE LOS MESES DE: AGOSTO Y NOVIEMBRE¦5051. VOL. 1 (AGOSTO) 2. VOL. 2 (NOVIEMBRE)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ"	VOL. 1 (AGOSTO) 2. VOL. 2 (NOVIEMBRE)	'-1870':10 '-3186':11 '020issn':9 '082r':12 '1':56 '100universidad':16 '18703186':2 '2':58,60,66 '2010':6,15 '245':21 '2501a':7,35 '260méxico':37 '3002':39 '500la':41 '505':4,13 '5051':54 '6501':62 'agost':51,57 'autonom':18,32 'bibliotec':42 'cienci':29,63 'divulg':26 'ed':8,36 'ejemplar':46 'issn':1 'mes':49 'mexic':20,34 'nacional':17,31 'noviembr':53,61 'period':65 'periodicasì':69 'public':64,68 'r':3 'revist':24 'sol':43 'tecnolog':67 'u58':5,14 'unam':38 'univers':30 'ves':23 'vol':40,55,59		\N	\N	\N
32	838	978-968-5950-36-7	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	1aa27cfb-fc80-4451-a66f-e74d31e895e0		1	1	2	\N	2021-11-30 14:31:32	2021-11-30 14:51:03	¦020978-968-5950-36-7¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN SUSTANTIVO? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA  DE HERRAMIENTAS¦6501. SUSTANTIVOS 2. ESPAñOL - GRAMáTICA GENERAL¦700I. FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-36':4,14 '-5950':3,13 '-7':5,15 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '700i':48 '978':1 'bernard':50 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'fernandez':49 'general':47 'gramat':46 'herramient':41 'il':51 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25 'sustant':27,43 'ì':52		\N	\N	\N
26	938	ISSN    18703186	R 505 U58 2012	2501a. Ed.	\N	0	\N	\N	0	\N	179	cc191a06-7f5c-4bc5-902c-dd4559cfd5ba		1	1	2	\N	2021-11-25 20:25:40	2021-11-25 20:25:40	¦020ISSN-1870-3186¦082R 505 U58 2012¦100UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦245¿COMO VES? REVISTA DE DIVULGACIóN DE LA CIENCIA / UNIVERSIDAD NACIONAL AUTóNOMA DE MéXICO¦2501A. ED.¦260MéXICO : UNAM¦30040 PAG.¦500LA BIBLIOTECA SOLAMENTE TIENE EL EJEMPLAR DEL MES DE ENERO¦5051. VOL. 1 (ENERO)¦6501. CIENCIA - PUBLICACIONES PERIóDICAS 2. TECNOLOGíA - PUBLICACIONES PERIóDICASÌ	VOL. 1 (ENERO)	'-1870':10 '-3186':11 '020issn':9 '082r':12 '1':53 '100universidad':16 '18703186':2 '2':59 '2012':6,15 '245':21 '2501a':7,35 '260méxico':37 '30040':39 '500la':41 '505':4,13 '5051':51 '6501':55 'autonom':18,32 'bibliotec':42 'cienci':29,56 'divulg':26 'ed':8,36 'ejempl':46 'ener':50,54 'issn':1 'mes':48 'mexic':20,34 'nacional':17,31 'pag':40 'period':58 'periodicasì':62 'public':57,61 'r':3 'revist':24 'sol':43 'tecnolog':60 'u58':5,14 'unam':38 'univers':30 'ves':23 'vol':52		\N	\N	\N
27	804	978-607-9192-02-0	330.972 R864 2012	2501a. Ed.	\N	0	\N	\N	0	\N	176	1b27825b-0a69-4ca6-ad68-552282a6d8e1		1	1	2	\N	2021-11-30 13:59:42	2021-11-30 13:59:42	¦020978-607-9192-02-0¦082330.972 R864 2012¦100LóPEZ ROMO, HERIBERTO¦245¿CóMO VIVIMOS LOS MEXICANOS? DATOS CURIOSOS E IMAGENES SOBRE LOS NIVELES SOCIECONóMICOS EN MéXICO / HERIBERTO LóPEZ ROMO¦2501A. ED.¦260MéXICO : INSTIRUTO DE INVESTIGACIONES SOCIALES S.C.¦300279 PAG.¦6501. MéXICO - CONDICIONES ECONóMICAS 2. PODER ADQUISITIVO - MéXICOÌ		'-0':5,15 '-02':4,14 '-607':2,12 '-9192':3,13 '020978':11 '082330.972':16 '100lópez':19 '2':54 '2012':8,18 '245':22 '2501a':9,40 '260méxico':42 '300279':48 '330.972':6 '6501':50 '978':1 'adquisit':56 'com':23 'condicion':52 'curios':28 'dat':27 'econom':53 'ed':10,41 'heribert':21,37 'imagen':30 'instirut':43 'investig':45 'lopez':38 'mexic':36,51 'mexican':26 'mexicoì':57 'nivel':33 'pag':49 'pod':55 'r864':7,17 'rom':20,39 's.c':47 'social':46 'socieconom':34 'viv':24		\N	\N	\N
44	945	978-970-07-7516-6	583.79 S914 2007	2501a. Ed.	\N	0	\N	\N	0	\N	82	8dd6d40d-99e4-4aca-a271-6906d8f9f04b		1	1	2	\N	2021-11-30 20:30:51	2021-11-30 20:30:51	¦020978-970-07-7516-6¦082583.79 S914 2007¦100STREPPONI, BLANCA¦245¿QUIEN DIJO KARTOFEL? / BLANCA STREPPONI¦2501A. ED.¦260MéXICO : EDITORIAL PORRúA¦30056 PAG.¦6501. PAPA - CULTIVO¦700I. PANTIN, YOLANDA, COAUT.Ì		'-07':3,13 '-6':5,15 '-7516':4,14 '-970':2,12 '020978':11 '082583.79':16 '100strepponi':19 '2007':8,18 '245':21 '2501a':9,27 '260méxico':29 '30056':32 '583.79':6 '6501':34 '700i':37 '978':1 'blanc':20,25 'coaut':40 'cultiv':36 'dij':23 'ed':10,28 'editorial':30 'kartofel':24 'pag':33 'pantin':38 'pap':35 'porru':31 's914':7,17 'strepponi':26 'yoland':39 'ì':41		\N	\N	\N
28	816	968-24-6043-3	155.8972 J91 2000	2501a. Ed.	\N	0	\N	\N	0	\N	60	a6609666-e487-4761-9965-48d0fe729998		1	1	2	\N	2021-11-30 14:06:14	2021-11-30 14:06:14	¦020968-24-6043-3¦082155.8972 J91 2000¦100JUáREZ SALAZAR, ANGéLICA¦245¿DE QUE TE RIES? LAS CARICATURAS Y SU RELACIóN CON EL INCONCIENTE / ANGéLICA JUáREZ SALAZAR¦2501A. ED.¦260MéXICO : EDITORIAL TRILLAS¦300226 PAG.¦6501. MEXICANO - PSICOLOGíA 2. MéXICO - VIDA SOCIAL Y COSTUMBRESÌ		'-24':2,11 '-3':4,13 '-6043':3,12 '020968':10 '082155.8972':14 '100juárez':17 '155.8972':5 '2':46 '2000':7,16 '245':20 '2501a':8,36 '260méxico':38 '300226':41 '6501':43 '968':1 'angel':19,33 'caricatur':26 'costumbresì':51 'ed':9,37 'editorial':39 'inconcient':32 'j91':6,15 'juarez':34 'mexic':47 'mexican':44 'pag':42 'psicolog':45 'relacion':29 'ries':24 'salaz':18,35 'social':49 'trill':40 'vid':48		\N	\N	\N
29	869	978-968-860-710-7	158 A223 2007	2502a. Ed.	\N	0	\N	\N	0	\N	88	22113b76-1ad7-46ee-b0a4-d311e8636993		1	1	2	\N	2021-11-30 14:15:44	2021-11-30 14:15:44	¦020978-968-860-710-7¦082158 A223 2007¦100ADDERHOLDT ELLIOT, MIRIAM¦245¿ERES PERFECCIONISTA?: DESCUBRE LO MALO DE SER DEMASIADO BUENO / MIRIAM ADDERHOLDT ELLIOT¦2502A. ED.¦260MéXICO : PAX MéXICO¦300149 PAG.¦6501. PERFECCIóNISMO¦700I. GOLDBERG, JAN, COAUT.Ì		'-7':5,15 '-710':4,14 '-860':3,13 '-968':2,12 '020978':11 '082158':16 '100adderholdt':19 '158':6 '2007':8,18 '245':22 '2502a':9,35 '260méxico':37 '300149':40 '6501':42 '700i':44 '978':1 'a223':7,17 'adderholdt':33 'buen':31 'coaut':47 'demasi':30 'descubr':25 'ed':10,36 'elliot':20,34 'goldberg':45 'jan':46 'mal':27 'mexic':39 'miriam':21,32 'pag':41 'pax':38 'perfeccion':24,43 'ser':29 'ì':48		\N	\N	\N
34	833	978-968-5950-37-4	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	5b0a8d48-5610-4110-920a-7730221f4032		1	1	2	\N	2021-11-30 14:44:35	2021-11-30 14:44:35	¦020978-968-5950-37-4¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UNA PREPOSICIóN? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. PREPOSICIONES 2. ESPAñOL - GRAMáTICA GENERAL¦700FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-37':4,14 '-4':5,15 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '700fernández':48 '978':1 'bernard':49 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'general':47 'gramat':46 'herramient':41 'il':50 'ines':21,29 'juan':20,28 'pag':37 'preposicion':27,43 'serpentin':35 'sirv':25 'ì':51		\N	\N	\N
30	837	978-968-5950-35-0	468.2 D322 2008	2501A. ED.	\N	0	\N	\N	0	\N	186	a712b02d-62e5-4b9d-8ede-55078827278b		1	1	2	\N	2021-11-30 14:24:32	2021-11-30 14:45:15	¦020978-968-5950-35-0¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN ADJETIVO / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. ADJETIVOS 2. ESPAñOL - GRAMáTICAÌ	COLEC. CAJA DE HERRAMIENTAS	'-0':5,15 '-35':4,14 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '978':1 'adjet':27,43 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'gramaticaì':46 'herramient':41 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25		\N	\N	\N
35	836	978-968-5950-34-3	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	7ec4d1ca-bb21-4801-875d-e93301244fca		1	1	2	\N	2021-11-30 14:48:53	2021-11-30 14:48:53	¦020978-968-5950-34-3¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN ADVERBIO / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. ADVERBIOS 2. ESPAñOL - GRAMáTICA GENERALÌ	COLEC. CAJA DE HERRAMIENTAS	'-3':5,15 '-34':4,14 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '978':1 'adverbi':27,43 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'generalì':47 'gramat':46 'herramient':41 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25		\N	\N	\N
166	1047	\N	380 V458F 2001	\N	\N	0	\N	\N	0	\N	245	4691b6fa-b8dc-40ea-9d9a-cacd7a37e360		1	1	2	\N	2022-01-11 19:59:58	2022-01-11 19:59:58			'2001':3 '380':1 'v458f':2	1450	\N	\N	\N
33	835	978-968-595038-1	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	c3cc0439-a4fb-435e-823f-65355232dc9b		1	1	2	\N	2021-11-30 14:41:30	2021-11-30 14:51:16	¦020978-968-595038-1¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN VERBO? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. VERBOS 2. ESPAñOL - GRAMáTICA GENERAL¦700I. FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-1':4,13 '-595038':3,12 '-968':2,11 '020978':10 '082468.2':14 '100dehesa':17 '2':42 '2008':7,16 '245':20 '2501a':8,29 '260méxico':31 '30031':34 '440colec':36 '468.2':5 '6501':40 '700i':46 '978':1 'bernard':48 'caj':37 'd322':6,15 'dehes':28 'ed':9,30 'editorial':32 'español':43 'fernandez':47 'general':45 'gramat':44 'herramient':39 'il':49 'ines':19,27 'juan':18,26 'pag':35 'serpentin':33 'sirv':23 'verb':25,41 'ì':50		\N	\N	\N
31	834	978-968-5950-48-0	468.2 D322 2008	2501a. Ed.	\N	0	\N	\N	0	\N	186	ce138d7c-1fbd-495a-a03d-a9c1345acf35		1	1	2	\N	2021-11-30 14:27:30	2021-11-30 14:50:29	¦020978-968-5950-48-0¦082468.2 D322 2008¦100DEHESA, JUANA INéS¦245¿PARA QUE SIRVE UN ARTICULO? / JUANA INéS DEHESA¦2501A. ED.¦260MéXICO : EDITORIAL SERPENTINA¦30031 PAG.¦440COLEC. CAJA DE HERRAMIENTAS¦6501. ARTICULOS 2. ESPAñOL - GRAMáTICA GENERAL¦700I. FERNáNDEZ, BERNARDO, IL.Ì	COLEC. CAJA DE HERRAMIENTAS	'-0':5,15 '-48':4,14 '-5950':3,13 '-968':2,12 '020978':11 '082468.2':16 '100dehesa':19 '2':44 '2008':8,18 '245':22 '2501a':9,31 '260méxico':33 '30031':36 '440colec':38 '468.2':6 '6501':42 '700i':48 '978':1 'articul':27,43 'bernard':50 'caj':39 'd322':7,17 'dehes':30 'ed':10,32 'editorial':34 'español':45 'fernandez':49 'general':47 'gramat':46 'herramient':41 'il':51 'ines':21,29 'juan':20,28 'pag':37 'serpentin':35 'sirv':25 'ì':52		\N	\N	\N
36	939	978-607-7511-03-8	743.8 F181 2012	2501a. Ed.	\N	0	\N	\N	0	\N	167	8e47fd4c-6370-4936-bc47-5041c22f6df1		1	1	2	\N	2021-11-30 14:57:51	2021-11-30 14:57:51	¦020978-607-7511-03-8¦082743.8 F181 2012¦100FALCóN, GLORIA¦245¿PINTAMOS MANDALAS?: APARTIR DE 5 AñOS / ILUSTRACIONES DE GLORIA FALCóN¦2501A. ED.¦260MéXICO : PRODUCCIONES EDUCACIóN APLICADA¦30071 PAG.¦500LIBRO PARA COLOREAR¦6501. MANDALAS 2. DIBUJOS 3. LIBROS PARA ILUMINARÌ		'-03':4,14 '-607':2,12 '-7511':3,13 '-8':5,15 '020978':11 '082743.8':16 '100falcón':19 '2':45 '2012':8,18 '245':21 '2501a':9,32 '260méxico':34 '3':47 '30071':38 '5':26 '500libro':40 '6501':43 '743.8':6 '978':1 'apart':24 'aplic':37 'años':27 'color':42 'dibuj':46 'ed':10,33 'educ':36 'f181':7,17 'falcon':31 'glori':20,30 'iluminarì':50 'ilustr':28 'libr':48 'mandal':23,44 'pag':39 'pint':22 'produccion':35		\N	\N	\N
37	528	84-85401-23-9	305.2355 M381 2006	\N	\N	0	\N	\N	0	\N	143	f2adbe50-b7f1-462f-a298-f40b4bef7b9d		1	1	2	\N	2021-11-30 15:04:18	2021-11-30 15:04:18	¦02084-85401-23-9¦082305.2355 M381 2006¦100MARTIN GONZáLEZ, EMILIANO¦245¿POR QUé NO ME ENTIENDEN MIS PADRES? / EMILIANO MARTIN GONZáLEZ¦260VIGO, ESPAñA : NOVA GALICIA EDICIONES¦30053 PAG.¦440SABER PARA VIVIR¦6501. ADOLESCENCIA - PSICOLOGíA 2. PADRES E HIJOSÌ	SABER PARA VIVIR	'-23':3,10 '-85401':2,9 '-9':4,11 '02084':8 '082305.2355':12 '100martin':15 '2':42 '2006':7,14 '245':18 '260vigo':29 '30053':34 '305.2355':5 '440saber':36 '6501':39 '84':1 'adolescent':40 'edicion':33 'emilian':17,26 'entiend':23 'españ':30 'galici':32 'gonzalez':16,28 'hijosì':45 'm381':6,13 'martin':27 'nov':31 'padr':25,43 'pag':35 'psicolog':41 'viv':38		\N	\N	\N
38	757	978-987-538-322-7	155.646 M585 2011	2501a. Ed.	\N	0	\N	\N	0	\N	114	11bb369a-c927-417c-b17a-576d5a426607		1	1	2	\N	2021-11-30 15:07:16	2021-11-30 15:07:16	¦020978-987-538-322-7¦082155.646 M585 2011¦100MESSING, CLAUDIA¦245¿PORQUé ES TAN DIFICIL SER PADRE HOY?. SIMETRIA INCONCIENTE DE NIñOS Y JOVENES. CONSTRUCCIóN DE NUEVOS MODELOS DE AUTORIDAD / CLAUDIA MESSING¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦30096 PAG.¦6501. PADRES E HIJOSÌ		'-322':4,14 '-538':3,13 '-7':5,15 '-987':2,12 '020978':11 '082155.646':16 '100messing':19 '155.646':6 '2011':8,18 '245':21 '2501a':9,43 '260argentina':45 '30096':53 '6501':55 '978':1 'autor':40 'centr':46 'claudi':20,41 'construccion':35 'didact':52 'dificil':25 'ed':10,44 'educ':49 'hijosì':58 'hoy':28 'inconcient':30 'joven':34 'm585':7,17 'material':51 'messing':42 'model':38 'niñ':32 'nuev':37 'padr':27,56 'pag':54 'porqu':22 'public':48 'ser':26 'simetri':29 'tan':24		\N	\N	\N
39	808	970-712-406-7	328.34 S959 2005	2504a. Ed.	\N	0	\N	\N	0	\N	148	958ab936-3483-4588-aadb-1a81f321f982		1	1	2	\N	2021-11-30 15:09:43	2021-11-30 15:09:43	¦020970-712-406-7¦082328.34 S959 2005¦100SUPREMA CORTE DE JUSTICIA DE LA NACIóN¦245¿QUE ES EL PODER JUDICIAL DE LA FEDERACIóN? / SUPREMA CORTE DE JUSTICIA DE LA NACIóN¦2504A. ED.¦260MéXICO : SUPREMA CORTE DE JUSTICIA DE LA NACIóN¦30091 PAG.¦6501. PODERES JUDICIALES - MéXICOÌ		'-406':3,12 '-7':4,13 '-712':2,11 '020970':10 '082328.34':14 '100suprema':17 '2005':7,16 '245':24 '2504a':8,40 '260méxico':42 '30091':50 '328.34':5 '6501':52 '970':1 'cort':18,34,44 'ed':9,41 'feder':32 'judicial':29,54 'justici':20,36,46 'mexicoì':55 'nacion':23,39,49 'pag':51 'pod':28 'poder':53 's959':6,15 'suprem':33,43		\N	\N	\N
40	940	978-968-16-8461-7	320.0973 F363 2008	2501a. Ed.	\N	0	\N	\N	0	\N	16	d282a7ec-132d-4b8b-8f78-54b50c26f49a		1	1	2	\N	2021-11-30 19:12:31	2021-11-30 19:12:31	¦020978-968-16-8461-7¦082320.0973 F363 2008¦100FERNáNDEZ DE CASTRO, RAFAEL¦245¿QUE ES ESTADOA UNIDOS? / RAFAEL FERNáNDEZ DE CASTRO¦2501A. ED.¦260MéXICO : FONDO DE CULTURA ECONóMICA¦300516 PAG.¦440COLEC. SECCIóN DE OBRAS DE POLíTICA Y DERECHO¦6501. E.U.A - POLíTICA Y GOBIERNO 2. E.U.A - HISTORIA¦700I. BLACKMORE, HAZAL, COORD.Ì	COLEC. SECCIóN DE OBRAS DE POLíTICA Y DERECHO	'-16':3,13 '-7':5,15 '-8461':4,14 '-968':2,12 '020978':11 '082320.0973':16 '100fernández':19 '2':54 '2008':8,18 '245':23 '2501a':9,32 '260méxico':34 '300516':39 '320.0973':6 '440colec':41 '6501':49 '700i':57 '978':1 'blackmor':58 'castr':21,31 'coord':60 'cultur':37 'derech':48 'e.u.a':50,55 'econom':38 'ed':10,33 'estado':26 'f363':7,17 'fernandez':29 'fond':35 'gobiern':53 'hazal':59 'histori':56 'obras':44 'pag':40 'polit':46,51 'rafael':22,28 'seccion':42 'unid':27 'ì':61		\N	\N	\N
41	942	978-987-3743-14-6	346.0482 F762 2015	2502a. Ed.	\N	0	\N	\N	0	\N	226	6e397d78-8df4-4c0a-82ee-d1c1160968ff		1	1	2	\N	2021-11-30 19:39:24	2021-11-30 19:39:24	¦020978-987-3743-14-6¦082346.0482 F762 2015¦100FOUCAULT, MICHEL¦245¿QUé ES UN AUTOR / MICHEL FOUCAULT¦2502A. ED.¦260MéXICO : EDITORIAL GHANDI¦30086 PAG.¦440COLEC. FILOSOFíA ENSAYO; 276¦6501. AUTORES 2. AUTOR¦700I. MATTANI, SILVIO, TR.Ì	COLEC. FILOSOFíA ENSAYO; 276	'-14':4,14 '-3743':3,13 '-6':5,15 '-987':2,12 '020978':11 '082346.0482':16 '100foucault':19 '2':41 '2015':8,18 '245':21 '2502a':9,28 '260méxico':30 '276':38 '30086':33 '346.0482':6 '440colec':35 '6501':39 '700i':43 '978':1 'autor':25,40,42 'ed':10,29 'editorial':31 'ensay':37 'f762':7,17 'filosof':36 'foucault':27 'ghandi':32 'mattani':44 'michel':20,26 'pag':34 'silvi':45 'tr':46 'ì':47		\N	\N	\N
167	1048	\N	378 U558	\N	\N	0	\N	\N	0	\N	245	5b2c5b95-a0d2-4473-bb98-a8c910a56301		1	1	2	\N	2022-01-11 20:02:16	2022-01-11 20:02:16			'378':1 'u558':2	1454	\N	\N	\N
42	943	978-968-24-7757-7	370.302812 L616 2007	\N	\N	0	\N	\N	0	\N	60	a837f874-48b8-48ab-91a8-7f49888191ab		1	1	2	\N	2021-11-30 19:43:13	2021-11-30 19:43:13	¦020978-968-24-7757-7¦082370.302812 L616 2007¦100LERMA JASSO, HéCTOR¦245¿QUé TIPO DE ALUMNO SOY? UNA GUíA PARA MEJORAR EN EL ESTUDIO / HéCTOR LERMA JASSO¦2502A. ED.¦260MéXICO : EDITORIAL TRILLAS¦300196 PAG.¦500INCLUYE ÍNDICE¦6501. ESTUDIO Y ENSEñANZA 2. ESTUDIO - MéTODO 3. PSICOLOGíA PEDAGOGICAÌ		'-24':3,11 '-7':5,13 '-7757':4,12 '-968':2,10 '020978':9 '082370.302812':14 '100lerma':17 '2':49 '2007':8,16 '245':20 '2502a':36 '260méxico':38 '3':52 '300196':41 '370.302812':6 '500incluye':43 '6501':45 '978':1 'alumn':24 'ed':37 'editorial':39 'enseñ':48 'estudi':32,46,50 'gui':27 'hector':19,33 'indic':44 'jass':18,35 'l616':7,15 'lerm':34 'mejor':29 'metod':51 'pag':42 'pedagogicaì':54 'psicolog':53 'tip':22 'trill':40		\N	\N	\N
45	946	978-970-07-7515-9	583.79 S914 2007	2501a. Ed.	\N	0	\N	\N	0	\N	82	5f486e1a-2830-4ca4-a4ee-1239354d498c		1	1	2	\N	2021-11-30 20:35:03	2021-11-30 20:35:03	¦020978-970-07-7515-9¦082583.79 S914 2007¦100STREPPONI, BLANCA¦245¿QUIéN DIJO POMODORO? / BLANCA STREPPONI¦2501A. ED.¦260MéXICO : EDITORIAL PORRúA¦30032 PAG.¦6501. JITOMATE - HISTORIA 2. JITOMATE - MERCADOTECNIAÌ		'-07':3,13 '-7515':4,14 '-9':5,15 '-970':2,12 '020978':11 '082583.79':16 '100strepponi':19 '2':37 '2007':8,18 '245':21 '2501a':9,27 '260méxico':29 '30032':32 '583.79':6 '6501':34 '978':1 'blanc':20,25 'dij':23 'ed':10,28 'editorial':30 'histori':36 'jitomat':35,38 'mercadotecniaì':39 'pag':33 'pomodor':24 'porru':31 'quien':22 's914':7,17 'strepponi':26		\N	\N	\N
46	947	978-970-07-7524-1	583.46 S914 2007	2501a. Ed.	\N	0	\N	\N	0	\N	82	781ede51-114c-4bf4-b766-1229af70ae8c		1	1	2	\N	2021-11-30 20:37:42	2021-11-30 20:37:42	¦020978-970-07-7524-1¦082583.46 S914 2007¦100STREPPONI, BLANCA¦245¿QUIéN DIJO ZAPALLO? / BLANCA STREPPONI¦2501A. ED.¦260MéXICO : EDITORIAL PORRúA¦30044 PAG.¦6501. CALABAZA - CULTIVOÌ		'-07':3,13 '-1':5,15 '-7524':4,14 '-970':2,12 '020978':11 '082583.46':16 '100strepponi':19 '2007':8,18 '245':21 '2501a':9,27 '260méxico':29 '30044':32 '583.46':6 '6501':34 '978':1 'blanc':20,25 'calabaz':35 'cultivoì':36 'dij':23 'ed':10,28 'editorial':30 'pag':33 'porru':31 'quien':22 's914':7,17 'strepponi':26 'zapall':24		\N	\N	\N
48	948	968-889-320-X	FT 863 G9856 2006	2502a. Ed.	\N	0	\N	\N	0	\N	136	0f9ed7a5-926e-4ace-88c2-fbd5357f27af		1	1	2	\N	2021-11-30 20:55:49	2021-11-30 20:55:49	"¦020968-889-320-X¦082FT 863 G9856 2006¦100GUTIéRREZ LOMASTO, GABRIELA¦245¿QUIéN LES CORTA LAS ALAS A LOS PáJAROS? / GABRIELA GUTIéRREZ LOMASTO¦2502A. ED.¦260MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦300108 PAG. / 20 CM.¦500INCLUYE ÍNDICE¦5051. CHANO CULEBRO 2. LA SOMBRA DEL CUERVO 3. ¿QUIéN LE CORTA LAS ALAS A LOS PáJAROS? 4. EL RIO GUARDA EL SECRETO 5. LA TIERRA MUERTA¦6501. CUENTOS MEXICANOS 2. ESCRITORES TABASQUEñOSÌ"		'-320':3,13 '-889':2,12 '020968':11 '082ft':15 '100gutiérrez':19 '2':51,78 '20':44 '2006':8,18 '245':22 '2502a':9,34 '260méxico':36 '3':56 '300108':42 '4':65 '5':71 '500incluye':46 '5051':48 '6501':75 '863':6,16 '968':1 'alas':27,61 'chan':49 'cm':45 'cort':25,59 'cuent':76 'cuerv':55 'culebr':50 'ed':10,35 'escritor':79 'ft':5 'g9856':7,17 'gabriel':21,31 'gobiern':37 'guard':68 'gutierrez':32 'indic':47 'lomast':20,33 'mexican':77 'muert':74 'pag':43 'pajar':30,64 'quien':23,57 'rio':67 'secret':70 'sombr':53 'tabasc':41 'tabasqueñosì':80 'tierr':73 'x':4,14		\N	\N	\N
49	949	84-7953-338-2	153.85 J69 1999	25013a. Ed.	\N	0	\N	\N	0	\N	227	1a9508b8-e508-40ea-bf88-f1800985dee3		1	1	2	\N	2021-12-01 13:56:45	2021-12-01 13:56:45	¦02084-7953-338-2¦082153.85 J69 1999¦100JOHNSON, SPENCER¦245¿QUIéN SE A LLEVADO MI QUESO?: UNA MANERA SORPRENDENTE DE AFRONTAR EL CAMBIO EN EL TRABAJO Y EN LA VIDA PRIVADA / SPENCER JOHNSON¦25013A. ED.¦260ESPAñA : EMPRESA ACTIVA¦30093 PAG.¦6501. LIBROS DE MOTIVACIóN PERSONAL 2. MOTIVACIóN DEL ÉXITOÌ		'-2':4,13 '-338':3,12 '-7953':2,11 '02084':10 '082153.85':14 '100johnson':17 '153.85':5 '1999':7,16 '2':55 '245':19 '25013a':8,43 '260españa':45 '30093':48 '6501':50 '84':1 'activ':47 'afront':30 'cambi':32 'ed':9,44 'empres':46 'exitoì':58 'j69':6,15 'johnson':42 'libr':51 'llev':23 'maner':27 'motiv':53,56 'pag':49 'personal':54 'priv':40 'ques':25 'quien':20 'sorprendent':28 'spenc':18,41 'trabaj':35 'vid':39		\N	\N	\N
50	949	84-7953-445-1	153.85 J69 2001	25025a. Ed.	\N	0	\N	\N	0	\N	227	72bdf72f-69b1-407a-b914-9ee78f04e19c		1	1	2	\N	2021-12-01 14:47:14	2021-12-01 14:47:14	¦02084-7953-445-1¦082153.85 J69 2001¦100JOHNSON, SPENCER¦245¿QUIéN SE HA LLEVADO MI QUESO?: UNA MANERA SORPRENDENTE DE AFRONTAR EL CAMBIO EN EL TRABAJO Y EN LA VIDA PRIVADA / SPENCER JOHNSON¦25025A. ED.¦260ESPAñA : EMPRESA ACTIVA¦300106 PAG.¦6501. LIBROS DE MOTIVACIóN PERSONAL 2. MOTIVACIóN DEL ÉXITOÌ		'-1':4,13 '-445':3,12 '-7953':2,11 '02084':10 '082153.85':14 '100johnson':17 '153.85':5 '2':55 '2001':7,16 '245':19 '25025a':8,43 '260españa':45 '300106':48 '6501':50 '84':1 'activ':47 'afront':30 'cambi':32 'ed':9,44 'empres':46 'exitoì':58 'j69':6,15 'johnson':42 'libr':51 'llev':23 'maner':27 'motiv':53,56 'pag':49 'personal':54 'priv':40 'ques':25 'quien':20 'sorprendent':28 'spenc':18,41 'trabaj':35 'vid':39		\N	\N	\N
51	950	978-987-538-212-1	371.9 A995 2008	2501a. Ed.	\N	0	\N	\N	0	\N	165	512c7983-28e2-4787-a5cb-be8c7ea7a499		1	1	2	\N	2021-12-01 18:55:07	2021-12-01 18:55:07	¦020978-987-538-212-1¦082371.9 A995 2008¦100AZNER, ANDREA S.¦245¿SON O SE HACEN? EL CAMPO DE LA DISCAPACIDAD INTELECTUAL ESTUDIADA A TRAVEZ DE RECORRIDOS MULTIPLES / ANDREA S. AZNER¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦300248 PAG.¦440COLEC. COLEC. DISCAPACIDAD¦500INCLUYE ÍNDICE¦6501. EDUCACIóN ESPECIAL 2. DEFICIENCIA INTELECTUAL 3. DISCAPACIDAD¦700I. GONZáLEZ CASTAñON, DIEGO, COAUT. II. SIEDE, ISABELINA A, PRóL.Ì	COLEC. COLEC. DISCAPACIDAD	'-1':5,15 '-212':4,14 '-538':3,13 '-987':2,12 '020978':11 '082371.9':16 '100azner':19 '2':62 '2008':8,18 '245':22 '2501a':9,42 '260argentina':44 '3':65 '300248':52 '371.9':6 '440colec':54 '500incluye':57 '6501':59 '700i':67 '978':1 'a995':7,17 'andre':20,39 'azner':41 'camp':28 'castañon':69 'centr':45 'coaut':71 'colec':55 'deficient':63 'didact':51 'dieg':70 'discapac':31,56,66 'ed':10,43 'educ':48,60 'especial':61 'estudi':33 'gonzalez':68 'hac':26 'ii':72 'indic':58 'intelectual':32,64 'isabelin':74 'material':50 'multipl':38 'pag':53 'prol':76 'public':47 'recorr':37 's':21,40 'sied':73 'travez':35 'ì':77		\N	\N	\N
168	1050	\N	371.425 C383P	\N	\N	0	\N	\N	0	\N	117	43620f5c-289e-4eea-9565-6808eea4f703		1	1	2	\N	2022-01-11 20:06:24	2022-01-11 20:06:24			'371.425':1 'c383p':2	1663	\N	\N	\N
169	1051	\N	371.7 S352V	\N	\N	0	\N	\N	0	\N	245	3d766698-a75b-463c-a1de-fea4a4ea3cc4		1	1	2	\N	2022-01-11 20:11:20	2022-01-11 20:11:20			'371.7':1 's352v':2	1741	\N	\N	\N
170	1052	\N	380 145 104 R355C	\N	\N	0	\N	\N	0	\N	60	0c3e7b67-d5ce-4a5e-bcd7-c72abe1cd8b2		1	1	2	\N	2022-01-11 20:14:44	2022-01-11 20:14:44			'104':3 '145':2 '380':1 'r355c':4	1543	\N	\N	\N
171	1053	\N	380 145 91 C438E	\N	\N	0	\N	\N	0	\N	60	cc500197-c5bf-4c07-8b2d-f67813eb706d		1	1	2	\N	2022-01-11 20:18:23	2022-01-11 20:18:23			'145':2 '380':1 '91':3 'c438e':4	1545	\N	\N	\N
52	951	978-968-817-877-5	333.70972 M479 2008	2501a. Ed.	\N	0	\N	\N	0	\N	38	793aeb23-db6d-40f4-873b-57851934b3ef		1	1	2	\N	2021-12-01 19:50:08	2021-12-01 19:50:08	¦020978-968-817-877-5¦082333.70972 M479 2008¦100MéXICO, SECRETARIA DE MEDIO AMBIENTE Y RECURSOS NATURALEZ¦245¿Y EL MEDIO AMBIENTE? / SEMARNAT¦2501A. ED.¦260MéXICO : SEMARNAT¦300192 PAG.¦6501. MéXICO - POLíTICA AMBIENTAL 2. MEDIO AMBIENTE - MéXICO 3. RECURSOS NATURALEZ - MéXICOÌ		'-5':5,15 '-817':3,13 '-877':4,14 '-968':2,12 '020978':11 '082333.70972':16 '100méxico':19 '2':43 '2008':8,18 '245':27 '2501a':9,33 '260méxico':35 '3':47 '300192':37 '333.70972':6 '6501':39 '978':1 'ambient':23,31,45 'ambiental':42 'ed':10,34 'm479':7,17 'medi':22,30,44 'mexic':40,46 'mexicoì':50 'naturalez':26,49 'pag':38 'polit':41 'recurs':25,48 'secretari':20 'semarnat':32,36		\N	\N	\N
53	447	978-84-96609-21-1	923.6 G458 2008	\N	\N	0	\N	\N	0	\N	132	1c71ec8f-e0a3-4652-80ee-8f9be0ba125f		1	1	2	\N	2021-12-01 19:55:38	2021-12-01 19:55:38	¦020978-84-96609-21-1¦082923.6 G458 2008¦100GIFFORD, CLIVE¦24510 LIDERES QUE CAMBIARON EL MUNDO / CLIVE GIFFORD¦260SINGAPORE : EDILUPA¦30063 PAG.¦6501. HUMANISTAS - BIOGRAFIAS 2. ESTADISTAS - BIOGRAFIíAS¦700I. COUSENS, DAVID, IL. II. SáNCHEZ ALMAGRO, IRENE, TR.Ì		'-1':5,13 '-21':4,12 '-84':2,10 '-96609':3,11 '020978':9 '082923.6':14 '100gifford':17 '2':34 '2008':8,16 '24510':19 '260singapore':27 '30063':29 '6501':31 '700i':37 '923.6':6 '978':1 'almagr':43 'biografi':33,36 'cambi':22 'cliv':18,25 'cousens':38 'dav':39 'edilup':28 'estad':35 'g458':7,15 'gifford':26 'human':32 'ii':41 'il':40 'iren':44 'lider':20 'mund':24 'pag':30 'sanchez':42 'tr':45 'ì':46		\N	\N	\N
54	953	978-90-8998-205-6	502 L664 2012	2501a. Ed.	\N	0	\N	\N	0	\N	229	f838642d-c77e-416b-a270-5d5367ed2611		1	1	2	\N	2021-12-01 20:22:19	2021-12-01 20:22:19	¦020978-90-8998-205-6¦082502 L664 2012¦100LEVY, JOEL¦245100 ANALOGíAS CIENTíFICAS / JOEL LEVY¦2501A. ED.¦260ESPAñA : LIBRERO¦300224 PAG.¦500INCLUYE ÍNDICE¦6501. CIENCIA - ESTUDIO Y ENSEñANZA 2. CIENCIA - LENGUAJE 3. CIENCIA - TERMINOLOGíA¦700I. CILLERO & DE MOTA, TR.Ì		'-205':4,14 '-6':5,15 '-8998':3,13 '-90':2,12 '020978':11 '082502':16 '100levy':19 '2':39 '2012':8,18 '245100':21 '2501a':9,26 '260españa':28 '3':42 '300224':30 '500incluye':32 '502':6 '6501':34 '700i':45 '978':1 'analog':22 'cienci':35,40,43 'cientif':23 'ciller':46 'ed':10,27 'enseñ':38 'estudi':36 'indic':33 'joel':20,24 'l664':7,17 'lenguaj':41 'levy':25 'librer':29 'mot':48 'pag':31 'terminolog':44 'tr':49 'ì':50		\N	\N	\N
55	954	978-84-9801-624-6	709 B618 2012	2501a. Ed.	\N	0	\N	\N	0	\N	230	6bfa2983-d214-4085-9047-ccb38bab9c4d		1	1	2	\N	2021-12-01 20:30:22	2021-12-01 20:30:22	¦020978-84-9801-624-6¦082709 B618 2012¦100BIRD, MICHAEL¦245100 IDEAS QUE CAMBIARóN EL ARTE / MICHAEL BIRD¦2501A. ED.¦260ESPAñA : EDITORIAL BLUME¦300216 PAG.¦6501. ARTE - HISTORIA 2. ARTE - INDUSTRIA Y COMERCIO¦700I. RODRíGUEZ FISCHER, MAITE, TR. II. RODRIGUEZ FISCHER, CRISTINA, TR.Ì		'-6':5,15 '-624':4,14 '-84':2,12 '-9801':3,13 '020978':11 '082709':16 '100bird':19 '2':39 '2012':8,18 '245100':21 '2501a':9,29 '260españa':31 '300216':34 '6501':36 '700i':44 '709':6 '978':1 'arte':26,37,40 'b618':7,17 'bird':28 'blum':33 'cambiaron':24 'comerci':43 'cristin':52 'ed':10,30 'editorial':32 'fisch':46,51 'histori':38 'ide':22 'ii':49 'industri':41 'mait':47 'michael':20,27 'pag':35 'rodriguez':45,50 'tr':48,53 'ì':54		\N	\N	\N
57	955	978-84-938183-6-4	720.9 S341 2010	2501a. Ed.	\N	0	\N	\N	0	\N	231	18542652-b7fa-4409-a8c2-04a7fb1ea18f		1	1	2	\N	2021-12-02 13:17:42	2021-12-02 13:17:42	¦020978-84-938183-6-4¦082720.9 S341 2010¦100SCHLEIFER, SIMONE K.¦2451000 ELEMENTOS DE ARQUITECTURA / COORDINACIóN EDITORIAL SIMONE K. SCHLEIFER¦2501A. ED.¦260ESPAñA : FLUSBOOKS¦300615 PAG.¦6501. ARQUITECTURA MODERNA - SIGLO XX 2. DECORACIóN Y ORNAMENTACIóN ARQUITECTONICAÌ		'-4':5,15 '-6':4,14 '-84':2,12 '-938183':3,13 '020978':11 '082720.9':16 '100schleifer':19 '2':42 '2010':8,18 '2451000':22 '2501a':9,31 '260españa':33 '300615':35 '6501':37 '720.9':6 '978':1 'arquitectonicaì':46 'arquitectur':25,38 'coordin':26 'decor':43 'ed':10,32 'editorial':27 'element':23 'flusbooks':34 'k':21,29 'modern':39 'ornament':45 'pag':36 's341':7,17 'schleif':30 'sigl':40 'simon':20,28 'xx':41		\N	\N	\N
58	956	978-3-8331-6111-7	759 S934 2011	2501a. Ed.	\N	0	\N	\N	0	\N	232	0f472200-0091-42f4-9c0b-c99a488a3d2f		1	1	2	\N	2021-12-02 13:24:13	2021-12-02 13:24:13	¦020978-3-8331-6111-7¦082759 S934 2011¦100STUKENBROCK, CHRISTIANE¦2451000 OBRAS MAESTRAS DE LA PINTURA / CHRISTIANE STUKENBROCK¦2501A. ED.¦260ESPAñA : H.F. ULMANN¦3001007 PAG.¦6501. PINTURA - TRABAJOS ANTERIORES A 1800 2. PINTURA - COLECCIONES¦700I. TOPPER, BARBARA, COAUT.Ì		'-3':2,12 '-6111':4,14 '-7':5,15 '-8331':3,13 '020978':11 '082759':16 '100stukenbrock':19 '1800':41 '2':42 '2011':8,18 '2451000':21 '2501a':9,29 '260españa':31 '3001007':34 '6501':36 '700i':45 '759':6 '978':1 'anterior':39 'barb':47 'christian':20,27 'coaut':48 'coleccion':44 'ed':10,30 'h.f':32 'maestr':23 'obras':22 'pag':35 'pintur':26,37,43 's934':7,17 'stukenbrock':28 'topp':46 'trabaj':38 'ulmann':33 'ì':49		\N	\N	\N
59	958	978-970-683-312-9	028 O66 2007	2501a. Ed.	\N	0	\N	\N	0	\N	140	3bd1e5fa-44bd-45a0-8d7a-255f73e6830b		1	1	2	\N	2021-12-02 13:39:21	2021-12-02 13:39:21	¦020978-970-683-312-9¦082028 O66 2007¦100ORELLANA, MARGARITA DE¦245101 AVENTURAS DE LA LECTURA / MARGARITA DE ORELLANA¦2501A. ED.¦260MéXICO : ARTES DE MéXICO / IBBY MéXICO¦300223 PAG.¦500INCLUYE ÍNDICE¦6501. LECTURAS - CITAS - MAXIMAS¦700I. GEDOVIUS, JUAN, IL.Ì		'-312':4,14 '-683':3,13 '-9':5,15 '-970':2,12 '020978':11 '028':6 '082028':16 '100orellana':19 '2007':8,18 '245101':22 '2501a':9,30 '260méxico':32 '300223':38 '500incluye':40 '6501':42 '700i':46 '978':1 'artes':33 'aventur':23 'cit':44 'ed':10,31 'gedovius':47 'ibby':36 'il':49 'indic':41 'juan':48 'lectur':26,43 'margarit':20,27 'maxim':45 'mexic':35,37 'o66':7,17 'orellan':29 'pag':39 'ì':50		\N	\N	\N
60	959	978-84-8076-833-7	778.37 F855 2015	2501a. Ed.	\N	0	\N	\N	0	\N	230	e7dbccb6-ea49-4e26-94ee-46a70e58f5c8		1	1	2	\N	2021-12-02 13:49:12	2021-12-02 13:49:12	¦020978-84-8076-833-7¦082778.37 F855 2015¦100FREEMAN, MICHAEL¦245101 CONSEJOS, FOTOGRAFíA DIGITAL: LOS SECRETOS DE LOS MEJORES FOTOGRáFOS DEL MUNDO / MICHAEL FREEMAN¦2501A. ED.¦260ESPAñA : EDITORIAL BLUME¦300176 PAG.¦6501. FOTOGRAFíA DIGITAL - ESTUDIO Y ENSEñANZA¦700I. BABER CASASNOVAS, CRISTOBAL, TR.Ì		'-7':5,15 '-8076':3,13 '-833':4,14 '-84':2,12 '020978':11 '082778.37':16 '100freeman':19 '2015':8,18 '245101':21 '2501a':9,35 '260españa':37 '300176':40 '6501':42 '700i':48 '778.37':6 '978':1 'bab':49 'blum':39 'casasnov':50 'consej':22 'cristobal':51 'digital':24,44 'ed':10,36 'editorial':38 'enseñ':47 'estudi':45 'f855':7,17 'fotograf':23,30,43 'freem':34 'mejor':29 'michael':20,33 'mund':32 'pag':41 'secret':26 'tr':52 'ì':53		\N	\N	\N
172	1054	\N	004.6 F676T 2007	\N	\N	0	\N	\N	0	\N	245	e65a501d-f994-4128-be06-82bfdca2b473		1	1	2	\N	2022-01-12 15:55:02	2022-01-12 15:55:02			'004.6':1 '2007':3 'f676t':2	1052	\N	\N	\N
173	1055	\N	004 D873E	\N	\N	0	\N	\N	0	\N	68	58e6dc02-1148-4e74-9764-5b4f866b37d7		1	1	2	\N	2022-01-14 14:56:55	2022-01-14 14:56:55			'004':1 'd873e':2	1376	\N	\N	\N
174	1056	\N	004 M555W	\N	\N	0	\N	\N	0	\N	111	7255c043-c137-49e5-a0ba-6251acab229a		1	1	2	\N	2022-01-14 15:01:26	2022-01-14 15:01:26			'004':1 'm555w':2	1048	\N	\N	\N
61	960	9788434237957	751.45 C212 2012	2501a. Ed.	\N	0	\N	\N	0	\N	234	c40b7a32-d719-4b2f-961c-f0468f10eae8		1	1	2	\N	2021-12-02 13:53:20	2021-12-02 13:53:20	¦020978-84-342-3795-7¦082751.45 C212 2012¦100CANAL, MA. FERNANDA¦245101 TéCNICAS OLEO / DIRECCIóN EDITORIAL DE MA. FERNANDA CANAL¦2501A. ED.¦260ESPAñA : PARRAMóN EDICIONES¦300144 PAG.¦6501. PINTURA - ESTUDIO Y ENSEñANZA¦700I. SAN MIGUEL, DAVID, EDIT.Ì		'-342':9 '-3795':10 '-7':11 '-84':8 '020978':7 '082751.45':12 '100canal':15 '2012':4,14 '245101':18 '2501a':5,27 '260españa':29 '300144':32 '6501':34 '700i':39 '751.45':2 '9788434237957':1 'c212':3,13 'canal':26 'dav':42 'direccion':21 'ed':6,28 'edicion':31 'edit':43 'editorial':22 'enseñ':38 'estudi':36 'fernand':17,25 'ma':16,24 'miguel':41 'ole':20 'pag':33 'parramon':30 'pintur':35 'san':40 'tecnic':19 'ì':44		\N	\N	\N
62	961	978-607-02-1520-9	972.0831 D671 2010	2501a. Ed.	\N	0	\N	\N	0	\N	179	061d2c9b-fcd7-4217-8464-295a50404452		1	1	2	\N	2021-12-03 15:03:23	2021-12-03 15:03:23	¦020978-607-02-1520-9¦082972.0831 D671 2010¦100DOMíNGUEZ NAVA, CUAUHTEMOC¦2451968 LA ESCUELA Y LOS ESTUDIANTES / CUAUHTEMOC DOMíNGUEZ NAVA¦2501A. ED.¦260MéXICO : UNAM¦300175 PAG.¦6501. MOVIMIENTO ESTUDIANTIL - MéXICO 2. MéXICO - CONFLICTO SOCIAL¦700I. AGUIRRE ROJAS, CARLOS ANTONIO, PRóL.Ì		'-02':3,13 '-1520':4,14 '-607':2,12 '-9':5,15 '020978':11 '082972.0831':16 '100domínguez':19 '2':41 '2010':8,18 '2451968':22 '2501a':9,31 '260méxico':33 '300175':35 '6501':37 '700i':45 '972.0831':6 '978':1 'aguirr':46 'antoni':49 'carl':48 'conflict':43 'cuauhtemoc':21,28 'd671':7,17 'dominguez':29 'ed':10,32 'escuel':24 'estudi':27 'estudiantil':39 'mexic':40,42 'movimient':38 'nav':20,30 'pag':36 'prol':50 'roj':47 'social':44 'unam':34 'ì':51		\N	\N	\N
63	806	978-970-777-338-7	158 B918 2007	2501a. Ed.	\N	0	\N	\N	0	\N	97	a824cac6-27a1-4c68-80e2-6a0591632f7a		1	1	2	\N	2021-12-07 13:31:07	2021-12-07 13:31:07	¦020978-970-777-338-7¦082158 B918 2007¦100BUCAY, JORGE¦24520 PASOS HACIA ADELANTE / JORGE BUCAY¦2501A. ED.¦260MéXICO : EDITORIAL OCEANO¦300177 PAG.¦440BIBLIOTECA JORGE BUCAY¦6501. MOTIVACIóN 2. SUPERACIóN PERSONALÌ		'-338':4,14 '-7':5,15 '-777':3,13 '-970':2,12 '020978':11 '082158':16 '100bucay':19 '158':6 '2':39 '2007':8,18 '24520':21 '2501a':9,27 '260méxico':29 '300177':32 '440biblioteca':34 '6501':37 '978':1 'adel':24 'b918':7,17 'bucay':26,36 'ed':10,28 'editorial':30 'haci':23 'jorg':20,25,35 'motiv':38 'ocean':31 'pag':33 'pas':22 'personalì':41 'super':40		\N	\N	\N
64	883	968-494-079-3	861 S487 2012	2501a. Ed.	\N	0	\N	\N	0	\N	197	5f55d275-1d77-4583-95cf-51b14d6aebd8		1	1	2	\N	2021-12-07 13:38:55	2021-12-07 13:38:55	¦020968-494-079-3¦082861 S487 2012¦100SERRANO, FRANCISCO¦24524 POETAS LATINOAMERICANOS / FRANCISCO SERRANO¦2501A. ED.¦260MéXICO : CERLALC, LATINOAMERICANA¦300254 PAG.¦6501. POESIA LATINOAMERICANA - SIGLO XX 2. POETAS LATINOAMERICANOS - SIGLO XXÌ		'-079':3,12 '-3':4,13 '-494':2,11 '020968':10 '082861':14 '100serrano':17 '2':36 '2012':7,16 '24524':19 '2501a':8,24 '260méxico':26 '300254':29 '6501':31 '861':5 '968':1 'cerlalc':27 'ed':9,25 'francisc':18,22 'latinoamerican':21,28,33,38 'pag':30 'poesi':32 'poet':20,37 's487':6,15 'serran':23 'sigl':34,39 'xx':35 'xxì':40		\N	\N	\N
65	962	978-07148-7012-0	709 T787 2015	2502a. Ed.	\N	0	\N	\N	0	\N	31	24484ae2-00e4-438f-95de-5c730811f7b5		1	1	2	\N	2021-12-07 14:19:07	2021-12-07 14:19:07	¦020978-07148-7012-0¦082709 T787 2015¦24530,000 AñOS DE ARTE: LA HISTORIA DE LA CREATIVIDAD HUMANA A TRAVéZ DEL TIEMPO Y EL ESPACIO / EDICIóN REVISADA Y ACTUALIZADA POR MIGUEL SERRANO LARRAZ Y LAURA AYALA¦2502A. ED.¦260ESTADOS UNIDOS DE AMéRICA : PHAIDON¦300656 PAG.¦6501. ARTE - HISTORIA¦700I. SERRANO LARRAZ, MIGUEL, EDIT. II. AYALA, LAURA, EDIT.Ì		'-0':4,13 '-07148':2,11 '-7012':3,12 '000':18 '020978':10 '082709':14 '2015':7,16 '24530':17 '2502a':8,46 '260estados':48 '300656':53 '6501':55 '700i':58 '709':5 '978':1 'actualiz':38 'amer':51 'arte':21,56 'ayal':45,64 'años':19 'creativ':26 'ed':9,47 'edicion':35 'edit':62,66 'espaci':34 'histori':23,57 'human':27 'ii':63 'larraz':42,60 'laur':44,65 'miguel':40,61 'pag':54 'phaidon':52 'revis':36 'serran':41,59 't787':6,15 'tiemp':31 'travez':29 'unid':49 'ì':67		\N	\N	\N
67	963	978-1-4063-2715-1	428 S786 2010	2501a. Ed.	\N	0	\N	\N	0	\N	235	dd11da6e-96fb-4486-8eb0-a9355f30b2d8		1	1	2	\N	2021-12-07 18:53:05	2021-12-07 18:53:05	¦020978-1-4063-2715-1¦082428 S786 2010¦100STANHOPE, NICK¦24531 WAYS TO CHANGE THE WORLD: BY 4,381 CHILDREN, WE ARE WHAT WE DO AND YOU / NICK STANHOPE¦2501A. ED.¦260INGLATERRA : WALKER BOOKS¦30073 PAG.¦6501. MUNDO - CAMBIOS 2. NIñOS EN EL MUNDO¦700I. NEW FUTURE GRAPHIC, IL. II. TAYLOR, TANIS, COAUT.Ì		'-1':2,5,12,15 '-2715':4,14 '-4063':3,13 '020978':11 '082428':16 '100stanhope':19 '2':50 '2010':8,18 '24531':21 '2501a':9,40 '260inglaterra':42 '30073':45 '381':29 '4':28 '428':6 '6501':47 '700i':55 '978':1 'and':36 'are':32 'books':44 'by':27 'cambi':49 'chang':24 'childr':30 'coaut':63 'do':35 'ed':10,41 'futur':57 'graphic':58 'ii':60 'il':59 'mund':48,54 'new':56 'nick':20,38 'niñ':51 'pag':46 's786':7,17 'stanhop':39 'tanis':62 'taylor':61 'the':25 'to':23 'walk':43 'ways':22 'we':31,34 'what':33 'world':26 'you':37 'ì':64		\N	\N	\N
68	828	978-607-07-0978-4	231.042 A283 2011	2501a. Ed.	\N	0	\N	\N	0	\N	68	ec736a9d-8639-4d3a-ad34-dd5c2eaf2b24		1	1	2	\N	2021-12-07 20:08:36	2021-12-07 20:08:36	¦020978-607-07-0978-4¦082231.042 A283 2011¦100AGUILAR VALDéS, JOSé DE JESúS¦245365 DIAS PARA ACERCARCE A DIOS / JOSé DE JESúS AGUILAR VALDéS¦2501A. ED.¦260MéXICO : MR EDICIONES¦300716 PAG.¦6501. DIOS - CULTO Y AMOR¦700I. OSORIO, MARIANO, PROL.Ì		'-07':3,13 '-0978':4,14 '-4':5,15 '-607':2,12 '020978':11 '082231.042':16 '100aguilar':19 '2011':8,18 '231.042':6 '245365':24 '2501a':9,35 '260méxico':37 '300716':40 '6501':42 '700i':47 '978':1 'a283':7,17 'acercarc':27 'aguil':33 'amor':46 'cult':44 'dias':25 'dios':29,43 'ed':10,36 'edicion':39 'jesus':23,32 'jos':21,30 'marian':49 'mr':38 'osori':48 'pag':41 'prol':50 'valdes':20,34 'ì':51		\N	\N	\N
91	978	\N	FT 745.097263 P784 1988	2501a. Ed.	\N	0	\N	\N	0	\N	136	6d74d60a-8588-40c2-a3c8-f8425e4a3525		1	1	2	\N	2021-12-09 15:05:46	2021-12-09 15:05:46	¦082FT 745.097263 P784 1988¦100POMAR, MARIA TERESA¦245ACERCA DEL ARTE POPULAR / MARIA TERESA POMAR¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦30025 PAG.¦440COLEC. CUADERNOS¦6501. ARTESANOS - TABASCO 2. ARTE POPULAR - TABASCOÌ	COLEC. CUADERNOS	'082ft':7 '100pomar':11 '1988':4,10 '2':38 '245acerca':14 '2501a':5,21 '260villahermosa':23 '30025':31 '440colec':33 '6501':35 '745.097263':2,8 'arte':16,39 'artesan':36 'cuad':34 'ed':6,22 'ft':1 'gobiern':26 'mari':12,18 'mexic':25 'p784':3,9 'pag':32 'pom':20 'popul':17,40 'tabasc':24,30,37 'tabascoì':41 'teres':13,19		\N	\N	\N
175	1057	\N	004 N678I 2006	\N	\N	0	\N	\N	0	\N	245	ed59aa6c-26bb-42e5-8c06-8633bc2b496f		1	1	2	\N	2022-01-14 15:06:08	2022-01-14 15:06:08			'004':1 '2006':3 'n678i':2	1051	\N	\N	\N
176	1059	\N	004 C656	\N	\N	0	\N	\N	0	\N	245	341a8b5d-d2e3-40d8-9932-1d6614693190		1	1	2	\N	2022-01-14 16:29:39	2022-01-14 16:29:39			'004':1 'c656':2	1674	\N	\N	\N
178	1060	\N	004 Z365A	\N	\N	0	\N	\N	0	\N	61	2466eb0e-3e0d-4001-87dc-4bb1f533b686		1	1	2	\N	2022-01-14 16:32:43	2022-01-14 16:32:43			'004':1 'z365a':2	1712	\N	\N	\N
109	453	978-607-14-1200-3	923.2 G111 2013	\N	\N	0	\N	\N	0	\N	133	29a02451-785a-4d8d-b99e-e8d4cc7f220d		1	1	2	\N	2021-12-10 13:35:54	2021-12-10 13:35:54	¦020978-607-14-1200-3¦082923.2 G111 2013¦100GASCA FLORES, EDGAR RODRIGO¦245ADOLFO HITLER / EDGAR GASCA FLORES¦260MéXICO : EDITORES MEXICANOS UNIDOS¦30084 PAG.¦440SERIE BIOGRAFíAS: LIDERES POLíTICOS¦6501. HITLER, ADOLFO, 1889 - 1945 - BIOGRAFíAÌ		'-1200':4,12 '-14':3,11 '-3':5,13 '-607':2,10 '020978':9 '082923.2':14 '100gasca':17 '1889':39 '1945':40 '2013':8,16 '245adolfo':21 '260méxico':26 '30084':30 '440serie':32 '6501':36 '923.2':6 '978':1 'adolf':38 'biograf':33 'biografiaì':41 'edgar':19,23 'editor':27 'flor':18,25 'g111':7,15 'gasc':24 'hitl':22,37 'lider':34 'mexican':28 'pag':31 'polit':35 'rodrig':20 'unid':29		\N	\N	\N
69	964	978-607-02-1537-7	972.0831 A958 2010	2501a. Ed.	\N	0	\N	\N	0	\N	179	bf3e8ac1-37b2-46be-a493-cfbb575dfcf2		1	1	2	\N	2021-12-07 20:27:31	2021-12-07 20:27:50	&QUOT;¦020978-607-02-1537-7¦082972.0831 A958 2010¦100AVILéS CAVASOLA, JUNCIA¦24540 AñOS MOVIMIENTO ESTUDIANTIL DEL 68 / JUNCIA AVILéS CAVASOLA¦2501A. ED.¦260MéXICO : UNAM¦3002 VOL.¦5051. VOL. 1 EL 68: TODO EL DIA Y TODA LA NOCHE, CONFERENCIAS MAGISTRALES 2. VOL. 2 EL ORDEN INVISIBLE: ARTE, ESCENA Y ESPACIO PúBLICO.¦6501. MOVIMIENTOS ESTUDIANTILES - MéXICO 2. MéXICO - CONFLICTO SOCIAL 3. MéXICO - HISTORIA - 1968 - 1970Ì&QUOT;		'-02':3,13 '-1537':4,14 '-607':2,12 '-7':5,15 '020978':11 '082972.0831':16 '1':39 '100avilés':19 '1968':73 '1970ì':74 '2':51,53,66 '2010':8,18 '24540':22 '2501a':9,31 '260méxico':33 '3':70 '3002':35 '5051':37 '6501':62 '68':27,41 '972.0831':6 '978':1 'a958':7,17 'arte':57 'aviles':29 'años':23 'cavasol':20,30 'conferent':49 'conflict':68 'dia':44 'ed':10,32 'escen':58 'espaci':60 'estudiantil':25,64 'histori':72 'invis':56 'junci':21,28 'magistral':50 'mexic':65,67,71 'movimient':24,63 'noch':48 'orden':55 'public':61 'social':69 'tod':46 'unam':34 'vol':36,38,52		\N	\N	\N
70	965	978-84-344-6937-2	720.2 W684 2010	2501a. Ed.	\N	0	\N	\N	0	\N	10	31c6d406-d0fb-4c07-81cd-ed31b3e04177		1	1	2	\N	2021-12-07 20:36:08	2021-12-07 20:36:08	¦020978-84-344-6937-2¦082720.2 W684 2010¦100WILKINSON, PHILIP¦24550 COSAS QUE HAY QUE SABER SOBRE ARQUITECTURA / PHILIP WILKINSON¦2501A. ED.¦260ESPAñA : EDITORIAL ARIEL¦300217 PAG,¦440SERIE CLAVES¦500INCLUYE ÍNDICE¦6501. ARQUITECTURA - ESTUDIO Y ENSEñANZA¦700I. ENGUIX TERCERO, MARIA, TR.Ì		'-2':5,15 '-344':3,13 '-6937':4,14 '-84':2,12 '020978':11 '082720.2':16 '100wilkinson':19 '2010':8,18 '24550':21 '2501a':9,31 '260españa':33 '300217':36 '440serie':38 '500incluye':40 '6501':42 '700i':47 '720.2':6 '978':1 'ariel':35 'arquitectur':28,43 'clav':39 'cos':22 'ed':10,32 'editorial':34 'enguix':48 'enseñ':46 'estudi':44 'indic':41 'mari':50 'pag':37 'philip':20,29 'sab':26 'tercer':49 'tr':51 'w684':7,17 'wilkinson':30 'ì':52		\N	\N	\N
71	966	950-724-909-5	302.3 F919 2007	2501a. Ed.	\N	0	\N	\N	0	\N	26	c0d5ef1d-d15f-4150-b224-7cf91d96acbc		1	1	2	\N	2021-12-08 14:40:51	2021-12-08 14:40:51	¦020950-724-909-5¦082302.3 F919 2007¦100FRITZEN, SILVINO JOSé¦24570 JUEGOS PARA DINáMICA DE GRUPOS / SILVINO JOSé FRITZEN¦2501A. ED.¦260ARGENTINA : EDITORIAL LUMEN¦300287 PAG.¦440COLEC. LUMEN BOLSILLO¦6501. ORGANIZACIóN DE GRUPOS ESCOLARES 2. GRUPOS SOCIALESÌ		'-5':4,13 '-724':2,11 '-909':3,12 '020950':10 '082302.3':14 '100fritzen':17 '2':44 '2007':7,16 '24570':20 '2501a':8,29 '260argentina':31 '300287':34 '302.3':5 '440colec':36 '6501':39 '950':1 'bolsill':38 'dinam':23 'ed':9,30 'editorial':32 'escolar':43 'f919':6,15 'fritz':28 'grup':25,42,45 'jos':19,27 'jueg':21 'lum':33,37 'organiz':40 'pag':35 'silvin':18,26 'socialesì':46		\N	\N	\N
73	727	\N	863.01 U58 2007	2501a. Ed.	\N	0	\N	\N	0	\N	91	b9e51620-aa4d-4b10-a726-f9ca9a104d75		1	1	2	\N	2021-12-09 13:46:26	2021-12-09 13:46:26	¦082863.01 U58 2007¦100UNIVERSIDAD IBEROAMéRICANA¦2458VO. CONCURSO NACIONAL DE CUENTO PREUNIVERSITARIO JUAN RULFO / UNIVERSIDAD IBEROAMéRICANA¦2501A. ED.¦260MéXICO : UNIVERSIDAD IBEROAMéRICANA¦30075 PAG.¦6501. CUENTOS MEXICANOS - SIGLO XXÌ		'082863.01':6 '100universidad':9 '2007':3,8 '2458vo':11 '2501a':4,21 '260méxico':23 '30075':26 '6501':28 '863.01':1 'concurs':12 'cuent':15,29 'ed':5,22 'iberoamerican':10,20,25 'juan':17 'mexican':30 'nacional':13 'pag':27 'preuniversitari':16 'rulf':18 'sigl':31 'u58':2,7 'univers':19,24 'xxì':32		\N	\N	\N
74	967	968-889-225-4	FT 861 R173 1991	2501a. Ed.	\N	0	\N	\N	0	\N	136	2c0168e4-f75e-43a2-a336-69200c768e9b		1	1	2	\N	2021-12-09 14:06:15	2021-12-09 14:06:15	¦020968-889-225-4¦082FT 861 R173 1991¦100RAMíREZ, KARMINA¦245A CUERPO ABIERTO / KARMINA RAMíREZ¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦300220 PAG.¦440COLEC. CREACIóN / POESíA¦6501. POESíA MEXICANA - TABASCO - SIGLO XX 2. AUTORES MEXICANOS - TABASCO - SIGLO XXÌ		'-225':3,13 '-4':4,14 '-889':2,12 '020968':11 '082ft':15 '100ramírez':19 '1991':8,18 '2':47 '245a':21 '2501a':9,26 '260villahermosa':28 '300220':36 '440colec':38 '6501':41 '861':6,16 '968':1 'abiert':23 'autor':48 'creacion':39 'cuerp':22 'ed':10,27 'ft':5 'gobiern':31 'karmin':20,24 'mexic':30 'mexican':43,49 'pag':37 'poes':40,42 'r173':7,17 'ramirez':25 'sigl':45,51 'tabasc':29,35,44,50 'xx':46 'xxì':52		\N	\N	\N
75	968	970-15-1073-9	371.30282 G2121 2010	2509a. Ed.	\N	0	\N	\N	0	\N	213	81a58843-d946-4d7b-95f7-7db01737daef		1	1	2	\N	2021-12-09 14:10:16	2021-12-09 14:10:16	¦020970-15-1073-9¦082371.30282 G2121 2010¦100GARCíA HIDOBRO B, CECILIA¦245A ESTUDIAR SE APRENDE: METODOLOGíA DE ESTUDIO SESION POR SESION / CECILIA GARCíA HIDOBRO B.¦2509A. ED.¦260MéXICO : ALFAOMEGA GRUPO EDITOR¦300191 PAG.¦500LIBRO CON EJERCICIOS¦6501. ESTUDIO - MéTODOS 2. ESTUDIANTES - ENSEñANZA¦700I. GUTIéRREZ G, MARIA CRISTINA, COAUT. II. CONDEMARíN G., ELIANA, COAUT.Ì		'-1073':3,12 '-15':2,11 '-9':4,13 '020970':10 '082371.30282':14 '100garcía':17 '2':49 '2010':7,16 '245a':21 '2509a':8,35 '260méxico':37 '300191':41 '371.30282':5 '500libro':43 '6501':46 '700i':52 '970':1 'alfaomeg':38 'aprend':24 'b':19,34 'cecili':20,31 'coaut':57,62 'condemarin':59 'cristin':56 'ed':9,36 'editor':40 'ejercici':45 'elian':61 'enseñ':51 'estudi':22,27,47,50 'g':54,60 'g2121':6,15 'garc':32 'grup':39 'gutierrez':53 'hidobr':18,33 'ii':58 'mari':55 'metod':48 'metodolog':25 'pag':42 'sesion':28,30 'ì':63		\N	\N	\N
76	544	970-29-0034-4	465 V836 2004	2501a. Ed.	\N	0	\N	\N	0	\N	48	7e0f546a-cb23-4209-a926-5b9b5ab913db		1	1	2	\N	2021-12-09 14:19:48	2021-12-09 14:19:48	¦020970-29-0034-4¦082465 V836 2004¦100VITAL, ALBERTO¦245A JUGAR CON LA GRAMáTICA / ALBERTO VITAL¦2501A. ED.¦260MéXICO : EDITORIAL SANTILLANA¦30063 PAG.¦440BIBLIOTECA JUVENIL ILUSTRADA¦6501. ESPAñOL - GRAMáTICA COMPARADAÌ		'-0034':3,12 '-29':2,11 '-4':4,13 '020970':10 '082465':14 '100vital':17 '2004':7,16 '245a':19 '2501a':8,26 '260méxico':28 '30063':31 '440biblioteca':33 '465':5 '6501':36 '970':1 'albert':18,24 'comparadaì':39 'ed':9,27 'editorial':29 'español':37 'gramat':23,38 'ilustr':35 'jug':20 'juvenil':34 'pag':32 'santillan':30 'v836':6,15 'vital':25		\N	\N	\N
179	1061	\N	004.6 C425J	\N	\N	0	\N	\N	0	\N	217	26573605-9fa8-4b91-abef-5fdce4c04ab6		1	1	2	\N	2022-01-14 16:35:11	2022-01-14 16:35:11			'004.6':1 'c425j':2	1713	\N	\N	\N
180	1062	\N	421 S883	\N	\N	0	\N	\N	0	\N	68	bec4bfbb-f6e7-4541-814f-23bcf668c18e		1	1	2	\N	2022-01-14 22:36:47	2022-01-14 22:36:47			'421':1 's883':2	437	\N	\N	\N
77	969	968-29-9793-3	972.0816 A283 1997	2501a. Ed.	\N	0	\N	\N	0	\N	58	7c52d57f-e7ae-46e6-a16c-37e67f25fbd5		1	1	2	\N	2021-12-09 14:22:26	2021-12-09 14:22:26	¦020968-29-9793-3¦082972.0816 A283 1997¦100AGUILAR CAMíN, HéCTOR¦245A LA SOMBRA DE LA REVOLUCIóN MEXICANA / HéCTOR AGUILAR CAMíN¦2501A. ED.¦260MéXICO : SEP¦300293 PAG.¦440COLEC. BIBLIOTECA PARA LA ACTUALIZACIóN DEL MAESTRO¦6501. MéXICO - HISTORIA - REVOLUCIóN, 1910 - 1917¦700I. MEYER, LORENZO, COAUT.Ì		'-29':2,11 '-3':4,13 '-9793':3,12 '020968':10 '082972.0816':14 '100aguilar':17 '1910':47 '1917':48 '1997':7,16 '245a':20 '2501a':8,30 '260méxico':32 '300293':34 '440colec':36 '6501':43 '700i':49 '968':1 '972.0816':5 'a283':6,15 'actualiz':40 'aguil':28 'bibliotec':37 'camin':18,29 'coaut':52 'ed':9,31 'hector':19,27 'histori':45 'lorenz':51 'maestr':42 'mexic':44 'mexican':26 'mey':50 'pag':35 'revolu':25,46 'sep':33 'sombr':22 'ì':53		\N	\N	\N
78	970	978-19-068-6122-3	791.43612 B766 2010	2501a. Ed.	\N	0	\N	\N	0	\N	236	ad010382-f098-433d-8490-95a7d6f7eb92		1	1	2	\N	2021-12-09 14:25:51	2021-12-09 14:25:51	¦020978-19-068-6122-3¦082791.43612 B766 2010¦100BOURKE, ANTHONY¦245A LION CALLED CHRISTIAN / ANTHONY BOURKE¦2501A. ED.¦260INGLATERRA : RICHMOND PUBLISHING¦30088 PAG.¦440RICHMOND READERS LEVEL 4¦500WITH AUDIO CD¦6501. PELICULAS DE ANIMALES 2. PELICULAS DOCUMENTALES 3. LIBROS Y LECTURAS PARA LA JUVENTUD¦700I. REVELL, JANE, EDIT. II. RENDALL, JOHN, COAUT.Ì		'-068':3,13 '-19':2,12 '-3':5,15 '-6122':4,14 '020978':11 '082791.43612':16 '100bourke':19 '2':45 '2010':8,18 '245a':21 '2501a':9,27 '260inglaterra':29 '3':48 '30088':32 '4':37 '440richmond':34 '500with':38 '6501':41 '700i':55 '791.43612':6 '978':1 'animal':44 'anthony':20,25 'audi':39 'b766':7,17 'bourk':26 'call':23 'cd':40 'christi':24 'coaut':62 'documental':47 'ed':10,28 'edit':58 'ii':59 'jan':57 'john':61 'juventud':54 'lectur':51 'level':36 'libr':49 'lion':22 'pag':33 'pelicul':42,46 'publishing':31 'readers':35 'rendall':60 'revell':56 'richmond':30 'ì':63		\N	\N	\N
79	971	968-19-0554-7	863 R763 2001	2501a. Ed.	\N	0	\N	\N	0	\N	5	95ad638c-9dd3-48c2-83b5-a99bbff60a2a		1	1	2	\N	2021-12-09 14:28:10	2021-12-09 14:28:10	¦020968-19-0554-7¦082863 R763 2001¦100ROMEU, EMMA¦245A MISSISIPPI POR EL MAR: NUEVAS AVENTURAS DE GREGORIO / EMMA ROMEU¦2501A. ED.¦260MéXICO : ALFAGUARA¦300150 PAG.¦440COLEC. ALFAGUARA INFANTIL¦6501. NOVELA CUBANA - SIGLO XX¦700I. MORA, ANGEL, IL.Ì	COLEC. ALFAGUARA INFANTIL	'-0554':3,12 '-19':2,11 '-7':4,13 '020968':10 '082863':14 '100romeu':17 '2001':7,16 '245a':19 '2501a':8,30 '260méxico':32 '300150':34 '440colec':36 '6501':39 '700i':44 '863':5 '968':1 'alfagu':33,37 'angel':46 'aventur':25 'cuban':41 'ed':9,31 'emma':18,28 'gregori':27 'il':47 'infantil':38 'mar':23 'missisippi':20 'mor':45 'novel':40 'nuev':24 'pag':35 'r763':6,15 'romeu':29 'sigl':42 'xx':43 'ì':48		\N	\N	\N
80	972	978-607-463-718-2	510.076 O39 2013	2501a. Ed.	\N	0	\N	\N	0	\N	237	9d614aaa-8ef0-4032-8f9a-065550e783d8		1	1	2	\N	2021-12-09 14:32:44	2021-12-09 14:32:44	¦020978-607-463-718-2¦082510.076 O39 2013¦100OJEDA ANIMAS, LUIS FERNANDO¦245A PRáCTICAR MATEMáTICAS: CUADERNO DE TRABAJO 1 / LUIS FERNANDO OJEDA ANIMAS¦2501A. ED.¦260MéXICO : CASTILLO¦300156 PAG.¦500LIBRO CON EJERCICIOS¦6501. MATEMáTICAS - ESTUDIO Y ENSEñANZA (SECUNDARIA) 2. MATEMáTICAS - PROBLEMAS - EJERCICIOS¦700I. MARTíNEZ LARA, CARLOS, COAUT. II. MONJARREZ CóRDOVA, ELIA, COAUT.Ì		'-2':5,15 '-463':3,13 '-607':2,12 '-718':4,14 '020978':11 '082510.076':16 '1':29 '100ojeda':19 '2':49 '2013':8,18 '245a':23 '2501a':9,34 '260méxico':36 '300156':38 '500libro':40 '510.076':6 '6501':43 '700i':53 '978':1 'anim':20,33 'carl':56 'castill':37 'coaut':57,62 'cordov':60 'cuadern':26 'ed':10,35 'ejercici':42,52 'eli':61 'enseñ':47 'estudi':45 'fern':22,31 'ii':58 'lar':55 'luis':21,30 'martinez':54 'matemat':25,44,50 'monjarrez':59 'o39':7,17 'ojed':32 'pag':39 'practic':24 'problem':51 'secundari':48 'trabaj':28 'ì':63		\N	\N	\N
81	973	0-852-41940-9	823 D548 1999	2501a. Ed.	\N	0	\N	\N	0	\N	30	25f3e67d-2a2a-4c1f-980a-1c56d6ac1800		1	1	2	\N	2021-12-09 14:35:29	2021-12-09 14:35:29	¦0200-852-41940-9¦082823 D548 1999¦100DICKENS, CHARLES¦245A TALES OF TWO CITIES / CHARLES DICKENS¦2501A. ED.¦260ESTADOS UNIDOS DE AMéRICA : PENGUIN BOOKS¦300135 PAG.¦440PENGUIN READER LEVEL 5¦6501. NOVELA INGLESA - SIGLO XIX 2. LIBROS Y LECTURAS PARA LA JUVENTUD¦700I: HOPKINS, ANDY, EDIT. II. POTTER, JOCELYN, EDITÌ		'-41940':3,12 '-852':2,11 '-9':4,13 '0':1 '0200':10 '082823':14 '100dickens':17 '1999':7,16 '2':45 '245a':19 '2501a':8,26 '260estados':28 '300135':34 '440penguin':36 '5':39 '6501':40 '700i':52 '823':5 'amer':31 'andy':54 'books':33 'charl':18,24 'citi':23 'd548':6,15 'dickens':25 'ed':9,27 'edit':55 'editì':59 'hopkins':53 'ii':56 'ingles':42 'jocelyn':58 'juventud':51 'lectur':48 'level':38 'libr':46 'novel':41 'of':21 'pag':35 'penguin':32 'pott':57 'read':37 'sigl':43 'tal':20 'two':22 'unid':29 'xix':44		\N	\N	\N
83	974	978-968-16-6441-1	056.1 P348 2001	2501a. Ed.	\N	0	\N	\N	0	\N	16	da6db3e6-a4aa-4723-844d-6ed16d4a0239		1	1	2	\N	2021-12-09 14:38:43	2021-12-09 14:38:43	¦020978-968-16-6441-1¦082056.1 P348 2001¦100PAZ, MARIE JOSé¦245A TREINTA AñOS DE PLURAL ( 1971 - 1976 ): REVISTA FUNDADA POR OCTAVIO PAZ / MARIE JOSé PAZ¦2501A. ED.¦260MéXICO : FONDO DE CULTURA ECONOMICA¦300178 PAG.¦6501. PUBLICACIONES PERIODICAS MEXICANAS 2. PLURA: CRíTICA, ARTE, LITERATURA - PUBLICACIONES¦700I. CASTAñóN, ADOLFO, COAUT. II. TORRES FIERRO, DANUBIO, COAUT.Ì		'-1':5,15 '-16':3,13 '-6441':4,14 '-968':2,12 '020978':11 '056.1':6 '082056.1':16 '100paz':19 '1971':27 '1976':28 '2':50 '2001':8,18 '245a':22 '2501a':9,37 '260méxico':39 '300178':44 '6501':46 '700i':56 '978':1 'adolf':58 'arte':53 'años':24 'castañon':57 'coaut':59,64 'critic':52 'cultur':42 'danubi':63 'econom':43 'ed':10,38 'fierr':62 'fond':40 'fund':30 'ii':60 'jos':21,35 'literatur':54 'mari':20,34 'mexican':49 'octavi':32 'p348':7,17 'pag':45 'paz':33,36 'period':48 'plur':51 'plural':26 'public':47,55 'revist':29 'torr':61 'treint':23 'ì':65		\N	\N	\N
84	975	ISSN-1665-8523	R 613.005 I59 2006	2501a. Ed.	\N	0	\N	\N	0	\N	22	4b884b65-61bc-49f7-ae05-6c219e7684b3		1	1	2	\N	2021-12-09 14:42:28	2021-12-09 14:42:28	¦020ISSN-1665-8523¦082R 613.005 I59 2006¦100INSTITUTO MEXICANO DEL SEGURO SOCIAL¦245A Tú SALUD / INSTITUTO MEXICANO DEL SEGURO SOCIAL¦2501A. ED.¦260MéXICO : IMSS, EDITORIAL MéXICO¦30096 PAG.¦500LA BIBLIOTECA SOLO CUENTA CON EL EJEMPLAR DEL MES DE ENERO DEL 2006¦6501. HIGIENE - PUBLICACIONES PERIODICAS 2. SALUD - PUBLICACIONES PERIODICAS 3. MEDICINA PREVENTIVA - PUBLICACIONES PERIODICASÌ		'-1665':2,11 '-8523':3,12 '020issn':10 '082r':13 '100instituto':17 '2':55 '2006':7,16,50 '245a':22 '2501a':8,30 '260méxico':32 '3':59 '30096':36 '500la':38 '613.005':5,14 '6501':51 'bibliotec':39 'cuent':41 'ed':9,31 'editorial':34 'ejempl':44 'ener':48 'higien':52 'i59':6,15 'imss':33 'institut':25 'issn':1 'medicin':60 'mes':46 'mexic':35 'mexican':18,26 'pag':37 'period':54,58 'periodicasì':63 'prevent':61 'public':53,57,62 'r':4 'salud':24,56 'segur':20,28 'social':21,29 'sol':40		\N	\N	\N
183	1066	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	883b1569-525f-481d-a7cb-18779035b7e3		1	1	2	\N	2022-01-14 23:56:04	2022-01-14 23:56:04			'421':1 'w674':2	431	\N	\N	\N
92	261	970-22-0384-8	540. J37 2002	\N	\N	0	\N	\N	0	\N	59	f20ecdfc-062a-44df-a232-bdca92353b85		1	1	2	\N	2021-12-09 15:11:40	2021-12-09 15:11:40	¦020970-22-0384-8¦050540. J37 2002¦100JARA REYES,SILVIA¦245ACéRCATE A LA QUíMICA 1/SILVIA JARA REYES¦260MéXICO: LAROUSSE¦300212 P./ 25 CM.¦500INCLUYE BIBLIOGRAFíA PARA EL ALUMNO Y PARA EL MAESTRO,ANEXO Y TABLA DE ELEMENTOS QUíMICOS.¦600JARA REYES,SILVIA¦6501.QUíMICA-ESTUDIO Y ENSEñANZA (SECUNDARIA)¦700I.LóPEZ VILLA,NORMA MóNICA.Ì		'-0384':3,10 '-22':2,9 '-8':4,11 '020970':8 '050540':12 '1/silvia':22 '100jara':15 '2002':7,14 '245acércate':18 '25':29 '260méxico':25 '300212':27 '500incluye':31 '540':5 '600jara':46 '6501.qu':49 '700i.l':56 '970':1 'alumn':35 'anex':40 'bibliograf':32 'cm':30 'element':44 'enseñ':54 'estudi':52 'imic':51 'imica-estudi':50 'j37':6,13 'jar':23 'larouss':26 'maestr':39 'monic':60 'norm':59 'opez':57 'p':28 'quimic':21,45 'rey':16,24,47 'secundari':55 'silvi':17,48 'tabl':42 'vill':58 'ì':61		\N	\N	\N
86	975	ISSN- 1665-8523	R 613.005 I59 2008	2501a. Ed.	\N	0	\N	\N	0	\N	238	0ced844f-c33e-4f5b-aad0-fe63e64098c2		1	1	2	\N	2021-12-09 14:49:01	2021-12-09 14:49:01	&QUOT;¦020ISSN-1665-8523¦082R 613.005 I59 2008¦100INSTITUTO MEXICANO DEL SEGURO SOCIAL¦245A Tú SALUD / INSTITUTO MEXICANO DEL SEGURO SOCIAL¦2501A. ED.¦260MéXICO : IMSS, EDITORIAL MéXICO¦3005 VOL.¦500LA BIBLIOTECA SOLO CUENTA CON LOS EJEMPLARES DE LOS MESES DE: JUNIO, AGOSTO, SEPTIEMBRE, NOVIEMBRE Y DICIEMBRE DE 2008¦5051. VOL. 1 (JUNIO) 2. VOL. 2 (AGOSTO) 3. VOL. 3 (SEPTIEMBRE) 4. VOL. 4 (NOVIEMBRE) 5. VOL. 5 (DICIEMBRE)¦6501. HIGIENE - PUBLICACIONES PERIODICAS 2. SALUD - PUBLICACIONES PERIODICAS 3. MEDICINA PEVENTIVA - PUBLICACIONES PERIODICASÌ&QUOT;		'-1665':11 '-8523':3,12 '020issn':10 '082r':13 '1':59 '100instituto':17 '1665':2 '2':61,63,81 '2008':7,16,56 '245a':22 '2501a':8,30 '260méxico':32 '3':65,67,85 '3005':36 '4':69,71 '5':73,75 '500la':38 '5051':57 '613.005':5,14 '6501':77 'agost':50,64 'bibliotec':39 'cuent':41 'diciembr':54,76 'ed':9,31 'editorial':34 'ejemplar':44 'higien':78 'i59':6,15 'imss':33 'institut':25 'issn':1 'juni':49,60 'medicin':86 'mes':47 'mexic':35 'mexican':18,26 'noviembr':52,72 'period':80,84 'periodicasì':89 'pevent':87 'public':79,83,88 'r':4 'salud':24,82 'segur':20,28 'septiembr':51,68 'social':21,29 'sol':40 'vol':37,58,62,66,70,74		\N	\N	\N
87	975	ISSN-1665- 8523	R 613.005 I59 2008	2501a. Ed.	\N	0	\N	\N	0	\N	238	e476c0a0-5ae5-4c5a-8d55-58b484af7c43		1	1	2	\N	2021-12-09 14:49:23	2021-12-09 14:49:23	"¦020ISSN-1665-8523¦082R 613.005 I59 2008¦100INSTITUTO MEXICANO DEL SEGURO SOCIAL¦245A Tú SALUD / INSTITUTO MEXICANO DEL SEGURO SOCIAL¦2501A. ED.¦260MéXICO : IMSS, EDITORIAL MéXICO¦3005 VOL.¦500LA BIBLIOTECA SOLO CUENTA CON LOS EJEMPLARES DE LOS MESES DE: JUNIO, AGOSTO, SEPTIEMBRE, NOVIEMBRE Y DICIEMBRE DE 2008¦5051. VOL. 1 (JUNIO) 2. VOL. 2 (AGOSTO) 3. VOL. 3 (SEPTIEMBRE) 4. VOL. 4 (NOVIEMBRE) 5. VOL. 5 (DICIEMBRE)¦6501. HIGIENE - PUBLICACIONES PERIODICAS 2. SALUD - PUBLICACIONES PERIODICAS 3. MEDICINA PEVENTIVA - PUBLICACIONES PERIODICASÌ"		'-1665':2,11 '-8523':12 '020issn':10 '082r':13 '1':59 '100instituto':17 '2':61,63,81 '2008':7,16,56 '245a':22 '2501a':8,30 '260méxico':32 '3':65,67,85 '3005':36 '4':69,71 '5':73,75 '500la':38 '5051':57 '613.005':5,14 '6501':77 '8523':3 'agost':50,64 'bibliotec':39 'cuent':41 'diciembr':54,76 'ed':9,31 'editorial':34 'ejemplar':44 'higien':78 'i59':6,15 'imss':33 'institut':25 'issn':1 'juni':49,60 'medicin':86 'mes':47 'mexic':35 'mexican':18,26 'noviembr':52,72 'period':80,84 'periodicasì':89 'pevent':87 'public':79,83,88 'r':4 'salud':24,82 'segur':20,28 'septiembr':51,68 'social':21,29 'sol':40 'vol':37,58,62,66,70,74		\N	\N	\N
88	976	968-23-2279-0	809.923 G643 2001	2501a. Ed.	\N	0	\N	\N	0	\N	40	b755cf78-5879-41ed-b071-569fc35a47b8		1	1	2	\N	2021-12-09 14:53:06	2021-12-09 14:53:06	¦020968-23-2279-0¦082809.923 G643 2001¦100GONZáLEZ, ANIBAL¦245ABUSOS Y ADMONICIONES: ÉTICA Y ESCRITURA EN LA NARRATIVA HISPANOAMERICANA MODERNA / ANIBAL GONZáLEZ¦2501A. ED.¦260MéXICO : SIGLO XXI EDITORES¦300205 PAG.¦440COLEC. LINGUISTICA Y TEORíA LITERARIA¦6501. LITERATURA HISANOAMERICANA - HISTORIA Y CRíTICA 2. NARRATIVA HISPANOAMERICANAÌ		'-0':4,13 '-2279':3,12 '-23':2,11 '020968':10 '082809.923':14 '100gonzález':17 '2':51 '2001':7,16 '245abusos':19 '2501a':8,32 '260méxico':34 '300205':38 '440colec':40 '6501':45 '809.923':5 '968':1 'admonicion':21 'anibal':18,30 'critic':50 'ed':9,33 'editor':37 'escritur':24 'etic':22 'g643':6,15 'gonzalez':31 'hisanoamerican':47 'hispanoamerican':28 'hispanoamericanaì':53 'histori':48 'linguist':41 'literari':44 'literatur':46 'modern':29 'narrat':27,52 'pag':39 'sigl':35 'teor':43 'xxi':36		\N	\N	\N
89	977	9786074024081	361.61 C676 2012	\N	\N	0	\N	\N	0	\N	239	9a8abe10-6d24-4633-bdb7-fa8aec8817f9		1	1	2	\N	2021-12-09 14:56:47	2021-12-09 14:56:47	¦020978-607-402-408-1¦082361.61 C676 2012¦100COGCO CALDERóN, ADOLFO ROGELIO¦245ACCIONES Y REFLEXIONES PARA LA RECONSTRUCCIóN DE LA POLíTICA SOCIAL EN MéXICO. UNA MIRADA DESDE LO LOCAL / ADOLFO ROGELIO COGCO CALDERóN¦2501A. ED.¦260MéXICO : PLAZA Y VALDéS EDITORES¦300166 PAG.¦440COLEC. CIENCIAS SOCIALES¦6501. POLíTICA SOCIAL - MéXICO¦700I. RODRíGUEZ VARGAS, MIRIAM, COAUT. II. PéREZ CRUZ, JORGE ALBERTO, COAUT.Ì		'-1':9 '-402':7 '-408':8 '-607':6 '020978':5 '082361.61':10 '100cogco':13 '2012':4,12 '245acciones':17 '2501a':38 '260méxico':40 '300166':45 '361.61':2 '440colec':47 '6501':50 '700i':54 '9786074024081':1 'adolf':15,34 'albert':63 'c676':3,11 'calderon':14,37 'cienci':48 'coaut':58,64 'cogc':36 'cruz':61 'ed':39 'editor':44 'ii':59 'jorg':62 'local':33 'mexic':28,53 'mir':30 'miriam':57 'pag':46 'perez':60 'plaz':41 'polit':25,51 'reconstruccion':22 'reflexion':19 'rodriguez':55 'rogeli':16,35 'social':26,49,52 'valdes':43 'varg':56 'ì':65		\N	\N	\N
90	84	958-04-4292-4	461.076 S211 2003	2501a. Ed.	\N	0	\N	\N	0	\N	56	fdf42cf5-6557-4869-a38d-e98f7e28c3a5		1	1	2	\N	2021-12-09 14:59:23	2021-12-09 14:59:23	¦020958-04-4292-4¦082461.076 S211 2003¦100SáNCHEZ LOZANO, CARLOS¦245ACENTO 2 : CUADERNO DE TRABAJO / CARLOS SáNCHEZ LOZANO¦2501A. ED.¦260MéXICO : GRUPO EDITORIAL NORMA¦300148 P 27 CM¦6501. ESPAñOL - ORTOGRAFíA Y DELETREO 2. ESPAñOL - LEXICOGRAFíAÌ		'-04':2,11 '-4':4,13 '-4292':3,12 '020958':10 '082461.076':14 '100sánchez':17 '2':21,43 '2003':7,16 '245acento':20 '2501a':8,28 '260méxico':30 '27':36 '300148':34 '461.076':5 '6501':38 '958':1 'carl':19,25 'cm':37 'cuadern':22 'deletre':42 'ed':9,29 'editorial':32 'español':39,44 'grup':31 'lexicografiaì':45 'lozan':18,27 'norm':33 'ortograf':40 'p':35 's211':6,15 'sanchez':26 'trabaj':24		\N	\N	\N
184	1067	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	9a82c9cb-7608-4bf1-8c78-d1167723bbf9		1	1	2	\N	2022-01-14 23:57:54	2022-01-14 23:57:54			'421':1 'w674':2	433	\N	\N	\N
185	1068	\N	421 T432	\N	\N	0	\N	\N	0	\N	245	47f29538-b01e-46dd-bc2f-ca826c8555b1		1	1	2	\N	2022-01-14 23:59:12	2022-01-14 23:59:12			'421':1 't432':2	435	\N	\N	\N
186	1069	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	bf3bbb93-83a1-4ac0-b32c-b7bf09bd14a1		1	1	2	\N	2022-01-15 00:01:01	2022-01-15 00:01:01			'421':1 'w674':2	436	\N	\N	\N
187	1070	\N	421 W674	\N	\N	0	\N	\N	0	\N	245	17053ab8-2000-4dd4-b106-d40027f39411		1	1	2	\N	2022-01-15 00:02:56	2022-01-15 00:02:56			'421':1 'w674':2	438	\N	\N	\N
188	1071	\N	421 S883	\N	\N	0	\N	\N	0	\N	245	a5f784ce-51b4-47c4-b2d4-eae6abcf33ae		1	1	2	\N	2022-01-15 00:05:10	2022-01-15 00:05:10			'421':1 's883':2	439	\N	\N	\N
93	979	978-607-7556-17-6	616.53 S399 2007	\N	\N	0	\N	\N	0	\N	240	9db2d3dd-73cf-42a5-bb61-a55f1f2f22c2		1	1	2	\N	2021-12-09 18:30:54	2021-12-09 18:30:54	¦020978-607-7556-17-6¦082616.53 S399 2007¦100SCHWARSTZBERG, JESSE SNOWFLAKE¦245ACNé JUVENIL: PUNTO Y APARTE / JESSE SNOWFLAKE SCHWARSTZBERG¦2501A. ED.¦260MéXICO : VISTO BUENO EDITORES¦30045 PAG.¦440COLEC. SALUD ADULTOS¦500PUBLICACIóN AVALADA POR COMEPA¦6501. PIEL - ENFERMEDADES 2. ACNéÌ	COLEC. SALUD ADULTOS	'-17':4,12 '-6':5,13 '-607':2,10 '-7556':3,11 '020978':9 '082616.53':14 '100schwarstzberg':17 '2':46 '2007':8,16 '245acné':20 '2501a':28 '260méxico':30 '30045':34 '440colec':36 '500publicación':39 '616.53':6 '6501':43 '978':1 'acneì':47 'adult':38 'apart':24 'aval':40 'buen':32 'comep':42 'ed':29 'editor':33 'enfermedad':45 'jess':18,25 'juvenil':21 'pag':35 'piel':44 'punt':22 's399':7,15 'salud':37 'schwarstzberg':27 'snowflak':19,26 'vist':31		\N	\N	\N
94	980	978-84-342-2186-4	751.426 C212 2008	2505a. Ed.	\N	0	\N	\N	0	\N	234	2e18df1d-bedb-4dac-8c25-ff4d29521965		1	1	2	\N	2021-12-09 18:38:53	2021-12-09 18:39:00	¦020978-84-342-2186-4¦082751.426 C212 2008¦100CANAL, MARIA FERNANDA¦245ACRíLICO: EJERCICIOS PARRAMóN / DIRECCIóN EDITORIAL DE MARIA FERNANDA CANAL¦2505A. ED.¦260ESPAñA : EDITORIAL PARRAMóN¦30032 PAG.¦440COLEC. EJERCICIOS PARRAMóN, 18¦500INCLUYE ÍNDICE¦6501. PINTURA EN ACRíLICO - ESTUDIO Y ENSAñANZAÌ	COLEC. EJERCICIOS PARRAMóN, 18	'-2186':4,14 '-342':3,13 '-4':5,15 '-84':2,12 '020978':11 '082751.426':16 '100canal':19 '18':41 '2008':8,18 '245acrílico':22 '2505a':9,31 '260españa':33 '30032':36 '440colec':38 '500incluye':42 '6501':44 '751.426':6 '978':1 'acril':47 'c212':7,17 'canal':30 'direccion':25 'ed':10,32 'editorial':26,34 'ejercici':23,39 'ensañanzaì':50 'estudi':48 'fernand':21,29 'indic':43 'mari':20,28 'pag':37 'parramon':24,35,40 'pintur':45		\N	\N	\N
95	731	978-607-11-0748-0	861 H899 2010	2501a. Ed.	\N	0	\N	\N	0	\N	72	5c3774c1-c96b-421d-95c2-34b66733ac20		1	1	2	\N	2021-12-09 18:43:01	2021-12-09 18:43:01	¦020978-607-11-0748-0¦082861 H899 2010¦100HUIDOBRO, VICENTE¦245ACRóBATA DEL CIELO: ANTOLOGíA BREVE / VIVENTE HUIDOBRO¦2501A. ED.¦260MéXICO : EDITORIAL ALFAGUARA¦300119 PAG.¦500INCLUYE ANTOLOGíA BREVE DE RODOLFO FONSECA¦6501. POESíA CHILENA - SIGLO XXÌ		'-0':5,15 '-0748':4,14 '-11':3,13 '-607':2,12 '020978':11 '082861':16 '100huidobro':19 '2010':8,18 '245acróbata':21 '2501a':9,28 '260méxico':30 '300119':33 '500incluye':35 '6501':41 '861':6 '978':1 'alfagu':32 'antolog':24,36 'brev':25,37 'chilen':43 'ciel':23 'ed':10,29 'editorial':31 'fonsec':40 'h899':7,17 'huidobr':27 'pag':34 'poes':42 'rodolf':39 'sigl':44 'vicent':20 'vivent':26 'xxì':45		\N	\N	\N
96	981	978-84-342-3722-3	751.422 C212 2015	2502a. Ed.	\N	0	\N	\N	0	\N	234	9b4c5090-3b5d-4d96-82bc-9d6c3f706c8b		1	1	2	\N	2021-12-09 18:53:00	2021-12-09 18:53:00	¦020978-84-342-3722-3¦082751.422 C212 2015¦100CANAL, MARIA FERNANDA¦245ACUARELA: 101 TéCNICAS / DIRECCIóN EDITORIAL DE MARIA FERNANDA CANAL¦2502A. ED.¦260ESPAñA : EDITORIAL PARRAMóN¦300144 PAG.¦500INCLUYE ÍNDICE¦6501. ACUARELAS - ESTUDIO Y ENSEñANZA 2. PINTURA - ESTUDIO Y ENSEñANZA¦700I. BERENGUER, ENRIC, IL.Ì		'-3':5,15 '-342':3,13 '-3722':4,14 '-84':2,12 '020978':11 '082751.422':16 '100canal':19 '101':23 '2':45 '2015':8,18 '245acuarela':22 '2502a':9,31 '260españa':33 '300144':36 '500incluye':38 '6501':40 '700i':50 '751.422':6 '978':1 'acuarel':41 'berengu':51 'c212':7,17 'canal':30 'direccion':25 'ed':10,32 'editorial':26,34 'enric':52 'enseñ':44,49 'estudi':42,47 'fernand':21,29 'il':53 'indic':39 'mari':20,28 'pag':37 'parramon':35 'pintur':46 'tecnic':24 'ì':54		\N	\N	\N
97	982	978-987-538-201-5	616.8589 B456 2007	2501a. Ed.	\N	0	\N	\N	0	\N	165	b31853f3-d7f3-4701-aca4-05954910aaba		1	1	2	\N	2021-12-09 18:56:07	2021-12-09 18:56:07	¦020978-987-538-201-5¦082616.8589 B456 2007¦100BENASAYAG, LEóN¦245ADDH. NIñOS CON DEFICIT DE ATENCIóN E HIPERACTIVIDAD: ¿UNA PATOLOGíA DE MERCADO? / LEóN BENASAYAG¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦300254 PAG.¦440COLEC. CONJUNCIONES¦6501. NIñOS PROBLEMA 2. TRASTORNOS DE ATENCIóN 3. DEFICIENCIA INTELECTUALÌ	COLEC. CONJUNCIONES	'-201':4,14 '-5':5,15 '-538':3,13 '-987':2,12 '020978':11 '082616.8589':16 '100benasayag':19 '2':52 '2007':8,18 '245addh':21 '2501a':9,35 '260argentina':37 '3':56 '300254':45 '440colec':47 '616.8589':6 '6501':49 '978':1 'atencion':26,55 'b456':7,17 'benasayag':34 'centr':38 'conjuncion':48 'deficient':57 'deficit':24 'didact':44 'ed':10,36 'educ':41 'hiperact':28 'intelectualì':58 'leon':20,33 'material':43 'merc':32 'niñ':22,50 'pag':46 'patolog':30 'problem':51 'public':40 'trastorn':53		\N	\N	\N
98	533	\N	303.4833 B388 2006	2501a. Ed.	\N	0	\N	\N	0	\N	143	6db3306e-7af8-44ac-b0b5-29f1ab04f298		1	1	2	\N	2021-12-09 19:08:31	2021-12-09 19:08:31	¦082303.4833 B388 2006¦100BECOñA IGLESIAS, ELISARDO¦245ADICCIóN A NUEVAS TECNOLOGíAS / ELISARDO BECOñA IGLESIAS¦2501A. ED.¦260VIGO, ESPAñA : NOVA GALICIA EDICIONES¦30053 PAG.¦440SABER PARA VIVIR¦6501. TECNOLOGíA - ADICCIóNÌ	SABER PARA VIVIR	'082303.4833':6 '100becoña':9 '2006':3,8 '245adicción':12 '2501a':4,19 '260vigo':21 '30053':26 '303.4833':1 '440saber':28 '6501':31 'adiccionì':33 'b388':2,7 'becoñ':17 'ed':5,20 'edicion':25 'elisard':11,16 'españ':22 'galici':24 'iglesi':10,18 'nov':23 'nuev':14 'pag':27 'tecnolog':15,32 'viv':30		\N	\N	\N
99	983	968-880-685-4	658.00711 S878 1996	2506a. Ed.	\N	0	\N	\N	0	\N	75	c5662816-9eff-491e-8b85-76565dbc0014		1	1	2	\N	2021-12-09 19:12:14	2021-12-09 19:12:14	¦020968-880-685-4¦082658.00711 S878 1996¦100STONER, JAMES A. F.¦245ADMINISTRACIóN / JAMES A. F. STONER¦2506A. ED.¦260MéXICO : PEARSON EDUCACIóN¦300688 PAG.¦500INCLUYE EJERCICIOS Y APENDICE¦6501. ADMINISTRACIóN - ESTUDIO Y ENSEñANZA¦700I. FREEMAN, R. EDWARD, COAUT. II. GILBERT, DANIEL E., COAUT. III. MASCARO SACRISTAN, PILAR, TR.Ì		'-4':4,13 '-685':3,12 '-880':2,11 '020968':10 '082658.00711':14 '100stoner':17 '1996':7,16 '245administración':21 '2506a':8,26 '260méxico':28 '300688':31 '500incluye':33 '6501':37 '658.00711':5 '700i':42 '968':1 'administr':38 'apendic':36 'coaut':46,51 'daniel':49 'ed':9,27 'educ':30 'edward':45 'ejercici':34 'enseñ':41 'estudi':39 'f':20,24 'freem':43 'gilbert':48 'ii':47 'iii':52 'jam':18,22 'mascar':53 'pag':32 'pearson':29 'pil':55 'r':44 's878':6,15 'sacrist':54 'ston':25 'tr':56 'ì':57		\N	\N	\N
108	988	84-951833-595	730.944 A239 2001	2501a. Ed,	\N	0	\N	\N	0	\N	108	8b467878-d412-4e46-990c-c8a18ec81e93		1	1	2	\N	2021-12-09 20:59:06	2021-12-09 20:59:06	¦02084-951833-595¦082730.944 A239 2001¦245ADOLFO BARNATáN / DISEñO GRáFICO JUAN GATTI¦2501A. ED,¦260ESPAñA : T. F. EDITORES¦300236 PAG,¦6501. BERNATáN, ADOLFO, 1951 - EXPOSICIONES 2. ESCULTURA FRANCESA - SIGLO XX 3. DIBUJOS FRANCESES - SIGLO XX¦700I. GATTI, JUAN, IL.Ì		'-595':3,11 '-951833':2,10 '02084':9 '082730.944':12 '1951':32 '2':34 '2001':6,14 '245adolfo':15 '2501a':7,21 '260españa':23 '3':39 '300236':27 '6501':29 '700i':44 '730.944':4 '84':1 'a239':5,13 'adolf':31 'barnatan':16 'bernatan':30 'dibuj':40 'diseñ':17 'ed':8,22 'editor':26 'escultur':35 'exposicion':33 'f':25 'frances':36,41 'gatti':20,45 'grafic':18 'il':47 'juan':19,46 'pag':28 'sigl':37,42 't':24 'xx':38,43 'ì':48		\N	\N	\N
100	984	978-607-32-0249-7	658.3 D475 2011	2505a. Ed.	\N	0	\N	\N	0	\N	55	2f1d638b-4413-4e9c-8420-8ba369b2bd59		1	1	2	\N	2021-12-09 19:49:49	2021-12-09 19:49:49	¦020978-607-32-0249-7¦082658.3 D475 2011¦100DESSLER, GARY¦245ADMINISTRACIóN DE RECURSOS HUMANOS: ENFOQUE LATINOAMERICANO / GARY DESSLER¦2505A. ED.¦260MéXICO : PRENTICE HALL¦300515 PAG.¦6501. RECURSOS HUMANOS 2. PERSONAL - DIRECCIóN¦700I. VARELA JUáREZ, RICARDO ALFREDO, COAUT. II. PINEDA AYALA, LETICIA ESTHER, TR. III. CAMPOS OLGUIN, VíCTOR, TR.Ì		'-0249':4,14 '-32':3,13 '-607':2,12 '-7':5,15 '020978':11 '082658.3':16 '100dessler':19 '2':39 '2011':8,18 '245administración':21 '2505a':9,29 '260méxico':31 '300515':34 '6501':36 '658.3':6 '700i':42 '978':1 'alfred':46 'ayal':50 'camp':55 'coaut':47 'd475':7,17 'dessl':28 'direccion':41 'ed':10,30 'enfoqu':25 'esther':52 'gary':20,27 'hall':33 'human':24,38 'ii':48 'iii':54 'juarez':44 'latinoamerican':26 'letici':51 'olguin':56 'pag':35 'personal':40 'pined':49 'prentic':32 'recurs':23,37 'ricard':45 'tr':53,58 'varel':43 'victor':57 'ì':59		\N	\N	\N
101	985	970-26-0785-X	658.00711 M963 2007	2501a. Ed.	\N	0	\N	\N	0	\N	75	87581935-d9b6-47d7-9d34-015b2afee6aa		1	1	2	\N	2021-12-09 20:05:20	2021-12-09 20:05:20	¦020970-26-0785-X¦082658.00711 M963 2007¦100MüNCH, LOURDES¦245ADMINISTRACIóN: ESCUELAS, PROCESO ADMINISTRATIVO, ÁREAS FUNCIONALES Y DESARROLLO EMPRENDEDOR / LOURDES MüNCH¦2501A. ED.¦260MéXICO : PEARSON EDUCACIóN¦300292 PAG.¦500LIBRO CON EJERCICIOS¦6501. ADMINISTRACIóN - ESTUDIO Y ENSEñANZA¦700I. RICALDE, ESPERANZA, COAUT.Ì		'-0785':3,12 '-26':2,11 '020970':10 '082658.00711':14 '100münch':17 '2007':7,16 '245administración':19 '2501a':8,30 '260méxico':32 '300292':35 '500libro':37 '6501':40 '658.00711':5 '700i':45 '970':1 'administr':22,41 'are':23 'coaut':48 'desarroll':26 'ed':9,31 'educ':34 'ejercici':39 'emprendedor':27 'enseñ':44 'escuel':20 'esper':47 'estudi':42 'funcional':24 'lourd':18,28 'm963':6,15 'münch':29 'pag':36 'pearson':33 'proces':21 'ricald':46 'x':4,13 'ì':49		\N	\N	\N
102	986	978-607-7629-06-1	305.234 R456 2009	2501a. Ed.	\N	0	\N	\N	0	\N	113	9fa7c885-80a1-458e-b0d1-4a6c3b573879		1	1	2	\N	2021-12-09 20:12:34	2021-12-09 20:12:34	¦020978-607-7629-06-1¦082305.234 R456 2009¦100REYES JUáREZ, ALEJANDRO¦245ADOLESCENCIA ENTRE MUROS: ESCUELA SECUNDARIA Y LA CONSTRUCCIóN DE IDENTIDADES JUVENILES / ALEJANDRO REYES JUáREZ¦2501A. ED.¦260MéXICO : FLACSO¦300196 PAG.¦440COLEC. TESIS PREMIADAS¦6501. ADOLESCENCIA, PSICOLOGíA DE LAÌ	COLEC. TESIS PREMIADAS	'-06':4,14 '-1':5,15 '-607':2,12 '-7629':3,13 '020978':11 '082305.234':16 '100reyes':19 '2009':8,18 '245adolescencia':22 '2501a':9,36 '260méxico':38 '300196':40 '305.234':6 '440colec':42 '6501':45 '978':1 'adolescent':46 'alejandr':21,33 'construccion':29 'ed':10,37 'escuel':25 'flacs':39 'ident':31 'juarez':20,35 'juvenil':32 'laì':49 'mur':24 'pag':41 'premi':44 'psicolog':47 'r456':7,17 'rey':34 'secundari':26 'tesis':43		\N	\N	\N
103	987	978-987-538-203-9	\N	2501a. Ed.	\N	0	\N	\N	0	\N	165	f9be0320-efd4-4295-b648-7844d686e32f		1	1	2	\N	2021-12-09 20:33:08	2021-12-09 20:33:08	¦020978-987-538-203-9¦082371.71 J95 2007¦100JUNGMAN, EVA¦245ADOLESCENCIA, TUTORIAS Y ESCUELA: TRABAJO PARTICIPATIVO Y PROMOCIóN DE LA SALUD / EVA JUNGMAN¦2501A. ED.¦260ARGENTINA : CENTRO DE PUBLICACIONES EDUCATIVAS Y MATERIAL DIDáCTICO¦300109 PAG.¦440COLEC. ENSAYOS Y EXPERIENCIAS; 67¦500INCLUYE ÍNDICE¦6501. JOVENES - CONDUCTA DE VIDA 2. ORIENTACIóN VOCACIONAL 3. TUTELAÌ	COLEC. ENSAYOS Y EXPERIENCIAS; 67	'-203':4,11 '-538':3,10 '-9':5,12 '-987':2,9 '020978':8 '082371.71':13 '100jungman':16 '2':55 '2007':15 '245adolescencia':18 '2501a':6,31 '260argentina':33 '3':58 '300109':41 '440colec':43 '500incluye':48 '6501':50 '67':47 '978':1 'centr':34 'conduct':52 'didact':40 'ed':7,32 'educ':37 'ensay':44 'escuel':21 'eva':17,29 'experient':46 'indic':49 'j95':14 'joven':51 'jungm':30 'material':39 'orient':56 'pag':42 'particip':23 'promocion':25 'public':36 'salud':28 'trabaj':22 'tutelaì':59 'tutori':19 'vid':54 'vocacional':57		\N	\N	\N
105	853	978-84-9842-255-9	305.235 N962 2009	2501a. Ed.	\N	0	\N	\N	0	\N	192	ace30205-f9c0-4a88-bc3d-e229f9927406		1	1	2	\N	2021-12-09 20:44:37	2021-12-09 20:44:37	¦020978-84-9842-255-9¦082305.235 N962 2009¦100NUEVO GONZáLEZ, ELISEO¦245ADOLESCENTES 50 CASOS PROBLEMáTICOS: ANáLISIS PICOLóGICO Y PROPUESTAS EDUCATIVAS / ELISEO NUEVO GONZáLEZ¦2501A. ED.¦260ESPAñA : EDITORIAL CCS¦300352 PAG.¦440COLECCIóN EDUCAR, 51¦6501. ADOLESCENCIA, PSICOLOGíA DE LA 2. ADOLESCENCIA - ESTUDIO DE CASOS¦700I. SáNCHEZ, DIANA, COAUT.Ì	COLECCIóN EDUCAR, 51	'-255':4,14 '-84':2,12 '-9':5,15 '-9842':3,13 '020978':11 '082305.235':16 '100nuevo':19 '2':49 '2009':8,18 '245adolescentes':22 '2501a':9,34 '260españa':36 '300352':39 '305.235':6 '440colección':41 '50':23 '51':43 '6501':44 '700i':54 '978':1 'adolescent':45,50 'analisis':26 'cas':24,53 'ccs':38 'coaut':57 'dian':56 'ed':10,35 'editorial':37 'educ':30,42 'elise':21,31 'estudi':51 'gonzalez':20,33 'n962':7,17 'nuev':32 'pag':40 'picolog':27 'problemat':25 'propuest':29 'psicolog':46 'sanchez':55 'ì':58		\N	\N	\N
106	793	978-84-92892-25-9	154.24 M722 2012	2501a. Ed.	\N	0	\N	\N	0	\N	169	e84fc215-43c4-4918-b08d-b819e2c0e46f		1	1	2	\N	2021-12-09 20:51:04	2021-12-09 20:51:04	¦020978-84-92892-25-9¦082154.24 M722 2012¦100MOLINERO, CARLOS¦245ADOLESCENTES EN CONFLICTO: COMO RECUPERAR LA ARMONIA PERDIDA / CARLOS MOLLINERO¦2501A. ED.¦260MADRID, ESPAñA : MESTAS EDICIONES¦300157 PAG.¦440COLECCIóN EL MUNDO EN TUS MANOS¦6501. ADOLESCENCIA PSICOLOGíA DE LA 2. CONFLICTOS - SOLUCIONESÌ	COLECCIóN EL MUNDO EN TUS MANOS	'-25':4,14 '-84':2,12 '-9':5,15 '-92892':3,13 '020978':11 '082154.24':16 '100molinero':19 '154.24':6 '2':50 '2012':8,18 '245adolescentes':21 '2501a':9,31 '260madrid':33 '300157':37 '440colección':39 '6501':45 '978':1 'adolescent':46 'armoni':27 'carl':20,29 'conflict':23,51 'ed':10,32 'edicion':36 'españ':34 'm722':7,17 'man':44 'mest':35 'molliner':30 'mund':41 'pag':38 'perd':28 'psicolog':47 'recuper':25 'solucionesì':52		\N	\N	\N
107	826	84-414-1689-3	155.5 M314 2005	Colección Tú Hijo y Tu; 22	\N	0	\N	\N	0	\N	182	3f581e0e-4df0-4182-be7e-f6be92737587		1	1	2	\N	2021-12-09 20:52:53	2021-12-09 20:52:53	¦02084-414-1689-3¦082155.5 M314 2005¦100MARCELLI, DANIEL¦245ADOLESCENTES, MALOS ROLLOS, COMPLEJOS Y COMEDURAS DE LOCO / DANIEL MARCELLI¦2501A. ED.¦260BARCELONA, ESPAñA : EDAF¦300292 PAG.¦440COLECCIóN Tú HIJO Y TU; 22¦6501. ADOLESCENCIA, PSICOLOGíA DE LA 2. PADRES E HIJOS¦700I. BORIE, GUILLEMETTE DE LA, COAUT.  II. TASTET, PHILIPPE, ILÌ	COLECCIóN Tú HIJO Y TU; 22	'-1689':3,16 '-3':4,17 '-414':2,15 '02084':14 '082155.5':18 '100marcelli':21 '155.5':5 '2':51 '2005':7,20 '22':13,45 '245adolescentes':23 '2501a':33 '260barcelona':35 '300292':38 '440colección':40 '6501':46 '700i':55 '84':1 'adolescent':47 'bori':56 'coaut':60 'coleccion':8 'comedur':28 'complej':26 'daniel':22,31 'ed':34 'edaf':37 'españ':36 'guillemett':57 'hij':10,42,54 'ii':61 'ilì':64 'loc':30 'm314':6,19 'mal':24 'marcelli':32 'padr':52 'pag':39 'philipp':63 'psicolog':48 'roll':25 'tastet':62		\N	\N	\N
190	1073	\N	\N	\N	380.145 910 4 C388P	0	\N	\N	0	\N	60	c69cc65d-617e-46f1-9957-a6983f301317		1	1	2	\N	2022-01-15 00:22:18	2022-01-15 00:22:18			'380.145':1 '4':3 '910':2 'c388p':4	1559	\N	\N	\N
110	990	968-889-122-3	FT 808.831 L55 1988	2501a. Ed.	\N	0	\N	\N	0	\N	242	cd01eac6-c52b-4094-ace4-f0e3695ad6d5		1	1	2	\N	2021-12-10 13:42:29	2021-12-10 13:42:29	¦020968-889-122-3¦082FT 808.831 L55 1988¦100LILLE FUENTES, MARIO DE¦245ADVERTENCIAS AMORALES AL LECTOR Y CIERTO TIPO DE CUENTOS SUMAMENTE INOCENTES / MARIO DE LILLE FUENTES¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO. INSTITUTO DE CULTURA DE TABASCO¦300257 PAG.¦440AUTORES TABASQUEñOS CONTEMPORáNEOS; 7¦6501. CUENTOS MEXICANOS - TABASCOÌ		'-122':3,13 '-3':4,14 '-889':2,12 '020968':11 '082ft':15 '100lille':19 '1988':8,18 '245advertencias':23 '2501a':9,38 '260villahermosa':40 '300257':53 '440autores':55 '6501':59 '7':58 '808.831':6,16 '968':1 'amoral':24 'ciert':28 'contemporane':57 'cuent':31,60 'cultur':50 'ed':10,39 'ft':5 'fuent':20,37 'gobiern':43 'inocent':33 'institut':48 'l55':7,17 'lector':26 'lill':36 'mari':21,34 'mexic':42 'mexican':61 'pag':54 'sum':32 'tabasc':41,47,52 'tabascoì':62 'tabasqueñ':56 'tip':29		\N	\N	\N
111	991	978-970-58-0010-8	863.01 F954 2012	2501a. Ed.	\N	0	\N	\N	0	\N	5	fad91e6e-36d3-4d10-a5ff-14f3ab84cbd3		1	1	2	\N	2021-12-10 13:50:25	2021-12-10 13:50:25	¦020978-970-58-0010-8¦082863.01 F954 2012¦100FUENTES, CARLOS¦245AGUA QUEMADA: CUARTETO / CARLOS FUENTES¦2501A. ED.¦260MéXICO : ALFAGUARA¦300173 PAG.¦6501. CUENTOS MEXICANOS - SIGLO XXÌ		'-0010':4,14 '-58':3,13 '-8':5,15 '-970':2,12 '020978':11 '082863.01':16 '100fuentes':19 '2012':8,18 '245agua':21 '2501a':9,26 '260méxico':28 '300173':30 '6501':32 '863.01':6 '978':1 'alfagu':29 'carl':20,24 'cuartet':23 'cuent':33 'ed':10,27 'f954':7,17 'fuent':25 'mexican':34 'pag':31 'quem':22 'sigl':35 'xxì':36		\N	\N	\N
112	992	968-889-259-9	FT 863.01 S687 1994	2501a. Ed.	\N	0	\N	\N	0	\N	136	e9b8f9f0-1e13-42b7-b011-1aab2f728e1e		1	1	2	\N	2021-12-10 14:01:21	2021-12-10 14:01:21	¦020968-889-259-9¦082FT 863.01 S687 1994¦100SOLIS CALVILLO, ANTONIO¦245AH, LAS HISTORIAS CONOCIDAS / ANTONIO SOLIS CALVILLO¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦30057 PAG.¦440SERIE ALIENTO¦6501. CUENTOS MEXICANOS - TABASCO - SIGLO XX 2. AUTORES MEXICANOS - TABASCO - SIGLO XXÌ		'-259':3,13 '-889':2,12 '-9':4,14 '020968':11 '082ft':15 '100solis':19 '1994':8,18 '2':49 '245ah':22 '2501a':9,29 '260villahermosa':31 '30057':39 '440serie':41 '6501':43 '863.01':6,16 '968':1 'alient':42 'antoni':21,26 'autor':50 'calvill':20,28 'conoc':25 'cuent':44 'ed':10,30 'ft':5 'gobiern':34 'histori':24 'mexic':33 'mexican':45,51 'pag':40 's687':7,17 'sigl':47,53 'solis':27 'tabasc':32,38,46,52 'xx':48 'xxì':54		\N	\N	\N
113	993	968-23-2667-2	614.4 L925 2006	2501a. Ed.	\N	0	\N	\N	0	\N	40	226b3046-ea2c-4677-843e-12e8ab1a30e7		1	1	2	\N	2021-12-10 14:04:56	2021-12-10 14:04:56	¦020968-23-2667-2¦082614.4 L925 2006¦100LOZANO, MARIO E.¦245AHI VIENE LA PLAGA: VIRUS EMERGENTES, EPIDEMIAS Y PANDEMIAS / MARIO E. LOZANO¦2501A. ED.¦260ARGENTINA : SIGLO XXI EDITORES¦300126 PAG.¦440COLEC. CIENCIA QUE LADRA¦6501. EPIDEMIOLOGíAÌ	COLEC. CIENCIA QUE LADRA	'-2':4,13 '-23':2,11 '-2667':3,12 '020968':10 '082614.4':14 '100lozano':17 '2006':7,16 '245ahi':20 '2501a':8,32 '260argentina':34 '300126':38 '440colec':40 '614.4':5 '6501':44 '968':1 'cienci':41 'ed':9,33 'editor':37 'emergent':25 'epidemi':26 'epidemiologiaì':45 'l925':6,15 'ladr':43 'lozan':31 'mari':18,29 'pag':39 'pandemi':28 'plag':23 'sigl':35 'vien':21 'virus':24 'xxi':36		\N	\N	\N
114	995	968-889-109-6	FT 398.27 S211 1987	2501a. Ed.	\N	0	\N	\N	0	\N	136	902d55d0-27e9-46d5-b4f1-9177b0991563		1	1	2	\N	2021-12-10 14:10:58	2021-12-10 14:10:58	¦020968-889-109-6¦082FT 398.27 S211 1987¦100SáNCHEZ CHABLE, TORIBIO¦245AJK´ ECH BUCH: EL PESCADOR / RELATO DE TORIBIO SáNCHEZ CHABLE¦2501A. ED.¦260VILLAHERMOSA, TABASCO, MéXICO : GOBIERNO DEL ESTADO DE TABASCO¦30020 PAG.¦440COLEC. TESTIMONIOS¦6501. PESCA - TABASCO - MéXICO - CUENTOS Y LEYENDAS 2. FOLKLORE - TABASCO - MéXICO¦700I. LóPEZ, MARCIO, IL. II. HERNáNDEZ JERóNIMO, ALEJANDRINA, TR.Ì	COLEC. TESTIMONIOS	'-109':3,13 '-6':4,14 '-889':2,12 '020968':11 '082ft':15 '100sánchez':19 '1987':8,18 '2':53 '245ajk':22 '2501a':9,32 '260villahermosa':34 '30020':42 '398.27':6,16 '440colec':44 '6501':46 '700i':57 '968':1 'alejandrin':64 'buch':24 'chabl':20,31 'cuent':50 'ech':23 'ed':10,33 'folklor':54 'ft':5 'gobiern':37 'hernandez':62 'ii':61 'il':60 'jeronim':63 'leyend':52 'lopez':58 'marci':59 'mexic':36,49,56 'pag':43 'pesc':47 'pescador':26 'relat':27 's211':7,17 'sanchez':30 'tabasc':35,41,48,55 'testimoni':45 'toribi':21,29 'tr':65 'ì':66		\N	\N	\N
115	996	978-958-04-7984-0	925.3 CH532 2004	2501a. Ed.	\N	0	\N	\N	0	\N	56	a294ecd4-4e22-481e-8c3c-3a9111e04959		1	1	2	\N	2021-12-10 14:15:27	2021-12-10 14:15:27	¦020978-958-04-7984-0¦082925.3 CH532 2004¦100CHIRINOS, JUAN CARLOS¦245ALBERT EINSTEIN: CARTAS PROBABLES / JUAN CARLOS CHIRINOS¦2501A. ED.¦260COLOMBIA : EDITORIAL NORMA¦440COLEC. SOL & LUNA¦6501. EINSTEIN, ALBERT, 1879 - 1955 - BIOGRAFíA 2. EINSTEIN, ALBERT, 1879 - 1955 - CORRESPONDENCIA - MEMORIAS¦700I. HERNáNDEZ, DECKERS, COAUT.Ì	COLEC. SOL & LUNA	'-0':5,15 '-04':3,13 '-7984':4,14 '-958':2,12 '020978':11 '082925.3':16 '100chirinos':19 '1879':40,46 '1955':41,47 '2':43 '2004':8,18 '245albert':22 '2501a':9,29 '260colombia':31 '440colec':34 '6501':37 '700i':50 '925.3':6 '978':1 'albert':39,45 'biograf':42 'carl':21,27 'cart':24 'ch532':7,17 'chirin':28 'coaut':53 'correspondent':48 'deckers':52 'ed':10,30 'editorial':32 'einstein':23,38,44 'hernandez':51 'juan':20,26 'lun':36 'memori':49 'norm':33 'probabl':25 'sol':35 'ì':54		\N	\N	\N
116	538	978-84-96950-35-1	362.292 L869 2007	2501a. Ed.	\N	0	\N	\N	0	\N	143	c84f33a3-7de7-46e5-8712-7c8868a185af		1	1	2	\N	2021-12-10 14:19:50	2021-12-10 14:19:50	¦020978-84-96950-35-1¦082362.292 L869 2007¦100LORENZO PONTEVEDRA, MA. CARMEN¦245ALCOHOL / MA. CARMEN LORENZO PONTEVEDRA¦2501A. ED.¦260VIGO, ESPAñA : NOVA GALICIA EDICIONES¦30053 PAG.¦440SABER PARA VIVIR¦6501. ALCOHOL 2. ALCOHOLISMOÌ		'-1':5,15 '-35':4,14 '-84':2,12 '-96950':3,13 '020978':11 '082362.292':16 '100lorenzo':19 '2':42 '2007':8,18 '245alcohol':23 '2501a':9,28 '260vigo':30 '30053':35 '362.292':6 '440saber':37 '6501':40 '978':1 'alcohol':41 'alcoholismoì':43 'carm':22,25 'ed':10,29 'edicion':34 'españ':31 'galici':33 'l869':7,17 'lorenz':26 'ma':21,24 'nov':32 'pag':36 'pontevedr':20,27 'viv':39		\N	\N	\N
117	538	978-84-85401-25-3	362.292 L868 2006	2501a. Ed.	\N	0	\N	\N	0	\N	143	7e10475e-5b25-46c3-98e2-e50029d8b47d		1	1	2	\N	2021-12-10 14:22:13	2021-12-10 14:22:13	¦020978-84-85401-25-3¦082362.292 L868 2006¦100LORENZO PONTEVEDRA, MARIA DEL CARMEN¦245ALCOHOL / MARIA DEL CARMEN LORENZO PONTEVEDRA¦2501A. ED.¦260VIGO, ESPAñA : NOVA GALICIA EDICIONS¦30053 PAG.¦440QUé ME DICES DE....¦6501. ALCOHOLISMO 2. ALCOHOL - PROBLEMASÌ		'-25':4,14 '-3':5,15 '-84':2,12 '-85401':3,13 '020978':11 '082362.292':16 '100lorenzo':19 '2':45 '2006':8,18 '245alcohol':24 '2501a':9,30 '260vigo':32 '30053':37 '362.292':6 '440qué':39 '6501':43 '978':1 'alcohol':44,46 'carm':23,27 'dic':41 'ed':10,31 'edicions':36 'españ':33 'galici':35 'l868':7,17 'lorenz':28 'mari':21,25 'nov':34 'pag':38 'pontevedr':20,29 'problemasì':47		\N	\N	\N
239	1131	\N	428.2 S637A 2001	\N	\N	0	\N	\N	0	\N	64	d872f69d-b91d-44a3-9d4f-732a43f8bbfe		1	1	2	\N	2022-01-26 13:54:08	2022-01-26 13:54:08			'2001':3 '428.2':1 's637a':2	453	\N	\N	\N
118	997	958-04-7986-0	923.1 CH532 2004	2501a. Ed.	\N	0	\N	\N	0	\N	56	d30dffa0-20a1-4433-8659-ef80584a0913		1	1	2	\N	2021-12-10 14:29:22	2021-12-10 14:29:22	¦020958-04-7986-0¦082923.1 CH532 2004¦100CHIRINOS, JUAN CARLOS¦245ALEJANDRO MAGNO: EL VIVO ANHELO DE CONOCER / JUAN CARLOS CHIRINOS¦2501A. ED.¦260COLOMBIA : GRUPO EDITORIAL NORMA¦300202 PAG.¦440COLEC. SOL & LUNA¦6501. ALAEJANDRO MAGNO, 356 - 323 A.D - BIOGRAFíA 2. GRECIA - HISTORIA SIGLO IV¦700I. ALEJANDRO III DE MACEDONIAÌ	COLEC. SOL & LUNA	'-0':4,13 '-04':2,11 '-7986':3,12 '020958':10 '082923.1':14 '100chirinos':17 '2':48 '2004':7,16 '245alejandro':20 '2501a':8,30 '260colombia':32 '300202':36 '323':45 '356':44 '440colec':38 '6501':41 '700i':53 '923.1':5 '958':1 'a.d':46 'alaejandr':42 'alejandr':54 'anhel':24 'biograf':47 'carl':19,28 'ch532':6,15 'chirin':29 'conoc':26 'ed':9,31 'editorial':34 'greci':49 'grup':33 'histori':50 'iii':55 'iv':52 'juan':18,27 'lun':40 'macedoniaì':57 'magn':21,43 'norm':35 'pag':37 'sigl':51 'sol':39 'viv':23		\N	\N	\N
124	1003	\N	001.42 T326T	\N	\N	0	\N	\N	0	\N	245	4d020021-43f1-4cfe-96a9-f3637fb5a6e5		1	1	2	\N	2022-01-05 14:31:51	2022-01-05 14:31:51			'001.42':1 't326t':2		\N	\N	\N
127	1006	\N	004 C656	\N	\N	0	\N	\N	0	\N	245	854649af-8fa7-403b-8e13-151dcb67de09		1	1	2	\N	2022-01-05 14:38:12	2022-01-05 14:38:12			'004':1 'c656':2		\N	\N	\N
129	1007	\N	001.42 P373M 1989	\N	\N	0	\N	\N	0	\N	245	55a9a78a-5590-475e-9282-46f1007643cd		1	1	2	\N	2022-01-05 14:40:59	2022-01-05 14:40:59			'001.42':1 '1989':3 'p373m':2		\N	\N	\N
130	1008	\N	001.42 S245M 1998	\N	\N	0	\N	\N	0	\N	245	fc86946d-2241-477c-8d0a-bff127b423e3		1	1	2	\N	2022-01-05 19:44:22	2022-01-05 19:44:22			'001.42':1 '1998':3 's245m':2		\N	\N	\N
133	1010	\N	001.4 I584	\N	\N	0	\N	\N	0	\N	245	53f5ffce-a722-49fc-8dcc-77b71975b2ca		1	1	2	\N	2022-01-06 15:00:50	2022-01-06 15:00:50			'001.4':1 'i584':2		\N	\N	\N
134	1012	\N	003 B872D	\N	\N	0	\N	\N	0	\N	245	d4cd208a-9c52-45aa-b67e-c0cd3838c325		1	1	2	\N	2022-01-06 15:05:13	2022-01-06 15:05:13			'003':1 'b872d':2		\N	\N	\N
135	1013	\N	001.42 M486	\N	\N	0	\N	\N	0	\N	245	f8532f98-cf87-4f21-909b-b9ea006f8c07		1	1	2	\N	2022-01-06 19:26:28	2022-01-06 19:26:28			'001.42':1 'm486':2		\N	\N	\N
136	1015	\N	001.42 N353M	\N	\N	0	\N	\N	0	\N	245	dc6d5db7-265b-497e-bb4a-b06cb49233be		1	1	2	\N	2022-01-06 19:33:23	2022-01-06 19:33:23			'001.42':1 'n353m':2		\N	\N	\N
145	1025	\N	398.21 V358B	\N	\N	0	\N	\N	0	\N	179	94730968-5a67-4751-8425-4fe34dd3f9e1		1	1	2	\N	2022-01-11 15:18:40	2022-01-11 15:18:40			'398.21':1 'v358b':2	\N	\N	\N	\N
146	1026	\N	398.41 E863	\N	\N	0	\N	\N	0	\N	245	a24e93f9-a119-4d12-bcbe-e2793a50b138		1	1	2	\N	2022-01-11 15:21:23	2022-01-11 15:21:23			'398.41':1 'e863':2	\N	\N	\N	\N
137	1017	\N	400 C837	\N	\N	0	\N	\N	0	\N	162	70705d5f-2115-4947-ab50-7958a88878e9		1	1	2	\N	2022-01-07 14:10:26	2022-01-07 14:13:56			'400':1 'c837':2	\N	\N	\N	\N
138	1018	\N	400 C388	\N	\N	0	\N	\N	0	\N	245	fac9caf9-dc33-4e87-9814-1c23c1b6c458		1	1	2	\N	2022-01-07 14:17:06	2022-01-07 14:17:06			'400':1 'c388':2	\N	\N	\N	\N
139	1019	\N	400 C372U	\N	\N	0	\N	\N	0	\N	245	3e53b673-1fff-40af-a1f7-558b833220a8		1	1	2	\N	2022-01-07 14:26:24	2022-01-07 14:26:24			'400':1 'c372u':2	\N	\N	\N	\N
140	1020	\N	400 C356A	\N	\N	0	\N	\N	0	\N	245	926642b4-f8f8-41b8-bd1b-70505452c17c		1	1	2	\N	2022-01-07 14:29:19	2022-01-07 14:29:19			'400':1 'c356a':2	\N	\N	\N	\N
141	1021	\N	400 B377S	\N	\N	0	\N	\N	0	\N	245	6246c9a4-581a-456e-906e-c7c4c3abfa15		1	1	2	\N	2022-01-07 14:45:31	2022-01-07 14:45:31			'400':1 'b377s':2	\N	\N	\N	\N
142	1022	\N	400 B372L	\N	\N	0	\N	\N	0	\N	245	5d2130dd-c2e0-43bc-b062-6f79ab659cad		1	1	2	\N	2022-01-07 14:49:22	2022-01-07 14:49:22			'400':1 'b372l':2	\N	\N	\N	\N
147	1028	\N	440.1 G573C	\N	\N	0	\N	\N	0	\N	245	a3144e9c-e81d-4d9f-bcde-a3467cf1b119		1	1	2	\N	2022-01-11 16:39:12	2022-01-11 16:39:12			'440.1':1 'g573c':2	\N	\N	\N	\N
148	1029	\N	440.1 C345	\N	\N	0	\N	\N	0	\N	245	feca3c7c-6699-4fb7-8fd5-ab31cca8520b		1	1	2	\N	2022-01-11 16:43:26	2022-01-11 16:43:26			'440.1':1 'c345':2	\N	\N	\N	\N
149	1030	\N	440.1 G573C	\N	\N	0	\N	\N	0	\N	245	cb148501-42f4-4205-b6f3-0811e4a44d5d		1	1	2	\N	2022-01-11 16:45:44	2022-01-11 16:45:44			'440.1':1 'g573c':2	\N	\N	\N	\N
150	1031	\N	440.0 T456 1996	\N	\N	0	\N	\N	0	\N	246	92506df1-84ba-4bfc-9b74-8838f1bf64cd		1	1	2	\N	2022-01-11 16:53:04	2022-01-11 16:53:04			'1996':3 '440.0':1 't456':2	\N	\N	\N	\N
152	1032	\N	440.1 C364E 2001	\N	\N	0	\N	\N	0	\N	245	9ade206e-de91-44f6-93fd-3c379b2037cb		1	1	2	\N	2022-01-11 16:56:00	2022-01-11 16:56:00			'2001':3 '440.1':1 'c364e':2	\N	\N	\N	\N
153	1033	\N	440.1 F678 2000	\N	\N	0	\N	\N	0	\N	247	f04540ae-af59-494e-9079-0505548e6811		1	1	2	\N	2022-01-11 18:21:08	2022-01-11 18:21:08			'2000':3 '440.1':1 'f678':2	\N	\N	\N	\N
131	1009	\N	001.42 M472C 2008	\N	02840	0	\N	\N	0	\N	245	6d2f29e3-ce60-46ed-9d1a-6a9372c967f0		1	1	2	\N	2022-01-05 19:47:30	2022-02-08 14:21:26			'001.42':1 '02840':4 '2008':3 'm472c':2	676	\N	\N	\N
143	1023	\N	400 A283	\N	00776	0	\N	\N	0	\N	245	0cb40a4d-98c0-4a45-bec9-df0ec00f3186		1	1	2	\N	2022-01-11 15:14:04	2022-02-08 14:46:56			'00776':3 '400':1 'a283':2	385	\N	\N	\N
144	1024	\N	400 A283	\N	00851	0	\N	\N	0	\N	245	f6c358d6-22e5-4e97-8ec0-b896122d390b		1	1	2	\N	2022-01-11 15:16:22	2022-02-08 14:50:36			'00851':3 '400':1 'a283':2	419	\N	\N	\N
121	1000	\N	001.42 A537G 2003	\N	00004	0	\N	\N	0	\N	245	d5db96b3-515f-47c5-868e-df4efae10146		1	1	2	\N	2022-01-04 19:55:04	2022-02-08 14:57:04			'00004':4 '001.42':1 '2003':3 'a537g':2	3	\N	\N	\N
122	1001	\N	001.42 P474C	\N	00007	0	\N	\N	0	\N	245	fe175659-faec-40ac-bd33-e2ea24ce5d1a		1	1	2	\N	2022-01-05 14:23:54	2022-02-08 14:57:44			'00007':3 '001.42':1 'p474c':2	5	\N	\N	\N
123	1002	\N	001.42 R433	\N	00008	0	\N	\N	0	\N	245	3313563c-8930-4e8e-90d9-de08a5aac270		1	1	2	\N	2022-01-05 14:26:33	2022-02-08 14:58:23			'00008':3 '001.42':1 'r433':2	6	\N	\N	\N
126	1005	\N	002 A354C	\N	00041	0	\N	\N	0	\N	245	e2592ce8-6f0c-4c9a-ac72-20f04f100f77		1	1	2	\N	2022-01-05 14:35:43	2022-02-08 17:14:16			'00041':3 '002':1 'a354c':2	8	\N	\N	\N
154	1034	\N	440.1 F678 2001	\N	\N	0	\N	\N	0	\N	247	88c041f5-6faf-4b3c-a518-690e6e990678		1	1	2	\N	2022-01-11 18:22:35	2022-01-11 18:22:35			'2001':3 '440.1':1 'f678':2	\N	\N	\N	\N
155	1035	\N	440.1 A584 2008	\N	\N	0	\N	\N	0	\N	247	872d0317-1cd9-4f46-b17f-c320a3093a7f		1	1	2	\N	2022-01-11 18:24:26	2022-01-11 18:24:26			'2008':3 '440.1':1 'a584':2	\N	\N	\N	\N
156	1036	\N	440.1 N688	\N	\N	0	\N	\N	0	\N	248	98a6fc5e-fae0-437d-8a30-b77f099f2d2f		1	1	2	\N	2022-01-11 18:27:44	2022-01-11 18:27:44			'440.1':1 'n688':2	\N	\N	\N	\N
157	1037	\N	440.1 C334 1997	\N	\N	0	\N	\N	0	\N	247	579b9816-91c2-4e71-9223-c74a1a8fa109		1	1	2	\N	2022-01-11 18:32:48	2022-01-11 18:32:48			'1997':3 '440.1':1 'c334':2	\N	\N	\N	\N
159	1040	\N	440.1 C364E VOL. 1	\N	\N	0	\N	\N	0	\N	247	523f2f55-2b03-49a6-9bf7-d5b250d31132		1	1	2	\N	2022-01-11 18:40:55	2022-01-11 18:40:55			'1':4 '440.1':1 'c364e':2 'vol':3	\N	\N	\N	\N
160	1041	\N	371.36 A385P 1990	\N	\N	0	\N	\N	0	\N	60	644a4c83-4613-45e4-85ac-987ee13006ed		1	1	2	\N	2022-01-11 19:26:52	2022-01-11 19:26:52			'1990':3 '371.36':1 'a385p':2	306	\N	\N	\N
161	1042	\N	372.6 L453	\N	\N	0	\N	\N	0	\N	179	d76db139-a92f-45c2-8cf1-7e2ddec2fb61		1	1	2	\N	2022-01-11 19:29:22	2022-01-11 19:29:22			'372.6':1 'l453':2	235	\N	\N	\N
162	1043	\N	423 O936	\N	\N	0	\N	\N	0	\N	245	e2dfbbf9-6ade-416e-acd3-d15fde7c0879		1	1	2	\N	2022-01-11 19:33:11	2022-01-11 19:33:11			'423':1 'o936':2	1092	\N	\N	\N
163	1044	\N	378.006 P655	\N	\N	0	\N	\N	0	\N	245	2a894cd5-42ab-495c-be27-0cb9dcb773eb		1	1	2	\N	2022-01-11 19:35:10	2022-01-11 19:35:10			'378.006':1 'p655':2	233	\N	\N	\N
164	1045	\N	379.82 G368P	\N	\N	0	\N	\N	0	\N	179	d132c8d1-0b18-4476-a0b7-f8113d64e3df		1	1	2	\N	2022-01-11 19:54:06	2022-01-11 19:54:06			'379.82':1 'g368p':2	232	\N	\N	\N
165	1046	\N	380 F343F	\N	\N	0	\N	\N	0	\N	245	2c75c9bd-505e-4956-8de7-c469dc0f6d5f		1	1	2	\N	2022-01-11 19:57:32	2022-01-11 19:57:32			'380':1 'f343f':2	270	\N	\N	\N
240	1132	\N	339 C384P	\N	\N	0	\N	\N	0	\N	245	25ef7d9d-ace2-434c-9b54-0f58d9f43e86		1	1	2	\N	2022-01-26 14:11:24	2022-01-26 14:11:24			'339':1 'c384p':2	292	\N	\N	\N
192	1074	\N	380-.145 338 4 A823M	\N	\N	0	\N	\N	0	\N	60	68a28c0f-3e0e-4ad2-89fa-e155f0b32ed0		1	1	2	\N	2022-01-15 00:25:46	2022-01-15 00:25:46			'145':2 '338':3 '380':1 '4':4 'a823m':5	1732	\N	\N	\N
193	1075	\N	380.145 338 4 R355M	\N	\N	0	\N	\N	0	\N	60	e8618a8d-7646-4249-bb90-31312a286978		1	1	2	\N	2022-01-15 00:27:34	2022-01-15 00:27:34			'338':2 '380.145':1 '4':3 'r355m':4	1700	\N	\N	\N
194	1076	\N	380.145 910 4 B685A	\N	\N	0	\N	\N	0	\N	60	4f6b1558-daee-41f9-912d-dae58b13989c		1	1	2	\N	2022-01-15 00:29:51	2022-01-15 00:29:51			'380.145':1 '4':3 '910':2 'b685a':4	1556	\N	\N	\N
195	1077	\N	380.145 910 4 A247C	\N	\N	0	\N	\N	0	\N	60	551321e6-6ffa-43c9-b554-f2603cf368ae		1	1	2	\N	2022-01-15 00:33:39	2022-01-15 00:33:39			'380.145':1 '4':3 '910':2 'a247c':4	1553	\N	\N	\N
196	1078	\N	380.14 P445D	\N	\N	0	\N	\N	0	\N	245	58f4ba18-b911-4ed5-8973-30d5d0e162b6		1	1	2	\N	2022-01-15 00:39:03	2022-01-15 00:39:03			'380.14':1 'p445d':2	227	\N	\N	\N
197	1079	\N	380.145 910 4 A247P	\N	\N	0	\N	\N	0	\N	245	ce664063-7373-414e-9066-05a59926e557		1	1	2	\N	2022-01-15 00:41:13	2022-01-15 00:41:13			'380.145':1 '4':3 '910':2 'a247p':4	1490	\N	\N	\N
198	1080	\N	380.145 910 4 A247A	\N	\N	0	\N	\N	0	\N	60	7bd6d4ab-97b8-4020-94dd-274b54b58b0e		1	1	2	\N	2022-01-15 00:43:51	2022-01-15 00:43:51			'380.145':1 '4':3 '910':2 'a247a':4	1493	\N	\N	\N
200	1082	\N	425 S247E 2003	\N	\N	0	\N	\N	0	\N	245	5cc5e6bf-dc06-4c57-bc70-e812e095a518		1	1	2	\N	2022-01-18 15:39:36	2022-01-18 15:39:36			'2003':3 '425':1 's247e':2	1059	\N	\N	\N
201	1083	\N	428 G858S	\N	\N	0	\N	\N	0	\N	245	53787103-1c7e-4bfd-8402-24848106e841		1	1	2	\N	2022-01-18 15:42:07	2022-01-18 15:42:07			'428':1 'g858s':2	365	\N	\N	\N
202	1084	\N	380.145 9104 C373M	\N	\N	0	\N	\N	0	\N	60	252fbe4e-b414-4c4d-a535-cbbde2d89896		1	1	2	\N	2022-01-18 18:00:26	2022-01-18 18:00:26			'380.145':1 '9104':2 'c373m':3	228	\N	\N	\N
203	1085	\N	380.145 910 V535G	\N	\N	0	\N	\N	0	\N	245	1b3bee35-cfec-491a-8fd2-63730ebf6084		1	1	2	\N	2022-01-19 15:18:46	2022-01-19 15:18:46			'380.145':1 '910':2 'v535g':3	1488	\N	\N	\N
204	1086	\N	380.145 910 48 T677A	\N	\N	0	\N	\N	0	\N	60	0cde5d32-07f7-493e-82d6-fed5a2f68231		1	1	2	\N	2022-01-19 15:23:20	2022-01-19 15:23:20			'380.145':1 '48':3 '910':2 't677a':4	1496	\N	\N	\N
199	1081	\N	425 C655	\N	01517	0	\N	\N	0	\N	245	981d0600-5149-4eaf-9753-f469c0e3f928		1	1	2	\N	2022-01-18 15:35:27	2022-02-08 14:33:25			'01517':3 '425':1 'c655':2	424	\N	\N	\N
182	1065	\N	421 T354A	\N	00863	0	\N	\N	0	\N	245	15cfcdc5-044f-4b67-a18e-a57854b72fc2		1	1	2	\N	2022-01-14 23:53:57	2022-02-08 14:38:33			'00863':3 '421':1 't354a':2	430	\N	\N	\N
205	1087	\N	380.145 910 72 E865A	\N	\N	0	\N	\N	0	\N	60	3e14b7e7-bb3c-49e5-9704-bd49eda1cbe5		1	1	2	\N	2022-01-19 15:30:07	2022-01-19 15:30:07			'380.145':1 '72':3 '910':2 'e865a':4	1561	\N	\N	\N
206	1091	\N	380.145 910 4 T677T	\N	\N	0	\N	\N	0	\N	60	3472de7f-2f27-4bb5-84be-c961b66f4f30		1	1	2	\N	2022-01-19 21:06:45	2022-01-19 21:06:45	4816		'380.145':1 '4':3 '4816':5 '910':2 't677t':4	1551	\N	\N	\N
207	1092	\N	400 M456	\N	\N	0	\N	\N	0	\N	245	2112e88a-29bb-40a2-86e9-8ea200543568		1	1	2	\N	2022-01-21 15:50:34	2022-01-21 15:50:34			'400':1 'm456':2	386	\N	\N	\N
208	1093	\N	400 M456	\N	\N	0	\N	\N	0	\N	245	946daf87-8289-48a5-833c-019fc0e04e43		1	1	2	\N	2022-01-21 15:52:16	2022-01-21 15:52:16			'400':1 'm456':2	387	\N	\N	\N
209	1095	\N	400 T365E	\N	\N	0	\N	\N	0	\N	245	a367e32d-75b1-4fd7-87c5-c3e693fbe327		1	1	2	\N	2022-01-21 16:06:35	2022-01-21 16:06:35			'400':1 't365e':2	395	\N	\N	\N
210	1097	\N	400 S837G	\N	\N	0	\N	\N	0	\N	245	7f90f5a6-c6c0-43a5-8158-1065cd51cd35		1	1	2	\N	2022-01-21 16:08:22	2022-01-21 16:08:22			'400':1 's837g':2	396	\N	\N	\N
211	1098	\N	440 C465C 2005	\N	\N	0	\N	\N	0	\N	245	385d06cb-1a81-4b6b-a1ad-59e2d3612bb0		1	1	2	\N	2022-01-21 16:12:48	2022-01-21 16:12:48			'2005':3 '440':1 'c465c':2	806	\N	\N	\N
212	1099	\N	400 R494E	\N	\N	0	\N	\N	0	\N	245	ec49a40f-f04f-4fe0-acfe-3d03040c0ef9		1	1	2	\N	2022-01-21 16:16:57	2022-01-21 16:16:57			'400':1 'r494e':2	400	\N	\N	\N
213	1100	\N	400 P474G	\N	\N	0	\N	\N	0	\N	245	3911d3b5-b462-4916-83e0-568627864b02		1	1	2	\N	2022-01-24 14:36:55	2022-01-24 14:37:09			'400':1 'p474g':2	402	\N	\N	\N
214	1101	\N	400 R859I	\N	\N	0	\N	\N	0	\N	245	a17fecd9-3b41-489f-a201-44c74a7202e0		1	1	2	\N	2022-01-24 14:39:52	2022-01-24 14:39:52			'400':1 'r859i':2	403	\N	\N	\N
215	1103	\N	400 R688P	\N	\N	0	\N	\N	0	\N	245	eb0db02f-bfcb-49df-8f4b-9f5f0092fb14		1	1	2	\N	2022-01-24 14:43:35	2022-01-24 14:43:35			'400':1 'r688p':2	404	\N	\N	\N
216	1104	\N	400 R494H	\N	\N	0	\N	\N	0	\N	245	739c8f6d-4c29-4ddb-a514-180918e972e1		1	1	2	\N	2022-01-24 14:46:06	2022-01-24 14:46:06			'400':1 'r494h':2	405	\N	\N	\N
217	1105	\N	400 L853 I584	\N	\N	0	\N	\N	0	\N	245	5ac3a13b-3a00-4d2a-83f2-ea43e44e895f		1	1	2	\N	2022-01-24 14:49:14	2022-01-24 14:49:14			'400':1 'i584':3 'l853':2	417	\N	\N	\N
218	1106	\N	400 L853 I584	\N	\N	0	\N	\N	0	\N	245	639c506b-1a0d-4919-85bd-a5bb6365899b		1	1	2	\N	2022-01-24 14:52:29	2022-01-24 14:52:29			'400':1 'i584':3 'l853':2	417	\N	\N	\N
219	1107	\N	400 U558 J675	\N	\N	0	\N	\N	0	\N	245	ad35aa3b-6e4c-4db8-8187-08b227feb7e0		1	1	2	\N	2022-01-24 15:52:18	2022-01-24 15:52:18			'400':1 'j675':3 'u558':2	380	\N	\N	\N
220	1108	\N	403 D522	\N	\N	0	\N	\N	0	\N	245	811bc505-b738-4008-b45c-dafe82a53e2a		1	1	2	\N	2022-01-24 15:54:05	2022-01-24 15:54:05			'403':1 'd522':2	381	\N	\N	\N
221	1109	\N	401.4 V723A	\N	\N	0	\N	\N	0	\N	245	3e1685cb-7670-44c2-b338-82845ea56821		1	1	2	\N	2022-01-24 16:02:16	2022-01-24 16:02:16			'401.4':1 'v723a':2	383	\N	\N	\N
222	1110	\N	401.4 B623	\N	\N	0	\N	\N	0	\N	245	aa17b482-d4c2-4178-9a3b-9b2d6f0e6bca		1	1	2	\N	2022-01-24 16:06:54	2022-01-24 16:06:54			'401.4':1 'b623':2	384	\N	\N	\N
224	1112	\N	400 U558	\N	\N	0	\N	\N	0	\N	245	6d1de138-4db7-4e2d-a78f-18d078f65c20		1	1	2	\N	2022-01-24 16:11:01	2022-01-24 16:11:01			'400':1 'u558':2	390	\N	\N	\N
225	1115	\N	401.4 A285A	\N	\N	0	\N	\N	0	\N	245	c34b4fa3-37bd-4261-9227-44a2558ef961		1	1	2	\N	2022-01-24 20:05:06	2022-01-24 20:05:06			'401.4':1 'a285a':2	394	\N	\N	\N
226	1116	\N	428 E535	\N	\N	0	\N	\N	0	\N	245	f5c69e9e-b30e-4153-aef5-d63ca5a09f5b		1	1	2	\N	2022-01-24 20:08:58	2022-01-24 20:08:58			'428':1 'e535':2	1097	\N	\N	\N
227	1117	\N	428 H373G	\N	\N	0	\N	\N	0	\N	245	459e879d-9d52-4195-af0c-fcaf4c2c092c		1	1	2	\N	2022-01-24 20:11:06	2022-01-24 20:11:06			'428':1 'h373g':2	1101	\N	\N	\N
228	1118	\N	428 S537	\N	\N	0	\N	\N	0	\N	64	bfce6a11-9658-4e4a-98e8-72108298c49e		1	1	2	\N	2022-01-25 13:45:25	2022-01-25 13:45:25			'428':1 's537':2	1035	\N	\N	\N
229	1119	\N	428.007 B532G	\N	\N	0	\N	\N	0	\N	245	9f4ab2aa-df29-4da3-8cdb-8364fb21a526		1	1	2	\N	2022-01-25 13:52:22	2022-01-25 13:52:22			'428.007':1 'b532g':2	457	\N	\N	\N
230	1120	\N	428 W558S	\N	\N	0	\N	\N	0	\N	64	d827ec30-7cf5-4505-81d3-432c4dba9ee3		1	1	2	\N	2022-01-25 13:57:59	2022-01-25 13:57:59			'428':1 'w558s':2	1036	\N	\N	\N
231	1122	\N	428 W558S	\N	\N	0	\N	\N	0	\N	64	a18610c8-5127-4237-b056-96d818c663c3		1	1	2	\N	2022-01-25 14:03:28	2022-01-25 14:03:28			'428':1 'w558s':2	1128	\N	\N	\N
232	1123	\N	664.122 A233I	\N	\N	0	\N	\N	0	\N	57	76bcefb0-5b6c-4bb7-ad9a-1f0c7507b29d		1	1	2	\N	2022-01-25 15:32:46	2022-01-25 15:32:46			'664.122':1 'a233i':2	1581	\N	\N	\N
233	1124	\N	004 G837E	\N	\N	0	\N	\N	0	\N	245	b14de0e1-1c91-434a-b7ff-1967c7cfa78b		1	1	2	\N	2022-01-25 15:34:40	2022-01-25 15:34:40			'004':1 'g837e':2	1076	\N	\N	\N
234	1126	\N	004.6 O365G 2008	\N	\N	0	\N	\N	0	\N	245	988c3e5c-c349-46eb-ad24-ae14569213d6		1	1	2	\N	2022-01-25 15:37:28	2022-01-25 15:37:28			'004.6':1 '2008':3 'o365g':2	1381	\N	\N	\N
235	1127	\N	004.6 O365G 2008	\N	\N	0	\N	\N	0	\N	245	2ef24bcb-66d7-4553-a9f8-98a151af3d8a		1	1	2	\N	2022-01-25 15:39:49	2022-01-25 15:39:49			'004.6':1 '2008':3 'o365g':2	756	\N	\N	\N
236	1129	\N	428.007 S868H	\N	\N	0	\N	\N	0	\N	64	2296ced3-8789-4c3a-83a9-8561c24183d7		1	1	2	\N	2022-01-26 13:33:36	2022-01-26 13:33:36			'428.007':1 's868h':2	458	\N	\N	\N
237	1128	\N	428.007 S868H	\N	\N	0	\N	\N	0	\N	64	569fd6f9-1728-4c47-90d2-6c939c24c06f		1	1	2	\N	2022-01-26 13:34:22	2022-01-26 13:34:22			'428.007':1 's868h':2	458	\N	\N	\N
238	1130	\N	428.2 S637A 2002	\N	\N	0	\N	\N	0	\N	64	055a62db-3942-437c-ba5c-8f72e89343c9		1	1	2	\N	2022-01-26 13:51:42	2022-01-26 13:51:42			'2002':3 '428.2':1 's637a':2	452	\N	\N	\N
241	1135	\N	340 C555L	\N	\N	0	\N	\N	0	\N	122	32aeff1e-80b9-4a6d-b0ca-3c80dba7f1fa		1	1	2	\N	2022-01-26 14:27:09	2022-01-26 14:27:09			'340':1 'c555l':2	1738	\N	\N	\N
243	1133	\N	339 D675M 1991	\N	\N	0	\N	\N	0	\N	245	d4de9c3f-9c45-476b-96f8-6178e48c12c1		1	1	2	\N	2022-01-26 14:38:41	2022-01-26 14:38:41			'1991':3 '339':1 'd675m':2	223	\N	\N	\N
244	1136	\N	340 M686E 2007	\N	\N	0	\N	\N	0	\N	139	68bb6532-4868-426b-a6c0-c9387e53f95d		1	1	2	\N	2022-01-26 14:43:24	2022-01-26 14:43:24			'2007':3 '340':1 'm686e':2	1136	\N	\N	\N
245	1139	\N	340 M686E 2006	\N	\N	0	\N	\N	0	\N	82	20b77de4-38fc-479f-b708-8377643c7be4		1	1	2	\N	2022-01-26 14:47:30	2022-01-26 14:47:30			'2006':3 '340':1 'm686e':2	2560	\N	\N	\N
246	1140	\N	406 R637G	\N	\N	0	\N	\N	0	\N	217	89998987-3e45-4a84-90fa-5853136a56a8		1	1	2	\N	2022-01-26 14:55:18	2022-01-26 14:55:18			'406':1 'r637g':2	1736	\N	\N	\N
247	1142	\N	410 E888	\N	\N	0	\N	\N	0	\N	179	21d4876e-e3da-49c4-b539-bf24d6be9734		1	1	2	\N	2022-01-26 15:12:03	2022-01-26 15:12:03			'410':1 'e888':2	374	\N	\N	\N
248	1143	\N	410 L584	\N	\N	0	\N	\N	0	\N	179	6d2e3c86-2ee7-42a7-b4dc-c16d1b6392f8		1	1	2	\N	2022-01-26 15:17:58	2022-01-26 15:17:58			'410':1 'l584':2	375	\N	\N	\N
250	1145	\N	410 T688C 1990	\N	\N	0	\N	\N	0	\N	60	5dfc0559-d4f6-4ca5-8552-952d30ffd3f8		1	1	2	\N	2022-01-26 15:24:45	2022-01-26 15:24:45			'1990':3 '410':1 't688c':2	360	\N	\N	\N
251	1146	\N	410 U558	\N	\N	0	\N	\N	0	\N	179	48d92b6d-52ab-42fc-96f3-94ea422921fb		1	1	2	\N	2022-01-26 15:27:08	2022-01-26 15:27:08			'410':1 'u558':2	369	\N	\N	\N
252	1147	\N	410 W524D	\N	\N	0	\N	\N	0	\N	179	134dd0cc-e91a-41e8-8e12-e7433573f202		1	1	2	\N	2022-01-26 15:30:56	2022-01-26 15:30:56			'410':1 'w524d':2	325	\N	\N	\N
253	1148	\N	410 Z383L	\N	\N	0	\N	\N	0	\N	179	048f75db-fa19-4fa7-8d4b-59a3b1ff60c2		1	1	2	\N	2022-01-26 15:35:38	2022-01-26 15:35:38			'410':1 'z383l':2	370	\N	\N	\N
254	1149	\N	809.5 P853 D582	\N	\N	0	\N	\N	0	\N	250	2f7a2025-5b2b-4bc4-ac34-3e42283bd29a		1	1	2	\N	2022-01-26 15:40:53	2022-01-26 15:40:53			'809.5':1 'd582':3 'p853':2	1170	\N	\N	\N
255	1150	\N	411 R683O	\N	\N	0	\N	\N	0	\N	245	7c2fb1e2-b06d-49c7-a1fd-5c6caa6d9a29		1	1	2	\N	2022-01-26 15:44:29	2022-01-26 15:44:29			'411':1 'r683o':2	1069	\N	\N	\N
256	1151	\N	413 C653D	\N	\N	0	\N	\N	0	\N	59	d2fe7e2a-18a7-49a6-b556-2a7b24759363		1	1	2	\N	2022-01-26 15:48:25	2022-01-26 15:48:25			'413':1 'c653d':2	1639	\N	\N	\N
257	1152	\N	413 D522	\N	\N	0	\N	\N	0	\N	245	f6fb6359-09db-4c49-8ce3-1e8984054a3e		1	1	2	\N	2022-01-26 15:52:09	2022-01-26 15:52:09			'413':1 'd522':2	1672	\N	\N	\N
258	1153	\N	4149	\N	\N	0	\N	\N	0	\N	245	6f46d910-2b31-419d-b332-e8ac884470aa		1	1	2	\N	2022-01-26 15:56:02	2022-01-26 15:56:02			'4149':1	1420	\N	\N	\N
259	1154	\N	413.21 O936 2002	\N	\N	0	\N	\N	0	\N	64	8d793b83-a7ea-41fa-bc0a-b76492c696ed		1	1	2	\N	2022-01-26 16:01:08	2022-01-26 16:01:08			'2002':3 '413.21':1 'o936':2	461	\N	\N	\N
260	1155	\N	413.21 D528 2005	\N	\N	0	\N	\N	0	\N	59	07e2b405-9932-46fa-90c7-34ca1a2172ae		1	1	2	\N	2022-01-26 16:05:08	2022-01-26 16:05:08			'2005':3 '413.21':1 'd528':2	1414	\N	\N	\N
261	1156	\N	413.21 D522 2008	\N	\N	0	\N	\N	0	\N	59	22792e26-9196-400f-801c-129e46034d6e		1	1	2	\N	2022-01-26 16:09:32	2022-01-26 16:09:32			'2008':3 '413.21':1 'd522':2	267	\N	\N	\N
262	1157	\N	413.21 D528	\N	\N	0	\N	\N	0	\N	245	acf3f5f7-88bd-4e13-99a9-3ad0135b29cf		1	1	2	\N	2022-01-26 16:14:01	2022-01-26 16:14:01			'413.21':1 'd528':2	460	\N	\N	\N
263	1158	\N	413 D649D	\N	\N	0	\N	\N	0	\N	245	a7341155-f6a6-4c15-885d-e40c85bb08f1		1	1	2	\N	2022-01-26 16:17:46	2022-01-26 16:17:46			'413':1 'd649d':2	1045	\N	\N	\N
264	1159	\N	428.007 I546	\N	\N	0	\N	\N	0	\N	245	26a0fafa-bceb-4744-8985-cbe0d871a5c5		1	1	2	\N	2022-01-26 16:24:21	2022-01-26 16:24:21			'428.007':1 'i546':2	456	\N	\N	\N
265	1160	\N	428.007 W665B	\N	\N	0	\N	\N	0	\N	245	81ab3017-8f04-4f91-a4bc-dcbdae7ad71c		1	1	2	\N	2022-01-26 16:27:06	2022-01-26 16:27:06			'428.007':1 'w665b':2	1130	\N	\N	\N
266	1161	\N	340 T784L 2004	\N	\N	0	\N	\N	0	\N	82	15051e5d-5ffd-4367-9983-604f8c680d87		1	1	2	\N	2022-01-27 13:26:50	2022-01-27 13:26:50			'2004':3 '340':1 't784l':2	295	\N	\N	\N
267	1162	\N	340.07 C635 2002	\N	\N	0	\N	\N	0	\N	245	4b2cecb7-f3e5-4baa-a64b-3989a19c90cc		1	1	2	\N	2022-01-27 13:35:38	2022-01-27 13:35:38			'2002':3 '340.07':1 'c635':2	313	\N	\N	\N
268	1164	\N	340.54 C658	\N	\N	0	\N	\N	0	\N	245	d1327154-a63e-44ec-9ae1-c152ad329196		1	1	2	\N	2022-01-27 13:44:50	2022-01-27 13:44:50			'340.54':1 'c658':2	314	\N	\N	\N
269	1165	\N	340.54 F733	\N	\N	0	\N	\N	0	\N	179	716cd41c-7808-44d2-9d8e-1d71bb95bb09		1	1	2	\N	2022-01-27 13:54:31	2022-01-27 13:54:31			'340.54':1 'f733':2	319	\N	\N	\N
270	1166	\N	340.54 L527	\N	\N	0	\N	\N	0	\N	179	5b644e81-245f-465e-aa76-19f4b0e04b47		1	1	2	\N	2022-01-27 13:58:08	2022-01-27 13:58:08			'340.54':1 'l527':2	320	\N	\N	\N
271	1167	\N	340.54 U558	\N	\N	0	\N	\N	0	\N	179	685d54bc-e4e5-4351-a9c6-2ad626030cf9		1	1	2	\N	2022-01-27 14:01:21	2022-01-27 14:01:21			'340.54':1 'u558':2	315	\N	\N	\N
272	1168	\N	340.54 V558 1995	\N	\N	0	\N	\N	0	\N	179	ac2bd16c-1918-40f0-b5bf-ba64e2319d24		1	1	2	\N	2022-01-27 14:05:25	2022-01-27 14:05:25			'1995':3 '340.54':1 'v558':2	316	\N	\N	\N
273	1169	\N	340.87 C658	\N	\N	0	\N	\N	0	\N	245	1b88acfd-b83a-4dbe-b260-1738b3f4aa84		1	1	2	\N	2022-01-27 14:12:12	2022-01-27 14:12:12			'340.87':1 'c658':2	272	\N	\N	\N
275	1171	\N	004.6 T354R	\N	\N	0	\N	\N	0	\N	75	2b837ffe-b679-47b6-8eda-22dc02cfda36		1	1	2	\N	2022-01-27 14:23:37	2022-01-27 14:23:37			'004.6':1 't354r':2	1796	\N	\N	\N
276	1172	\N	005.1 P748I 2005	\N	\N	0	\N	\N	0	\N	245	4b8c7fe5-e12e-427a-824a-ada512f7c244		1	1	2	\N	2022-01-27 15:50:47	2022-01-27 15:50:47			'005.1':1 '2005':3 'p748i':2	1040	\N	\N	\N
277	1173	\N	004.6 T473R	\N	\N	0	\N	\N	0	\N	213	7bb52215-6b19-4fba-a7de-e88b4ac7351b		1	1	2	\N	2022-01-27 16:01:34	2022-01-27 16:01:34			'004.6':1 't473r':2	1710	\N	\N	\N
278	1174	\N	005.1 K455A 2005	\N	\N	0	\N	\N	0	\N	245	531c4a5b-363c-49e9-a168-a9e5ba7b66d6		1	1	2	\N	2022-01-27 16:05:09	2022-01-27 16:05:09			'005.1':1 '2005':3 'k455a':2	1120	\N	\N	\N
279	1175	\N	005.1 M486	\N	\N	0	\N	\N	0	\N	245	e5cdc0b2-8fba-43a1-b7c7-f10d0213b9a7		1	1	2	\N	2022-01-27 16:06:59	2022-01-27 16:06:59			'005.1':1 'm486':2	1138	\N	\N	\N
280	1176	\N	005.1 P474A 2007	\N	\N	0	\N	\N	0	\N	245	e6efb295-3c7c-4487-b6bc-1f4c17c36c94		1	1	2	\N	2022-01-27 16:09:00	2022-01-27 16:09:00			'005.1':1 '2007':3 'p474a':2	1090	\N	\N	\N
281	1177	\N	415 P544A 1982	\N	\N	0	\N	\N	0	\N	179	351b66c7-ec58-4194-8220-69c6500dc428		1	1	2	\N	2022-01-27 16:17:13	2022-01-27 16:17:13			'1982':3 '415':1 'p544a':2	354	\N	\N	\N
282	1178	\N	415 B456B	\N	\N	0	\N	\N	0	\N	179	f0a14bc0-5d20-4990-b78e-d398bad6c4ad		1	1	2	\N	2022-01-27 16:25:23	2022-01-27 16:25:23			'415':1 'b456b':2	366	\N	\N	\N
283	1179	\N	414.6 H325	\N	\N	0	\N	\N	0	\N	179	80797370-ea0e-492a-8a81-ef88fa361a1f		1	1	2	\N	2022-01-27 16:28:56	2022-01-27 16:28:56			'414.6':1 'h325':2	363	\N	\N	\N
284	1180	\N	415 P353S	\N	\N	0	\N	\N	0	\N	179	797283e5-c99b-418b-bcfb-0a5b19d36126		1	1	2	\N	2022-01-27 16:31:22	2022-01-27 16:31:22			'415':1 'p353s':2	357	\N	\N	\N
285	1181	\N	415 R643C	\N	\N	0	\N	\N	0	\N	179	f75ffe1a-9602-4762-83b8-8577c4fb38f7		1	1	2	\N	2022-01-27 16:37:49	2022-01-27 16:37:49			'415':1 'r643c':2	362	\N	\N	\N
286	1183	\N	415 M494V	\N	\N	0	\N	\N	0	\N	179	1d1f6814-9447-4faa-98c0-f245e6159562		1	1	2	\N	2022-01-27 16:47:06	2022-01-27 16:47:06			'415':1 'm494v':2	420	\N	\N	\N
287	1184	\N	415 L853S	\N	\N	0	\N	\N	0	\N	179	8ff25942-827d-402e-a926-b297df6f25b3		1	1	2	\N	2022-01-27 16:50:13	2022-01-27 16:50:13			'415':1 'l853s':2	359	\N	\N	\N
288	1185	\N	415 L664E	\N	\N	0	\N	\N	0	\N	179	4f7b2156-c922-481a-bf46-502cfc9fe734		1	1	2	\N	2022-01-27 16:53:41	2022-01-27 16:53:41			'415':1 'l664e':2	350	\N	\N	\N
290	1187	\N	\N	\N	415 H477N	0	\N	\N	0	\N	179	8505b5fd-ecf4-4f5b-b0eb-75174d99dbb9		1	1	2	\N	2022-01-31 13:54:30	2022-01-31 13:54:30			'415':1 'h477n':2	3175	\N	\N	\N
291	1188	\N	414 L664E	\N	\N	0	\N	\N	0	\N	245	331bfd97-f050-4fa1-9f64-0c4addde05d7		1	1	2	\N	2022-01-31 18:50:06	2022-01-31 18:50:06			'414':1 'l664e':2	364	\N	\N	\N
294	1189	\N	418.02 B733 P845	\N	\N	0	\N	\N	0	\N	245	ce7e0cce-f278-4e94-83bc-c59bbb3ad3da		1	1	2	\N	2022-01-31 18:53:09	2022-01-31 18:53:19			'418.02':1 'b733':2 'p845':3	351	\N	\N	\N
296	1190	\N	417.7 L664H	\N	\N	0	\N	\N	0	\N	179	cc5e0bcd-f55b-4b01-8b8d-cde1dd09597c		1	1	2	\N	2022-01-31 18:58:44	2022-01-31 18:58:44			'417.7':1 'l664h':2	353	\N	\N	\N
297	1191	\N	417.7 H588	\N	\N	0	\N	\N	0	\N	245	a2783598-e456-4866-a661-446ff6a38d20		1	1	2	\N	2022-01-31 19:02:25	2022-01-31 19:02:25			'417.7':1 'h588':2	352	\N	\N	\N
298	1192	\N	\N	\N	417.7 G885S	0	\N	\N	0	\N	245	39314cdf-95ac-470b-9379-091784bd7744		1	1	2	\N	2022-01-31 19:04:21	2022-01-31 19:04:21			'417.7':1 'g885s':2	346	\N	\N	\N
299	1193	\N	417.7 C656F	\N	\N	0	\N	\N	0	\N	179	bc54ecb4-4ac5-43df-bf9d-a53bba807be0		1	1	2	\N	2022-02-01 14:36:26	2022-02-01 14:36:26			'417.7':1 'c656f':2	347	\N	\N	\N
300	1194	\N	417.7 C352	\N	\N	0	\N	\N	0	\N	179	2d2a0eed-427d-4897-a8fd-945ae320c8ef		1	1	2	\N	2022-02-01 14:37:55	2022-02-01 14:37:55			'417.7':1 'c352':2	348	\N	\N	\N
301	1195	\N	417.2 V473T	\N	\N	0	\N	\N	0	\N	179	28f43316-72d1-413e-a181-9127024ec9a5		1	1	2	\N	2022-02-01 14:46:16	2022-02-01 14:46:16			'417.2':1 'v473t':2	349	\N	\N	\N
302	1196	\N	417 E967	\N	\N	0	\N	\N	0	\N	245	7a54e9dd-2de5-44f9-8c66-abae721e076f		1	1	2	\N	2022-02-01 14:48:45	2022-02-01 14:49:21			'417':1 'e967':2	1407	\N	\N	\N
304	1199	\N	341. 750 6 B684P	\N	\N	0	\N	\N	0	\N	60	6f23e442-5b21-446c-bce9-7390a7b8381a		1	1	2	\N	2022-02-01 14:59:06	2022-02-01 14:59:06			'341':1 '6':3 '750':2 'b684p':4	240	\N	\N	\N
305	1200	\N	341.481 B482D	\N	\N	0	\N	\N	0	\N	179	1fc34d90-a9a2-4631-b056-3536f474b0c6		1	1	2	\N	2022-02-01 15:01:54	2022-02-01 15:01:54			'341.481':1 'b482d':2	1435	\N	\N	\N
306	1201	\N	341.7 R566T	\N	\N	0	\N	\N	0	\N	60	d90c3669-d28c-4513-81b9-2a993cf40e78		1	1	2	\N	2022-02-01 15:03:43	2022-02-01 15:03:43			'341.7':1 'r566t':2	1409	\N	\N	\N
274	1170	\N	004.6 S988G 2004	\N	00079	0	\N	\N	0	\N	245	8a1b0d46-8e35-458a-a63b-e1d9f97d9746		1	1	2	\N	2022-01-27 14:19:27	2022-02-08 14:39:36			'00079':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
307	1202	\N	341.754 L664C	\N	\N	0	\N	\N	0	\N	60	13c8e2c9-6603-41e0-b08d-4168bf0c2f2c		1	1	2	\N	2022-02-01 15:08:39	2022-02-01 15:08:39			'341.754':1 'l664c':2	1564	\N	\N	\N
308	1203	\N	341.754 B685M 2003	\N	\N	0	\N	\N	0	\N	60	3d035332-cf42-40d1-8d76-cd5e2ee16bea		1	1	2	\N	2022-02-01 15:32:25	2022-02-01 15:32:25			'2003':3 '341.754':1 'b685m':2	239	\N	\N	\N
309	1204	\N	341.754 M655P.	\N	\N	0	\N	\N	0	\N	241	a632d731-3075-4f4e-8f88-e3ed948df3c7		1	1	2	\N	2022-02-01 15:34:45	2022-02-01 15:34:45			'341.754':1 'm655p':2	1557	\N	\N	\N
311	1206	\N	341.841 D474	\N	\N	0	\N	\N	0	\N	179	20c9362f-e0e6-4d76-bbe8-2697987ff51f		1	1	2	\N	2022-02-01 15:55:19	2022-02-01 15:55:19			'341.841':1 'd474':2	1436	\N	\N	\N
312	1207	\N	342 A784D	\N	\N	0	\N	\N	0	\N	245	a5728f6f-62ec-4942-bd20-6d95d8ed4359		1	1	2	\N	2022-02-01 15:57:26	2022-02-01 15:57:26			'342':1 'a784d':2	265	\N	\N	\N
313	1208	\N	342.02 C658 2005	\N	\N	0	\N	\N	0	\N	245	861e2fa9-9e9f-4728-bbdb-70b2cd59aeeb		1	1	2	\N	2022-02-01 15:59:44	2022-02-01 15:59:44			'2005':3 '342.02':1 'c658':2	286	\N	\N	\N
314	1209	\N	342.068 0554D 2001	\N	\N	0	\N	\N	0	\N	245	49f03a79-c929-4ed6-ba18-ea4f42f4ad8b		1	1	2	\N	2022-02-01 16:02:03	2022-02-01 16:02:03			'0554d':2 '2001':3 '342.068':1	279	\N	\N	\N
315	1210	\N	005.13 I785I 2008	\N	\N	0	\N	\N	0	\N	245	b79122a7-0f86-45fb-a4ed-596dff9869f8		1	1	2	\N	2022-02-01 16:28:07	2022-02-01 16:28:07			'005.13':1 '2008':3 'i785i':2	1063	\N	\N	\N
316	1211	\N	005.2 A523C	\N	\N	0	\N	\N	0	\N	245	4ebc72a6-5bd3-41ee-95a2-3340c1d1a988		1	1	2	\N	2022-02-01 16:32:09	2022-02-01 16:32:09			'005.2':1 'a523c':2	1516	\N	\N	\N
317	1212	\N	005.2 C762J	\N	\N	0	\N	\N	0	\N	245	a5194a97-432c-492d-bfb5-62ad44650de9		1	1	2	\N	2022-02-02 14:27:04	2022-02-02 14:27:04			'005.2':1 'c762j':2	1519	\N	\N	\N
318	1213	\N	005.2 F535J	\N	\N	0	\N	\N	0	\N	245	a06346fb-c446-47e4-a290-244ec904b5e5		1	1	2	\N	2022-02-02 14:30:14	2022-02-02 14:30:14			'005.2':1 'f535j':2	1521	\N	\N	\N
319	1214	\N	005.3 G488	\N	\N	0	\N	\N	0	\N	245	3f7827af-0986-4cb1-88c5-65f61716e21b		1	1	2	\N	2022-02-02 14:36:19	2022-02-02 14:36:19			'005.3':1 'g488':2	1123	\N	\N	\N
320	1215	\N	005.3 L353P	\N	\N	0	\N	\N	0	\N	245	91efce47-83c3-4518-bc53-30ee93a4a73c		1	1	2	\N	2022-02-02 14:42:14	2022-02-02 14:42:14			'005.3':1 'l353p':2	1426	\N	\N	\N
321	1216	\N	005.3 R463	\N	\N	0	\N	\N	0	\N	245	42f803c9-bc37-41b0-bd99-59cfaa521e95		1	1	2	\N	2022-02-02 14:44:20	2022-02-02 14:44:20			'005.3':1 'r463':2	1124	\N	\N	\N
322	1218	\N	808.83 G377 R428	\N	\N	0	\N	\N	0	\N	245	460f6232-9de5-4edd-8047-ac5bfdfb6372		1	1	2	\N	2022-02-02 14:53:17	2022-02-02 14:53:17			'808.83':1 'g377':2 'r428':3	1268	\N	\N	\N
323	1219	\N	005.5 R552T	\N	\N	0	\N	\N	0	\N	245	03cf99bd-dd72-44eb-9c55-988cf18295c8		1	1	2	\N	2022-02-02 14:56:05	2022-02-02 14:56:05			'005.5':1 'r552t':2	1514	\N	\N	\N
324	1220	\N	005.6 H544A	\N	\N	0	\N	\N	0	\N	245	2b52884b-5c8d-49df-8b83-c521ecda6e37		1	1	2	\N	2022-02-02 14:58:47	2022-02-02 14:58:47			'005.6':1 'h544a':2	1517	\N	\N	\N
325	1221	\N	005.74 D483	\N	\N	0	\N	\N	0	\N	213	fee29460-14e0-4ee8-a990-3f8fbaa1257f		1	1	2	\N	2022-02-02 15:40:42	2022-02-02 15:40:42			'005.74':1 'd483':2	1604	\N	\N	\N
326	1222	\N	420 N488	\N	\N	0	\N	\N	0	\N	64	90c8a8c4-e267-4606-be0d-4eef94d0281d		1	1	2	\N	2022-02-03 13:45:57	2022-02-03 13:45:57			'420':1 'n488':2	449	\N	\N	\N
329	1225	\N	420.1 C655 1986	\N	\N	0	\N	\N	0	\N	245	1d367f4e-382d-4603-a60e-54c4cbf0634d		1	1	2	\N	2022-02-03 13:56:23	2022-02-03 13:56:23			'1986':3 '420.1':1 'c655':2	1483	\N	\N	\N
330	1226	\N	420.1 H485A 2005	\N	\N	0	\N	\N	0	\N	245	f41e50cd-2502-48d5-8f25-f0dab2e88599		1	1	2	\N	2022-02-03 14:00:43	2022-02-03 14:00:43			'2005':3 '420.1':1 'h485a':2	1112	\N	\N	\N
331	1227	\N	420.1 M876B 2002	\N	\N	0	\N	\N	0	\N	245	cfe41386-64c8-4761-930b-d2b5486902dd		1	1	2	\N	2022-02-03 14:03:18	2022-02-03 14:03:18			'2002':3 '420.1':1 'm876b':2	1114	\N	\N	\N
332	1228	\N	420.1 M876E 2004	\N	\N	0	\N	\N	0	\N	245	6be08355-b3d4-41a8-864a-c15cc82b88c8		1	1	2	\N	2022-02-03 14:08:27	2022-02-03 14:10:59			'2004':3 '420.1':1 'm876e':2	1119	\N	\N	\N
333	1229	\N	420.1 M876G 2000	\N	\N	0	\N	\N	0	\N	245	185cc556-817b-47fe-92c3-6b44d41150c7		1	1	2	\N	2022-02-03 14:14:54	2022-02-03 14:14:54			'2000':3 '420.1':1 'm876g':2	1113	\N	\N	\N
334	1230	\N	420.974 152 C673	\N	\N	0	\N	\N	0	\N	245	9c751b1b-2593-4cfa-bb98-156506c93db2		1	1	2	\N	2022-02-03 15:12:54	2022-02-03 15:12:54			'152':2 '420.974':1 'c673':3	344	\N	\N	\N
337	1231	\N	421 G739E 1993	\N	\N	0	\N	\N	0	\N	245	8b6bf210-7b92-4e4b-9014-823e602aa3e3		1	1	2	\N	2022-02-03 15:22:40	2022-02-03 15:22:40			'1993':3 '421':1 'g739e':2	1482	\N	\N	\N
339	1233	\N	421 I587	\N	\N	0	\N	\N	0	\N	245	f0ba9905-5f98-428f-aa7a-e2a4218e81a7		1	1	2	\N	2022-02-03 15:40:02	2022-02-03 15:40:02			'421':1 'i587':2	450	\N	\N	\N
342	1236	\N	421 S883	\N	\N	0	\N	\N	0	\N	245	10958e69-c88e-4f23-b699-c2d9d7279699		1	1	2	\N	2022-02-03 15:44:49	2022-02-03 15:44:49			'421':1 's883':2	432	\N	\N	\N
344	1237	\N	421 S883	\N	\N	0	\N	\N	0	\N	245	f354b8cf-54a1-40e2-a241-851ac0fc2cf8		1	1	2	\N	2022-02-03 15:47:18	2022-02-03 15:47:18			'421':1 's883':2	434	\N	\N	\N
345	1238	\N	428.007 S868A	\N	\N	0	\N	\N	0	\N	245	9505a796-baf8-4de1-9fed-aab62dc4a8ec		1	1	2	\N	2022-02-03 15:52:22	2022-02-03 15:52:22			'428.007':1 's868a':2	1098	\N	\N	\N
346	1239	\N	428 W568S	\N	\N	0	\N	\N	0	\N	245	9765738a-5708-47bf-83e9-923a2f132cfc		1	1	2	\N	2022-02-03 15:55:28	2022-02-03 15:55:28			'428':1 'w568s':2	1129	\N	\N	\N
347	1240	\N	342.3 M358D 1964	\N	\N	0	\N	\N	0	\N	245	79bfa2fe-cdf8-4ffc-870a-0e12011f28a6		1	1	2	\N	2022-02-03 16:01:31	2022-02-03 16:01:31			'1964':3 '342.3':1 'm358d':2	297	\N	\N	\N
348	1241	\N	342.3 P553D 2008	\N	\N	0	\N	\N	0	\N	82	a07bd722-c50d-48d7-9b22-107ed443a1ff		1	1	2	\N	2022-02-03 16:04:40	2022-02-03 16:04:40			'2008':3 '342.3':1 'p553d':2	1135	\N	\N	\N
349	1242	\N	342.3 T453D 2006	\N	\N	0	\N	\N	0	\N	82	5d4b147b-7c1b-4db2-91d7-289366c737d2		1	1	2	\N	2022-02-03 21:05:59	2022-02-03 21:05:59			'2006':3 '342.3':1 't453d':2	1134	\N	\N	\N
350	1243	\N	342.6 R353D	\N	\N	0	\N	\N	0	\N	245	e68fdd9e-0151-423d-816f-e137f3f112b4		1	1	2	\N	2022-02-03 21:07:35	2022-02-03 21:07:35			'342.6':1 'r353d':2	288	\N	\N	\N
351	1245	\N	342.7263029 T323 1991	\N	\N	0	\N	\N	0	\N	245	38f82610-c7c0-404f-b780-b5a024b3d596		1	1	2	\N	2022-02-03 21:10:51	2022-02-03 21:10:51			'1991':3 '342.7263029':1 't323':2	278	\N	\N	\N
352	1246	\N	440 D826	\N	\N	0	\N	\N	0	\N	59	44e1620f-d692-470c-a437-e41b4be1c51e		1	1	2	\N	2022-02-04 13:48:15	2022-02-04 13:48:15			'440':1 'd826':2	421	\N	\N	\N
353	1247	\N	428.2 S637A 2003	\N	\N	0	\N	\N	0	\N	64	54218d2c-e82a-4360-a356-72c70267800c		1	1	2	\N	2022-02-04 13:54:17	2022-02-04 13:54:17			'2003':3 '428.2':1 's637a':2	917	\N	\N	\N
354	1248	\N	428.3028 R524T 2003	\N	\N	0	\N	\N	0	\N	64	f3c28f63-98f3-4561-a573-24116ad1d19f		1	1	2	\N	2022-02-04 14:02:23	2022-02-04 14:02:23			'2003':3 '428.3028':1 'r524t':2	1102	\N	\N	\N
355	1249	\N	428.007 T687	\N	\N	0	\N	\N	0	\N	64	7f6c971a-c19f-4ad2-a570-607e7e53b88e		1	1	2	\N	2022-02-04 14:04:25	2022-02-04 14:04:25			'428.007':1 't687':2	1477	\N	\N	\N
356	1250	\N	428.2 S637A 2005	\N	\N	0	\N	\N	0	\N	64	c1a29063-38c8-472e-a2c3-389f872b2faf		1	1	2	\N	2022-02-04 14:06:23	2022-02-04 14:06:23			'2005':3 '428.2':1 's637a':2	423	\N	\N	\N
357	1251	\N	428.2 S883	\N	00892	0	\N	\N	0	\N	245	741cae3a-182b-4aa5-8fc8-135033ff348d		1	1	2	\N	2022-02-04 14:08:43	2022-02-04 14:17:01			'00892':3 '428.2':1 's883':2	440	\N	\N	\N
358	1251	\N	428.2 S883	\N	00893	0	\N	\N	0	\N	245	e8b98014-5711-44c5-a3d4-06e5de4fe0f9		1	1	2	\N	2022-02-04 14:17:21	2022-02-04 14:17:21			'00893':3 '428.2':1 's883':2	440	\N	\N	\N
338	1232	\N	421 H357A	\N	00861	0	\N	\N	0	\N	245	78c969b1-c016-4aeb-8dc0-3df26d13ff45		1	1	2	\N	2022-02-03 15:37:54	2022-02-08 14:36:23			'00861':3 '421':1 'h357a':2	428	\N	\N	\N
327	1223	\N	421 A534A	\N	04308	0	\N	\N	0	\N	245	4c604a48-cd6c-4d65-9607-bee979c261e8		1	1	2	\N	2022-02-03 13:49:33	2022-02-08 14:51:21			'04308':3 '421':1 'a534a':2	719	\N	\N	\N
310	1205	\N	341.762 G454 2003	\N	02627	0	\N	\N	0	\N	82	2b5b5653-ccc6-4b5b-81ce-760e7f74df67		1	1	2	\N	2022-02-01 15:41:10	2022-02-08 17:15:18			'02627':4 '2003':3 '341.762':1 'g454':2	192	\N	\N	\N
359	1252	\N	428.2 S883	\N	00896	0	\N	\N	0	\N	245	eea51e3c-13d9-427b-971c-3b364ccf06a3		1	1	2	\N	2022-02-04 14:19:18	2022-02-04 14:19:18			'00896':3 '428.2':1 's883':2	442	\N	\N	\N
360	1252	\N	428.2 S883	\N	00897	0	\N	\N	0	\N	245	303e9ee9-c71a-4b18-af3d-0ab2b929c786		1	1	2	\N	2022-02-04 14:19:40	2022-02-04 14:19:40			'00897':3 '428.2':1 's883':2	442	\N	\N	\N
361	1253	\N	428.2 S883	\N	00902	0	\N	\N	0	\N	245	61801acc-539b-4a16-9dc8-323aba7cf513		1	1	2	\N	2022-02-04 14:22:10	2022-02-04 14:22:10			'00902':3 '428.2':1 's883':2	445	\N	\N	\N
362	1253	\N	428.2 S883	\N	00903	0	\N	\N	0	\N	245	242241b6-f3ab-4467-961f-b798d1da1900		1	1	2	\N	2022-02-04 14:22:29	2022-02-04 14:22:29			'00903':3 '428.2':1 's883':2	445	\N	\N	\N
363	1254	\N	428.2 S883	\N	00904	0	\N	\N	0	\N	245	387438d4-653a-4a19-97ba-dea649169f09		1	1	2	\N	2022-02-04 14:24:27	2022-02-04 14:24:27			'00904':3 '428.2':1 's883':2	446	\N	\N	\N
364	1254	\N	428.2 S883	\N	00905	0	\N	\N	0	\N	245	040fbf52-44c2-4087-ab3f-60994002ea11		1	1	2	\N	2022-02-04 14:24:44	2022-02-04 14:24:44			'00905':3 '428.2':1 's883':2	446	\N	\N	\N
366	1255	\N	428.2 W674	\N	00895	0	\N	\N	0	\N	245	84d5a072-05bd-4834-b31c-90aa7230a110		1	1	2	\N	2022-02-04 14:27:03	2022-02-04 14:27:03			'00895':3 '428.2':1 'w674':2	\N	\N	\N	\N
365	1255	\N	428.2 W674	\N	00894	0	\N	\N	0	\N	245	fe928d3b-dff8-4255-846e-15db92ebd63d		1	1	2	\N	2022-02-04 14:26:48	2022-02-04 14:27:09			'00894':3 '428.2':1 'w674':2	441	\N	\N	\N
367	1256	\N	428.2 W674	\N	00898	0	\N	\N	0	\N	245	b686ec4c-ce20-4db3-8f39-686d6ec54341		1	1	2	\N	2022-02-04 14:29:20	2022-02-04 14:29:20			'00898':3 '428.2':1 'w674':2	443	\N	\N	\N
368	1256	\N	428.2 W674	\N	00899	0	\N	\N	0	\N	245	4111f1f0-d246-44d7-ba54-9f54ed3d495a		1	1	2	\N	2022-02-04 14:29:36	2022-02-04 14:29:36			'00899':3 '428.2':1 'w674':2	443	\N	\N	\N
369	1257	\N	428.2 W674	\N	00900	0	\N	\N	0	\N	245	4514cde3-04c9-469f-84ee-1976f036f597		1	1	2	\N	2022-02-04 15:25:08	2022-02-04 15:25:08			'00900':3 '428.2':1 'w674':2	444	\N	\N	\N
370	1257	\N	428.2 W674	\N	00901	0	\N	\N	0	\N	245	e29aca69-2c2f-4f89-a8d6-7e9058084974		1	1	2	\N	2022-02-04 15:25:23	2022-02-04 15:25:23			'00901':3 '428.2':1 'w674':2	444	\N	\N	\N
120	999	\N	001.42 A537D	\N	00002	0	\N	\N	0	\N	245	80ac46a3-dc10-4c89-9272-566724d74423		1	1	2	\N	2022-01-04 19:52:20	2022-02-08 14:14:52			'00002':3 '001.42':1 'a537d':2	\N	\N	\N	\N
119	998	\N	001.42 A534T 1990 001.42 A534T	\N	00001	0	\N	\N	0	\N	244	ce6162ba-524c-4979-9dd6-9f6dd6be43b3		1	1	2	\N	2022-01-04 19:45:46	2022-02-08 14:16:18			'00001':6 '001.42':1,4 '1990':3 'a534t':2,5	1	\N	\N	\N
372	1009	\N	001.42 M472C 2008	\N	02841	0	\N	\N	0	\N	245	f6399286-2f36-4c79-a207-06fa48b44e3c		1	1	2	\N	2022-02-08 14:21:55	2022-02-08 14:21:55			'001.42':1 '02841':4 '2008':3 'm472c':2	676	\N	\N	\N
373	1009	\N	001.42 M472C 2008	\N	02842	0	\N	\N	0	\N	245	7a2b67a3-7caf-49e6-8d6b-72c97b8b8d8b		1	1	2	\N	2022-02-08 14:22:09	2022-02-08 14:22:09			'001.42':1 '02842':4 '2008':3 'm472c':2	676	\N	\N	\N
374	1009	\N	001.42 M472C 2008	\N	02843	0	\N	\N	0	\N	245	99bd8186-2938-4736-ba45-63a2a2406448		1	1	2	\N	2022-02-08 14:22:32	2022-02-08 14:22:32			'001.42':1 '02843':4 '2008':3 'm472c':2	676	\N	\N	\N
375	1009	\N	001.42 M472C 2008	\N	02844	0	\N	\N	0	\N	245	d4c0165f-59dc-4a60-8751-42e1cff0135a		1	1	2	\N	2022-02-08 14:22:54	2022-02-08 14:22:54			'001.42':1 '02844':4 '2008':3 'm472c':2	676	\N	\N	\N
376	1009	\N	001.42 M472C 2008	\N	02845	0	\N	\N	0	\N	245	4a99c582-ad98-4405-8f24-50eb1f8cc8b2		1	1	2	\N	2022-02-08 14:23:12	2022-02-08 14:23:12			'001.42':1 '02845':4 '2008':3 'm472c':2	676	\N	\N	\N
377	1009	\N	001.42 M472C 2008	\N	02846	0	\N	\N	0	\N	245	8c2fdfcb-4dc0-452b-9b1a-14ae33870cde		1	1	2	\N	2022-02-08 14:23:27	2022-02-08 14:23:27			'001.42':1 '02846':4 '2008':3 'm472c':2	676	\N	\N	\N
189	1072	\N	421 W674	\N	00906	0	\N	\N	0	\N	245	3f77be36-041d-4710-9543-4c62ec385596		1	1	2	\N	2022-01-15 00:07:03	2022-02-08 14:24:17			'00906':3 '421':1 'w674':2	447	\N	\N	\N
378	1072	\N	421 W674	\N	00907	0	\N	\N	0	\N	245	f43efcfa-1d20-4c0d-b54d-99ac38f7c66a		1	1	2	\N	2022-02-08 14:24:29	2022-02-08 14:24:29			'00907':3 '421':1 'w674':2	447	\N	\N	\N
303	1197	\N	425 W475A 1996	\N	00862	0	\N	\N	0	\N	245	d61de7ca-a714-41be-977c-cdeddf4318b0		1	1	2	\N	2022-02-01 14:53:08	2022-02-08 14:34:08			'00862':4 '1996':3 '425':1 'w475a':2	429	\N	\N	\N
181	1063	\N	421 W435A	\N	00860	0	\N	\N	0	\N	245	2019f6d5-0047-4da6-a88b-ac5ca811f39a		1	1	2	\N	2022-01-14 23:50:16	2022-02-08 14:34:25			'00860':3 '421':1 'w435a':2	427	\N	\N	\N
328	1224	\N	421 B538A 1996	\N	00858	0	\N	\N	0	\N	245	97a40bc3-2d5b-4123-88d0-c65f3b31f0b3		1	1	2	\N	2022-02-03 13:53:26	2022-02-08 14:34:49			'00858':4 '1996':3 '421':1 'b538a':2	425	\N	\N	\N
341	1234	\N	421 K445A	\N	00859	0	\N	\N	0	\N	245	4a9ec92d-665c-4c8f-a5f8-35bf7c7d82d3		1	1	2	\N	2022-02-03 15:41:49	2022-02-08 14:38:56			'00859':3 '421':1 'k445a':2	426	\N	\N	\N
379	1170	\N	004.6 S988G 2004	\N	00080	0	\N	\N	0	\N	245	8f7627ac-60bc-4a9d-af10-b9dc0da6960d		1	1	2	\N	2022-02-08 14:40:02	2022-02-08 14:40:02			'00080':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
380	1170	\N	004.6 S988G 2004	\N	00081	0	\N	\N	0	\N	245	545b810d-1860-44fd-a0a4-5f41875686b3		1	1	2	\N	2022-02-08 14:40:16	2022-02-08 14:40:16			'00081':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
381	1170	\N	004.6 S988G 2004	\N	00082	0	\N	\N	0	\N	245	ca5f3811-2af5-49f1-8c5c-b9fd90d5e562		1	1	2	\N	2022-02-08 14:40:37	2022-02-08 14:40:37			'00082':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
382	1170	\N	004.6 S988G 2004	\N	00083	0	\N	\N	0	\N	245	683ca6c1-47c0-49f3-85c1-894d3190b82f		1	1	2	\N	2022-02-08 14:41:00	2022-02-08 14:41:00			'00083':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
383	1170	\N	004.6 S988G 2004	\N	00084	0	\N	\N	0	\N	245	892d9fb6-6e24-4699-ace8-7f112a460996		1	1	2	\N	2022-02-08 14:41:29	2022-02-08 14:41:29			'00084':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
384	1170	\N	004.6 S988G 2004	\N	00085	0	\N	\N	0	\N	245	3e6cc4b0-a27f-4926-babf-07cd5dc5a118		1	1	2	\N	2022-02-08 14:41:59	2022-02-08 14:41:59			'00085':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
385	1170	\N	004.6 S988G 2004	\N	00086	0	\N	\N	0	\N	245	9ff58f1f-b60e-4bd7-b049-37810daeae35		1	1	2	\N	2022-02-08 14:42:31	2022-02-08 14:42:31			'00086':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
386	1170	\N	004.6 S988G 2004	\N	00087	0	\N	\N	0	\N	245	70ddc066-6412-422f-8fc8-19cf806ace81		1	1	2	\N	2022-02-08 14:43:21	2022-02-08 14:43:21			'00087':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
387	1170	\N	004.6 S988G 2004	\N	00088	0	\N	\N	0	\N	245	d885f98f-a0cb-44cd-af8f-877465d856c8		1	1	2	\N	2022-02-08 14:43:35	2022-02-08 14:43:35			'00088':4 '004.6':1 '2004':3 's988g':2	1088	\N	\N	\N
388	1023	\N	400 A283	\N	00777	0	\N	\N	0	\N	245	ff745349-d9b1-491a-9854-44cc819d619b		1	1	2	\N	2022-02-08 14:47:20	2022-02-08 14:47:20			'00777':3 '400':1 'a283':2	385	\N	\N	\N
389	1024	\N	400 A283	\N	00852	0	\N	\N	0	\N	245	69c529e4-665a-4021-8382-a05057a2b46d		1	1	2	\N	2022-02-08 14:50:56	2022-02-08 14:50:56			'00852':3 '400':1 'a283':2	419	\N	\N	\N
390	1223	\N	421 A534A	\N	004309	0	\N	\N	0	\N	245	25213346-4e46-4dd9-8c32-47c22c9137de		1	1	2	\N	2022-02-08 14:52:44	2022-02-08 14:52:44			'004309':3 '421':1 'a534a':2	719	\N	\N	\N
391	1223	\N	421 A534A	\N	004310	0	\N	\N	0	\N	245	50b333a5-bb45-459b-8f24-7a3b766694be		1	1	2	\N	2022-02-08 14:53:03	2022-02-08 14:53:03			'004310':3 '421':1 'a534a':2	719	\N	\N	\N
392	1223	\N	421 A534A	\N	04311	0	\N	\N	0	\N	245	5692c1db-6023-4aec-86a1-4adf312c25bf		1	1	2	\N	2022-02-08 14:53:37	2022-02-08 14:53:37			'04311':3 '421':1 'a534a':2	719	\N	\N	\N
393	1223	\N	421 A534A	\N	04312	0	\N	\N	0	\N	245	1f53296c-3213-4f79-93b6-3f056c05463f		1	1	2	\N	2022-02-08 14:54:17	2022-02-08 14:54:17			'04312':3 '421':1 'a534a':2	719	\N	\N	\N
394	999	\N	001.42 A537D	\N	00003	0	\N	\N	0	\N	245	bca3f090-d93d-41c4-ab7a-7cdb4e84f548		1	1	2	\N	2022-02-08 14:56:35	2022-02-08 14:56:35			'00003':3 '001.42':1 'a537d':2	2	\N	\N	\N
395	1000	\N	001.42 A537G 2003	\N	00005	0	\N	\N	0	\N	245	42887846-2d85-43d7-b8b9-c9b3a946211b		1	1	2	\N	2022-02-08 14:57:16	2022-02-08 14:57:16			'00005':4 '001.42':1 '2003':3 'a537g':2	3	\N	\N	\N
396	1002	\N	001.42 R433	\N	00009	0	\N	\N	0	\N	245	c44c248c-2d4f-4d6a-93dc-097429f84640		1	1	2	\N	2022-02-08 14:58:33	2022-02-08 14:58:33			'00009':3 '001.42':1 'r433':2	6	\N	\N	\N
397	1004	\N	001.539 K323L 1997	\N	00038	0	\N	\N	0	\N	245	d24393af-4faa-4540-bc6d-de9122d335f1		1	1	2	\N	2022-02-08 17:12:17	2022-02-08 17:12:17			'00038':4 '001.539':1 '1997':3 'k323l':2	7	\N	\N	\N
398	1004	\N	001.539 K323L 1997	\N	00039	0	\N	\N	0	\N	245	587c5d11-916f-4d3b-8a03-5a37ab5c79f4		1	1	2	\N	2022-02-08 17:12:33	2022-02-08 17:12:33			'00039':4 '001.539':1 '1997':3 'k323l':2	7	\N	\N	\N
399	1205	\N	341.762 G454 2003	\N	02628	0	\N	\N	0	\N	82	7b37b3f6-9f0f-417d-b890-4b6883f5c328		1	1	2	\N	2022-02-08 17:15:28	2022-02-08 17:15:28			'02628':4 '2003':3 '341.762':1 'g454':2	192	\N	\N	\N
400	840	\N	339 D675M 1991	\N	02421	0	\N	\N	0	\N	97	65711a14-7a5e-4841-bd67-50de045b68b1		1	1	2	\N	2022-02-08 17:17:28	2022-02-08 17:17:28			'02421':4 '1991':3 '339':1 'd675m':2	223	\N	\N	\N
401	1258	\N	344.099 026 L664F	\N	04810	0	\N	\N	0	\N	60	d42b14c1-874c-432c-9e86-e4f4628265ae		1	1	2	\N	2022-02-08 17:37:31	2022-02-08 17:37:31			'026':2 '04810':4 '344.099':1 'l664f':3	1549	\N	\N	\N
402	1258	\N	344.099 026 L664F	\N	04811	0	\N	\N	0	\N	60	77e1558c-97c6-41da-bb3b-f4d2403eff19		1	1	2	\N	2022-02-08 17:37:55	2022-02-08 17:37:55			'026':2 '04811':4 '344.099':1 'l664f':3	04810	\N	\N	\N
403	1258	\N	344.099 026 L664F	\N	04812	0	\N	\N	0	\N	60	ca64ea26-691f-40b8-aa8b-ccccc6627b22		1	1	2	\N	2022-02-08 17:38:06	2022-02-08 17:38:06			'026':2 '04812':4 '344.099':1 'l664f':3	1549	\N	\N	\N
404	1259	\N	006.6 D584	\N	00148	0	\N	\N	0	\N	245	a3e93ba5-754b-4655-8c62-7c2d9c50c850		1	1	2	\N	2022-02-08 18:09:19	2022-02-08 18:09:19			'00148':3 '006.6':1 'd584':2	1041	\N	\N	\N
405	1259	\N	006.6 D584	\N	00149	0	\N	\N	0	\N	245	25d7e9d4-dacf-4e1e-87be-2f900ae1cd61		1	1	2	\N	2022-02-08 18:09:31	2022-02-08 18:09:31			'00149':3 '006.6':1 'd584':2	1041	\N	\N	\N
406	1259	\N	006.6 D584	\N	00150	0	\N	\N	0	\N	245	857d760b-0a50-46e0-99f4-35dfca0d8bdc		1	1	2	\N	2022-02-08 18:09:48	2022-02-08 18:09:48			'00150':3 '006.6':1 'd584':2	1041	\N	\N	\N
408	1259	\N	006.6 D584	\N	00151	0	\N	\N	0	\N	245	e25afc28-3608-4486-9e8a-f8b68bc8408e		1	1	2	\N	2022-02-08 18:10:23	2022-02-08 18:10:23			'00151':3 '006.6':1 'd584':2	1041	\N	\N	\N
409	1259	\N	006.6 D584	\N	00152	0	\N	\N	0	\N	245	302e7682-df7b-40f3-9009-eda9ae2ad5e7		1	1	2	\N	2022-02-08 18:10:40	2022-02-08 18:10:40			'00152':3 '006.6':1 'd584':2	1041	\N	\N	\N
410	1259	\N	006.6 D584	\N	00153	0	\N	\N	0	\N	245	9d74e44f-3d01-40a4-878e-4105e32d015e		1	1	2	\N	2022-02-08 18:11:03	2022-02-08 18:11:03			'00153':3 '006.6':1 'd584':2	1041	\N	\N	\N
411	1259	\N	006.6 D584	\N	00154	0	\N	\N	0	\N	245	668028c9-fd2b-481b-a14d-e2a3e35eccb1		1	1	2	\N	2022-02-08 18:11:16	2022-02-08 18:11:16			'00154':3 '006.6':1 'd584':2	1041	\N	\N	\N
412	1259	\N	006.6 D584	\N	00155	0	\N	\N	0	\N	245	025aff43-e7e4-4436-9019-c7b9f7d74d02		1	1	2	\N	2022-02-08 18:11:30	2022-02-08 18:11:30			'00155':3 '006.6':1 'd584':2	1041	\N	\N	\N
413	1259	\N	006.6 D584	\N	04103	0	\N	\N	0	\N	245	486a6d28-b50f-4452-8062-e6fcd605451a		1	1	2	\N	2022-02-08 18:11:45	2022-02-08 18:11:45			'006.6':1 '04103':3 'd584':2	1041	\N	\N	\N
414	1259	\N	006.6 D584	\N	04104	0	\N	\N	0	\N	245	f660b71e-0e2b-4a4d-a390-352301332a5d		1	1	2	\N	2022-02-08 18:11:57	2022-02-08 18:11:57			'006.6':1 '04104':3 'd584':2	1041	\N	\N	\N
415	1259	\N	006.6 D584	\N	04105	0	\N	\N	0	\N	245	18efd508-6ba5-44a7-a0c6-3a46f2f51213		1	1	2	\N	2022-02-08 18:12:12	2022-02-08 18:12:12			'006.6':1 '04105':3 'd584':2	1041	\N	\N	\N
416	1259	\N	006.6 D584	\N	04512	0	\N	\N	0	\N	245	e9e535e1-fd73-40d5-9c3c-93c88a0db2f0		1	1	2	\N	2022-02-08 18:12:23	2022-02-08 18:12:23			'006.6':1 '04512':3 'd584':2	1041	\N	\N	\N
417	1259	\N	006.6 D584	\N	04513	0	\N	\N	0	\N	245	bf5d7dc9-10bb-49be-b476-562fa4df2896		1	1	2	\N	2022-02-08 18:12:38	2022-02-08 18:12:38			'006.6':1 '04513':3 'd584':2	1041	\N	\N	\N
418	1260	\N	006.7 V383M 2008	\N	00165	0	\N	\N	0	\N	61	020f37db-b315-4393-ae3d-65d9b8ee082d		1	1	2	\N	2022-02-08 18:23:18	2022-02-08 18:23:18			'00165':4 '006.7':1 '2008':3 'v383m':2	1082	\N	\N	\N
419	1260	\N	006.7 V383M 2008	\N	00166	0	\N	\N	0	\N	61	ed7de12c-d002-4df1-8069-5888392c34f5		1	1	2	\N	2022-02-08 18:23:32	2022-02-08 18:23:32			'00166':4 '006.7':1 '2008':3 'v383m':2	1082	\N	\N	\N
420	1260	\N	006.7 V383M 2008	\N	00167	0	\N	\N	0	\N	61	cbb83c9e-6181-495f-8b15-18f86b3fe43d		1	1	2	\N	2022-02-08 18:27:09	2022-02-08 18:27:09			'00167':4 '006.7':1 '2008':3 'v383m':2	1082	\N	\N	\N
421	1260	\N	006.7 V383M 2008	\N	00168	0	\N	\N	0	\N	61	11d0179a-54d1-4376-8a28-a4dbc2275951		1	1	2	\N	2022-02-08 18:27:36	2022-02-08 18:27:36			'00168':4 '006.7':1 '2008':3 'v383m':2	10821082	\N	\N	\N
422	1260	\N	006.7 V383M 2008	\N	00169	0	\N	\N	0	\N	61	cea74975-6853-465c-95e0-90594e4bb04c		1	1	2	\N	2022-02-08 18:27:59	2022-02-08 18:27:59			'00169':4 '006.7':1 '2008':3 'v383m':2	1082	\N	\N	\N
423	1260	\N	006.7 V383M 2008	\N	00170	0	\N	\N	0	\N	61	1c767dd1-3083-4599-b264-11e1ac382bb6		1	1	2	\N	2022-02-08 18:28:16	2022-02-08 18:28:16			'00170':4 '006.7':1 '2008':3 'v383m':2	1082	\N	\N	\N
424	1261	\N	v	\N	01082	0	\N	\N	0	\N	245	0ee7aac4-bf08-4466-a266-7a4c9b71a47a		1	1	2	\N	2022-02-08 19:05:27	2022-02-08 19:05:27			'01082':2 'v':1	542	\N	\N	\N
425	1261	\N	543 Q855 2001	\N	01083	0	\N	\N	0	\N	245	5fcd88f4-c659-4ca4-8f89-2461d2dba9d8		1	1	2	\N	2022-02-08 19:05:40	2022-02-08 19:05:40			'01083':4 '2001':3 '543':1 'q855':2	542	\N	\N	\N
426	1261	\N	543 Q855 2001	\N	01084	0	\N	\N	0	\N	245	de9ca4e8-ab34-4739-9354-07d6e89dbf60		1	1	2	\N	2022-02-08 19:05:55	2022-02-08 19:05:55			'01084':4 '2001':3 '543':1 'q855':2	542	\N	\N	\N
427	1261	\N	543 Q855 2001	\N	01085	0	\N	\N	0	\N	245	ef32f061-11d3-4772-b81b-627d7a14cab7		1	1	2	\N	2022-02-08 19:06:10	2022-02-08 19:06:10			'01085':4 '2001':3 '543':1 'q855':2	542	\N	\N	\N
428	1262	\N	343 C658 2008	\N	02328	0	\N	\N	0	\N	116	b50bbb03-3abf-4976-83d6-63d77fc07e37		1	1	2	\N	2022-02-08 19:16:27	2022-02-08 19:16:27			'02328':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
429	1262	\N	343 C658 2008	\N	03467	0	\N	\N	0	\N	116	78a763ea-997b-45d6-8c19-07a8202d6c61		1	1	2	\N	2022-02-08 19:16:39	2022-02-08 19:16:39			'03467':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
430	1262	\N	343 C658 2008	\N	04218	0	\N	\N	0	\N	116	949969cc-fccb-4a6e-b958-591746c55b6d		1	1	2	\N	2022-02-08 19:16:56	2022-02-08 19:16:56			'04218':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
431	1262	\N	343 C658 2008	\N	04219	0	\N	\N	0	\N	116	b731297d-adf2-4858-a425-e96ad72b046d		1	1	2	\N	2022-02-08 19:17:21	2022-02-08 19:17:21			'04219':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
432	1262	\N	343 C658 2008	\N	04220	0	\N	\N	0	\N	116	93818bc0-932a-4688-a33e-1a945c6158fa		1	1	2	\N	2022-02-08 19:17:43	2022-02-08 19:17:43			'04220':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
433	1262	\N	343 C658 2008	\N	04221	0	\N	\N	0	\N	116	a6083aa4-2d0c-406f-a8a8-52ef6d18d7af		1	1	2	\N	2022-02-08 19:17:56	2022-02-08 19:17:56			'04221':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
434	1262	\N	343 C658 2008	\N	04384	0	\N	\N	0	\N	116	2c184612-c222-4360-95f1-6fcf83c07606		1	1	2	\N	2022-02-08 19:18:29	2022-02-08 19:18:29			'04384':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
435	1262	\N	343 C658 2008	\N	04385	0	\N	\N	0	\N	116	c254b301-a822-43b0-8821-88d6cf76011d		1	1	2	\N	2022-02-08 19:19:10	2022-02-08 19:19:10			'04385':4 '2008':3 '343':1 'c658':2	1438	\N	\N	\N
436	1264	\N	343 C372L 2004	\N	02653	0	\N	\N	0	\N	245	0f97b167-1efd-4183-abf3-9155d4c46610		1	1	2	\N	2022-02-08 19:24:57	2022-02-08 19:24:57			'02653':4 '2004':3 '343':1 'c372l':2	287	\N	\N	\N
437	1264	\N	343 C372L 2004	\N	02654	0	\N	\N	0	\N	245	4d3d1ab7-3881-4b49-b56a-1791d43ea8c5		1	1	2	\N	2022-02-08 19:25:48	2022-02-08 19:25:48			'02654':4 '2004':3 '343':1 'c372l':2	287	\N	\N	\N
438	1264	\N	343 C372L 2004	\N	02655	0	\N	\N	0	\N	245	d624c812-2be9-4605-a694-e447cfe7342e		1	1	2	\N	2022-02-08 19:26:00	2022-02-08 19:26:00			'02655':4 '2004':3 '343':1 'c372l':2	287	\N	\N	\N
440	1264	\N	343 C372L 2004	\N	02656	0	\N	\N	0	\N	245	aa05b389-102d-4ed1-b767-567d624f90a2		1	1	2	\N	2022-02-08 19:26:34	2022-02-08 19:26:34			'02656':4 '2004':3 '343':1 'c372l':2	287	\N	\N	\N
441	1265	\N	343.091 M372	\N	02657	0	\N	\N	0	\N	245	bdab3274-6931-4a7a-9844-b2abadfa7a77		1	1	2	\N	2022-02-08 19:30:58	2022-02-08 19:30:58			'02657':3 '343.091':1 'm372':2	277	\N	\N	\N
442	1266	\N	344.02 C3721	\N	02658	0	\N	\N	0	\N	245	1da01bc3-125f-43a5-ac3d-0073c96bd37d		1	1	2	\N	2022-02-08 19:33:31	2022-02-08 19:33:31			'02658':3 '344.02':1 'c3721':2	274	\N	\N	\N
443	1267	\N	344.07 S588	\N	02659	0	\N	\N	0	\N	245	73803235-a1ef-4b64-b0fc-980309c471f8		1	1	2	\N	2022-02-08 19:35:47	2022-02-08 19:35:47			'02659':3 '344.07':1 's588':2	284	\N	\N	\N
444	1267	\N	344.07 S588	\N	02660	0	\N	\N	0	\N	245	17050d71-0fc9-426b-a2c2-b5a8aee4511c		1	1	2	\N	2022-02-08 19:36:06	2022-02-08 19:36:06			'02660':3 '344.07':1 's588':2	284	\N	\N	\N
445	1267	\N	344.07 S588	\N	02661	0	\N	\N	0	\N	245	70941984-d6c5-48dd-9e8e-6e2802176718		1	1	2	\N	2022-02-08 19:36:32	2022-02-08 19:36:32			'02661':3 '344.07':1 's588':2	284	\N	\N	\N
446	1267	\N	344.07 S588	\N	02662	0	\N	\N	0	\N	245	88532a26-1145-4481-abc9-f572151985e9		1	1	2	\N	2022-02-08 19:36:46	2022-02-08 19:36:46			'02662':3 '344.07':1 's588':2	284	\N	\N	\N
447	1267	\N	344.07 S588	\N	02663	0	\N	\N	0	\N	245	75e41c7a-601c-4d17-a480-276b175cef20		1	1	2	\N	2022-02-08 19:37:01	2022-02-08 19:37:01			'02663':3 '344.07':1 's588':2	284	\N	\N	\N
448	1267	\N	344.07 S588	\N	02664	0	\N	\N	0	\N	245	87986ea4-1684-4fa4-8c61-6ea93b369130		1	1	2	\N	2022-02-08 19:37:15	2022-02-08 19:37:15			'02664':3 '344.07':1 's588':2	284	\N	\N	\N
449	1267	\N	344.07 S588	\N	02665	0	\N	\N	0	\N	245	8ef95d40-6260-4ab3-b748-f759a97ff901		1	1	2	\N	2022-02-08 19:37:33	2022-02-08 19:37:33			'02665':3 '344.07':1 's588':2	284	\N	\N	\N
450	1267	\N	344.07 S588	\N	02666	0	\N	\N	0	\N	245	ab6edac8-54df-4802-82b2-81cfe0f4f471		1	1	2	\N	2022-02-08 19:38:00	2022-02-08 19:38:00			'02666':3 '344.07':1 's588':2	284	\N	\N	\N
451	1267	\N	344.07 S588	\N	02667	0	\N	\N	0	\N	245	c9392cfa-7dd6-4921-a676-93dbfb713336		1	1	2	\N	2022-02-08 19:38:34	2022-02-08 19:38:34			'02667':3 '344.07':1 's588':2	284	\N	\N	\N
452	1268	\N	006.6 H659A	\N	03771	0	\N	\N	0	\N	245	449238f4-6a75-4360-8d7f-8abf06b2a27f		1	1	2	\N	2022-02-08 20:22:41	2022-02-08 20:22:41			'006.6':1 '03771':3 'h659a':2	1364	\N	\N	\N
453	1268	\N	006.6 H659A	\N	03772	0	\N	\N	0	\N	245	39adc9b6-e510-405b-8a5d-cd2747377637		1	1	2	\N	2022-02-08 20:23:17	2022-02-08 20:23:17			'006.6':1 '03772':3 'h659a':2	1364	\N	\N	\N
454	1268	\N	006.6 H659A	\N	03773	0	\N	\N	0	\N	245	59850cb9-cb62-4a48-ac89-212266071802		1	1	2	\N	2022-02-08 20:23:45	2022-02-08 20:23:45			'006.6':1 '03773':3 'h659a':2	1364	\N	\N	\N
455	1268	\N	006.6 H659A	\N	03774	0	\N	\N	0	\N	245	b11c0cad-d8e6-4736-b37b-5fde6b7823ae		1	1	2	\N	2022-02-08 20:24:20	2022-02-08 20:24:20			'006.6':1 '03774':3 'h659a':2	1364	\N	\N	\N
456	1268	\N	006.6 H659A	\N	03775	0	\N	\N	0	\N	245	cb7b6f2f-f2c9-47b7-8b04-712b31994f53		1	1	2	\N	2022-02-08 20:24:47	2022-02-08 20:24:47			'006.6':1 '03775':3 'h659a':2	1364	\N	\N	\N
457	1268	\N	006.6 H659A	\N	03776	0	\N	\N	0	\N	245	abbc9dad-3929-46b8-9b2f-08c926ca79ed		1	1	2	\N	2022-02-08 20:25:10	2022-02-08 20:25:10			'006.6':1 '03776':3 'h659a':2	1364	\N	\N	\N
458	1268	\N	006.6 H659A	\N	03777	0	\N	\N	0	\N	245	72fe5c14-81bc-4a7b-95cd-d7e20d9db460		1	1	2	\N	2022-02-08 20:25:24	2022-02-08 20:25:24			'006.6':1 '03777':3 'h659a':2	\N	\N	\N	\N
459	1268	\N	006.6 H659A	\N	03778	0	\N	\N	0	\N	245	d1fb6544-572b-47a4-85f1-0fa2e468bb7e		1	1	2	\N	2022-02-08 20:25:38	2022-02-08 20:27:48			'006.6':1 '03778':3 'h659a':2	1364	\N	\N	\N
460	1269	\N	006.6 S835B	\N	00161	0	\N	\N	0	\N	245	fdf35758-b0fa-42db-9a5a-a2a3a8a2c4ba		1	1	2	\N	2022-02-08 20:43:12	2022-02-08 20:43:12			'00161':3 '006.6':1 's835b':2	1111	\N	\N	\N
461	1269	\N	006.6 S835B	\N	00162	0	\N	\N	0	\N	245	f04f6114-9248-4fd6-92a7-1c753664ae66		1	1	2	\N	2022-02-08 20:43:45	2022-02-08 20:43:45			'00162':3 '006.6':1 's835b':2	\N	\N	\N	\N
463	1269	\N	006.6 S835B	\N	00163	0	\N	\N	0	\N	245	563f060f-388e-4924-8ab7-e7f9f4fe5a1e		1	1	2	\N	2022-02-08 20:44:18	2022-02-08 20:44:18			'00163':3 '006.6':1 's835b':2	1111	\N	\N	\N
464	1269	\N	006.6 S835B	\N	00164	0	\N	\N	0	\N	245	d0a140c6-6e7f-4631-98a5-80cf0b8a91b0		1	1	2	\N	2022-02-08 20:44:44	2022-02-08 20:44:44			'00164':3 '006.6':1 's835b':2	1111	\N	\N	\N
465	1269	\N	006.6 S835B	\N	03836	0	\N	\N	0	\N	245	3bd48cd0-ff06-4c6a-91d4-26ec038c12da		1	1	2	\N	2022-02-08 20:45:12	2022-02-08 20:45:12			'006.6':1 '03836':3 's835b':2	1111	\N	\N	\N
466	1269	\N	006.6 S835B	\N	03837	0	\N	\N	0	\N	245	a05c4565-9f54-4ed1-9766-fb38aa1c820b		1	1	2	\N	2022-02-08 20:45:35	2022-02-08 20:45:35			'006.6':1 '03837':3 's835b':2	1111	\N	\N	\N
467	1269	\N	006.6 S835B	\N	03838	0	\N	\N	0	\N	245	29896cbc-dc44-4bde-9e4a-906fd5764396		1	1	2	\N	2022-02-08 20:45:56	2022-02-08 20:45:56			'006.6':1 '03838':3 's835b':2	1111	\N	\N	\N
468	1269	\N	006.6 S835B	\N	03839	0	\N	\N	0	\N	245	a694fc53-0935-4913-a897-be17033ca368		1	1	2	\N	2022-02-08 20:46:23	2022-02-08 20:46:23			'006.6':1 '03839':3 's835b':2	1111	\N	\N	\N
469	1269	\N	006.6 S835B	\N	03840	0	\N	\N	0	\N	245	b37c93be-b915-4603-9ab6-b2ebce4af77e		1	1	2	\N	2022-02-08 20:46:57	2022-02-08 20:46:57			'006.6':1 '03840':3 's835b':2	1111	\N	\N	\N
470	1269	\N	006.6 S835B	\N	03841	0	\N	\N	0	\N	245	bdb4f5c9-b70f-4db8-8b1a-23cd3cab05c6		1	1	2	\N	2022-02-08 20:47:23	2022-02-08 20:47:23			'006.6':1 '03841':3 's835b':2	1111	\N	\N	\N
471	1270	\N	343.05 C654 2009	\N	03907	0	\N	\N	0	\N	245	3fc89e88-c4e8-4ef0-ac3c-db3aaecd3450		1	1	2	\N	2022-02-08 20:52:31	2022-02-08 20:52:31			'03907':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
472	1270	\N	343.05 C654 2009	\N	03908	0	\N	\N	0	\N	245	0823fcc0-8ca5-4203-bfa5-d4acc042d6c8		1	1	2	\N	2022-02-08 20:53:00	2022-02-08 20:53:00			'03908':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
473	1270	\N	343.05 C654 2009	\N	03909	0	\N	\N	0	\N	245	01432840-b1d8-4b1f-acb4-f23cfaff8e2f		1	1	2	\N	2022-02-08 20:54:07	2022-02-08 20:54:07			'03909':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
474	1270	\N	343.05 C654 2009	\N	03910	0	\N	\N	0	\N	245	7fa872e9-6f02-4483-986b-7280ee9e15dc		1	1	2	\N	2022-02-08 20:54:31	2022-02-08 20:54:31			'03910':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
475	1270	\N	343.05 C654 2009	\N	03911	0	\N	\N	0	\N	245	c43ee25a-e391-484c-af5d-b46e1f8400cd		1	1	2	\N	2022-02-08 20:54:53	2022-02-08 20:54:53			'03911':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
476	1270	\N	343.05 C654 2009	\N	03912	0	\N	\N	0	\N	245	94d609da-b37a-455e-99cd-43d8a7ca72cd		1	1	2	\N	2022-02-08 20:55:23	2022-02-08 20:55:23			'03912':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
477	1270	\N	343.05 C654 2009	\N	03913	0	\N	\N	0	\N	245	a3febd4d-9cf3-4a28-85b2-2ef38acc6cb9		1	1	2	\N	2022-02-08 20:55:35	2022-02-08 20:55:35			'03913':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
478	1270	\N	343.05 C654 2009	\N	03914	0	\N	\N	0	\N	245	81a66e85-eb20-4a09-a60c-1b1b72d245fb		1	1	2	\N	2022-02-08 20:55:51	2022-02-08 20:55:51			'03914':4 '2009':3 '343.05':1 'c654':2	1382	\N	\N	\N
479	1271	\N	005.74 S846D	\N	04117	0	\N	\N	0	\N	111	ef1657c8-e7cd-4ae2-8f13-14987e788f95		1	1	2	\N	2022-02-08 22:19:25	2022-02-08 22:19:25			'005.74':1 '04117':3 's846d':2	14131413	\N	\N	\N
480	1271	\N	005.74 S846D	\N	04118	0	\N	\N	0	\N	111	50b6219f-d2c4-4acb-921a-62e5d2c8b2a2		1	1	2	\N	2022-02-08 22:19:50	2022-02-08 22:19:50			'005.74':1 '04118':3 's846d':2	1413	\N	\N	\N
481	1271	\N	005.74 S846D	\N	04119	0	\N	\N	0	\N	111	e65c6363-af52-4e62-bd3e-0a481f1d3298		1	1	2	\N	2022-02-08 22:20:14	2022-02-08 22:20:14			'005.74':1 '04119':3 's846d':2	1413	\N	\N	\N
482	1271	\N	005.74 S846D	\N	04120	0	\N	\N	0	\N	111	520179aa-28c8-47e0-93f2-d711b056135c		1	1	2	\N	2022-02-08 22:20:27	2022-02-08 22:20:27			'005.74':1 '04120':3 's846d':2	1413	\N	\N	\N
483	1271	\N	005.74 S846D	\N	04121	0	\N	\N	0	\N	111	34760d82-fff1-4454-8eba-856516094faf		1	1	2	\N	2022-02-08 22:20:48	2022-02-08 22:20:48			'005.74':1 '04121':3 's846d':2	1413	\N	\N	\N
484	1271	\N	005.74 S846D	\N	04122	0	\N	\N	0	\N	111	5e131b96-45ed-4702-b2dd-124b145acef6		1	1	2	\N	2022-02-08 22:21:09	2022-02-08 22:21:09			'005.74':1 '04122':3 's846d':2	1413	\N	\N	\N
485	1271	\N	005.74 S846D	\N	04123	0	\N	\N	0	\N	111	0053ed88-e015-49f5-b237-c16425323d9f		1	1	2	\N	2022-02-08 22:21:23	2022-02-08 22:21:23			'005.74':1 '04123':3 's846d':2	1413	\N	\N	\N
486	1271	\N	005.74 S846D	\N	04124	0	\N	\N	0	\N	111	3698cb68-2a14-43ef-b8ea-bd152d1af2cb		1	1	2	\N	2022-02-08 22:21:38	2022-02-08 22:21:38			'005.74':1 '04124':3 's846d':2	1413	\N	\N	\N
487	1272	\N	005.74 L383S 2008	\N	04146	0	\N	\N	0	\N	245	196f325f-d33d-4c65-af7f-d46a5ef21455		1	1	2	\N	2022-02-08 22:30:48	2022-02-08 22:30:48			'005.74':1 '04146':4 '2008':3 'l383s':2	1419	\N	\N	\N
488	1272	\N	005.74 L383S 2008	\N	04147	0	\N	\N	0	\N	245	b6de4ecf-5c8f-409b-9bce-2e8384ae99bd		1	1	2	\N	2022-02-08 22:31:08	2022-02-08 22:31:08			'005.74':1 '04147':4 '2008':3 'l383s':2	1419	\N	\N	\N
489	1273	\N	344.02 C393D	\N	04158	0	\N	\N	0	\N	82	096485fc-4529-41a0-8bb6-9c0d802c3b92		1	1	2	\N	2022-02-08 22:43:22	2022-02-08 22:43:22			'04158':3 '344.02':1 'c393d':2	1422	\N	\N	\N
490	1273	\N	344.02 C393D	\N	04159	0	\N	\N	0	\N	82	162de83f-f62e-4b72-9f28-1f0a9cc3100f		1	1	2	\N	2022-02-08 22:43:34	2022-02-08 22:43:34			'04159':3 '344.02':1 'c393d':2	1422	\N	\N	\N
491	1273	\N	344.02 C393D	\N	04160	0	\N	\N	0	\N	82	277b3ea1-b537-411f-b5c5-c9c5504a90fb		1	1	2	\N	2022-02-08 22:43:51	2022-02-08 22:43:51			'04160':3 '344.02':1 'c393d':2	1422	\N	\N	\N
493	1273	\N	344.02 C393D	\N	04161	0	\N	\N	0	\N	82	46e41740-2e0b-4d15-9ac3-96c18d73d9c2		1	1	2	\N	2022-02-08 22:44:12	2022-02-08 22:44:12			'04161':3 '344.02':1 'c393d':2	1422	\N	\N	\N
494	1273	\N	344.02 C393D	\N	04162	0	\N	\N	0	\N	82	0f2a385e-955c-4bcb-8916-5b133446285a		1	1	2	\N	2022-02-08 22:44:28	2022-02-08 22:44:28			'04162':3 '344.02':1 'c393d':2	1422	\N	\N	\N
495	1273	\N	344.02 C393D	\N	04163	0	\N	\N	0	\N	82	3097c1d8-5519-4056-a8f3-dc2a68d4b21d		1	1	2	\N	2022-02-08 22:44:52	2022-02-08 22:44:52			'04163':3 '344.02':1 'c393d':2	1422	\N	\N	\N
496	1274	\N	005.74 P688S 2006	\N	04187	0	\N	\N	0	\N	245	571aedae-c039-49e7-ac4f-ec72a561440b		1	1	2	\N	2022-02-08 22:49:21	2022-02-08 22:49:21			'005.74':1 '04187':4 '2006':3 'p688s':2	1429	\N	\N	\N
497	1274	\N	005.74 P688S 2006	\N	04188	0	\N	\N	0	\N	245	e2742681-0496-4971-8f3d-60e378e962e3		1	1	2	\N	2022-02-08 22:49:33	2022-02-08 22:49:33			'005.74':1 '04188':4 '2006':3 'p688s':2	1429	\N	\N	\N
498	1274	\N	005.74 P688S 2006	\N	04189	0	\N	\N	0	\N	245	f8053f56-307f-4efc-aed2-b4dca22affb1		1	1	2	\N	2022-02-08 22:49:57	2022-02-08 22:49:57			'005.74':1 '04189':4 '2006':3 'p688s':2	1429	\N	\N	\N
499	1274	\N	005.74 P688S 2006	\N	04190	0	\N	\N	0	\N	245	b11b4ff6-db58-4b56-a8c5-8df46bfbbc2a		1	1	2	\N	2022-02-08 22:50:12	2022-02-08 22:50:12			'005.74':1 '04190':4 '2006':3 'p688s':2	1429	\N	\N	\N
500	1274	\N	005.74 P688S 2006	\N	04191	0	\N	\N	0	\N	245	c648f97a-86f5-4183-9232-5b96d83b0974		1	1	2	\N	2022-02-08 22:50:28	2022-02-08 22:50:28			'005.74':1 '04191':4 '2006':3 'p688s':2	1429	\N	\N	\N
501	1275	\N	344 L465I 2009	\N	04386	0	\N	\N	0	\N	60	04dd7607-57d6-4a75-a54b-34f580225443		1	1	2	\N	2022-02-08 22:53:52	2022-02-08 22:53:52			'04386':4 '2009':3 '344':1 'l465i':2	95	\N	\N	\N
502	1275	\N	344 L465I 2009	\N	04387	0	\N	\N	0	\N	60	e9672ef2-629a-4d59-98a5-e9492ba3b19a		1	1	2	\N	2022-02-08 22:54:21	2022-02-08 22:54:21			'04387':4 '2009':3 '344':1 'l465i':2	95	\N	\N	\N
503	1275	\N	344 L465I 2009	\N	04388	0	\N	\N	0	\N	60	7ad7a977-2558-4c77-a5e8-3519837043fa		1	1	2	\N	2022-02-08 22:55:30	2022-02-08 22:55:30			'04388':4 '2009':3 '344':1 'l465i':2	95	\N	\N	\N
504	1275	\N	344 L465I 2009	\N	04389	0	\N	\N	0	\N	60	0d6a4b64-0049-43c0-9b7a-1298064abfa7		1	1	2	\N	2022-02-08 22:56:06	2022-02-08 22:56:06			'04389':4 '2009':3 '344':1 'l465i':2	95	\N	\N	\N
505	1275	\N	344 L465I 2009	\N	04390	0	\N	\N	0	\N	60	ca89d3dc-08fe-4767-a480-122a8b5947b1		1	1	2	\N	2022-02-08 22:56:38	2022-02-08 22:56:38			'04390':4 '2009':3 '344':1 'l465i':2	95	\N	\N	\N
506	1276	\N	006.7 S555D	\N	03795	0	\N	\N	0	\N	245	c44efc5a-5b8a-48e1-a834-3caab6a1bc67		1	1	2	\N	2022-02-08 23:00:11	2022-02-08 23:00:11			'006.7':1 '03795':3 's555d':2	1163	\N	\N	\N
507	1276	\N	006.7 S555D	\N	03796	0	\N	\N	0	\N	245	1e8fed1d-7ecd-40b7-bad9-4d2ce094d13e		1	1	2	\N	2022-02-08 23:00:26	2022-02-08 23:00:26			'006.7':1 '03796':3 's555d':2	1163	\N	\N	\N
508	1276	\N	006.7 S555D	\N	03797	0	\N	\N	0	\N	245	bb67a047-5e7d-4470-956b-a4bf2722a40f		1	1	2	\N	2022-02-08 23:00:55	2022-02-08 23:00:55			'006.7':1 '03797':3 's555d':2	1163	\N	\N	\N
509	1276	\N	006.7 S555D	\N	04514	0	\N	\N	0	\N	245	2ab02042-fd3f-4fd9-9b05-4be66f059baa		1	1	2	\N	2022-02-08 23:01:15	2022-02-08 23:01:15			'006.7':1 '04514':3 's555d':2	1163	\N	\N	\N
510	1276	\N	006.7 S555D	\N	04515	0	\N	\N	0	\N	245	e073f23e-6695-4319-8885-5fb648dcee3d		1	1	2	\N	2022-02-08 23:01:36	2022-02-08 23:01:36			'006.7':1 '04515':3 's555d':2	1163	\N	\N	\N
511	1276	\N	006.7 S555D	\N	04516	0	\N	\N	0	\N	245	07e56a2a-ab27-4b50-a6f3-c1c1784f7232		1	1	2	\N	2022-02-08 23:02:01	2022-02-08 23:02:01			'006.7':1 '04516':3 's555d':2	1163	\N	\N	\N
512	1276	\N	006.7 S555D	\N	04517	0	\N	\N	0	\N	245	1368ac84-6c58-4490-93c4-49bdf2789b10		1	1	2	\N	2022-02-08 23:02:31	2022-02-08 23:02:31			'006.7':1 '04517':3 's555d':2	1163	\N	\N	\N
513	1276	\N	006.7 S555D	\N	04518	0	\N	\N	0	\N	245	d82143ad-fe0a-438a-83bb-a9854896654f		1	1	2	\N	2022-02-08 23:02:56	2022-02-08 23:02:56			'006.7':1 '04518':3 's555d':2	1163	\N	\N	\N
514	1277	\N	006.6 B733H	\N	04677	0	\N	\N	0	\N	245	8f1d3119-2214-45b7-ae8d-18d53f372fc6		1	1	2	\N	2022-02-08 23:07:38	2022-02-08 23:07:38			'006.6':1 '04677':3 'b733h':2	1515	\N	\N	\N
515	1277	\N	006.6 B733H	\N	04678	0	\N	\N	0	\N	245	d51a7654-c384-4262-b836-213eca3acdb3		1	1	2	\N	2022-02-08 23:07:58	2022-02-08 23:07:58			'006.6':1 '04678':3 'b733h':2	1515	\N	\N	\N
516	1277	\N	006.6 B733H	\N	04679	0	\N	\N	0	\N	245	dbcc35ce-2467-4559-8aea-f585e723f002		1	1	2	\N	2022-02-08 23:08:17	2022-02-08 23:08:17			'006.6':1 '04679':3 'b733h':2	1515	\N	\N	\N
517	1277	\N	006.6 B733H	\N	04680	0	\N	\N	0	\N	245	9e6b9c31-03ca-4540-afac-20f371a48bfb		1	1	2	\N	2022-02-08 23:08:55	2022-02-08 23:08:55			'006.6':1 '04680':3 'b733h':2	1515	\N	\N	\N
518	1277	\N	006.6 B733H	\N	04681	0	\N	\N	0	\N	245	c88151b8-d499-4dd3-9687-b7ebbb11274a		1	1	2	\N	2022-02-08 23:09:12	2022-02-08 23:09:12			'006.6':1 '04681':3 'b733h':2	1515	\N	\N	\N
519	1277	\N	006.6 B733H	\N	04682	0	\N	\N	0	\N	245	a8cebab4-3174-43db-8a8c-e0fd1fc066f6		1	1	2	\N	2022-02-08 23:09:33	2022-02-08 23:09:33			'006.6':1 '04682':3 'b733h':2	1515	\N	\N	\N
520	1278	\N	006.7 S225H	\N	04691	0	\N	\N	0	\N	245	de9d1027-879d-43b7-960d-b51a50f1ecc7		1	1	2	\N	2022-02-08 23:13:12	2022-02-08 23:13:12			'006.7':1 '04691':3 's225h':2	1518	\N	\N	\N
521	1278	\N	006.7 S225H	\N	04692	0	\N	\N	0	\N	245	7fd9b514-98d2-43b2-a616-87641767093a		1	1	2	\N	2022-02-08 23:13:48	2022-02-08 23:13:48			'006.7':1 '04692':3 's225h':2	1518	\N	\N	\N
522	1278	\N	006.7 S225H	\N	04693	0	\N	\N	0	\N	245	85ab8e78-788f-4f6d-a3d1-aebffd5a058a		1	1	2	\N	2022-02-08 23:14:30	2022-02-08 23:14:30			'006.7':1 '04693':3 's225h':2	1518	\N	\N	\N
523	1278	\N	006.7 S225H	\N	04694	0	\N	\N	0	\N	245	33ddd9f9-18da-45a7-9e13-7ac5acd6f349		1	1	2	\N	2022-02-08 23:14:50	2022-02-08 23:14:50			'006.7':1 '04694':3 's225h':2	1518	\N	\N	\N
524	1279	\N	006.6 A362	\N	04699	0	\N	\N	0	\N	245	39dbde13-8d52-4488-9b27-9b49d1b35802		1	1	2	\N	2022-02-08 23:22:27	2022-02-08 23:22:27			'006.6':1 '04699':3 'a362':2	1520	\N	\N	\N
525	1279	\N	006.6 A362	\N	04700	0	\N	\N	0	\N	245	1ec02386-76e7-4c57-89a6-92aa0d20e4da		1	1	2	\N	2022-02-08 23:22:45	2022-02-08 23:22:45			'006.6':1 '04700':3 'a362':2	1520	\N	\N	\N
526	1279	\N	006.6 A362	\N	04701	0	\N	\N	0	\N	245	febb9c9b-2a2a-4e83-88c3-3021cf239401		1	1	2	\N	2022-02-08 23:23:07	2022-02-08 23:23:07			'006.6':1 '04701':3 'a362':2	1520	\N	\N	\N
527	1279	\N	006.6 A362	\N	04702	0	\N	\N	0	\N	245	698fdb8b-69d9-40d2-aa9d-4b8b5a2a7168		1	1	2	\N	2022-02-08 23:23:26	2022-02-08 23:23:26			'006.6':1 '04702':3 'a362':2	1520	\N	\N	\N
528	1279	\N	006.6 A362	\N	04703	0	\N	\N	0	\N	245	42267019-54f6-408d-b313-54edf0e68876		1	1	2	\N	2022-02-08 23:23:54	2022-02-08 23:23:54			'006.6':1 '04703':3 'a362':2	1520	\N	\N	\N
529	1279	\N	006.6 A362	\N	04704	0	\N	\N	0	\N	245	9718a77c-16af-4e2d-a46e-610ffd531105		1	1	2	\N	2022-02-08 23:24:05	2022-02-08 23:24:05			'006.6':1 '04704':3 'a362':2	1520	\N	\N	\N
530	1280	\N	006.6 S553P	\N	04709	0	\N	\N	0	\N	245	288d0a68-5843-4a9c-a997-cf9fa3169eb7		1	1	2	\N	2022-02-08 23:26:30	2022-02-08 23:26:30			'006.6':1 '04709':3 's553p':2	1522	\N	\N	\N
531	1280	\N	006.6 S553P	\N	04710	0	\N	\N	0	\N	245	dd1a2fd8-76b0-47e1-a8dc-b6029abe53a6		1	1	2	\N	2022-02-08 23:26:41	2022-02-08 23:26:41			'006.6':1 '04710':3 's553p':2	1522	\N	\N	\N
532	1280	\N	006.6 S553P	\N	04711	0	\N	\N	0	\N	245	d065292a-24c7-49cd-9445-842eec777213		1	1	2	\N	2022-02-08 23:27:02	2022-02-08 23:27:02			'006.6':1 '04711':3 's553p':2	1522	\N	\N	\N
533	1280	\N	006.6 S553P	\N	04712	0	\N	\N	0	\N	245	c1e70ca3-b26f-436a-abab-3330b463cc07		1	1	2	\N	2022-02-08 23:27:20	2022-02-08 23:27:20			'006.6':1 '04712':3 's553p':2	1522	\N	\N	\N
534	1280	\N	006.6 S553P	\N	04713	0	\N	\N	0	\N	245	d5d379ca-a9a5-4b4a-8e12-79d9a5a3d434		1	1	2	\N	2022-02-08 23:27:35	2022-02-08 23:27:35			'006.6':1 '04713':3 's553p':2	1522	\N	\N	\N
535	1281	\N	006.7 G768f	\N	04714	0	\N	\N	0	\N	245	41a772b3-0818-4f5c-a0f6-465a49a58735		1	1	2	\N	2022-02-08 23:36:07	2022-02-08 23:36:07			'006.7':1 '04714':3 'g768f':2	1523	\N	\N	\N
536	1281	\N	006.7 G768f	\N	04715	0	\N	\N	0	\N	245	157f002a-53a2-4239-94d8-4233b9812f74		1	1	2	\N	2022-02-08 23:36:21	2022-02-08 23:36:21			'006.7':1 '04715':3 'g768f':2	1523	\N	\N	\N
537	1281	\N	006.7 G768f	\N	04716	0	\N	\N	0	\N	245	4daaafc9-c8fd-4200-84d3-084ef0503ac1		1	1	2	\N	2022-02-08 23:36:37	2022-02-08 23:36:37			'006.7':1 '04716':3 'g768f':2	1523	\N	\N	\N
538	1281	\N	006.7 G768f	\N	04717	0	\N	\N	0	\N	245	753a0e8a-dcd4-4149-a9a3-6c6bde20639c		1	1	2	\N	2022-02-08 23:37:10	2022-02-08 23:37:10			'006.7':1 '04717':3 'g768f':2	1523	\N	\N	\N
539	1281	\N	006.7 G768f	\N	04718	0	\N	\N	0	\N	245	0b758f1b-d0e1-4cb5-b555-9ea2a7864a74		1	1	2	\N	2022-02-08 23:37:32	2022-02-08 23:37:32			'006.7':1 '04718':3 'g768f':2	1523	\N	\N	\N
540	1282	\N	006.6 A362	\N	04719	0	\N	\N	0	\N	245	84a97c6e-9177-4bd2-a687-d9764f87a81f		1	1	2	\N	2022-02-08 23:39:46	2022-02-08 23:39:46			'006.6':1 '04719':3 'a362':2	1524	\N	\N	\N
541	1282	\N	006.6 A362	\N	04720	0	\N	\N	0	\N	245	ffed2af1-8acf-41ad-800d-7f34a37d62d2		1	1	2	\N	2022-02-08 23:40:04	2022-02-08 23:40:04			'006.6':1 '04720':3 'a362':2	1524	\N	\N	\N
542	1282	\N	006.6 A362	\N	04721	0	\N	\N	0	\N	245	16bb49c6-4cca-4d28-9092-b6c25c7fb13b		1	1	2	\N	2022-02-08 23:40:19	2022-02-08 23:40:19			'006.6':1 '04721':3 'a362':2	1524	\N	\N	\N
543	1282	\N	006.6 A362	\N	04722	0	\N	\N	0	\N	245	88ff1aae-30c0-45aa-bbda-199c7e48ffa1		1	1	2	\N	2022-02-08 23:40:33	2022-02-08 23:40:33			'006.6':1 '04722':3 'a362':2	1524	\N	\N	\N
544	1282	\N	006.6 A362	\N	04723	0	\N	\N	0	\N	245	2177fc11-39cb-4849-a6e4-43e5d72a9ade		1	1	2	\N	2022-02-08 23:40:48	2022-02-08 23:40:48			'006.6':1 '04723':3 'a362':2	1524	\N	\N	\N
545	1283	\N	005.74 G555A	\N	04890	0	\N	\N	0	\N	57	2f5404aa-94f0-4f33-8a9c-06cb6958cd11		1	1	2	\N	2022-02-08 23:44:04	2022-02-08 23:44:04			'005.74':1 '04890':3 'g555a':2	1583	\N	\N	\N
546	1283	\N	005.74 G555A	\N	04891	0	\N	\N	0	\N	57	46856a75-9849-48c8-9e78-5a7362152baa		1	1	2	\N	2022-02-08 23:44:29	2022-02-08 23:44:29			'005.74':1 '04891':3 'g555a':2	1583	\N	\N	\N
547	1284	\N	006.6 S527M	\N	04919	0	\N	\N	0	\N	82	19fb576e-b5b6-4f8e-a58a-c3429005e924		1	1	2	\N	2022-02-08 23:46:39	2022-02-08 23:46:39			'006.6':1 '04919':3 's527m':2	1596	\N	\N	\N
548	1285	\N	343.05 C378D	\N	05184	0	\N	\N	0	\N	82	75f3caa0-e154-4170-8125-dfc8fbd7efba		1	1	2	\N	2022-02-08 23:48:57	2022-02-08 23:48:57			'05184':3 '343.05':1 'c378d':2	1721	\N	\N	\N
549	1285	\N	343.05 C378D	\N	05185	0	\N	\N	0	\N	82	56593473-003b-4351-9907-7f67823d0e2e		1	1	2	\N	2022-02-08 23:53:24	2022-02-08 23:53:24			'05185':3 '343.05':1 'c378d':2	1721	\N	\N	\N
550	1286	\N	020 B338A 2002	\N	00182	0	\N	\N	0	\N	245	b9e0f881-68a9-48db-99d9-5826137ed56a		1	1	2	\N	2022-02-09 13:39:57	2022-02-09 13:39:57			'00182':4 '020':1 '2002':3 'b338a':2	21	\N	\N	\N
551	1286	\N	020 B338A 2002	\N	00183	0	\N	\N	0	\N	245	c02b8205-0574-4a0e-a67b-efe925f0456a		1	1	2	\N	2022-02-09 13:40:16	2022-02-09 13:40:16			'00183':4 '020':1 '2002':3 'b338a':2	21	\N	\N	\N
552	1287	\N	020 C674	\N	00185	0	\N	\N	0	\N	245	388a4908-db45-4f91-b173-9670c1efe0e8		1	1	2	\N	2022-02-09 13:44:35	2022-02-09 13:44:35			'00185':3 '020':1 'c674':2	25	\N	\N	\N
553	1287	\N	020 C674	\N	00186	0	\N	\N	0	\N	245	6667b7a6-137c-433b-b172-4a77668f3481		1	1	2	\N	2022-02-09 13:44:48	2022-02-09 13:44:48			'00186':3 '020':1 'c674':2	25	\N	\N	\N
554	1287	\N	020 C674	\N	00187	0	\N	\N	0	\N	245	ff9c28cc-72e7-47d8-9d88-f2de53e3bf76		1	1	2	\N	2022-02-09 13:44:59	2022-02-09 13:44:59			'00187':3 '020':1 'c674':2	25	\N	\N	\N
555	1287	\N	020 C674	\N	00188	0	\N	\N	0	\N	245	7548f0c9-39fb-449d-b9b2-cd167c912634		1	1	2	\N	2022-02-09 13:45:19	2022-02-09 13:45:19			'00188':3 '020':1 'c674':2	25	\N	\N	\N
556	1288	\N	020 G853	\N	00190	0	\N	\N	0	\N	245	c84293ce-467d-4d50-b0eb-eead180e1f1a		1	1	2	\N	2022-02-09 13:50:16	2022-02-09 13:50:16			'00190':3 '020':1 'g853':2	14	\N	\N	\N
557	1288	\N	020 G853	\N	00191	0	\N	\N	0	\N	245	2691a2d6-ac2d-4799-a61a-52b4cbfb7dbe		1	1	2	\N	2022-02-09 13:50:32	2022-02-09 13:50:32			'00191':3 '020':1 'g853':2	14	\N	\N	\N
558	1289	\N	020 H458D	\N	00192	0	\N	\N	0	\N	245	c45c64f0-95de-4a2c-b955-76629883cc87		1	1	2	\N	2022-02-09 13:53:19	2022-02-09 14:14:00			'00192':3 '020':1 'h458d':2	26	\N	\N	\N
560	1290	\N	020 K785D	\N	00195	0	\N	\N	0	\N	245	bf0b30a6-c93f-402e-92d3-19daf16bea25		1	1	2	\N	2022-02-09 14:15:03	2022-02-09 14:15:03			'00195':3 '020':1 'k785d':2	19	\N	\N	\N
561	1291	\N	020 M677A 1994	\N	00197	0	\N	\N	0	\N	245	73c67327-add4-41f8-9c6e-120437e0e6d0		1	1	2	\N	2022-02-09 14:24:17	2022-02-09 14:24:17			'00197':4 '020':1 '1994':3 'm677a':2	12	\N	\N	\N
562	1291	\N	020 M677A 1994	\N	00198	0	\N	\N	0	\N	245	21bd909d-321e-4d01-abd9-84e831a034ff		1	1	2	\N	2022-02-09 14:24:32	2022-02-09 14:24:32			'00198':4 '020':1 '1994':3 'm677a':2	12	\N	\N	\N
563	1292	\N	020 N458R	\N	00199	0	\N	\N	0	\N	245	0e909429-b3c8-45c0-98e1-e7caa5a117a4		1	1	2	\N	2022-02-09 15:09:32	2022-02-09 15:09:32			'00199':3 '020':1 'n458r':2	15	\N	\N	\N
564	1293	\N	020 N784 1993	\N	00200	0	\N	\N	0	\N	245	689e4df9-e064-4399-b4aa-93a2cb5a59ce		1	1	2	\N	2022-02-09 15:11:31	2022-02-09 15:11:31			'00200':4 '020':1 '1993':3 'n784':2	18	\N	\N	\N
565	1294	\N	020 O284	\N	00201	0	\N	\N	0	\N	245	a384e7e1-ae1d-4e5b-9ce6-fb9e4afe9176		1	1	2	\N	2022-02-09 15:14:19	2022-02-09 15:14:19			'00201':3 '020':1 'o284':2	32	\N	\N	\N
566	1295	\N	020 P382D 2001	\N	00202	0	\N	\N	0	\N	213	13335026-da33-47ea-a54b-c63b8a7bfea6		1	1	2	\N	2022-02-09 15:17:03	2022-02-09 15:17:03			'00202':4 '020':1 '2001':3 'p382d':2	33	\N	\N	\N
567	1295	\N	020 P382D 2001	\N	00203	0	\N	\N	0	\N	213	b679979e-d126-46b8-95e6-7bfd794692ff		1	1	2	\N	2022-02-09 15:17:19	2022-02-09 15:17:19			'00203':4 '020':1 '2001':3 'p382d':2	33	\N	\N	\N
568	1296	\N	020 P453G	\N	00209	0	\N	\N	0	\N	111	d0ce8e21-bccb-4f00-8a1e-6d7a9d28d2ab		1	1	2	\N	2022-02-09 15:19:14	2022-02-09 15:19:14			'00209':3 '020':1 'p453g':2	17	\N	\N	\N
569	1297	\N	020 P382N	\N	00206	0	\N	\N	0	\N	213	9164084c-2c58-4925-a626-db03cb5842e9		1	1	2	\N	2022-02-09 15:24:52	2022-02-09 15:24:52			'00206':3 '020':1 'p382n':2	28	\N	\N	\N
570	1297	\N	020 P382N	\N	00207	0	\N	\N	0	\N	213	2124a102-90cc-43e8-b3b2-e6f7c009a766		1	1	2	\N	2022-02-09 15:25:44	2022-02-09 15:25:44			'00207':3 '020':1 'p382n':2	28	\N	\N	\N
571	1297	\N	020 P382N	\N	00208	0	\N	\N	0	\N	213	a5c5cbf8-0805-4286-98b2-dfa77e30467e		1	1	2	\N	2022-02-09 15:26:02	2022-02-09 15:26:02			'00208':3 '020':1 'p382n':2	28	\N	\N	\N
575	1298	\N	020 P382N	\N	00204	0	\N	\N	0	\N	213	c797f170-a78f-46c2-9212-4721ba44d79b		1	1	2	\N	2022-02-09 15:29:27	2022-02-09 15:29:27			'00204':3 '020':1 'p382n':2	16	\N	\N	\N
577	1298	\N	020 P382N	\N	00205	0	\N	\N	0	\N	213	f66b97d9-336d-4fc1-87db-85fbed3270bd		1	1	2	\N	2022-02-09 15:29:56	2022-02-09 15:29:56			'00205':3 '020':1 'p382n':2	16	\N	\N	\N
578	1299	\N	020 R393R 2003	\N	00210	0	\N	\N	0	\N	213	c36ea494-9afb-4c13-bb49-a8fd10c45ec2		1	1	2	\N	2022-02-09 15:32:42	2022-02-09 15:32:42			'00210':4 '020':1 '2003':3 'r393r':2	13	\N	\N	\N
579	1299	\N	020 R393R 2003	\N	00211	0	\N	\N	0	\N	213	166ffe72-42ae-4848-9bc7-0c5ecc6f550a		1	1	2	\N	2022-02-09 15:32:55	2022-02-09 15:32:55			'00211':4 '020':1 '2003':3 'r393r':2	13	\N	\N	\N
580	1299	\N	020 R393R 2003	\N	00212	0	\N	\N	0	\N	213	91e7542d-7ee5-4049-be9c-f3bcf60839ca		1	1	2	\N	2022-02-09 15:33:05	2022-02-09 15:33:05			'00212':4 '020':1 '2003':3 'r393r':2	13	\N	\N	\N
582	1300	\N	345.028 L664D	\N	02668	0	\N	\N	0	\N	245	71765f9a-2a89-4b40-a44e-ce923057c080		1	1	2	\N	2022-02-09 21:06:45	2022-02-09 21:06:45			'02668':3 '345.028':1 'l664d':2	1043	\N	\N	\N
583	1300	\N	345.028 L664D	\N	02669	0	\N	\N	0	\N	245	85a2d238-8d0a-4b0e-9e9a-44a3783dd33f		1	1	2	\N	2022-02-09 21:06:57	2022-02-09 21:06:57			'02669':3 '345.028':1 'l664d':2	1043	\N	\N	\N
584	1300	\N	345.028 L664D	\N	02670	0	\N	\N	0	\N	245	82fcdecb-2179-4992-b634-8d6e6b367161		1	1	2	\N	2022-02-09 21:07:07	2022-02-09 21:07:07			'02670':3 '345.028':1 'l664d':2	1043	\N	\N	\N
585	1300	\N	345.028 L664D	\N	02671	0	\N	\N	0	\N	245	31d85f24-6239-46d9-a4dd-249bbd390567		1	1	2	\N	2022-02-09 21:07:17	2022-02-09 21:07:17			'02671':3 '345.028':1 'l664d':2	1043	\N	\N	\N
586	1300	\N	345.028 L664D	\N	02672	0	\N	\N	0	\N	245	af372ddc-6ef0-435a-8a13-a835947de9c1		1	1	2	\N	2022-02-09 21:07:33	2022-02-09 21:07:33			'02672':3 '345.028':1 'l664d':2	1043	\N	\N	\N
587	1300	\N	345.028 L664D	\N	02673	0	\N	\N	0	\N	245	27640416-90dc-45f3-b74c-d1d973a85b2a		1	1	2	\N	2022-02-09 21:09:29	2022-02-09 21:09:29			'02673':3 '345.028':1 'l664d':2	1043	\N	\N	\N
588	1300	\N	345.028 L664D	\N	02674	0	\N	\N	0	\N	245	f0e88514-8b2e-49f1-936f-ea43eb13d44c		1	1	2	\N	2022-02-09 21:09:46	2022-02-09 21:09:46			'02674':3 '345.028':1 'l664d':2	1043	\N	\N	\N
589	1300	\N	345.028 L664D	\N	02675	0	\N	\N	0	\N	245	f367c029-13ab-47ee-a885-746b1f6d0556		1	1	2	\N	2022-02-09 21:10:27	2022-02-09 21:10:27			'02675':3 '345.028':1 'l664d':2	1043	\N	\N	\N
590	1300	\N	345.028 L664D	\N	02676	0	\N	\N	0	\N	245	0f101e0b-664c-4014-9cf4-b3c5438b9806		1	1	2	\N	2022-02-09 21:10:38	2022-02-09 21:10:38			'02676':3 '345.028':1 'l664d':2	1043	\N	\N	\N
591	1300	\N	345.028 L664D	\N	02677	0	\N	\N	0	\N	245	b91adfd5-2a89-4228-8c07-238b346191bb		1	1	2	\N	2022-02-09 21:10:47	2022-02-09 21:10:47			'02677':3 '345.028':1 'l664d':2	1043	\N	\N	\N
592	1301	\N	346.024 M443C	\N	02678	0	\N	\N	0	\N	64	fe5f85f0-137f-4d5f-8060-4e34651126af		1	1	2	\N	2022-02-10 13:28:16	2022-02-10 13:28:16			'02678':3 '346.024':1 'm443c':2	264	\N	\N	\N
593	1301	\N	346.024 M443C	\N	02679	0	\N	\N	0	\N	64	2de0d123-06d2-4495-b7e2-3d7a5db8b350		1	1	2	\N	2022-02-10 13:28:28	2022-02-10 13:28:28			'02679':3 '346.024':1 'm443c':2	264	\N	\N	\N
594	1302	\N	347 B674T	\N	02680	0	\N	\N	0	\N	82	f9ab976c-5c64-44e0-b726-803a13ac16bf		1	1	2	\N	2022-02-10 13:31:16	2022-02-10 13:31:16			'02680':3 '347':1 'b674t':2	298	\N	\N	\N
597	1303	\N	348 C635 2008	\N	02687	0	\N	\N	0	\N	60	09f9c97e-22d8-4b20-8676-766e3823c7b1		1	1	2	\N	2022-02-10 13:37:53	2022-02-10 13:37:53			'02687':4 '2008':3 '348':1 'c635':2	1075	\N	\N	\N
598	1303	\N	348 C635 2008	\N	02688	0	\N	\N	0	\N	60	d11f18f7-17e9-41eb-902f-b1ecd633deb8		1	1	2	\N	2022-02-10 13:38:08	2022-02-10 13:38:08			'02688':4 '2008':3 '348':1 'c635':2	1075	\N	\N	\N
599	1304	\N	347.01 L388A	\N	02681	0	\N	\N	0	\N	60	42b15240-db12-4419-81af-1e236e35148c		1	1	2	\N	2022-02-10 13:43:26	2022-02-10 13:43:26			'02681':3 '347.01':1 'l388a':2	737	\N	\N	\N
600	1304	\N	347.01 L388A	\N	02682	0	\N	\N	0	\N	60	09f8e203-5438-4eb4-a581-4d95e4bf8d8f		1	1	2	\N	2022-02-10 13:43:41	2022-02-10 13:43:41			'02682':3 '347.01':1 'l388a':2	737	\N	\N	\N
601	1304	\N	347.01 L388A	\N	02683	0	\N	\N	0	\N	60	fa87094e-0b2a-4f00-961b-c0f706d95f2e		1	1	2	\N	2022-02-10 13:44:01	2022-02-10 13:44:01			'02683':3 '347.01':1 'l388a':2	737	\N	\N	\N
602	1304	\N	347.01 L388A	\N	02684	0	\N	\N	0	\N	60	6b263b9e-41b2-4f76-8cee-46f9a11fd12b		1	1	2	\N	2022-02-10 13:44:16	2022-02-10 13:44:16			'02684':3 '347.01':1 'l388a':2	737	\N	\N	\N
603	1304	\N	347.01 L388A	\N	02685	0	\N	\N	0	\N	60	403d5430-dfa4-4980-ab98-936c3684d2a2		1	1	2	\N	2022-02-10 13:44:30	2022-02-10 13:44:30			'02685':3 '347.01':1 'l388a':2	737	\N	\N	\N
604	1304	\N	347.01 L388A	\N	02686	0	\N	\N	0	\N	60	78060e53-c156-4dbf-addc-a11c253d40fb		1	1	2	\N	2022-02-10 13:44:47	2022-02-10 13:44:47			'02686':3 '347.01':1 'l388a':2	737	\N	\N	\N
605	1305	\N	346.065 L465C	\N	03043	0	\N	\N	0	\N	64	ebdf3683-072a-43dd-82b2-7d156c3f593a		1	1	2	\N	2022-02-10 13:47:17	2022-02-10 13:47:17			'03043':3 '346.065':1 'l465c':2	312	\N	\N	\N
606	1305	\N	346.065 L465C	\N	03044	0	\N	\N	0	\N	64	7a0c4959-7136-483a-9c16-bfde5219b958		1	1	2	\N	2022-02-10 13:47:28	2022-02-10 13:47:28			'03044':3 '346.065':1 'l465c':2	312	\N	\N	\N
607	1306	\N	348 C635	\N	03803	0	\N	\N	0	\N	245	500fa59d-cf05-4bd0-b8b2-d312b080bf22		1	1	2	\N	2022-02-10 14:21:06	2022-02-10 14:21:06			'03803':3 '348':1 'c635':2	1365	\N	\N	\N
608	1306	\N	348 C635	\N	03804	0	\N	\N	0	\N	245	c1e2d5b1-c1df-4e19-8fd1-9815aa7be2c3		1	1	2	\N	2022-02-10 14:21:18	2022-02-10 14:21:18			'03804':3 '348':1 'c635':2	1365	\N	\N	\N
609	1306	\N	348 C635	\N	03805	0	\N	\N	0	\N	245	68f912ce-a66d-4bb5-b358-8a4a4a939458		1	1	2	\N	2022-02-10 14:21:28	2022-02-10 14:21:28			'03805':3 '348':1 'c635':2	1365	\N	\N	\N
610	1306	\N	348 C635	\N	03806	0	\N	\N	0	\N	245	b1e7d038-3f44-48e9-bcc7-3b080591bf59		1	1	2	\N	2022-02-10 14:21:47	2022-02-10 14:21:47			'03806':3 '348':1 'c635':2	1365	\N	\N	\N
611	1306	\N	348 C635	\N	03807	0	\N	\N	0	\N	245	43b9cda6-b7de-4c1b-b634-479269e18671		1	1	2	\N	2022-02-10 14:22:04	2022-02-10 14:22:04			'03807':3 '348':1 'c635':2	1365	\N	\N	\N
612	1306	\N	348 C635	\N	04148	0	\N	\N	0	\N	245	549a7032-a55a-4884-8cb5-b2682b45dc92		1	1	2	\N	2022-02-10 14:22:20	2022-02-10 14:22:20			'04148':3 '348':1 'c635':2	1365	\N	\N	\N
614	1307	\N	348 L494 2002	\N	03808	0	\N	\N	0	\N	82	2b8d1b85-0b94-4866-badf-5e71258efc25		1	1	2	\N	2022-02-10 14:33:10	2022-02-10 14:33:19			'03808':4 '2002':3 '348':1 'l494':2	1366	\N	\N	\N
615	1307	\N	348 L494 2002	\N	03809	0	\N	\N	0	\N	82	fe789f62-d859-41c6-970e-4d3fa10e2e97		1	1	2	\N	2022-02-10 14:33:32	2022-02-10 14:33:32			'03809':4 '2002':3 '348':1 'l494':2	1366	\N	\N	\N
616	1307	\N	348 L494 2002	\N	03810	0	\N	\N	0	\N	82	a8687b7d-6e59-4a73-a250-0620bfc71da2		1	1	2	\N	2022-02-10 14:33:41	2022-02-10 14:33:41			'03810':4 '2002':3 '348':1 'l494':2	1366	\N	\N	\N
617	1307	\N	348 L494 2002	\N	03811	0	\N	\N	0	\N	82	055af4fa-5ade-4818-8541-348893ff9d38		1	1	2	\N	2022-02-10 14:33:56	2022-02-10 14:33:56			'03811':4 '2002':3 '348':1 'l494':2	1366	\N	\N	\N
618	1307	\N	348 L494 2002	\N	03812	0	\N	\N	0	\N	82	ea4e9c1e-9034-4114-9108-285822abfafb		1	1	2	\N	2022-02-10 14:34:08	2022-02-10 14:34:08			'03812':4 '2002':3 '348':1 'l494':2	1366	\N	\N	\N
619	1308	\N	348 I568	\N	05229	0	\N	\N	0	\N	245	54530355-4698-457a-8937-f0bf6011e6de		1	1	2	\N	2022-02-10 14:38:05	2022-02-10 14:38:05			'05229':3 '348':1 'i568':2	1737	\N	\N	\N
620	1308	\N	348 I568	\N	05230	0	\N	\N	0	\N	245	c5f1724b-9c82-458c-a715-fcaafdacf32f		1	1	2	\N	2022-02-10 14:38:34	2022-02-10 14:38:34			'05230':3 '348':1 'i568':2	1737	\N	\N	\N
621	1309	\N	020 R393R	4ta Edición	05225	0	\N	\N	0	\N	213	dbe03d69-24cf-4f1e-a0d8-78808ce20e17		1	1	2	\N	2022-02-10 15:14:28	2022-02-10 15:14:28			'020':1 '05225':5 '4ta':3 'edicion':4 'r393r':2	1733	\N	\N	\N
622	1310	\N	020 A537P	\N	00180	0	\N	\N	0	\N	245	7abfc0bc-f57a-47d5-9fab-10c9e7fc7c2d		1	1	2	\N	2022-02-10 15:16:43	2022-02-10 15:16:43			'00180':3 '020':1 'a537p':2	24	\N	\N	\N
623	1310	\N	020 A537P	\N	00181	0	\N	\N	0	\N	245	e90cf124-1e6e-4e1e-83c1-3f70d10f7a46		1	1	2	\N	2022-02-10 15:16:59	2022-02-10 15:16:59			'00181':3 '020':1 'a537p':2	24	\N	\N	\N
624	1311	\N	020 R427R	\N	00213	0	\N	\N	0	\N	60	8e83411f-b279-4d92-a058-4531a97c9f43		1	1	2	\N	2022-02-10 15:27:28	2022-02-10 15:27:28			'00213':3 '020':1 'r427r':2	10	\N	\N	\N
625	1311	\N	020 R427R	\N	00214	0	\N	\N	0	\N	60	41bbb8d1-eeec-4de3-8932-7c0eded62e0e		1	1	2	\N	2022-02-10 15:27:38	2022-02-10 15:27:38			'00214':3 '020':1 'r427r':2	10	\N	\N	\N
626	1312	\N	020 R637I	\N	00215	0	\N	\N	0	\N	245	10ac064e-1d39-411b-bb9c-28e12d4995ca		1	1	2	\N	2022-02-10 15:29:52	2022-02-10 15:29:52			'00215':3 '020':1 'r637i':2	11	\N	\N	\N
627	1312	\N	020 R637I	\N	00216	0	\N	\N	0	\N	245	18861746-b592-4392-af1b-998944ac59ec		1	1	2	\N	2022-02-10 18:11:19	2022-02-10 18:11:19			'00216':3 '020':1 'r637i':2	11	\N	\N	\N
628	1313	\N	020 V548G	\N	00218	0	\N	\N	0	\N	245	3f42058d-2eee-4c6d-82f9-1db6afa07eb4		1	1	2	\N	2022-02-10 18:13:55	2022-02-10 18:13:55			'00218':3 '020':1 'v548g':2	29	\N	\N	\N
629	1314	\N	020 W558	\N	00219	0	\N	\N	0	\N	245	b1c718fd-ac0b-4275-b62f-bf7f24dada9f		1	1	2	\N	2022-02-10 18:19:48	2022-02-10 18:19:48			'00219':3 '020':1 'w558':2	30	\N	\N	\N
630	1315	\N	020 W938M	\N	00220	0	\N	\N	0	\N	245	9c3afbe7-14b6-4a2b-8c04-0719f99165d4		1	1	2	\N	2022-02-10 18:23:09	2022-02-10 18:23:09			'00220':3 '020':1 'w938m':2	31	\N	\N	\N
631	1317	\N	020 S847D	\N	02986	0	\N	\N	0	\N	57	fb585691-9ff4-4443-95a2-1c90b1799873		1	1	2	\N	2022-02-10 19:34:50	2022-02-10 19:34:50			'020':1 '02986':3 's847d':2	23	\N	\N	\N
632	1318	\N	025.04 G654S 2007	\N	03951	0	\N	\N	0	\N	213	747d9a68-ff64-4696-95ef-68ef653849ed		1	1	2	\N	2022-02-10 19:37:17	2022-02-10 19:37:17			'025.04':1 '03951':4 '2007':3 'g654s':2	1390	\N	\N	\N
634	1318	\N	025.04 G654S 2007	\N	03952	0	\N	\N	0	\N	213	443dfb4d-b472-4334-99a7-161ded7855a8		1	1	2	\N	2022-02-10 19:37:32	2022-02-10 19:37:32			'025.04':1 '03952':4 '2007':3 'g654s':2	1390	\N	\N	\N
635	1318	\N	025.04 G654S 2007	\N	04335	0	\N	\N	0	\N	213	2c359d74-db68-40b9-aa70-9cb41d64e243		1	1	2	\N	2022-02-10 19:37:42	2022-02-10 19:37:42			'025.04':1 '04335':4 '2007':3 'g654s':2	1390	\N	\N	\N
636	1318	\N	025.04 G654S 2007	\N	04336	0	\N	\N	0	\N	213	cb833653-8ecc-4b37-bd6f-268f29d6d9ec		1	1	2	\N	2022-02-10 19:38:05	2022-02-10 19:38:05			'025.04':1 '04336':4 '2007':3 'g654s':2	1390	\N	\N	\N
637	1318	\N	025.04 G654S 2007	\N	04337	0	\N	\N	0	\N	213	ccb332ba-04c0-455a-977b-9f4a8c29413e		1	1	2	\N	2022-02-10 19:38:18	2022-02-10 19:38:18			'025.04':1 '04337':4 '2007':3 'g654s':2	1390	\N	\N	\N
638	1318	\N	025.04 G654S 2007	\N	04338	0	\N	\N	0	\N	213	1dd6b59f-2437-45f8-ad09-5f3a292ec92b		1	1	2	\N	2022-02-10 19:38:33	2022-02-10 19:38:33			'025.04':1 '04338':4 '2007':3 'g654s':2	1390	\N	\N	\N
639	1318	\N	025.04 G654S 2007	\N	04339	0	\N	\N	0	\N	213	9ae5c7de-8da6-4057-94dc-da0996ad6d4c		1	1	2	\N	2022-02-10 19:38:51	2022-02-10 19:38:51			'025.04':1 '04339':4 '2007':3 'g654s':2	1390	\N	\N	\N
640	1319	\N	352.5 A247A	\N	02690	0	\N	\N	0	\N	60	d6c8650d-d35a-42c7-bfc2-4cc8f23518e0		1	1	2	\N	2022-02-10 23:57:50	2022-02-10 23:57:50			'02690':3 '352.5':1 'a247a':2	263	\N	\N	\N
641	1319	\N	352.5 A247A	\N	02691	0	\N	\N	0	\N	60	3a0e1fef-3864-4124-be2c-e80bb083f729		1	1	2	\N	2022-02-10 23:58:02	2022-02-10 23:58:02			'02691':3 '352.5':1 'a247a':2	263	\N	\N	\N
642	1319	\N	352.5 A247A	\N	02712	0	\N	\N	0	\N	60	08d402a9-3288-49d8-bc89-6f61dc49e457		1	1	2	\N	2022-02-10 23:58:18	2022-02-10 23:58:18			'02712':3 '352.5':1 'a247a':2	263	\N	\N	\N
643	1319	\N	352.5 A247A	\N	02713	0	\N	\N	0	\N	60	bf64fc15-86f4-4d30-9c80-db1d561e25a3		1	1	2	\N	2022-02-10 23:58:30	2022-02-10 23:58:30			'02713':3 '352.5':1 'a247a':2	263	\N	\N	\N
644	1319	\N	352.5 A247A	\N	02714	0	\N	\N	0	\N	60	62fb5283-1993-460e-9bfa-cc270a3e8a16		1	1	2	\N	2022-02-10 23:58:44	2022-02-10 23:58:44			'02714':3 '352.5':1 'a247a':2	263	\N	\N	\N
645	1319	\N	352.5 A247A	\N	02715	0	\N	\N	0	\N	60	d2b4afc0-e4b6-4d2b-949d-79d904516adf		1	1	2	\N	2022-02-10 23:58:54	2022-02-10 23:58:54			'02715':3 '352.5':1 'a247a':2	263	\N	\N	\N
646	1320	\N	361.1 B345P	\N	02716	0	\N	\N	0	\N	245	9c1d298c-14df-4521-8617-9a9f5261778a		1	1	2	\N	2022-02-11 00:00:33	2022-02-11 00:00:40			'02716':3 '361.1':1 'b345p':2	1085	\N	\N	\N
647	1320	\N	\N	\N	02717	0	\N	\N	0	\N	245	242c46e6-06b0-4545-825f-26b9c6ca5f0c		1	1	2	\N	2022-02-11 00:00:53	2022-02-11 00:00:53			'02717':1	1085	\N	\N	\N
648	1321	\N	361.1 P396P 2005	\N	02718	0	\N	\N	0	\N	245	4be144c2-3650-4192-8b9a-e30dd327b9e1		1	1	2	\N	2022-02-11 00:02:56	2022-02-11 00:02:56			'02718':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
649	1321	\N	361.1 P396P 2005	\N	02719	0	\N	\N	0	\N	245	de3284c6-aef8-4ed1-ad1a-a8fb74b652f9		1	1	2	\N	2022-02-11 00:03:08	2022-02-11 00:03:08			'02719':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
650	1321	\N	361.1 P396P 2005	\N	02720	0	\N	\N	0	\N	245	92bafe47-eb8c-464d-b564-c7d838a13433		1	1	2	\N	2022-02-11 00:03:18	2022-02-11 00:03:18			'02720':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
651	1321	\N	361.1 P396P 2005	\N	02721	0	\N	\N	0	\N	245	618ce406-f616-46c8-b7bf-1511c3fe88c3		1	1	2	\N	2022-02-11 00:03:39	2022-02-11 00:03:39			'02721':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
652	1321	\N	361.1 P396P 2005	\N	02722	0	\N	\N	0	\N	245	2921a0b9-c65a-4218-9b33-4b07eb34a910		1	1	2	\N	2022-02-11 00:03:48	2022-02-11 00:03:48			'02722':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
653	1321	\N	361.1 P396P 2005	\N	02723	0	\N	\N	0	\N	245	de3f3785-d9c0-4602-bcb3-17c96589ebf6		1	1	2	\N	2022-02-11 00:03:56	2022-02-11 00:03:56			'02723':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
654	1321	\N	361.1 P396P 2005	\N	02724	0	\N	\N	0	\N	245	63ea1745-6af6-4a6c-bec9-3ef1f0f6ef4a		1	1	2	\N	2022-02-11 00:04:09	2022-02-11 00:04:09			'02724':4 '2005':3 '361.1':1 'p396p':2	1078	\N	\N	\N
655	1322	\N	362.5 L488A	\N	02725	0	\N	\N	0	\N	245	15fea767-3a9d-411d-96ac-521476710735		1	1	2	\N	2022-02-11 00:06:22	2022-02-11 00:06:22			'02725':3 '362.5':1 'l488a':2	275	\N	\N	\N
656	1323	\N	363.73 C478C	\N	02726	0	\N	\N	0	\N	245	4a59df82-c768-436b-a432-8916296f229a		1	1	2	\N	2022-02-11 00:08:02	2022-02-11 00:08:02			'02726':3 '363.73':1 'c478c':2	1378	\N	\N	\N
657	1323	\N	363.73 C478C	\N	03895	0	\N	\N	0	\N	245	9f8e17f6-106b-45e2-8156-c9461a3db64f		1	1	2	\N	2022-02-11 00:08:12	2022-02-11 00:08:12			'03895':3 '363.73':1 'c478c':2	1378	\N	\N	\N
658	1323	\N	363.73 C478C	\N	03896	0	\N	\N	0	\N	245	2627efe0-435f-4d57-b99e-4cf44f519693		1	1	2	\N	2022-02-11 00:08:26	2022-02-11 00:08:26			'03896':3 '363.73':1 'c478c':2	1378	\N	\N	\N
659	1323	\N	363.73 C478C	\N	03897	0	\N	\N	0	\N	245	b8d2ed03-b16d-4e64-8c46-c259cf01e953		1	1	2	\N	2022-02-11 00:08:35	2022-02-11 00:08:35			'03897':3 '363.73':1 'c478c':2	1378	\N	\N	\N
660	1323	\N	363.73 C478C	\N	03898	0	\N	\N	0	\N	245	8ec37563-3812-4669-9520-cb177c74572e		1	1	2	\N	2022-02-11 00:08:46	2022-02-11 00:08:46			'03898':3 '363.73':1 'c478c':2	1378	\N	\N	\N
661	1324	\N	363.11 N675	\N	04394	0	\N	\N	0	\N	245	d0878f6c-5c1d-4929-a31c-dc59ad496c1b		1	1	2	\N	2022-02-11 00:10:29	2022-02-11 00:10:29			'04394':3 '363.11':1 'n675':2	891	\N	\N	\N
662	1324	\N	363.11 N675	\N	04395	0	\N	\N	0	\N	245	89e75415-e46a-4602-b758-20bc5a955652		1	1	2	\N	2022-02-11 00:10:39	2022-02-11 00:10:39			'04395':3 '363.11':1 'n675':2	891	\N	\N	\N
663	1325	\N	363.11 A833S	\N	05015	0	\N	\N	0	\N	245	62229374-932d-42aa-986e-136f70bb2c27		1	1	2	\N	2022-02-11 00:12:24	2022-02-11 00:12:24			'05015':3 '363.11':1 'a833s':2	1646	\N	\N	\N
664	1325	\N	363.11 A833S	\N	05016	0	\N	\N	0	\N	245	010dabdd-ab84-42bd-ab13-4fe0b21a64b6		1	1	2	\N	2022-02-11 00:12:37	2022-02-11 00:12:37			'05016':3 '363.11':1 'a833s':2	1646	\N	\N	\N
665	1325	\N	363.11 A833S	\N	05017	0	\N	\N	0	\N	245	9f709561-01b6-4ec0-af6c-4a6d2302fab1		1	1	2	\N	2022-02-11 00:12:46	2022-02-11 00:12:46			'05017':3 '363.11':1 'a833s':2	363.11 A833S	\N	\N	\N
666	1326	\N	363.96 C656	\N	05240	0	\N	\N	0	\N	245	1c5ccff1-4417-43d7-a51f-79dbf690aea0		1	1	2	\N	2022-02-11 00:14:06	2022-02-11 00:14:06			'05240':3 '363.96':1 'c656':2	1744	\N	\N	\N
667	1327	\N	364 C715	\N	04965	0	\N	\N	0	\N	245	b719b8ad-51e8-4e7a-9a47-97864635d840		1	1	2	\N	2022-02-11 00:15:49	2022-02-11 00:15:49			'04965':3 '364':1 'c715':2	1631	\N	\N	\N
668	1327	\N	364 C715	\N	04966	0	\N	\N	0	\N	245	6c2549cc-a0a5-49ba-9128-15b9166f0b57		1	1	2	\N	2022-02-11 00:16:05	2022-02-11 00:16:05			'04966':3 '364':1 'c715':2	1631	\N	\N	\N
669	1327	\N	364 C715	\N	04967	0	\N	\N	0	\N	245	401d165e-e60c-4fad-880a-f3e467f03040		1	1	2	\N	2022-02-11 00:16:20	2022-02-11 00:16:20			'04967':3 '364':1 'c715':2	1631	\N	\N	\N
670	1327	\N	364 C715	\N	04968	0	\N	\N	0	\N	245	1642aaa7-2131-495b-a5b0-188d903f4b3c		1	1	2	\N	2022-02-11 00:16:32	2022-02-11 00:16:32			'04968':3 '364':1 'c715':2	1631	\N	\N	\N
671	1328	\N	364. C755	\N	04969	0	\N	\N	0	\N	245	97c3d5d9-b391-4004-ada2-0d23be32e492		1	1	2	\N	2022-02-11 00:20:20	2022-02-11 00:20:20			'04969':3 '364':1 'c755':2	1632	\N	\N	\N
672	1328	\N	364. C755	\N	04970	0	\N	\N	0	\N	245	53cd54c5-ef0a-47a0-bd0e-a930a7d72dea		1	1	2	\N	2022-02-11 00:20:30	2022-02-11 00:20:30			'04970':3 '364':1 'c755':2	1632	\N	\N	\N
673	1328	\N	364. C755	\N	04971	0	\N	\N	0	\N	245	f89aaa8c-5173-4f0d-8e03-29d648b35b38		1	1	2	\N	2022-02-11 00:20:38	2022-02-11 00:20:38			'04971':3 '364':1 'c755':2	1632	\N	\N	\N
674	1328	\N	364. C755	\N	04972	0	\N	\N	0	\N	245	3a365ffc-28b6-49a4-944e-05570b7ea5d7		1	1	2	\N	2022-02-11 00:20:48	2022-02-11 00:20:48			'04972':3 '364':1 'c755':2	1632	\N	\N	\N
675	1329	\N	030 E525	\N	05093	0	\N	\N	0	\N	245	05d36325-fa8d-4694-9c3f-c1ef804e1f5e		1	1	2	\N	2022-02-11 13:34:02	2022-02-11 13:34:02			'030':1 '05093':3 'e525':2	1673	\N	\N	\N
682	1332	\N	030 A886 V1	\N	04400	0	\N	\N	0	\N	106	c1c7342f-aa74-4edc-838b-e3aca32476cf		1	1	2	\N	2022-02-11 13:47:09	2022-02-11 13:48:05			'030':1 '04400':4 'a886':2 'v1':3	1327	\N	\N	\N
681	1332	\N	030 A886 V1	\N	04401	0	\N	\N	0	\N	106	12d14578-f6e8-4be3-9a08-3af0099c1d61		1	1	2	\N	2022-02-11 13:47:09	2022-02-11 13:48:26			'030':1 '04401':4 'a886':2 'v1':3	1327	\N	\N	\N
680	1332	\N	030 A886 V1	\N	04402	0	\N	\N	0	\N	106	7e71ea9a-88f2-44f2-a513-00c2aab52c53		1	1	2	\N	2022-02-11 13:47:09	2022-02-11 13:48:42			'030':1 '04402':4 'a886':2 'v1':3	1327	\N	\N	\N
683	1333	\N	030 E525	\N	00264	0	\N	\N	0	\N	245	703f2875-3931-4b1a-93ff-4d88e3920267		1	1	2	\N	2022-02-11 13:53:32	2022-02-11 13:53:32			'00264':3 '030':1 'e525':2	1140	\N	\N	\N
684	1333	\N	030 E525	\N	00265	0	\N	\N	0	\N	245	5fae837a-d937-496f-96be-a9c477db61f9		1	1	2	\N	2022-02-11 13:54:14	2022-02-11 13:54:14			'00265':3 '030':1 'e525':2	1140	\N	\N	\N
685	1333	\N	030 E525	\N	00266	0	\N	\N	0	\N	245	012c79ef-90ff-480b-9252-99e51935c392		1	1	2	\N	2022-02-11 13:55:05	2022-02-11 13:55:05			'00266':3 '030':1 'e525':2	1140	\N	\N	\N
686	1333	\N	030 E525	\N	00267	0	\N	\N	0	\N	245	66373486-34ac-4c8c-af1e-98e127655fc1		1	1	2	\N	2022-02-11 13:55:25	2022-02-11 13:55:25			'00267':3 '030':1 'e525':2	1140	\N	\N	\N
687	1333	\N	030 E525	\N	00268	0	\N	\N	0	\N	245	da9f5ced-2808-41b9-a289-2ab4dc98522a		1	1	2	\N	2022-02-11 13:56:00	2022-02-11 13:56:00			'00268':3 '030':1 'e525':2	1140	\N	\N	\N
688	1333	\N	030 E525	\N	00269	0	\N	\N	0	\N	245	2a079e82-feab-4264-84e7-a3ff75864268		1	1	2	\N	2022-02-11 13:56:42	2022-02-11 13:56:42			'00269':3 '030':1 'e525':2	1140	\N	\N	\N
689	1333	\N	030 E525	\N	00270	0	\N	\N	0	\N	245	1171951f-6e70-4368-b59b-e6cf16d256db		1	1	2	\N	2022-02-11 13:57:04	2022-02-11 13:57:04			'00270':3 '030':1 'e525':2	1140	\N	\N	\N
690	1333	\N	030 E525	\N	00271	0	\N	\N	0	\N	245	5b81a952-c7ac-4600-b0f8-d5890771bebe		1	1	2	\N	2022-02-11 13:57:36	2022-02-11 13:57:36			'00271':3 '030':1 'e525':2	1140	\N	\N	\N
695	1334	\N	030 T453	\N	00256	0	\N	\N	0	\N	245	d9a8fee0-0a29-421e-b604-4e724e083189		1	1	2	\N	2022-02-11 14:04:57	2022-02-11 14:04:57			'00256':3 '030':1 't453':2	1144	\N	\N	\N
696	1334	\N	030 T453	\N	00257	0	\N	\N	0	\N	245	f4a2ac88-84e6-4ebe-8dd3-61b522c02e9c		1	1	2	\N	2022-02-11 14:05:11	2022-02-11 14:05:11			'00257':3 '030':1 't453':2	1144	\N	\N	\N
698	1334	\N	030 T453	\N	00258	0	\N	\N	0	\N	245	0f151fb0-cf74-4454-a1ae-4bb48b9dc5ed		1	1	2	\N	2022-02-11 14:05:35	2022-02-11 14:05:35			'00258':3 '030':1 't453':2	1144	\N	\N	\N
699	1334	\N	030 T453	\N	00259	0	\N	\N	0	\N	245	165ec783-097c-4848-a6b8-a4f40b42ccbc		1	1	2	\N	2022-02-11 14:06:01	2022-02-11 14:06:01			'00259':3 '030':1 't453':2	1144	\N	\N	\N
701	1334	\N	030 T453	\N	00260	0	\N	\N	0	\N	245	3c47dde5-3227-4064-bb83-1235335fd2a1		1	1	2	\N	2022-02-11 14:06:28	2022-02-11 14:06:28			'00260':3 '030':1 't453':2	1144	\N	\N	\N
702	1334	\N	030 T453	\N	00261	0	\N	\N	0	\N	245	b97b0543-c8d9-422b-a6e1-19378c16652f		1	1	2	\N	2022-02-11 14:06:44	2022-02-11 14:06:44			'00261':3 '030':1 't453':2	1144	\N	\N	\N
703	1334	\N	030 T453	\N	00262	0	\N	\N	0	\N	245	7386fa50-49b3-4cf4-b3b2-6e18906262ff		1	1	2	\N	2022-02-11 14:07:05	2022-02-11 14:07:05			'00262':3 '030':1 't453':2	1144	\N	\N	\N
705	1334	\N	030 T453	\N	00263	0	\N	\N	0	\N	245	2eea7bae-62c0-4952-9172-3ca6a5549cce		1	1	2	\N	2022-02-11 14:07:27	2022-02-11 14:07:27			'00263':3 '030':1 't453':2	1144	\N	\N	\N
707	1334	\N	030 T453	\N	004250	0	\N	\N	0	\N	245	167951c6-bee1-404a-9720-cd2eb6e47e37		1	1	2	\N	2022-02-11 14:07:54	2022-02-11 14:07:54			'004250':3 '030':1 't453':2	1144	\N	\N	\N
708	1335	\N	030 O936	\N	00255	0	\N	\N	0	\N	64	7d456934-f97b-4bea-982e-fb29acd1ac13		1	1	2	\N	2022-02-11 14:11:21	2022-02-11 14:11:21			'00255':3 '030':1 'o936':2	1142	\N	\N	\N
709	1336	\N	030 D522	\N	00221	0	\N	\N	0	\N	245	fa2b8bdf-f3a8-481e-bf2b-3fcb3b989631		1	1	2	\N	2022-02-11 14:26:57	2022-02-11 14:26:57			'00221':3 '030':1 'd522':2	34	\N	\N	\N
710	1336	\N	030 D522	\N	00222	0	\N	\N	0	\N	245	f4a8199e-1181-4495-b98a-48ce9e8c4e2f		1	1	2	\N	2022-02-11 14:27:10	2022-02-11 14:27:10			'00222':3 '030':1 'd522':2	34	\N	\N	\N
711	1336	\N	030 D522	\N	00223	0	\N	\N	0	\N	245	2869dc0f-1343-4b17-b19a-caa048a84ed3		1	1	2	\N	2022-02-11 14:27:20	2022-02-11 14:27:20			'00223':3 '030':1 'd522':2	34	\N	\N	\N
712	1336	\N	34030 D522	\N	00224	0	\N	\N	0	\N	245	03ac27e3-8eeb-4efd-9c0b-badb87da7fae		1	1	2	\N	2022-02-11 14:27:37	2022-02-11 14:27:37			'00224':3 '34030':1 'd522':2	34	\N	\N	\N
713	1336	\N	030 D522	\N	00225	0	\N	\N	0	\N	245	185cb8e5-ca3e-4ffa-bae6-a6fe50d56fe6		1	1	2	\N	2022-02-11 14:27:49	2022-02-11 14:27:49			'00225':3 '030':1 'd522':2	34	\N	\N	\N
714	1336	\N	030 D522	\N	00226	0	\N	\N	0	\N	245	c64e0283-16e4-4e2c-9f59-64fd9bf5accd		1	1	2	\N	2022-02-11 14:28:01	2022-02-11 14:28:01			'00226':3 '030':1 'd522':2	34	\N	\N	\N
715	1336	\N	030 D522	\N	00227	0	\N	\N	0	\N	245	891a5c5e-f6da-479a-9c29-c1300652bf7e		1	1	2	\N	2022-02-11 14:28:12	2022-02-11 14:28:12			'00227':3 '030':1 'd522':2	34	\N	\N	\N
716	1336	\N	030 D522	\N	00228	0	\N	\N	0	\N	245	7efd970b-12cf-4da3-9ae0-432706bcd979		1	1	2	\N	2022-02-11 14:28:23	2022-02-11 14:28:23			'00228':3 '030':1 'd522':2	34	\N	\N	\N
717	1336	\N	030 D522	\N	00229	0	\N	\N	0	\N	245	1c93f559-8a5a-42a0-a5d4-fd66b5d42140		1	1	2	\N	2022-02-11 14:28:33	2022-02-11 14:28:33			'00229':3 '030':1 'd522':2	34	\N	\N	\N
718	1336	\N	030 D522	\N	00230	0	\N	\N	0	\N	245	cf167e8a-1853-484f-8039-2d4e6d9d7982		1	1	2	\N	2022-02-11 14:28:58	2022-02-11 14:28:58			'00230':3 '030':1 'd522':2	34	\N	\N	\N
719	1337	\N	020 M527	\N	00196	0	\N	\N	0	\N	245	145948f4-375d-4ccc-b054-5f37b4afc13f		1	1	2	\N	2022-02-11 14:36:27	2022-02-11 14:36:27			'00196':3 '020':1 'm527':2	27	\N	\N	\N
720	1338	\N	020 K588E	\N	00193	0	\N	\N	0	\N	251	8dd6e4c6-defa-4f06-b76a-81af7b7ba583		1	1	2	\N	2022-02-11 14:42:22	2022-02-11 14:42:22			'00193':3 '020':1 'k588e':2	22	\N	\N	\N
721	1338	\N	020 K588E	\N	00194	0	\N	\N	0	\N	251	37b90e73-0be7-4031-a2b9-9e338964d19a		1	1	2	\N	2022-02-11 14:42:39	2022-02-11 14:42:39			'00194':3 '020':1 'k588e':2	22	\N	\N	\N
722	1339	\N	020 C458 1996	\N	00184	0	\N	\N	0	\N	245	20dff85f-5801-4378-8cfa-d5fb1144aa3d		1	1	2	\N	2022-02-11 15:05:41	2022-02-11 15:05:41			'00184':4 '020':1 '1996':3 'c458':2	9	\N	\N	\N
723	1340	\N	370 U558	\N	04248	0	\N	\N	0	\N	245	454a9a65-26cc-4f8b-b354-f32e68f4763c		1	1	2	\N	2022-02-11 15:50:43	2022-02-11 15:50:43			'04248':3 '370':1 'u558':2	1458	\N	\N	\N
724	1341	\N	370 E382	\N	04246	0	\N	\N	0	\N	245	e0b89402-c63b-4e51-a932-366feb06d517		1	1	2	\N	2022-02-11 16:04:37	2022-02-11 16:04:37			'04246':3 '370':1 'e382':2	1457	\N	\N	\N
725	1341	\N	370 E382	\N	04247	0	\N	\N	0	\N	245	539775d4-ae89-45f2-b45b-a7d651ed5ed8		1	1	2	\N	2022-02-11 16:04:50	2022-02-11 16:04:50			'04247':3 '370':1 'e382':2	1457	\N	\N	\N
726	1343	\N	370.19 U558 J675	\N	02735	0	\N	\N	0	\N	179	ad8ffb64-4fd6-4607-aa9e-20b1224bfba1		1	1	2	\N	2022-02-11 16:07:16	2022-02-11 16:07:16			'02735':4 '370.19':1 'j675':3 'u558':2	154	\N	\N	\N
727	1344	\N	370.1 H475F	\N	02731	0	\N	\N	0	\N	245	243a5cc3-c1b4-444c-bcf5-ee4739a74e87		1	1	2	\N	2022-02-11 16:09:13	2022-02-11 16:09:13			'02731':3 '370.1':1 'h475f':2	300	\N	\N	\N
728	1344	\N	370.1 H475F	\N	02732	0	\N	\N	0	\N	245	dbbbff9b-abef-4d4b-be5b-b15aebedf7b6		1	1	2	\N	2022-02-12 00:52:10	2022-02-12 00:52:10			'02732':3 '370.1':1 'h475f':2	300	\N	\N	\N
729	1344	\N	370.1 H475F	\N	02733	0	\N	\N	0	\N	245	8f05daf1-e97b-4e3e-821b-5ff977fc3ffe		1	1	2	\N	2022-02-12 00:52:19	2022-02-12 00:52:19			'02733':3 '370.1':1 'h475f':2	300	\N	\N	\N
730	1344	\N	370.1 H475F	\N	02734	0	\N	\N	0	\N	245	d6383023-f614-4e23-9f1b-79ae179cb46a		1	1	2	\N	2022-02-12 00:52:28	2022-02-12 00:52:28			'02734':3 '370.1':1 'h475f':2	300	\N	\N	\N
731	1346	\N	370.1 C524C	\N	02730	0	\N	\N	0	\N	245	e8515a1d-f66b-4fc5-9616-12c88cd77ec6		1	1	2	\N	2022-02-12 00:54:09	2022-02-12 00:54:09			'02730':3 '370.1':1 'c524c':2	299	\N	\N	\N
732	1346	\N	370.1 C524C	\N	02729	0	\N	\N	0	\N	245	319a44b4-ccdd-4f68-9dd6-b988c986ac6c		1	1	2	\N	2022-02-12 00:54:21	2022-02-12 00:54:21			'02729':3 '370.1':1 'c524c':2	299	\N	\N	\N
733	1347	\N	370 E382	\N	02727	0	\N	\N	0	\N	245	099bb725-d9e0-40e2-a34f-e4d857e73618		1	1	2	\N	2022-02-12 00:55:48	2022-02-12 00:55:48			'02727':3 '370':1 'e382':2	305	\N	\N	\N
734	1348	\N	128 F745A	\N	05245	0	\N	\N	0	\N	245	6ef65f09-64d3-4c05-a707-f4f8236c0bea		1	1	2	\N	2022-02-15 15:35:06	2022-02-15 15:35:06			'05245':3 '128':1 'f745a':2	1749	\N	\N	\N
735	1349	\N	158 P474R	\N	05251	0	\N	\N	0	\N	245	ceb1bb05-c9b4-4614-9a31-9628a5e3e75a		1	1	2	\N	2022-02-15 15:37:45	2022-02-15 15:37:45			'05251':3 '158':1 'p474r':2	1755	\N	\N	\N
736	1350	\N	055.1 G688P 2005	\N	00272	0	\N	\N	0	\N	245	e7874506-bf74-49b6-91cd-43f2c4e5bd6d		1	1	2	\N	2022-02-15 15:42:20	2022-02-15 15:42:20			'00272':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
737	1350	\N	055.1 G688P 2005	\N	00273	0	\N	\N	0	\N	245	d2bc3367-f4af-49be-81a6-c58ad3e7dca7		1	1	2	\N	2022-02-15 15:42:33	2022-02-15 15:42:33			'00273':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
738	1350	\N	055.1 G688P 2005	\N	00274	0	\N	\N	0	\N	245	2f8d83e8-9fb1-4d43-bfbc-a1345b887463		1	1	2	\N	2022-02-15 15:42:46	2022-02-15 15:42:46			'00274':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
739	1350	\N	055.1 G688P 2005	\N	00275	0	\N	\N	0	\N	245	bbcd2e35-2d5e-446d-9582-0ebd55c8c2ab		1	1	2	\N	2022-02-15 15:42:57	2022-02-15 15:42:57			'00275':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
740	1350	\N	055.1 G688P 2005	\N	00276	0	\N	\N	0	\N	245	b8e7fc23-6081-400d-9e84-618695fd5219		1	1	2	\N	2022-02-15 15:43:09	2022-02-15 15:43:09			'00276':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
741	1350	\N	055.1 G688P 2005	\N	00277	0	\N	\N	0	\N	245	e1d3882e-0a6b-4219-81a7-41fb80653dc1		1	1	2	\N	2022-02-15 15:43:35	2022-02-15 15:43:35			'00277':4 '055.1':1 '2005':3 'g688p':2	055.1 G688P 2005	\N	\N	\N
742	1350	\N	055.1 G688P 2005	\N	00278	0	\N	\N	0	\N	245	2818c1dd-b4f3-4f88-a50a-868181ad10c5		1	1	2	\N	2022-02-15 15:43:47	2022-02-15 15:43:47			'00278':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
743	1350	\N	055.1 G688P 2005	\N	00279	0	\N	\N	0	\N	245	3114a9a7-ff82-49f0-985d-8fbb9600456d		1	1	2	\N	2022-02-15 15:44:00	2022-02-15 15:44:00			'00279':4 '055.1':1 '2005':3 'g688p':2	1065	\N	\N	\N
744	1351	\N	158 V353C	\N	05250	0	\N	\N	0	\N	245	31a15d93-f359-4459-b929-7a8dcdb14323		1	1	2	\N	2022-02-15 15:50:22	2022-02-15 15:50:22			'05250':3 '158':1 'v353c':2	1754	\N	\N	\N
745	1352	\N	158 C678V	\N	05249	0	\N	\N	0	\N	245	741197ef-7765-4506-9f76-6882d56ca2b2		1	1	2	\N	2022-02-15 19:04:43	2022-02-15 19:04:43			'05249':3 '158':1 'c678v':2	1753	\N	\N	\N
746	1353	\N	155.935 D887E	\N	05337	0	\N	\N	0	\N	60	8ed2ef8b-1479-4562-aeca-11c9d1b5eb38		1	1	2	\N	2022-02-15 19:06:28	2022-02-15 19:06:28			'05337':3 '155.935':1 'd887e':2	1795	\N	\N	\N
747	1353	\N	155.935 D887E	\N	05338	0	\N	\N	0	\N	60	77e7440f-5c03-4a38-9fee-965273101bcc		1	1	2	\N	2022-02-15 19:06:39	2022-02-15 19:06:39			'05338':3 '155.935':1 'd887e':2	1795	\N	\N	\N
748	1354	\N	060 M456	\N	04548	0	\N	\N	0	\N	179	f04e25f5-0630-49a9-9347-aaeceae5bdb1		1	1	2	\N	2022-02-15 19:09:07	2022-02-15 19:09:07			'04548':3 '060':1 'm456':2	1311	\N	\N	\N
749	1354	\N	060 M456	\N	04549	0	\N	\N	0	\N	179	c544f075-f6f8-4662-a503-4646aeccb1d5		1	1	2	\N	2022-02-15 19:09:19	2022-02-15 19:09:19			'04549':3 '060':1 'm456':2	1311	\N	\N	\N
750	1355	\N	060 E524	\N	04244	0	\N	\N	0	\N	179	ba3d70b8-dfef-4573-89c3-ef02b7d673e1		1	1	2	\N	2022-02-15 19:12:42	2022-02-15 19:12:42			'04244':3 '060':1 'e524':2	1456	\N	\N	\N
751	1355	\N	060 E524	\N	04245	0	\N	\N	0	\N	179	a1198e2e-5f5c-4a5f-91ca-1afcea083e68		1	1	2	\N	2022-02-15 19:12:58	2022-02-15 19:12:58			'04245':3 '060':1 'e524':2	1456	\N	\N	\N
752	1356	\N	060 U558	\N	04234	0	\N	\N	0	\N	179	ed0b8592-a780-4eeb-bf0d-8bf738d642b4		1	1	2	\N	2022-02-15 19:16:41	2022-02-15 19:16:41			'04234':3 '060':1 'u558':2	1449	\N	\N	\N
754	1356	\N	060 U558	\N	04235	0	\N	\N	0	\N	179	0d938daf-bbe9-4ac0-9d81-7b6998ddf4fe		1	1	2	\N	2022-02-15 19:16:57	2022-02-15 19:16:57			'04235':3 '060':1 'u558':2	1449	\N	\N	\N
755	1357	\N	060 M456	\N	00282	0	\N	\N	0	\N	179	21a14da4-4be5-424d-98d8-d7117cafd90d		1	1	2	\N	2022-02-15 19:19:06	2022-02-15 19:19:06			'00282':3 '060':1 'm456':2	414	\N	\N	\N
756	1357	\N	060 M456	\N	00283	0	\N	\N	0	\N	179	c973360d-cb1c-4c51-802a-e5c93d47e72a		1	1	2	\N	2022-02-15 19:19:21	2022-02-15 19:19:21			'00283':3 '060':1 'm456':2	414	\N	\N	\N
757	1358	\N	060 T472 VOL. 1	\N	00284	0	\N	\N	0	\N	179	8d38f1d4-4273-4334-827d-fbacbe2e089c		1	1	2	\N	2022-02-15 19:21:23	2022-02-15 19:21:23			'00284':5 '060':1 '1':4 't472':2 'vol':3	128	\N	\N	\N
758	1358	\N	060 T472 VOL. 1	\N	00285	0	\N	\N	0	\N	179	67635b27-b3b7-4bb4-ba91-31efd3e92c4e		1	1	2	\N	2022-02-15 19:21:33	2022-02-15 19:21:33			'00285':5 '060':1 '1':4 't472':2 'vol':3	128	\N	\N	\N
759	1359	\N	069 D539M	\N	00288	0	\N	\N	0	\N	245	fedf31f2-05a1-4b4b-a953-60143327d1af		1	1	2	\N	2022-02-15 19:25:16	2022-02-15 19:25:16			'00288':3 '069':1 'd539m':2	125	\N	\N	\N
760	1360	\N	069 G853E	\N	00289	0	\N	\N	0	\N	245	790ebd42-68af-4933-ad0a-c72631439ba2		1	1	2	\N	2022-02-15 20:39:28	2022-02-15 20:39:28			'00289':3 '069':1 'g853e':2	121	\N	\N	\N
761	1361	\N	339 P374M 2001	\N	02422	0	\N	\N	0	\N	245	d7c97b78-ad8d-4ca0-9af9-93a22e7f1cae		1	1	2	\N	2022-02-15 20:43:41	2022-02-15 20:43:41			'02422':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
762	1361	\N	339 P374M 2001	\N	02423	0	\N	\N	0	\N	245	a08beb08-9165-4f3b-8ca2-4ebf0e5e5e9e		1	1	2	\N	2022-02-15 20:43:52	2022-02-15 20:43:52			'02423':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
763	1361	\N	339 P374M 2001	\N	02424	0	\N	\N	0	\N	245	82d0888f-31e9-407a-8928-cae72610b990		1	1	2	\N	2022-02-15 20:44:32	2022-02-15 20:44:32			'02424':4 '2001':3 '339':1 'p374m':2	2291	\N	\N	\N
764	1361	\N	\N	\N	02425	0	\N	\N	0	\N	245	9d60097f-f662-48fd-b988-06bfdefeb11d		1	1	2	\N	2022-02-15 20:44:56	2022-02-15 20:44:56			'02425':1	291	\N	\N	\N
765	1361	\N	339 P374M 2001	\N	02426	0	\N	\N	0	\N	245	88b51145-2b7e-447b-8df4-779f055d7153		1	1	2	\N	2022-02-15 20:45:21	2022-02-15 20:45:21			'02426':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
766	1361	\N	339 P374M 2001	\N	02427	0	\N	\N	0	\N	245	a1076ea6-3370-4f02-b580-f80a420b4891		1	1	2	\N	2022-02-15 20:45:36	2022-02-15 20:45:36			'02427':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
767	1361	\N	339 P374M 2001	\N	02428	0	\N	\N	0	\N	245	eb156886-09a2-4c9d-b01c-0454b2decaf4		1	1	2	\N	2022-02-15 20:45:48	2022-02-15 20:45:48			'02428':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
768	1361	\N	339 P374M 2001	\N	02429	0	\N	\N	0	\N	245	d5868e40-47c8-47d2-b928-412e7fe1953f		1	1	2	\N	2022-02-15 20:45:59	2022-02-15 20:45:59			'02429':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
769	1361	\N	339 P374M 2001	\N	02430	0	\N	\N	0	\N	245	6251748b-222c-4e94-b7c9-1e97431a40f3		1	1	2	\N	2022-02-15 20:46:10	2022-02-15 20:46:10			'02430':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
770	1361	\N	339 P374M 2001	\N	02490	0	\N	\N	0	\N	245	c59d4722-c168-416a-965b-8985987545c8		1	1	2	\N	2022-02-15 20:46:28	2022-02-15 20:46:28			'02490':4 '2001':3 '339':1 'p374m':2	291	\N	\N	\N
771	1362	\N	069 M667G	\N	00292	0	\N	\N	0	\N	245	a4d37290-a19e-40a3-8e1e-4c6142b976b2		1	1	2	\N	2022-02-15 20:58:21	2022-02-15 20:58:21			'00292':3 '069':1 'm667g':2	118	\N	\N	\N
772	1363	\N	069.0683 K685E	\N	00293	0	\N	\N	0	\N	245	59e28309-0e10-4bbc-85d8-8aab3bd871d1		1	1	2	\N	2022-02-16 13:30:36	2022-02-16 13:30:36			'00293':3 '069.0683':1 'k685e':2	127	\N	\N	\N
773	1364	\N	069.09 P474E	\N	00295	0	\N	\N	0	\N	245	e1f6be18-833d-4437-b862-b438f8b80e77		1	1	2	\N	2022-02-16 13:33:03	2022-02-16 13:33:03			'00295':3 '069.09':1 'p474e':2	126	\N	\N	\N
774	1365	\N	069.22 B452O	\N	00296	0	\N	\N	0	\N	245	debec7fa-e017-407c-a537-558a3420c006		1	1	2	\N	2022-02-16 13:34:26	2022-02-16 13:34:26			'00296':3 '069.22':1 'b452o':2	123	\N	\N	\N
775	1366	\N	100 D534D	\N	00301	0	\N	\N	0	\N	245	4158c444-9bf8-4501-9b8a-a7be6ce33cb7		1	1	2	\N	2022-02-16 13:39:35	2022-02-16 13:39:35			'00301':3 '100':1 'd534d':2	39	\N	\N	\N
776	1367	\N	100 M378I	\N	00303	0	\N	\N	0	\N	245	394dc9ac-370c-4c51-8c2a-a6827c43ab92		1	1	2	\N	2022-02-16 13:40:59	2022-02-16 13:40:59			'00303':3 '100':1 'm378i':2	44	\N	\N	\N
777	1368	\N	111 N526L	\N	00309	0	\N	\N	0	\N	245	ea970329-fd78-4e1f-a5b6-a295ddb96238		1	1	2	\N	2022-02-16 13:42:24	2022-02-16 13:42:24			'00309':3 '111':1 'n526l':2	38	\N	\N	\N
778	1368	\N	111 N526L	\N	00310	0	\N	\N	0	\N	245	4bd912d9-67ef-4eba-a8b3-d326b5bfd8de		1	1	2	\N	2022-02-16 13:42:37	2022-02-16 13:42:37			'00310':3 '111':1 'n526l':2	38	\N	\N	\N
779	1369	\N	121 H488T	\N	00315	0	\N	\N	0	\N	178	9cc21c04-e6d5-41e3-95a0-918c33cbd070		1	1	2	\N	2022-02-16 13:44:56	2022-02-16 13:44:56			'00315':3 '121':1 'h488t':2	49	\N	\N	\N
780	1370	\N	121 T677S	\N	\N	0	\N	\N	0	\N	245	8b148811-c18e-4654-a654-d40f15cd706d		1	1	2	\N	2022-02-16 13:46:13	2022-02-16 13:46:13			'121':1 't677s':2	50	\N	\N	\N
781	1370	\N	121 T677S	\N	00317	0	\N	\N	0	\N	245	9ef74bd3-7097-48d7-8e71-356bff0a0228		1	1	2	\N	2022-02-16 13:46:28	2022-02-16 13:46:28			'00317':3 '121':1 't677s':2	50	\N	\N	\N
782	1371	\N	121.686 H475	\N	00318	0	\N	\N	0	\N	245	e2413863-db56-4d2d-a529-5211d42eb47f		1	1	2	\N	2022-02-16 13:48:12	2022-02-16 13:48:12			'00318':3 '121.686':1 'h475':2	47	\N	\N	\N
783	1371	\N	121.686 H475	\N	00319	0	\N	\N	0	\N	245	2a124747-f82d-44c5-ab67-b931203f3bf7		1	1	2	\N	2022-02-16 13:48:23	2022-02-16 13:48:23			'00319':3 '121.686':1 'h475':2	47	\N	\N	\N
784	1372	\N	121.686 P478	\N	00320	0	\N	\N	0	\N	245	bcd56a26-b551-46db-9ffc-74d4988a9177		1	1	2	\N	2022-02-16 13:50:06	2022-02-16 13:50:06			'00320':3 '121.686':1 'p478':2	48	\N	\N	\N
785	1372	\N	121.686 P478	\N	00321	0	\N	\N	0	\N	245	b4b23669-0439-4233-ac11-a32289ccd4c3		1	1	2	\N	2022-02-16 13:50:19	2022-02-16 13:50:19			'00321':3 '121.686':1 'p478':2	48	\N	\N	\N
786	1373	\N	128 B482T	\N	00322	0	\N	\N	0	\N	179	3b030e32-dc22-4f62-97b2-1a27da67670a		1	1	2	\N	2022-02-16 13:52:16	2022-02-16 13:52:16			'00322':3 '128':1 'b482t':2	53	\N	\N	\N
787	1373	\N	128 B482T	\N	00323	0	\N	\N	0	\N	179	f9616e1c-7828-4a93-a88c-c7e373fe0dcc		1	1	2	\N	2022-02-16 13:52:28	2022-02-16 13:52:28			'00323':3 '128':1 'b482t':2	53	\N	\N	\N
788	1374	\N	128 E385F	\N	00324	0	\N	\N	0	\N	179	79d0b6cc-d43b-4001-8c59-203fdbff650d		1	1	2	\N	2022-02-16 13:54:00	2022-02-16 13:54:00			'00324':3 '128':1 'e385f':2	89	\N	\N	\N
789	1374	\N	128 E385F	\N	00325	0	\N	\N	0	\N	179	b9b91e47-a0e0-48db-b200-745217836582		1	1	2	\N	2022-02-16 13:54:11	2022-02-16 13:54:11			'00325':3 '128':1 'e385f':2	89	\N	\N	\N
790	1375	\N	128 F475	\N	00326	0	\N	\N	0	\N	179	456c605a-f1d7-48b0-9760-5af65c00d41b		1	1	2	\N	2022-02-16 13:58:57	2022-02-16 13:58:57			'00326':3 '128':1 'f475':2	88	\N	\N	\N
792	1375	\N	128 F475	\N	00327	0	\N	\N	0	\N	179	3f40847a-0e51-4926-8faf-f205cecb3e55		1	1	2	\N	2022-02-16 13:59:17	2022-02-16 13:59:17			'00327':3 '128':1 'f475':2	88	\N	\N	\N
793	1376	\N	128.2 C888L	\N	00328	0	\N	\N	0	\N	73	74316627-57b6-4149-8814-62db6544fcac		1	1	2	\N	2022-02-16 14:00:34	2022-02-16 14:00:34			'00328':3 '128.2':1 'c888l':2	51	\N	\N	\N
794	1377	\N	158.1 C684H	\N	00385	0	\N	\N	0	\N	15	9aa7dd79-3c28-407c-bb8d-cf7475a36637		1	1	2	\N	2022-02-16 14:05:13	2022-02-16 14:05:13			'00385':3 '158.1':1 'c684h':2	1061	\N	\N	\N
795	1377	\N	158.1 C684H	\N	00386	0	\N	\N	0	\N	15	3c0d74d9-a230-4fa4-83e4-34133388f690		1	1	2	\N	2022-02-16 14:05:29	2022-02-16 14:05:29			'00386':3 '158.1':1 'c684h':2	1061	\N	\N	\N
796	1378	\N	158.1 C684H	\N	00387	0	\N	\N	0	\N	245	9a2e5669-845e-401d-9edf-b2a4d33e6b60		1	1	2	\N	2022-02-16 14:07:05	2022-02-16 14:07:05			'00387':3 '158.1':1 'c684h':2	1118	\N	\N	\N
797	1378	\N	158.1 C684H	\N	00388	0	\N	\N	0	\N	245	c2652b57-25f3-49a6-a121-978f56ed1f38		1	1	2	\N	2022-02-16 14:07:16	2022-02-16 14:07:16			'00388':3 '158.1':1 'c684h':2	1118	\N	\N	\N
798	1379	\N	158.1 C684N	\N	00389	0	\N	\N	0	\N	245	36264096-d26b-471e-9995-a7b3dc3cfe9f		1	1	2	\N	2022-02-16 14:09:06	2022-02-16 14:09:06			'00389':3 '158.1':1 'c684n':2	1062	\N	\N	\N
799	1379	\N	158.1 C684N	\N	00390	0	\N	\N	0	\N	245	3363fd5d-1171-421e-9e97-d80ac3dd56c3		1	1	2	\N	2022-02-16 14:09:22	2022-02-16 14:09:22			'00390':3 '158.1':1 'c684n':2	1062	\N	\N	\N
800	1380	\N	121 D477P	\N	03416	0	\N	\N	0	\N	245	298cc29d-7af3-4e87-863a-8d72ee0337ae		1	1	2	\N	2022-02-16 14:11:07	2022-02-16 14:11:07			'03416':3 '121':1 'd477p':2	1280	\N	\N	\N
801	1380	\N	121 D477P	\N	03417	0	\N	\N	0	\N	245	1aa78746-fa14-4000-8155-57c2c5d0debf		1	1	2	\N	2022-02-16 14:11:55	2022-02-16 14:11:55			'03417':3 '121':1 'd477p':2	1280	\N	\N	\N
804	1381	\N	371.302'8 B388C 1995	\N	02747	0	\N	\N	0	\N	57	1a8c27d0-1093-4325-8ea2-07e3f0261827		1	1	2	\N	2022-02-16 15:31:12	2022-02-16 15:31:12			'02747':5 '1995':4 '371.302':1 '8':2 'b388c':3	310	\N	\N	\N
805	1381	\N	371.302'8 B388C 1995	\N	02748	0	\N	\N	0	\N	57	080c9025-efed-45a9-9c3f-20ca6340d9a7		1	1	2	\N	2022-02-16 15:31:29	2022-02-16 15:31:29			'02748':5 '1995':4 '371.302':1 '8':2 'b388c':3	310	\N	\N	\N
806	1382	\N	371.3 A537R 2007	\N	02741	0	\N	\N	0	\N	57	88618135-e24b-48ce-bfcc-e91472a0dc68		1	1	2	\N	2022-02-16 15:42:55	2022-02-16 15:43:01			'02741':4 '2007':3 '371.3':1 'a537r':2	1086	\N	\N	\N
807	1382	\N	371.3 A537R 2007	\N	02742	0	\N	\N	0	\N	57	605b14a3-c6c6-4dcc-b15a-6cb5d002e9ed		1	1	2	\N	2022-02-16 15:43:12	2022-02-16 15:43:12			'02742':4 '2007':3 '371.3':1 'a537r':2	1086	\N	\N	\N
808	1382	\N	371.3 A537R 2007	\N	02743	0	\N	\N	0	\N	57	7cd0b87a-32fc-49af-b8b7-2aea16bcd3ba		1	1	2	\N	2022-02-16 15:43:22	2022-02-16 15:43:22			'02743':4 '2007':3 '371.3':1 'a537r':2	1086	\N	\N	\N
809	1382	\N	371.3 A537R 2007	\N	02744	0	\N	\N	0	\N	57	abf0fdcc-c8af-4a55-8bd5-09ea215200f2		1	1	2	\N	2022-02-16 15:43:34	2022-02-16 15:43:34			'02744':4 '2007':3 '371.3':1 'a537r':2	1086	\N	\N	\N
810	1382	\N	1086	\N	02745	0	\N	\N	0	\N	57	1126e4d2-7fef-491d-ade0-6febd33c5943		1	1	2	\N	2022-02-16 15:43:48	2022-02-16 15:43:48			'02745':2 '1086':1	371.3 A537R 2007	\N	\N	\N
811	1382	\N	371.3 A537R 2007	\N	02746	0	\N	\N	0	\N	57	81649cab-b4d9-4a33-90e1-0ce96dc8bc5c		1	1	2	\N	2022-02-16 15:43:59	2022-02-16 15:43:59			'02746':4 '2007':3 '371.3':1 'a537r':2	1086	\N	\N	\N
812	1382	\N	1086	\N	03462	0	\N	\N	0	\N	57	d61e41fb-860d-4aef-8669-9de7c5e9ae9d		1	1	2	\N	2022-02-16 15:44:08	2022-02-16 15:44:08			'03462':2 '1086':1	371.3 A537R 2007	\N	\N	\N
813	1382	\N	1086	\N	03463	0	\N	\N	0	\N	57	77a7403d-c885-4e74-8b4d-875bc19b8ac2		1	1	2	\N	2022-02-16 15:44:19	2022-02-16 15:44:19			'03463':2 '1086':1	371.3 A537R 2007	\N	\N	\N
815	1382	\N	1086	\N	03814	0	\N	\N	0	\N	57	91787b36-6d8a-42e9-b684-905b327e7b03		1	1	2	\N	2022-02-16 15:44:46	2022-02-16 15:44:46			'03814':2 '1086':1	371.3 A537R 2007	\N	\N	\N
814	1382	\N	1086	\N	03766	0	\N	\N	0	\N	57	0c6bc050-f6c7-4f5e-8934-e818c7005337		1	1	2	\N	2022-02-16 15:44:38	2022-02-16 15:45:46			'03766':2 '1086':1	371.3 A537R 2007	\N	\N	\N
816	1382	\N	371.3 A537R 2007	\N	04178	0	\N	\N	0	\N	57	f7ff1ad0-0533-496d-93d0-4460963ff44f		1	1	2	\N	2022-02-16 15:46:01	2022-02-16 15:46:01			'04178':4 '2007':3 '371.3':1 'a537r':2	1086	\N	\N	\N
817	1383	\N	371.302'8 C644R 2004	\N	02749	0	\N	\N	0	\N	32	94e3d9ba-340a-4203-8015-7e9af3610694		1	1	2	\N	2022-02-16 15:51:55	2022-02-16 15:51:55			'02749':5 '2004':4 '371.302':1 '8':2 'c644r':3	308	\N	\N	\N
818	1383	\N	371.302'8 C644R 2004	\N	02751	0	\N	\N	0	\N	32	3d53de51-e78b-4f9e-8ee4-29b6ef153194		1	1	2	\N	2022-02-16 15:52:15	2022-02-16 15:52:15			'02751':5 '2004':4 '371.302':1 '8':2 'c644r':3	308	\N	\N	\N
819	1384	\N	371.3028 M489R 1985	\N	02763	0	\N	\N	0	\N	60	b4dedeb6-726f-4ef7-90da-2b8bf1a7a802		1	1	2	\N	2022-02-16 15:53:54	2022-02-16 15:53:54			'02763':4 '1985':3 '371.3028':1 'm489r':2	1074	\N	\N	\N
820	1384	\N	371.3028 M489R 1985	\N	02764	0	\N	\N	0	\N	60	da461d19-f7a3-417c-bdec-f1b8baba0e7d		1	1	2	\N	2022-02-16 15:54:07	2022-02-16 15:54:07			'02764':4 '1985':3 '371.3028':1 'm489r':2	1074	\N	\N	\N
821	1384	\N	371.3028 M489R 1985	\N	02765	0	\N	\N	0	\N	60	39b9b7b6-731d-48dc-8c00-c42a1aa209c2		1	1	2	\N	2022-02-16 15:54:18	2022-02-16 15:54:18			'02765':4 '1985':3 '371.3028':1 'm489r':2	1074	\N	\N	\N
822	1384	\N	371.3028 M489R 1985	\N	02766	0	\N	\N	0	\N	60	c82d0eb9-fe47-4266-ad7b-e0fd4cbcc468		1	1	2	\N	2022-02-16 15:54:29	2022-02-16 15:54:29			'02766':4 '1985':3 '371.3028':1 'm489r':2	1074	\N	\N	\N
824	1385	\N	371.302'8 Q848A	\N	02767	0	\N	\N	0	\N	57	901594d2-a8df-4a2a-90d5-0de78ae0bc26		1	1	2	\N	2022-02-16 17:00:56	2022-02-16 17:00:56			'02767':4 '371.302':1 '8':2 'q848a':3	212	\N	\N	\N
825	1386	\N	371.3028 Q848E	\N	02768	0	\N	\N	0	\N	57	462c9ad5-3e7e-46be-ae04-386c6a000e25		1	1	2	\N	2022-02-17 13:58:06	2022-02-17 13:58:06			'02768':3 '371.3028':1 'q848e':2	202	\N	\N	\N
826	1387	\N	371.302'8 Q848E	\N	02771	0	\N	\N	0	\N	57	670275f6-0bd1-4a15-96fa-5cfb237cd989		1	1	2	\N	2022-02-17 13:59:57	2022-02-17 13:59:57			'02771':4 '371.302':1 '8':2 'q848e':3	205	\N	\N	\N
827	1388	\N	371.302'8 Q848E	\N	02772	0	\N	\N	0	\N	57	dd8a9d13-d6bd-4201-b054-381b5d33c1a8		1	1	2	\N	2022-02-17 14:10:57	2022-02-17 14:10:57			'02772':4 '371.302':1 '8':2 'q848e':3	206	\N	\N	\N
828	1389	\N	371.302'8 Q848E	\N	02773	0	\N	\N	0	\N	57	431763fa-cd77-422b-9c90-02206ff3328a		1	1	2	\N	2022-02-17 14:15:18	2022-02-17 14:15:18			'02773':4 '371.302':1 '8':2 'q848e':3	213	\N	\N	\N
829	1390	\N	371.302'8 Q848E	\N	02774	0	\N	\N	0	\N	57	cd98c9b8-5d8d-4f9d-9634-441f666656e5		1	1	2	\N	2022-02-17 14:17:45	2022-02-17 14:17:45			'02774':4 '371.302':1 '8':2 'q848e':3	214	\N	\N	\N
830	1391	\N	371.302'8 Q848F	\N	02775	0	\N	\N	0	\N	57	a958b0ca-eaef-4d0f-b325-d74ad05470c7		1	1	2	\N	2022-02-17 14:28:51	2022-02-17 14:28:51			'02775':4 '371.302':1 '8':2 'q848f':3	210	\N	\N	\N
831	1392	\N	371.302'8 Q848L	\N	02776	0	\N	\N	0	\N	57	593e7bfc-5466-4b0b-bf36-259d3a01c180		1	1	2	\N	2022-02-17 14:31:59	2022-02-17 14:31:59			'02776':4 '371.302':1 '8':2 'q848l':3	204	\N	\N	\N
832	1393	\N	371.302'8 Q848P	\N	02787	0	\N	\N	0	\N	57	1527b7dd-2b95-4f7f-9eea-ef1c8cd6783b		1	1	2	\N	2022-02-17 14:33:24	2022-02-17 14:33:24			'02787':4 '371.302':1 '8':2 'q848p':3	207	\N	\N	\N
833	1394	\N	371.302'8 Q848P	\N	02788	0	\N	\N	0	\N	57	43f43e84-a923-481b-a463-4683198b6c0e		1	1	2	\N	2022-02-17 14:34:53	2022-02-17 14:34:53			'02788':4 '371.302':1 '8':2 'q848p':3	208	\N	\N	\N
834	1395	\N	371.302'8 Q848P	\N	02789	0	\N	\N	0	\N	57	a2d198f1-cadd-4f9a-9ac3-8f8a01bcd788		1	1	2	\N	2022-02-17 14:36:11	2022-02-17 14:36:11			'02789':4 '371.302':1 '8':2 'q848p':3	209	\N	\N	\N
835	1396	\N	371.302'8 Q848U	\N	02790	0	\N	\N	0	\N	57	a1ecdda1-3ff1-404e-b769-ea2fc570e907		1	1	2	\N	2022-02-17 14:37:31	2022-02-17 14:37:31			'02790':4 '371.302':1 '8':2 'q848u':3	211	\N	\N	\N
836	1397	\N	371.302'8 Q858M	\N	02792	0	\N	\N	0	\N	57	2e70e7b0-4acc-4ae5-9a03-6c0dc5818ed5		1	1	2	\N	2022-02-17 14:38:49	2022-02-17 14:38:49			'02792':4 '371.302':1 '8':2 'q858m':3	203	\N	\N	\N
837	1398	\N	371.3028 S333R	\N	02793	0	\N	\N	0	\N	245	b221c4c9-4d05-46f7-9a87-ececffd790b8		1	1	2	\N	2022-02-17 14:40:43	2022-02-17 14:40:43			'02793':3 '371.3028':1 's333r':2	1079	\N	\N	\N
838	1398	\N	371.3028 S333R	\N	02794	0	\N	\N	0	\N	245	8a289157-39a0-4e41-bbc8-6e8f3bb5d957		1	1	2	\N	2022-02-17 14:40:57	2022-02-17 14:40:57			'02794':3 '371.3028':1 's333r':2	1079	\N	\N	\N
839	1398	\N	371.3028 S333R	\N	02795	0	\N	\N	0	\N	245	69ef6720-9599-460d-abaf-c5665fa68cc6		1	1	2	\N	2022-02-17 14:41:09	2022-02-17 14:41:09			'02795':3 '371.3028':1 's333r':2	1079	\N	\N	\N
840	1398	\N	371.3028 S333R	\N	02796	0	\N	\N	0	\N	245	ddf1677a-d867-4c2e-8f67-ae91e6bcec31		1	1	2	\N	2022-02-17 14:41:22	2022-02-17 14:41:22			'02796':3 '371.3028':1 's333r':2	1079	\N	\N	\N
842	1398	\N	371.3028 S333R	\N	02798	0	\N	\N	0	\N	245	e6d962bf-55f8-4a36-9884-bb96274afb81		1	1	2	\N	2022-02-17 14:41:47	2022-02-17 14:41:47			'02798':3 '371.3028':1 's333r':2	1079	\N	\N	\N
841	1398	\N	371.3028 S333R	\N	02797	0	\N	\N	0	\N	245	54b4f875-8211-458f-a633-9d11ad1fd545		1	1	2	\N	2022-02-17 14:41:37	2022-02-17 14:42:06			'02797':3 '371.3028':1 's333r':2	1079	\N	\N	\N
843	1399	\N	371.302'8 S333R	\N	02799	0	\N	\N	0	\N	166	70202a1f-6fe9-4ddd-9964-e03d677876f8		1	1	2	\N	2022-02-17 14:43:53	2022-02-17 14:43:53			'02799':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
844	1399	\N	371.302'8 S333R	\N	02810	0	\N	\N	0	\N	166	7950ea34-58d0-4700-b8ba-b92bd072f8f1		1	1	2	\N	2022-02-17 14:44:04	2022-02-17 14:44:04			'02810':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
845	1399	\N	371.302'8 S333R	\N	02811	0	\N	\N	0	\N	166	82115a22-2876-41b0-a08b-58b6a9f148fe		1	1	2	\N	2022-02-17 14:44:13	2022-02-17 14:44:13			'02811':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
846	1399	\N	371.302'8 S333R	\N	02812	0	\N	\N	0	\N	166	1bb35a01-8c76-47cb-b31c-c3ad74e5bfde		1	1	2	\N	2022-02-17 14:44:21	2022-02-17 14:44:21			'02812':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
847	1399	\N	371.302'8 S333R	\N	02813	0	\N	\N	0	\N	166	e57a5cd2-0d33-40d1-b48c-919456d5dcd3		1	1	2	\N	2022-02-17 14:44:31	2022-02-17 14:44:31			'02813':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
848	1399	\N	371.302'8 S333R	\N	02814	0	\N	\N	0	\N	166	17b1af5e-0c5c-4b4f-ab82-dd024ceed247		1	1	2	\N	2022-02-17 14:44:44	2022-02-17 14:44:44			'02814':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
849	1399	\N	371.302'8 S333R	\N	03978	0	\N	\N	0	\N	166	a14afcbf-5b4c-44c6-a361-619b9e222676		1	1	2	\N	2022-02-17 14:44:53	2022-02-17 14:44:53			'03978':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
850	1399	\N	371.302'8 S333R	\N	03979	0	\N	\N	0	\N	166	338f0433-cdcf-4a79-9700-3ba68dfca530		1	1	2	\N	2022-02-17 14:45:04	2022-02-17 14:45:04			'03979':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
851	1399	\N	371.302'8 S333R	\N	03980	0	\N	\N	0	\N	166	ae6a59cc-207c-431c-8dc9-d4213636bb7d		1	1	2	\N	2022-02-17 14:45:13	2022-02-17 14:45:13			'03980':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
852	1399	\N	371.302'8 S333R	\N	03981	0	\N	\N	0	\N	166	e77b9666-3d6a-4883-900e-e83ba8b15122		1	1	2	\N	2022-02-17 14:45:22	2022-02-17 14:45:22			'03981':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
853	1399	\N	371.302'8 S333R	\N	03982	0	\N	\N	0	\N	166	7963f228-c11a-4c73-8d39-2528d3a6666e		1	1	2	\N	2022-02-17 14:45:33	2022-02-17 14:45:33			'03982':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
854	1399	\N	371.302'8 S333R	\N	03983	0	\N	\N	0	\N	166	8abaa298-c1a0-478c-958e-0f10fe951c21		1	1	2	\N	2022-02-17 14:45:43	2022-02-17 14:45:43			'03983':4 '371.302':1 '8':2 's333r':3	307	\N	\N	\N
855	1400	\N	371.302'8C A784C 2004	\N	02815	0	\N	\N	0	\N	245	7d9d3619-2770-4e77-97fd-0be51e21eb0f		1	1	2	\N	2022-02-17 15:11:53	2022-02-17 15:11:53			'02815':5 '2004':4 '371.302':1 '8c':2 'a784c':3	309	\N	\N	\N
856	1400	\N	371.302'8C A784C 2004	\N	02816	0	\N	\N	0	\N	245	2b75333f-d7c1-4905-968c-4c721ab6224c		1	1	2	\N	2022-02-17 15:12:06	2022-02-17 15:12:06			'02816':5 '2004':4 '371.302':1 '8c':2 'a784c':3	309	\N	\N	\N
857	1401	\N	371.302 8 M358	\N	04644	0	\N	\N	0	\N	245	755a4c2a-0806-456d-b262-cb1e78b58c33		1	1	2	\N	2022-02-17 15:15:22	2022-02-17 15:15:22			'04644':4 '371.302':1 '8':2 'm358':3	1507	\N	\N	\N
858	1401	\N	371.302 8 M358	\N	04645	0	\N	\N	0	\N	245	c2f6a3e1-68f9-4fc4-a763-e559983364ee		1	1	2	\N	2022-02-17 15:15:32	2022-02-17 15:15:32			'04645':4 '371.302':1 '8':2 'm358':3	1507	\N	\N	\N
859	1401	\N	371.302 8 M358	\N	04646	0	\N	\N	0	\N	245	08506723-14bf-405f-8232-a6a74c5350c9		1	1	2	\N	2022-02-17 15:15:41	2022-02-17 15:15:41			'04646':4 '371.302':1 '8':2 'm358':3	1507	\N	\N	\N
860	1401	\N	371.302 8 M358	\N	04647	0	\N	\N	0	\N	245	58978caf-dcf0-4642-8b32-c402243d1b4a		1	1	2	\N	2022-02-17 15:15:50	2022-02-17 15:15:50			'04647':4 '371.302':1 '8':2 'm358':3	1507	\N	\N	\N
870	1401	\N	371. 26 M358	\N	04648	0	\N	\N	0	\N	245	26af615c-0ba1-42ae-971d-22ec85714e4f		1	1	2	\N	2022-02-17 15:45:12	2022-02-17 15:45:12			'04648':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
871	1401	\N	371. 26 M358	\N	04649	0	\N	\N	0	\N	245	da7f0ebc-0419-43be-bb3b-3530a4ccc09f		1	1	2	\N	2022-02-17 15:46:41	2022-02-17 15:46:41			'04649':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
872	1401	\N	371. 26 M358	\N	04650	0	\N	\N	0	\N	245	582b755d-de66-4c83-a444-5a6212bade11		1	1	2	\N	2022-02-17 15:46:52	2022-02-17 15:46:52			'04650':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
873	1401	\N	371. 26 M358	\N	04651	0	\N	\N	0	\N	245	c70d9298-57e6-4928-b4bc-1df7dc7bdb41		1	1	2	\N	2022-02-17 15:47:02	2022-02-17 15:47:02			'04651':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
874	1401	\N	371. 26 M358	\N	04652	0	\N	\N	0	\N	245	4ed7a404-1eea-4a6a-b1e4-bb63543aa395		1	1	2	\N	2022-02-17 15:47:12	2022-02-17 15:47:12			'04652':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
875	1401	\N	371. 26 M358	\N	04653	0	\N	\N	0	\N	245	68611b5e-ed72-4abb-b113-74f198b48f41		1	1	2	\N	2022-02-17 15:47:25	2022-02-17 15:47:25			'04653':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
876	1401	\N	371. 26 M358	\N	04654	0	\N	\N	0	\N	245	dae0ea15-42b7-4d77-8a95-d8e8ea4eec0c		1	1	2	\N	2022-02-17 15:47:36	2022-02-17 15:47:36			'04654':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
877	1401	\N	371. 26 M358	\N	04655	0	\N	\N	0	\N	245	1909d397-e550-463a-b17a-f6141a39d17c		1	1	2	\N	2022-02-17 15:47:49	2022-02-17 15:47:49			'04655':4 '26':2 '371':1 'm358':3	1508	\N	\N	\N
878	1403	\N	152.4 M453D	\N	05253	0	\N	\N	0	\N	245	92ff562f-7998-4596-b286-eaec9277f887		1	1	2	\N	2022-02-17 15:50:27	2022-02-17 15:50:27			'05253':3 '152.4':1 'm453d':2	1757	\N	\N	\N
879	1404	\N	152.4 M453D	\N	05252	0	\N	\N	0	\N	245	7e17accb-7d1c-42da-8b4c-7f0133e3becf		1	1	2	\N	2022-02-17 15:52:09	2022-02-17 15:52:09			'05252':3 '152.4':1 'm453d':2	1756	\N	\N	\N
880	1405	\N	144 D422	\N	00333	0	\N	\N	0	\N	179	af88bce3-d32a-4e7e-bd34-9a6b6af58ef8		1	1	2	\N	2022-02-17 16:02:25	2022-02-17 16:02:25			'00333':3 '144':1 'd422':2	54	\N	\N	\N
881	1405	\N	144 D422	\N	04222	0	\N	\N	0	\N	179	d7bd82d7-abf5-4daf-ab31-3f8d2b6dbca4		1	1	2	\N	2022-02-17 16:02:38	2022-02-17 16:02:38			'04222':3 '144':1 'd422':2	54	\N	\N	\N
882	1406	\N	153.42 H388H	\N	00363	0	\N	\N	0	\N	83	5c981a2c-b6af-406e-b360-2789255a5c45		1	1	2	\N	2022-02-17 16:06:39	2022-02-17 16:06:39			'00363':3 '153.42':1 'h388h':2	58	\N	\N	\N
883	1406	\N	153.42 H388H	\N	04212	0	\N	\N	0	\N	83	e1f3d2c0-d838-4aed-93a8-699e4e062e3c		1	1	2	\N	2022-02-17 16:06:50	2022-02-17 16:06:50			'04212':3 '153.42':1 'h388h':2	58	\N	\N	\N
884	1407	\N	120 C524D	\N	00311	0	\N	\N	0	\N	245	999a2b10-9e26-403a-8498-25566043aa28		1	1	2	\N	2022-02-17 16:10:27	2022-02-17 16:10:27			'00311':3 '120':1 'c524d':2	46	\N	\N	\N
885	1407	\N	120 C524D	\N	00312	0	\N	\N	0	\N	245	20bcb6c8-81b9-4b51-b1a1-7ac1c71f7459		1	1	2	\N	2022-02-17 16:10:51	2022-02-17 16:10:51			'00312':3 '120':1 'c524d':2	46	\N	\N	\N
886	1407	\N	120 C524D	\N	00313	0	\N	\N	0	\N	245	3ea3f041-268e-41cf-accc-138bda2eaa5e		1	1	2	\N	2022-02-17 16:11:03	2022-02-17 16:11:03			'00313':3 '120':1 'c524d':2	46	\N	\N	\N
887	1407	\N	120 C524D	\N	00314	0	\N	\N	0	\N	245	3e950614-6384-4280-9b33-23e162140797		1	1	2	\N	2022-02-17 16:11:12	2022-02-17 16:11:12			'00314':3 '120':1 'c524d':2	46	\N	\N	\N
888	1408	\N	141 M456	\N	00330	0	\N	\N	0	\N	245	931536c6-6dd9-4f70-b2ad-2e0e78217855		1	1	2	\N	2022-02-17 16:15:20	2022-02-17 16:15:20			'00330':3 '141':1 'm456':2	136	\N	\N	\N
889	1408	\N	141 M456	\N	136	0	\N	\N	0	\N	245	4bf8013f-9035-451e-8aa6-07a009f29353		1	1	2	\N	2022-02-17 16:15:39	2022-02-17 16:15:39			'136':3 '141':1 'm456':2	00331	\N	\N	\N
890	1409	\N	142.78 S378E 1985	\N	00332	0	\N	\N	0	\N	245	a0e8bd94-ebb4-4a9f-9ed1-e642393c821e		1	1	2	\N	2022-02-17 16:19:08	2022-02-17 16:19:08			'00332':4 '142.78':1 '1985':3 's378e':2	86	\N	\N	\N
891	1410	\N	144 V473D	\N	00334	0	\N	\N	0	\N	179	df58138e-0680-402e-bf15-eafb4fb1350b		1	1	2	\N	2022-02-17 16:20:34	2022-02-17 16:20:34			'00334':3 '144':1 'v473d':2	87	\N	\N	\N
892	1410	\N	144 V473D	\N	00335	0	\N	\N	0	\N	179	d6e176bc-94a1-4207-b46a-b561bca93727		1	1	2	\N	2022-02-17 16:20:45	2022-02-17 16:20:45			'00335':3 '144':1 'v473d':2	87	\N	\N	\N
893	1411	\N	146 G372N	\N	00336	0	\N	\N	0	\N	179	4a086618-d670-4ac7-8ca7-fc441cde8b81		1	1	2	\N	2022-02-17 16:22:21	2022-02-17 16:22:21			'00336':3 '146':1 'g372n':2	82	\N	\N	\N
894	1411	\N	146 G372N	\N	00337	0	\N	\N	0	\N	179	1ea0b13b-1e9c-4c36-9b1b-051229fa6474		1	1	2	\N	2022-02-17 16:22:31	2022-02-17 16:22:31			'00337':3 '146':1 'g372n':2	82	\N	\N	\N
895	1412	\N	146 G372N 1993	\N	00338	0	\N	\N	0	\N	179	0c5c0c91-92b7-4b64-a0d6-40dc4590c9ff		1	1	2	\N	2022-02-17 16:26:51	2022-02-17 16:26:51			'00338':4 '146':1 '1993':3 'g372n':2	81	\N	\N	\N
896	1412	\N	146 G372N 1993	\N	00339	0	\N	\N	0	\N	179	d9101e09-9bb8-4f6d-84bb-a1b55b95b6c8		1	1	2	\N	2022-02-17 16:27:01	2022-02-17 16:27:01			'00339':4 '146':1 '1993':3 'g372n':2	81	\N	\N	\N
897	1413	\N	146 I885	\N	00340	0	\N	\N	0	\N	179	11a94b42-8aac-4282-aa6f-ad065b2ed1eb		1	1	2	\N	2022-02-17 16:29:10	2022-02-17 16:29:10			'00340':3 '146':1 'i885':2	80	\N	\N	\N
898	1413	\N	146 I885	\N	00341	0	\N	\N	0	\N	179	918a2130-5bec-4c6e-83df-89b1dae16880		1	1	2	\N	2022-02-17 16:29:22	2022-02-17 16:29:22			'00341':3 '146':1 'i885':2	80	\N	\N	\N
899	1414	\N	150 C878D	\N	00344	0	\N	\N	0	\N	245	2f8c04f8-7b13-42c0-b27f-2d80b88e16f5		1	1	2	\N	2022-02-17 16:33:39	2022-02-17 16:33:39			'00344':3 '150':1 'c878d':2	71	\N	\N	\N
900	1415	\N	150.195 7 F765E	\N	00353	0	\N	\N	0	\N	245	fec0d1fd-acc4-42b2-bb6d-cafa941141fc		1	1	2	\N	2022-02-17 16:38:26	2022-02-17 16:38:26			'00353':4 '150.195':1 '7':2 'f765e':3	83	\N	\N	\N
901	1416	\N	152 B693I	\N	00355	0	\N	\N	0	\N	245	a738cf08-ef99-41be-b05f-4607b694e3e9		1	1	2	\N	2022-02-17 16:41:36	2022-02-17 16:41:36			'00355':3 '152':1 'b693i':2	1068	\N	\N	\N
902	1417	\N	152.41 D494T	\N	00357	0	\N	\N	0	\N	245	285aa1ed-f67c-4d1d-a2cc-b85f763567b5		1	1	2	\N	2022-02-17 16:43:09	2022-02-17 16:43:09			'00357':3 '152.41':1 'd494t':2	69	\N	\N	\N
903	1417	\N	152.41 D494T	\N	00358	0	\N	\N	0	\N	245	9280b3ed-2ff1-4ff3-968c-3412d002c1e0		1	1	2	\N	2022-02-17 16:43:22	2022-02-17 16:43:22			'00358':3 '152.41':1 'd494t':2	69	\N	\N	\N
904	1418	\N	153 P458	\N	00359	0	\N	\N	0	\N	179	0c117bb0-38d4-49c3-bbc3-3cdabf62d6f5		1	1	2	\N	2022-02-17 16:45:27	2022-02-17 16:45:27			'00359':3 '153':1 'p458':2	\N	\N	\N	\N
905	1418	\N	153 P458	\N	00360	0	\N	\N	0	\N	179	ae4857b1-1728-43ed-ba04-851b10c2ff8f		1	1	2	\N	2022-02-17 16:46:01	2022-02-17 16:46:01			'00360':3 '153':1 'p458':2	67	\N	\N	\N
906	1419	\N	153.42 C477I	\N	00362	0	\N	\N	0	\N	245	c9500f54-9791-4400-b3ef-b6f91e5bbb71		1	1	2	\N	2022-02-17 16:47:26	2022-02-17 16:47:26			'00362':3 '153.42':1 'c477i':2	70	\N	\N	\N
907	1420	\N	153.42 H453E	\N	00364	0	\N	\N	0	\N	245	adcb7dd3-6f7c-4584-a16b-be831c6f891c		1	1	2	\N	2022-02-17 16:49:35	2022-02-17 16:49:35			'00364':3 '153.42':1 'h453e':2	57	\N	\N	\N
908	1422	\N	153.42 R884E	\N	00367	0	\N	\N	0	\N	245	1f149f6d-f8f9-4e46-b587-db4b3851014a		1	1	2	\N	2022-02-17 17:14:45	2022-02-17 17:14:45			'00367':3 '153.42':1 'r884e':2	55	\N	\N	\N
909	1423	\N	153.42 S352D	\N	04095	0	\N	\N	0	\N	60	667bc7f4-2ed5-4116-8a78-7231d872d20e		1	1	2	\N	2022-02-17 17:51:29	2022-02-17 17:51:29			'04095':3 '153.42':1 's352d':2	1410	\N	\N	\N
910	1423	\N	153.42 S352D	\N	04096	0	\N	\N	0	\N	60	ec19afc2-2424-45dc-b93f-f40398db6eb1		1	1	2	\N	2022-02-17 17:51:53	2022-02-17 17:51:53			'04096':3 '153.42':1 's352d':2	1410	\N	\N	\N
911	1423	\N	153.42 S352D	\N	04097	0	\N	\N	0	\N	60	c3c30add-3894-456d-b72e-b53725105956		1	1	2	\N	2022-02-17 17:52:14	2022-02-17 17:52:14			'04097':3 '153.42':1 's352d':2	1410	\N	\N	\N
912	1423	\N	153.42 S352D	\N	04098	0	\N	\N	0	\N	60	3e2bc1f9-0540-4c4d-8d21-69f42505c8f6		1	1	2	\N	2022-02-17 17:52:35	2022-02-17 17:52:45			'04098':3 '153.42':1 's352d':2	1410	\N	\N	\N
913	1423	\N	153.42 S352D	\N	04099	0	\N	\N	0	\N	60	461548c1-c0cc-435b-9442-d52b92437f1b		1	1	2	\N	2022-02-17 17:53:25	2022-02-17 17:53:25			'04099':3 '153.42':1 's352d':2	1410	\N	\N	\N
914	1423	\N	153.42 S352D	\N	04100	0	\N	\N	0	\N	60	6c38e5b5-6143-4d56-b431-622c0c9800ce		1	1	2	\N	2022-02-17 17:53:46	2022-02-17 17:53:46			'04100':3 '153.42':1 's352d':2	1410	\N	\N	\N
917	1424	\N	153.42 S353	\N	00370	0	\N	\N	0	\N	60	bdbb2b5f-ff53-4779-a13f-490c8b2f35c1		1	1	2	\N	2022-02-17 19:16:53	2022-02-17 19:16:53			'00370':3 '153.42':1 's353':2	59	\N	\N	\N
918	1424	\N	153.42 S353	\N	00371	0	\N	\N	0	\N	60	842d8359-1545-4604-91ff-c37ca6c67c03		1	1	2	\N	2022-02-17 19:17:05	2022-02-17 19:17:05			'00371':3 '153.42':1 's353':2	59	\N	\N	\N
919	1424	\N	153.42 S353	\N	00372	0	\N	\N	0	\N	60	c7c23c7e-1df8-48d6-a1fd-c12a11463fce		1	1	2	\N	2022-02-17 19:17:14	2022-02-17 19:17:14			'00372':3 '153.42':1 's353':2	59	\N	\N	\N
920	1424	\N	153.42 S353	\N	00373	0	\N	\N	0	\N	60	3d874e6d-e379-4430-b4f5-18b66fb2745b		1	1	2	\N	2022-02-17 19:17:27	2022-02-17 19:17:27			'00373':3 '153.42':1 's353':2	59	\N	\N	\N
921	1424	\N	153.42 S353	\N	00374	0	\N	\N	0	\N	60	6f1a7d8c-baf4-4331-986d-365e93fbad40		1	1	2	\N	2022-02-17 19:17:38	2022-02-17 19:17:38			'00374':3 '153.42':1 's353':2	59	\N	\N	\N
922	1424	\N	153.42 S353	\N	00375	0	\N	\N	0	\N	60	8cce37ad-e0f3-442e-8491-7088d80daa7c		1	1	2	\N	2022-02-17 19:17:52	2022-02-17 19:17:52			'00375':3 '153.42':1 's353':2	59	\N	\N	\N
923	1424	\N	153.42 S353	\N	00376	0	\N	\N	0	\N	60	59a9e809-c42a-43c2-b92d-c5417a0ea044		1	1	2	\N	2022-02-17 19:18:02	2022-02-17 19:18:02			'00376':3 '153.42':1 's353':2	59	\N	\N	\N
924	1425	\N	153.9 D553	\N	03765	0	\N	\N	0	\N	245	c284a615-faf8-4690-a4fc-77c016218d49		1	1	2	\N	2022-02-17 19:20:42	2022-02-17 19:20:42			'03765':3 '153.9':1 'd553':2	1363	\N	\N	\N
925	1425	\N	153.9 D553	\N	03767	0	\N	\N	0	\N	245	17608feb-a795-403e-ba6b-3d1447756e03		1	1	2	\N	2022-02-17 19:20:56	2022-02-17 19:20:56			'03767':3 '153.9':1 'd553':2	1363	\N	\N	\N
926	1425	\N	153.9 D553	\N	03768	0	\N	\N	0	\N	245	45616a51-4cb5-4e75-9292-03f11d63ca77		1	1	2	\N	2022-02-17 19:21:07	2022-02-17 19:21:07			'03768':3 '153.9':1 'd553':2	1363	\N	\N	\N
927	1425	\N	153.9 D553	\N	03769	0	\N	\N	0	\N	245	8b0d3d3d-740b-4b22-aa0c-99727d3dc01e		1	1	2	\N	2022-02-17 19:21:16	2022-02-17 19:21:16			'03769':3 '153.9':1 'd553':2	1363	\N	\N	\N
928	1425	\N	153.9 D553	\N	03770	0	\N	\N	0	\N	245	6e31ec88-a144-4ed9-b90e-540599b98370		1	1	2	\N	2022-02-17 19:21:36	2022-02-17 19:21:36			'03770':3 '153.9':1 'd553':2	1363	\N	\N	\N
929	1186	\N	154.63 L853 F887	\N	00378	0	\N	\N	0	\N	179	a98786d5-8791-432d-a8e6-e9ed5ed42c9b		1	1	2	\N	2022-02-17 19:32:30	2022-02-17 19:32:30			'00378':4 '154.63':1 'f887':3 'l853':2	66	\N	\N	\N
930	1426	\N	415 H477N	\N	03177	0	\N	\N	0	\N	179	18f2fa00-5bad-4dac-9ed4-c2a7c458141a		1	1	2	\N	2022-02-17 19:34:20	2022-02-17 19:34:20			'03177':3 '415':1 'h477n':2	356	\N	\N	\N
931	1426	\N	415 H477N	\N	03178	0	\N	\N	0	\N	179	9c1bf7a3-ca77-4225-abe1-7b64e931d21b		1	1	2	\N	2022-02-17 19:34:30	2022-02-17 19:34:30			'03178':3 '415':1 'h477n':2	356	\N	\N	\N
932	1427	\N	155.9 E887C 2007	\N	00379	0	\N	\N	0	\N	15	698ae3fe-afc1-4808-99c5-936a91bec4a9		1	1	2	\N	2022-02-17 19:36:38	2022-02-17 19:36:38			'00379':4 '155.9':1 '2007':3 'e887c':2	1072	\N	\N	\N
933	1427	\N	155.9 E887C 2007	\N	00380	0	\N	\N	0	\N	15	1f4b8f24-e7d8-42cc-a4ec-eaa302b4313e		1	1	2	\N	2022-02-17 19:36:49	2022-02-17 19:36:49			'00380':4 '155.9':1 '2007':3 'e887c':2	1072	\N	\N	\N
934	1427	\N	155.9 E887C 2007	\N	00381	0	\N	\N	0	\N	15	5f32981c-194d-446a-ab2c-6d0a84b2b934		1	1	2	\N	2022-02-17 19:36:58	2022-02-17 19:36:58			'00381':4 '155.9':1 '2007':3 'e887c':2	1072	\N	\N	\N
935	1427	\N	155.9 E887C 2007	\N	00382	0	\N	\N	0	\N	15	41ae5fe6-20b1-4a53-9629-9166724fd3a4		1	1	2	\N	2022-02-17 19:37:11	2022-02-17 19:37:11			'00382':4 '155.9':1 '2007':3 'e887c':2	1072	\N	\N	\N
936	1427	\N	155.9 E887C 2007	\N	00383	0	\N	\N	0	\N	15	e32535ba-e351-4a5c-8714-b2a739a11548		1	1	2	\N	2022-02-17 19:37:22	2022-02-17 19:37:22			'00383':4 '155.9':1 '2007':3 'e887c':2	1072	\N	\N	\N
937	1427	\N	155.9 E887C 2007	\N	00384	0	\N	\N	0	\N	15	1927b9b5-4b2c-42c6-b1b6-2297e71e0cbe		1	1	2	\N	2022-02-17 19:37:48	2022-02-17 19:37:48			'00384':4 '155.9':1 '2007':3 'e887c':2	1072	\N	\N	\N
938	1428	\N	153.42 S352D	\N	04068	0	\N	\N	0	\N	60	88590eb1-fa68-4ed4-a296-ebd718cff31c		1	1	2	\N	2022-02-17 19:40:29	2022-02-17 19:40:29			'04068':3 '153.42':1 's352d':2	1404	\N	\N	\N
939	1428	\N	153.42 S352D	\N	04069	0	\N	\N	0	\N	60	c18dcaa6-adfe-41fe-911d-74df527e8c33		1	1	2	\N	2022-02-17 19:40:39	2022-02-17 19:40:39			'04069':3 '153.42':1 's352d':2	1404	\N	\N	\N
940	1428	\N	153.42 S352D	\N	04070	0	\N	\N	0	\N	60	8380a1e1-6f36-488d-9a03-412dbc0a5ba3		1	1	2	\N	2022-02-17 19:40:48	2022-02-17 19:40:48			'04070':3 '153.42':1 's352d':2	1404	\N	\N	\N
941	1428	\N	153.42 S352D	\N	04071	0	\N	\N	0	\N	60	8d3dca58-a48b-4ee1-9160-35afd21d052d		1	1	2	\N	2022-02-17 19:40:58	2022-02-17 19:40:58			'04071':3 '153.42':1 's352d':2	1404	\N	\N	\N
942	1428	\N	153.42 S352D	\N	04072	0	\N	\N	0	\N	60	2e7b92f8-0d7b-4c24-9d5c-5c53e8e5517d		1	1	2	\N	2022-02-17 19:41:27	2022-02-17 19:41:27			'04072':3 '153.42':1 's352d':2	1404	\N	\N	\N
943	1429	\N	153.42 S352D	\N	04364	0	\N	\N	0	\N	60	95b15ba5-47e6-4680-8d01-4ba5f5a6d772		1	1	2	\N	2022-02-17 19:46:10	2022-02-17 19:46:10			'04364':3 '153.42':1 's352d':2	1410	\N	\N	\N
944	1430	\N	155.2 M453D	\N	05254	0	\N	\N	0	\N	245	ab2887b6-7ce0-41d3-a361-f1897ab744c9		1	1	2	\N	2022-02-17 19:49:26	2022-02-17 19:49:26			'05254':3 '155.2':1 'm453d':2	1758	\N	\N	\N
945	1431	\N	158.7 R637A 1988	\N	00397	0	\N	\N	0	\N	249	978252ab-52e6-47ba-9fd5-34a1c16c3e65		1	1	2	\N	2022-02-17 20:12:46	2022-02-17 20:12:46			'00397':4 '158.7':1 '1988':3 'r637a':2	1054	\N	\N	\N
946	1431	\N	158.7 R637A 1988	\N	00398	0	\N	\N	0	\N	249	2b862283-b607-414a-adf3-6b12929775b7		1	1	2	\N	2022-02-17 20:12:59	2022-02-17 20:12:59			'00398':4 '158.7':1 '1988':3 'r637a':2	1054	\N	\N	\N
947	1431	\N	158.7 R637A 1988	\N	05233	0	\N	\N	0	\N	249	742ae190-e059-4393-8e43-d122c7d8f0eb		1	1	2	\N	2022-02-17 20:13:08	2022-02-17 20:13:08			'05233':4 '158.7':1 '1988':3 'r637a':2	1054	\N	\N	\N
990	1447	\N	248.4 C435V	\N	05259	0	\N	\N	0	\N	245	82235019-c173-4d40-8162-d3826aefb9c0		1	1	2	\N	2022-02-18 13:38:36	2022-02-18 13:38:36			'05259':3 '248.4':1 'c435v':2	1762	\N	\N	\N
948	1431	\N	158.7 R637A 1988	\N	05234	0	\N	\N	0	\N	249	c00cee4b-c9d8-4662-a87a-ca17d1e9160c		1	1	2	\N	2022-02-17 20:13:18	2022-02-17 20:13:18			'05234':4 '158.7':1 '1988':3 'r637a':2	1054	\N	\N	\N
949	1431	\N	158.7 R637A 1988	\N	05235	0	\N	\N	0	\N	249	14e32b56-dedf-4c30-9457-16a18d97b3a7		1	1	2	\N	2022-02-17 20:13:29	2022-02-17 20:13:29			'05235':4 '158.7':1 '1988':3 'r637a':2	1054	\N	\N	\N
950	1432	\N	158.7 R637P 1988	\N	00399	0	\N	\N	0	\N	245	6714c6e1-5067-4fa3-b482-4be9926e6214		1	1	2	\N	2022-02-17 20:18:54	2022-02-17 20:18:54			'00399':4 '158.7':1 '1988':3 'r637p':2	1055	\N	\N	\N
951	1432	\N	158.7 R637P 1988	\N	00400	0	\N	\N	0	\N	245	eba4f4f6-162a-4c7d-a5ba-eb9b8fb49c19		1	1	2	\N	2022-02-17 20:19:22	2022-02-17 20:19:22			'00400':4 '158.7':1 '1988':3 'r637p':2	1055	\N	\N	\N
952	1433	\N	158.7 R637P 1988	\N	00401	0	\N	\N	0	\N	245	512d3402-ad6a-447e-b20c-6ade5a59d42b		1	1	2	\N	2022-02-17 20:21:40	2022-02-17 20:21:40			'00401':4 '158.7':1 '1988':3 'r637p':2	1056	\N	\N	\N
953	1433	\N	158.7 R637P 1988	\N	00402	0	\N	\N	0	\N	245	4d24feb6-95ce-4c07-8e45-4d9f4c4342ff		1	1	2	\N	2022-02-17 20:21:59	2022-02-17 20:21:59			'00402':4 '158.7':1 '1988':3 'r637p':2	1056	\N	\N	\N
954	1434	\N	160 M856S	\N	00404	0	\N	\N	0	\N	179	eda35bba-d056-4c0c-b9da-a4991c2c732a		1	1	2	\N	2022-02-17 20:23:36	2022-02-17 20:23:36			'00404':3 '160':1 'm856s':2	64	\N	\N	\N
955	1434	\N	160 M856S	\N	00405	0	\N	\N	0	\N	179	4cf443f3-fa1c-4183-a8a4-85def629c2c7		1	1	2	\N	2022-02-17 20:23:49	2022-02-17 20:23:49			'00405':3 '160':1 'm856s':2	64	\N	\N	\N
956	1435	\N	170 B372E 1935	\N	00406	0	\N	\N	0	\N	245	ecb9e78a-f5d2-45d6-8d5e-909ef66a624e		1	1	2	\N	2022-02-17 20:29:56	2022-02-17 20:29:56			'00406':4 '170':1 '1935':3 'b372e':2	63	\N	\N	\N
957	1435	\N	170 B372E 1935	\N	00407	0	\N	\N	0	\N	245	cb64f4e1-24ef-464b-b3c3-3ffb6efd3ad2		1	1	2	\N	2022-02-17 20:30:16	2022-02-17 20:30:16			'00407':4 '170':1 '1935':3 'b372e':2	63	\N	\N	\N
958	1437	\N	170 S352E	\N	00412	0	\N	\N	0	\N	179	950797c0-0f6f-4e9f-8cf4-e83f3f6a7442		1	1	2	\N	2022-02-17 20:32:51	2022-02-17 20:32:51			'00412':3 '170':1 's352e':2	\N	\N	\N	\N
959	1437	\N	170 S352E	\N	00413	0	\N	\N	0	\N	179	7162dd5e-6741-4d59-b54b-8ec0a662bd2c		1	1	2	\N	2022-02-17 20:33:12	2022-02-17 20:33:12			'00413':3 '170':1 's352e':2	92	\N	\N	\N
960	1438	\N	174 P353E	\N	00414	0	\N	\N	0	\N	179	0f9d6203-1036-49dc-a810-2eac80cd70c2		1	1	2	\N	2022-02-17 20:35:51	2022-02-17 20:35:51			'00414':3 '174':1 'p353e':2	98	\N	\N	\N
961	1439	\N	178 B785E	\N	00415	0	\N	\N	0	\N	253	004183d1-af83-421e-ba28-5bb939a50fba		1	1	2	\N	2022-02-17 20:42:31	2022-02-17 20:42:31			'00415':3 '178':1 'b785e':2	1058	\N	\N	\N
962	1439	\N	178 B785E	\N	00416	0	\N	\N	0	\N	253	01d5371f-014a-465f-82e4-d6e43bacd652		1	1	2	\N	2022-02-17 20:42:42	2022-02-17 20:42:42			'00416':3 '178':1 'b785e':2	1058	\N	\N	\N
963	1439	\N	178 B785E	\N	00417	0	\N	\N	0	\N	253	84bacf3e-5852-4903-a738-48387377bf18		1	1	2	\N	2022-02-17 20:42:55	2022-02-17 20:42:55			'00417':3 '178':1 'b785e':2	1058	\N	\N	\N
964	1439	\N	178 B785E	\N	00418	0	\N	\N	0	\N	253	b8f427cb-b4af-4cdb-89a0-7b6fc7e7a4c6		1	1	2	\N	2022-02-17 20:43:24	2022-02-17 20:43:24			'00418':3 '178':1 'b785e':2	1058	\N	\N	\N
965	1439	\N	178 B785E	\N	00419	0	\N	\N	0	\N	253	23d55c88-f117-49ff-8136-67de52cea3da		1	1	2	\N	2022-02-17 20:43:57	2022-02-17 20:43:57			'00419':3 '178':1 'b785e':2	1058	\N	\N	\N
966	1439	\N	178 B785E	\N	00420	0	\N	\N	0	\N	253	3f12d6d8-6882-4fca-bab9-6ecb8d9b17b1		1	1	2	\N	2022-02-17 20:44:19	2022-02-17 20:44:19			'00420':3 '178':1 'b785e':2	1058	\N	\N	\N
967	1440	\N	185 B482 2004	\N	00425	0	\N	\N	0	\N	245	c08b9859-31d4-434a-81fe-28597c95b180		1	1	2	\N	2022-02-17 20:46:21	2022-02-17 20:46:21			'00425':4 '185':1 '2004':3 'b482':2	90	\N	\N	\N
968	1440	\N	185 B482 2004	\N	00426	0	\N	\N	0	\N	245	4d85333e-41a9-4207-a72f-6a460a7da80e		1	1	2	\N	2022-02-17 20:46:30	2022-02-17 20:46:30			'00426':4 '185':1 '2004':3 'b482':2	90	\N	\N	\N
969	1441	\N	189.4 B482E	\N	00427	0	\N	\N	0	\N	179	b5ac4555-81ff-4a8c-ba54-57c685791d57		1	1	2	\N	2022-02-17 20:48:33	2022-02-17 20:48:33			'00427':3 '189.4':1 'b482e':2	91	\N	\N	\N
970	1441	\N	189.4 B482E	\N	00428	0	\N	\N	0	\N	179	1acea7bf-b019-4bd1-986f-0396b02fc273		1	1	2	\N	2022-02-17 20:48:47	2022-02-17 20:48:47			'00428':3 '189.4':1 'b482e':2	91	\N	\N	\N
971	1442	\N	190 Y346F	\N	00430	0	\N	\N	0	\N	245	96177124-957a-4348-9456-72f4a70f41a8		1	1	2	\N	2022-02-17 20:54:33	2022-02-17 20:54:33			'00430':3 '190':1 'y346f':2	103	\N	\N	\N
972	1443	\N	158.7 A886 1988	\N	00391	0	\N	\N	0	\N	254	ea183896-f6fa-4201-a1fc-a9e972e9b4c0		1	1	2	\N	2022-02-17 20:57:13	2022-02-17 20:57:13			'00391':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
973	1443	\N	158.7 A886 1988	\N	00392	0	\N	\N	0	\N	254	99cb0f79-46fb-409d-b6e0-52b990b31b93		1	1	2	\N	2022-02-17 20:57:23	2022-02-17 20:57:23			'00392':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
974	1443	\N	158.7 A886 1988	\N	00393	0	\N	\N	0	\N	254	8c6e1eb2-b201-485d-9670-733708e545d9		1	1	2	\N	2022-02-17 20:57:33	2022-02-17 20:57:33			'00393':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
975	1443	\N	158.7 A886 1988	\N	00394	0	\N	\N	0	\N	254	6a4d8763-e9e5-475e-8448-6359f8c715d0		1	1	2	\N	2022-02-17 20:57:46	2022-02-17 20:57:46			'00394':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
976	1443	\N	158.7 A886 1988	\N	00395	0	\N	\N	0	\N	254	1aff5004-52ef-46dc-82ea-6edea5c0366b		1	1	2	\N	2022-02-17 20:57:58	2022-02-17 20:57:58			'00395':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
977	1443	\N	158.7 A886 1988	\N	00396	0	\N	\N	0	\N	254	e27794a6-74d0-446f-9fb0-717bea71c17e		1	1	2	\N	2022-02-17 20:58:08	2022-02-17 20:58:08			'00396':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
978	1443	\N	158.7 A886 1988	\N	03919	0	\N	\N	0	\N	254	a1b8ca33-8001-472d-85d7-b8c93b097e96		1	1	2	\N	2022-02-17 20:58:20	2022-02-17 20:58:20			'03919':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
979	1443	\N	158.7 A886 1988	\N	03920	0	\N	\N	0	\N	254	88299ec5-0397-4522-b38d-c3cf119f2f86		1	1	2	\N	2022-02-17 20:58:28	2022-02-17 20:58:28			'03920':4 '158.7':1 '1988':3 'a886':2	1057	\N	\N	\N
981	1444	\N	158.2 C375C 2006	\N	04077	0	\N	\N	0	\N	255	8c3d60bd-95d6-498b-8df8-e850fb65a274		1	1	2	\N	2022-02-17 21:28:04	2022-02-17 21:28:04			'04077':4 '158.2':1 '2006':3 'c375c':2	1406	\N	\N	\N
982	1444	\N	158.2 C375C 2006	\N	04078	0	\N	\N	0	\N	255	26bff00b-110a-4342-9866-dd19ec10e385		1	1	2	\N	2022-02-17 21:28:15	2022-02-17 21:28:15			'04078':4 '158.2':1 '2006':3 'c375c':2	1406	\N	\N	\N
983	1444	\N	158.2 C375C 2006	\N	04079	0	\N	\N	0	\N	255	bac90323-6342-4032-b0a1-690c69acdd79		1	1	2	\N	2022-02-17 21:28:24	2022-02-17 21:28:24			'04079':4 '158.2':1 '2006':3 'c375c':2	1406	\N	\N	\N
984	1444	\N	158.2 C375C 2006	\N	04080	0	\N	\N	0	\N	255	0e12a6fb-f0eb-4744-a71a-fd65546268fa		1	1	2	\N	2022-02-17 21:28:33	2022-02-17 21:28:33			'04080':4 '158.2':1 '2006':3 'c375c':2	1406	\N	\N	\N
985	1444	\N	158.2 C375C 2006	\N	04081	0	\N	\N	0	\N	255	431db5d8-726e-4d49-8654-ec24d3e991a9		1	1	2	\N	2022-02-17 21:28:48	2022-02-17 21:28:48			'04081':4 '158.2':1 '2006':3 'c375c':2	1406	\N	\N	\N
986	1444	\N	158.2 C375C 2006	\N	04082	0	\N	\N	0	\N	255	c3ea1bf4-ddbc-4bd1-b3ca-de4cbc5135ee		1	1	2	\N	2022-02-17 21:28:59	2022-02-17 21:28:59			'04082':4 '158.2':1 '2006':3 'c375c':2	1406	\N	\N	\N
987	1445	\N	179.9 H524G	\N	04227	0	\N	\N	0	\N	245	ac1027ba-1a3a-4561-a42c-fbfd3f344e9c		1	1	2	\N	2022-02-17 21:30:28	2022-02-17 21:30:28			'04227':3 '179.9':1 'h524g':2	1442	\N	\N	\N
988	1446	\N	248.4 C435A	\N	05247	0	\N	\N	0	\N	245	91f02d8b-3fe9-4b84-827a-e80d197c6ca5		1	1	2	\N	2022-02-18 13:34:16	2022-02-18 13:34:16			'05247':3 '248.4':1 'c435a':2	1751	\N	\N	\N
989	1447	\N	248.4 C435V	\N	05258	0	\N	\N	0	\N	245	93214a4d-af5d-4416-a71f-2f7fecaeeb2f		1	1	2	\N	2022-02-18 13:38:24	2022-02-18 13:38:24			'05258':3 '248.4':1 'c435v':2	1762	\N	\N	\N
991	1447	\N	248.4 C435V	\N	05260	0	\N	\N	0	\N	245	2836bd8e-9547-40fb-82a4-1f950868604d		1	1	2	\N	2022-02-18 13:38:48	2022-02-18 13:38:48			'05260':3 '248.4':1 'c435v':2	1762	\N	\N	\N
992	1447	\N	248.4 C435V	\N	05261	0	\N	\N	0	\N	245	181ff57c-dab0-438f-861e-4bee64e9211b		1	1	2	\N	2022-02-18 13:39:03	2022-02-18 13:39:03			'05261':3 '248.4':1 'c435v':2	1762	\N	\N	\N
993	1447	\N	248.4 C435V	\N	05262	0	\N	\N	0	\N	245	207b8ccf-5360-4f73-a26a-dadfc5ef30ed		1	1	2	\N	2022-02-18 13:39:13	2022-02-18 13:39:13			'05262':3 '248.4':1 'c435v':2	1762	\N	\N	\N
994	1447	\N	248.4 C435V	\N	05263	0	\N	\N	0	\N	245	bc394260-8ece-4933-a0e8-886b9b61b336		1	1	2	\N	2022-02-18 13:39:22	2022-02-18 13:39:22			'05263':3 '248.4':1 'c435v':2	1762	\N	\N	\N
995	1447	\N	248.4 C435V	\N	05264	0	\N	\N	0	\N	245	5d12464e-8d93-4e48-a00f-1937fc520d20		1	1	2	\N	2022-02-18 13:39:36	2022-02-18 13:39:36			'05264':3 '248.4':1 'c435v':2	1762	\N	\N	\N
996	1447	\N	248.4 C435V	\N	05265	0	\N	\N	0	\N	245	b761a5c4-f286-4a60-9ac6-2c98ba24657a		1	1	2	\N	2022-02-18 13:39:50	2022-02-18 13:39:50			'05265':3 '248.4':1 'c435v':2	1762	\N	\N	\N
997	1447	\N	248.4 C435V	\N	05266	0	\N	\N	0	\N	245	f29379d7-6df6-4c9a-8765-41288b0534b1		1	1	2	\N	2022-02-18 13:40:02	2022-02-18 13:40:02			'05266':3 '248.4':1 'c435v':2	1762	\N	\N	\N
998	1447	\N	248.4 C435V	\N	05267	0	\N	\N	0	\N	245	288c68d1-0a8c-4881-bc9d-a85df3fce097		1	1	2	\N	2022-02-18 13:40:15	2022-02-18 13:40:15			'05267':3 '248.4':1 'c435v':2	1762	\N	\N	\N
999	1448	\N	299.7 A583D	\N	00472	0	\N	\N	0	\N	245	2544bc58-81d7-47a5-bd35-1a6677644660		1	1	2	\N	2022-02-18 13:42:39	2022-02-18 13:42:39			'00472':3 '299.7':1 'a583d':2	104	\N	\N	\N
1000	1448	\N	299.7 A583D	\N	00473	0	\N	\N	0	\N	245	7290771a-2627-47ca-9790-168380eea6a1		1	1	2	\N	2022-02-18 13:42:47	2022-02-18 13:42:47			'00473':3 '299.7':1 'a583d':2	104	\N	\N	\N
1001	1449	\N	200 D455E	\N	04225	0	\N	\N	0	\N	179	edb185a5-3ee5-4d28-8db8-8744047aad9e		1	1	2	\N	2022-02-18 13:45:48	2022-02-18 13:45:48			'04225':3 '200':1 'd455e':2	1441	\N	\N	\N
1002	1449	\N	200 D455E	\N	04226	0	\N	\N	0	\N	179	1d770c76-176e-4b36-b0cb-0fd819243bc8		1	1	2	\N	2022-02-18 13:46:01	2022-02-18 13:46:01			'04226':3 '200':1 'd455e':2	1441	\N	\N	\N
1003	1450	\N	294.5 M673	\N	00470	0	\N	\N	0	\N	245	c32597f6-8a6d-4ae7-b271-3a6e7fae6b50		1	1	2	\N	2022-02-18 13:47:21	2022-02-18 13:47:21			'00470':3 '294.5':1 'm673':2	108	\N	\N	\N
1004	1450	\N	294.5 M673	\N	00471	0	\N	\N	0	\N	245	d1da6002-1769-42c9-b227-c60712fa00e3		1	1	2	\N	2022-02-18 13:47:30	2022-02-18 13:47:30			'00471':3 '294.5':1 'm673':2	108	\N	\N	\N
1005	1451	\N	291.9 I467	\N	00469	0	\N	\N	0	\N	245	e11e9b78-5c47-4aa1-b0ba-d9abbb2bf48c		1	1	2	\N	2022-02-18 13:49:16	2022-02-18 13:49:16			'00469':3 '291.9':1 'i467':2	112	\N	\N	\N
1006	1452	\N	291.7 S684L	\N	00467	0	\N	\N	0	\N	179	bf4e13a4-c5f1-44fa-a583-790b3d217b1c		1	1	2	\N	2022-02-18 13:50:26	2022-02-18 13:50:26			'00467':3 '291.7':1 's684l':2	110	\N	\N	\N
1007	1452	\N	291.7 S684L	\N	00468	0	\N	\N	0	\N	179	e02570c0-80e8-4374-8b2f-e2eb7a497ba0		1	1	2	\N	2022-02-18 13:50:36	2022-02-18 13:50:36			'00468':3 '291.7':1 's684l':2	110	\N	\N	\N
1008	1454	\N	291.35 M657T	\N	00463	0	\N	\N	0	\N	179	2cb56eaf-1f88-4b7a-b490-9a930ec0273f		1	1	2	\N	2022-02-18 13:53:03	2022-02-18 13:53:03			'00463':3 '291.35':1 'm657t':2	106	\N	\N	\N
1009	1454	\N	291.35 M657T	\N	00464	0	\N	\N	0	\N	179	a963689e-8433-4638-8db3-9a21f5cfeaa2		1	1	2	\N	2022-02-18 13:53:13	2022-02-18 13:53:13			'00464':3 '291.35':1 'm657t':2	\N	\N	\N	\N
1010	1455	\N	291.34 N344E	\N	00461	0	\N	\N	0	\N	179	bbee24bd-ca08-4d3b-87c5-86fc2db0cbd8		1	1	2	\N	2022-02-18 13:54:37	2022-02-18 13:54:37			'00461':3 '291.34':1 'n344e':2	102	\N	\N	\N
1011	1455	\N	291.34 N344E	\N	00462	0	\N	\N	0	\N	179	229bfbcd-4554-427a-be9c-0a04273eba71		1	1	2	\N	2022-02-18 13:54:45	2022-02-18 13:54:45			'00462':3 '291.34':1 'n344e':2	102	\N	\N	\N
1012	1456	\N	291.215 G735A	\N	00460	0	\N	\N	0	\N	245	14f1ae09-3b2d-474a-9437-60d612cd699d		1	1	2	\N	2022-02-18 13:56:11	2022-02-18 13:56:11			'00460':3 '291.215':1 'g735a':2	113	\N	\N	\N
1013	1457	\N	291.215 A849	\N	00459	0	\N	\N	0	\N	245	57c681d8-79b0-43fa-b14c-ec971b7fffce		1	1	2	\N	2022-02-18 13:57:27	2022-02-18 13:57:27			'00459':3 '291.215':1 'a849':2	114	\N	\N	\N
1014	1458	\N	291.17 L593 1995	\N	00455	0	\N	\N	0	\N	179	a1c9f3c0-49b9-425d-9a47-4651c07277a8		1	1	2	\N	2022-02-18 13:59:22	2022-02-18 13:59:22			'00455':4 '1995':3 '291.17':1 'l593':2	116	\N	\N	\N
1015	1458	\N	291.17 L593 1995	\N	00456	0	\N	\N	0	\N	179	0022c82a-d769-4461-9921-eab0a9327da3		1	1	2	\N	2022-02-18 13:59:33	2022-02-18 13:59:33			'00456':4 '1995':3 '291.17':1 'l593':2	116	\N	\N	\N
1016	1458	\N	291.17 L593 1995	\N	00457	0	\N	\N	0	\N	179	c732adfb-307e-4560-9c27-8ee7084f8699		1	1	2	\N	2022-02-18 13:59:45	2022-02-18 13:59:45			'00457':4 '1995':3 '291.17':1 'l593':2	116	\N	\N	\N
1017	1458	\N	291.17 L593 1995	\N	00458	0	\N	\N	0	\N	179	27fd7779-6bda-4698-941d-3d89f1a2ea16		1	1	2	\N	2022-02-18 13:59:54	2022-02-18 13:59:54			'00458':4 '1995':3 '291.17':1 'l593':2	116	\N	\N	\N
1018	1459	\N	291.17 G659C	\N	00453	0	\N	\N	0	\N	179	5a532d83-bbde-436d-a298-dd11c6a3e9f6		1	1	2	\N	2022-02-18 14:03:19	2022-02-18 14:03:19			'00453':3 '291.17':1 'g659c':2	107	\N	\N	\N
1019	1459	\N	291.17 G659C	\N	00454	0	\N	\N	0	\N	179	865b3d9d-3736-4fe7-b1c7-5b01313bedf5		1	1	2	\N	2022-02-18 14:03:28	2022-02-18 14:03:28			'00454':3 '291.17':1 'g659c':2	107	\N	\N	\N
1020	1460	\N	277.726'3 M472L	\N	00451	0	\N	\N	0	\N	179	eb2bbddc-69db-4f7c-a214-e459b00510ac		1	1	2	\N	2022-02-18 14:05:30	2022-02-18 14:05:30			'00451':4 '277.726':1 '3':2 'm472l':3	109	\N	\N	\N
1021	1460	\N	277.726'3 M472L	\N	00452	0	\N	\N	0	\N	179	6cbfb02c-0b83-4ed9-adca-413d046e0dfc		1	1	2	\N	2022-02-18 14:08:41	2022-02-18 14:08:41			'00452':4 '277.726':1 '3':2 'm472l':3	109	\N	\N	\N
1022	1461	\N	263.04256944 L365	\N	00450	0	\N	\N	0	\N	245	eef22940-9315-46d6-8690-b60990c85c62		1	1	2	\N	2022-02-18 14:10:01	2022-02-18 14:10:01			'00450':3 '263.04256944':1 'l365':2	115	\N	\N	\N
1023	1462	\N	262.3 T323	\N	00448	0	\N	\N	0	\N	179	881f709d-b492-427a-872e-16c81cf1135e		1	1	2	\N	2022-02-18 14:11:17	2022-02-18 14:11:17			'00448':3 '262.3':1 't323':2	100	\N	\N	\N
1024	1462	\N	262.3 T323	\N	00449	0	\N	\N	0	\N	179	58738cb2-ddbc-4418-a4ac-533e2ace9e90		1	1	2	\N	2022-02-18 14:11:25	2022-02-18 14:11:25			'00449':3 '262.3':1 't323':2	100	\N	\N	\N
1025	1463	\N	260 I354	\N	00446	0	\N	\N	0	\N	179	eade6bc5-361d-4597-8c09-ea0196cfc867		1	1	2	\N	2022-02-18 14:12:46	2022-02-18 14:12:46			'00446':3 '260':1 'i354':2	101	\N	\N	\N
1026	1463	\N	260 I354	\N	00447	0	\N	\N	0	\N	179	108f0a6e-ca84-489d-aa4b-6ffb39bd0088		1	1	2	\N	2022-02-18 14:12:57	2022-02-18 14:12:57			'00447':3 '260':1 'i354':2	101	\N	\N	\N
1027	1464	\N	230 F745P	\N	00445	0	\N	\N	0	\N	69	acbe6342-457e-4930-9dc5-ae3fe848aef2		1	1	2	\N	2022-02-18 14:15:05	2022-02-18 14:15:05			'00445':3 '230':1 'f745p':2	111	\N	\N	\N
1028	1465	\N	229.911 E823A	\N	00443	0	\N	\N	0	\N	179	641ce598-beaf-453f-a149-953ec49df620		1	1	2	\N	2022-02-18 14:45:29	2022-02-18 14:45:29			'00443':3 '229.911':1 'e823a':2	99	\N	\N	\N
1029	1465	\N	229.911 E823A	\N	00444	0	\N	\N	0	\N	179	a723b817-60a5-44a3-858e-917fe2e5cd7e		1	1	2	\N	2022-02-18 14:45:40	2022-02-18 14:45:40			'00444':3 '229.911':1 'e823a':2	99	\N	\N	\N
1030	1466	\N	223 U558	\N	00431	0	\N	\N	0	\N	245	81d32ed6-7fa7-490b-8d0d-27118fb9b42f		1	1	2	\N	2022-02-18 14:54:52	2022-02-18 14:56:36			'00431':3 '223':1 'u558':2	1143	\N	\N	\N
1031	1466	\N	223 U558	\N	00432	0	\N	\N	0	\N	245	86ad8147-096b-44ab-ad47-568608aa0da5		1	1	2	\N	2022-02-18 14:56:48	2022-02-18 14:56:48			'00432':3 '223':1 'u558':2	1143	\N	\N	\N
1032	1466	\N	223 U558	\N	00433	0	\N	\N	0	\N	245	7cd0bfee-8966-4f21-b3d9-20166a235864		1	1	2	\N	2022-02-18 14:57:12	2022-02-18 14:57:12			'00433':3 '223':1 'u558':2	1143	\N	\N	\N
1033	1466	\N	223 U558	\N	00434	0	\N	\N	0	\N	245	aa735038-5d20-4193-8016-0c27bfbbe204		1	1	2	\N	2022-02-18 14:57:26	2022-02-18 14:57:26			'00434':3 '223':1 'u558':2	1143	\N	\N	\N
1034	1466	\N	223 U558	\N	00435	0	\N	\N	0	\N	245	7387a679-dacf-4177-8675-ef01cbeccb11		1	1	2	\N	2022-02-18 14:57:52	2022-02-18 14:57:52			'00435':3 '223':1 'u558':2	1143	\N	\N	\N
1035	1466	\N	223 U558	\N	00436	0	\N	\N	0	\N	245	30675090-cd80-4bdd-be81-da79141c6cdc		1	1	2	\N	2022-02-18 14:58:04	2022-02-18 14:58:04			'00436':3 '223':1 'u558':2	1143	\N	\N	\N
1036	1466	\N	223 U558	\N	00437	0	\N	\N	0	\N	245	099acfb3-3267-49ca-ab15-ca3fa45f8c62		1	1	2	\N	2022-02-18 14:58:17	2022-02-18 14:58:17			'00437':3 '223':1 'u558':2	1143	\N	\N	\N
1037	1466	\N	223 U558	\N	00438	0	\N	\N	0	\N	245	8074bd9b-fbbf-4a60-82a0-55473697eeeb		1	1	2	\N	2022-02-18 14:58:41	2022-02-18 14:58:41			'00438':3 '223':1 'u558':2	1143	\N	\N	\N
1038	1466	\N	223 U558	\N	00439	0	\N	\N	0	\N	245	a112b6b8-6c94-474d-b55d-4ad7f157cf54		1	1	2	\N	2022-02-18 14:58:51	2022-02-18 14:58:51			'00439':3 '223':1 'u558':2	1143	\N	\N	\N
1039	1466	\N	223 U558	\N	00440	0	\N	\N	0	\N	245	46b80010-cd02-4822-99a5-f237947c3dea		1	1	2	\N	2022-02-18 14:59:01	2022-02-18 14:59:01			'00440':3 '223':1 'u558':2	1143	\N	\N	\N
1040	1466	\N	223 U558	\N	00441	0	\N	\N	0	\N	245	d12b44ef-6579-4800-a16b-8b4759df9cc5		1	1	2	\N	2022-02-18 14:59:21	2022-02-18 14:59:21			'00441':3 '223':1 'u558':2	1143	\N	\N	\N
1041	1466	\N	223 U558	\N	00442	0	\N	\N	0	\N	245	16260afc-e064-4e5d-90c5-d01dc97ea52a		1	1	2	\N	2022-02-18 14:59:33	2022-02-18 14:59:33			'00442':3 '223':1 'u558':2	1143	\N	\N	\N
1042	1467	\N	301.420 972 52 G372F	\N	05236	0	\N	\N	0	\N	135	103f5b96-58ac-4a92-9e6c-6258721ab210		1	1	2	\N	2022-02-18 15:35:58	2022-02-18 15:35:58			'05236':5 '301.420':1 '52':3 '972':2 'g372f':4	1740	\N	\N	\N
1043	1468	\N	300 M378P	\N	00613	0	\N	\N	0	\N	245	33e7cd4e-12ff-4273-b208-7db027613629		1	1	2	\N	2022-02-18 15:38:27	2022-02-18 15:38:27			'00613':3 '300':1 'm378p':2	376	\N	\N	\N
1044	1468	\N	300 M378P	\N	00614	0	\N	\N	0	\N	245	6e719e1a-6455-4cf8-abe1-b7da1de26ce0		1	1	2	\N	2022-02-18 15:38:37	2022-02-18 15:38:37			'00614':3 '300':1 'm378p':2	376	\N	\N	\N
1045	1468	\N	300 M378P	\N	00615	0	\N	\N	0	\N	245	a7c475fd-fb7a-4a7f-be6c-21f2c8b61cc3		1	1	2	\N	2022-02-18 15:38:45	2022-02-18 15:38:45			'00615':3 '300':1 'm378p':2	376	\N	\N	\N
1046	1468	\N	300 M378P	\N	00616	0	\N	\N	0	\N	245	06b8b1ec-6793-4fde-8e70-323ac2fcd736		1	1	2	\N	2022-02-18 15:38:56	2022-02-18 15:38:56			'00616':3 '300':1 'm378p':2	376	\N	\N	\N
1047	1468	\N	300 M378P	\N	00617	0	\N	\N	0	\N	245	debd3982-606a-425e-b0cb-8afff9559fc0		1	1	2	\N	2022-02-18 15:39:06	2022-02-18 15:39:06			'00617':3 '300':1 'm378p':2	376	\N	\N	\N
1048	1468	\N	300 M378P	\N	00618	0	\N	\N	0	\N	245	6773f040-b01c-4989-8fd7-a4f0465ff236		1	1	2	\N	2022-02-18 15:39:20	2022-02-18 15:39:33			'00618':3 '300':1 'm378p':2	376	\N	\N	\N
1049	1468	\N	300 M378P	\N	00619	0	\N	\N	0	\N	245	5ece188f-19ad-4980-a6cc-31c80964523d		1	1	2	\N	2022-02-18 15:39:49	2022-02-18 15:39:49			'00619':3 '300':1 'm378p':2	376	\N	\N	\N
1050	1468	\N	300 M378P	\N	00620	0	\N	\N	0	\N	245	a1eaeada-4381-46f8-b95f-c6fcd2d30474		1	1	2	\N	2022-02-18 15:40:02	2022-02-18 15:40:02			'00620':3 '300':1 'm378p':2	376	\N	\N	\N
1051	1469	\N	302.2 B475P 2004	\N	00496	0	\N	\N	0	\N	244	a8a4cb3a-0d15-4cb9-a6b6-725ef27601e2		1	1	2	\N	2022-02-18 15:42:00	2022-02-18 15:42:00			'00496':4 '2004':3 '302.2':1 'b475p':2	196	\N	\N	\N
1052	1469	\N	302.2 B475P 2004	\N	00497	0	\N	\N	0	\N	244	fd822ba3-02e6-45fd-9202-ff57f4855bbe		1	1	2	\N	2022-02-18 15:42:13	2022-02-18 15:42:13			'00497':4 '2004':3 '302.2':1 'b475p':2	196	\N	\N	\N
1053	1470	\N	302.2 A935I 1999	\N	00493	0	\N	\N	0	\N	245	359ca668-f739-42f6-ab2e-5f5c253e5acf		1	1	2	\N	2022-02-18 15:45:10	2022-02-18 15:45:10			'00493':4 '1999':3 '302.2':1 'a935i':2	1087	\N	\N	\N
1054	1470	\N	302.2 A935I 1999	\N	00494	0	\N	\N	0	\N	245	8bf9ea60-2b1b-4885-a842-8d7cd0e33ffd		1	1	2	\N	2022-02-18 15:45:22	2022-02-18 15:45:22			'00494':4 '1999':3 '302.2':1 'a935i':2	1087	\N	\N	\N
1055	1470	\N	302.2 A935I 1999	\N	00495	0	\N	\N	0	\N	245	e560eeb2-e27c-475a-ad36-601a25549c13		1	1	2	\N	2022-02-18 15:45:36	2022-02-18 15:45:36			'00495':4 '1999':3 '302.2':1 'a935i':2	1087	\N	\N	\N
1056	1471	\N	301 H484	\N	00483	0	\N	\N	0	\N	179	81b61463-625a-40cd-a811-19b564180c8f		1	1	2	\N	2022-02-18 15:47:10	2022-02-18 15:47:10			'00483':3 '301':1 'h484':2	141	\N	\N	\N
1057	1471	\N	301 H484	\N	00484	0	\N	\N	0	\N	179	86f8bee3-a38f-4b2e-9fbe-f20c545909f0		1	1	2	\N	2022-02-18 15:47:19	2022-02-18 15:47:19			'00484':3 '301':1 'h484':2	141	\N	\N	\N
1058	1471	\N	301 H484	\N	00485	0	\N	\N	0	\N	179	d27573d1-5d8a-4432-b16f-95a2cfc60dcd		1	1	2	\N	2022-02-18 15:47:31	2022-02-18 15:47:31			'00485':3 '301':1 'h484':2	141	\N	\N	\N
1059	1471	\N	301 H484	\N	00486	0	\N	\N	0	\N	179	99fc5e42-82e0-4bab-84ca-7374f0a98136		1	1	2	\N	2022-02-18 15:47:40	2022-02-18 15:47:40			'00486':3 '301':1 'h484':2	141	\N	\N	\N
1060	1471	\N	301 H484	\N	00487	0	\N	\N	0	\N	179	8e0bf3ae-6c11-4b7e-8390-d3b85940c741		1	1	2	\N	2022-02-18 15:47:55	2022-02-18 15:47:55			'00487':3 '301':1 'h484':2	141	\N	\N	\N
1061	1473	\N	300 D453I	\N	00476	0	\N	\N	0	\N	245	76d02038-f197-4c0f-8e29-a5793ecfb541		1	1	2	\N	2022-02-18 15:51:52	2022-02-18 15:51:52			'00476':3 '300':1 'd453i':2	266	\N	\N	\N
1062	1473	\N	300 D453I	\N	00477	0	\N	\N	0	\N	245	5a0433b4-b15c-45ea-8dae-cf7a5f81431f		1	1	2	\N	2022-02-18 15:52:04	2022-02-18 15:52:04			'00477':3 '300':1 'd453i':2	266	\N	\N	\N
1063	1474	\N	301 G654S 2008	\N	03929	0	\N	\N	0	\N	82	348897c0-2d04-4137-b200-618a03d90f3f		1	1	2	\N	2022-02-18 16:12:53	2022-02-18 16:12:53			'03929':4 '2008':3 '301':1 'g654s':2	1386	\N	\N	\N
1065	1474	\N	301 G654S 2008	\N	03931	0	\N	\N	0	\N	82	8207c0cb-006c-45e5-9cc0-78fbd03b18fe		1	1	2	\N	2022-02-18 16:13:11	2022-02-18 16:13:11			'03931':4 '2008':3 '301':1 'g654s':2	1386	\N	\N	\N
1066	1474	\N	301 G654S 2008	\N	03932	0	\N	\N	0	\N	82	f916c2fd-b388-4546-b325-25b01d99be8a		1	1	2	\N	2022-02-18 16:13:19	2022-02-18 16:13:19			'03932':4 '2008':3 '301':1 'g654s':2	1386	\N	\N	\N
1067	1474	\N	301 G654S 2008	\N	03933	0	\N	\N	0	\N	82	68d9c03c-7060-428d-ba9b-9d4f73918be3		1	1	2	\N	2022-02-18 16:13:30	2022-02-18 16:13:30			'03933':4 '2008':3 '301':1 'g654s':2	1386	\N	\N	\N
1068	1474	\N	301 G654S 2008	\N	03934	0	\N	\N	0	\N	82	1fa55518-4823-4b27-9ba4-5438077195c1		1	1	2	\N	2022-02-18 16:13:38	2022-02-18 16:13:38			'03934':4 '2008':3 '301':1 'g654s':2	1386	\N	\N	\N
1064	1474	\N	301 G654S 2008	\N	03930	0	\N	\N	0	\N	82	ddd5058c-c2d3-4dcd-9b68-7ded673bee8c		1	1	2	\N	2022-02-18 16:13:02	2022-02-18 16:14:02			'03930':4 '2008':3 '301':1 'g654s':2	1386	\N	\N	\N
1069	1475	\N	300.018 A753M	\N	05298	0	\N	\N	0	\N	60	2587685c-9d6d-4031-8ed0-05b71c22d6a8		1	1	2	\N	2022-02-18 16:36:19	2022-02-18 16:36:19			'05298':3 '300.018':1 'a753m':2	1785	\N	\N	\N
1070	1475	\N	300.018 A753M	\N	05299	0	\N	\N	0	\N	60	84488073-1105-4c37-876a-6c3e1c5dc675		1	1	2	\N	2022-02-18 16:36:27	2022-02-18 16:36:27			'05299':3 '300.018':1 'a753m':2	1785	\N	\N	\N
1071	1475	\N	300.018 A753M	\N	05300	0	\N	\N	0	\N	60	aadc2099-1d53-4e28-864c-7513fa8a041c		1	1	2	\N	2022-02-18 16:36:39	2022-02-18 16:36:39			'05300':3 '300.018':1 'a753m':2	1785	\N	\N	\N
1072	1476	\N	305.234 P434Q	\N	05242	0	\N	\N	0	\N	245	bca1c7e5-62a8-4b8c-a3fd-8b88f784fa12		1	1	2	\N	2022-02-18 16:41:06	2022-02-18 16:41:06			'05242':3 '305.234':1 'p434q':2	1746	\N	\N	\N
1073	1477	\N	305.409 72	\N	05241	0	\N	\N	0	\N	135	5f224dec-9d3c-4504-8bac-c874e2355117		1	1	2	\N	2022-02-18 16:42:29	2022-02-18 16:42:29			'05241':3 '305.409':1 '72':2	1745	\N	\N	\N
1074	1478	\N	306.3 K678M	\N	05130	0	\N	\N	0	\N	245	ab7d03ec-cec1-4d99-b302-541739ec7a1c		1	1	2	\N	2022-02-18 16:44:34	2022-02-18 16:44:34			'05130':3 '306.3':1 'k678m':2	1694	\N	\N	\N
1075	1479	\N	306 E838	\N	00545	0	\N	\N	0	\N	245	9d72abf2-9c3c-4fcc-9a52-9dd10fa7a8f9		1	1	2	\N	2022-02-18 16:46:14	2022-02-18 16:46:14			'00545':3 '306':1 'e838':2	186	\N	\N	\N
125	1004	\N	001.539 K323L 1997	\N	00037	1	\N	\N	1	\N	245	4ec7147b-0505-4074-8b0c-ca2bc0b12eda		1	1	1	\N	2022-01-05 14:33:48	2022-02-19 01:49:03			'00037':4 '001.539':1 '1997':3 'k323l':2	7	\N	\N	\N
1076	1480	\N	305.43 M658P	\N	05239	0	\N	\N	0	\N	245	58e48168-0de2-48b6-9f40-b15477b72da7		1	1	2	\N	2022-02-18 16:49:57	2022-02-18 16:49:57			'05239':3 '305.43':1 'm658p':2	1743	\N	\N	\N
1078	1481	\N	301T553T 1957	\N	00488	0	\N	\N	0	\N	16	0f15f8a1-b1ef-4d15-a37a-c07399fda404		1	1	2	\N	2022-02-18 16:56:07	2022-02-18 16:56:07			'00488':3 '1957':2 '301t553t':1	144	\N	\N	\N
1079	1482	\N	302.2 G659P 1989	\N	00498	0	\N	\N	0	\N	60	5743b4b1-4374-4cf9-a0ba-8fd30e7a5e85		1	1	2	\N	2022-02-18 16:57:58	2022-02-18 16:57:58			'00498':4 '1989':3 '302.2':1 'g659p':2	194	\N	\N	\N
1080	1482	\N	302.2 G659P 1989	\N	00499	0	\N	\N	0	\N	60	aa58b9b5-911c-477b-91ef-767dcb354f03		1	1	2	\N	2022-02-18 16:58:12	2022-02-18 16:58:12			'00499':4 '1989':3 '302.2':1 'g659p':2	194	\N	\N	\N
1081	1484	\N	302.224 R637C 1994	\N	00501	0	\N	\N	0	\N	245	abdda8cd-8491-4c1f-a0d4-a993e54e38a0		1	1	2	\N	2022-02-18 17:01:03	2022-02-18 17:01:03			'00501':4 '1994':3 '302.224':1 'r637c':2	195	\N	\N	\N
1082	1484	\N	302.224 R637C 1994	\N	00502	0	\N	\N	0	\N	245	42df85f1-e6c8-4843-8997-f5ec1e0e63e8		1	1	2	\N	2022-02-18 17:01:13	2022-02-18 17:01:13			'00502':4 '1994':3 '302.224':1 'r637c':2	195	\N	\N	\N
1084	1485	\N	302.224'2 F658C 2005	\N	00504	0	\N	\N	0	\N	245	4b1b06f7-9111-44ef-a80d-b366a29f02c6		1	1	2	\N	2022-02-18 17:03:47	2022-02-18 17:03:47			'00504':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1085	1485	\N	302.224'2 F658C 2005	\N	00505	0	\N	\N	0	\N	245	cb317ab7-daac-4c3c-a06c-48235ae35926		1	1	2	\N	2022-02-18 17:04:01	2022-02-18 17:04:01			'00505':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1086	1485	\N	302.224'2 F658C 2005	\N	00506	0	\N	\N	0	\N	245	34262908-8a5b-49e4-8c90-6dde28881b3a		1	1	2	\N	2022-02-18 17:04:11	2022-02-18 17:04:11			'00506':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1083	1485	\N	302.224'2 F658C 2005	\N	00503	0	\N	\N	0	\N	245	b9505f1a-db55-4f5e-a1d1-54483c9c087b		1	1	2	\N	2022-02-18 17:03:36	2022-02-18 17:04:29			'00503':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1087	1485	\N	302.224'2 F658C 2005	\N	00827	0	\N	\N	0	\N	245	c7d56ddf-5b42-4794-9f98-49ca04a38bf2		1	1	2	\N	2022-02-18 17:04:49	2022-02-18 17:04:49			'00827':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1088	1485	\N	302.224'2 F658C 2005	\N	00934	0	\N	\N	0	\N	245	ddab7c98-26c9-490d-aae7-cb79a284670e		1	1	2	\N	2022-02-18 17:04:58	2022-02-18 17:04:58			'00934':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1089	1485	\N	302.224'2 F658C 2005	\N	01004	0	\N	\N	0	\N	245	5f835208-afec-4de4-927a-91c13319dc0d		1	1	2	\N	2022-02-18 17:05:07	2022-02-18 17:05:07			'01004':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1090	1485	\N	302.224'2 F658C 2005	\N	04356	0	\N	\N	0	\N	245	18d38315-6c1b-483c-8871-4947b5cc5216		1	1	2	\N	2022-02-18 17:05:17	2022-02-18 17:05:17			'04356':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1091	1485	\N	302.224'2 F658C 2005	\N	04357	0	\N	\N	0	\N	245	d627c580-f5f0-4eb6-b362-202e7c654636		1	1	2	\N	2022-02-18 17:05:31	2022-02-18 17:05:31			'04357':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1092	1485	\N	302.224'2 F658C 2005	\N	04358	0	\N	\N	0	\N	245	c5d5ff6f-716a-4079-9d98-f77f178e1356		1	1	2	\N	2022-02-18 17:05:41	2022-02-18 17:05:41			'04358':5 '2':2 '2005':4 '302.224':1 'f658c':3	199	\N	\N	\N
1093	1486	\N	302.23 C537	\N	00513	0	\N	\N	0	\N	179	6cb15f77-fc85-4740-a121-69f05fcd0368		1	1	2	\N	2022-02-18 17:09:04	2022-02-18 17:09:04			'00513':3 '302.23':1 'c537':2	170	\N	\N	\N
1094	1487	\N	304.6 I985A	\N	00523	0	\N	\N	0	\N	179	2ed830c7-f534-4267-9a64-dcd5e9493eb2		1	1	2	\N	2022-02-18 17:10:27	2022-02-18 17:10:27			'00523':3 '304.6':1 'i985a':2	151	\N	\N	\N
1095	1487	\N	304.6 I985A	\N	00524	0	\N	\N	0	\N	179	b1e52a9a-9b15-480c-a218-4220fd102706		1	1	2	\N	2022-02-18 17:10:39	2022-02-18 17:10:39			'00524':3 '304.6':1 'i985a':2	151	\N	\N	\N
1096	1488	\N	305.31 E535E	\N	00528	0	\N	\N	0	\N	245	2f61b649-cd78-42ed-a562-735194aaade1		1	1	2	\N	2022-02-18 17:11:40	2022-02-18 17:11:40			'00528':3 '305.31':1 'e535e':2	176	\N	\N	\N
1097	1489	\N	305.8 A544C	\N	00532	0	\N	\N	0	\N	179	15cbdd88-063f-4415-8ada-0d2960cc8832		1	1	2	\N	2022-02-18 17:13:11	2022-02-18 17:13:11			'00532':3 '305.8':1 'a544c':2	150	\N	\N	\N
1099	1489	\N	305.8 A544C	\N	00533	0	\N	\N	0	\N	179	cc3289d3-77ff-47bf-8e0d-495c5e054b3b		1	1	2	\N	2022-02-18 17:13:25	2022-02-18 17:13:25			'00533':3 '305.8':1 'a544c':2	150	\N	\N	\N
676	1331	\N	030 E525	\N	04976	2	2022-02-18 00:00:00	2022-02-18 00:00:00	2	2022-02-18 00:00:00	245	af102acd-e990-40cb-b500-9df6d363365e		1	1	2	\N	2022-02-11 13:43:53	2022-02-18 17:18:30			'030':1 '04976':3 'e525':2	1634	\N	\N	\N
1100	1490	\N	305.8 L435	\N	00534	0	\N	\N	0	\N	179	a8142211-f445-4c5e-8f0e-3b2e798e03d2		1	1	2	\N	2022-02-18 19:42:19	2022-02-18 19:42:19			'00534':3 '305.8':1 'l435':2	153	\N	\N	\N
1101	1490	\N	305.8 L435	\N	00535	0	\N	\N	0	\N	179	2d2e8df0-817d-426d-af93-a6f6dc2d67fe		1	1	2	\N	2022-02-18 19:42:34	2022-02-18 19:42:34			'00535':3 '305.8':1 'l435':2	153	\N	\N	\N
1102	1491	\N	305.8 M456	\N	00536	0	\N	\N	0	\N	179	a00fb6a3-0c20-433a-b0eb-09b330f5968d		1	1	2	\N	2022-02-18 19:46:16	2022-02-18 19:46:16			'00536':3 '305.8':1 'm456':2	158	\N	\N	\N
1103	1491	\N	305.8 M456	\N	00537	0	\N	\N	0	\N	179	29dbc712-7d76-4c42-996e-2fa8df927b8d		1	1	2	\N	2022-02-18 19:46:25	2022-02-18 19:46:25			'00537':3 '305.8':1 'm456':2	158	\N	\N	\N
1104	1491	\N	305.8 M456	\N	00538	0	\N	\N	0	\N	179	2e4009d0-aa1f-4e6d-aa98-35a82fc87ab2		1	1	2	\N	2022-02-18 19:46:43	2022-02-18 19:46:43			'00538':3 '305.8':1 'm456':2	158	\N	\N	\N
1105	1491	\N	305.8 M456	\N	00539	0	\N	\N	0	\N	179	a3d4e143-4331-4f35-94d3-e7201015dfbc		1	1	2	\N	2022-02-18 19:47:15	2022-02-18 19:47:15			'00539':3 '305.8':1 'm456':2	158	\N	\N	\N
1106	1492	\N	305.8 P358	\N	00540	0	\N	\N	0	\N	179	5915d67e-849d-40be-8be9-b7499bd11bbc		1	1	2	\N	2022-02-18 19:52:05	2022-02-18 19:52:12			'00540':3 '305.8':1 'p358':2	160	\N	\N	\N
1107	1492	\N	305.8 P358	\N	00541	0	\N	\N	0	\N	179	30ada5dc-1c06-4f76-8b17-d543ff724f6a		1	1	2	\N	2022-02-18 19:52:23	2022-02-18 19:52:23			'00541':3 '305.8':1 'p358':2	160	\N	\N	\N
1108	1493	\N	305.90694 T738C	\N	00542	0	\N	\N	0	\N	179	05c552fb-2bdc-4937-9134-f0bde31890f2		1	1	2	\N	2022-02-18 19:54:27	2022-02-18 19:54:27			'00542':3 '305.90694':1 't738c':2	157	\N	\N	\N
1109	1493	\N	305.90694 T738C	\N	00543	0	\N	\N	0	\N	179	d23f57c5-70de-4a1c-b52d-3344c8911cc4		1	1	2	\N	2022-02-18 19:54:53	2022-02-18 19:54:53			'00543':3 '305.90694':1 't738c':2	157	\N	\N	\N
1110	1494	\N	306 R637E	\N	00547	0	\N	\N	0	\N	245	0aa72c10-66de-469f-84c5-9ae70a934bf5		1	1	2	\N	2022-02-18 20:02:26	2022-02-18 20:02:26			'00547':3 '306':1 'r637e':2	178	\N	\N	\N
1111	1494	\N	306 R637E	\N	00548	0	\N	\N	0	\N	245	1a201e08-8025-4986-bb64-7c0fe078ede0		1	1	2	\N	2022-02-18 20:02:42	2022-02-18 20:02:42			'00548':3 '306':1 'r637e':2	178	\N	\N	\N
1112	1495	\N	303.44 A674 2012	\N	04552	0	\N	\N	0	\N	245	56f837e3-6074-4f27-98d6-efe6449001c5		1	1	2	\N	2022-02-18 20:10:10	2022-02-18 20:10:10			'04552':4 '2012':3 '303.44':1 'a674':2	1480	\N	\N	\N
1113	1495	\N	303.44 A674 2012	\N	04553	0	\N	\N	0	\N	245	a83e5e73-5474-461a-8447-b3b95b12bfe6		1	1	2	\N	2022-02-18 20:10:23	2022-02-18 20:10:23			'04553':4 '2012':3 '303.44':1 'a674':2	1480	\N	\N	\N
1114	1496	\N	302.2 F679M 2010	\N	04466	0	\N	\N	0	\N	57	b3b0ce3c-42ae-44bc-a91f-da08cbf9d4eb		1	1	2	\N	2022-02-18 20:14:19	2022-02-18 20:14:19			'04466':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1115	1496	\N	302.2 F679M 2010	\N	04467	0	\N	\N	0	\N	57	7c36c168-43f9-48f0-a938-06d7eee81cec		1	1	2	\N	2022-02-18 20:14:35	2022-02-18 20:14:35			'04467':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1116	1496	\N	302.2 F679M 2010	\N	04468	0	\N	\N	0	\N	57	d90ec3aa-e807-41bd-9a2e-87615b9dce58		1	1	2	\N	2022-02-18 20:14:51	2022-02-18 20:14:51			'04468':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1117	1496	\N	302.2 F679M 2010	\N	04469	0	\N	\N	0	\N	57	9517adc3-8b46-4534-9e97-da82eac86297		1	1	2	\N	2022-02-18 20:15:08	2022-02-18 20:15:08			'04469':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1118	1496	\N	302.2 F679M 2010	\N	04470	0	\N	\N	0	\N	57	dbe2fb7a-4380-4a0e-9ff8-58ed71ab33f4		1	1	2	\N	2022-02-18 20:15:20	2022-02-18 20:15:20			'04470':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1119	1496	\N	302.2 F679M 2010	\N	04471	0	\N	\N	0	\N	57	429f637a-1577-499b-9731-c0d9b259c910		1	1	2	\N	2022-02-18 20:15:30	2022-02-18 20:15:30			'04471':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1120	1496	\N	302.2 F679M 2010	\N	04472	0	\N	\N	0	\N	57	fabd5a25-6a6e-49eb-8671-63a1fd70f1dd		1	1	2	\N	2022-02-18 20:15:44	2022-02-18 20:15:44			'04472':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1121	1496	\N	302.2 F679M 2010	\N	04473	0	\N	\N	0	\N	57	8deabc1c-2468-439a-ba67-66adc47ed6ec		1	1	2	\N	2022-02-18 20:16:11	2022-02-18 20:16:11			'04473':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1122	1496	\N	302.2 F679M 2010	\N	04474	0	\N	\N	0	\N	57	6f3e5f9b-38a9-4032-88c9-d991e1e1da30		1	1	2	\N	2022-02-18 20:16:28	2022-02-18 20:16:28			'04474':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1123	1496	\N	302.2 F679M 2010	\N	04475	0	\N	\N	0	\N	57	8642184b-31ae-4040-8f8b-0cb36ad08e00		1	1	2	\N	2022-02-18 20:16:48	2022-02-18 20:16:48			'04475':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1124	1496	\N	302.2 F679M 2010	\N	04476	0	\N	\N	0	\N	57	e1a10d49-7a43-4914-af7f-b90d4326ac48		1	1	2	\N	2022-02-18 20:17:05	2022-02-18 20:17:05			'04476':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1125	1496	\N	302.2 F679M 2010	\N	04477	0	\N	\N	0	\N	57	e1e678ff-ae5c-409e-8189-d3a05b0a86a7		1	1	2	\N	2022-02-18 20:17:28	2022-02-18 20:17:28			'04477':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1126	1496	\N	302.2 F679M 2010	\N	04478	0	\N	\N	0	\N	57	d8ad5d7b-0f11-4fe4-bf8a-0bef8afe6514		1	1	2	\N	2022-02-18 20:17:45	2022-02-18 20:17:45			'04478':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1127	1496	\N	302.2 F679M 2010	\N	04479	0	\N	\N	0	\N	57	61b1b1bb-4818-4331-98f0-cb608ee46c00		1	1	2	\N	2022-02-18 20:17:54	2022-02-18 20:17:54			'04479':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1128	1496	\N	302.2 F679M 2010	\N	04480	0	\N	\N	0	\N	57	75e7a471-38ed-4419-8195-f2f3f07982ab		1	1	2	\N	2022-02-18 20:18:11	2022-02-18 20:18:11			'04480':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1129	1496	\N	302.2 F679M 2010	\N	04481	0	\N	\N	0	\N	57	3f97f9d8-f280-458f-bea1-79c644e2b32e		1	1	2	\N	2022-02-18 20:18:23	2022-02-18 20:18:23			'04481':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1130	1496	\N	302.2 F679M 2010	\N	04482	0	\N	\N	0	\N	57	6a48a12d-a7bd-4066-a1a1-40caa2182d3d		1	1	2	\N	2022-02-18 20:18:31	2022-02-18 20:18:31			'04482':4 '2010':3 '302.2':1 'f679m':2	193	\N	\N	\N
1131	1497	\N	302.23 A655D 2006	\N	00508	0	\N	\N	0	\N	68	a9ef5e13-bc67-4f31-a157-599da77c322c		1	1	2	\N	2022-02-18 20:21:54	2022-02-18 20:21:54			'00508':4 '2006':3 '302.23':1 'a655d':2	1053	\N	\N	\N
1132	1497	\N	302.23 A655D 2006	\N	00509	0	\N	\N	0	\N	68	440f762a-cbba-4335-89c4-54017e55da36		1	1	2	\N	2022-02-18 20:24:53	2022-02-18 20:24:53			'00509':4 '2006':3 '302.23':1 'a655d':2	1053	\N	\N	\N
1133	1497	\N	302.23 A655D 2006	\N	00510	0	\N	\N	0	\N	68	344617ef-fd47-497b-aa4e-4361e288dd88		1	1	2	\N	2022-02-18 20:25:08	2022-02-18 20:25:08			'00510':4 '2006':3 '302.23':1 'a655d':2	1053	\N	\N	\N
1134	1497	\N	302.23 A655D 2006	\N	00511	0	\N	\N	0	\N	68	676ca321-bc40-4449-86ec-967964d7ca88		1	1	2	\N	2022-02-18 20:25:27	2022-02-18 20:25:27			'00511':4 '2006':3 '302.23':1 'a655d':2	1053	\N	\N	\N
1135	1497	\N	302.23 A655D 2006	\N	00512	0	\N	\N	0	\N	68	f3a70f5a-5c40-4776-b0f3-c729187991db		1	1	2	\N	2022-02-18 20:25:40	2022-02-18 20:25:40			'00512':4 '2006':3 '302.23':1 'a655d':2	1053	\N	\N	\N
1136	1497	\N	302.23 A655D 2006	\N	04207	0	\N	\N	0	\N	68	62f7baf3-f274-4100-9426-2deab0cf8950		1	1	2	\N	2022-02-18 20:25:48	2022-02-18 20:25:48			'04207':4 '2006':3 '302.23':1 'a655d':2	1053	\N	\N	\N
1137	1498	\N	305.31	\N	04154	0	\N	\N	0	\N	82	057512d2-a929-426f-8e19-839a9547faf1		1	1	2	\N	2022-02-18 20:37:12	2022-02-18 20:37:12			'04154':2 '305.31':1	1421	\N	\N	\N
1138	1498	\N	305.31	\N	04155	0	\N	\N	0	\N	82	87c1de91-5b18-4734-88ab-99b05250862b		1	1	2	\N	2022-02-18 20:37:37	2022-02-18 20:37:37			'04155':2 '305.31':1	1421	\N	\N	\N
1139	1498	\N	305.31	\N	04156	0	\N	\N	0	\N	82	96b13749-1546-475b-8c2f-e580ddaccf5e		1	1	2	\N	2022-02-18 20:38:09	2022-02-18 20:39:45			'04156':2 '305.31':1	1421	\N	\N	\N
1140	1498	\N	305.31	\N	04157	0	\N	\N	0	\N	82	95ea1cfb-327b-4a4b-adbb-a2b435644eca		1	1	2	\N	2022-02-18 20:40:00	2022-02-18 20:40:00			'04157':2 '305.31':1	1421	\N	\N	\N
1141	1499	\N	302.224 P553C	\N	04004	0	\N	\N	0	\N	60	fe84f14e-fd11-4033-a60f-42fcc9848500		1	1	2	\N	2022-02-18 20:44:21	2022-02-18 20:44:21			'04004':3 '302.224':1 'p553c':2	1397	\N	\N	\N
1142	1499	\N	302.224 P553C	\N	04005	0	\N	\N	0	\N	60	c19b87d8-8b5c-4b06-a0d6-390f7c473da9		1	1	2	\N	2022-02-18 20:44:41	2022-02-18 20:44:41			'04005':3 '302.224':1 'p553c':2	1397	\N	\N	\N
1143	1499	\N	302.224 P553C	\N	04006	0	\N	\N	0	\N	60	a98bd545-9e92-46a7-aa6c-03d7ce7cb208		1	1	2	\N	2022-02-18 20:44:53	2022-02-18 20:44:53			'04006':3 '302.224':1 'p553c':2	1397	\N	\N	\N
1144	1499	\N	302.224 P553C	\N	04007	0	\N	\N	0	\N	60	a808bf26-d6d5-495f-9503-414f4d850305		1	1	2	\N	2022-02-18 20:45:23	2022-02-18 20:45:23			'04007':3 '302.224':1 'p553c':2	1397	\N	\N	\N
1145	1499	\N	302.224 P553C	\N	04008	0	\N	\N	0	\N	60	53c7f65d-a48b-473f-a25f-027a584083a3		1	1	2	\N	2022-02-18 20:45:52	2022-02-18 20:45:52			'04008':3 '302.224':1 'p553c':2	1397	\N	\N	\N
1146	1498	\N	305.31 D378O	\N	03998	0	\N	\N	0	\N	133	c02057e0-2dc9-4e1f-8bc5-13b5fee695b9		1	1	2	\N	2022-02-18 20:51:11	2022-02-18 20:51:11			'03998':3 '305.31':1 'd378o':2	1395	\N	\N	\N
1147	1498	\N	305.31 D378O	\N	03999	0	\N	\N	0	\N	82	f5275371-6552-452b-ab9e-32dd74445e41		1	1	2	\N	2022-02-18 20:51:30	2022-02-18 20:51:30			'03999':3 '305.31':1 'd378o':2	1395	\N	\N	\N
1148	1502	\N	302.3 R622C 2004	\N	00515	0	\N	\N	0	\N	245	a01e51f0-5025-4b24-8e30-a81b310ad7de		1	1	2	\N	2022-02-18 20:54:39	2022-02-18 20:54:39			'00515':4 '2004':3 '302.3':1 'r622c':2	1050	\N	\N	\N
1149	1502	\N	302.3 R622C 2004	\N	00516	0	\N	\N	0	\N	245	11e494a6-3424-41b8-9b7b-8a0b870046df		1	1	2	\N	2022-02-18 20:55:00	2022-02-18 20:55:00			'00516':4 '2004':3 '302.3':1 'r622c':2	1050	\N	\N	\N
1150	1502	\N	302.3 R622C 2004	\N	00517	0	\N	\N	0	\N	245	ed030682-ef7e-4036-81ad-c3d71bb6dff5		1	1	2	\N	2022-02-18 20:55:10	2022-02-18 20:55:10			'00517':4 '2004':3 '302.3':1 'r622c':2	1050	\N	\N	\N
1151	1502	\N	302.3 R622C 2004	\N	00518	0	\N	\N	0	\N	245	cca50188-8557-493f-9b71-a2ae17ac1bfc		1	1	2	\N	2022-02-18 20:55:27	2022-02-18 20:55:27			'00518':4 '2004':3 '302.3':1 'r622c':2	1050	\N	\N	\N
1152	1502	\N	302.3 R622C 2004	\N	00519	0	\N	\N	0	\N	245	26e60c21-1f72-40ec-a302-d7dae9174eca		1	1	2	\N	2022-02-18 20:55:46	2022-02-18 20:55:46			'00519':4 '2004':3 '302.3':1 'r622c':2	1050	\N	\N	\N
1153	1502	\N	302.3 R622C 2004	\N	03732	0	\N	\N	0	\N	245	9c61bec4-acff-42fe-90cf-406638b1041a		1	1	2	\N	2022-02-18 20:56:02	2022-02-18 20:56:02			'03732':4 '2004':3 '302.3':1 'r622c':2	1050	\N	\N	\N
1154	1503	\N	306 T535	\N	03024	0	\N	\N	0	\N	179	96eb60e2-d637-4957-b0fd-f414cc88ef90		1	1	2	\N	2022-02-18 20:58:15	2022-02-18 20:58:15			'03024':3 '306':1 't535':2	143	\N	\N	\N
1155	1504	\N	306 T535	\N	03020	0	\N	\N	0	\N	179	55cd9a94-ff71-4549-8698-ec0aa1ea7e1b		1	1	2	\N	2022-02-18 21:21:37	2022-02-18 21:21:37			'03020':3 '306':1 't535':2	142	\N	\N	\N
1156	1504	\N	306 T535	\N	03021	0	\N	\N	0	\N	179	a70da5af-3051-4371-b938-99382966b31d		1	1	2	\N	2022-02-18 21:22:03	2022-02-18 21:22:03			'03021':3 '306':1 't535':2	142	\N	\N	\N
1157	1505	\N	305.5 C558	\N	02987	0	\N	\N	0	\N	245	76050a08-745d-4530-9624-abe6a4b7cf5b		1	1	2	\N	2022-02-18 21:23:36	2022-02-18 21:23:36			'02987':3 '305.5':1 'c558':2	72	\N	\N	\N
1158	1506	\N	303.4 M456	\N	02478	0	\N	\N	0	\N	179	f4aaa468-e806-476e-b200-5b470f072a3d		1	1	2	\N	2022-02-18 21:35:56	2022-02-18 21:35:56			'02478':3 '303.4':1 'm456':2	1021	\N	\N	\N
1159	1506	\N	303.4 M456	\N	02479	0	\N	\N	0	\N	179	7ff93b2f-b33b-42ba-97a9-dd170d59bb6c		1	1	2	\N	2022-02-18 21:36:06	2022-02-18 21:36:06			'02479':3 '303.4':1 'm456':2	1021	\N	\N	\N
1160	1507	\N	303.6 A774D	\N	01104	0	\N	\N	0	\N	245	c81c5aee-c35a-4416-8a6c-3c4660724cc9		1	1	2	\N	2022-02-18 21:38:06	2022-02-18 21:38:06			'01104':3 '303.6':1 'a774d':2	555	\N	\N	\N
249	1144	\N	410 T355 1992	\N	\N	0	\N	\N	1	\N	60	d274608f-8214-4ead-8169-cb71ff1b0ce6		1	1	1	\N	2022-01-26 15:20:59	2022-02-19 01:48:19			'1992':3 '410':1 't355':2	367	\N	\N	\N
1161	1508	\N	306.3 W424E 1994	\N	00555	0	\N	\N	0	\N	16	82424c02-8123-4840-9206-7c337b87464c		1	1	2	\N	2022-02-21 17:22:57	2022-02-21 17:22:57			'00555':4 '1994':3 '306.3':1 'w424e':2	1110	\N	\N	\N
1162	1508	\N	306.3 W424E 1994	\N	00556	0	\N	\N	0	\N	16	7668a360-e7bc-4452-9930-9309c0a1dee2		1	1	2	\N	2022-02-21 17:23:10	2022-02-21 17:23:10			'00556':4 '1994':3 '306.3':1 'w424e':2	1110	\N	\N	\N
1163	1508	\N	306.3 W424E 1994	\N	00557	0	\N	\N	0	\N	16	a1519e1b-235c-4755-bb30-095034f0c81c		1	1	2	\N	2022-02-21 17:32:40	2022-02-21 17:32:40			'00557':4 '1994':3 '306.3':1 'w424e':2	1110	\N	\N	\N
1164	1508	\N	306.3 W424E 1994	\N	00558	0	\N	\N	0	\N	16	0e8b2322-c07d-416f-8ccd-648bc4574b71		1	1	2	\N	2022-02-21 17:33:05	2022-02-21 17:33:05			'00558':4 '1994':3 '306.3':1 'w424e':2	1110	\N	\N	\N
1165	1508	\N	306.3 W424E 1994	\N	00559	0	\N	\N	0	\N	16	24f443f3-7a6c-4b64-8f23-13778af1cb22		1	1	2	\N	2022-02-21 17:34:21	2022-02-21 17:34:21			'00559':4 '1994':3 '306.3':1 'w424e':2	1110	\N	\N	\N
1166	1508	\N	306.3 W424E 1994	\N	00560	0	\N	\N	0	\N	16	101f1cea-6977-4d34-8e98-14171b0d595e		1	1	2	\N	2022-02-21 17:35:34	2022-02-21 17:35:34			'00560':4 '1994':3 '306.3':1 'w424e':2	1110	\N	\N	\N
1167	1509	\N	306.3 Q855L	\N	00550	0	\N	\N	0	\N	158	e6ca8716-9bad-4310-a1b9-8e4c5e716a7c		1	1	2	\N	2022-02-21 18:27:19	2022-02-21 18:27:19			'00550':3 '306.3':1 'q855l':2	682	\N	\N	\N
1168	1509	\N	306.3 Q855L	\N	00551	0	\N	\N	0	\N	158	0e0b7de4-368c-409b-a6c3-b8e495ac5f4c		1	1	2	\N	2022-02-21 18:27:43	2022-02-21 18:27:43			'00551':3 '306.3':1 'q855l':2	682	\N	\N	\N
1169	1509	\N	306.3 Q855L	\N	00552	0	\N	\N	0	\N	158	4d5f5630-ed47-4487-9977-1ac7a69dae03		1	1	2	\N	2022-02-21 18:28:14	2022-02-21 18:28:14			'00552':3 '306.3':1 'q855l':2	682	\N	\N	\N
1170	1509	\N	306.3 Q855L	\N	00553	0	\N	\N	0	\N	158	d078a25d-b9b0-4bdf-95d9-818be1b9b6d9		1	1	2	\N	2022-02-21 18:29:26	2022-02-21 18:29:26			'00553':3 '306.3':1 'q855l':2	682	\N	\N	\N
1171	1509	\N	306.3 Q855L	\N	00554	0	\N	\N	0	\N	158	c03b972e-dce2-4f99-b3a8-ed9dce4f4eae		1	1	2	\N	2022-02-21 18:29:41	2022-02-21 18:29:41			'00554':3 '306.3':1 'q855l':2	682	\N	\N	\N
1172	1509	\N	306.3 Q855L	\N	04751	0	\N	\N	0	\N	158	a9853f54-b1c1-41ec-9723-b7f089776c22		1	1	2	\N	2022-02-21 18:29:56	2022-02-21 18:29:56			'04751':3 '306.3':1 'q855l':2	682	\N	\N	\N
1173	1509	\N	306.3 Q855L	\N	04752	0	\N	\N	0	\N	158	24838a61-fccb-4353-9cb2-3956ccba6d6f		1	1	2	\N	2022-02-21 18:30:10	2022-02-21 18:30:10			'04752':3 '306.3':1 'q855l':2	682	\N	\N	\N
1174	1509	\N	306.3 Q855L	\N	04753	0	\N	\N	0	\N	158	84d96d53-296f-4a43-8a89-804538280e2b		1	1	2	\N	2022-02-21 18:30:24	2022-02-21 18:30:24			'04753':3 '306.3':1 'q855l':2	682	\N	\N	\N
1175	1509	\N	306.3 Q855L	\N	04754	0	\N	\N	0	\N	158	d448a950-6302-4f85-85d8-2cef64a18e59		1	1	2	\N	2022-02-21 18:30:34	2022-02-21 18:30:34			'04754':3 '306.3':1 'q855l':2	682	\N	\N	\N
1176	1509	\N	306.3 Q855L	\N	04755	0	\N	\N	0	\N	158	3f582df9-bd9a-4f9c-a26f-7df18ed01514		1	1	2	\N	2022-02-21 18:31:21	2022-02-21 18:31:21			'04755':3 '306.3':1 'q855l':2	682	\N	\N	\N
1177	1510	\N	306.345 F355	\N	00561	0	\N	\N	0	\N	245	5c04616e-cbbe-42ab-88f2-cf866ee7030e		1	1	2	\N	2022-02-21 18:43:08	2022-02-21 18:43:08			'00561':3 '306.345':1 'f355':2	163	\N	\N	\N
1178	1513	\N	306.76	\N	00565	0	\N	\N	0	\N	245	41a0816f-f303-4aad-9b3e-93fba201bbbd		1	1	2	\N	2022-02-21 18:53:18	2022-02-21 18:53:18			'00565':2 '306.76':1	155	\N	\N	\N
1179	1514	\N	320 L 553L	\N	00566	0	\N	\N	0	\N	135	0b1f02eb-967a-4517-bcaf-1124fae02497		1	1	2	\N	2022-02-21 18:56:40	2022-02-21 18:56:40			'00566':4 '320':1 '553l':3 'l':2	190	\N	\N	\N
1180	1515	\N	312.23 A385T	\N	05243	0	\N	\N	0	\N	135	6c3b4bcd-008c-4ce5-a87c-0311e56385eb		1	1	2	\N	2022-02-21 19:00:21	2022-02-21 19:00:21			'05243':3 '312.23':1 'a385t':2	1747	\N	\N	\N
1181	1516	\N	320 P745	\N	00567	0	\N	\N	0	\N	245	8e8fa9ae-02c7-4a48-b8a2-9f2372cf1191		1	1	2	\N	2022-02-21 20:18:36	2022-02-21 20:18:36			'00567':3 '320':1 'p745':2	283	\N	\N	\N
1182	1517	\N	320.11 A537T 2003	\N	00568	0	\N	\N	0	\N	64	a537e380-5ce2-4f11-8dc7-420120eb1bc2		1	1	2	\N	2022-02-21 20:21:57	2022-02-21 20:21:57			'00568':4 '2003':3 '320.11':1 'a537t':2	162	\N	\N	\N
1184	1518	\N	320.85 A724	\N	00570	0	\N	\N	0	\N	245	b1d1841f-fbc3-4a0a-b411-751ee777b497		1	1	2	\N	2022-02-21 20:25:14	2022-02-21 20:25:14			'00570':3 '320.85':1 'a724':2	184	\N	\N	\N
1185	1518	\N	320.85 A724	\N	00571	0	\N	\N	0	\N	245	4e7520b2-ce8b-4ff8-9ff6-0981054efa6c		1	1	2	\N	2022-02-21 20:26:55	2022-02-21 20:26:55			'00571':3 '320.85':1 'a724':2	184	\N	\N	\N
1186	1518	\N	320.85 A724	\N	00572	0	\N	\N	0	\N	245	858e9280-0998-4e36-8c4c-c0e1b85b5ab9		1	1	2	\N	2022-02-21 20:27:16	2022-02-21 20:27:16			'00572':3 '320.85':1 'a724':2	184	\N	\N	\N
1187	1518	\N	320.85 A724	\N	00573	0	\N	\N	0	\N	245	022c0fab-5f6c-4d3e-b044-91e89f1f756d		1	1	2	\N	2022-02-21 20:27:28	2022-02-21 20:27:28			'00573':3 '320.85':1 'a724':2	184	\N	\N	\N
1188	1518	\N	320.85 A724	\N	00574	0	\N	\N	0	\N	245	9501b8b9-5755-404a-82db-751391c1a6e2		1	1	2	\N	2022-02-21 20:27:39	2022-02-21 20:27:39			'00574':3 '320.85':1 'a724':2	184	\N	\N	\N
1189	1518	\N	320.85 A724	\N	00575	0	\N	\N	0	\N	245	c57c299a-bab8-4ac6-a8a6-bc90b2265b32		1	1	2	\N	2022-02-21 20:27:50	2022-02-21 20:27:50			'00575':3 '320.85':1 'a724':2	184	\N	\N	\N
1190	1519	\N	320.854 E964	\N	00576	0	\N	\N	0	\N	245	4d313a71-b999-4328-8bc4-44fc15101077		1	1	2	\N	2022-02-22 14:27:45	2022-02-22 14:27:45			'00576':3 '320.854':1 'e964':2	185	\N	\N	\N
1193	1520	\N	320.9 E884	\N	00578	0	\N	\N	0	\N	258	1e9d9ea4-7a53-41ef-8cbf-4d319ae0635b		1	1	2	\N	2022-02-22 14:37:59	2022-02-22 14:40:54			'00578':3 '320.9':1 'e884':2	181	\N	\N	\N
1191	1520	\N	320.9 E884	\N	00577	0	\N	\N	0	\N	258	cef0996b-92d7-4f29-b639-d9a065e7bb63		1	1	2	\N	2022-02-22 14:37:03	2022-02-22 14:41:00			'00577':3 '320.9':1 'e884':2	181	\N	\N	\N
1194	1520	\N	320.9 E884	\N	00579	0	\N	\N	0	\N	258	21c5ade2-b000-4b53-aef3-344624c8f92f		1	1	2	\N	2022-02-22 14:41:19	2022-02-22 14:41:19			'00579':3 '320.9':1 'e884':2	181	\N	\N	\N
1195	1520	\N	320.9 E884	\N	00580	0	\N	\N	0	\N	258	228155bd-246c-455a-9176-af3cdcf85b6d		1	1	2	\N	2022-02-22 14:41:31	2022-02-22 14:41:31			'00580':3 '320.9':1 'e884':2	181	\N	\N	\N
1196	1520	\N	320.9 E884	\N	00581	0	\N	\N	0	\N	258	5efb0a7a-ab02-46dd-a9fe-f182522a67b2		1	1	2	\N	2022-02-22 14:41:44	2022-02-22 14:41:44			'00581':3 '320.9':1 'e884':2	181	\N	\N	\N
1197	1520	\N	320.9 E884	\N	00582	0	\N	\N	0	\N	258	accb5675-ab6b-4b8a-abb1-3a37bec5fce8		1	1	2	\N	2022-02-22 14:41:58	2022-02-22 14:41:58			'00582':3 '320.9':1 'e884':2	181	\N	\N	\N
1198	1520	\N	320.9 E884	\N	00583	0	\N	\N	0	\N	258	0d6dd666-e416-4bdc-b9b9-61f09f85b46f		1	1	2	\N	2022-02-22 14:42:09	2022-02-22 14:42:09			'00583':3 '320.9':1 'e884':2	181	\N	\N	\N
1199	1520	\N	320.9 E884	\N	00584	0	\N	\N	0	\N	258	77c4ab0e-f502-4d53-a11a-d67089b5de3b		1	1	2	\N	2022-02-22 14:42:54	2022-02-22 14:42:54			'00584':3 '320.9':1 'e884':2	181	\N	\N	\N
1200	1520	\N	320.9 E884	\N	00585	0	\N	\N	0	\N	258	40e08bfb-092d-43b7-be2e-6830ca96aa5b		1	1	2	\N	2022-02-22 14:43:15	2022-02-22 14:43:15			'00585':3 '320.9':1 'e884':2	181	\N	\N	\N
1201	1520	\N	320.9 E884	\N	00586	0	\N	\N	0	\N	258	39c4b302-43df-453b-8153-e6a5a4c745d5		1	1	2	\N	2022-02-22 14:53:00	2022-02-22 14:53:00			'00586':3 '320.9':1 'e884':2	181	\N	\N	\N
1202	1520	\N	320.9 E884	\N	04544	0	\N	\N	0	\N	258	972c892f-cd51-4870-a0fa-d8c968b7fb1a		1	1	2	\N	2022-02-22 14:53:12	2022-02-22 14:53:12			'04544':3 '320.9':1 'e884':2	181	\N	\N	\N
1203	1520	\N	320.9 E884	\N	04545	0	\N	\N	0	\N	258	9f9a437d-fe78-4e81-8509-9ad05b9543ea		1	1	2	\N	2022-02-22 14:53:25	2022-02-22 14:53:25			'04545':3 '320.9':1 'e884':2	181	\N	\N	\N
1204	1520	\N	320.9 E884	\N	04546	0	\N	\N	0	\N	258	c479e1ab-9366-49e4-a423-378fadfb0cb9		1	1	2	\N	2022-02-22 14:53:36	2022-02-22 14:53:36			'04546':3 '320.9':1 'e884':2	181	\N	\N	\N
1205	1520	\N	320.9 E884	\N	04547	0	\N	\N	0	\N	258	4809d9a3-c5b3-4c3f-abb3-2c96b0a4b251		1	1	2	\N	2022-02-22 14:53:46	2022-02-22 14:53:46			'04547':3 '320.9':1 'e884':2	181	\N	\N	\N
1206	1521	\N	321.5 N344F	\N	00587	0	\N	\N	0	\N	179	c5e7a79e-0d7d-42bb-8fa6-23f4a7f8f47d		1	1	2	\N	2022-02-22 15:09:13	2022-02-22 15:09:13			'00587':3 '321.5':1 'n344f':2	180	\N	\N	\N
1207	1521	\N	321.5 N344F	\N	00588	0	\N	\N	0	\N	179	e7981229-0a24-4ad0-a65e-6ced6f982958		1	1	2	\N	2022-02-22 15:09:29	2022-02-22 15:09:29			'00588':3 '321.5':1 'n344f':2	180	\N	\N	\N
1209	1522	\N	322.1 R637A	\N	03591	0	\N	\N	0	\N	259	c05684bd-d4f9-4b65-bb67-6174d6afb3d4		1	1	2	\N	2022-02-22 15:11:17	2022-02-22 15:12:53			'03591':3 '322.1':1 'r637a':2	187	\N	\N	\N
1208	1522	\N	322.1 R637A	\N	00589	0	\N	\N	0	\N	259	a9b4a98d-2c37-44ea-bb37-0431ed4282fd		1	1	2	\N	2022-02-22 15:11:06	2022-02-22 15:13:03			'00589':3 '322.1':1 'r637a':2	187	\N	\N	\N
1210	1523	\N	323 R683E	\N	00590	0	\N	\N	0	\N	245	6662d919-b094-4fe4-83db-1480d2822a50		1	1	2	\N	2022-02-22 15:19:47	2022-02-22 15:19:47			'00590':3 '323':1 'r683e':2	269	\N	\N	\N
1211	1523	\N	323 R683E	\N	00591	0	\N	\N	0	\N	245	7eb22686-b814-43ca-873c-d0b10bbb289e		1	1	2	\N	2022-02-22 15:19:59	2022-02-22 15:19:59			'00591':3 '323':1 'r683e':2	269	\N	\N	\N
1212	1523	\N	323 R683E	\N	00592	0	\N	\N	0	\N	245	f0573868-eca8-4e97-ac6e-3b354237dcdb		1	1	2	\N	2022-02-22 15:20:11	2022-02-22 15:20:11			'00592':3 '323':1 'r683e':2	269	\N	\N	\N
1213	1523	\N	323 R683E	\N	00593	0	\N	\N	0	\N	245	8e520d0e-0343-4e53-8c79-0575cacd5edc		1	1	2	\N	2022-02-22 15:20:23	2022-02-22 15:20:23			'00593':3 '323':1 'r683e':2	269	\N	\N	\N
1214	1523	\N	323 R683E	\N	00594	0	\N	\N	0	\N	245	e930170d-d98e-4d50-afec-f73be724ed11		1	1	2	\N	2022-02-22 15:20:33	2022-02-22 15:20:33			'00594':3 '323':1 'r683e':2	269	\N	\N	\N
1215	1523	\N	323 R683E	\N	00595	0	\N	\N	0	\N	245	45efd01d-d198-4265-a00b-e36b437888b0		1	1	2	\N	2022-02-22 15:20:48	2022-02-22 15:20:48			'00595':3 '323':1 'r683e':2	269	\N	\N	\N
1216	1523	\N	323 R683E	\N	00596	0	\N	\N	0	\N	245	350dc3a0-c6a2-48bc-a782-3f8d2a87c568		1	1	2	\N	2022-02-22 15:21:02	2022-02-22 15:21:02			'00596':3 '323':1 'r683e':2	269	\N	\N	\N
1217	1524	\N	323 R645C	\N	00597	0	\N	\N	0	\N	179	1aef755a-936f-46e9-b093-1755e3af54dc		1	1	2	\N	2022-02-22 15:23:23	2022-02-22 15:23:23			'00597':3 '323':1 'r645c':2	301	\N	\N	\N
1218	1526	\N	325.3 M335	\N	00600	0	\N	\N	0	\N	239	27d526e0-2dfd-4b7e-b975-6fcaa6c75147		1	1	2	\N	2022-02-22 15:27:01	2022-02-22 15:27:01			'00600':3 '325.3':1 'm335':2	159	\N	\N	\N
1220	1526	\N	325.3 M335	\N	00601	0	\N	\N	0	\N	239	7f10e597-b8c9-4741-884d-a2c5391446ac		1	1	2	\N	2022-02-22 15:27:31	2022-02-22 15:27:31			'00601':3 '325.3':1 'm335':2	159	\N	\N	\N
\.


--
-- TOC entry 4194 (class 0 OID 19388)
-- Dependencies: 218
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
462	1320	462	\N	\N	\N
463	1321	463	\N	\N	\N
464	1322	464	\N	\N	\N
465	1323	465	\N	\N	\N
466	1324	466	\N	\N	\N
467	1325	467	\N	\N	\N
468	1326	468	\N	\N	\N
469	1327	469	\N	\N	\N
470	1328	470	\N	\N	\N
471	1329	471	\N	\N	\N
472	1330	472	\N	\N	\N
473	1331	473	\N	\N	\N
474	1332	474	\N	\N	\N
475	1333	475	\N	\N	\N
476	1334	476	\N	\N	\N
477	1335	477	\N	\N	\N
478	1336	478	\N	\N	\N
479	1337	479	\N	\N	\N
480	1338	480	\N	\N	\N
481	1339	481	\N	\N	\N
482	1340	482	\N	\N	\N
483	1341	483	\N	\N	\N
484	1342	484	\N	\N	\N
485	1343	485	\N	\N	\N
486	1344	486	\N	\N	\N
487	1346	487	\N	\N	\N
488	1347	488	\N	\N	\N
489	1348	489	\N	\N	\N
491	1349	491	\N	\N	\N
492	1350	492	\N	\N	\N
493	1351	493	\N	\N	\N
494	1352	494	\N	\N	\N
495	1353	495	\N	\N	\N
496	1354	496	\N	\N	\N
498	1355	498	\N	\N	\N
499	1356	499	\N	\N	\N
500	1357	500	\N	\N	\N
501	1358	501	\N	\N	\N
502	1359	502	\N	\N	\N
503	1360	503	\N	\N	\N
504	1361	504	\N	\N	\N
505	1362	505	\N	\N	\N
506	1363	506	\N	\N	\N
507	1364	507	\N	\N	\N
508	1365	508	\N	\N	\N
509	1366	509	\N	\N	\N
510	1367	510	\N	\N	\N
511	1368	511	\N	\N	\N
512	1369	512	\N	\N	\N
513	1370	513	\N	\N	\N
514	1371	514	\N	\N	\N
515	1372	515	\N	\N	\N
516	1373	516	\N	\N	\N
517	1374	517	\N	\N	\N
518	1375	518	\N	\N	\N
519	1376	519	\N	\N	\N
520	1377	520	\N	\N	\N
521	1378	521	\N	\N	\N
522	1379	522	\N	\N	\N
523	1380	523	\N	\N	\N
525	1381	525	\N	\N	\N
526	1382	526	\N	\N	\N
527	1383	527	\N	\N	\N
528	1384	528	\N	\N	\N
529	1385	529	\N	\N	\N
530	1386	530	\N	\N	\N
531	1387	531	\N	\N	\N
532	1388	532	\N	\N	\N
533	1389	533	\N	\N	\N
534	1390	534	\N	\N	\N
535	1391	535	\N	\N	\N
536	1392	536	\N	\N	\N
537	1393	537	\N	\N	\N
538	1394	538	\N	\N	\N
539	1395	539	\N	\N	\N
540	1396	540	\N	\N	\N
541	1397	541	\N	\N	\N
542	1398	542	\N	\N	\N
543	1399	543	\N	\N	\N
544	1400	544	\N	\N	\N
545	1401	545	\N	\N	\N
547	1401	547	\N	\N	\N
548	1403	548	\N	\N	\N
549	1404	549	\N	\N	\N
550	1405	550	\N	\N	\N
551	1406	551	\N	\N	\N
552	1407	552	\N	\N	\N
553	1408	553	\N	\N	\N
554	1409	554	\N	\N	\N
555	1410	555	\N	\N	\N
556	1411	556	\N	\N	\N
557	1412	557	\N	\N	\N
558	1413	558	\N	\N	\N
559	1414	559	\N	\N	\N
560	1415	560	\N	\N	\N
561	1416	561	\N	\N	\N
562	1417	562	\N	\N	\N
563	1418	563	\N	\N	\N
564	1419	564	\N	\N	\N
565	1420	565	\N	\N	\N
566	1421	566	\N	\N	\N
567	1422	567	\N	\N	\N
568	1423	568	\N	\N	\N
569	1424	569	\N	\N	\N
570	1425	570	\N	\N	\N
571	1186	571	\N	\N	\N
572	1426	572	\N	\N	\N
573	1427	573	\N	\N	\N
574	1428	574	\N	\N	\N
575	1429	575	\N	\N	\N
576	1430	576	\N	\N	\N
577	1431	577	\N	\N	\N
578	1432	578	\N	\N	\N
579	1433	579	\N	\N	\N
580	1434	580	\N	\N	\N
581	1435	581	\N	\N	\N
582	1436	582	\N	\N	\N
583	1437	583	\N	\N	\N
584	1438	584	\N	\N	\N
585	1439	585	\N	\N	\N
586	1440	586	\N	\N	\N
587	1441	587	\N	\N	\N
588	1442	588	\N	\N	\N
589	1443	589	\N	\N	\N
590	1444	590	\N	\N	\N
592	1445	592	\N	\N	\N
593	1431	593	\N	\N	\N
594	1446	594	\N	\N	\N
595	1447	595	\N	\N	\N
596	1448	596	\N	\N	\N
597	1449	597	\N	\N	\N
598	1450	598	\N	\N	\N
599	1451	599	\N	\N	\N
600	1452	600	\N	\N	\N
601	1453	601	\N	\N	\N
602	1454	602	\N	\N	\N
603	1455	603	\N	\N	\N
604	1456	604	\N	\N	\N
605	1457	605	\N	\N	\N
606	1458	606	\N	\N	\N
607	1459	607	\N	\N	\N
608	1460	608	\N	\N	\N
609	1461	609	\N	\N	\N
610	1462	610	\N	\N	\N
611	1463	611	\N	\N	\N
612	1464	612	\N	\N	\N
613	1465	613	\N	\N	\N
614	1466	614	\N	\N	\N
615	1467	615	\N	\N	\N
616	1468	616	\N	\N	\N
617	1469	617	\N	\N	\N
618	1470	618	\N	\N	\N
619	1471	619	\N	\N	\N
620	1472	620	\N	\N	\N
622	1473	622	\N	\N	\N
623	1474	623	\N	\N	\N
624	1475	624	\N	\N	\N
625	1476	625	\N	\N	\N
626	1477	626	\N	\N	\N
627	1478	627	\N	\N	\N
628	1479	628	\N	\N	\N
629	1480	629	\N	\N	\N
630	1481	630	\N	\N	\N
631	1482	631	\N	\N	\N
632	1483	632	\N	\N	\N
633	1484	633	\N	\N	\N
635	1485	635	\N	\N	\N
636	1486	636	\N	\N	\N
637	1487	637	\N	\N	\N
638	1488	638	\N	\N	\N
639	1489	639	\N	\N	\N
640	1490	640	\N	\N	\N
641	1491	641	\N	\N	\N
642	1492	642	\N	\N	\N
643	1493	643	\N	\N	\N
644	1494	644	\N	\N	\N
645	1495	645	\N	\N	\N
646	1496	646	\N	\N	\N
647	1497	647	\N	\N	\N
648	1498	648	\N	\N	\N
649	1499	649	\N	\N	\N
650	1498	650	\N	\N	\N
651	1502	651	\N	\N	\N
652	1503	652	\N	\N	\N
653	1504	653	\N	\N	\N
654	1505	654	\N	\N	\N
655	1506	655	\N	\N	\N
657	1507	657	\N	\N	\N
658	1508	658	\N	\N	\N
659	1509	659	\N	\N	\N
660	1510	660	\N	\N	\N
661	1513	661	\N	\N	\N
662	1514	662	\N	\N	\N
663	1515	663	\N	\N	\N
664	1516	664	\N	\N	\N
665	1517	665	\N	\N	\N
666	1518	666	\N	\N	\N
667	1519	667	\N	\N	\N
668	1520	668	\N	\N	\N
669	1521	669	\N	\N	\N
670	1522	670	\N	\N	\N
671	1523	671	\N	\N	\N
672	1524	672	\N	\N	\N
673	1526	673	\N	\N	\N
\.


--
-- TOC entry 4196 (class 0 OID 19395)
-- Dependencies: 220
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
1108	381	DICCIONARIO DE LITERATURA MEXICANA SIGLO XX	PEREIRA, ARMANDO Y ALBARRAN,CLAUDIA			764,765	1	1	1	245	2			\N	2022-01-24 15:53:26	2022-01-24 15:53:26	'albarr':10 'armand':8 'claudi':11 'diccionari':1 'literatur':3 'mexican':4 'pereir':7 'sigl':5 'xx':6
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
68	67	ESPANOL 2	REYES HERRERA, SARA				1	1	1	48	2			\N	2021-10-04 18:03:11	2021-10-04 18:03:11	'2':2 'espanol':1 'herrer':4 'rey':3 'sar':5
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
1337	27	MICROSOFT WORKS REFERENCIA	MICROSOFT CORPORATION			00196	1	1	1	245	2			\N	2022-02-11 14:35:01	2022-02-11 14:35:01	'corporation':5 'microsoft':1,4 'referent':3 'works':2
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
66	66	CAMINOS DEL ESPANOL 2	MUNGUIA ZATARAIN , IRMA				1	1	1	48	2			\N	2021-10-04 18:00:47	2021-10-04 18:00:47	'2':4 'camin':1 'espanol':3 'irma':7 'mungui':5 'zatarain':6
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
1320		PROBLEMAS SOCIALES, POLITICOS Y ECONOMICOS DE MEXI	BAENA PAZ, GUILLERMINA			02716,02717	1	1	1	245	2			\N	2022-02-11 00:00:04	2022-02-11 00:00:04	'baen':8 'econom':5 'guillermin':10 'mexi':7 'paz':9 'polit':3 'problem':1 'social':2
1340	1458	HACIA LA UNIVERSIDAD DEL SIGLO XXI	UNIVERSIDAD JUAREZ AUTONOMA DE TABASCO			04248	1	1	1	245	2			\N	2022-02-11 15:49:29	2022-02-11 15:49:29	'autonom':9 'haci':1 'juarez':8 'sigl':5 'tabasc':11 'univers':3,7 'xxi':6
1341	1457	EDUCARC CON VALOR: EL DESAFIO DE LA EDUCACION SUPE	PALACIOS BLANCO, JOSE LUIS			04246,04247	1	1	1	245	2			\N	2022-02-11 16:04:12	2022-02-11 16:04:12	'blanc':11 'desafi':5 'educacion':8 'educarc':1 'jos':12 'luis':13 'palaci':10 'sup':9 'valor':3
1342	304	LA UNIVERSIDAD EN LA ERA DE LA GLOBALIZACION NEOLI	OLMEDO, RAUL			02737	1	1	1	245	2			\N	2022-02-11 16:05:43	2022-02-11 16:05:43	'globalizacion':8 'neoli':9 'olmed':10 'raul':11 'univers':2
1343	154	JORNADA ACADEMICA CHIAPAS A PARTIR DE ACTEAL	IZQUIERDO,ANA LUISA			02735,02736	1	1	1	179	2			\N	2022-02-11 16:06:50	2022-02-11 16:06:50	'academ':2 'acteal':7 'ana':9 'chiap':3 'izquierd':8 'jorn':1 'luis':10 'part':5
1344	300	FERNANDEZ DE LIZARDI. UN EDUCADOR PARA UN PUEBLO	HERNANDEZ GARCIA, JESUS			02731,02732,02733,02734	1	1	1	245	2			\N	2022-02-11 16:08:46	2022-02-11 16:08:46	'educ':5 'fernandez':1 'garci':10 'hernandez':9 'jesus':11 'lizardi':3 'puebl':8
977	904	ACCIONES Y REFLEXIONES PARA LA RECONSTRUCCIÓN DE LA POLÍTICA SOCIAL EN MÉXICO. UNA MIRADA DESDE LO LOCAL	COGCO CALDERON, ADOLFO ROGELIO				1	1	1	239	2			\N	2021-12-09 14:54:03	2021-12-09 14:54:39	'accion':1 'adolf':20 'calderon':19 'cogc':18 'local':17 'mexic':12 'mir':14 'polit':9 'reconstruccion':6 'reflexion':3 'rogeli':21 'social':10
1079	1490	PROMOCION TURISTICA: UN ENFOQUE METODOLOGICO.	ACERENZA, MIGUEL ANGEL			4581,4582,4583	1	1	1	245	2			\N	2022-01-15 00:40:32	2022-01-15 00:40:32	'acerenz':6 'angel':8 'enfoqu':4 'metodolog':5 'miguel':7 'promocion':1 'turist':2
1148	370	EL KANJOBAL DE SAN MIGUEL ACATAN	ZABALA, ROBERTO			3203,3204	1	1	1	179	2			\N	2022-01-26 15:34:32	2022-01-26 15:34:32	'acat':6 'kanjobal':2 'miguel':5 'robert':8 'san':4 'zabal':7
1229	1113	GRAMMAR IN USE INTERMEDIATE	MURPHY, RAYMOND Y SMALZER, WILLIAM R.			3000,3001,3002,3003	1	1	1	245	2			\N	2022-02-03 14:14:18	2022-02-03 14:14:18	'gramm':1 'in':2 'intermediat':4 'murphy':5 'r':10 'raymond':6 'smalz':8 'use':3 'william':9
1253	902	A COMMUNICATIVE COURSE IN ENGLISH STUDENT BOOK 3	WARSHAWASKY, DIANE WITH H. BYRD, DONALD R.			902,903	1	1	1	245	2			\N	2022-02-04 14:21:30	2022-02-04 14:21:30	'3':8 'book':7 'byrd':13 'communicativ':2 'cours':3 'dian':10 'donald':14 'english':5 'h':12 'in':4 'r':15 'student':6 'warshawasky':9 'with':11
1289	26	DESARROLLO DE APLICACIONES CON ACCESS 2000	HENTZEN,WHIL			00192	1	1	1	245	2			\N	2022-02-09 13:52:46	2022-02-09 13:52:46	'2000':6 'access':5 'aplic':3 'desarroll':1 'hentz':7 'whil':8
1304	737	ADMINISTRACION MODERNA DE HOTELES Y MOTELES	LATTIN, GERALD W.			02681,02682,02683,02684,02685,02686	1	1	1	60	2			\N	2022-02-10 13:40:03	2022-02-10 13:40:03	'administracion':1 'gerald':8 'hotel':4 'lattin':7 'modern':2 'motel':6 'w':9
35	35	ESPANOL 1	CARRUS TREVINO, LUZ AMELIA				1	1	1	51	2			\N	2021-10-04 16:40:29	2021-10-04 16:40:29	'1':2 'ameli':6 'carrus':3 'espanol':1 'luz':5 'trevin':4
36	36	ESPANOL 1	CARRASCO, ALMA				1	1	1	66	2			\N	2021-10-04 16:45:35	2021-10-04 16:45:35	'1':2 'alma':4 'carrasc':3 'espanol':1
1321	1078	PROBLEMAS SOCIOECONOMICOS DE MEXICO Y SUS SOLUCION	PAZOS, LUIS			02718,02719,02720,02721,02722,02723,02724,	1	1	1	245	2			\N	2022-02-11 00:02:19	2022-02-11 00:02:19	'luis':9 'mexic':4 'paz':8 'problem':1 'socioeconom':2 'solucion':7
1346	299	CICERON: CUESTIONES ACADEMICAS	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			02729,02730	1	1	1	245	2			\N	2022-02-12 00:53:44	2022-02-12 00:53:44	'academ':3 'autonom':6 'ciceron':1 'cuestion':2 'mexic':8 'nacional':5 'univers':4
978	2618	ACERCA DEL ARTE POPULAR	POMAR, MARIA TERESA				1	1	1	136	2			\N	2021-12-09 15:01:56	2021-12-09 15:01:56	'acerc':1 'arte':3 'mari':6 'pom':5 'popul':4 'teres':7
1080	1493	AGENCIAS DE VIAJES: OPERACION Y PLAN DE NEGOCIOS	ACERENZA, MIGUEL ANGEL			4590,4591,4592,4773,4774,4775,	1	1	1	60	2			\N	2022-01-15 00:43:15	2022-01-15 00:43:15	'acerenz':9 'agenci':1 'angel':11 'miguel':10 'negoci':8 'operacion':4 'plan':6 'viaj':3
1254	446	A COMMUNICATIVE COURSE IN ENGLISH STUDENT BOOK 4	WARSHAWSKY, DIANE WITH H. BYRD, DONALD R.			904,905	1	1	1	245	2			\N	2022-02-04 14:23:59	2022-02-04 14:23:59	'4':8 'book':7 'byrd':13 'communicativ':2 'cours':3 'dian':10 'donald':14 'english':5 'h':12 'in':4 'r':15 'student':6 'warshawsky':9 'with':11
1290	19	DBASE III PLUS HERRAMIENTAS PODEROSAS	KRUMM, ROB			00195	1	1	1	245	2			\N	2022-02-09 14:10:50	2022-02-09 14:10:50	'dbas':1 'herramient':4 'iii':2 'krumm':6 'plus':3 'poder':5 'rob':7
1305	312	CONTRATOS MERCANTILES	LEON TOVAR, SOYLA H.			03043,03044	1	1	1	64	2			\N	2022-02-10 13:46:47	2022-02-10 13:46:47	'contrat':1 'h':6 'leon':3 'mercantil':2 'soyl':5 'tov':4
1322	275	ANTROPOLOGIA DE LA POBREZA CINCO FAMILIAS	FONDO DE CULTURA ECONOMICA			02725	1	1	1	245	2			\N	2022-02-11 00:05:58	2022-02-11 00:05:58	'antropologi':1 'cinc':5 'cultur':9 'econom':10 'famili':6 'fond':7 'pobrez':4
37	37	ESPANOL 1	HERNANDEZ SANDOVAL , ADRIANA				1	1	1	52	2			\N	2021-10-04 16:48:30	2021-10-04 16:48:30	'1':2 'adrian':5 'espanol':1 'hernandez':3 'sandoval':4
1347	305	LA EDUCACION TECNICA EN PUEBLA: LA ENSENANZA DE LA	BENEMERITA UNIVERSIDAD AUTONOMA DE PUEBLA			02727	1	1	1	245	2			\N	2022-02-12 00:55:26	2022-02-12 00:56:01	'autonom':12 'benemerit':10 'educacion':2 'ensen':7 'puebl':5,14 'tecnic':3 'univers':11
979	1209	ACNÉ JUVENIL: PUNTO Y APARTE	SCHWARSTZBERG, JESSE SNOWFLAKE				1	1	1	240	2			\N	2021-12-09 15:12:45	2021-12-09 15:13:12	'acne':1 'apart':5 'jess':7 'juvenil':2 'punt':3 'schwarstzberg':6 'snowflak':8
1255	441	A COMMUNICATIVE COURSE IN ENGLISH WORKBOOK 1	ABRAMS, SHARON / P. REIN, DAVID / H. BYRD, DONALD			894,895	1	1	1	245	2			\N	2022-02-04 14:26:18	2022-02-04 14:26:18	'1':7 'abrams':8 'byrd':14 'communicativ':2 'cours':3 'dav':12 'donald':15 'english':5 'h':13 'in':4 'p':10 'rein':11 'sharon':9 'workbook':6
1291	12	ARQUITECTURA DE COMPUTADORAS	MORRIS MANO, M.			00197,00198	1	1	1	245	2			\N	2022-02-09 14:23:33	2022-02-09 14:23:33	'arquitectur':1 'comput':3 'm':6 'man':5 'morris':4
1306	1365	CODIGO DE COMERCIO LEYES Y REGLAMENTOS COMPLEMENTA	CODIGO DE COMERCIO LEYES Y REGLAMENTOS COMPLEMENTA			03803,03804,03805,03806,03807,04148	1	1	1	245	2			\N	2022-02-10 14:17:08	2022-02-10 14:17:08	'codig':1,8 'comerci':3,10 'complement':7,14 'ley':4,11 'reglament':6,13
1323	1378	CONTAMINACION AMBIENTAL POR METALES PESADOS IMPECT	CERVANTES, CARLOS Y MORENO SANCHEZ, RAFAEL			02726,03895,03896,03897,03898,	1	1	1	245	2			\N	2022-02-11 00:07:34	2022-02-11 00:07:34	'ambiental':2 'carl':8 'cervant':7 'contaminacion':1 'impect':6 'metal':4 'moren':10 'pes':5 'rafael':12 'sanchez':11
38	38	ESPANOL 1	PASTOR, BLANCA				1	1	1	48	2			\N	2021-10-04 16:49:26	2021-10-04 16:49:26	'1':2 'blanc':4 'espanol':1 'pastor':3
39	39	ESPANOL 1: CUADERNO DE TRABAJO	RIVERA LOPEZ SARA				1	1	1	66	2			\N	2021-10-04 16:50:05	2021-10-04 16:50:05	'1':2 'cuadern':3 'espanol':1 'lopez':7 'river':6 'sar':8 'trabaj':5
980	2804	ACRÍLICO: EJERCICIOS PARRAMÓN	CANAL, MARIA FERNANDA				1	1	1	234	2			\N	2021-12-09 18:35:27	2021-12-09 18:35:27	'acril':1 'canal':4 'ejercici':2 'fernand':6 'mari':5 'parramon':3
1256	443	A COMMUNICATIVE COURSE IN ENGLISH WORKBOOK 2	ABRAMS, SHARON / P. REIN, DAVID / H. BYRD DONALD R			898,899	1	1	1	245	2			\N	2022-02-04 14:28:39	2022-02-04 14:28:39	'2':7 'abrams':8 'byrd':14 'communicativ':2 'cours':3 'dav':12 'donald':15 'english':5 'h':13 'in':4 'p':10 'r':16 'rein':11 'sharon':9 'workbook':6
1292	15	MICROSOFT INTERNET EXPLORER 5.0	STEPHEN L. NELSON			00199	1	1	1	245	2			\N	2022-02-09 14:26:43	2022-02-09 14:26:43	'5.0':4 'explor':3 'internet':2 'l':6 'microsoft':1 'nelson':7 'steph':5
1307	1366	LEYES Y CODIGOS DE MEXICO LEY DEL IMPUESTO SOBRE L	LEYES Y CODIGOS DE MEXICO LEY DEL IMPUESTO SOBRE L			03808,03809,03810,03811,03812	1	1	1	82	2			\N	2022-02-10 14:30:59	2022-02-10 14:31:36	'codig':3,13 'impuest':8,18 'l':10,20 'ley':1,6,11,16 'mexic':5,15
1324	891	NORMA OFICIAL MEXICANA NOM-001-SEDE-1999	ALFAOMEGA			04394,04395	2	1	1	245	2			\N	2022-02-11 00:09:56	2022-02-11 00:09:56	'-001':5 '-1999':7 'alfaomeg':8 'mexican':3 'nom':4 'norm':1 'oficial':2 'sed':6
40	40	EL NUEVO UNIVERSO DE LAS LETRAS 1	CHAVEZ GONZALEZ PEDRO TEOBALDO				1	1	1	65	2			\N	2021-10-04 16:50:54	2021-10-04 16:50:54	'1':7 'chavez':8 'gonzalez':9 'letr':6 'nuev':2 'pedr':10 'teobald':11 'univers':3
981	2803	ACUARELA: 101 TECNICAS	CANAL, MARIA FERNANDA				1	1	1	234	2			\N	2021-12-09 18:44:19	2021-12-09 18:44:19	'101':2 'acuarel':1 'canal':4 'fernand':6 'mari':5 'tecnic':3
1257	444	A COMMUNICATIVE COURSE IN ENGLISH WORKBOOK 3	P. REIN, DAVID Y H. BYRD, DONALD R.			900,901	1	1	1	245	2			\N	2022-02-04 15:24:34	2022-02-08 14:11:20	'3':7 'byrd':13 'communicativ':2 'cours':3 'dav':10 'donald':14 'english':5 'h':12 'in':4 'p':8 'r':15 'rein':9 'workbook':6
1308	1737	LEY 2013 ISR E IETU	LEY 2013 ISR E IETU			05229,05230	1	1	1	245	2			\N	2022-02-10 14:37:35	2022-02-10 14:37:35	'2013':2,7 'ietu':5,10 'isr':3,8 'ley':1,6
1325	1646	SEGURIDAD INDUSTRIAL Y ADMINISTRACION DE LA SALUD	ASFAHL,C. RAY			05015,05016,05017	1	1	1	245	2			\N	2022-02-11 00:11:47	2022-02-11 00:11:47	'administracion':4 'asfahl':8 'c':9 'industrial':2 'ray':10 'salud':7 'segur':1
41	41	PALABRAS SIN FRONTERA 1	RIVERO REYNA,FRANCISCO				1	1	1	65	2			\N	2021-10-04 16:51:46	2021-10-04 16:51:46	'1':4 'francisc':7 'fronter':3 'palabr':1 'reyn':6 'river':5
982	2108	ADDH. NIÑOS CON DEFICIT DE ATENCIÓN E HIPERACTIVIDAD: ¿UNA PATOLOGÍA DE MERCADO?	BENASAYAG, LEON				1	1	1	165	2			\N	2021-12-09 18:54:17	2021-12-09 18:54:17	'addh':1 'atencion':6 'benasayag':13 'deficit':4 'hiperact':8 'leon':14 'merc':12 'niñ':2 'patolog':10
1309	1733	REDES LOCALES	RAYAS, JOSE LUIS			05225	1	1	1	213	2			\N	2022-02-10 15:12:42	2022-02-10 15:12:42	'jos':4 'local':2 'luis':5 'ray':3 'red':1
42	42	ESPANOL 1 : NUEVOS HORIZONTES	ARCINIEGA RANGEL, MA. ESTELA				1	1	1	65	2			\N	2021-10-04 16:52:14	2021-10-04 16:52:14	'1':2 'arcinieg':5 'espanol':1 'estel':8 'horizont':4 'ma':7 'nuev':3 'rangel':6
1326	1744	COMO NEGOCIAN LAS MUJERES SUS DERECHOS EN EL MUNDO	COMO NEGOCIAN LAS MUJERES SUS DERECHOS EN EL MUNDO			05240	1	1	1	245	2			\N	2022-02-11 00:13:34	2022-02-11 00:13:34	'derech':6,15 'mujer':4,13 'mund':9,18 'negoci':2,11
43	43	ESPANOL 1	LOZANO,  LUCERO				1	1	1	62	2			\N	2021-10-04 16:53:13	2021-10-04 16:53:13	'1':2 'espanol':1 'lozan':3 'lucer':4
186	201	IMAGEN COOL	GORDOA,  ALVARO				1	1	1	84	2			\N	2021-10-05 16:53:09	2021-10-05 16:53:26	'alvar':4 'cool':2 'gordo':3 'imag':1
983	2405	ADMINISTRACION	STONERSTONER, JAMES A. F., JAMES A. F.				1	1	1	75	2			\N	2021-12-09 19:09:52	2021-12-09 19:09:52	'administracion':1 'f':5,8 'jam':3,6 'stonerston':2
1327	1631	CRIMINALISTICA ACTUAL: LEY, CIENCIA Y ARTE	CRIMINALISTICA ACTUAL: LEY, CIENCIA Y ARTE			04965,04966,04967,04968,	1	1	1	245	2			\N	2022-02-11 00:15:22	2022-02-11 00:15:22	'actual':2,8 'arte':6,12 'cienci':4,10 'criminalist':1,7 'ley':3,9
44	44	ESPANOL 1: VERSION PRELIMINAR	VITAL, ALBERTO				1	1	1	62	2			\N	2021-10-04 16:54:29	2021-10-04 16:54:29	'1':2 'albert':6 'espanol':1 'prelimin':4 'version':3 'vital':5
45	45	ESPANOL 1	VALLE GUERRERO,  ESTELA DEL				1	1	1	66	2			\N	2021-10-04 16:57:37	2021-10-04 16:57:37	'1':2 'espanol':1 'estel':5 'guerrer':4 'vall':3
984	2390	ADMINISTRACIÓN DE RECURSOS HUMANOS: ENFOQUE LATINOAMERICANO	DESSLER, GARY				1	1	1	55	2			\N	2021-12-09 19:12:56	2021-12-09 19:12:56	'administr':1 'dessl':7 'enfoqu':5 'gary':8 'human':4 'latinoamerican':6 'recurs':3
1328	1632	ENCICLOPEDIA CRIMINALISTICA, CRIMINOLOGIA E INVEST	ENCICLOPEDIA CRIMINALISTICA, CRIMINOLOGIA E INVEST			04969,04970,04971,04972,	1	1	1	245	2			\N	2022-02-11 00:19:33	2022-02-11 00:19:33	'criminalist':2,7 'criminologi':3,8 'enciclopedi':1,6 'invest':5,10
215	229	SOCIOLOGIA	.				1	1	1	61	2			\N	2021-10-05 17:42:26	2021-10-05 17:42:26	'sociologi':1
985	2404	ADMINISTRACIÓN: ESCUELAS, PROCESO ADMINISTRATIVO, ÁREAS FUNCIONALES Y DESARROLLO EMPRENDEDOR	MUNCH, LOURDES				1	1	1	75	2			\N	2021-12-09 20:02:07	2021-12-09 20:02:07	'administr':1,4 'are':5 'desarroll':8 'emprendedor':9 'escuel':2 'funcional':6 'lourd':11 'munch':10 'proces':3
1329	1673	ENCICLOPEDIA PRACTICA DE VENTAS	GRUPO CULRURAL			05093	1	1	1	245	2			\N	2022-02-11 13:32:57	2022-02-11 13:32:57	'culrural':6 'enciclopedi':1 'grup':5 'practic':2 'vent':4
205	220	SOCIOLOGIA 2	AMEZCUA CARDIEL,HECTOR				1	1	1	49	2			\N	2021-10-05 17:21:50	2021-10-05 17:21:50	'2':2 'amezcu':3 'cardiel':4 'hector':5 'sociologi':1
986	899	ADOLESCENCIA ENTRE MUROS: ESCUELA SECUNDARIA Y LA CONSTRUCCIÓN DE IDENTIDADES JUVENILES	REYES JUAREZ, ALEJANDRO				1	1	1	113	2			\N	2021-12-09 20:09:12	2021-12-09 20:09:12	'adolescent':1 'alejandr':14 'construccion':8 'escuel':4 'ident':10 'juarez':13 'juvenil':11 'mur':3 'rey':12 'secundari':5
1330	1636	ENCICLOPEDIA DEL EMPRESARIO	GRUPO OCEANO			04978	1	1	1	106	2			\N	2022-02-11 13:38:16	2022-02-11 13:38:16	'empresari':3 'enciclopedi':1 'grup':4 'ocean':5
987	2135	ADOLESCENCIA, TUTORIAS Y ESCUELA: TRABAJO PARTICIPATIVO Y PROMOCIÓN DE LA SALUD	JUNGMAN, EVA				1	1	1	165	2			\N	2021-12-09 20:20:16	2021-12-09 20:20:16	'adolescent':1 'escuel':4 'eva':13 'jungm':12 'particip':6 'promocion':8 'salud':11 'trabaj':5 'tutori':2
1331	1634	ENCICLOPEDIA DE LA AUDITORIA	GRUPO OCEANO			04976	1	1	1	245	2			\N	2022-02-11 13:42:34	2022-02-11 13:42:34	'auditori':4 'enciclopedi':1 'grup':5 'ocean':6
46	46	ESPANOL 1: PRIMER GRADO	PRAXEDIS MONTES, NIEVES				1	1	1	67	2			\N	2021-10-04 16:58:39	2021-10-04 16:58:39	'1':2 'espanol':1 'grad':4 'mont':6 'niev':7 'praxedis':5 'prim':3
47	47	ESPANOL 1	GARCIA CARDENAS, LIDIA				1	1	1	67	2			\N	2021-10-04 17:03:16	2021-10-04 17:03:16	'1':2 'carden':4 'espanol':1 'garci':3 'lidi':5
853	806	ADOLESCENTES 50 CASOS PROBLEMÁTICOS: ANÁLISIS PSICOLÓGICO Y PROPUESTAS EDUCATIVAS	NUEVO GONZALEZ, ELISEO				1	1	1	192	2			\N	2021-10-18 19:27:29	2021-12-09 20:37:30	'50':2 'adolescent':1 'analisis':5 'cas':3 'educ':9 'elise':12 'gonzalez':11 'nuev':10 'problemat':4 'propuest':8 'psicolog':6
1332	1327	MASTER BIBLIOTECA PRACTICA DE COMUNICACION: AUTODO	GRUPO OCEANO			04400,04401,04402	1	1	1	106	2			\N	2022-02-11 13:46:32	2022-02-11 13:46:32	'autod':6 'bibliotec':2 'comunicacion':5 'grup':7 'mast':1 'ocean':8 'practic':3
826	780	ADOLESCENTES, MALOS ROLLOS, COMPLEJOS Y COMEDURAS DE LOCO	MARCELLI, DANIEL				2	1	1	182	2			\N	2021-10-18 18:36:10	2021-12-09 20:51:25	'adolescent':1 'comedur':6 'complej':4 'daniel':10 'loc':8 'mal':2 'marcelli':9 'roll':3
1333	1140	ENCICLOPEDIA DE LA CIENCIA Y DE LA TECNICA	ENCICLOPEDIA DE LA CIENCIA Y DE LA TECNICA			00264,00264,00265,00266,00267,00268,00269,00270,	1	1	1	245	2			\N	2022-02-11 13:52:06	2022-02-11 13:52:06	'cienci':4,12 'enciclopedi':1,9 'tecnic':8,16
988	2695	ADOLFO BARNATAN	SIN AUTOR				1	1	1	108	2			\N	2021-12-09 20:56:46	2021-12-09 20:56:46	'adolf':1 'autor':4 'barnat':2
1334	1144	ALFA NAUTA	ALFA NAUTA: PROGRAMA EDUCATIVO TEMATICO			00256,00257,00258,00259,00260,00261,00262,00263,04250	1	1	1	245	2			\N	2022-02-11 14:00:35	2022-02-11 14:04:25	'alfa':1,3 'educ':6 'naut':2,4 'program':5 'temat':7
1335	1142	ENCICLOPEDIA ILUSTRADA PARA EL ESTUDIANTE	ENCICLOPEDIA ILUSTRADA PARA EL ESTUDIANTE			00255	1	1	1	64	2			\N	2022-02-11 14:10:32	2022-02-11 14:10:32	'enciclopedi':1,6 'estudi':5,10 'ilustr':2,7
112	113	COMUNICATE EN ESPANOL 3	DIAZ DE LEON, SANDRA				1	1	1	65	2			\N	2021-10-05 13:21:47	2021-10-05 13:21:47	'3':4 'comunicat':1 'diaz':5 'espanol':3 'leon':7 'sandr':8
990	2541	ADVERTENCIAS AMORALES AL LECTOR Y CIERTO TIPO DE CUENTOS SUMAMENTE INOCENTES	LILLE FUENTES, MARIO DE				1	1	1	242	2			\N	2021-12-10 13:34:28	2021-12-10 13:37:32	'advertent':1 'amoral':2 'ciert':6 'cuent':9 'fuent':13 'inocent':11 'lector':4 'lill':12 'mari':14 'sum':10 'tip':7
101	100	REDACCION Y ORTOGRAFIA 1 ; CUADERNO DE TRABAJO	LOZANO, LUCERO				1	1	1	62	2			\N	2021-10-05 12:53:19	2021-10-05 13:19:01	'1':4 'cuadern':5 'lozan':8 'lucer':9 'ortografi':3 'redaccion':1 'trabaj':7
1336	34	DICCIONARIO DE LA LENGUA ESPANOLA	REAL ACADEMIA ESPANOLA			00221,00222,00223,00224,00225,00226,00227,00228,00229,00230,	1	1	1	245	2			\N	2022-02-11 14:26:24	2022-02-11 14:26:24	'academi':7 'diccionari':1 'espanol':5,8 'lengu':4 'real':6
991	1327	AGUA QUEMADA: CUARTETO	FUENTES, CARLOS				1	1	1	5	2			\N	2021-12-10 13:48:04	2021-12-10 13:48:04	'agu':1 'carl':5 'cuartet':3 'fuent':4 'quem':2
48	48	ESPANOL 2:CUADERNO DE TRABAJO	FERNANDEZ FUENTES, MARIA ISABEL				1	1	1	66	2			\N	2021-10-04 17:05:22	2021-10-04 17:05:22	'2':2 'cuadern':3 'espanol':1 'fernandez':6 'fuent':7 'isabel':9 'mari':8 'trabaj':5
49	49	ESPANOL : CODIGO 1	OCHOA, DE TERESA ADRIANA				1	1	1	50	2			\N	2021-10-04 17:07:16	2021-10-04 17:07:16	'1':3 'adrian':7 'codig':2 'espanol':1 'ocho':4 'teres':6
267	280	BIOLOGIA 2:UN ENFOQUE CONSTRUCTIVISTA	GAMA FUERTES,MARIA DE LOS ANGELES				1	1	1	75	2			\N	2021-10-06 12:32:22	2021-10-06 12:32:32	'2':2 'angel':11 'biologi':1 'constructiv':5 'enfoqu':4 'fuert':7 'gam':6 'mari':8
268	281	EDUCACION PARA LA SALUD	SALAS CUEVAS,CONSUELO B.				1	1	1	75	2			\N	2021-10-06 12:33:07	2021-10-06 12:33:07	'b':8 'consuel':7 'cuev':6 'educacion':1 'sal':5 'salud':4
269	282	QUIMICA I:UN ENFOQUE CONSTRUCTIVISTA	SIN AUTOR				1	1	1	75	2			\N	2021-10-06 12:34:13	2021-10-06 14:00:54	'autor':7 'constructiv':5 'enfoqu':4 'i':2 'quimic':1
345	337	DICCIONARIO ESCOLAR DE LA LENGUA ESPANOLA	SIN AUTOR				1	1	1	48	2			\N	2021-10-06 17:13:56	2021-10-06 17:13:56	'autor':8 'diccionari':1 'escol':2 'espanol':6 'lengu':5
992	2631	AH, LAS HISTORIAS CONOCIDAS	SOLIS CALVILLO, ANTONIO				1	1	1	136	2			\N	2021-12-10 13:52:28	2021-12-10 13:52:28	'ah':1 'antoni':7 'calvill':6 'conoc':4 'histori':3 'solis':5
1338	22	EL ARTE DE PROGRAMAR ORDENADORES ALGORITMOS FUNDAM	KNUTH, DONALD E.			00193,00194	1	1	1	251	2			\N	2022-02-11 14:41:46	2022-02-11 14:41:46	'algoritm':6 'arte':2 'donald':9 'fundam':7 'knuth':8 'orden':5 'program':4
993	2214	AHI VIENE LA PLAGA: VIRUS EMERGENTES, EPIDEMIAS Y PANDEMIAS	LOZANO, MARIO E.				1	1	1	40	2			\N	2021-12-10 14:03:03	2021-12-10 14:03:03	'ahi':1 'emergent':6 'epidemi':7 'lozan':10 'mari':11 'pandemi':9 'plag':4 'vien':2 'virus':5
1339	9	APLICACION PRACTICA DE LA COMPUTADORA	CENTRO DE COMPUTACION PROFESIONAL DE MEXICO			00184	2	1	1	245	2			\N	2022-02-11 15:05:05	2022-02-11 15:05:05	'aplicacion':1 'centr':6 'comput':5 'computacion':8 'mexic':11 'practic':2 'profesional':9
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
796	751	ETICA DE URGENCIA	SAVATER, FERNANDO				1	1	1	10	2			\N	2021-10-18 12:50:19	2021-10-28 19:41:27	'etic':1 'fern':5 'savat':4 'urgenci':3
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
594	574	EDAD MEDIA EN EUROPA	FRIAS, JORGE				1	1	1	48	2			\N	2021-10-13 13:55:01	2021-10-13 13:55:01	'edad':1 'europ':4 'fri':5 'jorg':6 'medi':2
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
1348	1749	ACERCA DEL HOMBRE EN VIKTOR FRANKAL	FREIRE, JOSE BENIGNO			05245	1	1	1	245	2			\N	2022-02-15 15:34:16	2022-02-15 15:34:16	'acerc':1 'benign':9 'frankal':6 'freir':7 'hombr':3 'jos':8 'viktor':5
1349	1755	RELACIONES HUMANAS: POSITIVAS-EL ARTE DE LLEVARSE	PEREYRA, MARIO				1	1	1	245	2			\N	2022-02-15 15:36:17	2022-02-15 15:36:17	'arte':6 'human':2 'llev':8 'mari':10 'pereyr':9 'posit':4 'positivas-el':3 'relacion':1
1350	1065	PROGRAMACION EN C	GOTTFRIED, BYRON S.			00272,00273,00274,00275,00276,00277,00278,00279,	1	1	1	245	2			\N	2022-02-15 15:41:50	2022-02-15 15:41:50	'byron':5 'c':3 'gottfri':4 'programacion':1 's':6
1351	1754	EL CAMINO DE LA FELICIDAD: ESTRATEGIAS PARA EL EXI	VALDIVIA, MIGUEL A.			05250	2	1	1	245	2			\N	2022-02-15 15:45:47	2022-02-15 15:45:47	'camin':2 'estrategi':6 'exi':9 'felic':5 'miguel':11 'valdivi':10
1352	05249	VIVIR PARA TRIUNFAR: HACIA LA CUMBRE DEL EXITO	CORTES A., FELIX			05249	1	1	1	245	2			\N	2022-02-15 19:03:37	2022-02-15 19:03:37	'cort':9 'cumbr':6 'exit':8 'felix':11 'haci':4 'triunf':3 'viv':1
1353	1795	ESTRES POSTRAUMATICO	DOMINGUEZ TREJO, BENJAMIN			05337,05338	1	1	1	60	2			\N	2022-02-15 19:05:31	2022-02-15 19:05:31	'benjamin':5 'dominguez':3 'estres':1 'postraumat':2 'trej':4
1354	1311	MEMORIA XXX ANIVERSARIO DEL CENTRO DE ESTUDIOS CLA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			04548,04549	1	1	1	179	2			\N	2022-02-15 19:08:35	2022-02-15 19:08:35	'aniversari':3 'autonom':11 'centr':5 'cla':8 'estudi':7 'memori':1 'mexic':13 'nacional':10 'univers':9 'xxx':2
1355	1456	ESCENARIO DEL DUQUE JOB	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			04244,04245	1	1	1	179	2			\N	2022-02-15 19:11:16	2022-02-15 19:11:16	'autonom':7 'duqu':3 'escenari':1 'job':4 'mexic':9 'nacional':6 'univers':5
1356	1449	TRES SIGLOS: MEMORIA DEL PRIMER COLOQUIO "LETRAS D	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			04234,04235	1	1	1	179	2			\N	2022-02-15 19:15:56	2022-02-15 19:15:56	'autonom':11 'coloqui':6 'd':8 'letr':7 'memori':3 'mexic':13 'nacional':10 'prim':5 'sigl':2 'tres':1 'univers':9
1357	414	MEMORIA XX ANIVERSARIO DEL SEMINARIO DE POETICA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00282,00283	1	1	1	179	2			\N	2022-02-15 19:18:37	2022-02-15 19:18:37	'aniversari':3 'autonom':10 'memori':1 'mexic':12 'nacional':9 'poetic':7 'seminari':5 'univers':8 'xx':2
1358	128	TERCER CONGRESO INTERNACIONAL DE MAYISTAS MEMORIA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO UNIVERSIDA			00284,00285	1	1	1	179	2			\N	2022-02-15 19:20:46	2022-02-15 19:20:46	'autonom':9 'congres':2 'internacional':3 'mayist':5 'memori':6 'mexic':11 'nacional':8 'terc':1 'univers':7,12
1359	125	MISCELANEA MUSEOLOGICA	UNIVERSIDAD DEL PAIS VASCO			00288	1	1	1	245	2			\N	2022-02-15 19:24:24	2022-02-15 19:24:24	'miscelane':1 'museolog':2 'pais':5 'univers':3 'vasc':6
1360	121	EL MUSEO Y SUS FETICHES	GUIDIERI, REMO			00289	1	1	1	245	2			\N	2022-02-15 20:36:58	2022-02-15 20:36:58	'fetich':5 'guidieri':6 'muse':2 'rem':7
1361	291	MACROECONOMIA, VERSION PARA LATINOAMERICA	PARKIN, MICHAEL			02422,02423,02424,02425,02426,02427,02428,02429,02430,02490,	1	1	1	245	2			\N	2022-02-15 20:42:53	2022-02-15 20:42:53	'latinoamer':4 'macroeconomi':1 'michael':6 'parkin':5 'version':2
1362	118	LA GESTION DEL MUSEO	MOORE, KEVIN			00292	1	1	1	245	2			\N	2022-02-15 20:57:52	2022-02-15 20:57:52	'gestion':2 'kevin':6 'moor':5 'muse':4
1363	127	ESTRATEGIAS Y MARKETING DE MUSEOS	KOTLER,NEIL Y PHILIP			00293	1	1	1	245	2			\N	2022-02-16 13:29:45	2022-02-16 13:29:51	'estrategi':1 'kotl':6 'marketing':3 'muse':5 'neil':7 'philip':9
1364	126	ESTUDIOS DE VISITANTES EN MUSEOS: METODOLOGIA Y AP	PEREZ SANTOS,ELOISA			00295	1	1	1	245	2			\N	2022-02-16 13:32:22	2022-02-16 13:32:22	'ap':8 'elois':11 'estudi':1 'metodologi':6 'muse':5 'perez':9 'sant':10 'visit':3
1365	123	ORAGANIZACION Y DISENO DE EXPOSICIONES	BELCHER, MICHAEL			00296	1	1	1	245	2			\N	2022-02-16 13:33:52	2022-02-16 13:33:52	'belch':6 'disen':3 'exposicion':5 'michael':7 'oraganizacion':1
1366	39	DISCURSO PRELIMINAR DE LA ENCICLOPEDIA , INVESTIGA	D&#039;ALEMBERT, JEAN LE ROND			00301	1	1	1	245	2			\N	2022-02-16 13:38:50	2022-02-16 13:38:58	'alembert':8 'd':7 'discurs':1 'enciclopedi':5 'investig':6 'jean':9 'prelimin':2 'rond':11
1367	44	INTERPRETA EN FILOSOFIA, UN ESTUDIO CONTEMPORANEO	MARTINEZ DE LA ESCALERA, ANA MARIA			00303,00304	1	1	1	245	2			\N	2022-02-16 13:40:34	2022-02-16 13:40:34	'ana':11 'contemporane':6 'escaler':10 'estudi':5 'filosofi':3 'interpret':1 'mari':12 'martinez':7
1368	38	LA AGONIA DE PROTEO	NICOL, EDUARDO			00309,00310	1	1	1	245	2			\N	2022-02-16 13:41:56	2022-02-16 13:41:56	'agoni':2 'eduard':6 'nicol':5 'prote':4
1369	49	TEORIA DEL CONOCIMIENTO	HESSEN, J.			00315	1	1	1	178	2			\N	2022-02-16 13:44:16	2022-02-16 13:44:16	'conoc':3 'hess':4 'j':5 'teori':1
1370	50	SEDIENTA SOLEDAD TREINTA Y SEIS CARTAS A BERNARDO	TORRES BODET, JAIME			00316,00317	1	1	1	245	2			\N	2022-02-16 13:45:46	2022-02-16 13:45:46	'bernard':8 'bodet':10 'cart':6 'jaim':11 'sedient':1 'seis':5 'soled':2 'torr':9 'treint':3
1371	47	HERMENEUTICA, PSICOANALISIS Y LITERATURA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00318,00319	1	1	1	245	2			\N	2022-02-16 13:47:41	2022-02-16 13:47:41	'autonom':7 'hermeneut':1 'literatur':4 'mexic':9 'nacional':6 'psicoanalisis':2 'univers':5
1372	48	PERSPECTIVAS Y HORIZONTES DE LA HERMENEUTICA EN LA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00320,00321	1	1	1	179	2			\N	2022-02-16 13:49:39	2022-02-16 13:51:06	'autonom':11 'hermeneut':6 'horizont':3 'mexic':13 'nacional':10 'perspect':1 'univers':9
1373	53	TOPICOS DE FILOSOFIA Y LENGUAJE	BEUCHOT, MAURICIO			00322,00323	1	1	1	179	2			\N	2022-02-16 13:51:48	2022-02-16 13:51:48	'beuchot':6 'filosofi':3 'lenguaj':5 'maurici':7 'topic':1
1374	89	LA FILOSOFIA DE LA TRANSCENDENCIA ( SELECTAE DISSE	EGUIARA Y EGUREN, JUAN JOSE			00324,00325	1	1	1	179	2			\N	2022-02-16 13:53:27	2022-02-16 13:53:27	'diss':7 'egui':8 'egur':10 'filosofi':2 'jos':12 'juan':11 'selecta':6 'transcendent':5
1375	88	LECCIONES DE FILOSOFIA	FERNANDEZ DEL RINCON, JOSE IGNACIO			00326,00327	1	1	1	179	2			\N	2022-02-16 13:58:32	2022-02-16 13:58:32	'fernandez':4 'filosofi':3 'ignaci':8 'jos':7 'leccion':1 'rincon':6
1376	51	LA MENTE EN LAS RELACIONES HUMANAS	CUSTER, DAN			00328	1	1	1	73	2			\N	2022-02-16 14:00:08	2022-02-16 14:00:08	'cust':7 'dan':8 'human':6 'ment':2 'relacion':5
1377	1061	LOS 7 HABITOS DE LOS ADOLESCENTES ALTAMENTE EFECTI	COBEY, SEAN			00385,00386	1	1	1	15	2			\N	2022-02-16 14:04:46	2022-02-16 14:04:46	'7':2 'adolescent':6 'alt':7 'cobey':9 'efecti':8 'habit':3
1378	1118	EL 8º HABITO DE LA EFECTIVIDAD A LA GRANDEZA	COVEY, STEPHEN R.			00387,00388	1	1	1	245	2			\N	2022-02-16 14:06:35	2022-02-16 14:06:35	'8º':2 'covey':10 'efect':6 'grandez':9 'habit':3 'r':12 'steph':11
1379	1062	LOS 7 HABITOS DE LA GENTE ALTAMENTE EFECTIVA	COVEY, STEPHEN R.			00389,00389	1	1	1	245	2			\N	2022-02-16 14:08:24	2022-02-16 14:08:24	'7':2 'alt':7 'covey':9 'efect':8 'gent':6 'habit':3 'r':11 'steph':10
1380	1280	PALABRAS DE AGRADECIMIENTO PREMIO ADORNO	DERRIDA, JACQUES			03416,03417	1	1	1	245	2			\N	2022-02-16 14:10:38	2022-02-16 14:10:38	'adorn':5 'agradec':3 'derr':6 'jacqu':7 'palabr':1 'premi':4
1381	310	CURSO DE REDACCION DINAMICA	BASULTO, HILDA			02747,02748	1	1	1	57	2			\N	2022-02-16 15:27:14	2022-02-16 15:27:14	'basult':5 'curs':1 'dinam':4 'hild':6 'redaccion':3
1382	2741	REDACCION PARA UNIVERSITARIOS	AMARO, MANUEL JAVIER			02741,02742,02743,02744,02745,02746,03462,03463,03766,03814,04178,02741,02742,02743,02744,02745,02746,03462,03463,03766,03814,04178,	1	1	1	57	2			\N	2022-02-16 15:41:57	2022-02-16 15:41:57	'amar':4 'javi':6 'manuel':5 'redaccion':1 'universitari':3
1383	308	REDACCION SIN DOLOR, APRENDA A ESCRIBIR CON CLARID	COHEN, SANDRO			02749,02751	1	1	1	32	2			\N	2022-02-16 15:51:21	2022-02-16 15:51:21	'aprend':4 'clar':8 'coh':9 'dolor':3 'escrib':6 'redaccion':1 'sandr':10
1384	1074	REDACCION Y ESTILO: UNA GUIA PARA EVITAR LOS ERROR	METZ, M.L.			02763,02764,02765,02766,	1	1	1	60	2			\N	2022-02-16 15:53:24	2022-02-16 15:53:24	'error':9 'estil':3 'evit':7 'gui':5 'm.l':11 'metz':10 'redaccion':1
1385	212	ADMINISTRAR EL TIEMPO	QUESADA CASTILLO.ROCIO			02767	1	1	1	57	2			\N	2022-02-16 15:55:59	2022-02-16 15:55:59	'administr':1 'castillo.rocio':5 'ques':4 'tiemp':3
1386	202	ELABORAR MAPAS CONCEPTUALES	QUESADA CASTILLO,ROCIO			02768	1	1	1	57	2			\N	2022-02-17 13:57:19	2022-02-17 13:57:19	'castill':5 'conceptual':3 'elabor':1 'map':2 'ques':4 'roci':6
1387	205	ESCUCHAR CON ATENCION Y TOMAR APUNTES	QUESADA CASTILLO,ROCIO				1	1	1	57	2			\N	2022-02-17 13:59:04	2022-02-17 13:59:04	'apunt':6 'atencion':3 'castill':8 'escuch':1 'ques':7 'roci':9 'tom':5
1388	206	ELABORAR GUIAS DE ESTUDIO	QUESADA CASTILLO,ROCIO			02772	1	1	1	57	2			\N	2022-02-17 14:10:05	2022-02-17 14:10:05	'castill':6 'elabor':1 'estudi':4 'gui':2 'ques':5 'roci':7
1389	213	ELABORAR RESUMENES Y CUADROS SINOPTICOS	QUESADA CASTILLO,ROCIO			02773	1	1	1	57	2			\N	2022-02-17 14:14:45	2022-02-17 14:14:45	'castill':7 'cuadr':4 'elabor':1 'ques':6 'resumen':2 'roci':8 'sinopt':5
1390	214	ELABORAR MAPAS MENTALES	QUESADA CASTILLO,ROCIO			02774	1	1	1	57	2			\N	2022-02-17 14:17:02	2022-02-17 14:17:02	'castill':5 'elabor':1 'map':2 'mental':3 'ques':4 'roci':6
1391	210	FOMENTAR LA AUTORREGULACION	QUESADA CASTILLO,ROCIO			02775	1	1	1	57	2			\N	2022-02-17 14:19:21	2022-02-17 14:19:30	'autorregulacion':3 'castill':5 'foment':1 'ques':4 'roci':6
1392	204	LEER PARA APRENDER	QUESADA CASTILLO,ROCIO			02776	1	1	1	57	2			\N	2022-02-17 14:30:40	2022-02-17 14:30:40	'aprend':3 'castill':5 'leer':1 'ques':4 'roci':6
1393	207	PREPARAR EXAMENES	QUESADA CASTILLO,ROCIO			02787	1	1	1	57	2			\N	2022-02-17 14:32:52	2022-02-17 14:32:52	'castill':4 'examen':2 'prepar':1 'ques':3 'roci':5
1394	208	PREPARAR INFORMES ESCRITOS	QUESADA CASTILLO, ROCIO			02788	1	1	1	57	2			\N	2022-02-17 14:34:23	2022-02-17 14:34:23	'castill':5 'escrit':3 'inform':2 'prepar':1 'ques':4 'roci':6
1395	209	PREPARAR INFORMES ORALES	QUESADA CASTILLO,ROCIO			02789	1	1	1	57	2			\N	2022-02-17 14:35:36	2022-02-17 14:35:36	'castill':5 'inform':2 'oral':3 'prepar':1 'ques':4 'roci':6
1396	211	USAR LA BIBLIOTECA Y OTROS RECURSOS DE APRENDIZAJE	QUESADA CASTILLO,ROCIO			02790	1	1	1	57	2			\N	2022-02-17 14:37:04	2022-02-17 14:37:04	'aprendizaj':8 'bibliotec':3 'castill':10 'ques':9 'recurs':6 'roci':11 'usar':1
1397	203	MEJORAR LA MEMORIA	QUESADA CASTILLO,ROCIO			02792	1	1	1	57	2			\N	2022-02-17 14:38:24	2022-02-17 14:38:24	'castill':5 'mejor':1 'memori':3 'ques':4 'roci':6
1398	1079	REDACCION	SAAD, ANTONIO MIGUEL			02793,02794,02795,02796,02797,02798	1	1	1	245	2			\N	2022-02-17 14:40:18	2022-02-17 14:40:18	'antoni':3 'miguel':4 'redaccion':1 'saad':2
1399	307	REDACCION DESDE CUESTIONES GRAMATICALES HASTA EL I	SAAD, ANTONIO MIGUEL			02799,02810,02811,02812,02813,02814,03978,03979,03980,03981,03982,03983,	1	1	1	166	2			\N	2022-02-17 14:43:22	2022-02-17 14:43:22	'antoni':9 'cuestion':3 'gramatical':4 'i':7 'miguel':10 'redaccion':1 'saad':8
1400	309	CURSO DE REDACCION	VIVALDI,GONZALO MARTIN			02815,02816	1	1	1	245	2			\N	2022-02-17 15:11:22	2022-02-17 15:11:22	'curs':1 'gonzal':5 'martin':6 'redaccion':3 'vivaldi':4
1401	1507	MANUAL DE PUBLICACIONES DE LA AMERICAN PSYCHOLOGIC	MANUAL DE PUBLICACIONES DE LA AMERICAN PSYCHOLOGIC			04644,04645,04646,04647,	1	1	1	245	2			\N	2022-02-17 15:14:57	2022-02-17 15:14:57	'americ':6,13 'manual':1,8 'psychologic':7,14 'public':3,10
1403	1757	MENTE POSITIVA: GUIA PRACTICA PARA CUALQUIER SITUA	MENTE POSITIVA: GUIA PRACTICA PARA CUALQUIER SITUA			05253	1	1	1	245	2			\N	2022-02-17 15:49:22	2022-02-17 15:49:22	'cualqui':6,13 'gui':3,10 'ment':1,8 'posit':2,9 'practic':4,11 'situ':7,14
1404	1756	DISFRUTA LA VIDA: GUIA PRACTICA PARA VIVIR MAS Y M	MELGOSA, JULIA			05252	1	1	1	245	2			\N	2022-02-17 15:51:16	2022-02-17 15:51:16	'disfrut':1 'gui':4 'juli':12 'm':10 'mas':8 'melgos':11 'practic':5 'vid':3 'viv':7
1405	54	DICCIONARIO DE HUMANISTAS CLASICOS DE MEXICO	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00333,04222	1	1	1	179	2			\N	2022-02-17 16:01:29	2022-02-17 16:01:29	'autonom':9 'clasic':4 'diccionari':1 'human':3 'mexic':6,11 'nacional':8 'univers':7
1406	58	HISTORIA DEL TIEMPO	W. HAWKING, STEPHEN			00363,04212	1	1	1	83	2			\N	2022-02-17 16:06:07	2022-02-17 16:06:07	'hawking':5 'histori':1 'steph':6 'tiemp':3 'w':4
1407	46	DISPUTAS TUSCULANAS	TULIO CICERON, MARCO			00311,00312,00313,00314,	1	1	1	245	2			\N	2022-02-17 16:09:51	2022-02-17 16:09:51	'ciceron':4 'disput':1 'marc':5 'tuli':3 'tusculan':2
1408	136	ENCUENTRO NACIONAL DE INVESTIGACIONES DE LA FILOSOFIA	UNIVERSIDAD AUTONOMA DE AGUASCALIENTES INSTITUTO DE INVESTIGACIONES FILOLOGICAS			00330,00331	1	1	1	245	2			\N	2022-02-17 16:14:52	2022-02-17 16:16:31	'aguascalient':11 'autonom':9 'encuentr':1 'filolog':15 'filosofi':7 'institut':12 'investig':4,14 'nacional':2 'univers':8
1409	86	EL EXISTENCIALISMO ES UN HUMANISMO	PAUL SARTRE,JEAN			00332	1	1	1	245	2			\N	2022-02-17 16:18:37	2022-02-17 16:18:37	'existencial':2 'human':5 'jean':8 'paul':6 'sartr':7
1410	87	DE DOMINIO INFIDELIUM ET IUSTO BELLO, I II	VERA CRUZ, FRAY ALONSO DE LA			00334,00335	1	1	1	179	2			\N	2022-02-17 16:20:02	2022-02-17 16:20:02	'alons':12 'bell':6 'cruz':10 'domini':2 'et':4 'fray':11 'i':7 'ii':8 'infidelium':3 'iust':5 'ver':9
1411	82	EL NATURALISMO EN MEXICO	GARCIA BARRAGAN,MARIA GUADALUPE			00336,00337	1	1	1	179	2			\N	2022-02-17 16:21:54	2022-02-17 16:21:54	'barrag':6 'garci':5 'guadalup':8 'mari':7 'mexic':4 'natural':2
1412	81	EL NATURALISMO LITERARIO EN MEXICO	GARCIA BARRAGAN, MARIA GUADALUPE			00338,00339	1	1	1	179	2			\N	2022-02-17 16:25:52	2022-02-17 16:25:52	'barrag':7 'garci':6 'guadalup':9 'literari':3 'mari':8 'mexic':5 'natural':2
1413	80	IUSNATURALISTAS Y IUSPOSITIVISTAS MEXICANOS	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00340,00341	1	1	1	179	2			\N	2022-02-17 16:28:37	2022-02-17 16:28:37	'autonom':7 'iusnatural':1 'iuspositiv':3 'mexic':9 'mexican':4 'nacional':6 'univers':5
1414	71	LA DROGA	CURTET, FRANCIS			00344	1	1	1	245	2			\N	2022-02-17 16:30:59	2022-02-17 16:30:59	'curtet':3 'drog':2 'francis':4
1415	83	EL MIEDO A LA LIBERTAD	FROMM, ERICH			00353	1	1	1	245	2			\N	2022-02-17 16:37:15	2022-02-17 16:37:15	'erich':7 'fromm':6 'libert':5 'mied':2
1416	1068	LIDERAZGO EMOCIONAL	VBOYATZIS, RICHARD Y MCKEE, ANNIE			00355	1	1	1	245	2			\N	2022-02-17 16:41:03	2022-02-17 16:41:03	'anni':7 'emocional':2 'liderazg':1 'mcke':6 'richard':4 'vboyatzis':3
1417	69	TRADICIONES Y PUNTOS DE VISTA EN LA FICCION SENTIM	DEYERMOND, ALAN D.			00357,00358	1	1	1	245	2			\N	2022-02-17 16:42:40	2022-02-17 16:42:40	'alan':11 'd':12 'deyermond':10 'ficcion':8 'punt':3 'sentim':9 'tradicion':1 'vist':5
1418	67	PENSAMIENTO Y REALIDAD EN FRAY ALONSO DE LA VERA C	REDMOND, WALTER Y BEUCHOT, MAURICIO			00359,00360	1	1	1	179	2			\N	2022-02-17 16:44:52	2022-02-17 16:44:52	'alons':6 'beuchot':14 'c':10 'fray':5 'maurici':15 'pensamient':1 'realid':3 'redmond':11 'ver':9 'walt':12
1419	70	INTRODUCCION AL PENSAMIENTO POLITICO	CERRONI UMBERTO			00362	1	1	1	245	2			\N	2022-02-17 16:46:57	2022-02-17 16:46:57	'cerroni':5 'introduccion':1 'pensamient':3 'polit':4 'umbert':6
1420	57	EL SER Y EL TIEMPO	HEIDEGGER, MARTIN			00364	1	1	1	245	2			\N	2022-02-17 16:49:09	2022-02-17 16:49:09	'heidegg':6 'martin':7 'ser':2 'tiemp':5
1421	56	MAGIA, CIENCIA Y RELIGION	MALINOWSKI, BRONISLAW			00366	1	1	1	245	2			\N	2022-02-17 16:51:44	2022-02-17 16:51:44	'bronislaw':6 'cienci':2 'magi':1 'malinowski':5 'religion':4
1422	55	EL CONOCIMIENTO HUMANO SU ALCANCE Y SUS LIMITES	RUSELL,BERTRAND			00367	1	1	1	245	2			\N	2022-02-17 16:56:19	2022-02-17 16:56:26	'alcanc':5 'bertrand':10 'conoc':2 'human':3 'limit':8 'rusell':9
1423	1410	DESARROLLO DE HABILIDADES DEL PENSAMIENTO	SANCHEZ, MARGARITA A. DE			04095,04096,04097,04098,04099,04100,04364,	1	1	1	60	2			\N	2022-02-17 17:48:08	2022-02-17 17:48:08	'desarroll':1 'habil':3 'margarit':7 'pensamient':5 'sanchez':6
1424	59	DESARROLLO DE HABILIDADES DEL PENSAMIENTO PROCESOS	SANCHEZ, MARGARITA A. DE			00370,00371,00372,00373,00374,00375,00376,	1	1	1	60	2			\N	2022-02-17 19:15:52	2022-02-17 19:15:52	'desarroll':1 'habil':3 'margarit':8 'pensamient':5 'proces':6 'sanchez':7
1425	1363	DINAMICA DE GRUPOS TECNICAS Y TACTICAS	GONZALEZ NUNEZ, J. JESUS, MONROY, ANAMELY; SILBERS			03765,03767,03768,03769,03770,	1	1	1	245	2			\N	2022-02-17 19:20:06	2022-02-17 19:20:06	'anamely':12 'dinam':1 'gonzalez':7 'grup':3 'j':9 'jesus':10 'monroy':11 'nunez':8 'silbers':13 'tactic':6 'tecnic':4
1426	356	LOS NEXOS SUBORDINANTES ADVERBIALES EN EL HABLA PO	HERRERA LIMA,MARIA EUGENIA			03177,03178	1	1	1	179	2			\N	2022-02-17 19:33:50	2022-02-17 19:33:50	'adverbial':4 'eugeni':12 'habl':7 'herrer':9 'lim':10 'mari':11 'nex':2 'po':8 'subordin':3
1427	1072	EL CICLO VITAL DE LA FAMILIA	ESTRADA INDA, LAURO			00379,00380,00381,00382,00383,00384,	1	1	1	15	2			\N	2022-02-17 19:36:02	2022-02-17 19:36:02	'cicl':2 'estrad':7 'famili':6 'inda':8 'laur':9 'vital':3
1428	1404	DESARROLLO DE HABILIDADES DEL PENSAMIENTO: DISCERN	SANCHEZ, MARGARITA A. DE			04068,04068,04069,04070,04071,	1	1	1	60	2			\N	2022-02-17 19:39:50	2022-02-17 19:39:50	'desarroll':1 'discern':6 'habil':3 'margarit':8 'pensamient':5 'sanchez':7
1429	1410	DESARROLLO DE HABILIDADES DEL PENSAMIENTO RAZONAMIENTO VERBAL Y SOLUCION DE PROBLEMAS	SANCHEZ, MARGARITA A. DE			GUIA DEL INSTRUCTOR	1	1	1	60	2			\N	2022-02-17 19:45:41	2022-02-17 19:45:41	'desarroll':1 'habil':3 'margarit':13 'pensamient':5 'problem':11 'razon':6 'sanchez':12 'solucion':9 'verbal':7
1430	1758	DESCUBRE TU VALOR Y SE FELIZ: LA IMPORTANCIA DE LA	MELGOSA, JULIAN			05254	1	1	1	245	2			\N	2022-02-17 19:47:41	2022-02-17 19:47:41	'descubr':1 'feliz':6 'import':8 'juli':12 'melgos':11 'valor':3
1431	1054	ADMINISTRACION DEL TIEMPO	RODRIGUEZ ESTRADA, MAURO			00397,00398,05233,05234,05235	1	1	1	249	2			\N	2022-02-17 20:12:04	2022-02-17 20:12:04	'administracion':1 'estrad':5 'maur':6 'rodriguez':4 'tiemp':3
1432	1055	MANEJO DE PROBLEMAS Y TOMA DE DECISIONES	RODRIGUEZ ESTRADA, MAURO			00399,00400	1	1	1	245	2			\N	2022-02-17 20:17:20	2022-02-17 20:17:20	'decision':7 'estrad':9 'manej':1 'maur':10 'problem':3 'rodriguez':8 'tom':5
1433	1056	PLANEACION DE VIDA Y TRABAJO	RODRIGUEZ ESTRADA, MAURO			00401,00402	1	1	1	245	2			\N	2022-02-17 20:21:11	2022-02-17 20:21:11	'estrad':7 'maur':8 'planeacion':1 'rodriguez':6 'trabaj':5 'vid':3
1434	64	SEIS PREGUNTAS A LA LOGICA MEDIEVAL	MUNOZ GARCIA, ANGEL			00404,00405	1	1	1	179	2			\N	2022-02-17 20:23:12	2022-02-17 20:23:12	'angel':9 'garci':8 'logic':5 'medieval':6 'munoz':7 'pregunt':2 'seis':1
1435	63	ETICA O FILOSOFIA MORAL, CONFORME AL PENSAMIENTO D	BARBEDETTE, D.			00406,00407	1	1	1	245	2			\N	2022-02-17 20:29:31	2022-02-17 20:29:31	'barbedett':9 'conform':5 'd':8,10 'etic':1 'filosofi':3 'moral':4 'pensamient':7
1436	61	ETICA Y DERECHO EN TOMAS DE AQUINO	BEUCHOT, MAURICIO			00408,00409	1	1	1	179	2			\N	2022-02-17 20:31:20	2022-02-17 20:31:20	'aquin':7 'beuchot':8 'derech':3 'etic':1 'maurici':9 'tom':5
1437	92	ETICA	SANCHEZ VAZQUEZ,ADOLFO			00412,00413	1	1	1	179	2			\N	2022-02-17 20:32:23	2022-02-17 20:32:23	'adolf':4 'etic':1 'sanchez':2 'vazquez':3
1438	98	LAS ETICAS DEL EXEMPLUM LOS CASTIGOS DEL REY DON S	PALAFOX,ELOISA			00414	1	1	1	179	2			\N	2022-02-17 20:35:24	2022-02-17 20:35:24	'castig':6 'don':9 'elois':12 'etic':2 'exemplum':4 'palafox':11 'rey':8 's':10
1439	1058	ETICA PARA TODOS	BRUNET, GRACIELA			00415,00416,00417,00418,00419,00420,	1	1	1	253	2			\N	2022-02-17 20:41:46	2022-02-17 20:41:46	'brunet':4 'etic':1 'graciel':5
1440	90	ENSAYOS MARGINALES SOBRE ARISTOTELES	BEUCHOT,MAURICIO			00425,00426	1	1	1	245	2			\N	2022-02-17 20:45:51	2022-02-17 20:45:51	'aristotel':4 'beuchot':5 'ensay':1 'marginal':2 'maurici':6
1441	91	LA ESENCIA Y LA EXISTENCIA EN LA FILOSOFIA ESCOLAS	BEUCHOT PUENTE,MAURICIO			00427,00428	1	1	1	179	2			\N	2022-02-17 20:47:58	2022-02-17 20:47:58	'beuchot':10 'escol':9 'esenci':2 'existent':5 'filosofi':8 'maurici':12 'puent':11
1442	103	CURSO DE FILOSOFIA	YAJOT,O. Y SPIRKIN A.			00430	1	1	1	245	2			\N	2022-02-17 20:53:46	2022-02-17 20:53:46	'curs':1 'filosofi':3 'spirkin':7 'yajot':4
1443	1057	AUTOESTIMA: CLAVE DEL EXITO PERSONAL	RODRIGUEZ ESTRADA, MAURO			00391,00392,00393,00394,00395,00396,03919,03920,	1	1	1	254	2			\N	2022-02-17 20:55:53	2022-02-17 20:56:41	'autoestim':1 'clav':2 'estrad':7 'exit':4 'maur':8 'personal':5 'rodriguez':6
1444	1406	EL CAMINO FACIL Y RAPIDO PARA HABLAR EFICAZMENTE	CARNEGIE,DALE Y DOROTHY			04077,04077,04078,04079,04080,04081,	1	1	1	255	2			\N	2022-02-17 21:26:17	2022-02-17 21:26:53	'camin':2 'carnegi':9 'dal':10 'dorothy':12 'eficaz':8 'facil':3 'habl':7 'rap':5
1445	1442	GRUPOS DE TRABAJO AUTODIRIGIDOS	HICKS, ROBERT Y BONE, DIANE			04227	1	1	1	245	2			\N	2022-02-17 21:30:04	2022-02-17 21:30:04	'autodirig':4 'bon':8 'dian':9 'grup':1 'hicks':5 'robert':6 'trabaj':3
1446	1751	VIDA ABUNDANTE: APRENDA A SER RICO SIN DINERO-LA VERDADERA FORTUNA DE LA VIDA A SU ALCANCE	VIDA ABUNDANTE: APRENDA A SER RICO SIN DINERO-LA V			05247	1	1	1	245	2			\N	2022-02-18 13:33:35	2022-02-18 13:33:35	'abund':2,20 'alcanc':18 'aprend':3,21 'diner':9,27 'dinero-l':8,26 'fortun':12 'ric':6,24 'ser':5,23 'v':29 'verdader':11 'vid':1,15,19
1447	1762	COLECCION VIDA ABUNDANTE COMO VENCER LOS PROBLEMAS EL CAMINO HACIA LA PAZ	CHAIJ, ENRIQUE			05258,05259,05260,05261,05262,05263,05264,05265,05266,05267	1	1	1	245	2			\N	2022-02-18 13:36:34	2022-02-18 13:36:34	'abund':3 'camin':9 'chaij':13 'coleccion':1 'enriqu':14 'haci':10 'paz':12 'problem':7 'venc':5 'vid':2
1448	104	DESCRIPCION ESTRUCTURAL DEL MAYA DEL CHILAM BALAM	ALVAREZ, MARIA CRISTINA			00472,00473	1	1	1	245	2			\N	2022-02-18 13:41:45	2022-02-18 13:41:58	'alvarez':8 'balam':7 'chilam':6 'cristin':10 'descripcion':1 'estructural':2 'mari':9 'may':4
1449	1441	EL OJO ESPIRITUAL IMAGEN Y NATURALEZA EN LA EDAD M	DELMAR, FERNANDO			04225,04226	1	1	1	179	2			\N	2022-02-18 13:45:24	2022-02-18 13:45:24	'delm':11 'edad':9 'espiritual':3 'fern':12 'imag':4 'm':10 'naturalez':6 'ojo':2
1450	108	EL CONCEPTO DE LA DIVINIDAD EN EL HUNDUISMO Y OTRO	MORA,JUAN MIGUEL DE Y LUDWIKA JAROCKA MARJA			00470,00471	1	1	1	245	2			\N	2022-02-18 13:46:58	2022-02-18 13:46:58	'concept':2 'divin':5 'hunduism':8 'jarock':17 'juan':12 'ludwik':16 'marj':18 'miguel':13 'mor':11
1451	112	LAS SECTAS	IKOR, ROGER			00469	1	1	1	245	2			\N	2022-02-18 13:48:45	2022-02-18 13:48:45	'ikor':3 'rog':4 'sect':2
1452	110	LOS DIOSES DEL CODICE MADRID APROXIMACION A LAS RE	SOTELO SANTOS,LAURA ELENA			00467,00468	1	1	1	179	2			\N	2022-02-18 13:50:03	2022-02-18 13:50:03	'aproximacion':6 'codic':4 'dios':2 'elen':13 'laur':12 'madr':5 're':9 'sant':11 'sotel':10
1453	105	EL BULTO RITUAL DE MUNDO PERDIDO, TIKAL	AYALA FALCON,MARICELA			00465,00466	1	1	1	179	2			\N	2022-02-18 13:51:30	2022-02-18 13:51:30	'ayal':8 'bult':2 'falcon':9 'maricel':10 'mund':5 'perd':6 'ritual':3 'tikal':7
1454	106	TILA,SANTUARIO DE UN CRISTO NEGRO EN CHIAPAS	MONROY VALVERDE, FABIOLA PATRICIA			00463,00464	1	1	1	179	2			\N	2022-02-18 13:52:41	2022-02-18 13:52:41	'chiap':8 'crist':5 'fabiol':11 'monroy':9 'negr':6 'patrici':12 'santuari':2 'til':1 'valverd':10
1455	102	EL DON DE LA SANGRE EN EL EQUILIBRIO COSMICO	NAJERA CORONADO,MARTHA ILIA			00461,00462	1	1	1	179	2			\N	2022-02-18 13:54:12	2022-02-18 13:54:12	'coron':11 'cosmic':9 'don':2 'equilibri':8 'ili':13 'marth':12 'najer':10 'sangr':5
1456	113	ANGELS	GRAHAM, BILLY			00460	1	1	1	245	2			\N	2022-02-18 13:55:49	2022-02-18 13:55:49	'angels':1 'billy':3 'graham':2
1457	114	ASK YOUR ANGELS	DANIEL,ALMA-WYLLIE,TIMOTHY-RAMER ANDREW			00459	1	1	1	245	2			\N	2022-02-18 13:57:06	2022-02-18 13:57:06	'alma':6 'alma-wylli':5 'andrew':11 'angels':3 'ask':1 'daniel':4 'ram':10 'timothy':9 'timothy-ram':8 'wylli':7 'your':2
1458	116	DEVOCIONARIO DE NUESTRA SENORA DE IZAMAL	LIZANA, BERNARDO DE			00455,00456,00457,00458	1	1	1	179	2			\N	2022-02-18 13:59:00	2022-02-18 13:59:00	'bernard':8 'devocionari':1 'izamal':6 'lizan':7 'senor':4
1459	107	COLOQUIOS ESPIRITUALES Y SACRAMENTOS	GONZALEZ DE ESLAVA, FERNAN			00453,00454	1	1	1	179	2			\N	2022-02-18 14:02:58	2022-02-18 14:02:58	'coloqui':1 'eslav':7 'espiritual':2 'fern':8 'gonzalez':5 'sacrament':4
1460	109	LIBRO DE LOS PREDICAMENTOS	MERCADO, TOMAS DE			00451,00452	1	1	1	179	2			\N	2022-02-18 14:04:52	2022-02-18 14:04:52	'libr':1 'merc':5 'predicament':4 'tom':6
1461	115	OH, JERUSALEN	LAPIERRE,DOMINIQUE Y COLLINS LARRY			00450	1	1	1	245	2			\N	2022-02-18 14:09:36	2022-02-18 14:09:36	'collins':6 'dominiqu':4 'jerusal':2 'lapierr':3 'larry':7 'oh':1
1462	100	TABASCO EN CHIAPAS DOCUMENTOS PARA LA HISTORIA TAB	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00448,00449	1	1	1	179	2			\N	2022-02-18 14:10:57	2022-02-18 14:10:57	'autonom':11 'chiap':3 'document':4 'histori':7 'mexic':13 'nacional':10 'tab':8 'tabasc':1 'univers':9
1463	101	LA IGLESIA EN EL AREA MAYA	HUMBERTO RUZ, MARIO			00446,00447	1	1	1	179	2			\N	2022-02-18 14:12:18	2022-02-18 14:12:18	'are':5 'humbert':7 'iglesi':2 'mari':9 'may':6 'ruz':8
1464	111	¿POR QUE AGONIZA EL CRISTIANISMO?	FREIXEDO, SALVADOR			00445	1	1	1	256	2			\N	2022-02-18 14:14:05	2022-02-18 14:15:22	'agoniz':3 'cristian':5 'freixed':6 'salvador':7
1465	99	ANALISIS DE ESTRUCTURAS EN EL CODICE DE DRESDE	ESCALANTE,ROBERTO			00443,00444	1	1	1	179	2			\N	2022-02-18 14:42:25	2022-02-18 14:42:25	'analisis':1 'codic':6 'dresd':8 'escal':9 'estructur':3 'robert':10
1466	1143	MEMORIA ECLESIAL GUATEMALTECA	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00431,00432,00433,00434,00435,00436,00437,00438,00439,00440,00441,00442,	1	1	1	245	2			\N	2022-02-18 14:47:12	2022-02-18 14:47:12	'autonom':6 'eclesial':2 'guatemaltec':3 'memori':1 'mexic':8 'nacional':5 'univers':4
1467	1740	LAS FAMILIAS EN EL MEXICO METROPOLITANO: VISIONES	GARCIA GUZMAN, BRIGIDA			05236	1	1	1	135	2			\N	2022-02-18 15:35:24	2022-02-18 15:35:29	'brig':10 'famili':2 'garci':8 'guzm':9 'metropolitan':6 'mexic':5 'vision':7
1468	376	PRINCIPIOS DE ECONOMIA	MARTIN SIMON, JOSE LUIS			00613,00614,00615,00616,00617,00618,00619,00620	1	1	1	245	2			\N	2022-02-18 15:37:53	2022-02-18 15:37:53	'economi':3 'jos':6 'luis':7 'martin':4 'principi':1 'simon':5
1469	196	EL PROCESO DE LA COMUNICACION: INTRODUCCION A LA TEORIA Y A LA PRACTICA	BERLO,DAVID K.			00496,00497	1	1	1	244	2			\N	2022-02-18 15:41:16	2022-02-18 15:43:11	'berl':14 'comunicacion':5 'dav':15 'introduccion':6 'k':16 'practic':13 'proces':2 'teori':9
1470	1087	LENGUA Y COMUNICACION ORAL Y ESCRITA	AYALA, LEOPOLDO			00493,00494,00495	1	1	1	245	2			\N	2022-02-18 15:44:40	2022-02-18 15:44:40	'ayal':7 'comunicacion':3 'escrit':6 'lengu':1 'leopold':8 'oral':4
1471	141	HETERODOXIA Y ORTODOXIA MEDIEVAL	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00483,00484,00485,00486,00487	1	1	1	179	2			\N	2022-02-18 15:46:46	2022-02-18 15:46:46	'autonom':7 'heterodoxi':1 'medieval':4 'mexic':9 'nacional':6 'ortodoxi':3 'univers':5
1472	282	LA EDUCACION SUPERIOR EN CHIAPAS: RETOS Y PERSPECT	UNIVERSIDAD AUTONOMA DE CHIAPAS			00478	1	1	1	179	2			\N	2022-02-18 15:49:30	2022-02-18 15:49:30	'autonom':10 'chiap':5,12 'educacion':2 'perspect':8 'ret':6 'superior':3 'univers':9
1473	266	INTRODUCCION AL DERECHO POSITIVO MEXICANO	DELGADILLO GUTIERREZ,LUIS HUMBERTO Y ESPINOSA,MANU			00476,00477	1	1	1	245	2			\N	2022-02-18 15:51:12	2022-02-18 15:51:12	'delgadill':6 'derech':3 'espin':11 'gutierrez':7 'humbert':9 'introduccion':1 'luis':8 'manu':12 'mexican':5 'posit':4
1474	1386	SOCIOLOGIA	GOMEZJARA, FRANCISCO A.			03929,03930,03931,03932,03933,03934	1	1	1	82	2			\N	2022-02-18 16:12:21	2022-02-18 16:12:21	'francisc':3 'gomezj':2 'sociologi':1
1475	1785	METODOLOGIA DE LA INVESTIGACION	ARIAS GALACIA, L. FERNANDO			05298,05299,05300,	1	1	1	60	2			\N	2022-02-18 16:35:37	2022-02-18 16:35:37	'ari':5 'fern':8 'galaci':6 'investigacion':4 'l':7 'metodologi':1
1476	1746	QUERIDA HIJA... QUERIDO HIJO...	PEREZ MARCIO, BRAULIO			05242	1	1	1	245	2			\N	2022-02-18 16:38:33	2022-02-18 16:38:33	'brauli':7 'hij':2,4 'marci':6 'perez':5 'quer':1,3
1477	1745	PERSISTENCIA Y CAMBIO: ACERCAMIENTOS A LA HISTORIA	PERSISTENCIA Y CAMBIO: ACERCAMIENTOS A LA HISTORIA			05241	1	1	1	135	2			\N	2022-02-18 16:41:52	2022-02-18 16:41:52	'acerc':4,11 'cambi':3,10 'histori':7,14 'persistent':1,8
1478	1694	EL MUNDO POST EMPRESARIAL: LA VIDA DESPUES DEL CAPITALISMO	KORTEN, DIVIC C.			05130	1	1	1	245	2			\N	2022-02-18 16:43:32	2022-02-18 16:43:39	'c':12 'capital':9 'despu':7 'divic':11 'empresarial':4 'kort':10 'mund':2 'post':3 'vid':6
1479	186	UN ESFUERZO COMPARTIDO	DIF TABASCO			00545	1	1	1	245	2			\N	2022-02-18 16:45:30	2022-02-18 16:45:30	'compart':3 'dif':4 'esfuerz':2 'tabasc':5
1480	1743	LAS PIONERAS: LAS MUJERES QUE CAMBIARON LA SOCIEDAD	MONTALCINI, RITA LEVI			05239	1	1	1	245	2			\N	2022-02-18 16:48:37	2022-02-18 16:48:37	'cambi':6 'levi':11 'montalcini':9 'mujer':4 'pioner':2 'rit':10 'socied':8
1481	144	LA TEORIA SOCIOLOGICA SU NATURALEZA Y SU DESARROLL	TIMASHEFF,NICHOLAS S.			00488,00489	1	1	1	16	2			\N	2022-02-18 16:55:16	2022-02-18 16:55:16	'desarroll':8 'naturalez':5 'nichol':10 's':11 'sociolog':3 'teori':2 'timasheff':9
1482	194	PRINCIPIOS BASICOS DE COMUNICACION	GONZALEZ ALONSO,CARLOS			00498,00499	1	1	1	60	2			\N	2022-02-18 16:57:00	2022-02-18 16:57:00	'alons':6 'basic':2 'carl':7 'comunicacion':4 'gonzalez':5 'principi':1
1483	1103	LENGUA Y COMUNICACION	AYALA, LEOPOLDO			00500	1	1	1	245	2			\N	2022-02-18 16:59:01	2022-02-18 16:59:01	'ayal':4 'comunicacion':3 'lengu':1 'leopold':5
1484	195	CREATIVIDAD VERBAL COMO DESARROLLARLA	RODRIGUEZ ESTRADA,MAURO			00501,00502	1	1	1	245	2			\N	2022-02-18 16:59:58	2022-02-18 16:59:58	'creativ':1 'desarroll':4 'estrad':6 'maur':7 'rodriguez':5 'verbal':2
1485	199	COMUNICACION ORAL. FUNDAMENTOS Y PRACTICA ESTRATEG	FONSECA YERENA,MARIA DEL SOCORRO			00503,00504,00505,00506,00827,00934,01004,04356,04357,04358	1	1	1	245	2			\N	2022-02-18 17:02:33	2022-02-18 17:02:33	'comunicacion':1 'estrateg':6 'fonsec':7 'fundament':3 'mari':9 'oral':2 'practic':5 'socorr':11 'yeren':8
1486	170	TRADICION Y MODERNIDAD EN MANUEL GUTIERREZ NAJERA	CLARK DE LARA,BELEM			00513,00514	4	1	1	179	2			\N	2022-02-18 17:08:39	2022-02-18 17:08:39	'belem':11 'clark':8 'gutierrez':6 'lar':10 'manuel':5 'modern':3 'najer':7 'tradicion':1
1487	151	ACALAN Y LA CHONTALPA EN EL SIGLO XVI SU GEOGRAFIA	IZQUIERDO, ANA LUISA			00523,00524	1	1	1	179	2			\N	2022-02-18 17:10:04	2022-02-18 17:10:04	'acal':1 'ana':12 'chontalp':4 'geografi':10 'izquierd':11 'luis':13 'sigl':7 'xvi':8
1488	176	EL PAPEL DEL TRABAJO EN LA TRANSFORMACION DEL MONO	ENGELS, F.			00528	1	1	1	245	2			\N	2022-02-18 17:11:19	2022-02-18 17:11:19	'engels':10 'f':11 'mon':9 'papel':2 'trabaj':4 'transformacion':7
1489	150	CH'OL KAXLAN IDENTIDADES ETNICAS Y CONFLICTO AGRAR	ALEJOS GARCIA,JOSE			00532,00533	1	1	1	179	2			\N	2022-02-18 17:12:45	2022-02-18 17:12:45	'agrar':8 'alej':9 'ch':1 'conflict':7 'etnic':5 'garci':10 'ident':4 'jos':11 'kaxl':3 'ol':2
1490	153	LOS LEGITIMOS HOMBRES	HUMBERTO RUZ,MARIO			00534,00535	1	1	1	179	2			\N	2022-02-18 17:14:53	2022-02-18 17:14:53	'hombr':3 'humbert':4 'legit':2 'mari':6 'ruz':5
1491	158	MEMORIAS DEL SEGUNDO CONGRESO INTERNACIONAL DE MAY	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00536,00537,00538,00539,	1	1	1	179	2			\N	2022-02-18 19:45:48	2022-02-18 19:45:48	'autonom':10 'congres':4 'internacional':5 'may':7 'memori':1 'mexic':12 'nacional':9 'segund':3 'univers':8
1492	160	PAISAJES DOMESTICADOS IMAGENES ETNOGRAFIAS DE TRES	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00540,00541	1	1	1	179	2			\N	2022-02-18 19:49:41	2022-02-18 19:49:41	'autonom':9 'domestic':2 'etnografi':4 'imagen':3 'mexic':11 'nacional':8 'paisaj':1 'tres':6 'univers':7
1493	157	COSMOPOLIS FIGURAS DEL EXILIO JUDEO-ALEMAN,ENZO TR	TRAVERSO,ENZO			00542,00543	1	1	1	179	2			\N	2022-02-18 19:54:05	2022-02-18 19:54:05	'alem':7 'cosmopolis':1 'enzo':8,11 'exili':4 'figur':2 'jude':6 'judeo-alem':5 'tr':9 'travers':10
1494	178	ESCENARIOS DEL NORTE DE MEXICO: DANIEL SADA,GERARD	RODRIGUEZ LOZANO,MIGUEL G.			00547,00548	1	1	1	245	2			\N	2022-02-18 20:01:06	2022-02-18 20:01:06	'daniel':6 'escenari':1 'g':12 'gerard':8 'lozan':10 'mexic':5 'miguel':11 'nort':3 'rodriguez':9 'sad':7
1495	1480	APRENDER A VIVIR CON SUSTENTABILIDAD	BARRON HERNANDEZ, MARIA ELENA			04552,04553	1	1	1	245	2			\N	2022-02-18 20:09:47	2022-02-18 20:09:47	'aprend':1 'barron':6 'elen':9 'hernandez':7 'mari':8 'sustent':5 'viv':3
1496	193	MANUAL DE EXPRESION ORAL	FORZAN,JOSE ANTONIO.			04466,04467,04468,04469,04470,04471,04472,04473,04474,04475,04476,04477,04478,04479,04480,04481,04482,	1	1	1	57	2			\N	2022-02-18 20:13:27	2022-02-18 20:13:27	'antoni':7 'expresion':3 'forz':5 'jos':6 'manual':1 'oral':4
1497	1053	LA DINAMICA DE LA COMUNICACION MASIVA	DOMINICK, JOSEPH R.			00508,00509,00510,00511,00512,04207,	1	1	1	68	2			\N	2022-02-18 20:20:43	2022-02-18 20:20:43	'comunicacion':5 'dinam':2 'dominick':7 'joseph':8 'masiv':6 'r':9
1498	1421	EL ORIGEN DE LAS ESPECIES	DARWIN, CHARLES			04154,04155,04156,04157	1	1	1	82	2			\N	2022-02-18 20:36:02	2022-02-18 20:36:02	'charl':7 'darwin':6 'especi':5 'orig':2
1499	1397	COMUNICACION ORAL Y ESCRITA	PINALES RODRIGUEZ, DEYANIRA G.			04004,04005,04006,04007,04008,	1	1	1	60	2			\N	2022-02-18 20:43:18	2022-02-18 20:43:18	'comunicacion':1 'deyanir':7 'escrit':4 'g':8 'oral':2 'pinal':5 'rodriguez':6
1502	1050	COMPORTAMIENTO ORGANIZACIONAL	ROBBINS, STEPHEN P.			00515,00516,00517,00518,00519,03732,	1	1	1	245	2			\N	2022-02-18 20:53:37	2022-02-18 20:53:37	'comport':1 'organizacional':2 'p':5 'robbins':3 'steph':4
1503	143	TLALOCAN VOL. XIII	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO				1	1	1	179	2			\N	2022-02-18 20:57:14	2022-02-18 20:57:14	'autonom':6 'mexic':8 'nacional':5 'tlaloc':1 'univers':4 'vol':2 'xiii':3
1504	142	TLALOCAN VOL. XIV	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			03020,03021	1	1	1	179	2			\N	2022-02-18 21:20:55	2022-02-18 21:20:55	'autonom':6 'mexic':8 'nacional':5 'tlaloc':1 'univers':4 'vol':2 'xiv':3
1505	72	COMUNIDAD,CULTURA Y VIDA SOCIAL: ENSAYOS SOBRE LA	INSTITUTO NACIONAL DE ANTROPOLOGIA E HISTORIA			02987	1	1	1	245	2			\N	2022-02-18 21:22:54	2022-02-18 21:22:54	'antropologi':12 'comun':1 'cultur':2 'ensay':6 'histori':14 'institut':9 'nacional':10 'social':5 'vid':4
1506	1021	MEMORIA BALDIA LOS TOJOLABALES Y LAS FINCAS.	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			02478,02479	1	1	1	179	2			\N	2022-02-18 21:25:03	2022-02-18 21:25:03	'autonom':10 'baldi':2 'finc':7 'memori':1 'mexic':12 'nacional':9 'tojolabal':4 'univers':8
1507	555	DE LOS SISMOS A LA RECONSTRUCCION TLATELOLCO	ARREOLA, GERARDO			01104	1	1	1	245	2			\N	2022-02-18 21:36:56	2022-02-18 21:36:56	'arreol':8 'gerard':9 'reconstruccion':6 'sism':3 'tlatelolc':7
1508	1110	ECONOMIA Y SOCIEDAD ESBOZO DE SOCIOLOGIA COMPRENSI	WEBER, MAX			00555,00556,00557,00558,00559,00560,	1	1	1	16	2			\N	2022-02-21 16:47:34	2022-02-21 16:47:34	'comprensi':7 'economi':1 'esboz':4 'max':9 'socied':3 'sociologi':6 'web':8
1509	682	LAS NORMAS OFICIALES MEXICANAS	QUINTANILLA MADERO, MARIA DEL CARMEN EUGENIA			00550,00551,00552,00553,00554,04751,04752,04753,04754,04755,	1	1	1	158	2			\N	2022-02-21 18:24:48	2022-02-21 18:24:48	'carm':9 'eugeni':10 'mader':6 'mari':7 'mexican':4 'norm':2 'oficial':3 'quintanill':5
1510	163	LA FAMILIA MEXICANA EN EL TERCER MILENIO	UNICEF,DIF Y COLEGIO MEXICANO			00561	1	1	1	245	2			\N	2022-02-21 18:35:20	2022-02-21 18:35:20	'colegi':11 'dif':9 'famili':2 'mexican':3,12 'mileni':7 'terc':6 'unicef':8
1511		MULTICULTURALISMO Y DERECHOS	YTURBE, CORINA DE			00564	1	1	1	245	2			\N	2022-02-21 18:45:24	2022-02-21 18:45:24	'corin':5 'derech':3 'multicultural':1 'yturb':4
1513	164155	LA JOVEN MODERNA Y EL SEXO	F. KNIGHT,JUAN			00564	1	1	1	245	2			\N	2022-02-21 18:52:23	2022-02-21 18:52:23	'f':7 'jov':2 'juan':9 'knight':8 'modern':3 'sex':6
1515	1747	LA TECNICA DEL HIJO PREVIO: TEORIA, EXTENSIONES Y	AGUIRRE, ALEJANDRO			05243	1	1	1	135	2			\N	2022-02-21 18:59:50	2022-02-21 18:59:50	'aguirr':9 'alejandr':10 'extension':7 'hij':4 'previ':5 'tecnic':2 'teori':6
1514	190	LOS TECNOCRATAS Y LA ELITE GOBERNANTE MEXICANA	LINDAU,JUAN DAVID			00566	1	1	1	245	2			\N	2022-02-21 18:54:17	2022-02-21 19:00:42	'dav':10 'elit':5 'gobern':6 'juan':9 'lindau':8 'mexican':7 'tecnocrat':2
1516	283	PREMIO NACIONAL DE CIENCIAS Y ARTES	SECRETARIA DE EDUCACION PUBLICA			00567	1	1	1	245	2			\N	2022-02-21 20:17:13	2022-02-21 20:17:13	'artes':6 'cienci':4 'educacion':9 'nacional':2 'premi':1 'public':10 'secretari':7
1517	162	TEORIA GENERAL DEL ESTADO	ANDRADE SANCHEZ,JUSTINO EDUARDO			00568	1	1	1	64	2			\N	2022-02-21 20:21:23	2022-02-21 20:21:23	'andrad':5 'eduard':8 'general':2 'justin':7 'sanchez':6 'teori':1
1518	184	EL ARCHIVO MUNICIPAL DE TUMBALA,CHIAPAS 1920-1946	ALEJOS GARCIA,JOSE Y ORTEGA PENA, ELSA			00570,00571,00572,00573,00574,00575,	1	1	1	245	2			\N	2022-02-21 20:23:24	2022-02-21 20:23:24	'-1946':8 '1920':7 'alej':9 'archiv':2 'chiap':6 'elsa':15 'garci':10 'jos':11 'municipal':3 'orteg':13 'pen':14 'tumbal':5
1519	185	EXPERIENCIAS MUNICIPALES REPETIBLES	OLMEDO,RAUL			00576	1	1	1	245	2			\N	2022-02-22 14:27:06	2022-02-22 14:27:06	'experient':1 'municipal':2 'olmed':4 'raul':5 'repet':3
1520	181	ESTE PUEBLO ES MUY GRANDE COSA	ABREU MARIN,RAUL			00577,00578,00579,00580,00581,00582,00583,00584,00585,00586,04544,04545,04546,04547	1	1	1	258	2			\N	2022-02-22 14:29:07	2022-02-22 14:40:39	'abreu':7 'cos':6 'grand':5 'marin':8 'puebl':2 'raul':9
1521	180	LA FORMACION DE LA OLIGRAQUIA CRIOLLA EN CIUDAD RE	NAJERA CORONADO,MARTHA ILIA			00587,00588	1	1	1	179	2			\N	2022-02-22 15:08:01	2022-02-22 15:08:01	'ciud':8 'coron':11 'crioll':6 'formacion':2 'ili':13 'marth':12 'najer':10 'oligraqui':5 're':9
1522	187	CAMPECHE: ARTE,FE Y FOLCLOR RELIGIOSO	RODRIGUEZ SALAZAR,LUIS MAURICIO Y CARDENA ALAMINA,			00589,00591	1	1	1	259	2			\N	2022-02-22 15:10:22	2022-02-22 15:13:19	'alamin':13 'arte':2 'campech':1 'carden':12 'fe':3 'folclor':5 'luis':9 'maurici':10 'religi':6 'rodriguez':7 'salaz':8
1523	269	ELEMENTOS DE DERECHO CIVIL Y MERCANTIL	ROSADO ECHANOVE,ROBERTO			00590,00591,00592,00593,00594,00595,00596,	1	1	1	245	2			\N	2022-02-22 15:19:06	2022-02-22 15:19:06	'civil':4 'derech':3 'echanov':8 'element':1 'mercantil':6 'robert':9 'ros':7
1524	301	COMPENDIO DE DERECHO CIVIL II	ROJINA VILLEGAS, RAFAEL				1	1	1	179	2			\N	2022-02-22 15:22:53	2022-02-22 15:22:53	'civil':4 'compendi':1 'derech':3 'ii':5 'rafael':8 'rojin':6 'villeg':7
1526	159	EL MAGNIFICO SENOR ALONZO LOPEZ,ALCALDE DE SANTA M	UNIVERSIDAD NACIONAL AUTONOMA DE MEXICO			00600,00601	1	1	1	239	2			\N	2022-02-22 15:26:22	2022-02-22 15:26:22	'alcald':6 'alonz':4 'autonom':12 'lopez':5 'm':9 'magnif':2 'mexic':14 'nacional':11 'sant':8 'senor':3 'univers':10
1527	156	LA ECONOMIA DEL ANTIGUO SOCONUSCO,CHIAPAS	UNIVERSIDAD NACIONAL AUTONOMAS DE MEXICO			00602,00603	1	1	1	179	2			\N	2022-02-22 15:28:42	2022-02-22 15:28:42	'antigu':4 'autonom':9 'chiap':6 'economi':2 'mexic':11 'nacional':8 'soconusc':5 'univers':7
\.


--
-- TOC entry 4198 (class 0 OID 19416)
-- Dependencies: 222
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
39	2022_02_18_162232_update_biblos_6_tables	6
\.


--
-- TOC entry 4200 (class 0 OID 19421)
-- Dependencies: 224
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
-- TOC entry 4201 (class 0 OID 19424)
-- Dependencies: 225
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 19427)
-- Dependencies: 226
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 4203 (class 0 OID 19433)
-- Dependencies: 227
-- Data for Name: permission_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_role (id, role_id, permission_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 19438)
-- Dependencies: 229
-- Data for Name: permission_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_user (id, user_id, permission_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N
2	2	11	\N	\N	\N
\.


--
-- TOC entry 4207 (class 0 OID 19443)
-- Dependencies: 231
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
-- TOC entry 4209 (class 0 OID 19453)
-- Dependencies: 233
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
462		20f4752708ac2b203d5abf124dba0535495fec45-1320-462.jpg	1	_thumb_20f4752708ac2b203d5abf124dba0535495fec45-1320-462.png		1	1	2			\N	2022-02-11 00:00:16	2022-02-11 00:00:16
463		ed0e8ea1050de774c10a243cc4a8069aa918b356-1321-463.jpg	1	_thumb_ed0e8ea1050de774c10a243cc4a8069aa918b356-1321-463.png		1	1	2			\N	2022-02-11 00:02:31	2022-02-11 00:02:31
464		2588110a155f4aa3b68f3abf15b7cf55f25ffb45-1322-464.jpg	1	_thumb_2588110a155f4aa3b68f3abf15b7cf55f25ffb45-1322-464.png		1	1	2			\N	2022-02-11 00:06:09	2022-02-11 00:06:09
465		938671e27c307f37a986dde507a2fa7cca4a7dd6-1323-465.jpg	1	_thumb_938671e27c307f37a986dde507a2fa7cca4a7dd6-1323-465.png		1	1	2			\N	2022-02-11 00:07:48	2022-02-11 00:07:48
466		1815582b1b485cbf2de40acd3c5f749fa1c2b81d-1324-466.jpg	1	_thumb_1815582b1b485cbf2de40acd3c5f749fa1c2b81d-1324-466.png		1	1	2			\N	2022-02-11 00:10:14	2022-02-11 00:10:14
467		de99c19b8faed2160229b9fce53d99b052fe505d-1325-467.jpg	1	_thumb_de99c19b8faed2160229b9fce53d99b052fe505d-1325-467.png		1	1	2			\N	2022-02-11 00:12:09	2022-02-11 00:12:10
468		c2718ee766b93275b6954423bd0b97a7cb2c5fc5-1326-468.jpg	1	_thumb_c2718ee766b93275b6954423bd0b97a7cb2c5fc5-1326-468.png		1	1	2			\N	2022-02-11 00:13:55	2022-02-11 00:13:55
469		1f208b8a8c8e9cc85c1f0bb6756a7bce2ffa3e15-1327-469.jpg	1	_thumb_1f208b8a8c8e9cc85c1f0bb6756a7bce2ffa3e15-1327-469.png		1	1	2			\N	2022-02-11 00:15:33	2022-02-11 00:15:33
470		b292b4fac9d2e9e85e5fcd5ca0fe0cba900f5f55-1328-470.jpg	1	_thumb_b292b4fac9d2e9e85e5fcd5ca0fe0cba900f5f55-1328-470.png		1	1	2			\N	2022-02-11 00:20:06	2022-02-11 00:20:06
471		c9793da615d4ccad187f2ad59e23287d6b57ce32-1329-471.jpg	1	_thumb_c9793da615d4ccad187f2ad59e23287d6b57ce32-1329-471.png		1	1	2			\N	2022-02-11 13:33:43	2022-02-11 13:33:43
472		8eceeb134c66f89aa950115d024c3ebee1a49c6e-1330-472.jpg	1	_thumb_8eceeb134c66f89aa950115d024c3ebee1a49c6e-1330-472.png		1	1	2			\N	2022-02-11 13:38:45	2022-02-11 13:38:45
473		8332e5b5edc1a697c4e39c22d9275934b8165ad0-1331-473.jpg	1	_thumb_8332e5b5edc1a697c4e39c22d9275934b8165ad0-1331-473.png		1	1	2			\N	2022-02-11 13:43:36	2022-02-11 13:43:36
474		917807af727b84596e00c95b0811e2a578c823c5-1332-474.jpg	1	_thumb_917807af727b84596e00c95b0811e2a578c823c5-1332-474.png		1	1	2			\N	2022-02-11 13:46:57	2022-02-11 13:46:57
475		91fa6b797fbde1d696fecd06b53d59ae76500ac1-1333-475.jpg	1	_thumb_91fa6b797fbde1d696fecd06b53d59ae76500ac1-1333-475.png		1	1	2			\N	2022-02-11 13:53:10	2022-02-11 13:53:10
476		bfa479f03fcc958b3f9188e1ea51911f90b22625-1334-476.jpg	1	_thumb_bfa479f03fcc958b3f9188e1ea51911f90b22625-1334-476.png		1	1	2			\N	2022-02-11 14:00:47	2022-02-11 14:00:47
477		be46f4ec892801ba23fbb63ad4ca5e4458d44cd7-1335-477.jpg	1	_thumb_be46f4ec892801ba23fbb63ad4ca5e4458d44cd7-1335-477.png		1	1	2			\N	2022-02-11 14:10:47	2022-02-11 14:10:47
478		3ed694d07c87efa951a5220b8251fd97ed70a25b-1336-478.jpg	1	_thumb_3ed694d07c87efa951a5220b8251fd97ed70a25b-1336-478.png		1	1	2			\N	2022-02-11 14:26:40	2022-02-11 14:26:40
479		029847820867f0755d1b407c8576217b3625fb3b-1337-479.jpg	1	_thumb_029847820867f0755d1b407c8576217b3625fb3b-1337-479.png		1	1	2			\N	2022-02-11 14:35:51	2022-02-11 14:35:51
480		f755de60a21f4a6844dfcc845cec306272d744e4-1338-480.jpg	1	_thumb_f755de60a21f4a6844dfcc845cec306272d744e4-1338-480.png		1	1	2			\N	2022-02-11 14:42:06	2022-02-11 14:42:06
481		ae95799d2548fac8e67746adb22033f23e73d2a2-1339-481.jpg	1	_thumb_ae95799d2548fac8e67746adb22033f23e73d2a2-1339-481.png		1	1	2			\N	2022-02-11 15:05:20	2022-02-11 15:05:20
482		75ba8256a32a0c608f2def8cbd584849f55c9803-1340-482.jpg	1	_thumb_75ba8256a32a0c608f2def8cbd584849f55c9803-1340-482.png		1	1	2			\N	2022-02-11 15:50:14	2022-02-11 15:50:14
483		6660ccc80b711283adfd67a88acff1ef2fdbc060-1341-483.jpg	1	_thumb_6660ccc80b711283adfd67a88acff1ef2fdbc060-1341-483.png		1	1	2			\N	2022-02-11 16:04:23	2022-02-11 16:04:24
484		46a34d0f60cd93ab9588f7114106a4d1f6eef4ab-1342-484.jpg	1	_thumb_46a34d0f60cd93ab9588f7114106a4d1f6eef4ab-1342-484.png		1	1	2			\N	2022-02-11 16:05:56	2022-02-11 16:05:56
485		0a9f38df4935cacfd6d795642d9b4b364e1c6e07-1343-485.jpg	1	_thumb_0a9f38df4935cacfd6d795642d9b4b364e1c6e07-1343-485.png		1	1	2			\N	2022-02-11 16:07:03	2022-02-11 16:07:03
486		7a19c76a09647c85674a9423506d1e8704ac0983-1344-486.jpg	1	_thumb_7a19c76a09647c85674a9423506d1e8704ac0983-1344-486.png		1	1	2			\N	2022-02-11 16:09:00	2022-02-11 16:09:00
487		b2e61965904acff967bb1aaa01e34c439e75b8bd-1346-487.jpg	1	_thumb_b2e61965904acff967bb1aaa01e34c439e75b8bd-1346-487.png		1	1	2			\N	2022-02-12 00:53:56	2022-02-12 00:53:56
488		b1ac91e2d4d12d95d3552af3b4485e42bfa0cfbc-1347-488.jpg	1	_thumb_b1ac91e2d4d12d95d3552af3b4485e42bfa0cfbc-1347-488.png		1	1	2			\N	2022-02-12 00:55:36	2022-02-12 00:55:36
489		f4ec728f0656e6a7a90a373f9ecd3ae82438cd6b-1348-489.jpg	1	_thumb_f4ec728f0656e6a7a90a373f9ecd3ae82438cd6b-1348-489.png		1	1	2			\N	2022-02-15 15:34:49	2022-02-15 15:34:49
491		c1688e7a6fa6f4d2197d5e3bfa194a5d29934134-1349-491.jpg	1	_thumb_c1688e7a6fa6f4d2197d5e3bfa194a5d29934134-1349-491.png		1	1	2			\N	2022-02-15 15:37:12	2022-02-15 15:37:12
492		2747778be6042a3050a3be3da04b4e9f859d7f24-1350-492.jpg	1	_thumb_2747778be6042a3050a3be3da04b4e9f859d7f24-1350-492.png		1	1	2			\N	2022-02-15 15:42:02	2022-02-15 15:42:02
493		c2e4e2d16a4bb9ebae1c3f732576c74248ca42b9-1351-493.jpg	1	_thumb_c2e4e2d16a4bb9ebae1c3f732576c74248ca42b9-1351-493.png		1	1	2			\N	2022-02-15 15:50:04	2022-02-15 15:50:04
494		89d5b7dde3f43021b98964bd57b1a8e7bbc1fd80-1352-494.jpg	1	_thumb_89d5b7dde3f43021b98964bd57b1a8e7bbc1fd80-1352-494.png		1	1	2			\N	2022-02-15 19:04:08	2022-02-15 19:04:08
495		f90937d8163b60265d6a35721c5085bc97d74221-1353-495.jpg	1	_thumb_f90937d8163b60265d6a35721c5085bc97d74221-1353-495.png		1	1	2			\N	2022-02-15 19:06:06	2022-02-15 19:06:06
496		1df84f7615d07fbf34f764a2b46eee555d853f34-1354-496.jpg	1	_thumb_1df84f7615d07fbf34f764a2b46eee555d853f34-1354-496.png		1	1	2			\N	2022-02-15 19:08:53	2022-02-15 19:08:53
498		5bc8229a10b78da159526e6a66a80256ea76c930-1355-498.jpg	1	_thumb_5bc8229a10b78da159526e6a66a80256ea76c930-1355-498.png		1	1	2			\N	2022-02-15 19:12:22	2022-02-15 19:12:22
499		af20c7723a2cff356e42a71d405690b117ffd3d3-1356-499.jpg	1	_thumb_af20c7723a2cff356e42a71d405690b117ffd3d3-1356-499.png		1	1	2			\N	2022-02-15 19:16:19	2022-02-15 19:16:19
500		ef64af77a5d05f5a47dd905973fb4d62aa2b8aad-1357-500.jpg	1	_thumb_ef64af77a5d05f5a47dd905973fb4d62aa2b8aad-1357-500.png		1	1	2			\N	2022-02-15 19:18:51	2022-02-15 19:18:51
501		d3f7cb77108229bd96121e0118d3c142c14dd024-1358-501.jpg	1	_thumb_d3f7cb77108229bd96121e0118d3c142c14dd024-1358-501.png		1	1	2			\N	2022-02-15 19:21:00	2022-02-15 19:21:00
502		eaac82c96a568fe69087a034a885e059058b4b26-1359-502.jpg	1	_thumb_eaac82c96a568fe69087a034a885e059058b4b26-1359-502.png		1	1	2			\N	2022-02-15 19:24:49	2022-02-15 19:24:49
503		02216a1aa65cedcc20879750e860da2e4de02d97-1360-503.jpg	1	_thumb_02216a1aa65cedcc20879750e860da2e4de02d97-1360-503.png		1	1	2			\N	2022-02-15 20:39:15	2022-02-15 20:39:15
504		48259c93f6e8d2055fbbf6277a979df6bcf1bc0b-1361-504.jpg	1	_thumb_48259c93f6e8d2055fbbf6277a979df6bcf1bc0b-1361-504.png		1	1	2			\N	2022-02-15 20:43:18	2022-02-15 20:43:18
505		431bd01fc22d8a277c7168db6751441449b43605-1362-505.jpg	1	_thumb_431bd01fc22d8a277c7168db6751441449b43605-1362-505.png		1	1	2			\N	2022-02-15 20:58:04	2022-02-15 20:58:04
506		3f2ee40db9cf84566a70aaa9b512ea6d8eaaff03-1363-506.jpg	1	_thumb_3f2ee40db9cf84566a70aaa9b512ea6d8eaaff03-1363-506.png		1	1	2			\N	2022-02-16 13:30:22	2022-02-16 13:30:22
507		32a90220608e56a61c49347be6f75245a9708668-1364-507.jpg	1	_thumb_32a90220608e56a61c49347be6f75245a9708668-1364-507.png		1	1	2			\N	2022-02-16 13:32:45	2022-02-16 13:32:45
508		8dbec3c3dd4deace9635d2b12dc50eb8591dde6c-1365-508.jpg	1	_thumb_8dbec3c3dd4deace9635d2b12dc50eb8591dde6c-1365-508.png		1	1	2			\N	2022-02-16 13:34:08	2022-02-16 13:34:08
509		911c239396c1055e690a8e7f29b3c3c00bd7f218-1366-509.jpg	1	_thumb_911c239396c1055e690a8e7f29b3c3c00bd7f218-1366-509.png		1	1	2			\N	2022-02-16 13:39:18	2022-02-16 13:39:18
510		d5df2ef6969358b6c3b2371717c46a32ef3bd7e5-1367-510.jpg	1	_thumb_d5df2ef6969358b6c3b2371717c46a32ef3bd7e5-1367-510.png		1	1	2			\N	2022-02-16 13:40:46	2022-02-16 13:40:46
511		cebff39b42eb754cc8d22a8c6c335e24eeb564a6-1368-511.jpg	1	_thumb_cebff39b42eb754cc8d22a8c6c335e24eeb564a6-1368-511.png		1	1	2			\N	2022-02-16 13:42:08	2022-02-16 13:42:08
512		840eef91129fade78ea728fbf6924e5fb823ac8f-1369-512.jpg	1	_thumb_840eef91129fade78ea728fbf6924e5fb823ac8f-1369-512.png		1	1	2			\N	2022-02-16 13:44:35	2022-02-16 13:44:35
513		c82b44f0b04811cec7f5a167c14b67bb7ddf0a16-1370-513.jpg	1	_thumb_c82b44f0b04811cec7f5a167c14b67bb7ddf0a16-1370-513.png		1	1	2			\N	2022-02-16 13:45:58	2022-02-16 13:45:58
514		cc135b2cb4308c776b8c282e726922533c1101fe-1371-514.jpg	1	_thumb_cc135b2cb4308c776b8c282e726922533c1101fe-1371-514.png		1	1	2			\N	2022-02-16 13:47:51	2022-02-16 13:47:52
515		a2db2820b7a32fcddd11ea46ba9bced392131eb5-1372-515.jpg	1	_thumb_a2db2820b7a32fcddd11ea46ba9bced392131eb5-1372-515.png		1	1	2			\N	2022-02-16 13:49:50	2022-02-16 13:49:50
516		61314a9c2e8245fe8eff1767b0c1afccd3b40002-1373-516.jpg	1	_thumb_61314a9c2e8245fe8eff1767b0c1afccd3b40002-1373-516.png		1	1	2			\N	2022-02-16 13:51:59	2022-02-16 13:51:59
517		a9ea793ae9359cb1c250a54fe6bf48862ce9811b-1374-517.jpg	1	_thumb_a9ea793ae9359cb1c250a54fe6bf48862ce9811b-1374-517.png		1	1	2			\N	2022-02-16 13:53:45	2022-02-16 13:53:45
518		b56ee42ab1793425259c9b1da5d96e38cd7aa82b-1375-518.jpg	1	_thumb_b56ee42ab1793425259c9b1da5d96e38cd7aa82b-1375-518.png		1	1	2			\N	2022-02-16 13:58:43	2022-02-16 13:58:43
519		deaede9edc5a5f8f7267ccc9d701fd34af08180b-1376-519.jpg	1	_thumb_deaede9edc5a5f8f7267ccc9d701fd34af08180b-1376-519.png		1	1	2			\N	2022-02-16 14:00:21	2022-02-16 14:00:21
520		4b192107e53f73d5f3456248917cda7694fee145-1377-520.jpg	1	_thumb_4b192107e53f73d5f3456248917cda7694fee145-1377-520.png		1	1	2			\N	2022-02-16 14:04:59	2022-02-16 14:04:59
521		0cb878751fd08ee641f0a9a0efea8a1a8cb1d5ad-1378-521.jpg	1	_thumb_0cb878751fd08ee641f0a9a0efea8a1a8cb1d5ad-1378-521.png		1	1	2			\N	2022-02-16 14:06:47	2022-02-16 14:06:47
522		cc9c9eaf4ad561119904f4d2b639326da4235226-1379-522.jpg	1	_thumb_cc9c9eaf4ad561119904f4d2b639326da4235226-1379-522.png		1	1	2			\N	2022-02-16 14:08:43	2022-02-16 14:08:43
523		3dbc5743d0bfd85264cd23e2d1304cf868d7f117-1380-523.jpg	1	_thumb_3dbc5743d0bfd85264cd23e2d1304cf868d7f117-1380-523.png		1	1	2			\N	2022-02-16 14:10:49	2022-02-16 14:10:49
525		f7634ba4353aa014125a7a2f837984c446a376b1-1381-525.jpg	1	_thumb_f7634ba4353aa014125a7a2f837984c446a376b1-1381-525.png		1	1	2			\N	2022-02-16 15:30:53	2022-02-16 15:30:53
526		dc7162ded36bbec645290d914e5eb6cd4d6e3152-1382-526.jpg	1	_thumb_dc7162ded36bbec645290d914e5eb6cd4d6e3152-1382-526.png		1	1	2			\N	2022-02-16 15:42:39	2022-02-16 15:42:39
527		bf6d708ed605ee28f4d640fb138c25bddf3f301d-1383-527.jpg	1	_thumb_bf6d708ed605ee28f4d640fb138c25bddf3f301d-1383-527.png		1	1	2			\N	2022-02-16 15:51:38	2022-02-16 15:51:38
528		4b36d142900362373cdae86d492fb34d85b92408-1384-528.jpg	1	_thumb_4b36d142900362373cdae86d492fb34d85b92408-1384-528.png		1	1	2			\N	2022-02-16 15:53:38	2022-02-16 15:53:38
529		5cea3e367572dbf3eb7f21ca69d3d7853e131fd1-1385-529.jpg	1	_thumb_5cea3e367572dbf3eb7f21ca69d3d7853e131fd1-1385-529.png		1	1	2			\N	2022-02-16 16:57:10	2022-02-16 16:57:10
530		06fc2db12b32cfcd043810b4feb8f5ca61fa5d82-1386-530.jpg	1	_thumb_06fc2db12b32cfcd043810b4feb8f5ca61fa5d82-1386-530.png		1	1	2			\N	2022-02-17 13:57:46	2022-02-17 13:57:46
531		0867e51c424216575490aa835e72ea386680375b-1387-531.jpg	1	_thumb_0867e51c424216575490aa835e72ea386680375b-1387-531.png		1	1	2			\N	2022-02-17 13:59:16	2022-02-17 13:59:16
532		fbce56a6eb9558b5ac8be62fe2eaf1071fa2b98f-1388-532.jpg	1	_thumb_fbce56a6eb9558b5ac8be62fe2eaf1071fa2b98f-1388-532.png		1	1	2			\N	2022-02-17 14:10:21	2022-02-17 14:10:21
533		32e474c04f7c3492f4ab7093fc48f0113a79a890-1389-533.jpg	1	_thumb_32e474c04f7c3492f4ab7093fc48f0113a79a890-1389-533.png		1	1	2			\N	2022-02-17 14:14:59	2022-02-17 14:14:59
534		7550c725751726ca0e0b7c4f262a9a7af00591e0-1390-534.jpg	1	_thumb_7550c725751726ca0e0b7c4f262a9a7af00591e0-1390-534.png		1	1	2			\N	2022-02-17 14:17:23	2022-02-17 14:17:24
535		a545f3d7f427d70d1661b396f7f82a6c1b40a419-1391-535.jpg	1	_thumb_a545f3d7f427d70d1661b396f7f82a6c1b40a419-1391-535.png		1	1	2			\N	2022-02-17 14:19:58	2022-02-17 14:19:58
536		548be84e3a3f646612b0aa2eeedd530b5d818b87-1392-536.jpg	1	_thumb_548be84e3a3f646612b0aa2eeedd530b5d818b87-1392-536.png		1	1	2			\N	2022-02-17 14:31:14	2022-02-17 14:31:14
537		d9d56572d19cedf7714a123cabd6c88184c43050-1393-537.jpg	1	_thumb_d9d56572d19cedf7714a123cabd6c88184c43050-1393-537.png		1	1	2			\N	2022-02-17 14:33:10	2022-02-17 14:33:10
538		76fdb461cc0fa303d8b9b26179ec3f3194f41463-1394-538.jpg	1	_thumb_76fdb461cc0fa303d8b9b26179ec3f3194f41463-1394-538.png		1	1	2			\N	2022-02-17 14:34:39	2022-02-17 14:34:39
539		51cdf998b96a29e631f7bb4927d46257c5499682-1395-539.jpg	1	_thumb_51cdf998b96a29e631f7bb4927d46257c5499682-1395-539.png		1	1	2			\N	2022-02-17 14:35:55	2022-02-17 14:35:55
540		5e027456421b9feb795bbc1544d050dff9604fe9-1396-540.jpg	1	_thumb_5e027456421b9feb795bbc1544d050dff9604fe9-1396-540.png		1	1	2			\N	2022-02-17 14:37:16	2022-02-17 14:37:16
541		618fbba58977d9d089f0e326c149d3da2a6dd9eb-1397-541.jpg	1	_thumb_618fbba58977d9d089f0e326c149d3da2a6dd9eb-1397-541.png		1	1	2			\N	2022-02-17 14:38:36	2022-02-17 14:38:36
542		e7362e6c03f180f89af3157e3730731a69a8991d-1398-542.jpg	1	_thumb_e7362e6c03f180f89af3157e3730731a69a8991d-1398-542.png		1	1	2			\N	2022-02-17 14:40:30	2022-02-17 14:40:30
543		d932fafe9b395fcd7b45d241a1bfb91c702a9f69-1399-543.jpg	1	_thumb_d932fafe9b395fcd7b45d241a1bfb91c702a9f69-1399-543.png		1	1	2			\N	2022-02-17 14:43:34	2022-02-17 14:43:34
544		8a57214192fa3b94b62068729ce8b218ef8bff2b-1400-544.jpg	1	_thumb_8a57214192fa3b94b62068729ce8b218ef8bff2b-1400-544.png		1	1	2			\N	2022-02-17 15:11:39	2022-02-17 15:11:39
545		a95101cf9562286b475856b94233b2000e051eab-1401-545.jpg	1	_thumb_a95101cf9562286b475856b94233b2000e051eab-1401-545.png		1	1	2			\N	2022-02-17 15:15:08	2022-02-17 15:15:08
547		c7ed6258b43e46ca5706303337d07581192124cf-1401-547.jpg	1	_thumb_c7ed6258b43e46ca5706303337d07581192124cf-1401-547.png		1	1	2			\N	2022-02-17 15:44:47	2022-02-17 15:44:47
548		e125766e049e8a03945e0a3cc5fe8e686947b17b-1403-548.jpg	1	_thumb_e125766e049e8a03945e0a3cc5fe8e686947b17b-1403-548.png		1	1	2			\N	2022-02-17 15:50:07	2022-02-17 15:50:07
549		bfeb6320871cf6acf6de53ce4e596e75b8f303d8-1404-549.jpg	1	_thumb_bfeb6320871cf6acf6de53ce4e596e75b8f303d8-1404-549.png		1	1	2			\N	2022-02-17 15:51:53	2022-02-17 15:51:53
550		ed4a2b0b32ddaffdd4a19885689f55b05e9444c1-1405-550.jpg	1	_thumb_ed4a2b0b32ddaffdd4a19885689f55b05e9444c1-1405-550.png		1	1	2			\N	2022-02-17 16:01:51	2022-02-17 16:01:51
551		df3c611fe5aa25ec5a70f8e5a94656e88e9aa7e7-1406-551.jpg	1	_thumb_df3c611fe5aa25ec5a70f8e5a94656e88e9aa7e7-1406-551.png		1	1	2			\N	2022-02-17 16:06:22	2022-02-17 16:06:22
552		dc56371f9ff82d590c68fa71a2afc2d423d7ff97-1407-552.jpg	1	_thumb_dc56371f9ff82d590c68fa71a2afc2d423d7ff97-1407-552.png		1	1	2			\N	2022-02-17 16:10:06	2022-02-17 16:10:06
553		2b92518131582e71a16096f0710c8d6d122872fe-1408-553.jpg	1	_thumb_2b92518131582e71a16096f0710c8d6d122872fe-1408-553.png		1	1	2			\N	2022-02-17 16:15:05	2022-02-17 16:15:05
554		17cf9ef21e84ca01e39dd98dfdad3f14ae52c5df-1409-554.jpg	1	_thumb_17cf9ef21e84ca01e39dd98dfdad3f14ae52c5df-1409-554.png		1	1	2			\N	2022-02-17 16:18:53	2022-02-17 16:18:54
555		66d2ddffca88e46cf5dbd37ca475b388c74fe096-1410-555.jpg	1	_thumb_66d2ddffca88e46cf5dbd37ca475b388c74fe096-1410-555.png		1	1	2			\N	2022-02-17 16:20:15	2022-02-17 16:20:15
556		59cbeafeda06e6c698d964eebaa675bbf63dafbe-1411-556.jpg	1	_thumb_59cbeafeda06e6c698d964eebaa675bbf63dafbe-1411-556.png		1	1	2			\N	2022-02-17 16:22:05	2022-02-17 16:22:05
557		57e5342a5b2e8fd73348fae63560975d64099935-1412-557.jpg	1	_thumb_57e5342a5b2e8fd73348fae63560975d64099935-1412-557.png		1	1	2			\N	2022-02-17 16:26:36	2022-02-17 16:26:36
558		d8a6613502929cc9872757a211da5e4e7e97b75d-1413-558.jpg	1	_thumb_d8a6613502929cc9872757a211da5e4e7e97b75d-1413-558.png		1	1	2			\N	2022-02-17 16:28:55	2022-02-17 16:28:55
559		4a663b22a8426693b9b8c72c7a2d2dc6c3de2f9c-1414-559.jpg	1	_thumb_4a663b22a8426693b9b8c72c7a2d2dc6c3de2f9c-1414-559.png		1	1	2			\N	2022-02-17 16:33:20	2022-02-17 16:33:20
560		dfca30b35456b47db5123fd1878009952d95b6ba-1415-560.jpg	1	_thumb_dfca30b35456b47db5123fd1878009952d95b6ba-1415-560.png		1	1	2			\N	2022-02-17 16:38:11	2022-02-17 16:38:11
561		c0f7253a362de6b82add0df4690be9d768e074b3-1416-561.jpg	1	_thumb_c0f7253a362de6b82add0df4690be9d768e074b3-1416-561.png		1	1	2			\N	2022-02-17 16:41:15	2022-02-17 16:41:15
562		7f174e64735b61cfc717a924dc1d538194c1c557-1417-562.jpg	1	_thumb_7f174e64735b61cfc717a924dc1d538194c1c557-1417-562.png		1	1	2			\N	2022-02-17 16:42:52	2022-02-17 16:42:52
563		a22bf6652cd9de8742634a004b92c355e683114a-1418-563.jpg	1	_thumb_a22bf6652cd9de8742634a004b92c355e683114a-1418-563.png		1	1	2			\N	2022-02-17 16:45:04	2022-02-17 16:45:04
564		f72441f39d09b646ea703d550422b6de6196ce4c-1419-564.jpg	1	_thumb_f72441f39d09b646ea703d550422b6de6196ce4c-1419-564.png		1	1	2			\N	2022-02-17 16:47:09	2022-02-17 16:47:09
565		d98162e3fa2d613e96c78fd00b22df8a4c38abcd-1420-565.jpg	1	_thumb_d98162e3fa2d613e96c78fd00b22df8a4c38abcd-1420-565.png		1	1	2			\N	2022-02-17 16:49:21	2022-02-17 16:49:21
566		6443278a472711eaaa6b37c79fbadeb5dae1f2f9-1421-566.jpg	1	_thumb_6443278a472711eaaa6b37c79fbadeb5dae1f2f9-1421-566.png		1	1	2			\N	2022-02-17 16:54:45	2022-02-17 16:54:45
567		36dd76d9fa5ca1c90acada3f3f07ec092fa03d89-1422-567.jpg	1	_thumb_36dd76d9fa5ca1c90acada3f3f07ec092fa03d89-1422-567.png		1	1	2			\N	2022-02-17 16:56:38	2022-02-17 16:56:38
568		fc2668bbf81e24eafe3e99f3d3673391ccd1fd19-1423-568.jpg	1	_thumb_fc2668bbf81e24eafe3e99f3d3673391ccd1fd19-1423-568.png		1	1	2			\N	2022-02-17 17:48:35	2022-02-17 17:48:35
569		a0841e91d133b35b2d737006ad4c35a6448db926-1424-569.jpg	1	_thumb_a0841e91d133b35b2d737006ad4c35a6448db926-1424-569.png		1	1	2			\N	2022-02-17 19:16:39	2022-02-17 19:16:39
570		1d513f51ea17ff5055321cb70c70c29526f21ff0-1425-570.jpg	1	_thumb_1d513f51ea17ff5055321cb70c70c29526f21ff0-1425-570.png		1	1	2			\N	2022-02-17 19:20:26	2022-02-17 19:20:26
571		d9c90dab2c5c55da89389732c26de7999eb18d79-1186-571.jpg	1	_thumb_d9c90dab2c5c55da89389732c26de7999eb18d79-1186-571.png		1	1	2			\N	2022-02-17 19:32:16	2022-02-17 19:32:17
572		e8ec374ce5e7b37ad28481b67df48fa1be1cb2c8-1426-572.jpg	1	_thumb_e8ec374ce5e7b37ad28481b67df48fa1be1cb2c8-1426-572.png		1	1	2			\N	2022-02-17 19:34:06	2022-02-17 19:34:06
573		3b11513caa30e122321da1ba10b2107fda8c77c5-1427-573.jpg	1	_thumb_3b11513caa30e122321da1ba10b2107fda8c77c5-1427-573.png		1	1	2			\N	2022-02-17 19:36:23	2022-02-17 19:36:23
574		61c5a64f84d7165cc9ee97a46f152cee46a94f13-1428-574.jpg	1	_thumb_61c5a64f84d7165cc9ee97a46f152cee46a94f13-1428-574.png		1	1	2			\N	2022-02-17 19:40:12	2022-02-17 19:40:12
575		ee20a1cdcc6fc3864e8330fc63f6ca8cc1463c69-1429-575.jpg	1	_thumb_ee20a1cdcc6fc3864e8330fc63f6ca8cc1463c69-1429-575.png		1	1	2			\N	2022-02-17 19:45:56	2022-02-17 19:45:56
576		b93e2e00528344cb0d20ea2bd91bcfa67ffc1350-1430-576.jpg	1	_thumb_b93e2e00528344cb0d20ea2bd91bcfa67ffc1350-1430-576.png		1	1	2			\N	2022-02-17 19:49:10	2022-02-17 19:49:10
577		dda2f792b045ed01d776ebc5fe7f24cd198541a4-1431-577.jpg	1	_thumb_dda2f792b045ed01d776ebc5fe7f24cd198541a4-1431-577.png		1	1	2			\N	2022-02-17 20:12:28	2022-02-17 20:12:28
578		de780d7f4529fc93ea2e9d277351afd4b4bc40e3-1432-578.jpg	1	_thumb_de780d7f4529fc93ea2e9d277351afd4b4bc40e3-1432-578.png		1	1	2			\N	2022-02-17 20:18:41	2022-02-17 20:18:41
579		57e9731da036bc4196ea27317413e7068436020c-1433-579.jpg	1	_thumb_57e9731da036bc4196ea27317413e7068436020c-1433-579.png		1	1	2			\N	2022-02-17 20:21:24	2022-02-17 20:21:24
580		a0d04b8de9516789796ab2c2545548be5fd4069f-1434-580.jpg	1	_thumb_a0d04b8de9516789796ab2c2545548be5fd4069f-1434-580.png		1	1	2			\N	2022-02-17 20:23:23	2022-02-17 20:23:23
581		c7cb4814e8b135d193e49ba9ae7612304f295cc2-1435-581.jpg	1	_thumb_c7cb4814e8b135d193e49ba9ae7612304f295cc2-1435-581.png		1	1	2			\N	2022-02-17 20:29:43	2022-02-17 20:29:43
582		8180ae64508a0ba8f2dcc45bee4b18ef7e900ebd-1436-582.jpg	1	_thumb_8180ae64508a0ba8f2dcc45bee4b18ef7e900ebd-1436-582.png		1	1	2			\N	2022-02-17 20:31:31	2022-02-17 20:31:31
583		8f07cf3199b6a635a006960cb53054a51c4a5199-1437-583.jpg	1	_thumb_8f07cf3199b6a635a006960cb53054a51c4a5199-1437-583.png		1	1	2			\N	2022-02-17 20:32:37	2022-02-17 20:32:37
584		bf2a5227b764e511177c7f56773972e2c8e06d85-1438-584.jpg	1	_thumb_bf2a5227b764e511177c7f56773972e2c8e06d85-1438-584.png		1	1	2			\N	2022-02-17 20:35:38	2022-02-17 20:35:38
585		8b3a3d920b4593f88e2fe10346c1de2085cbf059-1439-585.jpg	1	_thumb_8b3a3d920b4593f88e2fe10346c1de2085cbf059-1439-585.png		1	1	2			\N	2022-02-17 20:42:02	2022-02-17 20:42:02
586		c5311d65e460974d100402163e224fe9e72b378a-1440-586.jpg	1	_thumb_c5311d65e460974d100402163e224fe9e72b378a-1440-586.png		1	1	2			\N	2022-02-17 20:46:02	2022-02-17 20:46:02
587		41133617b52f8bd46ac91de129d460c395fb7e4a-1441-587.jpg	1	_thumb_41133617b52f8bd46ac91de129d460c395fb7e4a-1441-587.png		1	1	2			\N	2022-02-17 20:48:20	2022-02-17 20:48:20
588		8e09bd5569716ea854b0202c835ace54c7c51e94-1442-588.jpg	1	_thumb_8e09bd5569716ea854b0202c835ace54c7c51e94-1442-588.png		1	1	2			\N	2022-02-17 20:54:15	2022-02-17 20:54:15
589		8791a05c77624b8773c996eac6131f96476a4b8d-1443-589.jpg	1	_thumb_8791a05c77624b8773c996eac6131f96476a4b8d-1443-589.png		1	1	2			\N	2022-02-17 20:56:53	2022-02-17 20:56:53
590		3e2ff46ca2c3146b24f6c5a17b43338a88c41b9a-1444-590.jpg	1	_thumb_3e2ff46ca2c3146b24f6c5a17b43338a88c41b9a-1444-590.png		1	1	2			\N	2022-02-17 21:27:07	2022-02-17 21:27:07
592		0ac8e9e8b1c6776b9fef46e911bbaeb8c71c7795-1445-592.jpg	1	_thumb_0ac8e9e8b1c6776b9fef46e911bbaeb8c71c7795-1445-592.png		1	1	2			\N	2022-02-17 21:30:15	2022-02-17 21:30:16
593		cbd99b5e0aeec69e0cccafabdebe05e9bd677a91-1431-593.jpg	1	_thumb_cbd99b5e0aeec69e0cccafabdebe05e9bd677a91-1431-593.png		1	1	2			\N	2022-02-18 13:20:33	2022-02-18 13:20:33
594		4e997f94fa9f20be5025b2c28b594df18c3a0fd3-1446-594.jpg	1	_thumb_4e997f94fa9f20be5025b2c28b594df18c3a0fd3-1446-594.png		1	1	2			\N	2022-02-18 13:34:02	2022-02-18 13:34:02
595		5bd3672b4171a20d65fb8b335820dadec8ba551f-1447-595.jpg	1	_thumb_5bd3672b4171a20d65fb8b335820dadec8ba551f-1447-595.png		1	1	2			\N	2022-02-18 13:36:51	2022-02-18 13:36:51
596		79700f67f2534558d130b0ef2af1e80143fd1cbc-1448-596.jpg	1	_thumb_79700f67f2534558d130b0ef2af1e80143fd1cbc-1448-596.png		1	1	2			\N	2022-02-18 13:42:11	2022-02-18 13:42:11
597		3cb0541fe977bc40e6b088b1d8014de394e95572-1449-597.jpg	1	_thumb_3cb0541fe977bc40e6b088b1d8014de394e95572-1449-597.png		1	1	2			\N	2022-02-18 13:45:34	2022-02-18 13:45:34
598		55047e0ac54c5110c50c16e6b4b42a78516a044a-1450-598.jpg	1	_thumb_55047e0ac54c5110c50c16e6b4b42a78516a044a-1450-598.png		1	1	2			\N	2022-02-18 13:47:09	2022-02-18 13:47:09
599		aed041d646660784d0bfbfd3a9613c17bef9a3f2-1451-599.jpg	1	_thumb_aed041d646660784d0bfbfd3a9613c17bef9a3f2-1451-599.png		1	1	2			\N	2022-02-18 13:48:59	2022-02-18 13:48:59
600		8abf19b4594bc0f57cf504b26dc27102a0b96c8f-1452-600.jpg	1	_thumb_8abf19b4594bc0f57cf504b26dc27102a0b96c8f-1452-600.png		1	1	2			\N	2022-02-18 13:50:13	2022-02-18 13:50:13
601		a70271d9240ac033daa829710517dcd0ca2d09d7-1453-601.jpg	1	_thumb_a70271d9240ac033daa829710517dcd0ca2d09d7-1453-601.png		1	1	2			\N	2022-02-18 13:51:39	2022-02-18 13:51:39
602		a46435256826a7085bd9ccf17c2ef5c7d0a39d43-1454-602.jpg	1	_thumb_a46435256826a7085bd9ccf17c2ef5c7d0a39d43-1454-602.png		1	1	2			\N	2022-02-18 13:52:50	2022-02-18 13:52:50
603		a90ac913342d6375ecb685299d2d7492bda2efa3-1455-603.jpg	1	_thumb_a90ac913342d6375ecb685299d2d7492bda2efa3-1455-603.png		1	1	2			\N	2022-02-18 13:54:21	2022-02-18 13:54:21
604		36b628e9e3bf6cda3bb8b1bfbe2ed42029aa3034-1456-604.jpg	1	_thumb_36b628e9e3bf6cda3bb8b1bfbe2ed42029aa3034-1456-604.png		1	1	2			\N	2022-02-18 13:55:58	2022-02-18 13:55:58
605		b2bdd0c0b832c0280bc9a5f4b43561fabfb3dff0-1457-605.jpg	1	_thumb_b2bdd0c0b832c0280bc9a5f4b43561fabfb3dff0-1457-605.png		1	1	2			\N	2022-02-18 13:57:15	2022-02-18 13:57:15
606		b9d31e329191728ad170ac1198a99e4f53ecdb05-1458-606.jpg	1	_thumb_b9d31e329191728ad170ac1198a99e4f53ecdb05-1458-606.png		1	1	2			\N	2022-02-18 13:59:09	2022-02-18 13:59:09
607		cc0d75d8a3269296936888330846ca05bd9245ad-1459-607.jpg	1	_thumb_cc0d75d8a3269296936888330846ca05bd9245ad-1459-607.png		1	1	2			\N	2022-02-18 14:03:06	2022-02-18 14:03:06
608		dfb2dcb7488c54191a787c284be730f1b2406837-1460-608.jpg	1	_thumb_dfb2dcb7488c54191a787c284be730f1b2406837-1460-608.png		1	1	2			\N	2022-02-18 14:05:14	2022-02-18 14:05:14
609		67ab091698e4e7b82075cf93aef62f55c681959f-1461-609.jpg	1	_thumb_67ab091698e4e7b82075cf93aef62f55c681959f-1461-609.png		1	1	2			\N	2022-02-18 14:09:48	2022-02-18 14:09:48
610		9827ee2fe937c2de7eaf1975389ae8d3eda6a325-1462-610.jpg	1	_thumb_9827ee2fe937c2de7eaf1975389ae8d3eda6a325-1462-610.png		1	1	2			\N	2022-02-18 14:11:05	2022-02-18 14:11:05
611		1e8bc1fdd19a64b444ac12de6ff1b131ef7c236c-1463-611.jpg	1	_thumb_1e8bc1fdd19a64b444ac12de6ff1b131ef7c236c-1463-611.png		1	1	2			\N	2022-02-18 14:12:34	2022-02-18 14:12:34
612		bdb159a06f7a10349400e16bbf7ed68d066b56a8-1464-612.jpg	1	_thumb_bdb159a06f7a10349400e16bbf7ed68d066b56a8-1464-612.png		1	1	2			\N	2022-02-18 14:14:49	2022-02-18 14:14:49
613		620160258338625223f2f451cba7a52851ae68ec-1465-613.jpg	1	_thumb_620160258338625223f2f451cba7a52851ae68ec-1465-613.png		1	1	2			\N	2022-02-18 14:44:17	2022-02-18 14:44:17
614		3e299f8dd99ef7c911458b40273ac6c47ca61eae-1466-614.jpg	1	_thumb_3e299f8dd99ef7c911458b40273ac6c47ca61eae-1466-614.png		1	1	2			\N	2022-02-18 14:53:37	2022-02-18 14:53:37
615		2f915b48b46cc629bb370162e654061be9b35a50-1467-615.jpg	1	_thumb_2f915b48b46cc629bb370162e654061be9b35a50-1467-615.png		1	1	2			\N	2022-02-18 15:35:41	2022-02-18 15:35:41
616		cd0f51a5623a3b8fec3c0fbe999e2853837aad06-1468-616.jpg	1	_thumb_cd0f51a5623a3b8fec3c0fbe999e2853837aad06-1468-616.png		1	1	2			\N	2022-02-18 15:38:10	2022-02-18 15:38:10
617		3019a53d0a83e9ce9401d415cc12f57f0803d23a-1469-617.jpg	1	_thumb_3019a53d0a83e9ce9401d415cc12f57f0803d23a-1469-617.png		1	1	2			\N	2022-02-18 15:41:37	2022-02-18 15:41:37
618		f9fffb92ebb853fc2646d8b1a590d80903615ec7-1470-618.jpg	1	_thumb_f9fffb92ebb853fc2646d8b1a590d80903615ec7-1470-618.png		1	1	2			\N	2022-02-18 15:44:54	2022-02-18 15:44:54
619		18001a34ae7f0faf2a71e600153888ed4796dfa8-1471-619.jpg	1	_thumb_18001a34ae7f0faf2a71e600153888ed4796dfa8-1471-619.png		1	1	2			\N	2022-02-18 15:46:58	2022-02-18 15:46:58
620		7f4395eb9baec23a0501eff2bfa079930d48ce6a-1472-620.jpg	1	_thumb_7f4395eb9baec23a0501eff2bfa079930d48ce6a-1472-620.png		1	1	2			\N	2022-02-18 15:49:42	2022-02-18 15:49:42
622		ad18928fec8bfc53a4c50092822e22ac0df16206-1473-622.jpg	1	_thumb_ad18928fec8bfc53a4c50092822e22ac0df16206-1473-622.png		1	1	2			\N	2022-02-18 15:51:36	2022-02-18 15:51:36
623		1aa1b9b80201cf1260b9de62fbb55b3933130232-1474-623.jpg	1	_thumb_1aa1b9b80201cf1260b9de62fbb55b3933130232-1474-623.png		1	1	2			\N	2022-02-18 16:12:32	2022-02-18 16:12:32
624		9a73f30beed46d785276b04eec41bb004b3174ac-1475-624.jpg	1	_thumb_9a73f30beed46d785276b04eec41bb004b3174ac-1475-624.png		1	1	2			\N	2022-02-18 16:36:00	2022-02-18 16:36:00
625		2da53c3922e6a92336342fa3e1a16d61c6fa6dc8-1476-625.jpg	1	_thumb_2da53c3922e6a92336342fa3e1a16d61c6fa6dc8-1476-625.png		1	1	2			\N	2022-02-18 16:40:52	2022-02-18 16:40:52
626		506dc90a06382a7611f46614204edea80dd497d0-1477-626.jpg	1	_thumb_506dc90a06382a7611f46614204edea80dd497d0-1477-626.png		1	1	2			\N	2022-02-18 16:42:07	2022-02-18 16:42:07
627		1da5bb8893f62206f5d72c72cfcd6debd8a98f6e-1478-627.jpg	1	_thumb_1da5bb8893f62206f5d72c72cfcd6debd8a98f6e-1478-627.png		1	1	2			\N	2022-02-18 16:44:00	2022-02-18 16:44:00
628		d6d9a0b51b9a3896bf7b6cc21744157b8a4fbf28-1479-628.jpg	1	_thumb_d6d9a0b51b9a3896bf7b6cc21744157b8a4fbf28-1479-628.png		1	1	2			\N	2022-02-18 16:46:01	2022-02-18 16:46:01
629		a8410699315ee28923b86cd751fecdc393a37e43-1480-629.jpg	1	_thumb_a8410699315ee28923b86cd751fecdc393a37e43-1480-629.png		1	1	2			\N	2022-02-18 16:49:09	2022-02-18 16:49:09
630		07d8150be3f18b990de4c53add84f74cbcc6989e-1481-630.jpg	1	_thumb_07d8150be3f18b990de4c53add84f74cbcc6989e-1481-630.png		1	1	2			\N	2022-02-18 16:55:55	2022-02-18 16:55:55
631		1fa4e46a36b2ebaf0eb865afb244e38f96989639-1482-631.jpg	1	_thumb_1fa4e46a36b2ebaf0eb865afb244e38f96989639-1482-631.png		1	1	2			\N	2022-02-18 16:57:48	2022-02-18 16:57:48
632		e9b8a66196970d751da1b0e0ed1b3ccd8441fded-1483-632.jpg	1	_thumb_e9b8a66196970d751da1b0e0ed1b3ccd8441fded-1483-632.png		1	1	2			\N	2022-02-18 16:59:09	2022-02-18 16:59:09
633		69e448719e6c8143db8735045012f409c8879863-1484-633.jpg	1	_thumb_69e448719e6c8143db8735045012f409c8879863-1484-633.png		1	1	2			\N	2022-02-18 17:00:51	2022-02-18 17:00:51
635		6e38ae6bb2642680dc703ca9da5b090fb974ce82-1485-635.jpg	1	_thumb_6e38ae6bb2642680dc703ca9da5b090fb974ce82-1485-635.png		1	1	2			\N	2022-02-18 17:03:21	2022-02-18 17:03:21
636		e0529a99c0368d74b5ef3043ed77734df1ad2431-1486-636.jpg	1	_thumb_e0529a99c0368d74b5ef3043ed77734df1ad2431-1486-636.png		1	1	2			\N	2022-02-18 17:08:51	2022-02-18 17:08:51
637		3e29ee66450b64486fb476c7f7233cd6883fee61-1487-637.jpg	1	_thumb_3e29ee66450b64486fb476c7f7233cd6883fee61-1487-637.png		1	1	2			\N	2022-02-18 17:10:13	2022-02-18 17:10:13
638		8ab9c1b85688f0a3b1351b8c5a9074f57a598a03-1488-638.jpg	1	_thumb_8ab9c1b85688f0a3b1351b8c5a9074f57a598a03-1488-638.png		1	1	2			\N	2022-02-18 17:11:27	2022-02-18 17:11:27
639		909248ba64930e38bbdfc3d75cc68078f9e69967-1489-639.jpg	1	_thumb_909248ba64930e38bbdfc3d75cc68078f9e69967-1489-639.png		1	1	2			\N	2022-02-18 17:12:55	2022-02-18 17:12:55
640		6f346a547498a9596d3f37e0557ee01272b819fb-1490-640.jpg	1	_thumb_6f346a547498a9596d3f37e0557ee01272b819fb-1490-640.png		1	1	2			\N	2022-02-18 17:15:07	2022-02-18 17:15:07
641		f2f880b599f311953e8602a3866109a88e5181d9-1491-641.jpg	1	_thumb_f2f880b599f311953e8602a3866109a88e5181d9-1491-641.png		1	1	2			\N	2022-02-18 19:46:03	2022-02-18 19:46:03
642		409792661c7bccfed4a8383d86318c9c363f2e6d-1492-642.jpg	1	_thumb_409792661c7bccfed4a8383d86318c9c363f2e6d-1492-642.png		1	1	2			\N	2022-02-18 19:50:00	2022-02-18 19:50:00
643		a06146a202252d11c46850a3d1117c39b7f7406d-1493-643.jpg	1	_thumb_a06146a202252d11c46850a3d1117c39b7f7406d-1493-643.png		1	1	2			\N	2022-02-18 19:54:15	2022-02-18 19:54:15
644		8e7235632787a0a1756f168e753141cfb5bc6c00-1494-644.jpg	1	_thumb_8e7235632787a0a1756f168e753141cfb5bc6c00-1494-644.png		1	1	2			\N	2022-02-18 20:01:59	2022-02-18 20:01:59
645		cf0c7824aa1c5418dfce24f2d62edf443794acc7-1495-645.jpg	1	_thumb_cf0c7824aa1c5418dfce24f2d62edf443794acc7-1495-645.png		1	1	2			\N	2022-02-18 20:09:58	2022-02-18 20:09:58
646		975954101ed041c513f3fdc843fdc6d8ccb5dee7-1496-646.jpg	1	_thumb_975954101ed041c513f3fdc843fdc6d8ccb5dee7-1496-646.png		1	1	2			\N	2022-02-18 20:13:59	2022-02-18 20:13:59
647		0c96c951031bc1ef56b120f6730d17b41911db65-1497-647.jpg	1	_thumb_0c96c951031bc1ef56b120f6730d17b41911db65-1497-647.png		1	1	2			\N	2022-02-18 20:21:17	2022-02-18 20:21:17
648		c7514a4841a13f3c0b00fd1be39c51498aad2c72-1498-648.jpg	1	_thumb_c7514a4841a13f3c0b00fd1be39c51498aad2c72-1498-648.png		1	1	2			\N	2022-02-18 20:36:41	2022-02-18 20:36:41
649		5f80ff8bd94caf4269e2dab1712c37dfd4e1a355-1499-649.jpg	1	_thumb_5f80ff8bd94caf4269e2dab1712c37dfd4e1a355-1499-649.png		1	1	2			\N	2022-02-18 20:43:59	2022-02-18 20:43:59
650		0edb87b5d232f6ceb3e7d4e26944ff5628504603-1498-650.jpg	1	_thumb_0edb87b5d232f6ceb3e7d4e26944ff5628504603-1498-650.png		1	1	2			\N	2022-02-18 20:50:33	2022-02-18 20:50:33
651		3430e4dba880a19efd1c19088c1e7683d1e6d19d-1502-651.jpg	1	_thumb_3430e4dba880a19efd1c19088c1e7683d1e6d19d-1502-651.png		1	1	2			\N	2022-02-18 20:54:12	2022-02-18 20:54:12
652		86e5c52f47d8d8c99187e4c746ed41a846c8c1d1-1503-652.jpg	1	_thumb_86e5c52f47d8d8c99187e4c746ed41a846c8c1d1-1503-652.png		1	1	2			\N	2022-02-18 20:57:25	2022-02-18 20:57:25
653		e69dcff6fe14a2566ad006db00aba96463da34b4-1504-653.jpg	1	_thumb_e69dcff6fe14a2566ad006db00aba96463da34b4-1504-653.png		1	1	2			\N	2022-02-18 21:21:15	2022-02-18 21:21:15
654		376f08774cc80186fb6ca07572932e03649d6aae-1505-654.jpg	1	_thumb_376f08774cc80186fb6ca07572932e03649d6aae-1505-654.png		1	1	2			\N	2022-02-18 21:23:19	2022-02-18 21:23:19
655		d5a5414491bf4f68af07d4c259b8cd39d1e37adf-1506-655.jpg	1	_thumb_d5a5414491bf4f68af07d4c259b8cd39d1e37adf-1506-655.png		1	1	2			\N	2022-02-18 21:26:01	2022-02-18 21:26:01
657		723a6092d30bc0d8cadf19d26b9d0f87dd23bfd1-1507-657.jpg	1	_thumb_723a6092d30bc0d8cadf19d26b9d0f87dd23bfd1-1507-657.png		1	1	2			\N	2022-02-18 21:37:46	2022-02-18 21:37:46
658		ce73ab93375dc5f4e3c4f4206b236872091e194f-1508-658.jpg	1	_thumb_ce73ab93375dc5f4e3c4f4206b236872091e194f-1508-658.png		1	1	2			\N	2022-02-21 16:47:57	2022-02-21 16:47:57
659		cb23aff5aa17b43e8560d5a49421a242ab00c3f9-1509-659.jpg	1	_thumb_cb23aff5aa17b43e8560d5a49421a242ab00c3f9-1509-659.png		1	1	2			\N	2022-02-21 18:26:25	2022-02-21 18:26:25
660		23a51e4ccd1249960f8f82bf4f365b096b08eb26-1510-660.jpg	1	_thumb_23a51e4ccd1249960f8f82bf4f365b096b08eb26-1510-660.png		1	1	2			\N	2022-02-21 18:35:30	2022-02-21 18:35:30
661		7e04dff4acba79fa08c7f0468cc8078c9fbb5277-1513-661.jpg	1	_thumb_7e04dff4acba79fa08c7f0468cc8078c9fbb5277-1513-661.png		1	1	2			\N	2022-02-21 18:52:40	2022-02-21 18:52:40
662		ab89d3d8a856f001a5660c89b360bd1e43156d2c-1514-662.jpg	1	_thumb_ab89d3d8a856f001a5660c89b360bd1e43156d2c-1514-662.png		1	1	2			\N	2022-02-21 18:56:06	2022-02-21 18:56:06
663		0eef9f57edbfa9d11c12a1bcda9d957f6c206fea-1515-663.jpg	1	_thumb_0eef9f57edbfa9d11c12a1bcda9d957f6c206fea-1515-663.png		1	1	2			\N	2022-02-21 18:59:58	2022-02-21 18:59:58
664		98606fa711821c857e0491e1c0a88a6911628ab9-1516-664.jpg	1	_thumb_98606fa711821c857e0491e1c0a88a6911628ab9-1516-664.png		1	1	2			\N	2022-02-21 20:17:27	2022-02-21 20:17:27
665		9b77c553c0c8ff5a0d5c2c73f31357464bf50dad-1517-665.jpg	1	_thumb_9b77c553c0c8ff5a0d5c2c73f31357464bf50dad-1517-665.png		1	1	2			\N	2022-02-21 20:21:44	2022-02-21 20:21:44
666		11d245aed050ab9d3ce010d9a437225ca6f80b3e-1518-666.jpg	1	_thumb_11d245aed050ab9d3ce010d9a437225ca6f80b3e-1518-666.png		1	1	2			\N	2022-02-21 20:24:59	2022-02-21 20:24:59
667		01786de5b66b41f153cfb5d63cb13deaeb01118a-1519-667.jpg	1	_thumb_01786de5b66b41f153cfb5d63cb13deaeb01118a-1519-667.png		1	1	2			\N	2022-02-22 14:27:26	2022-02-22 14:27:26
668		a7c34b536ef09c5d1922b5590bbb6c43e625aae7-1520-668.jpg	1	_thumb_a7c34b536ef09c5d1922b5590bbb6c43e625aae7-1520-668.png		1	1	2			\N	2022-02-22 14:36:20	2022-02-22 14:36:20
669		94f8fc7bca80d68bb4e34633f298ce7fe2496d3c-1521-669.jpg	1	_thumb_94f8fc7bca80d68bb4e34633f298ce7fe2496d3c-1521-669.png		1	1	2			\N	2022-02-22 15:08:46	2022-02-22 15:08:46
670		f5f3dbf5ec0cb9d103809f338107dc8f04f996c0-1522-670.jpg	1	_thumb_f5f3dbf5ec0cb9d103809f338107dc8f04f996c0-1522-670.png		1	1	2			\N	2022-02-22 15:10:46	2022-02-22 15:10:46
671		e4132aebb4abdcadda3b95d99a1990c50fc23254-1523-671.jpg	1	_thumb_e4132aebb4abdcadda3b95d99a1990c50fc23254-1523-671.png		1	1	2			\N	2022-02-22 15:19:20	2022-02-22 15:19:20
672		5118bf272c2a3f28f51bd14bbf88fd22611c4215-1524-672.jpg	1	_thumb_5118bf272c2a3f28f51bd14bbf88fd22611c4215-1524-672.png		1	1	2			\N	2022-02-22 15:23:06	2022-02-22 15:23:06
673		c3fb0a4661d7c8fda3c9ca07bc8ed11b19a6ecf4-1526-673.jpg	1	_thumb_c3fb0a4661d7c8fda3c9ca07bc8ed11b19a6ecf4-1526-673.png		1	1	2			\N	2022-02-22 15:26:40	2022-02-22 15:26:40
\.


--
-- TOC entry 4211 (class 0 OID 19471)
-- Dependencies: 235
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
\.


--
-- TOC entry 4212 (class 0 OID 19474)
-- Dependencies: 236
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_user (id, user_id, role_id, deleted_at, created_at, updated_at) FROM stdin;
1	1	1	\N	\N	\N
2	2	2	\N	\N	\N
\.


--
-- TOC entry 4214 (class 0 OID 19479)
-- Dependencies: 238
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
-- TOC entry 4216 (class 0 OID 19490)
-- Dependencies: 240
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- TOC entry 4217 (class 0 OID 19496)
-- Dependencies: 241
-- Data for Name: tipomaterial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipomaterial (id, tipo_material, empresa_id, creado_por_id, deleted_at, created_at, updated_at, searchtext) FROM stdin;
1	LIBRO	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'libr':1
2	REVISTA	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'revist':1
3	CD	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'cd':1
4	DVD	1	1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41	'dvd':1
\.


--
-- TOC entry 4219 (class 0 OID 19507)
-- Dependencies: 243
-- Data for Name: user_adress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_adress (id, calle, num_ext, num_int, colonia, localidad, municipio, estado, pais, cp, user_id, deleted_at, created_at, updated_at) FROM stdin;
1							TABASCO	MÉXICO		1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2							TABASCO	MÉXICO		2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 4221 (class 0 OID 19524)
-- Dependencies: 245
-- Data for Name: user_extend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_extend (id, ocupacion, profesion, lugar_trabajo, lugar_nacimiento, user_id, deleted_at, created_at, updated_at) FROM stdin;
1					1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2					2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 4223 (class 0 OID 19536)
-- Dependencies: 247
-- Data for Name: user_social; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_social (id, red_social, username_red_social, alias_red_social, user_id, deleted_at, created_at, updated_at) FROM stdin;
1				1	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
2				2	\N	2021-10-01 20:45:41	2021-10-01 20:45:41
\.


--
-- TOC entry 4225 (class 0 OID 19544)
-- Dependencies: 249
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, nombre, ap_paterno, ap_materno, curp, emails, celulares, telefonos, fecha_nacimiento, genero, root, filename, filename_png, filename_thumb, admin, session_id, status_user, empresa_id, creado_por_id, user_id_anterior, ip, host, logged, logged_at, logout_at, email_verified_at, id_sistema_anterior, deleted_at, remember_token, created_at, updated_at, searchtext) FROM stdin;
1	Admin	sentauro@gmail.com	$2y$10$aRnBNUUWDzO8tw5cKPXrYun.nTTHLZ2E.vpPoluNBqFpgaxRbYnf6	Administrador	\N	\N					\N	1	profile/	1.png	_1_.png	_thumb_1.png	t	\N	1	1	1	0	192.168.255.1	192.168.255.1	f	\N	\N	2021-10-01 20:45:41	0	\N	wGolBtHStaAsRyBUl95GPkH7DpEj2T1mNJwsgn9vrhLFZPQEQjF7MlaHFhWT	2021-10-01 20:45:41	2021-10-01 21:00:06	'administr':1
2	SysOp	sysop@example.com	$2y$10$r6CkO9lCsJkmryvqSge/l.ChypwxQsqEkCPMuWLEoK1UPMGEcAvvO	System Operator	\N	\N					\N	0	profile/	2.jpg	_2_.png	_thumb_2.png	f	\N	1	1	1	0	187.141.121.144	187.141.121.144	f	\N	\N	2021-10-01 20:45:41	0	\N	eGgVQr9mN74ac0QCzVbZ1SWMYS35S9mkaR3gtdWpx5en8DwcggLh1hLrowMv	2021-10-01 20:45:41	2021-10-11 17:14:08	'operator':2 'system':1
\.


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 197
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 1, false);


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 199
-- Name: codigopaises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.codigopaises_id_seq', 1, false);


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 201
-- Name: editoriale_libro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriale_libro_id_seq', 1, false);


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 203
-- Name: editoriales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editoriales_id_seq', 259, true);


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 205
-- Name: empresas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresas_id_seq', 1, true);


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 207
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 209
-- Name: historiallibros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historiallibros_id_seq', 8, true);


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 211
-- Name: imagen_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagen_user_id_seq', 1, false);


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 213
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_id_seq', 1, false);


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 215
-- Name: inventariolibro_portada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventariolibro_portada_id_seq', 1169, true);


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 217
-- Name: inventariolibros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventariolibros_id_seq', 1220, true);


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 219
-- Name: libro_portada_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_portada_id_seq', 673, true);


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 221
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_seq', 1527, true);


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 223
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 39, true);


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 228
-- Name: permission_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_role_id_seq', 1, false);


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 230
-- Name: permission_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_user_id_seq', 2, true);


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 232
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 11, true);


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 234
-- Name: portadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portadas_id_seq', 673, true);


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 237
-- Name: role_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_user_id_seq', 2, true);


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 239
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 242
-- Name: tipomaterial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipomaterial_id_seq', 4, true);


--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 244
-- Name: user_adress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_adress_id_seq', 2, true);


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 246
-- Name: user_extend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_extend_id_seq', 2, true);


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 248
-- Name: user_social_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_social_id_seq', 2, true);


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 250
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3866 (class 2606 OID 19594)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3871 (class 2606 OID 19596)
-- Name: codigopaises codigopaises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_pkey PRIMARY KEY (id);


--
-- TOC entry 3873 (class 2606 OID 19598)
-- Name: editoriale_libro editoriale_libro_editoriale_id_libro_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_editoriale_id_libro_id_unique UNIQUE (editoriale_id, libro_id);


--
-- TOC entry 3875 (class 2606 OID 19600)
-- Name: editoriale_libro editoriale_libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_pkey PRIMARY KEY (id);


--
-- TOC entry 3878 (class 2606 OID 19602)
-- Name: editoriales editoriales_editorial_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_editorial_unique UNIQUE (editorial);


--
-- TOC entry 3881 (class 2606 OID 19604)
-- Name: editoriales editoriales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_pkey PRIMARY KEY (id);


--
-- TOC entry 3885 (class 2606 OID 19606)
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- TOC entry 3887 (class 2606 OID 19608)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3889 (class 2606 OID 19610)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3895 (class 2606 OID 19612)
-- Name: historiallibros historiallibros_libro_id_inventariolibro_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_libro_id_inventariolibro_id_user_id_unique UNIQUE (libro_id, inventariolibro_id, user_id);


--
-- TOC entry 3897 (class 2606 OID 19614)
-- Name: historiallibros historiallibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_pkey PRIMARY KEY (id);


--
-- TOC entry 3901 (class 2606 OID 19616)
-- Name: imagen_user imagen_user_imagen_id_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_imagen_id_user_id_unique UNIQUE (imagen_id, user_id);


--
-- TOC entry 3903 (class 2606 OID 19618)
-- Name: imagen_user imagen_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3907 (class 2606 OID 19620)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 19622)
-- Name: inventariolibro_portada inventariolibro_portada_inventariolibro_id_portada_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_inventariolibro_id_portada_id_unique UNIQUE (inventariolibro_id, portada_id);


--
-- TOC entry 3912 (class 2606 OID 19624)
-- Name: inventariolibro_portada inventariolibro_portada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_pkey PRIMARY KEY (id);


--
-- TOC entry 3915 (class 2606 OID 19626)
-- Name: inventariolibros inventariolibros_codebar_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_codebar_unique UNIQUE (codebar);


--
-- TOC entry 3920 (class 2606 OID 19628)
-- Name: inventariolibros inventariolibros_isbn_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_isbn_unique UNIQUE (isbn);


--
-- TOC entry 3922 (class 2606 OID 19630)
-- Name: inventariolibros inventariolibros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_pkey PRIMARY KEY (id);


--
-- TOC entry 3927 (class 2606 OID 19632)
-- Name: libro_portada libro_portada_libro_id_portada_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_libro_id_portada_id_unique UNIQUE (libro_id, portada_id);


--
-- TOC entry 3929 (class 2606 OID 19634)
-- Name: libro_portada libro_portada_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_pkey PRIMARY KEY (id);


--
-- TOC entry 3934 (class 2606 OID 19636)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- TOC entry 3938 (class 2606 OID 19638)
-- Name: libros libros_titulo_autor_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_titulo_autor_unique UNIQUE (titulo, autor);


--
-- TOC entry 3940 (class 2606 OID 19640)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3943 (class 2606 OID 19642)
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- TOC entry 3946 (class 2606 OID 19644)
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- TOC entry 3949 (class 2606 OID 19646)
-- Name: permission_role permission_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3951 (class 2606 OID 19648)
-- Name: permission_role permission_role_role_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_permission_id_unique UNIQUE (role_id, permission_id);


--
-- TOC entry 3953 (class 2606 OID 19650)
-- Name: permission_user permission_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3955 (class 2606 OID 19652)
-- Name: permission_user permission_user_user_id_permission_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_permission_id_unique UNIQUE (user_id, permission_id);


--
-- TOC entry 3957 (class 2606 OID 19654)
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 3959 (class 2606 OID 19656)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3963 (class 2606 OID 19658)
-- Name: portadas portadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_pkey PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 19660)
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- TOC entry 3967 (class 2606 OID 19662)
-- Name: role_user role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3969 (class 2606 OID 19664)
-- Name: role_user role_user_user_id_role_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_role_id_unique UNIQUE (user_id, role_id);


--
-- TOC entry 3971 (class 2606 OID 19666)
-- Name: roles roles_abreviatura_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_abreviatura_unique UNIQUE (abreviatura);


--
-- TOC entry 3973 (class 2606 OID 19668)
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- TOC entry 3975 (class 2606 OID 19670)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3978 (class 2606 OID 19672)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3983 (class 2606 OID 19674)
-- Name: tipomaterial tipomaterial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_pkey PRIMARY KEY (id);


--
-- TOC entry 3986 (class 2606 OID 19676)
-- Name: user_adress user_adress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_pkey PRIMARY KEY (id);


--
-- TOC entry 3988 (class 2606 OID 19678)
-- Name: user_extend user_extend_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend
    ADD CONSTRAINT user_extend_pkey PRIMARY KEY (id);


--
-- TOC entry 3990 (class 2606 OID 19680)
-- Name: user_social user_social_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social
    ADD CONSTRAINT user_social_pkey PRIMARY KEY (id);


--
-- TOC entry 3996 (class 2606 OID 19682)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3999 (class 2606 OID 19684)
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- TOC entry 3867 (class 1259 OID 19685)
-- Name: codigopaises_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_creado_por_id_index ON public.codigopaises USING btree (creado_por_id);


--
-- TOC entry 3868 (class 1259 OID 19686)
-- Name: codigopaises_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_empresa_id_index ON public.codigopaises USING btree (empresa_id);


--
-- TOC entry 3869 (class 1259 OID 19687)
-- Name: codigopaises_migration_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX codigopaises_migration_id_index ON public.codigopaises USING btree (migration_id);


--
-- TOC entry 3876 (class 1259 OID 19688)
-- Name: editoriales_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_creado_por_id_index ON public.editoriales USING btree (creado_por_id);


--
-- TOC entry 3879 (class 1259 OID 19689)
-- Name: editoriales_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_empresa_id_index ON public.editoriales USING btree (empresa_id);


--
-- TOC entry 3882 (class 1259 OID 19690)
-- Name: editoriales_predeterminado_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_predeterminado_index ON public.editoriales USING btree (predeterminado);


--
-- TOC entry 3883 (class 1259 OID 19691)
-- Name: editoriales_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX editoriales_searchtext_gin ON public.editoriales USING gin (searchtext);


--
-- TOC entry 3890 (class 1259 OID 19692)
-- Name: historiallibros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_creado_por_id_index ON public.historiallibros USING btree (creado_por_id);


--
-- TOC entry 3891 (class 1259 OID 19693)
-- Name: historiallibros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_empresa_id_index ON public.historiallibros USING btree (empresa_id);


--
-- TOC entry 3892 (class 1259 OID 19694)
-- Name: historiallibros_inventariolibro_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_inventariolibro_id_index ON public.historiallibros USING btree (inventariolibro_id);


--
-- TOC entry 3893 (class 1259 OID 19695)
-- Name: historiallibros_libro_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_libro_id_index ON public.historiallibros USING btree (libro_id);


--
-- TOC entry 3898 (class 1259 OID 19696)
-- Name: historiallibros_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX historiallibros_user_id_index ON public.historiallibros USING btree (user_id);


--
-- TOC entry 3899 (class 1259 OID 19697)
-- Name: imagen_user_imagen_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagen_user_imagen_id_index ON public.imagen_user USING btree (imagen_id);


--
-- TOC entry 3904 (class 1259 OID 19698)
-- Name: imagen_user_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagen_user_user_id_index ON public.imagen_user USING btree (user_id);


--
-- TOC entry 3905 (class 1259 OID 19699)
-- Name: imagenes_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagenes_creado_por_id_index ON public.imagenes USING btree (creado_por_id);


--
-- TOC entry 3908 (class 1259 OID 19700)
-- Name: imagenes_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX imagenes_user_id_index ON public.imagenes USING btree (user_id);


--
-- TOC entry 3913 (class 1259 OID 19701)
-- Name: inventariolibros_apartado_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_apartado_user_id_index ON public.inventariolibros USING btree (apartado_user_id);


--
-- TOC entry 3916 (class 1259 OID 19702)
-- Name: inventariolibros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_creado_por_id_index ON public.inventariolibros USING btree (creado_por_id);


--
-- TOC entry 3917 (class 1259 OID 19703)
-- Name: inventariolibros_editorial_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_editorial_id_index ON public.inventariolibros USING btree (editorial_id);


--
-- TOC entry 3918 (class 1259 OID 19704)
-- Name: inventariolibros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_empresa_id_index ON public.inventariolibros USING btree (empresa_id);


--
-- TOC entry 3923 (class 1259 OID 19705)
-- Name: inventariolibros_prestado_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_prestado_user_id_index ON public.inventariolibros USING btree (prestado_user_id);


--
-- TOC entry 3924 (class 1259 OID 19706)
-- Name: inventariolibros_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_searchtext_gin ON public.inventariolibros USING gin (searchtext);


--
-- TOC entry 3925 (class 1259 OID 19707)
-- Name: inventariolibros_uuid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX inventariolibros_uuid_index ON public.inventariolibros USING btree (uuid);


--
-- TOC entry 3930 (class 1259 OID 19708)
-- Name: libros_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_creado_por_id_index ON public.libros USING btree (creado_por_id);


--
-- TOC entry 3931 (class 1259 OID 19709)
-- Name: libros_editorial_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_editorial_id_index ON public.libros USING btree (editorial_id);


--
-- TOC entry 3932 (class 1259 OID 19710)
-- Name: libros_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_empresa_id_index ON public.libros USING btree (empresa_id);


--
-- TOC entry 3935 (class 1259 OID 19711)
-- Name: libros_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_searchtext_gin ON public.libros USING gin (searchtext);


--
-- TOC entry 3936 (class 1259 OID 19712)
-- Name: libros_tipo_material_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX libros_tipo_material_id_index ON public.libros USING btree (tipo_material_id);


--
-- TOC entry 3941 (class 1259 OID 19713)
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- TOC entry 3944 (class 1259 OID 19714)
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- TOC entry 3947 (class 1259 OID 19715)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3960 (class 1259 OID 19716)
-- Name: portadas_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX portadas_creado_por_id_index ON public.portadas USING btree (creado_por_id);


--
-- TOC entry 3961 (class 1259 OID 19717)
-- Name: portadas_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX portadas_empresa_id_index ON public.portadas USING btree (empresa_id);


--
-- TOC entry 3991 (class 1259 OID 19718)
-- Name: searchtext_user_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX searchtext_user_gin ON public.users USING gin (searchtext);


--
-- TOC entry 3976 (class 1259 OID 19719)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 3979 (class 1259 OID 19720)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 3980 (class 1259 OID 19721)
-- Name: tipomaterial_creado_por_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipomaterial_creado_por_id_index ON public.tipomaterial USING btree (creado_por_id);


--
-- TOC entry 3981 (class 1259 OID 19722)
-- Name: tipomaterial_empresa_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tipomaterial_empresa_id_index ON public.tipomaterial USING btree (empresa_id);


--
-- TOC entry 3984 (class 1259 OID 19723)
-- Name: tm_searchtext_gin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tm_searchtext_gin ON public.tipomaterial USING gin (searchtext);


--
-- TOC entry 3992 (class 1259 OID 19724)
-- Name: users_logged_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logged_at_index ON public.users USING btree (logged_at);


--
-- TOC entry 3993 (class 1259 OID 19725)
-- Name: users_logged_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logged_index ON public.users USING btree (logged);


--
-- TOC entry 3994 (class 1259 OID 19726)
-- Name: users_logout_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_logout_at_index ON public.users USING btree (logout_at);


--
-- TOC entry 3997 (class 1259 OID 19727)
-- Name: users_user_id_anterior_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_id_anterior_index ON public.users USING btree (user_id_anterior);


--
-- TOC entry 4046 (class 2620 OID 19730)
-- Name: editoriales ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.editoriales FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'editorial', 'representante', 'telefonos', 'email');


--
-- TOC entry 4047 (class 2620 OID 19732)
-- Name: inventariolibros ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.inventariolibros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'isbn', 'clasificacion', 'edicion', 'codebar', 'etiqueta_smarth');


--
-- TOC entry 4048 (class 2620 OID 19731)
-- Name: libros ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.libros FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'titulo', 'autor');


--
-- TOC entry 4049 (class 2620 OID 19729)
-- Name: tipomaterial ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.tipomaterial FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'tipo_material');


--
-- TOC entry 4050 (class 2620 OID 19728)
-- Name: users ts_searchtext; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ts_searchtext BEFORE INSERT OR UPDATE ON public.users FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('searchtext', 'pg_catalog.spanish', 'ap_paterno', 'ap_materno', 'nombre', 'curp');


--
-- TOC entry 4000 (class 2606 OID 19733)
-- Name: codigopaises codigopaises_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4001 (class 2606 OID 19738)
-- Name: codigopaises codigopaises_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.codigopaises
    ADD CONSTRAINT codigopaises_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4002 (class 2606 OID 19743)
-- Name: editoriale_libro editoriale_libro_editoriale_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_editoriale_id_foreign FOREIGN KEY (editoriale_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 4003 (class 2606 OID 19748)
-- Name: editoriale_libro editoriale_libro_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriale_libro
    ADD CONSTRAINT editoriale_libro_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 4004 (class 2606 OID 19753)
-- Name: editoriales editoriales_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4005 (class 2606 OID 19758)
-- Name: editoriales editoriales_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editoriales
    ADD CONSTRAINT editoriales_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4006 (class 2606 OID 19763)
-- Name: historiallibros historiallibros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4007 (class 2606 OID 19768)
-- Name: historiallibros historiallibros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4008 (class 2606 OID 19773)
-- Name: historiallibros historiallibros_inventariolibro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_inventariolibro_id_foreign FOREIGN KEY (inventariolibro_id) REFERENCES public.inventariolibros(id) ON DELETE CASCADE;


--
-- TOC entry 4009 (class 2606 OID 19778)
-- Name: historiallibros historiallibros_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 4010 (class 2606 OID 19783)
-- Name: historiallibros historiallibros_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historiallibros
    ADD CONSTRAINT historiallibros_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4011 (class 2606 OID 19788)
-- Name: imagen_user imagen_user_imagen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_imagen_id_foreign FOREIGN KEY (imagen_id) REFERENCES public.imagenes(id) ON DELETE CASCADE;


--
-- TOC entry 4012 (class 2606 OID 19793)
-- Name: imagen_user imagen_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagen_user
    ADD CONSTRAINT imagen_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4013 (class 2606 OID 19798)
-- Name: imagenes imagenes_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4014 (class 2606 OID 19803)
-- Name: imagenes imagenes_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4015 (class 2606 OID 19808)
-- Name: inventariolibro_portada inventariolibro_portada_inventariolibro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_inventariolibro_id_foreign FOREIGN KEY (inventariolibro_id) REFERENCES public.inventariolibros(id) ON DELETE CASCADE;


--
-- TOC entry 4016 (class 2606 OID 19813)
-- Name: inventariolibro_portada inventariolibro_portada_portada_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibro_portada
    ADD CONSTRAINT inventariolibro_portada_portada_id_foreign FOREIGN KEY (portada_id) REFERENCES public.portadas(id) ON DELETE CASCADE;


--
-- TOC entry 4017 (class 2606 OID 19818)
-- Name: inventariolibros inventariolibros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4018 (class 2606 OID 19823)
-- Name: inventariolibros inventariolibros_editorial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_editorial_id_foreign FOREIGN KEY (editorial_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 4019 (class 2606 OID 19828)
-- Name: inventariolibros inventariolibros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4020 (class 2606 OID 19833)
-- Name: inventariolibros inventariolibros_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventariolibros
    ADD CONSTRAINT inventariolibros_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 4021 (class 2606 OID 19838)
-- Name: libro_portada libro_portada_libro_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_libro_id_foreign FOREIGN KEY (libro_id) REFERENCES public.libros(id) ON DELETE CASCADE;


--
-- TOC entry 4022 (class 2606 OID 19843)
-- Name: libro_portada libro_portada_portada_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_portada
    ADD CONSTRAINT libro_portada_portada_id_foreign FOREIGN KEY (portada_id) REFERENCES public.portadas(id) ON DELETE CASCADE;


--
-- TOC entry 4023 (class 2606 OID 19848)
-- Name: libros libros_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4024 (class 2606 OID 19853)
-- Name: libros libros_editorial_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_editorial_id_foreign FOREIGN KEY (editorial_id) REFERENCES public.editoriales(id) ON DELETE CASCADE;


--
-- TOC entry 4025 (class 2606 OID 19858)
-- Name: libros libros_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4026 (class 2606 OID 19863)
-- Name: libros libros_tipo_material_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_tipo_material_id_foreign FOREIGN KEY (tipo_material_id) REFERENCES public.tipomaterial(id) ON DELETE CASCADE;


--
-- TOC entry 4027 (class 2606 OID 19868)
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4028 (class 2606 OID 19873)
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4029 (class 2606 OID 19878)
-- Name: permission_role permission_role_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4030 (class 2606 OID 19883)
-- Name: permission_role permission_role_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_role
    ADD CONSTRAINT permission_role_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4031 (class 2606 OID 19888)
-- Name: permission_user permission_user_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4032 (class 2606 OID 19893)
-- Name: permission_user permission_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission_user
    ADD CONSTRAINT permission_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4033 (class 2606 OID 19898)
-- Name: portadas portadas_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4034 (class 2606 OID 19903)
-- Name: portadas portadas_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portadas
    ADD CONSTRAINT portadas_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4035 (class 2606 OID 19908)
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- TOC entry 4036 (class 2606 OID 19913)
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4037 (class 2606 OID 19918)
-- Name: role_user role_user_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4038 (class 2606 OID 19923)
-- Name: role_user role_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_user
    ADD CONSTRAINT role_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4039 (class 2606 OID 19928)
-- Name: tipomaterial tipomaterial_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4040 (class 2606 OID 19933)
-- Name: tipomaterial tipomaterial_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipomaterial
    ADD CONSTRAINT tipomaterial_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


--
-- TOC entry 4041 (class 2606 OID 19938)
-- Name: user_adress user_adress_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_adress
    ADD CONSTRAINT user_adress_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4042 (class 2606 OID 19943)
-- Name: user_extend user_extend_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_extend
    ADD CONSTRAINT user_extend_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4043 (class 2606 OID 19948)
-- Name: user_social user_social_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_social
    ADD CONSTRAINT user_social_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4044 (class 2606 OID 19953)
-- Name: users users_creado_por_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_creado_por_id_foreign FOREIGN KEY (creado_por_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4045 (class 2606 OID 19958)
-- Name: users users_empresa_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_empresa_id_foreign FOREIGN KEY (empresa_id) REFERENCES public.empresas(id) ON DELETE CASCADE;


-- Completed on 2022-02-22 10:32:11 CST

--
-- PostgreSQL database dump complete
--

