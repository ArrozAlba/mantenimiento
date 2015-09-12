<?php
/**
 * Descripcion: Controlador que se encarga de la gestión de las profesiones de la empresa
*/
 Load::models('equipo/equipo', 'config/equipo_parte');

class EquipoController extends BackendController {
   
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Equipos/Maquinarias';
    }
    /**
     * Método principal
     */
    public function index() {
        DwRedirect::toAction('index');
    }
    /**
     * Método para buscar
     */
    public function buscar($field='nombre1', $value='none', $order='order.id.asc', $page=1) {        
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $field = (Input::hasPost('field')) ? Input::post('field') : $field;
        $value = (Input::hasPost('field')) ? Input::post('value') : $value;
        $value = strtoupper($value);
        $equipo = new Hequipo();
        $equipos = $equipo->getAjaxReembolsos($field, $value, $order, $page);        
        if(empty($equipos->items)) {
            DwMessage::info('No se han encontrado registros');
        }
        $this->equipos = $equipos;
        $this->order = $order;
        $this->field = $field;
        $this->value = $value;
        $this->page_title = 'Búsqueda de Reemnbolsos del sistema';        
    }    


    /**
     * Método para listar
     */
    public function listar($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $equipo = new Equipo();        
        $this->equipos = $equipo->getListadoEquipo($order, $page);
        $this->order = $order;        
        $this->page_title = 'Listado de Equipos y Maquinarias';
    }
    /**
     * Método para registro
     */
    public function registro($order='order.titular.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $solicitud_equipo = new Hequipo();        
        $this->solicitud_equipos = $solicitud_equipo->getListadoHReembolso($order, $page);
        $this->order = $order;        
        $this->page_title = 'Registro de Solicitudes de Reembolso';
    }
    /**
     * Método para aprobacion
     */
    public function aprobacion($order='order.nombre.asc', $page='pag.1') { 
    		$page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        	$solicitud_equipo = new SolicitudServicio();        
        	$this->solicitud_equipos = $solicitud_equipo->getListadoAprobacionReembolso($order, $page);
        	$this->order = $order;        
        	$this->page_title = 'Aprobación de Solicitudes de Atención Primaria';
    }
    /**
     * Método para contabilizar
     */
    public function contabilizar($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $solicitud_equipo = new SolicitudServicio();        
        $this->solicitud_equipos = $solicitud_equipo->getListadoContabilizarSolicitudServicio($order, $page);
        $this->order = $order;        
        $this->page_title = 'Contabilizar Solicitudes de Atención Primaria';
    }
    /**
     * Método para agregar
     */
    public function agregar() {

        if(Input::hasPost('equipo')) {
            if(Equipo::setEquipo('create', Input::post('equipo'))) {
                DwMessage::valid('El Equipo se ha registrado correctamente!');
                return DwRedirect::toAction('listar');
            }            
        } 
        //cierre del condicional del Input(post)
        $this->page_title = 'Agregar Equipo Maquinaria';
    }//CIERRE DE la funcion agregar
        /**
     * Método para agregar
     */
    public function agregar_partes($key) {
        if(!$id = DwSecurity::isValidKey($key, 'piece_equipo', 'int')) {
            return DwRedirect::toAction('listar');
        } 
        $equipo = new Equipo();
        if(!$equipo->getInformacionEquipo($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }
        $equipo_parte = new EquipoParte();
        $maquinaria = $equipo_parte->getInformacionEquipoConPartes($id);

        $this->equipos=$equipo->getInformacionEquipo($id);
        $ids = DwSecurity::getKey($id, 'piece_equipo');
        if(Input::hasPost('equipo_parte')) {
            if(EquipoParte::setEquipoParte('create', Input::post('equipo_parte'))) {
                DwMessage::valid('La Parte se ha registrado correctamente!');
                return DwRedirect::toAction('agregar_partes/'.$ids);
            }            
        }
        $this->maquinarias = $maquinaria;
        //cierre del condicional del Input(post)
        $this->page_title = 'Agregar Partes de Maquinaria';
        
    }//CIERRE DE la funcion agregar
  
    /**
    *Metodo para aprobar las solicitudes (Cambiar de Estatus)
    */

    public function reversar_aprobacion($key){
    	if(!$id = DwSecurity::isValidKey($key, 'upd_solicitud_servicio', 'int')) {
            return DwRedirect::toAction('aprobacion');
        } 
        //Mejorar esta parte  implementando algodon de seguridad
        $solicitud_equipo = new SolicitudServicio();
        $sol = $solicitud_equipo->getInformacionSolicitudServicio($id);
        $sol->estado_solicitud="R";
        $sol->save();
        return DwRedirect::toAction('aprobacion');
    }
    /**
     * Método para formar el reporte en pdf 
     */
    public function reporte_equipo($id) { 
        View::template(NULL);       
       // if(!$id = DwSecurity::isValidKey($key, 'upd_solicitud_servicio', 'int')) {
       //     return DwRedirect::toAction('aprobacion');
       // }

        //Mejorar esta parte  implementando algodon de seguridad
        $solicitud_equipo = new SolicitudServicio();
                if(!$sol = $solicitud_equipo->getReporteSolicitudServicio($id)) {
            DwMessage::get('id_no_found');
        };
        $this->fecha_sol = $solicitud_equipo->fecha_solicitud;
        $this->nombres = strtoupper($solicitud_equipo->nombre1." ".$solicitud_equipo->nombre2);
        $this->apellidos = strtoupper($solicitud_equipo->apellido1." ".$solicitud_equipo->apellido2);
        $this->cedula = $solicitud_equipo->cedula;
        $this->telefono = $solicitud_equipo->telefono;
        $this->celular = $solicitud_equipo->celular;
        $this->nacionalidad = $solicitud_equipo->nacionalidad;        
        $this->sexo = $solicitud_equipo->sexo;  
        $this->idtitular = $solicitud_equipo->idtitular;
        $this->bene = $solicitud_equipo->beneficiario_id;
        $this->medico = strtoupper($solicitud_equipo->nombrem1." ".$solicitud_equipo->nombrem2." ".$solicitud_equipo->apellidom1." ".$solicitud_equipo->apellidom2);
        $this->clinica = strtoupper($solicitud_equipo->proveedor);
        $this->servicio = strtoupper($solicitud_equipo->servicio);
        $this->direccion = $solicitud_equipo->direccionp;

        //llamada a otra funcion, ya que no logre un solo query para ese reportee! :S
        $titular = new titular();
        $datoslaborales = $titular->getInformacionLaboralTitular($this->idtitular);
        $this->upsa = $titular->sucursal;
        $this->direccionlaboral = strtoupper($titular->direccion);
        $this->municipio_laboral = strtoupper($titular->municipios);
        $this->estado_laboral = strtoupper($titular->estados);
        $this->pais_laboral = strtoupper($titular->paiss);
        $this->cargo = strtoupper($titular->cargo);
        //instanciando la clase beneficiario 
        
        $beneficiarios = new beneficiario();
        $beneficiarios->getInformacionbeneficiario($this->bene);
        $this->nombresb = strtoupper($beneficiarios->nombre1." ".$beneficiarios->nombre2);
        $this->apellidosb = strtoupper($beneficiarios->apellido1." ".$beneficiarios->apellido2);
        $this->cedulab = $beneficiarios->cedula;
        $this->parentesco = $beneficiarios->parentesco;
    }
    /**
     * Método para editar
     */
    public function editar($key) {        
        if(!$id = DwSecurity::isValidKey($key, 'upd_solicitud_servicio', 'int')) {
            return DwRedirect::toAction('registro');
        }        
        
        $solicitud_equipo = new SolicitudServicio();
        if(!$solicitud_equipo->getInformacionSolicitudServicio($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('registro');
        }
        
        if(Input::hasPost('solicitud_equipo') && DwSecurity::isValidKey(Input::post('solicitud_servicio_id_key'), 'form_key')) {
            if(SolicitudServicio::setSolicitudServicio('update', Input::post('solicitud_equipo'), array('id'=>$id))){
                DwMessage::valid('La solicitud se ha actualizado correctamente!');
                return DwRedirect::toAction('contabilizar');
            }
        } 
        $this->solicitud_equipo = $solicitud_equipo;
        $this->page_title = 'Actualizar solicitud';        
    }
    
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'del_solicitud_servicio', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $solicitud_equipo = new SolicitudServicio();
        if(!$solicitud_equipo->getInformacionSolicitudServicio($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }                
        try {
            if(SolicitudServicio::setSolicitudServicio('delete', array('id'=>$solicitud_equipo->id))) {
                DwMessage::valid('La solicitud se ha eliminado correctamente!');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Esta solicitud no se puede eliminar porque se encuentra relacionada con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
}

