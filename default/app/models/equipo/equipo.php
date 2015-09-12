<?php
class Equipo extends ActiveRecord {
    /**
     * Método para definir las relaciones y validaciones
     */
    protected function initialize() {
    }  
    
    /**
     * Método para ver la información de una sucursal
     * @param int|string $id
     * @return Sucursal
     */
    public function getInformacionEquipo($id) {
        $columnas = 'equipo.id, equipo.codigo, equipo.nombre, equipo.activo_fijo, equipo.fecha_registro, equipo.fecha_compra';
        $condicion = "equipo.id = '$id'";
        return $this->find("columns: $columnas", "conditions: $condicion");
    } 
    
    /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoEquipo($order='order.descripcion.asc', $page='', $empresa=null) {
        $columns = 'equipo.*, fabricante.nombre fabricante, modelo.nombre modelo, marca.nombre marca , proveedor.nombre proveedor ';
        $join = ' INNER JOIN fabricante ON equipo.fabricante_id = fabricante.id ';        
        $join .= ' INNER JOIN proveedor ON equipo.proveedor_id = proveedor.id';        
        $join .= ' INNER JOIN modelo ON equipo.modelo_id = modelo.id';        
        $join .= ' INNER JOIN marca ON modelo.marca_id = marca.id';        
        $conditions = "";
        $order = $this->get_order($order, 'equipo', array('equipo'=>array('ASC'=>'equipo.descripcion ASC, equipo.tipo_equipo ASC',
                                                                              'DESC'=>'equipo.descripcion DESC, equipo.tipo_equipo ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columns", "order: $order", "join: $join","page: $page");
        } else {
            return $this->find("columns: $columns", "order: $order", "join: $join" ,"page: $page");            
        }
    }
    
    /**
     * Método para setear
     * @param string $method Método a ejecutar (create, update, save)
     * @param array $data Array con la data => Input::post('model')
     * @param array $otherData Array con datos adicionales
     * @return Obj
     */
    public static function setEquipo($method, $data, $optData=null) {
        //Se aplica la autocarga
        $obj = new Equipo($data);
        //Se verifica si contiene una data adicional para autocargar
        if ($optData) {
            $obj->dump_result_self($optData);
        }   
        $rs = $obj->$method();
        
        return ($rs) ? $obj : FALSE;
    }


     public function getListadoRegistroEquipo($order='order.descripcion.asc', $page='', $empresa=null) {
        $columnas = 'a.id as idsolicitudservicio, a.estado_solicitud, a.tiposolicitud_id, a.fecha_solicitud, a.codigo_solicitud, a.titular_id, a.beneficiario_id, a.patologia_id, a.proveedor_id, a.medico_id, a.servicio_id, a.fecha_vencimiento, a.observacion, c.celular, c.nombre1 as nombre, c.apellido1 as apellido, c.id as idtitular, d.id as idproveedor, d.nombre_corto as proveedor, e.id as idservicio, e.descripcion as servicio, f.id idpatologia, f.descripcion as patologia, g.id as idtiposolicitud, g.nombre as tiposolicitud ';
        $join= 'as a INNER JOIN titular as c ON (a.titular_id = c.id) ';
        $join.= 'INNER JOIN proveedor as d ON (a.proveedor_id = d.id) ';
        $join.= 'INNER JOIN servicio as e ON (a.servicio_id = e.id) ';
        $join.= 'INNER JOIN patologia as f ON (a.patologia_id = f.id) ';
        $join.= 'INNER JOIN tiposolicitud as g ON (a.tiposolicitud_id = g.id) ';
        $conditions = "a.estado_solicitud = 'R' ";
        $order = $this->get_order($order, 'a', array('solicitud_servicio'=>array('ASC'=>'solicitud_servicio.descripcion ASC, solicitud_servicio.tipo_solicitud_servicio ASC',
                                                                              'DESC'=>'solicitud_servicio.descripcion DESC, solicitud_servicio.tipo_solicitud_servicio ASC',
                                                                              )));
        if($page) {                
            return $this->paginated("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columnas", "join: $join", "conditions: $conditions", "order: $order", "page: $page");            
        }
    }
    /**
     * Método que se ejecuta antes de guardar y/o modificar     
     */
    public function before_save() {
        //formatenado todo a mayusculas
        $this->codigo = strtoupper($this->codigo);
        $this->fecha_registro = date("Y-m-d");
        $this->nombre = strtoupper($this->nombre);
        $this->observacion = strtoupper($this->observacion);
        $this->caracteristicas = strtoupper($this->caracteristicas);
        $this->funcionamiento = strtoupper($this->funcionamiento);
    }
    
    /**
     * Callback que se ejecuta antes de eliminar
     */
    public function before_delete() {

    }
    
}
