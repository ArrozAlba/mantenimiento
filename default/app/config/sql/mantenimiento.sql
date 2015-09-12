--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acceso; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE acceso (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    tipo_acceso integer NOT NULL,
    navegador character varying(45),
    version_navegador character varying(45),
    sistema_operativo character varying(45),
    nombre_equipo character varying(45),
    ip character varying(45)
);


ALTER TABLE public.acceso OWNER TO arrozalba;

--
-- Name: TABLE acceso; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE acceso IS 'Modelo para manipular los  accesos de usuarios';


--
-- Name: COLUMN acceso.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.usuario_id IS 'Identificador del usuario que accede';


--
-- Name: COLUMN acceso.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.fecha_registro IS 'Fecha de registro del acceso';


--
-- Name: COLUMN acceso.tipo_acceso; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.tipo_acceso IS 'Tipo de acceso (entrada o salida)';


--
-- Name: COLUMN acceso.navegador; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.navegador IS 'Navegador del Cliente';


--
-- Name: COLUMN acceso.version_navegador; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.version_navegador IS 'Version del Navegador del Cliente';


--
-- Name: COLUMN acceso.sistema_operativo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.sistema_operativo IS 'Sistema Operativo del Cliente';


--
-- Name: COLUMN acceso.nombre_equipo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.nombre_equipo IS 'Nombre del Equipo';


--
-- Name: COLUMN acceso.ip; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN acceso.ip IS 'Dirección IP del usuario que ingresa';


--
-- Name: acceso_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE acceso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acceso_id_seq OWNER TO arrozalba;

--
-- Name: acceso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE acceso_id_seq OWNED BY acceso.id;


--
-- Name: backup; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE backup (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    denominacion character varying(200) NOT NULL,
    tamano character varying(45),
    archivo character varying(45) NOT NULL
);


ALTER TABLE public.backup OWNER TO arrozalba;

--
-- Name: TABLE backup; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE backup IS 'Modelo para manipular los Backups generados por el sistema';


--
-- Name: COLUMN backup.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN backup.usuario_id IS 'ID del Usuario';


--
-- Name: COLUMN backup.denominacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN backup.denominacion IS 'Denominacion del Backup';


--
-- Name: COLUMN backup.tamano; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN backup.tamano IS 'Tamaño del Backup';


--
-- Name: COLUMN backup.archivo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN backup.archivo IS 'Nombre del Archivo';


--
-- Name: backup_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backup_id_seq OWNER TO arrozalba;

--
-- Name: backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE backup_id_seq OWNED BY backup.id;


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE cargo (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    nombre character varying(64) NOT NULL,
    observacion character varying(250)
);


ALTER TABLE public.cargo OWNER TO arrozalba;

--
-- Name: TABLE cargo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE cargo IS 'Modelo para manipular las diferentes Profesiones';


--
-- Name: COLUMN cargo.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN cargo.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN cargo.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN cargo.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN cargo.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN cargo.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN cargo.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN cargo.nombre IS 'Nombre de la Profesion';


--
-- Name: COLUMN cargo.observacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN cargo.observacion IS 'Observacion';


--
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_id_seq OWNER TO arrozalba;

--
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE cargo_id_seq OWNED BY cargo.id;


--
-- Name: configuracion; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE configuracion (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    nro_intentos_fallidos integer,
    nro_pregunta_seguridad integer,
    nro_claves_anteriores integer,
    dias_caducidad_clave integer,
    dias_aviso_caducidad_clave integer
);


ALTER TABLE public.configuracion OWNER TO arrozalba;

--
-- Name: TABLE configuracion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE configuracion IS 'Modelo para manipular la configuración de la aplicación';


--
-- Name: COLUMN configuracion.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.usuario_id IS 'codigo del usuario';


--
-- Name: COLUMN configuracion.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN configuracion.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN configuracion.nro_intentos_fallidos; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.nro_intentos_fallidos IS 'Numero de Intentos Fallidos de Acceso del usuario';


--
-- Name: COLUMN configuracion.nro_pregunta_seguridad; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.nro_pregunta_seguridad IS 'Numero de Preguntas de Seguridad del usuario';


--
-- Name: COLUMN configuracion.nro_claves_anteriores; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.nro_claves_anteriores IS 'Numero de Claves historicas de Acceso del usuario a almacenar';


--
-- Name: COLUMN configuracion.dias_caducidad_clave; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.dias_caducidad_clave IS 'Dias de Validez de clave de Acceso del usuario';


--
-- Name: COLUMN configuracion.dias_aviso_caducidad_clave; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN configuracion.dias_aviso_caducidad_clave IS 'Dias para notificar cambio de clave de Acceso del usuario';


--
-- Name: configuracion_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE configuracion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuracion_id_seq OWNER TO arrozalba;

--
-- Name: configuracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE configuracion_id_seq OWNED BY configuracion.id;


--
-- Name: departamento; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE departamento (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    nombre character varying(64) NOT NULL,
    observacion character varying(250),
    sucursal_id integer NOT NULL
);


ALTER TABLE public.departamento OWNER TO arrozalba;

--
-- Name: TABLE departamento; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE departamento IS 'Modelo para manipular los diferentes Departamentos de las UPSAS';


--
-- Name: COLUMN departamento.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN departamento.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN departamento.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN departamento.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN departamento.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN departamento.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN departamento.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN departamento.nombre IS 'Nombre del Departamento';


--
-- Name: COLUMN departamento.observacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN departamento.observacion IS 'Observacion';


--
-- Name: departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamento_id_seq OWNER TO arrozalba;

--
-- Name: departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE departamento_id_seq OWNED BY departamento.id;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE empresa (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    razon_social character varying(100) NOT NULL,
    rif character varying(15) NOT NULL,
    pais_id integer NOT NULL,
    estado_id integer NOT NULL,
    municipio_id integer NOT NULL,
    parroquia_id integer NOT NULL,
    representante_legal character varying(100) NOT NULL,
    pagina_web character varying(45),
    telefono character varying(15) NOT NULL,
    fax character varying(15),
    celular character varying(15),
    logo character varying(45),
    email character varying(100)
);


ALTER TABLE public.empresa OWNER TO arrozalba;

--
-- Name: TABLE empresa; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE empresa IS 'Modelo para manipular la empresa';


--
-- Name: COLUMN empresa.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN empresa.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN empresa.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN empresa.razon_social; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.razon_social IS 'Razon Social de la Empresa ';


--
-- Name: COLUMN empresa.pais_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.pais_id IS 'ID Pais';


--
-- Name: COLUMN empresa.estado_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.estado_id IS 'ID Estado';


--
-- Name: COLUMN empresa.municipio_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.municipio_id IS 'ID Municipio ';


--
-- Name: COLUMN empresa.parroquia_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.parroquia_id IS 'ID Parroquia ';


--
-- Name: COLUMN empresa.representante_legal; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.representante_legal IS 'Representante Legal de la Empresa ';


--
-- Name: COLUMN empresa.pagina_web; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.pagina_web IS 'Pagina Web de la Empresa ';


--
-- Name: COLUMN empresa.telefono; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.telefono IS 'Telefono de la Empresa ';


--
-- Name: COLUMN empresa.fax; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.fax IS 'Telefax de la Empresa ';


--
-- Name: COLUMN empresa.celular; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.celular IS 'Telefono Celular del Representante Legal ';


--
-- Name: COLUMN empresa.logo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.logo IS 'Logo de la Empresa ';


--
-- Name: COLUMN empresa.email; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN empresa.email IS 'Correo Electronico de la Empresa
';


--
-- Name: empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empresa_id_seq OWNER TO arrozalba;

--
-- Name: empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE empresa_id_seq OWNED BY empresa.id;


--
-- Name: equipo; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE equipo (
    id integer NOT NULL,
    nombre character varying(100),
    codigo character varying(10),
    fabricante_id integer,
    activo_fijo character varying(10),
    modelo_id integer,
    proveedor_id integer,
    fecha_compra date,
    sector_id integer,
    caracteristicas text,
    funcionamiento text,
    observaciones text,
    fecha_registro date
);


ALTER TABLE public.equipo OWNER TO arrozalba;

--
-- Name: equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE equipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_id_seq OWNER TO arrozalba;

--
-- Name: equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE equipo_id_seq OWNED BY equipo.id;


--
-- Name: equipo_parte; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE equipo_parte (
    id integer NOT NULL,
    equipo_id integer,
    parte_id integer,
    cantidad integer,
    caracteristicas text
);


ALTER TABLE public.equipo_parte OWNER TO arrozalba;

--
-- Name: TABLE equipo_parte; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE equipo_parte IS 'Modelo para manipular las partes de las equipos';


--
-- Name: equipo_parte_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE equipo_parte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipo_parte_id_seq OWNER TO arrozalba;

--
-- Name: equipo_parte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE equipo_parte_id_seq OWNED BY equipo_parte.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE estado (
    id integer NOT NULL,
    codigo character varying(3) NOT NULL,
    pais_id integer NOT NULL,
    nombre character varying(64) NOT NULL
);


ALTER TABLE public.estado OWNER TO arrozalba;

--
-- Name: TABLE estado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE estado IS 'Modelo para manipular la relación Pais Estado';


--
-- Name: COLUMN estado.codigo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado.codigo IS 'Codigo Estado';


--
-- Name: COLUMN estado.pais_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado.pais_id IS 'Pais';


--
-- Name: COLUMN estado.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado.nombre IS 'Nombre Estado';


--
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO arrozalba;

--
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;


--
-- Name: estado_usuario; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE estado_usuario (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    estado_usuario integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.estado_usuario OWNER TO arrozalba;

--
-- Name: TABLE estado_usuario; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE estado_usuario IS 'Modelo para manipular el estado de los usuarios';


--
-- Name: COLUMN estado_usuario.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado_usuario.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN estado_usuario.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado_usuario.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN estado_usuario.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado_usuario.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN estado_usuario.estado_usuario; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado_usuario.estado_usuario IS 'ID Estado del usuario ';


--
-- Name: COLUMN estado_usuario.descripcion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN estado_usuario.descripcion IS 'Descripcion del estado del usuario ';


--
-- Name: estado_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE estado_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_usuario_id_seq OWNER TO arrozalba;

--
-- Name: estado_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE estado_usuario_id_seq OWNED BY estado_usuario.id;


--
-- Name: fabricante; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE fabricante (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    observacion text
);


ALTER TABLE public.fabricante OWNER TO arrozalba;

--
-- Name: fabricante_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE fabricante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fabricante_id_seq OWNER TO arrozalba;

--
-- Name: fabricante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE fabricante_id_seq OWNED BY fabricante.id;


--
-- Name: falla; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE falla (
    id integer NOT NULL,
    descripcion character varying(250) NOT NULL,
    observacion text
);


ALTER TABLE public.falla OWNER TO arrozalba;

--
-- Name: falla_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE falla_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.falla_id_seq OWNER TO arrozalba;

--
-- Name: falla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE falla_id_seq OWNED BY falla.id;


--
-- Name: incidencia; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE incidencia (
    id integer NOT NULL,
    fecha timestamp without time zone,
    departamento_id integer NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    turno character varying(25) NOT NULL,
    falla_id integer NOT NULL,
    equipo_id integer NOT NULL,
    sector_id integer NOT NULL,
    parada_sector boolean,
    parada_planta boolean,
    analisis_falla text NOT NULL,
    accion_correctiva text NOT NULL,
    fecha_reparacion timestamp without time zone NOT NULL,
    responsable_reparacion character varying(150) NOT NULL,
    perdida_tn double precision,
    persistencia_falla boolean,
    observaciones text
);


ALTER TABLE public.incidencia OWNER TO arrozalba;

--
-- Name: incidencias_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE incidencias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incidencias_id_seq OWNER TO arrozalba;

--
-- Name: incidencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE incidencias_id_seq OWNED BY incidencia.id;


--
-- Name: marca; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE marca (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    observacion text
);


ALTER TABLE public.marca OWNER TO arrozalba;

--
-- Name: marca_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_id_seq OWNER TO arrozalba;

--
-- Name: marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE marca_id_seq OWNED BY marca.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE menu (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    menu_id integer,
    recurso_id integer,
    menu character varying(45) NOT NULL,
    url character varying(55) NOT NULL,
    posicion integer DEFAULT 0,
    icono character varying(45),
    activo integer DEFAULT 1 NOT NULL,
    visibilidad integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.menu OWNER TO arrozalba;

--
-- Name: TABLE menu; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE menu IS 'Modelo para manipular menus del sistema';


--
-- Name: COLUMN menu.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN menu.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN menu.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN menu.menu_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.menu_id IS 'ID menu padre';


--
-- Name: COLUMN menu.recurso_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.recurso_id IS 'ID del recurso ';


--
-- Name: COLUMN menu.menu; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.menu IS 'Texto a mostrar del menu';


--
-- Name: COLUMN menu.url; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.url IS 'Url del menu';


--
-- Name: COLUMN menu.posicion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.posicion IS 'Posicion del menu dentro de otros items';


--
-- Name: COLUMN menu.icono; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.icono IS 'Icono a mostrar';


--
-- Name: COLUMN menu.activo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.activo IS 'Estado del menu (Activo o Inactivo)';


--
-- Name: COLUMN menu.visibilidad; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN menu.visibilidad IS 'Indica si el menú se muestra en el backend o en el frontend';


--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO arrozalba;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: modelo; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE modelo (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    observacion text,
    marca_id integer
);


ALTER TABLE public.modelo OWNER TO arrozalba;

--
-- Name: modelo_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE modelo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelo_id_seq OWNER TO arrozalba;

--
-- Name: modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE modelo_id_seq OWNED BY modelo.id;


--
-- Name: municipio; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE municipio (
    id integer NOT NULL,
    estado_id integer NOT NULL,
    codigo character varying(3) NOT NULL,
    nombre character varying(64) NOT NULL
);


ALTER TABLE public.municipio OWNER TO arrozalba;

--
-- Name: TABLE municipio; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE municipio IS 'Modelo para manipular Municipios';


--
-- Name: COLUMN municipio.estado_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN municipio.estado_id IS 'Estado';


--
-- Name: COLUMN municipio.codigo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN municipio.codigo IS 'Codigo Municipio';


--
-- Name: COLUMN municipio.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN municipio.nombre IS 'Nombre Municipio';


--
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipio_id_seq OWNER TO arrozalba;

--
-- Name: municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE municipio_id_seq OWNED BY municipio.id;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE pais (
    id integer NOT NULL,
    codigo character varying(3) NOT NULL,
    nombre character varying(64) NOT NULL
);


ALTER TABLE public.pais OWNER TO arrozalba;

--
-- Name: TABLE pais; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE pais IS 'Modelo para manipular los Paises';


--
-- Name: COLUMN pais.codigo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN pais.codigo IS 'Codigo del Pais';


--
-- Name: COLUMN pais.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN pais.nombre IS 'Nombre Pais';


--
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_id_seq OWNER TO arrozalba;

--
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE pais_id_seq OWNED BY pais.id;


--
-- Name: parroquia; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE parroquia (
    id integer NOT NULL,
    nombre character varying(128) NOT NULL,
    municipio_id integer NOT NULL
);


ALTER TABLE public.parroquia OWNER TO arrozalba;

--
-- Name: TABLE parroquia; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE parroquia IS 'Modelo para  manipular Parroquia';


--
-- Name: COLUMN parroquia.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parroquia.nombre IS 'Parroquia';


--
-- Name: COLUMN parroquia.municipio_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parroquia.municipio_id IS 'Municipio';


--
-- Name: parroquia_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE parroquia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parroquia_id_seq OWNER TO arrozalba;

--
-- Name: parroquia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE parroquia_id_seq OWNED BY parroquia.id;


--
-- Name: parte; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE parte (
    id integer NOT NULL,
    usuario_id integer,
    nombre character varying(100) NOT NULL,
    caracteristica text,
    parte_categoria_id integer,
    observacion text
);


ALTER TABLE public.parte OWNER TO arrozalba;

--
-- Name: TABLE parte; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE parte IS 'Modelo para manipular las partes de las equipos';


--
-- Name: COLUMN parte.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN parte.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte.nombre IS 'Nombre de la parte';


--
-- Name: COLUMN parte.caracteristica; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte.caracteristica IS 'Nombre de la parte';


--
-- Name: COLUMN parte.parte_categoria_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte.parte_categoria_id IS 'Id de la Categoria';


--
-- Name: COLUMN parte.observacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte.observacion IS 'Observacion de la parte';


--
-- Name: parte_categoria; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE parte_categoria (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    observacion character varying(250)
);


ALTER TABLE public.parte_categoria OWNER TO arrozalba;

--
-- Name: TABLE parte_categoria; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE parte_categoria IS 'Modelo para manipular las categorias de las partes';


--
-- Name: COLUMN parte_categoria.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte_categoria.nombre IS 'Nombre de la categoria';


--
-- Name: COLUMN parte_categoria.observacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN parte_categoria.observacion IS 'Observacion de la categoria';


--
-- Name: parte_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE parte_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parte_categoria_id_seq OWNER TO arrozalba;

--
-- Name: parte_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE parte_categoria_id_seq OWNED BY parte_categoria.id;


--
-- Name: parte_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE parte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parte_id_seq OWNER TO arrozalba;

--
-- Name: parte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE parte_id_seq OWNED BY parte.id;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE perfil (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    perfil character varying(45) NOT NULL,
    estado integer DEFAULT 1 NOT NULL,
    plantilla character varying(45) DEFAULT 'default'::character varying
);


ALTER TABLE public.perfil OWNER TO arrozalba;

--
-- Name: TABLE perfil; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE perfil IS 'Modelo para manipular perfiles del sistema';


--
-- Name: COLUMN perfil.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN perfil.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN perfil.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN perfil.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN perfil.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN perfil.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN perfil.perfil; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN perfil.perfil IS 'Nombre del Perfil';


--
-- Name: COLUMN perfil.estado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN perfil.estado IS 'Indica si el perfil esta activo o inactivo';


--
-- Name: COLUMN perfil.plantilla; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN perfil.plantilla IS 'Plantilla para usar en el sistema';


--
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_seq OWNER TO arrozalba;

--
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE perfil_id_seq OWNED BY perfil.id;


--
-- Name: profesion; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE profesion (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    nombre character varying(64) NOT NULL,
    observacion character varying(250)
);


ALTER TABLE public.profesion OWNER TO arrozalba;

--
-- Name: TABLE profesion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE profesion IS 'Modelo para manipular las diferentes Profesiones';


--
-- Name: COLUMN profesion.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN profesion.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN profesion.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN profesion.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN profesion.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN profesion.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN profesion.nombre; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN profesion.nombre IS 'Nombre de la Profesion';


--
-- Name: COLUMN profesion.observacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN profesion.observacion IS 'Observacion';


--
-- Name: profesion_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE profesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesion_id_seq OWNER TO arrozalba;

--
-- Name: profesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE profesion_id_seq OWNED BY profesion.id;


--
-- Name: proveedor; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE proveedor (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion text,
    telefono character varying(11) NOT NULL,
    correo character varying(100) NOT NULL,
    observacion text
);


ALTER TABLE public.proveedor OWNER TO arrozalba;

--
-- Name: proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedor_id_seq OWNER TO arrozalba;

--
-- Name: proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE proveedor_id_seq OWNED BY proveedor.id;


--
-- Name: recurso; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE recurso (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    modulo character varying(45),
    controlador character varying(45),
    accion character varying(45),
    recurso character varying(100),
    descripcion character varying(150) NOT NULL,
    activo integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.recurso OWNER TO arrozalba;

--
-- Name: TABLE recurso; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE recurso IS 'Modelo para manipular recursos (controladores)';


--
-- Name: COLUMN recurso.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN recurso.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN recurso.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN recurso.modulo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.modulo IS 'Nombre del Modulo';


--
-- Name: COLUMN recurso.controlador; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.controlador IS 'Nombre del Controlador';


--
-- Name: COLUMN recurso.accion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.accion IS 'Nombre de la Accion';


--
-- Name: COLUMN recurso.recurso; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.recurso IS 'Nombre del recurso';


--
-- Name: COLUMN recurso.descripcion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.descripcion IS 'Descripcion del Recurso';


--
-- Name: COLUMN recurso.activo; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso.activo IS 'Estado del Recurso';


--
-- Name: recurso_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE recurso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurso_id_seq OWNER TO arrozalba;

--
-- Name: recurso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE recurso_id_seq OWNED BY recurso.id;


--
-- Name: recurso_perfil; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE recurso_perfil (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    recurso_id integer NOT NULL,
    perfil_id integer NOT NULL
);


ALTER TABLE public.recurso_perfil OWNER TO arrozalba;

--
-- Name: TABLE recurso_perfil; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE recurso_perfil IS 'Modelo para manipular relacion Recurso - Perfil';


--
-- Name: COLUMN recurso_perfil.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso_perfil.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN recurso_perfil.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso_perfil.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN recurso_perfil.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso_perfil.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN recurso_perfil.recurso_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso_perfil.recurso_id IS 'ID del Recurso';


--
-- Name: COLUMN recurso_perfil.perfil_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN recurso_perfil.perfil_id IS 'ID del Perfil';


--
-- Name: recurso_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE recurso_perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recurso_perfil_id_seq OWNER TO arrozalba;

--
-- Name: recurso_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE recurso_perfil_id_seq OWNED BY recurso_perfil.id;


--
-- Name: sector; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE sector (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    sucursal_id integer NOT NULL,
    sector character varying(45) NOT NULL,
    observacion character varying(250)
);


ALTER TABLE public.sector OWNER TO arrozalba;

--
-- Name: TABLE sector; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE sector IS 'Modelo para manipular las sectores';


--
-- Name: COLUMN sector.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sector.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN sector.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sector.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN sector.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sector.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN sector.sucursal_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sector.sucursal_id IS 'ID de la Sucursal';


--
-- Name: COLUMN sector.sector; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sector.sector IS 'Nombre de la sector';


--
-- Name: COLUMN sector.observacion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sector.observacion IS 'Observacion del sector';


--
-- Name: sector_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sector_id_seq OWNER TO arrozalba;

--
-- Name: sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE sector_id_seq OWNED BY sector.id;


--
-- Name: sucursal; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE sucursal (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    empresa_id integer NOT NULL,
    sucursal character varying(45) NOT NULL,
    sucursal_slug character varying(45),
    pais_id integer NOT NULL,
    estado_id integer NOT NULL,
    municipio_id integer NOT NULL,
    parroquia_id integer NOT NULL,
    direccion character varying(200),
    telefono character varying(45),
    fax character varying(45),
    celular character varying(45)
);


ALTER TABLE public.sucursal OWNER TO arrozalba;

--
-- Name: TABLE sucursal; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE sucursal IS 'Modelo para manipular las sucursales';


--
-- Name: COLUMN sucursal.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN sucursal.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN sucursal.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN sucursal.empresa_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.empresa_id IS 'ID de la Empresa';


--
-- Name: COLUMN sucursal.sucursal; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.sucursal IS 'Nombre de la Sucursal';


--
-- Name: COLUMN sucursal.sucursal_slug; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.sucursal_slug IS 'Slug de la sucursal';


--
-- Name: COLUMN sucursal.pais_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.pais_id IS 'Id de la Pais';


--
-- Name: COLUMN sucursal.estado_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.estado_id IS 'Id del Estado';


--
-- Name: COLUMN sucursal.municipio_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.municipio_id IS 'Id del Municipio';


--
-- Name: COLUMN sucursal.parroquia_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.parroquia_id IS 'Id de la Parroquia';


--
-- Name: COLUMN sucursal.direccion; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.direccion IS 'Direccion de la Sucursal';


--
-- Name: COLUMN sucursal.telefono; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.telefono IS 'Telefono de la Sucursal';


--
-- Name: COLUMN sucursal.fax; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.fax IS 'fax de la Sucursal';


--
-- Name: COLUMN sucursal.celular; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN sucursal.celular IS 'fax de la Sucursal';


--
-- Name: sucursal_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursal_id_seq OWNER TO arrozalba;

--
-- Name: sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE sucursal_id_seq OWNED BY sucursal.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    fecha_desactivacion timestamp without time zone,
    sucursal_id integer,
    login character varying(45) NOT NULL,
    perfil_id integer NOT NULL,
    email character varying(45),
    tema character varying(45),
    app_ajax integer DEFAULT 1,
    datagrid integer DEFAULT 30,
    estatus integer DEFAULT 1,
    intentos integer,
    nombres character varying(100),
    apellidos character varying(100)
);


ALTER TABLE public.usuario OWNER TO arrozalba;

--
-- Name: TABLE usuario; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE usuario IS 'Modelo para manipular los usuarios
Estatus: 0= Nuevo, 1= Activo, 2= Bloqueado, 3=Desbloqueado, 4=Ausente (Reposo, Vacaciones, Permisos, Curso) y 5= Inactivo o egresado
Intentos: al registrar 3 intentos fallidos cambia estatus del usuario a bloqueado y se reinicializa';


--
-- Name: COLUMN usuario.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.usuario_id IS 'Usuario Editor del Registro';


--
-- Name: COLUMN usuario.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN usuario.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN usuario.sucursal_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.sucursal_id IS 'ID de la Sucursal';


--
-- Name: COLUMN usuario.login; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.login IS 'Login del usuario';


--
-- Name: COLUMN usuario.perfil_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.perfil_id IS 'ID Perfil de Usuario';


--
-- Name: COLUMN usuario.email; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.email IS 'Email del usuario';


--
-- Name: COLUMN usuario.tema; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.tema IS 'Tema de la interfaz aplicable al usuario';


--
-- Name: COLUMN usuario.app_ajax; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.app_ajax IS 'Indica si la app se trabaja con ajax o peticiones normales';


--
-- Name: COLUMN usuario.datagrid; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario.datagrid IS 'Datos por página en los datagrid';


--
-- Name: usuario_clave; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE usuario_clave (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    password character varying(45) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL
);


ALTER TABLE public.usuario_clave OWNER TO arrozalba;

--
-- Name: TABLE usuario_clave; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE usuario_clave IS 'Modelo para manipular las claves de los usuario_claves';


--
-- Name: COLUMN usuario_clave.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_clave.usuario_id IS 'codigo del usuario';


--
-- Name: COLUMN usuario_clave.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_clave.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN usuario_clave.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_clave.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN usuario_clave.password; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_clave.password IS 'Password del usuario';


--
-- Name: COLUMN usuario_clave.fecha_inicio; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_clave.fecha_inicio IS 'Fecha de Inicio de la Clave del Usuario';


--
-- Name: COLUMN usuario_clave.fecha_fin; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_clave.fecha_fin IS 'Fecha Fin de la Clave del Usuario';


--
-- Name: usuario_clave_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE usuario_clave_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_clave_id_seq OWNER TO arrozalba;

--
-- Name: usuario_clave_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE usuario_clave_id_seq OWNED BY usuario_clave.id;


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO arrozalba;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- Name: usuario_pregunta; Type: TABLE; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE TABLE usuario_pregunta (
    id integer NOT NULL,
    usuario_id integer,
    fecha_registro timestamp with time zone DEFAULT now() NOT NULL,
    fecha_modificado timestamp with time zone DEFAULT now() NOT NULL,
    pregunta character varying(240),
    respuesta character varying(240)
);


ALTER TABLE public.usuario_pregunta OWNER TO arrozalba;

--
-- Name: TABLE usuario_pregunta; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON TABLE usuario_pregunta IS 'Modelo para manipular las preguntas y Respuestas de Seguridad';


--
-- Name: COLUMN usuario_pregunta.usuario_id; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_pregunta.usuario_id IS 'codigo del usuario';


--
-- Name: COLUMN usuario_pregunta.fecha_registro; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_pregunta.fecha_registro IS 'Fecha del Registro';


--
-- Name: COLUMN usuario_pregunta.fecha_modificado; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_pregunta.fecha_modificado IS 'Fecha Modificacion del Registro';


--
-- Name: COLUMN usuario_pregunta.pregunta; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_pregunta.pregunta IS 'Pregunta de seguridad del usuario';


--
-- Name: COLUMN usuario_pregunta.respuesta; Type: COMMENT; Schema: public; Owner: arrozalba
--

COMMENT ON COLUMN usuario_pregunta.respuesta IS 'Respuesta de Seguridad del Usuario';


--
-- Name: usuario_pregunta_id_seq; Type: SEQUENCE; Schema: public; Owner: arrozalba
--

CREATE SEQUENCE usuario_pregunta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_pregunta_id_seq OWNER TO arrozalba;

--
-- Name: usuario_pregunta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arrozalba
--

ALTER SEQUENCE usuario_pregunta_id_seq OWNED BY usuario_pregunta.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY acceso ALTER COLUMN id SET DEFAULT nextval('acceso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY backup ALTER COLUMN id SET DEFAULT nextval('backup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY cargo ALTER COLUMN id SET DEFAULT nextval('cargo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY departamento ALTER COLUMN id SET DEFAULT nextval('departamento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY empresa ALTER COLUMN id SET DEFAULT nextval('empresa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY equipo ALTER COLUMN id SET DEFAULT nextval('equipo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY equipo_parte ALTER COLUMN id SET DEFAULT nextval('equipo_parte_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY estado_usuario ALTER COLUMN id SET DEFAULT nextval('estado_usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY fabricante ALTER COLUMN id SET DEFAULT nextval('fabricante_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY falla ALTER COLUMN id SET DEFAULT nextval('falla_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY incidencia ALTER COLUMN id SET DEFAULT nextval('incidencias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY marca ALTER COLUMN id SET DEFAULT nextval('marca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY modelo ALTER COLUMN id SET DEFAULT nextval('modelo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY municipio ALTER COLUMN id SET DEFAULT nextval('municipio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY pais ALTER COLUMN id SET DEFAULT nextval('pais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY parroquia ALTER COLUMN id SET DEFAULT nextval('parroquia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY parte ALTER COLUMN id SET DEFAULT nextval('parte_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY parte_categoria ALTER COLUMN id SET DEFAULT nextval('parte_categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY perfil ALTER COLUMN id SET DEFAULT nextval('perfil_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY profesion ALTER COLUMN id SET DEFAULT nextval('profesion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY proveedor ALTER COLUMN id SET DEFAULT nextval('proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY recurso ALTER COLUMN id SET DEFAULT nextval('recurso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY recurso_perfil ALTER COLUMN id SET DEFAULT nextval('recurso_perfil_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sector ALTER COLUMN id SET DEFAULT nextval('sector_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sucursal ALTER COLUMN id SET DEFAULT nextval('sucursal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY usuario_clave ALTER COLUMN id SET DEFAULT nextval('usuario_clave_id_seq'::regclass);


--
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY acceso (id, usuario_id, fecha_registro, fecha_modificado, tipo_acceso, navegador, version_navegador, sistema_operativo, nombre_equipo, ip) FROM stdin;
48	1	2015-06-04 20:03:12.512058-04:30	2015-06-04 20:03:12.512058-04:30	2	\N	\N	\N	\N	127.0.0.1
49	4	2015-06-04 20:03:23.059322-04:30	2015-06-04 20:03:23.059322-04:30	1	\N	\N	\N	\N	127.0.0.1
50	4	2015-06-04 20:07:16.596229-04:30	2015-06-04 20:07:16.596229-04:30	2	\N	\N	\N	\N	127.0.0.1
51	3	2015-06-04 20:07:28.147456-04:30	2015-06-04 20:07:28.147456-04:30	1	\N	\N	\N	\N	127.0.0.1
52	3	2015-06-04 20:07:33.950611-04:30	2015-06-04 20:07:33.950611-04:30	2	\N	\N	\N	\N	127.0.0.1
53	4	2015-06-04 20:07:38.776553-04:30	2015-06-04 20:07:38.776553-04:30	1	\N	\N	\N	\N	127.0.0.1
54	4	2015-06-04 20:17:04.561003-04:30	2015-06-04 20:17:04.561003-04:30	2	\N	\N	\N	\N	127.0.0.1
55	5	2015-06-04 20:17:08.945289-04:30	2015-06-04 20:17:08.945289-04:30	1	\N	\N	\N	\N	127.0.0.1
56	5	2015-06-04 20:17:13.985111-04:30	2015-06-04 20:17:13.985111-04:30	2	\N	\N	\N	\N	127.0.0.1
57	1	2015-06-04 20:19:45.351783-04:30	2015-06-04 20:19:45.351783-04:30	1	\N	\N	\N	\N	127.0.0.1
58	1	2015-06-05 09:55:21.978192-04:30	2015-06-05 09:55:21.978192-04:30	1	\N	\N	\N	\N	127.0.0.1
59	1	2015-06-05 11:09:24.565278-04:30	2015-06-05 11:09:24.565278-04:30	1	\N	\N	\N	\N	127.0.0.1
60	1	2015-06-05 11:50:59.618667-04:30	2015-06-05 11:50:59.618667-04:30	1	\N	\N	\N	\N	127.0.0.1
61	1	2015-06-05 13:11:52.392228-04:30	2015-06-05 13:11:52.392228-04:30	1	\N	\N	\N	\N	127.0.0.1
62	1	2015-06-05 23:35:56.905375-04:30	2015-06-05 23:35:56.905375-04:30	1	\N	\N	\N	\N	127.0.0.1
63	1	2015-06-07 14:41:01.474275-04:30	2015-06-07 14:41:01.474275-04:30	1	\N	\N	\N	\N	127.0.0.1
64	1	2015-06-08 10:31:22.087847-04:30	2015-06-08 10:31:22.087847-04:30	1	\N	\N	\N	\N	127.0.0.1
65	1	2015-06-08 15:05:20.972692-04:30	2015-06-08 15:05:20.972692-04:30	1	\N	\N	\N	\N	127.0.0.1
66	1	2015-06-15 21:02:48.864319-04:30	2015-06-15 21:02:48.864319-04:30	1	\N	\N	\N	\N	127.0.0.1
67	1	2015-06-15 22:47:48.014705-04:30	2015-06-15 22:47:48.014705-04:30	1	\N	\N	\N	\N	127.0.0.1
68	1	2015-06-17 15:28:31.817397-04:30	2015-06-17 15:28:31.817397-04:30	1	\N	\N	\N	\N	192.168.2.18
69	1	2015-06-18 21:27:52.324981-04:30	2015-06-18 21:27:52.324981-04:30	1	\N	\N	\N	\N	127.0.0.1
70	1	2015-06-20 13:18:58.442753-04:30	2015-06-20 13:18:58.442753-04:30	1	\N	\N	\N	\N	127.0.0.1
71	1	2015-06-24 11:31:07.430738-04:30	2015-06-24 11:31:07.430738-04:30	1	\N	\N	\N	\N	127.0.0.1
72	1	2015-07-04 12:26:16.929126-04:30	2015-07-04 12:26:16.929126-04:30	1	\N	\N	\N	\N	127.0.0.1
73	1	2015-07-10 10:55:55.979063-04:30	2015-07-10 10:55:55.979063-04:30	1	\N	\N	\N	\N	127.0.0.1
74	1	2015-07-10 12:35:09.754558-04:30	2015-07-10 12:35:09.754558-04:30	1	\N	\N	\N	\N	127.0.0.1
75	1	2015-07-10 12:35:28.133118-04:30	2015-07-10 12:35:28.133118-04:30	2	\N	\N	\N	\N	127.0.0.1
76	1	2015-07-10 12:35:52.088533-04:30	2015-07-10 12:35:52.088533-04:30	1	\N	\N	\N	\N	127.0.0.1
77	1	2015-07-10 12:50:19.617683-04:30	2015-07-10 12:50:19.617683-04:30	2	\N	\N	\N	\N	127.0.0.1
78	1	2015-07-10 12:52:18.805402-04:30	2015-07-10 12:52:18.805402-04:30	1	\N	\N	\N	\N	127.0.0.1
79	1	2015-07-10 12:53:32.623221-04:30	2015-07-10 12:53:32.623221-04:30	2	\N	\N	\N	\N	127.0.0.1
80	9	2015-07-10 12:53:37.44269-04:30	2015-07-10 12:53:37.44269-04:30	1	\N	\N	\N	\N	127.0.0.1
81	9	2015-07-10 12:53:42.221943-04:30	2015-07-10 12:53:42.221943-04:30	2	\N	\N	\N	\N	127.0.0.1
82	1	2015-07-10 12:53:48.110415-04:30	2015-07-10 12:53:48.110415-04:30	1	\N	\N	\N	\N	127.0.0.1
83	1	2015-07-10 12:56:25.178227-04:30	2015-07-10 12:56:25.178227-04:30	2	\N	\N	\N	\N	127.0.0.1
84	9	2015-07-10 12:56:29.699455-04:30	2015-07-10 12:56:29.699455-04:30	1	\N	\N	\N	\N	127.0.0.1
85	9	2015-07-10 13:10:39.720217-04:30	2015-07-10 13:10:39.720217-04:30	2	\N	\N	\N	\N	127.0.0.1
86	1	2015-07-10 13:10:44.043119-04:30	2015-07-10 13:10:44.043119-04:30	1	\N	\N	\N	\N	127.0.0.1
87	1	2015-07-21 20:28:10.493854-04:30	2015-07-21 20:28:10.493854-04:30	1	\N	\N	\N	\N	127.0.0.1
88	1	2015-08-11 16:01:37.014118-04:30	2015-08-11 16:01:37.014118-04:30	1	\N	\N	\N	\N	127.0.0.1
89	1	2015-08-11 17:11:39.325904-04:30	2015-08-11 17:11:39.325904-04:30	1	\N	\N	\N	\N	127.0.0.1
90	1	2015-08-25 20:19:54.449496-04:30	2015-08-25 20:19:54.449496-04:30	1	\N	\N	\N	\N	127.0.0.1
91	1	2015-08-25 21:12:17.017592-04:30	2015-08-25 21:12:17.017592-04:30	1	\N	\N	\N	\N	127.0.0.1
92	1	2015-08-31 19:00:08.484204-04:30	2015-08-31 19:00:08.484204-04:30	1	\N	\N	\N	\N	127.0.0.1
93	1	2015-08-31 19:46:22.929171-04:30	2015-08-31 19:46:22.929171-04:30	1	\N	\N	\N	\N	127.0.0.1
94	1	2015-08-31 22:31:19.783419-04:30	2015-08-31 22:31:19.783419-04:30	1	\N	\N	\N	\N	127.0.0.1
95	1	2015-08-31 23:30:32.975422-04:30	2015-08-31 23:30:32.975422-04:30	1	\N	\N	\N	\N	127.0.0.1
96	1	2015-09-07 19:23:57.007422-04:30	2015-09-07 19:23:57.007422-04:30	1	\N	\N	\N	\N	127.0.0.1
97	1	2015-09-07 21:20:39.990661-04:30	2015-09-07 21:20:39.990661-04:30	1	\N	\N	\N	\N	127.0.0.1
98	1	2015-09-07 21:20:44.980724-04:30	2015-09-07 21:20:44.980724-04:30	2	\N	\N	\N	\N	127.0.0.1
99	1	2015-09-07 21:22:25.707007-04:30	2015-09-07 21:22:25.707007-04:30	1	\N	\N	\N	\N	127.0.0.1
100	1	2015-09-07 23:24:25.799859-04:30	2015-09-07 23:24:25.799859-04:30	1	\N	\N	\N	\N	127.0.0.1
101	1	2015-09-08 20:17:39.588228-04:30	2015-09-08 20:17:39.588228-04:30	1	\N	\N	\N	\N	127.0.0.1
102	1	2015-09-08 21:25:48.842096-04:30	2015-09-08 21:25:48.842096-04:30	2	\N	\N	\N	\N	127.0.0.1
103	1	2015-09-08 21:25:55.295536-04:30	2015-09-08 21:25:55.295536-04:30	1	\N	\N	\N	\N	127.0.0.1
104	1	2015-09-08 23:17:14.254477-04:30	2015-09-08 23:17:14.254477-04:30	1	\N	\N	\N	\N	127.0.0.1
105	1	2015-09-09 00:51:07.113573-04:30	2015-09-09 00:51:07.113573-04:30	1	\N	\N	\N	\N	127.0.0.1
\.


--
-- Name: acceso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('acceso_id_seq', 105, true);


--
-- Data for Name: backup; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY backup (id, usuario_id, fecha_registro, fecha_modificado, denominacion, tamano, archivo) FROM stdin;
\.


--
-- Name: backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('backup_id_seq', 1, false);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY cargo (id, usuario_id, fecha_registro, fecha_modificado, nombre, observacion) FROM stdin;
1	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	SIN CARGO	
2	\N	2014-04-04 18:09:20.016389-04:30	2014-04-04 18:09:20.016389-04:30	PRESIDENTE	 I
3	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	VICE-PRESIDENTE	
4	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE GENERAL	
5	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE PLANIFICACION Y PRESUPUESTO	
6	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE ADMINISTRACION Y FINANZAS	
7	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE ASISTENCIA TECNICA Y DESARROLLO TECNOLOGICO	
8	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE ATENCION AL CIUDADANO	
9	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE COMERCIALIZACION	
10	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE PRODUCCION AGRICOLA	
11	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE RECURSOS HUMANOS	
12	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	GERENTE DE PRODUCCION INDUSTRIAL	
13	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	AUDITOR INTERNO	
14	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	CONSULTOR JURIDICO	
15	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	COORDINADOR	
16	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	ESPECIALISTA INTEGRAL	
17	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	ESPECIALISTA I	
18	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	TECNICO II	
19	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	TECNICO I	
20	\N	2014-04-03 10:41:19.049463-04:30	2014-04-03 10:41:19.049463-04:30	OBRERO	
\.


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('cargo_id_seq', 21, true);


--
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY configuracion (id, usuario_id, fecha_registro, fecha_modificado, nro_intentos_fallidos, nro_pregunta_seguridad, nro_claves_anteriores, dias_caducidad_clave, dias_aviso_caducidad_clave) FROM stdin;
1	\N	2014-09-30 16:51:24.812322-04:30	2014-09-30 16:51:24.812322-04:30	1	1	1	1	1
\.


--
-- Name: configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('configuracion_id_seq', 1, false);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY departamento (id, usuario_id, fecha_registro, fecha_modificado, nombre, observacion, sucursal_id) FROM stdin;
1	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	ASAMBLEA DE ACCIONISTAS		1
2	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	JUNTA DIRECTIVA		1
3	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	PRESIDENCIA		1
4	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	VICEPRESIDENCIA		1
5	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA GENERAL		1
6	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA PLANIFICACION Y PRESUPUESTO		1
7	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA ADMINISTRACION		1
8	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA COMUNITARIA		1
9	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA PRODUCCION AGRICOLA		1
10	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA PRODUCCION INDUSTRIAL		1
11	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA TECNICA INTEGRAL Y  DESARROLLO TECNOLOGICO		1
12	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	AUDITORIA INTERNA		1
13	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	ANALISIS ESTRATEGICO		1
14	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	CONSULTORIA JURIDICA		1
15	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE TECNOLOGIAS DE INFORMACION		1
16	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD RECURSOS HUMANOS		1
17	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD SERVICIOS GENERALES		1
18	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE COMPRAS		1
19	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE CONTABILIDAD		1
20	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE TESORERIA		1
21	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	DIVISION OCCIDENTAL		1
22	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	DIVISION ORIENTAL		1
23	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UPS PIRITU		1
24	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE COMERCIALIZACION		1
25	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UPS PAYARA		1
26	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	BICEABASTO LA COLONIA DE TUREN		1
27	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE TRANSPORTE		1
28	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	OFICINA ARAURE		1
29	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	OFICINA COJEDES		1
30	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE MECANIZACION		1
31	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	CASA ARAURE (HABITACION DIRECTIVOS CUBANOS)		1
32	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UPPS-CALABOZO		1
33	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	FINCA SAN JOSE		1
34	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	FINCA CANO SECO		1
35	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UAS LA COLONIA DE TUREN		1
36	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	BANCO DE PAVONES		1
37	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE PROYECTO		1
38	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	CASA ARAURE - CALABOZO DIRECTIVA CUBANOS		1
39	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	GERENCIA DE ASISTENCIA TECNICA Y DESARROLLO TECNOLOGICO		1
40	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	COORDINACION DE ASEGURAMIENTO DE LA CALIDAD		1
41	\N	2014-04-03 10:43:29.70528-04:30	2014-04-03 10:43:29.70528-04:30	UNIDAD DE TRANSFERENCIA Y CONTROL TECNOLOGICO		1
42	\N	2014-07-14 20:01:52.468679-04:30	2014-07-14 20:01:52.468679-04:30	ROMANA	\N	3
43	\N	2014-08-21 13:46:23.50506-04:30	2014-08-21 13:46:23.50506-04:30	ADMINISTRACION	\N	4
45	\N	2014-10-23 08:41:56.572683-04:30	2014-10-23 08:41:56.572683-04:30	ADMINISTRACION 	\N	5
46	\N	2014-11-07 10:28:48.743779-04:30	2014-11-07 10:28:48.743779-04:30	ADMINISTRACION 	\N	3
78	\N	2014-12-30 09:40:09.554362-04:30	2014-12-30 09:40:09.554362-04:30	SUPERVISORES	\N	10
76	\N	2014-12-30 09:39:49.670406-04:30	2014-12-30 09:39:49.670406-04:30	MANTENIMIENTO ELECTRICO	\N	10
47	\N	2014-11-12 10:07:30.566298-04:30	2014-11-12 10:07:30.566298-04:30	ADMINISTRACION	\N	7
48	\N	2014-11-12 10:07:43.145715-04:30	2014-11-12 10:07:43.145715-04:30	LABORATORIO	\N	7
49	\N	2014-11-12 10:07:59.982285-04:30	2014-11-12 10:07:59.982285-04:30	PRECOCIDO	\N	7
50	\N	2014-11-12 10:11:45.53261-04:30	2014-11-12 10:11:45.53261-04:30	MOLINO	\N	7
51	\N	2014-11-12 10:11:52.647486-04:30	2014-11-12 10:11:52.647486-04:30	EMPAQUE	\N	7
52	\N	2014-11-12 10:12:03.782356-04:30	2014-11-12 10:12:03.782356-04:30	ALMACEN DE PRODUCTO TERMINADO	\N	7
53	\N	2014-11-12 10:12:17.89221-04:30	2014-11-12 10:12:17.89221-04:30	MANTENIMIENTO MECANICO	\N	7
54	\N	2014-11-12 10:13:21.275793-04:30	2014-11-12 10:13:21.275793-04:30	MANTENIMIENTO electrico	\N	7
57	\N	2014-11-12 10:26:01.423959-04:30	2014-11-12 10:26:01.423959-04:30	ROMANA	\N	7
58	\N	2014-11-12 10:26:10.327795-04:30	2014-11-12 10:26:10.327795-04:30	FACTURACION	\N	7
59	\N	2014-11-12 10:26:19.590659-04:30	2014-11-12 10:26:19.590659-04:30	ALMACEN DE REPUESTO	\N	7
60	\N	2014-11-12 14:22:35.047487-04:30	2014-11-12 14:22:35.047487-04:30	LIMPIEZA	\N	7
55	\N	2014-11-12 10:13:28.665002-04:30	2014-11-12 10:13:28.665002-04:30	LISTER	\N	7
56	\N	2014-11-12 10:13:37.544971-04:30	2014-11-12 10:13:37.544971-04:30	GALLETA	\N	7
61	\N	2014-11-12 10:07:30.566298-04:30	2014-11-12 10:07:30.566298-04:30	ADMINISTRACION	\N	8
62	\N	2014-11-17 14:49:27.354884-04:30	2014-11-17 14:49:27.354884-04:30	ADMINISTRACION	\N	9
63	\N	2014-11-17 15:01:19.507086-04:30	2014-11-17 15:01:19.507086-04:30	TECNICO	\N	8
64	\N	2014-11-17 15:01:26.551927-04:30	2014-11-17 15:01:26.551927-04:30	TECNICO	\N	9
65	\N	2014-11-17 15:01:38.353434-04:30	2014-11-17 15:01:38.353434-04:30	FINCAS	\N	8
66	\N	2014-11-17 15:01:43.703486-04:30	2014-11-17 15:01:43.703486-04:30	FINCAS	\N	9
67	\N	2014-11-27 10:39:15.910073-04:30	2014-11-27 10:39:15.910073-04:30	ADMINISTRACION	\N	10
68	\N	2014-11-27 10:39:24.734553-04:30	2014-11-27 10:39:24.734553-04:30	ROMANA	\N	10
69	\N	2014-11-27 10:39:34.136799-04:30	2014-11-27 10:39:34.136799-04:30	FACTURACION	\N	10
70	\N	2014-11-27 10:39:44.473196-04:30	2014-11-27 10:39:44.473196-04:30	COORDINACIÓN	\N	10
71	\N	2014-11-27 10:39:56.045524-04:30	2014-11-27 10:39:56.045524-04:30	ALMACEN	\N	10
72	\N	2014-11-27 10:40:05.859727-04:30	2014-11-27 10:40:05.859727-04:30	CONTROL DE CALIDAD	\N	10
73	\N	2014-11-27 10:40:13.303101-04:30	2014-11-27 10:40:13.303101-04:30	MOLINO	\N	10
74	\N	2014-12-16 09:17:59.301477-04:30	2014-12-16 09:17:59.301477-04:30	ADMINISTRACION	\N	11
75	\N	2014-12-16 09:18:40.029699-04:30	2014-12-16 09:18:40.029699-04:30	OPERADORES DE CAMPO	\N	11
77	\N	2014-12-30 09:39:59.387787-04:30	2014-12-30 09:39:59.387787-04:30	EMPAQUE	\N	10
\.


--
-- Name: departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('departamento_id_seq', 78, true);


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY empresa (id, usuario_id, fecha_registro, fecha_modificado, razon_social, rif, pais_id, estado_id, municipio_id, parroquia_id, representante_legal, pagina_web, telefono, fax, celular, logo, email) FROM stdin;
1	\N	2014-03-13 12:11:18.427198-04:30	2014-03-13 12:11:18.427198-04:30	EMPRESA MIXTA SOCIALISTA ARROZ DEL ALBA S.A.	G-200054321	240	69	224	717	Francisco Ortiz	http://www.arrozdelalba.gob.ve	02563361333	02563361333	 04162546908	default.png	arrozdelalba@arrozdelalba.gob.ve
\.


--
-- Name: empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('empresa_id_seq', 1, false);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY equipo (id, nombre, codigo, fabricante_id, activo_fijo, modelo_id, proveedor_id, fecha_compra, sector_id, caracteristicas, funcionamiento, observaciones, fecha_registro) FROM stdin;
1	TRANSPORTADOR 29	M-TRS-29	1	000028	1	1	2015-02-04	1	ES EL EQUIPO QUE RECIBE EL PRODUCYTO DEL ATQNEU PULMON DE ARROZ 	ES DE FACIL MANIPULACION Y TODO ESO 	\N	2015-09-07
\.


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('equipo_id_seq', 1, true);


--
-- Data for Name: equipo_parte; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY equipo_parte (id, equipo_id, parte_id, cantidad, caracteristicas) FROM stdin;
\.


--
-- Name: equipo_parte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('equipo_parte_id_seq', 1, false);


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY estado (id, codigo, pais_id, nombre) FROM stdin;
1	AL	235	Alabama
2	AK	235	Alaska
3	AZ	235	Arizona
4	AR	235	Arkansas
5	CA	235	California
6	CO	235	Colorado
7	CT	235	Connecticut
8	DE	235	Delaware
9	DC	235	District of Columbia
10	FL	235	Florida
11	GA	235	Georgia
12	HI	235	Hawaii
13	ID	235	Idaho
14	IL	235	Illinois
15	IN	235	Indiana
16	IA	235	Iowa
17	KS	235	Kansas
18	KY	235	Kentucky
19	LA	235	Louisiana
20	ME	235	Maine
21	MT	235	Montana
22	NE	235	Nebraska
23	NV	235	Nevada
24	NH	235	New Hampshire
25	NJ	235	New Jersey
26	NM	235	New Mexico
27	NY	235	New York
28	NC	235	North Carolina
29	ND	235	North Dakota
30	OH	235	Ohio
31	OK	235	Oklahoma
32	OR	235	Oregon
33	MD	235	Maryland
34	MA	235	Massachusetts
35	MI	235	Michigan
36	MN	235	Minnesota
37	MS	235	Mississippi
38	MO	235	Missouri
39	PA	235	Pennsylvania
40	RI	235	Rhode Island
41	SC	235	South Carolina
42	SD	235	South Dakota
43	TN	235	Tennessee
44	TX	235	Texas
45	UT	235	Utah
46	VT	235	Vermont
47	VA	235	Virginia
48	WA	235	Washington
49	WV	235	West Virginia
50	WI	235	Wisconsin
51	WY	235	Wyoming
52	dc	240	Distrito Capital
53	am	240	Amazonas
54	an	240	Anzoategui
55	ap	240	Apure
56	ar	240	Aragua
57	ba	240	Barinas
58	bo	240	Bolivar
59	ca	240	Carabobo
60	co	240	Cojedes
61	da	240	Delta Amacuro
62	fa	240	Falcon
63	gu	240	Guarico
64	la	240	Lara
65	me	240	Merida
66	mi	240	Miranda
67	mo	240	Monagas
68	ne	240	Nueva Esparta
69	po	240	Portuguesa
70	su	240	Sucre
71	ta	240	Tachira
72	tr	240	Trujillo
73	va	240	Vargas
74	ya	240	Yaracuy
75	zu	240	Zulia
\.


--
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('estado_id_seq', 75, true);


--
-- Data for Name: estado_usuario; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY estado_usuario (id, usuario_id, fecha_registro, fecha_modificado, estado_usuario, descripcion) FROM stdin;
1	1	2014-03-13 13:35:39.596605-04:30	2014-03-13 13:35:39.596605-04:30	1	Activo por ser el Super Usuario del Sistema
113	3	2015-06-04 16:02:45.784156-04:30	2015-06-04 16:02:45.784156-04:30	1	Activado por registro inicial
114	4	2015-06-04 16:11:44.377753-04:30	2015-06-04 16:11:44.377753-04:30	1	Activado por registro inicial
115	5	2015-06-04 20:16:56.068599-04:30	2015-06-04 20:16:56.068599-04:30	1	Activado por registro inicial
116	6	2015-06-04 20:22:00.520448-04:30	2015-06-04 20:22:00.520448-04:30	1	Activado por registro inicial
117	5	2015-06-04 20:24:21.908532-04:30	2015-06-04 20:24:21.908532-04:30	2	Esta pasado de rancio
118	6	2015-06-04 20:32:28.554971-04:30	2015-06-04 20:32:28.554971-04:30	2	por user
119	4	2015-06-05 13:31:38.035907-04:30	2015-06-05 13:31:38.035907-04:30	2	bloqeuado
120	4	2015-06-05 13:32:17.526794-04:30	2015-06-05 13:32:17.526794-04:30	1	reactivar
121	3	2015-06-05 13:35:09.301948-04:30	2015-06-05 13:35:09.301948-04:30	2	afs
122	7	2015-07-10 11:01:17.376406-04:30	2015-07-10 11:01:17.376406-04:30	1	Activado por registro inicial
123	8	2015-07-10 12:50:12.499781-04:30	2015-07-10 12:50:12.499781-04:30	1	Activado por registro inicial
124	9	2015-07-10 12:53:28.264245-04:30	2015-07-10 12:53:28.264245-04:30	1	Activado por registro inicial
\.


--
-- Name: estado_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('estado_usuario_id_seq', 124, true);


--
-- Data for Name: fabricante; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY fabricante (id, nombre, observacion) FROM stdin;
1	TRUPPER	NINGUNA
\.


--
-- Name: fabricante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('fabricante_id_seq', 1, true);


--
-- Data for Name: falla; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY falla (id, descripcion, observacion) FROM stdin;
\.


--
-- Name: falla_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('falla_id_seq', 1, false);


--
-- Data for Name: incidencia; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY incidencia (id, fecha, departamento_id, hora_inicio, hora_fin, turno, falla_id, equipo_id, sector_id, parada_sector, parada_planta, analisis_falla, accion_correctiva, fecha_reparacion, responsable_reparacion, perdida_tn, persistencia_falla, observaciones) FROM stdin;
\.


--
-- Name: incidencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('incidencias_id_seq', 1, false);


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY marca (id, nombre, observacion) FROM stdin;
1	3m	\N
2	Trupper	trupper
\.


--
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('marca_id_seq', 2, true);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY menu (id, usuario_id, fecha_registro, fecha_modificado, menu_id, recurso_id, menu, url, posicion, icono, activo, visibilidad) FROM stdin;
8	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	8	Menús	sistema/menu/listar/	905	icon-list	1	1
9	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	9	Perfiles	sistema/perfil/listar/	906	icon-group	1	1
16	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	15	15	Empresa	config/empresa/	876	icon-briefcase	1	1
17	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	15	16	Sucursales	config/sucursal/listar/	802	icon-sitemap	1	1
2	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	1	2	Escritorio	dashboard/	11	icon-home	1	1
1	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	\N	\N	Escritorio	dashboard/	10	icon-home	1	1
7	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	7	Mantenimiento	sistema/mantenimiento/	904	icon-bolt	2	1
13	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	13	Visor de sucesos	sistema/sucesos/	910	icon-filter	2	1
11	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	11	Recursos	sistema/recurso/listar/	901	icon-lock	1	1
22	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	15	21	Departamento	config/departamento/listar	806	icon-home	1	1
6	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	6	Backups	sistema/backup/listar/	903	icon-hdd	2	1
12	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	12	Usuarios	sistema/usuario/listar/	902	icon-user	1	1
10	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	10	Permisos	sistema/privilegio/listar/	905	icon-magic	1	1
38	\N	2014-04-22 10:09:02.242857-04:30	2014-04-22 10:09:02.242857-04:30	36	\N	Mantenimientos Preventivos	#	601	icon-magic	1	1
3	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	\N	\N	Sistema	#	900	icon-cogs	1	1
14	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	14	Sistema	sistema/configuracion/	911	icon-wrench	1	1
15	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	\N	\N	Configuraciones	#	800	icon-wrench	1	1
36	\N	2014-04-22 09:51:53.400012-04:30	2014-04-22 09:51:53.400012-04:30	\N	\N	Mantenimientos	#	600	icon-group	1	1
37	\N	2014-04-22 09:57:03.54549-04:30	2014-04-22 09:57:03.54549-04:30	36	\N	Mantenimientos Correctivos	#	602	icon-briefcase	1	1
5	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	5	Auditorías	sistema/auditoria/	908	icon-eye-open	2	1
4	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	3	4	Accesos	sistema/acceso/listar/	908	icon-exchange	2	1
76	\N	2015-06-15 22:53:13.67714-04:30	2015-06-15 22:53:13.67714-04:30	15	73	Fabricante	config/fabricante/listar	877	icon-home	1	1
77	\N	2015-06-15 22:54:58.865799-04:30	2015-06-15 22:54:58.865799-04:30	15	75	Marca	config/marca/listar	878	icon-home	1	1
78	\N	2015-06-15 22:55:35.560502-04:30	2015-06-15 22:55:35.560502-04:30	15	74	Modelo	config/modelo/listar	879	icon-home	1	1
79	\N	2015-06-18 21:45:35.906812-04:30	2015-06-18 21:45:35.906812-04:30	15	76	Sector	config/sector/	880	icon-home	1	1
80	\N	2015-06-20 13:21:14.531687-04:30	2015-06-20 13:21:14.531687-04:30	15	77	Proveedor	config/proveedor/	881	icon-home	1	1
28	\N	2014-03-16 12:46:04.752491-04:30	2014-03-16 12:46:04.752491-04:30	\N	\N	Fichas de Equipos	#	100	icon-list	1	1
26	\N	2014-03-13 13:30:24.848631-04:30	2014-03-13 13:30:24.848631-04:30	28	\N	Fichas de Equipos / equiporias	equipo/equipo/listar	101	icon-list	1	1
30	\N	2015-09-08 21:53:38.740672-04:30	2015-09-08 21:53:38.740672-04:30	\N	\N	incidencias	incidencias/incidencia/listar	200	icon-group	1	1
32	\N	2015-09-08 22:05:22.805247-04:30	2015-09-08 22:05:22.805247-04:30	30	\N	Registrar	#	202	\N	1	1
31	\N	2015-09-08 21:58:45.638091-04:30	2015-09-08 21:58:45.638091-04:30	30	\N	Incidencias	#	200	icon-th	1	1
86	\N	2015-09-08 22:54:47.734851-04:30	2015-09-08 22:54:47.734851-04:30	15	86	Categorias de Partes	config/parte_categoria/	882	icon-home	1	1
87	\N	2015-09-08 22:57:11.546879-04:30	2015-09-08 22:57:11.546879-04:30	15	87	Partes de Equipo	config/parte	883	icon-home	1	1
\.


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('menu_id_seq', 87, true);


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY modelo (id, nombre, observacion, marca_id) FROM stdin;
1	KAGASAKI	NINGUNA	2
\.


--
-- Name: modelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('modelo_id_seq', 1, true);


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY municipio (id, estado_id, codigo, nombre) FROM stdin;
1	52	001	Libertador
2	53	002	Alto Orinoco
3	53	003	Atabapo
4	53	004	Atures
5	53	005	Autana
6	53	006	Manapiare
7	53	007	Maroa
8	53	008	Rio Negro
9	54	009	Anaco
10	54	010	Aragua
11	54	011	Bolivar
12	54	012	Bruzual
13	54	013	Cajigal
14	54	014	Carvajal
15	54	015	Diego Bautista Urbaneja
16	54	016	Freites
17	54	017	Guanipa
18	54	018	Guanta
19	54	019	Independencia
20	54	020	Libertad
21	54	021	McGregor
22	54	022	Miranda
23	54	023	Monagas
24	54	024	Penalver
25	54	025	Piritu
26	54	026	San Juan de Capistrano
27	54	027	Santa Ana
28	54	028	Simon Rodriguez
29	54	029	Sotillo
30	55	031	Achaguas
31	55	032	Biruaca
32	55	033	Munoz
33	55	034	Paez
34	55	035	Pedro Camejo
35	55	036	Romulo Gallegos
36	55	037	San Fernando
37	56	038	Bolivar
38	56	039	Camatagua
39	56	040	Francisco Linares Alcantara
40	56	041	Girardot
41	56	042	Jose Angel Lamas
42	56	043	Jose Felix Ribas
43	56	044	José Rafael Revenga
44	56	046	Libertador
45	56	047	Mario Briceno Iragorry
46	56	048	Ocumare de la Costa de Oro
47	56	049	San Casimiro
48	56	050	San Sebastian
49	56	051	Santiago Marino
50	56	052	Santos Michelena
51	56	053	Sucre
52	56	054	Tovar
53	56	055	Urdaneta
54	56	056	Zamora
55	57	057	Alberto Arvelo Torrealba
56	57	058	Andres Eloy Blanco
57	57	059	Antonio Jose de Sucre
58	57	060	Arismendi
59	57	061	Barinas
60	57	062	Bolivar
61	57	063	Cruz Paredes
62	57	064	Ezequiel Zamora
63	57	065	Obispos
64	57	066	Pedraza
65	57	067	Rojas
66	57	068	Sosa
67	58	069	Caroni
68	58	070	Cedeno
69	58	071	El Callao
70	58	072	Gran Sabana
71	58	073	Heres
72	58	074	Piar
73	58	075	Raul Leoni
74	58	076	Roscio
75	58	077	Sifontes
76	58	078	Sucre
77	58	079	Padre Pedro Chien
78	59	080	Bejuma
79	59	081	Carlos Arvelo
80	59	082	Guacara
81	59	083	Diego Ibarra
82	59	084	Juan Jose Mora
83	59	085	Libertador
84	59	086	Los Guayos
85	59	087	Naguanagua
86	59	088	Miranda
87	59	089	Montalban
88	59	090	Puerto Cabello
89	59	091	San Diego
90	59	092	San Joaquín
91	59	093	Valencia
92	60	094	Anzoategui
93	60	095	Falcon
94	60	095	Girardot
95	60	096	Lima Blanco
96	60	097	Pao de San Juan Bautista
97	60	098	Ricaurte
98	60	099	Romulo Gallegos
99	60	100	San Carlos
100	60	101	Tinaco
101	61	102	Antonio Diaz
102	61	103	Casacoima
103	61	104	Pedernales
104	61	105	Tucupita
105	62	106	Acosta
106	62	107	Bolivar
107	62	108	Buchivacoa
108	62	109	Cacique Manaure
109	62	110	Carirubana
110	62	111	Colina
111	62	112	Dabajuro
112	62	113	Democracia
113	62	114	Falcon
114	62	115	Federacion
115	62	116	Jacura
116	62	117	Los Taques
117	62	118	Mauroa
118	62	119	Miranda
119	62	120	Monsenor Iturriza
120	62	121	Palmasola
121	62	122	Petit
122	62	123	Piritu
123	62	124	San Francisco
124	62	125	Silva
125	62	126	Sucre
126	62	127	Tocopero
127	62	128	Union
128	62	129	Urumaco
129	62	130	Zamora
130	63	131	Camaguan
131	63	132	Chaguaramas
132	63	133	El Socorro
133	63	134	Sebastian Francisco de Miranda
134	63	135	Jose Felix Ribas
135	63	136	Jose Tadeo Monagas
136	63	137	Juan German Roscio
137	63	138	Julian Mellado
138	63	139	Las Mercedes
139	63	140	Leonardo Infante
140	63	141	Pedro Zaraza
141	63	142	Ortiz
142	63	143	San Geronimo de Guayabal
143	63	144	San Jose de Guaribe
144	63	145	Santa Maria de Ipire
145	64	146	Andres Eloy Blanco
146	64	147	Crespo
147	64	148	Iribarren
148	64	149	Jimenez
149	64	150	Moran 
150	64	151	Palavecino
151	64	152	Simon Planas
152	64	153	Torres
153	64	154	Urdaneta
154	65	155	Alberto Adriani
155	65	156	Andres Bello
156	65	157	Antonio Pinto Salinas
157	65	158	Aricagua
158	65	159	Arzobispo Chacon
159	65	160	Campo Elias
160	65	161	Caracciolo Parra Olmedo
161	65	162	Cardenal Quintero
162	65	163	Guaraque
163	65	164	Julio Cesar Salas
164	65	165	Justo Briceno
165	65	166	Libertador
166	65	167	Miranda
167	65	168	Obispo Ramos de Lora
168	65	169	Padre Noguera
169	65	170	Pueblo Llano
170	65	171	Rangel
171	65	172	Rivas Davila
172	65	173	Santos Marquina
173	65	174	Sucre
174	65	175	Tovar
175	65	176	Tulio Febres Cordero
176	65	177	Zea
177	66	178	Acevedo
178	66	179	Andres Bello
179	66	180	Baruta
180	66	181	Brion
181	66	182	Buroz
182	66	183	Carrizal
183	66	184	Chacao
184	66	185	Cristobal Rojas
185	66	186	El Hatillo
186	66	187	Guaicaipuro
187	66	188	Independencia
188	66	189	Lander
189	66	190	Los Salias
190	66	191	Paez
191	66	192	Paz Castillo
192	66	193	Pedro Gual
193	66	194	Plaza
194	66	195	Simon Bolívar
195	66	196	Sucre
196	66	197	Urdaneta
197	66	198	Zamora
198	67	201	Acosta
199	67	202	Aguasay
200	67	203	Bolivar
201	67	204	Caripe
202	67	205	Cedeno
203	67	206	Ezequiel Zamora
204	67	207	Libertador
205	67	208	Maturin
206	67	209	Piar
207	67	210	Punceres
208	67	211	Santa Barbara
209	67	212	Sotillo
210	67	213	Uracoa
211	68	214	Antolin del Campo
212	68	215	Arismendi
213	68	216	Diaz
214	68	217	Garcia
215	68	218	Gomez
216	68	219	Maneiro
217	68	220	Marcano
218	68	221	Marino
219	68	222	Peninsula de Macanao
220	68	223	Tubores
221	68	224	Villalba
222	69	225	Agua Blanca
223	69	226	Araure
224	69	227	Esteller
225	69	228	Guanare
226	69	229	Guanarito
227	69	230	Monsenor Jose Vicente de Unda
228	69	231	Ospino
229	69	232	Paez
230	69	233	Papelon
231	69	234	San Genaro de Boconoito
232	69	235	San Rafael de Onoto
233	69	236	Santa Rosalia
234	69	237	Sucre
235	69	238	Turen
236	70	239	Andres Eloy Blanco
237	70	240	Andres Mata
238	70	241	Arismendi 
239	70	242	Benitez
240	70	243	Bermudez
241	70	244	Cajigal
242	70	245	Cruz Salmeron Acosta
243	70	246	Libertador
244	70	247	Marino
245	70	248	Mejia
246	70	249	Montes
247	70	250	Ribero
248	70	251	Sucre
249	70	252	Valdez
250	71	254	Andres Bello
251	71	255	Antonio Romulo Costa
252	71	256	Ayacucho
253	71	257	Bolivar
254	71	258	Cardenas
255	71	259	Cordoba
256	71	260	Fernandez Feo
257	71	261	Francisco de Miranda
258	71	262	Garcia de Hevia
259	71	263	Guasimos
260	71	264	Jose Maria Vargas
261	71	265	Independencia
262	71	266	Jauregui
263	71	267	Junin
264	71	268	Libertad
265	71	269	Libertador
266	71	270	Lobatera
267	71	271	Michelena
268	71	272	Pedro Maria Urena
269	71	273	Rafael Urdaneta
270	71	274	Samuel Dario Maldonado
271	71	275	San Cristobal 
272	71	276	Seboruco
273	71	277	Simon Rodriguez
274	71	278	Sucre
275	71	279	Torbes
276	71	280	Uribante
277	71	281	San Judas Tadeo
278	71	282	Panamericano
279	72	301	Andres Bello
280	72	302	Bocono
281	72	303	Bolivar
282	72	304	Candelaria
283	72	305	Carache
284	72	306	Escuque
285	72	307	Jose Felipe Marquez Canizalez
286	72	308	Juan Vicente Campos Elias
287	72	309	La Ceiba
288	72	310	Miranda
289	72	311	Monte Carmelo
290	72	312	Motatan
291	72	313	Pampan
292	72	314	Pampanito
293	72	315	Rafael Rangel
294	72	316	San Rafael de Carvajal
295	72	317	Sucre
296	72	318	Trujillo
297	72	319	Urdaneta
298	72	320	Valera
299	73	200	Vargas
300	74	401	Aristides Bastidas
301	74	402	Bolivar
302	74	403	Bruzual
303	74	404	Cocorote
304	74	405	Independencia
305	74	406	Jose Antonio Paez
306	74	407	La Trinidad
307	74	408	Manuel Monge
308	74	409	Nirgua
309	74	410	Pena
310	74	411	San Felipe
311	74	412	Sucre
312	74	413	Urachiche
313	74	414	Veroes
314	75	501	Almirante Padilla
315	75	502	Baralt
316	75	503	Cabimas
317	75	522	Catatumbo
318	75	504	Colon
319	75	505	Francisco Javier Pulgar
320	75	506	Jesús Enrique Losada
321	75	507	Jesus Maria Semprun
322	75	508	La Cañada de Urdaneta
323	75	509	Lagunillas
324	75	510	Machiques de Perija
325	75	511	Mara
326	75	512	Maracaibo
327	75	513	Miranda
328	75	514	Páez
329	75	515	Rosario de Perija
330	75	517	San Francisco
331	75	518	Santa Rita
332	75	519	Simon Bolivar
333	75	520	Sucre
334	75	521	Valmore Rodriguez
\.


--
-- Name: municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('municipio_id_seq', 334, true);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY pais (id, codigo, nombre) FROM stdin;
1	AD	Andorra, Principality of
2	AE	United Arab Emirates
3	AF	Afghanistan, Islamic State of
4	AG	Antigua and Barbuda
5	AI	Anguilla
6	AL	Albania
7	AM	Armenia
8	AN	Netherlands Antilles
9	AO	Angola
10	AQ	Antarctica
11	AR	Argentina
12	AS	American Samoa
13	AT	Austria
14	AU	Australia
15	AW	Aruba
16	AX	Åland Islands
17	AZ	Azerbaijan
18	BA	Bosnia-Herzegovina
19	BB	Barbados
20	BD	Bangladesh
21	BE	Belgium
22	BF	Burkina Faso
23	BG	Bulgaria
24	BH	Bahrain
25	BI	Burundi
26	BJ	Benin
27	BL	Saint Barthélémy
28	BM	Bermuda
29	BN	Brunei Darussalam
30	BO	Bolivia
31	BQ	Bonaire, Sint Eustatius and Saba
32	BR	Brazil
33	BS	Bahamas
34	BT	Bhutan
35	BV	Bouvet Island
36	BW	Botswana
37	BY	Belarus
38	BZ	Belize
39	CA	Canada
40	CC	Cocos (Keeling) Islands
41	CF	Central African Republic
42	CD	Congo, Democratic Republic of the
43	CG	Congo
44	CH	Switzerland
45	CI	Ivory Coast (Cote D''Ivoire)
46	CK	Cook Islands
47	CL	Chile
48	CM	Cameroon
49	CN	China
50	CO	Colombia
51	CR	Costa Rica
52	CU	Cuba
53	CV	Cape Verde
54	CW	Curaçao
55	CX	Christmas Island
56	CY	Cyprus
57	CZ	Czech Republic
58	DE	Germany
59	DJ	Djibouti
60	DK	Denmark
61	DM	Dominica
62	DO	Dominican Republic
63	DZ	Algeria
64	EC	Ecuador
65	EE	Estonia
66	EG	Egypt
67	EH	Western Sahara
68	ER	Eritrea
69	ES	Spain
70	ET	Ethiopia
71	FI	Finland
72	FJ	Fiji
73	FK	Falkland Islands
74	FM	Micronesia
75	FO	Faroe Islands
76	FR	France
77	GA	Gabon
78	GD	Grenada
79	GE	Georgia
80	GF	French Guyana
81	GH	Ghana
82	GI	Gibraltar
83	GG	Guernsey
84	GL	Greenland
85	GM	Gambia
86	GN	Guinea
87	GP	Guadeloupe (French)
88	GQ	Equatorial Guinea
89	GR	Greece
90	GS	South Georgia and the South Sandwich Islands
91	GT	Guatemala
92	GU	Guam (USA)
93	GW	Guinea Bissau
94	GY	Guyana
95	HK	Hong Kong
96	HM	Heard and McDonald Islands
97	HN	Honduras
98	HR	Croatia
99	HT	Haiti
100	HU	Hungary
101	ID	Indonesia
102	IE	Ireland
103	IL	Israel
104	IM	Isle of Man
105	IN	India
106	IO	British Indian Ocean Territory
107	IQ	Iraq
108	IR	Iran
109	IS	Iceland
110	IT	Italy
111	JE	Jersey
112	JM	Jamaica
113	JO	Jordan
114	JP	Japan
115	KE	Kenya
116	KG	Kyrgyz Republic (Kyrgyzstan)
117	KH	Cambodia, Kingdom of
118	KI	Kiribati
119	KM	Comoros
120	KN	Saint Kitts & Nevis Anguilla
121	KP	North Korea
122	KR	South Korea
123	KW	Kuwait
124	KY	Cayman Islands
125	KZ	Kazakhstan
126	LA	Laos
127	LB	Lebanon
128	LC	Saint Lucia
129	LI	Liechtenstein
130	LK	Sri Lanka
131	LR	Liberia
132	LS	Lesotho
133	LT	Lithuania
134	LU	Luxembourg
135	LV	Latvia
136	LY	Libya
137	MA	Morocco
138	MC	Monaco
139	MD	Moldavia
140	ME	Montenegro
141	MF	Saint Martin (French part)
142	MG	Madagascar
143	MH	Marshall Islands
144	MK	Macedonia, the former Yugoslav Republic of
145	ML	Mali
146	MM	Myanmar
147	MN	Mongolia
148	MO	Macau
149	MP	Northern Mariana Islands
150	MQ	Martinique (French)
151	MR	Mauritania
152	MS	Montserrat
153	MT	Malta
154	MU	Mauritius
155	MV	Maldives
156	MW	Malawi
157	MX	Mexico
158	MY	Malaysia
159	MZ	Mozambique
160	NA	Namibia
161	NC	New Caledonia (French)
162	NE	Niger
163	NF	Norfolk Island
164	NG	Nigeria
165	NI	Nicaragua
166	NL	Netherlands
167	NO	Norway
168	NP	Nepal
169	NR	Nauru
170	NT	Neutral Zone
171	NU	Niue
172	NZ	New Zealand
173	OM	Oman
174	PA	Panama
175	PE	Peru
176	PF	Polynesia (French)
177	PG	Papua New Guinea
178	PH	Philippines
179	PK	Pakistan
180	PL	Poland
181	PM	Saint Pierre and Miquelon
182	PN	Pitcairn Island
183	PR	Puerto Rico
184	PS	Palestinian Territory, Occupied
185	PT	Portugal
186	PW	Palau
187	PY	Paraguay
188	QA	Qatar
189	RE	Reunion (French)
190	RO	Romania
191	RS	Serbia
192	RU	Russian Federation
193	RW	Rwanda
194	SA	Saudi Arabia
195	SB	Solomon Islands
196	SC	Seychelles
197	SD	Sudan
198	SE	Sweden
199	SG	Singapore
200	SH	Saint Helena
201	SI	Slovenia
202	SJ	Svalbard and Jan Mayen Islands
203	SK	Slovakia
204	SL	Sierra Leone
205	SM	San Marino
206	SN	Senegal
207	SO	Somalia
208	SR	Suriname
209	SS	South Sudan
210	ST	Saint Tome (Sao Tome) and Principe
211	SV	El Salvador
212	SX	Sint Maarten (Dutch part)
213	SY	Syria
214	SZ	Swaziland
215	TC	Turks and Caicos Islands
216	TD	Chad
217	TF	French Southern Territories
218	TG	Togo
219	TH	Thailand
220	TJ	Tajikistan
221	TK	Tokelau
222	TM	Turkmenistan
223	TN	Tunisia
224	TO	Tonga
225	TP	East Timor
226	TR	Turkey
227	TT	Trinidad and Tobago
228	TV	Tuvalu
229	TW	Taiwan
230	TZ	Tanzania
231	UA	Ukraine
232	UG	Uganda
233	GB	United Kingdom
234	UM	USA Minor Outlying Islands
235	US	United States
236	UY	Uruguay
237	UZ	Uzbekistan
238	VA	Holy See (Vatican City State)
239	VC	Saint Vincent & Grenadines
240	VE	Venezuela
241	VG	Virgin Islands (British)
242	VI	Virgin Islands (USA)
243	VN	Vietnam
244	VU	Vanuatu
245	WF	Wallis and Futuna Islands
246	WS	Samoa
247	YE	Yemen
248	YT	Mayotte
249	YU	Yugoslavia
250	ZA	South Africa
251	ZM	Zambia
252	ZR	Zaire
253	ZW	Zimbabwe
\.


--
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('pais_id_seq', 253, true);


--
-- Data for Name: parroquia; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY parroquia (id, nombre, municipio_id) FROM stdin;
1	Parroquia Huachamacare	2
2	Parroquia Marawaka	2
3	Parroquia Mavaca	2
4	Parroquia Sierra Parima	2
5	Parroquia Ucata	3
6	Parroquia Yapacana	3
7	Parroquia Caname	3
8	Parroquia Fernando Girón Tovar	4
9	Parroquia Luis Alberto Gómez	4
10	Parroquia Parhueña	4
11	Parroquia Platanillal	4
12	Parroquia Samariapo	5
13	Parroquia Sipapo	5
14	Parroquia Munduapo	5
15	Parroquia Guayapo	5
16	Parroquia Victorino	7
17	Parroquia Comunidad	7
18	Parroquia Alto Ventuari	6
19	Parroquia Medio Ventuari	6
20	Parroquia Bajo Ventuari	6
21	Parroquia Solano	8
22	Parroquia Casiquiare	8
23	Parroquia Cocuy	8
24	Parroquia Capital Anaco	9
25	Parroquia San Joaquín	9
26	Parroquia Capital Aragua	10
27	Parroquia Cachipo	10
28	Parroquia Capital Fernando de Peñalver	24
29	Parroquia San Miguel	24
30	Parroquia Sucre	24
31	Parroquia Capital Francisco del Carmen Carvajal	14
32	Parroquia Santa Bárbara	14
33	Parroquia Capital Francisco de Miranda	22
34	Parroquia Atapirire	22
35	Parroquia Boca del Pao	22
36	Parroquia El Pao	22
37	Parroquia Múcura	22
38	Parroquia Capital Guanta	18
39	Parroquia Chorrerón	18
40	Parroquia Capital Independencia	19
41	Parroquia Mamo	19
42	Parroquia Capital Puerto La Cruz	29
43	Parroquia Pozuelos	29
44	Parroquia Capital Juan Manuel Cajigal	13
45	Parroquia San Pablo	13
46	Parroquia Capital José Gregorio Monagas	23
47	Parroquia Piar	23
48	Parroquia San Diego de Cabrutica	23
49	Parroquia Santa Clara	23
50	Parroquia Uverito	23
51	Parroquia Zuata	23
52	Parroquia Capital Libertad	20
53	Parroquia El Carito	20
54	Parroquia Santa Inés	20
55	Parroquia Capital Manuel Ezequiel Bruzual	12
56	Parroquia Guanape	12
57	Parroquia Sabana de Uchire	12
58	Parroquia Capital Pedro María Freites	16
59	Parroquia Libertador	16
60	Parroquia Santa Rosa	16
61	Parroquia Urica	16
62	Parroquia Capital Píritu	25
63	Parroquia San Francisco	25
64	Parroquia Capital San Juan de Capistrano	26
65	Parroquia Boca de Chávez	26
66	Parroquia Capital Santa Ana	27
67	Parroquia Pueblo Nuevo	27
68	Parroquia El Carmen	11
69	Parroquia San Cristóbal	11
70	Parroquia Bergantín	11
71	Parroquia Caigua	11
72	Parroquia El Pilar	11
73	Parroquia Naricual	11
74	Parroquia Edmundo Barrios	28
75	Parroquia Miguel Otero Silva	28
76	Parroquia Capital Sir Arthur Mc Gregor	21
77	Parroquia Tomás Alfaro Calatrava	21
78	Parroquia Capital Diego Bautista Urbaneja	15
79	Parroquia El Morro	15
80	Parroquia Urbana Achaguas	30
81	Parroquia Apurito	30
82	Parroquia El Yagual	30
83	Parroquia Guachara	30
84	Parroquia Mucuritas	30
85	Parroquia Queseras del Medio	30
86	Parroquia Urbana Biruaca	31
87	Parroquia Urbana Bruzual	32
88	Parroquia Mantecal	32
89	Parroquia Quintero	32
90	Parroquia Rincón Hondo	32
91	Parroquia San Vicente	32
92	Parroquia Urbana Guasdualito	33
93	Parroquia Aramendi	33
94	Parroquia El Amparo	33
95	Parroquia San Camilo	33
96	Parroquia Urdaneta	33
97	Parroquia Urbana San Juan de Payara	34
98	Parroquia Codazzi	34
99	Parroquia Cunaviche	34
100	Parroquia Urbana Elorza	35
101	Parroquia La Trinidad	35
102	Parroquia Urbana San Fernando	36
103	Parroquia El Recreo	36
104	Parroquia Peñalver	36
105	Parroquia San Rafael de Atamaica	36
106	Parroquia Camatagua	38
107	Parroquia No Urbana Carmen de Cura	38
108	Parroquia No Urbana Choroní	40
109	Parroquia Urbana Las Delicias	40
110	Parroquia Urbana Madre María de San José	40
111	Parroquia Urbana Joaquín Crespo	40
112	Parroquia Urbana Pedro José Ovalles	40
113	Parroquia Urbana José Casanova Godoy	40
114	Parroquia Urbana Andrés Eloy Blanco	40
115	Parroquia Urbana Los Tacariguas	40
116	Parroquia José Félix Ribas	42
117	Parroquia Castor Nieves Ríos	42
118	Parroquia No Urbana Las Guacamayas	42
119	Parroquia No Urbana Pao de Zárate	42
120	Parroquia No Urbana Zuata	42
121	Parroquia Libertador	44
122	Parroquia No Urbana San Martín de Porres	44
123	Parroquia Mario Briceño Iragorry	45
124	Parroquia Caña de Azúcar	45
125	Parroquia San Casimiro	47
126	Parroquia No Urbana Güiripa	47
127	Parroquia No Urbana Ollas de Caramacate	47
128	Parroquia No Urbana Valle Morín	47
129	Parroquia Santiago Mariño	49
130	Parroquia No Urbana Arévalo Aponte	49
131	Parroquia No Urbana Chuao	49
132	Parroquia No Urbana Samán de Güere	49
133	Parroquia No Urbana Alfredo Pacheco Miranda	49
134	Parroquia Santos Michelena	50
135	Parroquia No Urbana Tiara	50
136	Parroquia Sucre	51
137	Parroquia No Urbana Bella Vista	51
138	Parroquia Urdaneta	53
139	Parroquia No Urbana Las Peñitas	53
140	Parroquia No Urbana San Francisco de Cara	53
141	Parroquia No Urbana Taguay	53
142	Parroquia Zamora	54
143	Parroquia No Urbana Magdaleno	54
144	Parroquia No Urbana San Francisco de Asís	54
145	Parroquia No Urbana Valles de Tucutunemo	54
146	Parroquia No Urbana Augusto Mijares	54
147	Parroquia Francisco Linares Alcántara	39
148	Parroquia No Urbana Francisco de Miranda	39
149	Parroquia No Urbana Monseñor Feliciano González	39
150	Parroquia Sabaneta	55
151	Parroquia Rodríguez Domínguez	55
152	Parroquia Ticoporo	57
153	Parroquia Andrés Bello	57
154	Parroquia Nicolás Pulido	57
155	Parroquia Arismendi	58
156	Parroquia Guadarrama	58
157	Parroquia La Unión	58
158	Parroquia San Antonio	58
159	Parroquia Barinas	59
160	Parroquia Alfredo Arvelo Larriva	59
161	Parroquia San Silvestre	59
162	Parroquia Santa Inés	59
163	Parroquia Santa Lucía	59
164	Parroquia Torunos	59
165	Parroquia El Carmen	59
166	Parroquia Rómulo Betancourt	59
167	Parroquia Corazón de Jesús	59
168	Parroquia Ramón Ignacio Méndez	59
169	Parroquia Alto Barinas	59
170	Parroquia Manuel Palacio Fajardo	59
171	Parroquia Juan Antonio Rodríguez Domínguez	59
172	Parroquia Dominga Ortiz de Páez	59
173	Parroquia Barinitas	60
174	Parroquia Altamira	60
175	Parroquia Calderas	60
176	Parroquia Barrancas	61
177	Parroquia El Socorro	61
178	Parroquia Masparrito	61
179	Parroquia Santa Bárbara	62
180	Parroquia José Ignacio Del Pumar	62
181	Parroquia Pedro Briceño Méndez	62
182	Parroquia Ramón Ignacio Méndez	62
183	Parroquia Obispos	63
184	Parroquia El Real	63
185	Parroquia La Luz	63
186	Parroquia Los Guasimitos	63
187	Parroquia Ciudad Bolivia	64
188	Parroquia Ignacio Briceño	64
189	Parroquia José Félix Ribas	64
190	Parroquia Paez	64
191	Parroquia Libertad	65
192	Parroquia Dolores	65
193	Parroquia Palacios Fajardo	65
194	Parroquia Santa Rosa	65
195	Parroquia Simón Rodríguez	65
196	Parroquia Ciudad de Nutrias	66
197	Parroquia El Regalo	66
198	Parroquia Puerto de Nutrias	66
199	Parroquia Santa Catalina	66
200	Parroquia Simón Bolívar	66
201	Parroquia El Cantón	56
202	Parroquia Santa Cruz de Guacas	56
203	Parroquia Puerto Vivas	56
204	Parroquia Cachamay	67
205	Parroquia Chirica	67
206	Parroquia Dalla Costa	67
207	Parroquia Once de Abril	67
208	Parroquia Simón Bolívar	67
209	Parroquia Unare	67
210	Parroquia Universidad	67
211	Parroquia Vista al Sol	67
212	Parroquia Pozo Verde	67
213	Parroquia Yocoima	67
214	Sección Capital Cedeño	68
215	Parroquia Altagracia	68
216	Parroquia Ascensión Farreras	68
217	Parroquia Guaniamo	68
218	Parroquia La Urbana	68
219	Parroquia Pijiguaos	68
220	Sección Capital Gran Sabana	70
221	Parroquia Ikabarú	70
222	Parroquia Agua Salada	71
223	Parroquia Catedral	71
224	Parroquia José Antonio Páez	71
225	Parroquia La Sabanita	71
226	Parroquia Marhuanta	71
227	Parroquia Vista Hermosa	71
228	Parroquia Orinoco	71
229	Parroquia Panapana	71
230	Parroquia Zea	71
231	Sección Capital Piar	72
232	Parroquia Andrés Eloy Blanco	72
233	Parroquia Pedro Cova	72
234	Sección Capital Raúl Leoni	73
235	Parroquia Barceloneta	73
236	Parroquia San Francisco	73
237	Parroquia Santa Bárbara	73
238	Sección Capital Roscio	74
239	Parroquia Salom	74
240	Sección Capital Sifontes	75
241	Parroquia Dalla Costa	75
242	Parroquia San Isidro	75
243	Sección Capital Sucre	76
244	Parroquia Aripao	76
245	Parroquia Guarataro	76
246	Parroquia Las Majadas	76
247	Parroquia Moitaco	76
248	Parroquia Urbana Bejuma	78
249	Parroquia No Urbana Canoabo	78
250	Parroquia No Urbana Simón Bolívar	78
251	Parroquia Urbana Güigüe	79
252	Parroquia No Urbana Belén	79
253	Parroquia No Urbana Tacarigua	79
254	Parroquia Urbana Aguas Calientes	81
255	Parroquia Urbana Mariara	81
256	Parroquia Urbana Ciudad Alianza	80
257	Parroquia Urbana Guacara	80
258	Parroquia No Urbana Yagua	80
259	Parroquia Urbana Morón	82
260	Parroquia No Urbana Urama	82
261	Parroquia Urbana Tocuyito	83
262	Parroquia Urbana Independencia	83
263	Parroquia Urbana Los Guayos	84
264	Parroquia Urbana Miranda	86
265	Parroquia Urbana Montalbán	87
266	Parroquia Urbana Naguanagua	85
267	Parroquia Urbana Bartolomé Salom	88
268	Parroquia Urbana Democracia	88
269	Parroquia Urbana Fraternidad	88
270	Parroquia Urbana Goaigoaza	88
271	Parroquia Urbana Juan José Flores	88
272	Parroquia Urbana Unión	88
273	Parroquia No Urbana Borburata	88
274	Parroquia No Urbana Patanemo	88
275	Parroquia Urbana San Diego	89
276	Parroquia Urbana San Joaquín	90
277	Parroquia Urbana Candelaria	91
278	Parroquia Urbana Catedral	91
279	Parroquia Urbana El Socorro	91
280	Parroquia Urbana Miguel Peña	91
281	Parroquia Urbana Rafael Urdaneta	91
282	Parroquia Urbana San Blas	91
283	Parroquia Urbana San José	91
284	Parroquia Urbana Santa Rosa	91
285	Parroquia No Urbana Negro Primero	91
286	Parroquia Cojedes	92
287	Parroquia Juan de Mata Suárez	92
288	Parroquia Tinaquillo	93
289	Parroquia El Baúl	94
290	Parroquia Sucre	94
291	Parroquia Macapo	95
292	Parroquia La Aguadita	95
293	Parroquia El Pao	96
294	Parroquia Libertad de Cojedes	97
295	Parroquia El Amparo	97
296	Parroquia Rómulo Gallegos	98
297	Parroquia San Carlos de Austria	99
298	Parroquia Juan Angel Bravo	99
299	Parroquia Manuel Manrique	99
300	Parroquia General en Jefe José Laurencio Silva	100
301	Parroquia Curiapo	101
302	Parroquia Almirante Luis Brión	101
303	Parroquia Francisco Aniceto Lugo	101
304	Parroquia Manuel Renaud	101
305	Parroquia Padre Barral	101
306	Parroquia Santos de Abelgas	101
307	Parroquia Imataca	102
308	Parroquia Cinco de Julio	102
309	Parroquia Juan Bautista Arismendi	102
310	Parroquia Manuel Piar	102
311	Parroquia Rómulo Gallegos	102
312	Parroquia Pedernales	103
313	Parroquia Luis Beltrán Prieto Figueroa	103
314	Parroquia San José	104
315	Parroquia José Vidal Marcano	104
316	Parroquia Juan Millán	104
317	Parroquia Leonardo Ruíz Pineda	104
318	Parroquia Mariscal Antonio José de Sucre	104
319	Parroquia Monseñor Argimiro García	104
320	Parroquia San Rafael	104
321	Parroquia Virgen del Valle	104
322	Parroquia Altagracia	1
323	Parroquia Antímano	1
324	Parroquia Candelaria	1
325	Parroquia Caricuao	1
326	Parroquia Catedral	1
327	Parroquia Coche	1
328	Parroquia El Junquito	1
329	Parroquia EL Paraíso	1
330	Parroquia El Recreo	1
331	Parroquia El Valle	1
332	Parroquia La Pastora	1
333	Parroquia La Vega	1
334	Parroquia Macarao	1
335	Parroquia San Agustín	1
336	Parroquia San Bernardino	1
337	Parroquia San José	1
338	Parroquia San Juan	1
339	Parroquia San Pedro	1
340	Parroquia Santa Rosalía	1
341	Parroquia Santa Teresa	1
342	Parroquia Sucre	1
343	Parroquia 23 de Enero	1
344	Parroquia San Juan de los Cayos	105
345	Parroquia Capadare	105
346	Parroquia La Pastora	105
347	Parroquia Libertador	105
348	Parroquia San Luis	106
349	Parroquia Aracua	106
350	Parroquia La Peña	106
351	Parroquia Capatárida	107
352	Parroquia Bariro	107
353	Parroquia Borojó	107
354	Parroquia Guajiro	107
355	Parroquia Seque	107
356	Parroquia Zazárida	107
357	Parroquia Carirubana	109
358	Parroquia Norte	109
359	Parroquia Punta Cardón	109
360	Parroquia Santa Ana	109
361	Parroquia La Vela de Coro	110
362	Parroquia Acurigua	110
363	Parroquia Guaibacoa	110
364	Parroquia Las Calderas	110
365	Parroquia Macoruca	110
366	Parroquia Pedregal	112
367	Parroquia Agua Clara	112
368	Parroquia Avaria	112
369	Parroquia Piedra Grande	112
370	Parroquia Purureche	112
371	Parroquia Pueblo Nuevo	113
372	Parroquia Adícora	113
373	Parroquia Baraived	113
374	Parroquia Buena Vista	113
375	Parroquia Jadacaquiva	113
376	Parroquia Moruy	113
377	Parroquia Adaure	113
378	Parroquia El Hato	113
379	Parroquia El Vínculo	113
380	Parroquia Churuguara	114
381	Parroquia Agua Larga	114
382	Parroquia El Paují	114
383	Parroquia Independencia	114
384	Parroquia Mapararí	114
385	Parroquia Jacura	115
386	Parroquia Agua Linda	115
387	Parroquia Araurima	115
388	Parroquia Los Taques	116
389	Parroquia Judibana	116
390	Parroquia Mene de Mauroa	117
391	Parroquia Casigua	117
392	Parroquia San Félix	117
393	Parroquia San Antonio	118
394	Parroquia San Gabriel	118
395	Parroquia Santa Ana	118
396	Parroquia Guzmán Guillermo	118
397	Parroquia Mitare	118
398	Parroquia Río Seco	118
399	Parroquia Sabaneta	118
400	Parroquia Chichiriviche	119
401	Parroquia Boca de Tocuyo	119
402	Parroquia Tocuyo de la Costa	119
403	Parroquia Cabure	121
404	Parroquia Colina	121
405	Parroquia Curimagua	121
406	Parroquia Píritu	122
407	Parroquia San José de la Costa	122
408	Parroquia Tucacas	124
409	Parroquia Boca de Aroa	124
410	Parroquia Sucre	125
411	Parroquia Pecaya	125
412	Parroquia Santa Cruz de Bucaral	127
413	Parroquia El Charal	127
414	Parroquia Las Vegas del Tuy	127
415	Parroquia Urumaco	128
416	Parroquia Bruzual	128
417	Parroquia Puerto Cumarebo	129
418	Parroquia La Ciénaga	129
419	Parroquia La Soledad	129
420	Parroquia Pueblo Cumarebo	129
421	Parroquia Zazárida	129
422	Parroquia Capital Camaguán	130
423	Parroquia Puerto Miranda	130
424	Parroquia Uverito	130
425	Parroquia Chaguaramas	131
426	Parroquia El Socorro	132
427	Parroquia Capital San Gerónimo de Guayabal	142
428	Parroquia Cazorla	142
429	Parroquia Capital Valle de La Pascua	139
430	Parroquia Espino	139
431	Parroquia Capital Las Mercedes	138
432	Parroquia Cabruta	138
433	Parroquia Santa Rita de Manapire	138
434	Parroquia Capital El Sombrero	137
435	Parroquia Sosa	137
436	Parroquia Capital Calabozo	133
437	Parroquia El Calvario	133
438	Parroquia El Rastro	133
439	Parroquia Guardatinajas	133
440	Parroquia Capital Altagracia de Orituco	135
441	Parroquia Lezama	135
442	Parroquia Libertad de Orituco	135
443	Parroquia Paso Real de Macaira	135
444	Parroquia San Francisco de Macaira	135
445	Parroquia San Rafael de Orituco	135
446	Parroquia Soublette	135
447	Parroquia Capital Ortiz	141
448	Parroquia San Francisco de Tiznado	141
449	Parroquia San José de Tiznado	141
450	Parroquia San Lorenzo de Tiznado	141
451	Parroquia Capital Tucupido	134
452	Parroquia San Rafael de Laya	134
453	Parroquia Capital San Juan de Los Morros	136
454	Parroquia Cantagallo	136
455	Parroquia Parapara	136
456	Parroquia San José de Guaribe	143
457	Parroquia Capital Santa María de Ipire	144
458	Parroquia Altamira	144
459	Parroquia Capital Zaraza	140
460	Parroquia San José de Unare	140
461	Parroquia Pío Tamayo	145
462	Parroquia Quebrada Honda de Guache	145
463	Parroquia Yacambú	145
464	Parroquia Fréitez	146
465	Parroquia José María Blanco	146
466	Parroquia Catedral	147
467	Parroquia Concepción	147
468	Parroquia El Cují	147
469	Parroquia Juan de Villegas	147
470	Parroquia Santa Rosa	147
471	Parroquia Tamaca	147
472	Parroquia Unión	147
473	Parroquia Aguedo Felipe Alvarado	147
474	Parroquia Buena Vista	147
475	Parroquia Juárez	147
476	Parroquia Juan Bautista Rodríguez	148
477	Parroquia Cuara	148
478	Parroquia Diego de Lozada	148
479	Parroquia Paraíso de San José	148
480	Parroquia San Miguel	148
481	Parroquia Tintorero	148
482	Parroquia José Bernardo Dorante	148
483	Parroquia Coronel Mariano Peraza	148
484	Parroquia Bolívar	149
485	Parroquia Anzoátegui	149
486	Parroquia Guarico	149
487	Parroquia Hilario Luna y Luna	149
488	Parroquia Humocaro Alto	149
489	Parroquia Humocaro Bajo	149
490	Parroquia La Candelaria	149
491	Parroquia Morán	149
492	Parroquia Cabudare	150
493	Parroquia José Gregorio Bastidas	150
494	Parroquia Agua Viva	150
495	Parroquia Sarare	151
496	Parroquia Buría	151
497	Parroquia Gustavo Vegas León	151
498	Parroquia Trinidad Samuel	152
499	Parroquia Antonio Díaz	152
500	Parroquia Camacaro	152
501	Parroquia Castañeda	152
502	Parroquia Cecilio Zubillaga	152
503	Parroquia Chiquinquirá	152
504	Parroquia El Blanco	152
632	Parroquia Ocumare del Tuy	188
505	Parroquia Espinoza de los Monteros	152
506	Parroquia Lara	152
507	Parroquia Las Mercedes	152
508	Parroquia Manuel Morillo	152
509	Parroquia Montaña Verde	152
510	Parroquia Montes de Oca	152
511	Parroquia Torres	152
512	Parroquia Heriberto Arroyo	152
513	Parroquia Reyes Vargas	152
514	Parroquia Altagracia	152
515	Parroquia Siquisique	153
516	Parroquia Moroturo	153
517	Parroquia San Miguel	153
518	Parroquia Xaguas	153
519	Parroquia Presidente Betancourt	154
520	Parroquia Presidente Páez 	154
521	Parroquia Presidente Rómulo Gallegos	154
522	Parroquia Gabriel Picón González	154
523	Parroquia Héctor Amable Mora	154
524	Parroquia José Nucete Sardi	154
525	Parroquia Pulido Méndez	154
526	Parroquia Capital Antonio Pinto Salinas 	156
527	Parroquia Mesa Bolívar	156
528	Parroquia Mesa de Las Palmas	156
529	Parroquia Capital Aricagua	157
530	Parroquia San Antonio	157
531	Parroquia Capital Arzobispo Chacón	158
532	Parroquia Capurí	158
533	Parroquia Chacantá	158
534	Parroquia El Molino	158
535	Parroquia Guaimaral	158
536	Parroquia Mucutuy	158
537	Parroquia Mucuchachí	158
538	Parroquia Fernández Peña	159
539	Parroquia Matriz	159
540	Parroquia Montalbán	159
541	Parroquia Acequias	159
542	Parroquia Jají	159
543	Parroquia La Mesa	159
544	Parroquia San José del Sur	159
545	Parroquia Capital Caracciolo Parra Olmedo	160
546	Parroquia Florencio Ramírez	160
547	Parroquia Capital Cardenal Quintero	161
548	Parroquia Las Piedras	161
549	Parroquia Capital Guaraque	162
550	Parroquia Mesa de Quintero	162
551	Parroquia Río Negro	162
552	Parroquia Capital Julio César Salas	163
553	Parroquia Palmira	163
554	Parroquia Capital Justo Briceño	164
555	Parroquia San Cristóbal de Torondoy	164
556	Parroquia Antonio Spinetti Dini	165
557	Parroquia Arias	165
558	Parroquia Caracciolo Parra Pérez	165
559	Parroquia Domingo Peña	165
560	Parroquia El Llano	165
561	Parroquia Gonzalo Picón Febres	165
562	Parroquia Jacinto Plaza	165
563	Parroquia Juan Rodríguez Suárez	165
564	Parroquia Lasso de la Vega	165
565	Parroquia Mariano Picón Salas	165
566	Parroquia Milla	165
567	Parroquia Osuna Rodríguez	165
568	Parroquia Sagrario	165
569	Parroquia El Morro	165
570	Parroquia Los Nevados	165
571	Parroquia Capital Miranda	166
572	Parroquia Andrés Eloy Blanco	166
573	Parroquia La Venta	166
574	Parroquia Piñango	166
575	Parroquia Capital Obispo Ramos de Lora	167
576	Parroquia Eloy Paredes	167
577	Parroquia San Rafael de Alcázar	167
578	Parroquia Capital Rangel	170
579	Parroquia Cacute	170
580	Parroquia La Toma	170
581	Parroquia Mucurubá	170
582	Parroquia San Rafael	170
583	Parroquia Capital Rivas Dávila	171
584	Parroquia Gerónimo Maldonado	171
585	Parroquia Capital Sucre	173
586	Parroquia Chiguará	173
587	Parroquia Estánquez	173
588	Parroquia La Trampa	173
589	Parroquia Pueblo Nuevo del Sur	173
590	Parroquia San Juan	173
591	Parroquia El Amparo	174
592	Parroquia El Llano	174
593	Parroquia San Francisco	174
594	Parroquia Tovar	174
595	Parroquia Capital Tulio Febres Cordero	175
596	Parroquia Independencia	175
597	Parroquia María de la Concepción Palacios Blanco	175
598	Parroquia Santa Apolonia	175
599	Parroquia Capital Zea	176
600	Parroquia Caño El Tigre	176
601	Parroquia Caucagua	177
602	Parroquia Aragüita	177
603	Parroquia Arévalo González	177
604	Parroquia Capaya	177
605	Parroquia El Café	177
606	Parroquia Marizapa	177
607	Parroquia Panaquire	177
608	Parroquia Ribas	177
609	Parroquia San José de Barlovento	178
610	Parroquia Cumbo	178
611	Parroquia Baruta	179
612	Parroquia El Cafetal	179
613	Parroquia Las Minas de Baruta	179
614	Parroquia Higuerote	180
615	Parroquia Curiepe	180
616	Parroquia Tacarigua	180
617	Parroquia Mamporal	181
618	Parroquia Carrizal	182
619	Parroquia Chacao	183
620	Parroquia Charallave	184
621	Parroquia Las Brisas	184
622	Parroquia El Hatillo	185
623	Parroquia Los Teques	186
624	Parroquia Altagracia de La Montaña	186
625	Parroquia Cecilio Acosta	186
626	Parroquia El Jarillo	186
627	Parroquia Paracotos	186
628	Parroquia San Pedro	186
629	Parroquia Tácata	186
630	Parroquia Santa Teresa del Tuy	187
631	Parroquia El Cartanal/	187
633	Parroquia La Democracia	188
634	Parroquia Santa Bárbara	188
635	Parroquia San Antonio de Los Altos	189
636	Parroquia Río Chico	190
637	Parroquia El Guapo	190
638	Parroquia Tacarigua de La Laguna	190
639	Parroquia Paparo	190
640	Parroquia San Fernando del Guapo	190
641	Parroquia Santa Lucía	191
642	Parroquia Cúpira	192
643	Parroquia Machurucuto	192
644	Parroquia Guarenas	193
645	Parroquia San Francisco de Yare	194
646	Parroquia San Antonio de Yare	194
647	Parroquia Petare	195
648	Parroquia Caucagüita	195
649	Parroquia Fila de Mariches	195
650	Parroquia La Dolorita	195
651	Parroquia Leoncio Martínez	195
652	Parroquia Cúa	196
653	Parroquia Nueva Cúa	196
654	Parroquia Guatire	197
655	Parroquia Bolívar	197
656	Parroquia Capital Acosta 	198
657	Parroquia San Francisco	198
658	Parroquia Capital Caripe	201
659	Parroquia El Guácharo	201
660	Parroquia La Guanota	201
661	Parroquia Sabana de Piedra	201
662	Parroquia San Agustín	201
663	Parroquia Teresén	201
664	Parroquia Capital Cedeño	202
665	Parroquia Areo	202
666	Parroquia San Félix	202
667	Parroquia Viento Fresco	202
668	Parroquia Capital Ezequiel Zamora	203
669	Parroquia El Tejero	203
670	Parroquia Capital Libertador	204
671	Parroquia Chaguaramas	204
672	Parroquia Las Alhuacas	204
673	Parroquia Tabasca	204
674	Parroquia Capital Maturín	205
675	Parroquia Alto de los Godos	205
676	Parroquia Boquerón	205
677	Parroquia Las Cocuizas	205
678	Parroquia San Simón	205
679	Parroquia Santa Cruz	205
680	Parroquia El Corozo	205
681	Parroquia El Furrial	205
682	Parroquia Jusepín	205
683	Parroquia La Pica	205
684	Parroquia San Vicente	205
685	Parroquia Capital Piar	206
686	Parroquia Aparicio	206
687	Parroquia Chaguaramal	206
688	Parroquia El Pinto	206
689	Parroquia Guanaguana	206
690	Parroquia La Toscana	206
691	Parroquia Taguaya	206
692	Parroquia Capital Punceres	207
693	Parroquia Cachipo	207
694	Parroquia Capital Sotillo	209
695	Parroquia Los Barrancos de Fajardo	209
696	Parroquia Capital Díaz	213
697	Parroquia Zabala	213
698	Parroquia Capital García	214
699	Parroquia Francisco Fajardo	214
700	Parroquia Capital Gómez	215
701	Parroquia Bolívar	215
702	Parroquia Guevara	215
703	Parroquia Matasiete	215
704	Parroquia Sucre	215
705	Parroquia Capital Maneiro	216
706	Parroquia Aguirre	216
707	Parroquia Capital Marcano	217
708	Parroquia Adrián	217
709	Parroquia Capital Península de Macanao	219
710	Parroquia San Francisco	219
711	Parroquia Capital Tubores	220
712	Parroquia Los Barales	220
713	Parroquia Capital Villalba	221
714	Parroquia Vicente Fuentes	221
715	Parroquia Capital Araure	223
716	Parroquia Río Acarigua	223
717	Parroquia Capital Esteller	224
718	Parroquia Uveral	224
719	Parroquia Capital Guanare	225
720	Parroquia Córdoba	225
721	Parroquia San José de la Montaña	225
722	Parroquia San Juan de Guanaguanare	225
723	Parroquia Virgen de la Coromoto	225
724	Parroquia Capital Guanarito	226
725	Parroquia Trinidad de la Capilla	226
726	Parroquia Divina Pastora	226
727	Parroquia Capital Mons.José Vicente de Unda	227
728	Parroquia Peña Blanca	227
729	Parroquia Capital Ospino	228
730	Parroquia Aparición	228
731	Parroquia La Estación	228
732	Parroquia Capital Páez	229
733	Parroquia Payara	229
734	Parroquia Pimpinela	229
735	Parroquia Ramón Peraza	229
736	Parroquia Capital Papelón	230
737	Parroquia Caño Delgadito	230
738	Parroquia Capital San Genaro de Boconoito	231
739	Parroquia Antolín Tovar	231
740	Parroquia Capital San Rafael de Onoto	232
741	Parroquia Santa Fe	232
742	Parroquia Thermo Morles	232
743	Parroquia Capital Santa Rosalía	233
744	Parroquia Florida	233
745	Parroquia Capital Sucre	234
746	Parroquia Concepción	234
747	Parroquia San Rafael de Palo Alzado	234
748	Parroquia Uvencio Antonio Velásquez	234
749	Parroquia San José de Saguaz	234
750	Parroquia Villa Rosa	234
751	Parroquia Capital Turén	235
752	Parroquia Canelones	235
753	Parroquia Santa Cruz	235
754	Parroquia San Isidro Labrador	235
755	Parroquia Mariño	236
756	Parroquia Rómulo Gallegos	236
757	Parroquia San José de Aerocuar	237
758	Parroquia Tavera Acosta	237
759	Parroquia Río Caribe	238
760	Parroquia Antonio José de Sucre	238
761	Parroquia El Morro de Puerto Santo	238
762	Parroquia Puerto Santo	238
763	Parroquia San Juan de Las Galdonas	238
764	Parroquia El Pilar	239
765	Parroquia El Rincón	239
766	Parroquia General Francisco Antonio Vásquez	239
767	Parroquia Guaraúnos	239
768	Parroquia Tunapuicito	239
769	Parroquia Unión	239
770	Parroquia Bolívar	240
771	Parroquia Macarapana	240
772	Parroquia Santa Catalina	240
773	Parroquia Santa Rosa	240
774	Parroquia Santa Teresa	240
775	Parroquia Yaguaraparo	241
776	Parroquia El Paujil	241
777	Parroquia Libertad	241
778	Parroquia Araya	242
779	Parroquia Chacopata	242
780	Parroquia Manicuare	242
781	Parroquia Tunapuy	243
782	Parroquia Campo Elías	243
783	Parroquia Irapa	244
784	Parroquia Campo Claro	244
785	Parroquia Marabal	244
786	Parroquia San Antonio de Irapa	244
787	Parroquia Soro	244
788	Parroquia Cumanacoa	246
789	Parroquia Arenas	246
790	Parroquia Aricagua	246
791	Parroquia Cocollar	246
792	Parroquia San Fernando	246
793	Parroquia San Lorenzo	246
794	Parroquia Villa Frontado (Muelle de Cariaco)	247
795	Parroquia Catuaro	247
796	Parroquia Rendón	247
797	Parroquia Santa Cruz	247
798	Parroquia Santa María	247
799	Parroquia Altagracia	248
800	Parroquia Ayacucho	248
801	Parroquia Santa Inés	248
802	Parroquia Valentín Valiente	248
803	Parroquia San Juan	248
804	Parroquia Raúl Leoni	248
805	Parroquia Gran Mariscal 	248
806	Parroquia Güiria	249
807	Parroquia Bideau	249
808	Parroquia Cristóbal Colón	249
809	Parroquia Punta de Piedras	249
810	Parroquia Ayacucho	252
811	Parroquia Rivas Berti	252
812	Parroquia San Pedro del Río	252
813	Parroquia Bolívar	253
814	Parroquia Palotal	253
815	Parroquia Juan Vicente Gómez	253
816	Parroquia Isaías Medina Angarita	253
817	Parroquia Cárdenas	254
818	Parroquia Amenodoro Rangel Lamús	254
819	Parroquia La Florida	254
820	Parroquia Fernández Feo	256
821	Parroquia Alberto Adriani	256
822	Parroquia Santo Domingo	256
823	Parroquia García de Hevia	258
824	Parroquia Boca de Grita	258
825	Parroquia José Antonio Páez	258
826	Parroquia Independencia	261
827	Parroquia Juan Germán Roscio	261
828	Parroquia Román Cárdenas	261
829	Parroquia Jáuregui	262
830	Parroquia Emilio Constantino Guerrero	262
831	Parroquia Monseñor Miguel Antonio Salas	262
832	Parroquia Junín	263
833	Parroquia La Petrólea	263
834	Parroquia Quinimarí	263
835	Parroquia Bramón	263
836	Parroquia Libertad	264
837	Parroquia Cipriano Castro	264
838	Parroquia Manuel Felipe Rugeles	264
839	Parroquia Libertador	265
840	Parroquia Don Emeterio Ochoa	265
841	Parroquia Doradas	265
842	Parroquia San Joaquín de Navay	265
843	Parroquia Lobatera	266
844	Parroquia Constitución	266
845	Parroquia Panamericano	278
846	Parroquia La Palmita	278
847	Parroquia Pedro María Ureña	268
848	Parroquia Nueva Arcadia	268
849	Parroquia Samuel Darío Maldonado	270
850	Parroquia Boconó	270
851	Parroquia Hernández	270
852	Parroquia La Concordia	271
853	Parroquia Pedro María Morantes	271
854	Parroquia San Juan Bautista	271
855	Parroquia San Sebastián	271
856	Parroquia Dr. Francisco Romero Lobo	271
857	Parroquia Sucre	274
858	Parroquia Eleazar López Contreras	274
859	Parroquia San Pablo	274
860	Parroquia  Uribante	276
861	Parroquia Cárdenas	276
862	Parroquia Juan Pablo Peñaloza	276
863	Parroquia Potosí	276
864	Parroquia Santa Isabel	279
865	Parroquia Araguaney	279
866	Parroquia El Jagüito	279
867	Parroquia La Esperanza	279
868	Parroquia Boconó	280
869	Parroquia El Carmen	280
870	Parroquia Mosquey	280
871	Parroquia Ayacucho	280
872	Parroquia Burbusay	280
873	Parroquia General Rivas	280
874	Parroquia Guaramacal	280
875	Parroquia Vega de Guaramacal	280
876	Parroquia Monseñor Jáuregui	280
877	Parroquia Rafael Rangel	280
878	Parroquia San Miguel	280
879	Parroquia San José	280
880	Parroquia Sabana Grande	281
881	Parroquia Cheregüé	281
882	Parroquia Granados	281
883	Parroquia Chejendé	282
884	Parroquia Arnoldo Gabaldón	282
885	Parroquia Bolivia	282
886	Parroquia Carrillo	282
887	Parroquia Cegarra	282
888	Parroquia Manuel Salvador Ulloa	282
889	Parroquia San José	282
890	Parroquia Carache	283
891	Parroquia Cuicas	283
892	Parroquia La Concepción	283
893	Parroquia Panamericana	283
894	Parroquia Santa Cruz	283
895	Parroquia Escuque	284
896	Parroquia La Unión	284
897	Parroquia Sabana Libre	284
898	Parroquia Santa Rita	284
899	Parroquia El Socorro	285
900	Parroquia Antonio José de Sucre	285
901	Parroquia Los Caprichos	285
902	Parroquia Campo Elías	286
903	Parroquia Arnoldo Gabaldón	286
904	Parroquia Santa Apolonia	287
905	Parroquia El Progreso 	287
906	Parroquia La Ceiba 	287
907	Parroquia Tres de Febrero 	287
908	Parroquia El Dividive	288
909	Parroquia Agua Santa	288
910	Parroquia Agua Caliente	288
911	Parroquia El Cenizo	288
912	Parroquia Valerita	288
913	Parroquia Monte Carmelo	289
914	Parroquia Buena Vista	289
915	Parroquia Santa María del Horcón	289
916	Parroquia Motatán	290
917	Parroquia El Baño	290
918	Parroquia Jalisco	290
919	Parroquia Pampán	291
920	Parroquia Flor de Patria	291
921	Parroquia La Paz	291
922	Parroquia Santa Ana	291
923	Parroquia Pampanito	292
924	Parroquia La Concepción	292
925	Parroquia Pampanito II	292
926	Parroquia Betijoque	293
927	Parroquia La Pueblita	293
928	Parroquia Los Cedros	293
929	Parroquia José Gregorio Hernández	293
930	Parroquia Carvajal	294
931	Parroquia Antonio Nicolás Briceño	294
932	Parroquia Campo Alegre	294
933	Parroquia José Leonardo Suárez	294
934	Parroquia Sabana de Mendoza	295
935	Parroquia El Paraíso	295
936	Parroquia Junín	295
937	Parroquia Valmore Rodríguez	295
938	Parroquia Andrés Linares	296
939	Parroquia Chiquinquirá	296
940	Parroquia Cristóbal Mendoza	296
941	Parroquia Cruz Carrillo	296
942	Parroquia Matriz	296
943	Parroquia Monseñor Carrillo	296
944	Parroquia Tres Esquinas	296
945	Parroquia La Quebrada	297
946	Parroquia Cabimbú	297
947	Parroquia Jajó	297
948	Parroquia La Mesa	297
949	Parroquia Santiago	297
950	Parroquia Tuñame	297
951	Parroquia Juan Ignacio Montilla	298
952	Parroquia La Beatriz	298
953	Parroquia Mercedes Díaz	298
954	Parroquia San Luis	298
955	Parroquia La Puerta	298
956	Parroquia Mendoza	298
957	Parroquia Caraballeda	299
958	Parroquia Carayaca	299
959	Parroquia Caruao	299
960	Parroquia Catia La Mar	299
961	Parroquia El Junko	299
962	Parroquia La Guaira	299
963	Parroquia Macuto	299
964	Parroquia Maiquetía	299
965	Parroquia Naiguatá	299
966	Parroquia Urimare	299
967	Parroquia Carlos Soublette	299
968	Parroquia Capital Bruzual	302
969	Parroquia Campo Elías	302
970	Parroquia Capital Nirgua	308
971	Parroquia Salom	308
972	Parroquia Temerla	308
973	Parroquia Capital Peña	309
974	Parroquia San Andrés	309
975	Parroquia Capital San Felipe	310
976	Parroquia Albarico	310
977	Parroquia San Javier	310
978	Parroquia Capital Veroes	313
979	Parroquia El Guayabo	313
980	Parroquia Isla de Toas	314
981	Parroquia Monagas	314
982	Parroquia San Timoteo	315
983	Parroquia General Urdaneta	315
984	Parroquia Libertador	315
985	Parroquia Manuel Guanipa Matos	315
986	Parroquia Marcelino Briceño	315
987	Parroquia Pueblo Nuevo	315
988	Parroquia Ambrosio	316
989	Parroquia Carmen Herrera	316
990	Parroquia Germán Ríos Linares	316
991	Parroquia La Rosa	316
992	Parroquia Jorge Hernández	316
993	Parroquia Rómulo Betancourt	316
994	Parroquia San Benito	316
995	Parroquia Arístides Calvani	316
996	Parroquia Punta Gorda	316
997	Parroquia Encontrados	317
998	Parroquia Udón Pérez	317
999	Parroquia San Carlos del Zulia	318
1000	Parroquia Moralito	318
1001	Parroquia Santa Bárbara	318
1002	Parroquia Santa Cruz del Zulia	318
1003	Parroquia Urribarri	318
1004	Parroquia Simón Rodríguez	319
1005	Parroquia Carlos Quevedo	319
1006	Parroquia Francisco Javier Pulgar	319
1007	Parroquia La Concepción	320
1008	Parroquia José Ramón Yepes	320
1009	Parroquia Mariano Parra León	320
1010	Parroquia San José	320
1011	Parroquia Jesús María Semprún	321
1012	Parroquia Barí	321
1013	Parroquia Concepción	322
1014	Parroquia Andrés Bello	322
1015	Parroquia Chiquinquirá	322
1016	Parroquia El Carmelo	322
1017	Parroquia Potreritos	322
1018	Parroquia Alonso de Ojeda	323
1019	Parroquia Libertad	323
1020	Parroquia Campo Lara	323
1021	Parroquia Eleazar López Contreras	323
1022	Parroquia Venezuela	323
1023	Parroquia Libertad	324
1024	Parroquia Bartolomé de las Casas	324
1025	Parroquia Río Negro	324
1026	Parroquia San José de Perijá	324
1027	Parroquia San Rafael	325
1028	Parroquia La Sierrita	325
1029	Parroquia Las Parcelas	325
1030	Parroquia Luis de Vicente	325
1031	Parroquia Monseñor Marcos Sergio Godoy	325
1032	Parroquia Ricaurte	325
1033	Parroquia Tamare	325
1034	Parroquia Antonio Borjas Romero	326
1035	Parroquia Bolívar	326
1036	Parroquia Cacique Mara	326
1037	Parroquia Caracciolo Parra Pérez	326
1038	Parroquia Cecilio Acosta	326
1039	Parroquia Cristo de Aranza	326
1040	Parroquia Coquivacoa	326
1041	Parroquia Chiquinquirá	326
1042	Parroquia Francisco Eugenio Bustamante	326
1043	Parroquia Idelfonso Vásquez	326
1044	Parroquia Juana de Avila	326
1045	Parroquia Luis Hurtado Higuera	326
1046	Parroquia Manuel Dagnino	326
1047	Parroquia Olegario Villalobos	326
1048	Parroquia Raúl Leoni	326
1049	Parroquia Santa Lucía	326
1050	Parroquia Venancio Pulgar	326
1051	Parroquia San Isidro	326
1052	Parroquia Altagracia	327
1053	Parroquia Ana María Campos	327
1054	Parroquia Faría	327
1055	Parroquia San Antonio	327
1056	Parroquia San José	327
1057	Parroquia Sinamaica	328
1058	Parroquia Alta Guajira	328
1059	Parroquia Elías Sánchez Rubio	328
1060	Parroquia Guajira	328
1061	Parroquia El Rosario	329
1062	Parroquia Donaldo García	329
1063	Parroquia Sixto Zambrano	329
1064	Parroquia San Francisco	330
1065	Parroquia El Bajo/	330
1066	Parroquia Domitila Flores	330
1067	Parroquia Francisco Ochoa	330
1068	Parroquia Los Cortijos	330
1069	Parroquia Marcial Hernández	330
1070	Parroquia Jose Domingo Rus	330
1071	Parroquia Santa Rita	331
1072	Parroquia El Mene	331
1073	Parroquia José Cenovio Urribarri	331
1074	Parroquia Pedro Lucas Urribarri	331
1075	Parroquia Manuel Manrique	332
1076	Parroquia Rafael María Baralt	332
1077	Parroquia Rafael Urdaneta	332
1078	Parroquia Bobures	333
1079	Parroquia El Batey	333
1080	Parroquia Gibraltar	333
1081	Parroquia Heras	333
1082	Parroquia Monseñor Arturo Celestino Alvarez	333
1083	Parroquia Rómulo Gallegos	333
1084	Parroquia La Victoria	334
1085	Parroquia Rafael Urdaneta	334
1086	Parroquia Raúl Cuenca	334
1087	Parroquia Agua Blanca	222
\.


--
-- Name: parroquia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('parroquia_id_seq', 1087, true);


--
-- Data for Name: parte; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY parte (id, usuario_id, nombre, caracteristica, parte_categoria_id, observacion) FROM stdin;
\.


--
-- Data for Name: parte_categoria; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY parte_categoria (id, nombre, observacion) FROM stdin;
1	SISTEMA ELECTRICO	NINGUNA POR AHORA
\.


--
-- Name: parte_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('parte_categoria_id_seq', 1, true);


--
-- Name: parte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('parte_id_seq', 1, false);


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY perfil (id, usuario_id, fecha_registro, fecha_modificado, perfil, estado, plantilla) FROM stdin;
1	\N	2014-03-13 12:19:42.852111-04:30	2014-03-13 12:19:42.852111-04:30	Super User	1	default
5	\N	2014-07-31 14:53:36.84059-04:30	2014-07-31 14:53:36.84059-04:30	Coordinador	1	default
2	\N	2014-03-13 12:20:07.544255-04:30	2014-03-13 12:20:07.544255-04:30	administrador	1	default
3	\N	2014-03-13 12:20:07.544255-04:30	2014-03-13 12:20:07.544255-04:30	Especialista	1	default
7	\N	2014-07-31 14:54:34.249491-04:30	2014-07-31 14:54:34.249491-04:30	Titular	2	default
8	\N	2014-08-20 14:31:07.601335-04:30	2014-08-20 14:31:07.601335-04:30	Minimo	2	default
4	\N	2014-07-31 14:53:16.920671-04:30	2014-07-31 14:53:16.920671-04:30	Presidente	2	default
6	\N	2014-07-31 14:54:17.855932-04:30	2014-07-31 14:54:17.855932-04:30	Enlace	2	default
\.


--
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('perfil_id_seq', 8, true);


--
-- Data for Name: profesion; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY profesion (id, usuario_id, fecha_registro, fecha_modificado, nombre, observacion) FROM stdin;
1	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	SIN PROFESION	
2	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	EDUCACION BASICA	
3	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	BACHILLER EN CIENCIA	
4	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	BACHILLER EN HUMANIDADES	
5	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	BACHILLER INTEGRAL	
6	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO EN TELEFONIA	
7	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO QUIMICO	
8	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO AZUCARERO	
9	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO MERCANTIL	
10	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN COMERCIO	
11	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO AGROPECUARIO MENCION CIENCIAS AGRICOLAS	
12	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO INDUSTRIAL MENCION TEC.DE ALIMENTOS	
13	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MECANICA INDUSTRIAL	
14	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN RECURSOS HUMANOS	
15	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U.  ADMON INDUSTRIAL	
16	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ORGANIZACION EMPRESARIAL	
17	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN MERCADOTECNIA	
18	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN ORGANIZACION Y METODOS	
19	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN ELECTRICIDAD AGROINDUSTRIAL	
20	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN CONTADURIA PUBLICA	
21	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN BANCA Y FINANZAS	
22	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. INFORMATICA	
23	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN AGROTECNIA	
24	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. HIGIENE Y SEGURIDAD INDUSTRIAL	
25	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. RELACIONES INDUSTRIALES	
26	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EDUCACION INTEGRAL	
27	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN MANTENIMIENTO	
28	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. GERENCIA FINANCIERA	
29	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN TECNOLOGIA AGRICOLA	
30	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U.AGRONOMIA	
31	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. PUBLICIDAD	
32	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ADMON. RECURSOS FISICOS Y FINANCIEROS	
33	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ADMON DE PERSONAL	
34	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. CONTABILIDAD COMPUTARIZADA	
35	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. TRABAJO SOCIAL	
36	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. CONSTRUCCION CIVIL	
37	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. INFORMACION Y DOCUMENTACION	
38	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ADMINISTRACION TRIBUTARIA	
39	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. AGROINDUSTRIAL	
40	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. TECNOLOG. DE CONSERV. DE LOS RECURSOS NAT. RENOVABLES	
41	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. PUBLICIDAD Y MERCADEO	
42	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. PERIODISMO	
43	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN AUDIOVISUALES	
44	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN GESTION SOCIAL	
45	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ADMINISTRACION DE EMPRESAS	
46	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN ADMINISTRACION	
47	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN COMERCIO EXTERIOR	
48	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U TECNOLOGIA PECUARIA	
49	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN MANTENIMIENTO MECANICO	
50	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN TECNOLOGIA AGROPECUARIA	
51	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN ADMINISTRACION DE ADUANAS	
52	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN CANTABILIDAD	
53	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN LOGISTICA INDUSTRIAL	
54	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN DISEÃO GRAFICO	
55	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN TURISMO	
56	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. TECNOLOGIA AUTOMOTRIZ	
57	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. PLANIFICACION DE PROGRAMAS SOCIOCOMUNITARIOS	
58	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN PRODUCCION INDUSTRIAL	
59	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U.  EN ADMON DE EMPRESAS PETROLERAS	
60	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U.  EN ADMON DE FINCAS	
61	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN ADMON DE SISTEMAS CONTABLES	
62	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN EDUCACION	
63	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U.  EN ALIMENTO	
64	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ELECTRONICA INDUSTRIAL	
65	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN CIENCIAS AGROPECUARIAS	
66	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN CONTABILIDAD Y FINANZAS	
67	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN ADMINISTRACION Y GERENCIA	
68	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN GEODECIA	
69	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. CONTROL DE CALIDAD	
70	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN MECANICA AEREONAUTICA	
71	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. ELECTROMECANICA	
72	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN ZOOTECNIA	
73	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. TECNOLOGIA INSTRUMENTISTA	
74	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN PSICOPEDAGOGIA	
75	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN ADMON DE COSTOS	
76	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN PRODUCCION AGROALIMENTARIA	
77	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U.  EN DISEÃO DE OBRAS CIVILES	
78	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN MECANICA	
79	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. PRODUCCION AGROPECUARIA	
80	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN GESTION HOTELERA Y TURISTICA	
81	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN MANTENIMIENTO INDUSTRIAL	
82	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN RESGUARDO NACIONAL	
83	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN EDUCACION PREESCOLAR	
84	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. EN TECNO. NAVAL MENC. MECANICA Y MTTO NAVAL	
85	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LICENCIADO EN  PLANIFICACION	
86	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ADMINISTRACION	
87	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. AGROINDUSTRIAL	
88	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. CONTADOR PUBLICO	
89	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN CIENCIAS POLITICAS	
90	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN COMUNICACION SOCIAL MENCION DESARROLLO SOCIAL	
91	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ESTADISTICAS	
92	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LICDA. EN EFERMERIA	
93	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN INFORMATICA	
94	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LICENCIADO EN CIENCIAS Y ARTES MILITARES	
95	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN RELACIONES PUBLICAS	
96	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN PSICOLOGIA	
97	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ADMON. RELACIONES INDUSTRIALES	
98	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. GERENCIA AGROINDUSTRIAL	
99	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. SOCIOLOGIA DEL DESARROLLO	
100	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ESTUDIOS AMBIENTALES	
101	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN DISEÃO GRAFICO	
102	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN COMUNICACION SOCIAL	
103	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. COMERCIO INTERNACIONAL	
104	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN CIENCIAS FISCALES	
105	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN TRABAJO SOCIAL	
106	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN CIENCIAS POLITICAS Y ADMINISTRATIVAS	
107	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ADMON  MENCION RECURSOS HUMANOS	
108	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN COMUNICACION SOCIAL MENCION AUDIOVISUAL	
109	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ADMON. RECURSOS MATERIALES Y FINANCIERO	
110	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. ADM. MENCION MERCADEO	
111	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LICENCIADO EN TEOLOGIA	
112	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN EDUCACION	
113	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO ELECTRICISTA	
114	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO AGRONOMO	
115	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. CIVIL	
116	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. INFORMATICA	
117	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. AGROINDUSTRIAL	
118	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO EN ALIMENTOS	
119	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO INDUSTRIAL	
120	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO MECANICO	
121	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO QUIMICO	
122	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. PETROLEO	
123	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. PRODUCCION ANIMAL	
124	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. AGRICOLA	
125	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. EN SISTEMAS	
126	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. GEOGRAFO	
127	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. COMPUTACION	
128	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO EN MANTENIMIENTO MECANICO	
129	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ING. DE LA PRODUCION AGROPECUARIA	
130	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ABOGADO	
131	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ECOLOGISTA	
132	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ZOOTENISTA	
133	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	PRODUCTOR T.V.	
134	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	PERITO FORESTAL	
135	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	MEDICO VETERINARIO	
136	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	PSICOLOGO	
137	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ANALISTA DE SISTEMAS	
138	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	SOCIOLOGO	
139	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	POLITOLOGO	
140	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ARQUITECTO	
141	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN ESTUDIOS INTERNACIONALES	
142	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN ADMINISTRACION COMERCIAL	
143	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN INFORMATICA	
144	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU TECNOLOGIA DE ALIMENTOS	
145	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU ADMINISTRACION Y PLANIFICACION DE EMPRESAS AGROPECUARIAS	
146	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN PLANIFICACION REGIONAL	
147	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN CIENCIA Y CULTURA DE LA ALIMENTACIÃN	
148	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN PRODUCCION AGRICOLA	
149	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU PRODUCCION AGRO ALIMENTARIA	
150	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO SUPERIOR UNIVERSITARIO EN TEGNOLOGIA INSTRUMENTISTA	
151	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U. QUIMICA	
152	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	BACHILLER MERCANTIL	
153	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN FITOTECNIA	
154	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO PRODUCCIÃN AGROPECUARIO ZOOTERNISTA	
155	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU EN ELCTRICIDAD MENCION INSTALACIONES ELECTRICAS	
156	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U ADMON DE EMPRESAS	
157	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU PRODUCCION AGRO INDUSTRIAL	
158	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN ELECTRICIDAD	
159	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU PRODUCCION INDUSTRIAL	
160	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN TECNOLOGIA AGRICOLA	
161	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU EVALUCION AMBIENTAL	
162	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN CONTABILIDAD	
163	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN ELECTRICIDAD INDUSTRIAL	
164	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO SUPERIOR AGROINDUSTRIAL EN GRANOS Y SEMILLAS	
165	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU MANTENIMIENTO INDUSTRIAL	
166	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO MENCION ZOOTECNIA	
167	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TSU EN PETROLEO	
168	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN ADMON Y PLANIFICACION DE EMPRESAS AGROPECUARIAS	
169	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO TOPOGRAFICO	
170	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	ECONOMISTA	
171	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN METALURGIA - MENCION METALURGIA	
172	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U GESTION AMNBIENTAL	
173	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN TECNOLOGIA PECUARIA MENCION ZOOTECNIA	
174	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO EN ADMINISTRACION MENCION INFORMATICA	
175	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U EN ADMINISTRCION PENITENCIA	
176	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	EECNICO MEDIO EN AGROPECUARIA MENCION FITOTECNIA	
177	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LICENCIADO EN GESTION SOCIAL DEL DESARROLLO LOCAL	
178	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	PLANIFICACON DE PROGRAMAS SOCIOCOMUNITARIO	
179	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	T.S.U ADMINISTRACION MENCION CONTABILIDAD Y FINANZAS	
180	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	LIC. EN EDUCACION INTEGRAL	
181	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	TECNICO MEDIO MENCION FITOTECNIA	
182	\N	2014-04-03 10:40:37.528706-04:30	2014-04-03 10:40:37.528706-04:30	INGENIERO AGROINDUSTRIAL	
183	\N	2014-09-10 20:41:39.755341-04:30	2014-09-10 20:41:39.755341-04:30	EDUCacion basica	\N
185	\N	2014-09-10 20:43:19.518979-04:30	2014-09-10 20:43:19.518979-04:30	AA	\N
186	\N	2014-11-27 10:33:14.375998-04:30	2014-11-27 10:33:14.375998-04:30	lic. en gestión social del desarrollo local	\N
\.


--
-- Name: profesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('profesion_id_seq', 186, true);


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY proveedor (id, nombre, direccion, telefono, correo, observacion) FROM stdin;
1	Inagrinca c.a	zona industrial acargua 2	02556640000	inagrinca@gmail.com	repuestos tales como rodillos entre otros
\.


--
-- Name: proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('proveedor_id_seq', 1, true);


--
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY recurso (id, usuario_id, fecha_registro, fecha_modificado, modulo, controlador, accion, recurso, descripcion, activo) FROM stdin;
1	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	*	\N	\N	*	Comodín para la administración total (usar con cuidado)	1
2	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	dashboard	*	*	dashboard/*/*	Página principal del sistema	1
3	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	mi_cuenta	*	sistema/mi_cuenta/*	Gestión de la cuenta del usuario logueado	1
4	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	acceso	*	sistema/acceso/*	Submódulo para la gestión de ingresos al sistema	1
5	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	auditoria	*	sistema/auditoria/*	Submódulo para el control de las acciones de los usuarios	1
6	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	backup	*	sistema/backup/*	Submódulo para la gestión de las copias de seguridad	1
7	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	mantenimiento	*	sistema/mantenimiento/*	Submódulo para el mantenimiento de las tablas	1
8	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	menu	*	sistema/menu/*	Submódulo del sistema para la creación de menús	1
9	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	perfil	*	sistema/perfil/*	Submódulo del sistema para los perfiles de usuarios	1
10	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	privilegio	*	sistema/privilegio/*	Submódulo del sistema para asignar recursos a los perfiles	1
11	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	recurso	*	sistema/recurso/*	Submódulo del sistema para la gestión de los recursos	1
12	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	usuario	*	sistema/usuario/*	Submódulo para la administración de los usuarios del sistema	1
13	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	sucesos	*	sistema/suceso/*	Submódulo para el listado de los logs del sistema	1
14	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	sistema	configuracion	*	sistema/configuracion/*	Submódulo para la configuración de la aplicación (.ini)	1
15	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	config	empresa	*	config/empresa/*	Submódulo para la configuración de la información de la empresa	1
16	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	config	sucursal	*	config/sucursal/*	Submódulo para la administración de las sucursales	1
21	\N	2014-03-13 13:24:45.006859-04:30	2014-03-13 13:24:45.006859-04:30	config	departamento	*	config/departamento/*	Gestión de departamento	1
69	\N	2014-08-20 14:29:28.051792-04:30	2014-08-20 14:29:28.051792-04:30	sistema	usuario_clave	cambiar_clave	sistema/usuario_clave/cambiar_clave	Modulo para la gestion de cambio de clave	1
73	\N	2015-06-15 22:50:40.696229-04:30	2015-06-15 22:50:40.696229-04:30	config	fabricante	*	config/fabricante/*	Submódulo para la configuración de la información de los fabricantes	1
74	\N	2015-06-15 22:51:03.347968-04:30	2015-06-15 22:51:03.347968-04:30	config	modelo	*	config/modelo/*	Submódulo para la configuración de la información de los modelos	1
75	\N	2015-06-15 22:51:25.468183-04:30	2015-06-15 22:51:25.468183-04:30	config	marca	*	config/marca/*	Submódulo para la configuración de la información de las marcas	1
76	\N	2015-06-18 21:44:31.424366-04:30	2015-06-18 21:44:31.424366-04:30	config	sector	*	config/sector/*	Submódulo para la configuración de la información de los sectores	1
77	\N	2015-06-20 13:20:45.249168-04:30	2015-06-20 13:20:45.249168-04:30	config	proveedor	*	config/proveedor/*	sub-modulo para la gestion de proveedores	1
86	\N	2015-09-08 23:08:27.515572-04:30	2015-09-08 23:08:27.515572-04:30	config	parte_categoria	*	config/parte_categoria	Sub-modulo para la gestion de categorias de partes	1
87	\N	2015-09-08 23:09:03.858775-04:30	2015-09-08 23:09:03.858775-04:30	config	parte	*	config/parte	Sub-modulo para la gestion de categoria de parte	1
\.


--
-- Name: recurso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('recurso_id_seq', 87, true);


--
-- Data for Name: recurso_perfil; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY recurso_perfil (id, usuario_id, fecha_registro, fecha_modificado, recurso_id, perfil_id) FROM stdin;
1	\N	2014-03-13 14:07:07.669586-04:30	2014-03-13 14:07:07.669586-04:30	1	1
12	\N	2014-03-16 01:22:15.711586-04:30	2014-03-16 01:22:15.711586-04:30	2	2
185	\N	2014-03-16 15:55:00.358245-04:30	2014-03-16 15:55:00.358245-04:30	2	3
277	\N	2014-07-31 14:53:17.03958-04:30	2014-07-31 14:53:17.03958-04:30	2	4
278	\N	2014-07-31 14:53:36.88844-04:30	2014-07-31 14:53:36.88844-04:30	2	5
279	\N	2014-07-31 14:54:17.946247-04:30	2014-07-31 14:54:17.946247-04:30	2	6
280	\N	2014-07-31 14:54:34.283005-04:30	2014-07-31 14:54:34.283005-04:30	2	7
1080	\N	2015-06-02 16:03:19.173355-04:30	2015-06-02 16:03:19.173355-04:30	69	8
1083	\N	2015-06-02 16:03:19.173355-04:30	2015-06-02 16:03:19.173355-04:30	3	6
1085	\N	2015-06-02 16:03:19.173355-04:30	2015-06-02 16:03:19.173355-04:30	3	8
1086	\N	2015-06-02 16:03:19.173355-04:30	2015-06-02 16:03:19.173355-04:30	3	4
1087	\N	2015-06-02 16:03:19.173355-04:30	2015-06-02 16:03:19.173355-04:30	3	7
1092	\N	2015-06-04 15:24:37.969511-04:30	2015-06-04 15:24:37.969511-04:30	2	8
1144	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	1	2
1145	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	16	2
1146	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	16	5
1147	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	15	2
1148	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	15	5
1149	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	77	2
1150	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	76	2
1151	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	75	2
1152	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	74	2
1153	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	73	2
1154	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	21	2
1155	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	21	5
1156	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	13	2
1157	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	14	2
1158	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	11	2
1159	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	10	2
1160	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	9	2
1161	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	8	2
1162	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	7	2
1163	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	6	2
1164	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	5	2
1165	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	4	2
1166	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	12	2
1167	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	3	2
1168	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	3	5
1169	\N	2015-09-08 21:50:52.683887-04:30	2015-09-08 21:50:52.683887-04:30	3	3
\.


--
-- Name: recurso_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('recurso_perfil_id_seq', 1169, true);


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY sector (id, usuario_id, fecha_registro, fecha_modificado, sucursal_id, sector, observacion) FROM stdin;
1	1	2015-06-08 15:11:39.246904-04:30	2015-06-08 15:11:39.246904-04:30	1	Recepcion	prueba
\.


--
-- Name: sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('sector_id_seq', 1, false);


--
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY sucursal (id, usuario_id, fecha_registro, fecha_modificado, empresa_id, sucursal, sucursal_slug, pais_id, estado_id, municipio_id, parroquia_id, direccion, telefono, fax, celular) FROM stdin;
4	\N	2014-08-21 13:45:28.482313-04:30	2014-08-21 13:45:28.482313-04:30	1	UPSA PIRITU III	\N	240	69	224	717	CARRETERA NACIONAL VÍA TUREN A 300MTS DE LA ENTRADA DE PIRITU	\N	\N	\N
6	\N	2014-09-15 09:26:15.848906-04:30	2014-09-15 09:26:15.848906-04:30	1	BICEABASTO	\N	240	69	235	751	AV. BOLÍVAR ENTRE CALLE 3 Y 4	\N	\N	\N
7	\N	2014-09-15 09:31:12.631146-04:30	2014-09-15 09:31:12.631146-04:30	1	UPSA PIRITU II	\N	240	69	224	717	CARRETERA NACIONAL LA FLECHA VÍA PIRITU-TUREN FRENTE A LA TOMA	\N	\N	\N
5	\N	2014-09-15 09:17:53.329162-04:30	2014-09-15 09:17:53.329162-04:30	1	UPSA PAYARA	\N	240	69	229	733	CARRETERA PRINCIPAL VÍA LOS MAMONES FRENTE A LA FINCA SAN MARTINI	\N	\N	\N
1	\N	2014-03-13 12:13:18.140817-04:30	2014-03-13 12:13:18.140817-04:30	1	ACCION CENTRAL	\N	240	69	224	717	CARRETERA PRINCIPAL VIA TUREN	02563361333	\N	\N
3	\N	2014-07-14 19:59:43.615064-04:30	2014-07-14 19:59:43.615064-04:30	1	UPSA PIRITU I	\N	240	69	224	717	CARRETERA NACIONAL VIA TUREN DE AGROLEON	02555643215	\N	\N
8	\N	2014-11-17 14:41:36.332124-04:30	2014-11-17 14:41:36.332124-04:30	1	UPPSA CAñO SECO	\N	240	69	229	733	A	\N	\N	\N
9	\N	2014-11-17 14:42:25.569903-04:30	2014-11-17 14:42:25.569903-04:30	1	UPPSA SAN JOSE DEL CANDIL	\N	240	69	235	753	A	\N	\N	\N
10	\N	2014-11-27 10:37:51.32508-04:30	2014-11-27 10:37:51.32508-04:30	1	UPSA AGUA BLANCA	\N	240	69	222	1087	CARRETERA NAC VIA SAN CARLOS  KM 2 VIA ETA SECTOR SANTA ANA	02556142476	\N	\N
11	\N	2014-12-16 09:16:36.933371-04:30	2014-12-16 09:16:36.933371-04:30	1	UNIDAD DE MECANIZACION AGRICOLA	\N	240	69	229	733	CARRETERA PRINC VIA EL CRUCE CASERIO CAÑO SECO	02558083845	\N	\N
\.


--
-- Name: sucursal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('sucursal_id_seq', 11, true);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY usuario (id, usuario_id, fecha_registro, fecha_modificado, fecha_desactivacion, sucursal_id, login, perfil_id, email, tema, app_ajax, datagrid, estatus, intentos, nombres, apellidos) FROM stdin;
5	\N	2015-06-04 20:16:56.068599-04:30	2015-06-04 20:16:56.068599-04:30	\N	\N	INFOALEX	2	TUAALEXIS@GMAIL.COM	default	1	30	1	\N	ALEXIS	BORGES
6	\N	2015-06-04 20:22:00.520448-04:30	2015-06-04 20:22:00.520448-04:30	\N	\N	USER	2	USUERTUNNIG@GMAIL.COM	default	1	30	2	\N	USUARIO	TUNNING
1	1	2014-08-09 11:50:25.26152-04:30	2014-08-09 11:50:25.26152-04:30	\N	1	ADMIN	1	admin@admin.com	default	1	30	1	0	Administrador	\N
4	\N	2015-06-04 16:11:44.377753-04:30	2015-06-04 16:11:44.377753-04:30	\N	\N	RICHI	2	richardorta@gmail.com	default	1	30	1	\N	DORTA	dorta
7	\N	2015-07-10 11:01:17.376406-04:30	2015-07-10 11:01:17.376406-04:30	\N	\N	JUANA	5	PETROCHELI@GMAIL.COM	default	1	\N	1	\N	JUANA	PRETRONILA
8	\N	2015-07-10 12:50:12.499781-04:30	2015-07-10 12:50:12.499781-04:30	\N	\N	PRUEBA	2	\N	default	1	30	1	\N	PRUEBA2	PRUEBRA3
9	\N	2015-07-10 12:53:28.264245-04:30	2015-07-10 12:53:28.264245-04:30	\N	\N	RONDON	3	RONADON@GMAI.COM	default	1	\N	1	\N	ALEXANDER	RONDON
3	\N	2015-06-04 16:02:45.784156-04:30	2015-06-04 16:02:45.784156-04:30	\N	\N	ROAEDGAR	2	edgarroa@gmail.com	default	1	30	0	\N	edgar	roas
\.


--
-- Data for Name: usuario_clave; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY usuario_clave (id, usuario_id, fecha_registro, fecha_modificado, password, fecha_inicio, fecha_fin) FROM stdin;
3	3	2015-06-04 16:02:45.784156-04:30	2015-06-04 16:02:45.784156-04:30	d93a5def7511da3d0f2d171d9c344e91	2015-06-04	2016-06-05
4	4	2015-06-04 16:11:44.377753-04:30	2015-06-04 16:11:44.377753-04:30	d93a5def7511da3d0f2d171d9c344e91	2015-06-04	2016-06-05
5	5	2015-06-04 20:16:56.068599-04:30	2015-06-04 20:16:56.068599-04:30	d93a5def7511da3d0f2d171d9c344e91	2015-06-04	2016-06-05
6	6	2015-06-04 20:22:00.520448-04:30	2015-06-04 20:22:00.520448-04:30	d93a5def7511da3d0f2d171d9c344e91	2015-06-04	2016-06-05
1	1	2015-06-03 16:10:49.340776-04:30	2015-06-03 16:10:49.340776-04:30	d93a5def7511da3d0f2d171d9c344e91	2015-06-03	2016-06-04
7	7	2015-07-10 11:01:17.376406-04:30	2015-07-10 11:01:17.376406-04:30	6462e8c65ed86cd21fe9e79de19af430	2015-07-10	2015-07-11
8	8	2015-07-10 12:50:12.499781-04:30	2015-07-10 12:50:12.499781-04:30	308cb2652c13417832c3b6f684628ba8	2015-07-10	2015-07-11
9	9	2015-07-10 12:53:28.264245-04:30	2015-07-10 12:53:28.264245-04:30	a5ccfb4fa0929a050562fcbe8db19048	2015-07-10	2015-07-11
\.


--
-- Name: usuario_clave_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('usuario_clave_id_seq', 9, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('usuario_id_seq', 9, true);


--
-- Data for Name: usuario_pregunta; Type: TABLE DATA; Schema: public; Owner: arrozalba
--

COPY usuario_pregunta (id, usuario_id, fecha_registro, fecha_modificado, pregunta, respuesta) FROM stdin;
\.


--
-- Name: usuario_pregunta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arrozalba
--

SELECT pg_catalog.setval('usuario_pregunta_id_seq', 1, false);


--
-- Name: acceso_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (id);


--
-- Name: backup_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY backup
    ADD CONSTRAINT backup_pkey PRIMARY KEY (id);


--
-- Name: cargo_nombre_key; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_nombre_key UNIQUE (nombre);


--
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- Name: configuracion_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY configuracion
    ADD CONSTRAINT configuracion_pkey PRIMARY KEY (id);


--
-- Name: dartamento_unique_ukey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT dartamento_unique_ukey UNIQUE (nombre, sucursal_id);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- Name: empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- Name: equipo_parte_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT equipo_parte_pkey PRIMARY KEY (id);


--
-- Name: equipo_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT equipo_pkey PRIMARY KEY (id);


--
-- Name: estado_codigo_unico; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_codigo_unico UNIQUE (codigo);


--
-- Name: estado_nombre_unico; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_nombre_unico UNIQUE (nombre);


--
-- Name: estado_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- Name: estado_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY estado_usuario
    ADD CONSTRAINT estado_usuario_pkey PRIMARY KEY (id);


--
-- Name: fabricante_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY fabricante
    ADD CONSTRAINT fabricante_pkey PRIMARY KEY (id);


--
-- Name: falla_pk; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY falla
    ADD CONSTRAINT falla_pk PRIMARY KEY (id);


--
-- Name: incidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY incidencia
    ADD CONSTRAINT incidencias_pkey PRIMARY KEY (id);


--
-- Name: marca_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);


--
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);


--
-- Name: municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);


--
-- Name: nombre; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT nombre UNIQUE (nombre);


--
-- Name: pais_codigo_unico; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_codigo_unico UNIQUE (codigo);


--
-- Name: pais_nombre_unico; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_nombre_unico UNIQUE (nombre);


--
-- Name: pais_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- Name: parroquia_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY parroquia
    ADD CONSTRAINT parroquia_pkey PRIMARY KEY (id);


--
-- Name: parte_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY parte_categoria
    ADD CONSTRAINT parte_categoria_pkey PRIMARY KEY (id);


--
-- Name: parte_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY parte
    ADD CONSTRAINT parte_pkey PRIMARY KEY (id);


--
-- Name: perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- Name: profesion_nombre_key; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT profesion_nombre_key UNIQUE (nombre);


--
-- Name: profesion_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (id);


--
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id);


--
-- Name: recurso_perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY recurso_perfil
    ADD CONSTRAINT recurso_perfil_pkey PRIMARY KEY (id);


--
-- Name: recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT recurso_pkey PRIMARY KEY (id);


--
-- Name: sector_pk; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY sector
    ADD CONSTRAINT sector_pk PRIMARY KEY (id);


--
-- Name: sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);


--
-- Name: usuario_clave_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY usuario_clave
    ADD CONSTRAINT usuario_clave_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario_pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: arrozalba; Tablespace: 
--

ALTER TABLE ONLY usuario_pregunta
    ADD CONSTRAINT usuario_pregunta_pkey PRIMARY KEY (id);


--
-- Name: usuario_perfil_idx; Type: INDEX; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE INDEX usuario_perfil_idx ON usuario USING btree (perfil_id);


--
-- Name: usuario_sucursal_idx; Type: INDEX; Schema: public; Owner: arrozalba; Tablespace: 
--

CREATE INDEX usuario_sucursal_idx ON usuario USING btree (sucursal_id);


--
-- Name: acceso_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY acceso
    ADD CONSTRAINT acceso_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: backup_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY backup
    ADD CONSTRAINT backup_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: cargo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: configuracion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY configuracion
    ADD CONSTRAINT configuracion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: departamento_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_sucursal_fkey FOREIGN KEY (sucursal_id) REFERENCES sucursal(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: departamento_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: empresa_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: empresa_municipio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_municipio_id_fkey FOREIGN KEY (municipio_id) REFERENCES municipio(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: empresa_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES pais(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: empresa_parroquia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_parroquia_id_fkey FOREIGN KEY (parroquia_id) REFERENCES parroquia(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: equipo_fkid; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT equipo_fkid FOREIGN KEY (equipo_id) REFERENCES equipo(id) ON UPDATE CASCADE;


--
-- Name: estado_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES pais(id) ON DELETE SET NULL;


--
-- Name: estado_usuario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY estado_usuario
    ADD CONSTRAINT estado_usuario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: incidencia_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY incidencia
    ADD CONSTRAINT incidencia_departamento_fkey FOREIGN KEY (departamento_id) REFERENCES departamento(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: incidencia_equipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY incidencia
    ADD CONSTRAINT incidencia_equipo_fkey FOREIGN KEY (equipo_id) REFERENCES equipo(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: incidencia_falla_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY incidencia
    ADD CONSTRAINT incidencia_falla_fkey FOREIGN KEY (falla_id) REFERENCES falla(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: incidencia_sector_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY incidencia
    ADD CONSTRAINT incidencia_sector_fkey FOREIGN KEY (sector_id) REFERENCES sector(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: marca_fkid; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT marca_fkid FOREIGN KEY (marca_id) REFERENCES marca(id) ON UPDATE CASCADE;


--
-- Name: menu_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: menu_recurso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_recurso_id_fkey FOREIGN KEY (recurso_id) REFERENCES recurso(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: municipio_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT municipio_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES estado(id) ON DELETE SET NULL;


--
-- Name: parroquia_municipio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY parroquia
    ADD CONSTRAINT parroquia_municipio_id_fkey FOREIGN KEY (municipio_id) REFERENCES municipio(id) ON DELETE SET NULL;


--
-- Name: parte_categoria_fkid; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY parte
    ADD CONSTRAINT parte_categoria_fkid FOREIGN KEY (parte_categoria_id) REFERENCES parte_categoria(id) ON UPDATE CASCADE;


--
-- Name: parte_fkid; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY equipo_parte
    ADD CONSTRAINT parte_fkid FOREIGN KEY (parte_id) REFERENCES parte(id) ON UPDATE CASCADE;


--
-- Name: profesion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT profesion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: recurso_perfil_perfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY recurso_perfil
    ADD CONSTRAINT recurso_perfil_perfil_fkey FOREIGN KEY (perfil_id) REFERENCES perfil(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: recurso_perfil_recurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY recurso_perfil
    ADD CONSTRAINT recurso_perfil_recurso_fkey FOREIGN KEY (recurso_id) REFERENCES recurso(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sector_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sector
    ADD CONSTRAINT sector_sucursal_fkey FOREIGN KEY (sucursal_id) REFERENCES sucursal(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sucursal_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_empresa_fkey FOREIGN KEY (empresa_id) REFERENCES empresa(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sucursal_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES estado(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sucursal_municipio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_municipio_id_fkey FOREIGN KEY (municipio_id) REFERENCES municipio(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sucursal_pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES pais(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: sucursal_parroquia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT sucursal_parroquia_id_fkey FOREIGN KEY (parroquia_id) REFERENCES parroquia(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: usuario_clave_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY usuario_clave
    ADD CONSTRAINT usuario_clave_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: usuario_perfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_perfil_fkey FOREIGN KEY (perfil_id) REFERENCES perfil(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: usuario_pregunta_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY usuario_pregunta
    ADD CONSTRAINT usuario_pregunta_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: usuario_sucursal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: arrozalba
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_sucursal_fkey FOREIGN KEY (sucursal_id) REFERENCES sucursal(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

