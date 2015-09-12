<?php
/**
 * 
 * @category
 * @package     Models Incidencia
 * @subpackage
 * @author      
 * @copyright   Copyright (c) 2014 UPTP - (PNFI Team) (https://github.com/ArrozAlba/mantenimiento)
 *
 */
class Incidencia extends ActiveRecord {
    
    /**
     * Constante para definir el id de la oficina principal
     */
    const OFICINA_PRINCIPAL = 1;

    /**
     * Método para definir las relaciones y validaciones
     */
    protected function initialize() {
        $this->has_one('departamento');
        $this->has_one('falla');
        $this->has_one('equipo');
        $this->has_one('sector');
    }  
    /**
     * Método para ver 
     * @param int|string $id
     * @return 
     */
    public function getInformacionIncidencia($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'a.id, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.motivo_rechazo, a.observacion,b.id idmedico, b.nombre1 as nombrem, b.apellido1 as apellidom, c.cedula, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, f.nombre1 as nombreb, f.apellido1 as apellidob, f.id as idbeneficiario, g.id idtiposolicitud, g.nombre as tiposolicitud ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN medico as b ON (a.medico_id = b.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN beneficiario as f ON (a.beneficiario_id = f.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $condicion = "a.id = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 
    /**
     * Método para ver la información de un reporte
     * @param int|string $id
     * @return Sucursal
     */
    public function getReporteIncidencia($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas= 'a.id, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1, c.nombre2, c.apellido1, c.apellido2, c.nacionalidad, c.sexo, c.cedula,  c.telefono, c.id as idtitular, d.id idproveedor, d.razon_social as proveedor, d.direccion as direccionp, e.id as idservicio, e.descripcion as servicio, g.id idtiposolicitud, g.nombre as tiposolicitud, h.nombre1 as nombrem1, h.nombre2 as nombrem2, h.apellido1 as apellidom1, h.apellido2 as apellidom2';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN medico as h ON (a.medico_id = h.id) ';
        $condicion = "a.id = '$id' ";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
    } 
    /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoRegistroIncidencia($order='order.descripcion.asc', $page='',$tps, $empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud, h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "g.id = '$tps' and a.estado_solicitud = 'R' or a.estado_solicitud= 'E' ";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.descripcion ASC, incidencia.tipo_incidencia ASC',
                                                                              'DESC'=>'incidencia.descripcion DESC, incidencia.tipo_incidencia ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }
   /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoRegistroIncidenciaEscritorio($order='order.descripcion.asc', $page='', $empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud, h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario  ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "a.estado_solicitud = 'R' or a.estado_solicitud= 'E' ";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.descripcion ASC, incidencia.tipo_incidencia ASC',
                                                                              'DESC'=>'incidencia.descripcion DESC, incidencia.tipo_incidencia ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }
    
    /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoAprobacionIncidencia($order='order.descripcion.asc', $page='',$tps,$empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud, h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "g.id = '$tps' and (a.estado_solicitud = 'R' or a.estado_solicitud = 'A') ";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.descripcion ASC, incidencia.tipo_incidencia ASC',
                                                                              'DESC'=>'incidencia.descripcion DESC, incidencia.tipo_incidencia ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }
    /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoContabilizarIncidencia($order='order.descripcion.asc', $page='',$tps,$empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud, h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "g.id = '$tps' and a.estado_solicitud = 'A' or a.estado_solicitud = 'C' ";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.descripcion ASC, incidencia.tipo_incidencia ASC',
                                                                              'DESC'=>'incidencia.descripcion DESC, incidencia.tipo_incidencia ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }
    /*
    Metodo para listar las Solicitudes con los siniestros ya cargados 
    */
    public function getListadoSiniestrosIncidencia($order='order.descripcion.asc', $page='',$tps,$empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud,  h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "g.id = '$tps' and  (a.estado_solicitud = 'S' or a.estado_solicitud = 'G') ";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.descripcion ASC, incidencia.tipo_incidencia ASC',
                                                                              'DESC'=>'incidencia.descripcion DESC, incidencia.tipo_incidencia ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }
    /*
    Metodo para listar las Solicitudes con facturas cargadas (especialmente con los siniestros ya cargados 
    */
    public function getListadoFacturasIncidenciaReembolso($order='order.descripcion.asc', $page='',$tps,$empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud,  h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "g.id = '$tps' and  (a.estado_solicitud = 'F' or a.estado_solicitud = 'G') ";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.descripcion ASC, incidencia.tipo_incidencia ASC',
                                                                              'DESC'=>'incidencia.descripcion DESC, incidencia.tipo_incidencia ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }

    /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoIncidencia($order='order.descripcion.asc', $page='', $empresa=null) {
        $columnas = 'a.id as idincidencia, a.fecha, a.departamento_id, a.hora_inicio, a.hora_fin, a.turno, a.falla_id, a.equipo_id, a.sector_id, a.parada_sector, a.parada_planta, a.analisis_falla, a.accion_correctiva, a.fecha_reparacion, a.responsable_reparacion, a.perdida_tn, a.persistencia_falla, a.observaciones, c.id as iddepartamento, c.nombre, c.sucursal_id, d.id as idfalla, d.descripcion, e.id as idequipo, e.nombre, e.codigo, g.id as idsector, g.sector, h.id as idsucursal, h.sucursal  ';
        $join= 'as a INNER JOIN departamento as c ON (a.departamento_id = c.id) ';
        $join.= 'INNER JOIN falla as d ON (a.falla_id = d.id) ';
        $join.= 'INNER JOIN equipo as e ON (a.equipo_id = e.id) ';
        $join.= 'INNER JOIN sector as g ON (a.sector_id = g.id) ';
        $join.= 'INNER JOIN sucursal as h ON (c.sucursal_id = h.id) ';
        $conditions = "";
        $order = $this->get_order($order, 'a', array('incidencia'=>array('ASC'=>'incidencia.departamento ASC, incidencia.sector ASC',
                                                                              'DESC'=>'incidencia.departamento DESC, incidencia.sector ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "order: $order", "page: $page");            
        }
    }
    // REPORTE FILTRADO PARA EL REEMBOLSO 
    public function getListadoReembolsoPersona($fechai, $fechaf, $titular){
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, g.id as idtiposolicitud, g.nombre as tiposolicitud, h.nombre1 as nombreb, h.apellido1 as apellidob, h.id as idbeneficiario ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $join.= 'INNER JOIN beneficiario as h ON (a.beneficiario_id = h.id) ';
        $conditions = "a.tiposolicitud_id='8' and titular.cedula=$titular";
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "page: $page", "conditions: $conditions");
        } else {
            return $this->find("columns: $columnas", "join: $join", "page: $page", "conditions: $conditions");            
        }

    }
    //reporte de la dataq de historico 

     public function getListadoHReembolso($order='order.descripcion.asc', $page='', $empresa=null){
        if($page) {                
            return $this->paginated_by_sql("SELECT * FROM hreembolso order by $order ");
        } else {
            return $this->find_by_sq("SELECT * FROM hreembolso");            
        }
    }
    


    /**
     * Método para setear
     * @param string $method Método a ejecutar (create, update, save)
     * @param array $data Array con la data => Input::post('model')
     * @param array $otherData Array con datos adicionales
     * @return Obj
     */
    public static function setIncidencia($method, $data, $optData=null) {
        //Se aplica la autocarga
        $obj = new Incidencia($data);
        //Se verifica si contiene una data adicional para autocargar
        if ($optData) {
            $obj->dump_result_self($optData);
        }   
        $rs = $obj->$method();
        return ($rs) ? $obj : FALSE;
    }

    /**
     * Método que se ejecuta antes de guardar y/o modificar     
     */
    public function before_save(){        
    /* $actual = new DateTime("now");
     $vencimiento = new DateTime($this->fecha_vencimiento);
     if(($vencimiento<$actual)||($vencimiento=$actual)){
        DwMessage::error('La Fecha de vencimiento no puede menor o igual a la fecha actual ');
        return 'cancel';
     }*/
     $this->observacion = strtoupper($this->observacion);
    }
    
    /**
     * Callback que se ejecuta antes de eliminar
     */
    public function before_delete() {
      
    }
    //MIE3NTARAS
     public  function getInformacionIncidenciaPatologia($id, $order='incidencia_patologia.id') {
        $id = Filter::get($id, 'numeric');
        $columnas = 'incidencia_patologia.* , P.* , P.id as idpatologia ';
        $join= 'INNER JOIN incidencia_patologia ON (incidencia_patologia.incidencia_id = incidencia.id) ';
        $join.= 'INNER JOIN patologia as P ON (P.id = incidencia_patologia.patologia_id) ';
        
        $condicion = "incidencia_patologia.incidencia_id = '$id'"; 

        // return $this->find("columns: $columnas", "join: $join", "conditions: $condicion", "order: $order");
        return $this->find("columns: $columnas", "conditions: $condicion", "join: $join", "order: $order");
    } 
    
}
