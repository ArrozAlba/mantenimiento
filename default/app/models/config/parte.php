<?php
class Parte extends ActiveRecord {
    protected function initialize() {     
    }  
    /**
     * Método para obtener fabricantes
     * @return obj
     */
   public function obtener_partes($partes) {
        if ($partes != '') {
            $partes = stripcslashes($partes);
            $partes = strtoupper($partes);
            $res = $this->find('columns: nombre, caracteristica, id', "nombre like '%{$partes}%' or caracteristica like '%{$partes}%'");
            if ($res) {
                foreach ($res as $partes) {
                    $partess[] = array('id'=>$partes->id,'value'=>$partes->nombre." ".$partes->caracteristica,'caracteristica'=>$partes->caracteristica);
                }
                return $partess;
            }
        }
        return array('no hubo coincidencias');
    }
    /**
     * Método para ver la información de una sucursal
     * @param int|string $id
     * @return Sucursal
     */
    public function getInformacionParte($id, $isSlug=false) {
        $id = ($isSlug) ? Filter::get($id, 'string') : Filter::get($id, 'numeric');
        $columnas = 'fabricante.*';
        $join = '';
        $condicion ="fabricante.id = '$id'";
        return $this->find_first("columns: $columnas", "join: $join", "conditions: $condicion");
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
    public static function setParte($method, $data, $optData=null) {
        //Se aplica la autocarga
        $obj = new Parte($data);
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
        $this->nombre = strtoupper($this->nombre);
        $this->caracteristica = strtoupper($this->caracteristica);
        $this->nombre = Filter::get($this->nombre, 'string');
        $this->caracteristica = Filter::get($this->caracteristica, 'string');
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
