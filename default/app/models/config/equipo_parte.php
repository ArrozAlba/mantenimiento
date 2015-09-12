<?php
class EquipoParte extends ActiveRecord {
    
    protected function initialize() {     
    }  
    /**
     * Método para ver la información de una sucursal
     * @param int|string $id
     * @return Sucursal
     */
    public function getInformacionEquipoConPartes($id) {
        $columnas = 'equipo_parte.cantidad, parte.nombre parte, parte.caracteristica, parte_categoria.nombre categoria '; 
        $join = ' INNER JOIN parte ON equipo_parte.parte_id = parte.id';
        $join .= ' INNER JOIN parte_categoria ON parte.parte_categoria_id = parte_categoria.id';
        $condicion ="equipo_parte.equipo_id = '$id'";
        return $this->find("columns: $columnas", "join: $join", "conditions: $condicion");
    } 
    
    /**
     * Método que devuelve las sucursales
     * @param string $order
     * @param int $page 
     * @return ActiveRecord
     */
    public function getListadoParte($order='order.nombre.asc', $page='') {
       $columns = 'parte.*';
       $order = $this->get_order($order, 'parte', array('parte'=>array('ASC'=>'parte.nombre ASC, parte.observacion ASC',
                                                                              'DESC'=>'parte.nombre DESC, parte.observacion ASC'),
                                                            'observacion'));
        if($page) {                
            return $this->paginated("columns: $columns", "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columns", "order: $order", "page: $page");            
        }
    }
    
    /**
     * Método para setear
     * @param string $method Método a ejecutar (create, update, save)
     * @param array $data Array con la data => Input::post('model')
     * @param array $otherData Array con datos adicionales
     * @return Obj
     */
    public static function setEquipoParte($method, $data, $optData=null) {
        //Se aplica la autocarga
        $obj = new EquipoParte($data);
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
    public function before_save() {
        
    }
     /**
     * Método para buscar sucursales
     */
    public function getAjaxPartes($field, $value, $order='', $page=0) {
        $value = Filter::get($value, 'string');
        if( strlen($value) < 1 OR ($value=='none') ) {
            return NULL;
        }
        $columns = 'parte.* ';
        $order = $this->get_order($order, 'nombre', array(                        
            'nombre' => array(
                'ASC'=>'parte.nombre ASC, parte.nombre ASC', 
                'DESC'=>'parte.nombre DESC, parte.nombre DESC'
            ),
            'observacion' => array(
                'ASC'=>'parte.observacion ASC, parte.observacion ASC', 
                'DESC'=>'parte.observacion DESC, parte.observacion DESC'
            ),
        ));
        
        //Defino los campos habilitados para la búsqueda
        $fields = array('nombre', 'observacion');
        if(!in_array($field, $fields)) {
            $field = 'nombre';
        }        
        //if(! ($field=='parroquia' && $value=='todas') ) {
          $conditions= " $field LIKE '%$value%'";
        //} 

        if($page) {
            return $this->paginated("columns: $columns", "conditions: $conditions",  "order: $order", "page: $page");
        } else {
            return $this->find("columns: $columns", "conditions: $conditions", "order: $order");
        }  
        //"conditions: $conditions",
    } 
   
    /**
     * Callback que se ejecuta antes de eliminar
     */
    public function before_delete() {
        if($this->id == 1) { //Para no eliminar la información de sucursal
            DwMessage::warning('Lo sentimos, pero esta sucursal no se puede eliminar.');
            return 'cancel';
        }
    }
    
}
