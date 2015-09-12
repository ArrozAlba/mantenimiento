<?php
/**
 * UPTP - (PNFI Sección 1236) 
 *
 * @category    
 * @package     Controllers 
 * @author      Alexis Borges (jel1284@gmail.com)
 * @copyright   Copyright (c) 2014 UPTP - (PNFI Team) (https://github.com/ArrozAlba/SASv2)
 */
Load::models('incidencias/incidencia','config/departamento', 'config/falla', 'equipo/equipo', 'config/sector');

class IncidenciaController extends BackendController {
    /**
     * Constante para definir el tipo de solicitud
     */
    const TPS = 1;    
    /**
     * Método que se ejecuta antes de cualquier acción
     */
    protected function before_filter() {
        //Se cambia el nombre del módulo actual
        $this->page_module = 'Incidencias';
    }
    
    /**
     * Método principal
     */
    public function index() {
        DwRedirect::toAction('registro');
    }
    
    /**
     * Método para listar
     */
    public function listar($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $incidencia = new Incidencia();        
        $this->incidencias = $incidencia->getListadoIncidencia($order, $page);
        $this->order = $order;        
        $this->page_title = 'Listado de Incidencias';
    }
    /**
     * Método para registro
     */
    public function registro($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $incidencias = new Incidencias();        
        $this->incidenciass = $incidencias->getListadoRegistroIncidencias($order, $page,$tps=self::TPS);
        $this->order = $order;        
        $this->page_title = 'Registro de Solicitudes de Atención Primaria';
    }
    /**
     * Método para aprobacion
     */
    public function aprobacion($order='order.nombre.asc', $page='pag.1') { 
            $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
            $incidencias = new Incidencias();        
            $this->incidenciass = $incidencias->getListadoAprobacionIncidencias($order, $page,$tps=self::TPS);
            $this->order = $order;        
            $this->page_title = 'Aprobación de Solicitudes de Atención Primaria';
    }
    /**
     * Método para cargar las solicitudes siniestradas para mandar a facturar
     */
    public function facturacion($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $incidencias = new Incidencias();        
        $this->incidenciass = $incidencias->getListadoSiniestrosIncidencias($order, $page,$tps=self::TPS);
        $this->order = $order;        
        $this->page_title = 'Cargar Facturas a las solicitudes de Atención Primaria';
    }

     /**
     * Método para 
     */
    public function aprobadas($order='order.nombre.asc', $page='pag.1') { 
        $page = (Filter::get($page, 'page') > 0) ? Filter::get($page, 'page') : 1;
        $incidencias = new Incidencias();        
        $this->incidenciass = $incidencias->getListadoContabilizarIncidencias($order, $page,$tps=self::TPS);
        $this->order = $order;        
        $this->page_title = 'Contabilizar Solicitudes de Atención Primaria';
    }
     /**
     * Método para cargar los siniestros
     */
    public function siniestro($key) { 
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('registro');
        }        
        $incidencias = new Incidencias();
        $incidencias_patologia = new IncidenciasPatologia();
        if(!$incidencias->getInformacionIncidencias($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('registro');
        }
        if(Input::hasPost('incidencias')) {
            ActiveRecord::beginTrans();
            if(IncidenciasPatologia::setSolServicioPatolgia(Input::post('patologia_id'), $id)) {
                $sol = $incidencias->getInformacionIncidencias($id);
                //Input::post('diagnostico') cambie el nombre del campo para poder tomar el valor revisar en el view 
                $sol->diagnostico = strtoupper(Input::post('diagnostico'));
                $sol->motivo = strtoupper(Input::post('motivo'));
                $sol->estado_solicitud="S";
                $sol->save();               
                ActiveRecord::commitTrans();    
                DwMessage::valid('La solicitud se ha contabilizado correctamente!');
                 return DwRedirect::toAction('facturacion');
            }else{
                ActiveRecord::rollbackTrans();
                DwMessage::error('La solicitud ha dao peos!');
                return DwRedirect::toAction('aprobadas');
            }
        } 
        $this->incidencias = $incidencias;
        $this->page_title = 'Cargar Siniestro';        
    }
    /**
    * Método para cargar las facturas
    */
    public function facturar($key){
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('registro');
        }
        $incidencias = new Incidencias();
        $obj = new IncidenciasPatologia();
        //$factura = new Factura();
        $factura_dt = new FacturaDt();
        $this->sol =  $obj->getInformacionIncidenciasPatologia($id);
        if(!$incidencias->getInformacionIncidencias($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('registro');
        }
        if(Input::hasPost('factura')) {
            ActiveRecord::beginTrans();
            $factu = Factura::setFactura('create', Input::post('factura'));
            if($factu){
                if(FacturaDt::setFacturaDt(Input::post('descripcion'), Input::post('cantidad'), Input::post('monto'), Input::post('exento'), $factu->id)) {
                    $solfactura = IncidenciasFactura::setIncidenciasFactura($factu->id, $id);
                    if($solfactura){
                        if(Input::post('multifactura')){ //para saber si va a cargar multiples facturas sobre esa solicitud 
                            $solser = $incidencias->getInformacionIncidencias($id);
                            $solser->estado_solicitud="G"; //estado G parcialmente facturada 
                            $solser->save();
                            ActiveRecord::commitTrans();
                            DwMessage::valid('Se ha cargado la factura exitosamente!');
                            $key_upd = DwSecurity::getKey($id, 'upd_incidencias'); 
                            return DwRedirect::toAction('facturar/'.$key_upd);   //retorna a la misma visata de facturacion 
                        }
                        else{
                            $solser = $incidencias->getInformacionIncidencias($id);
                            $solser->estado_solicitud="F";
                            $solser->save();
                            ActiveRecord::commitTrans();
                            DwMessage::valid('Se ha cargado la factura exitosamente!');
                          return DwRedirect::toAction('facturacion');     
                        }

                    }
                    else{
                        ActiveRecord::rollbackTrans();
                        DwMessage::error('No se pudo enviar a cargar multiples facturas!');
                    }

                }
                else{
                    ActiveRecord::rollbackTrans();
                    DwMessage::error('Los detalles de la Factura no se han cargado correctamente Intente de nuevo!');
                }
            }
            else{
                ActiveRecord::rollbackTrans();
                DwMessage::error('La Factura no se ha cargado con exito!');
            }
        }
        $this->incidencias = $incidencias;
        $this->page_title = 'Cargar Facturas a la solicitud';        
    }

    /**
     * Método para agregar
     */
    public function agregar() {
        $empresa = Session::get('empresa', 'config');
        $incidencias = new Incidencia();
        if(Input::hasPost('incidencias')) {
            if(Incidencias::setIncidencia('create', Input::post('incidencias'))) {
                DwMessage::valid('La solicitud se ha registrado correctamente!');
                return DwRedirect::toAction('registro');
            }            
        } 
       // $this->personas = Load::model('beneficiarios/titular')->getTitularesToJson();
        $this->page_title = 'Agregar Incidencia';
    }

    /**
    *Metodo para aprobar las solicitudes (Cambiar de Estatus)
    */

    public function aprobar($key){
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('aprobacion');
        }
        //Mejorar esta parte  implementando algodon de seguridad
    
        $incidencias = new Incidencias();
        $sol = $incidencias->getInformacionIncidencias($id);
        $sol->estado_solicitud="A";
        $sol->save();
        $cod = $sol->codigo_solicitud;
        $nro = $sol->celular;
        $nombre = $sol->nombre;
        $apellido = $sol->apellido;
        $contenido= "Sr. ".$nombre." ".$apellido." Su solicitud ha sido aprobada Aprobada con el codigo: ".$cod;
        $destinatario=$nro;
        system( '/usr/bin/gammu -c /etc/gammu-smsdrc --sendsms EMS ' . escapeshellarg( $destinatario ) . ' -text ' . escapeshellarg( $contenido ) ); 
        return DwRedirect::toAction('reporte_aprobacion/'.$id);
    }

    /** Metodo para rechazar con motivo una solicitud **/
    public function rechazar($key) {        
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('aprobacion');
        }
        $incidencias = new Incidencias();
        $sol = $incidencias->getInformacionIncidencias($id);
        if(!$sol) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('registro');
        }
        if(Input::hasPost('incidencias')) {
            $es = "E";
            //$motivo = $_POST['incidencias'];
            if(Incidencias::setIncidencias('update', Input::post('incidencias'), array('estado_solicitud'=>$es))){
                DwMessage::valid('La solicitud se ha rechazado correctamente!');
                return DwRedirect::toAction('registro');
            }       
        } 
        $this->incidencias = $sol;
        $this->page_title = 'Rechazar solicitud';        
    }
    /**
    *Metodo para aprobar las solicitudes (Cambiar de Estatus)
    */

    public function reversar_aprobacion($key){
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('aprobacion');
        } 
        //Mejorar esta parte  implementando algodon de seguridad
        $incidencias = new Incidencias();
        $sol = $incidencias->getInformacionIncidencias($id);
        $sol->estado_solicitud="R";
        $sol->save();
        return DwRedirect::toAction('aprobacion');
    }
    /**
     * Método para formar el reporte en pdf 
     */
    public function reporte_aprobacion($id) { 
        View::template(NULL);       
       // if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
       //     return DwRedirect::toAction('aprobacion');
       // }

        //Mejorar esta parte  implementando algodon de seguridad
        $incidencias = new Incidencias();
                if(!$sol = $incidencias->getReporteIncidencias($id)) {
            DwMessage::get('id_no_found');
        };
        $this->fecha_sol = $incidencias->fecha_solicitud;
        $this->nombres = strtoupper($incidencias->nombre1." ".$incidencias->nombre2);
        $this->apellidos = strtoupper($incidencias->apellido1." ".$incidencias->apellido2);
        $this->cedula = $incidencias->cedula;
        $this->telefono = $incidencias->telefono;
        $this->celular = $incidencias->celular;
        $this->nacionalidad = $incidencias->nacionalidad;        
        $this->sexo = $incidencias->sexo;  
        $this->idtitular = $incidencias->idtitular;
        $this->bene = $incidencias->beneficiario_id;
        $this->medico = strtoupper($incidencias->nombrem1." ".$incidencias->nombrem2." ".$incidencias->apellidom1." ".$incidencias->apellidom2);
        $this->clinica = strtoupper($incidencias->proveedor);
        $this->servicio = strtoupper($incidencias->servicio);
        $this->direccion = $incidencias->direccionp;

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
    /*
     Método para editar solicitudes que estan registradas solamente (ya que el metodo de modificar es para afectar aquellas que fueron rechazads 
     y se van a actualizar)
     */
    public function editar($key) {        
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('registro');
        }        
        
        $incidencias = new Incidencias();
        if(!$incidencias->getInformacionIncidencias($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('registro');
        }
        
        if(Input::hasPost('incidencias') && DwSecurity::isValidKey(Input::post('incidencias_id_key'), 'form_key')) {
            if(Incidencias::setIncidencias('update', Input::post('incidencias'), array('id'=>$id))){
                DwMessage::valid('La solicitud se ha actualizado correctamente!');
                return DwRedirect::toAction('registro');
            }
        } 
        $this->incidencias = $incidencias;
        $this->page_title = 'Actualizar solicitud';        
    }
    /*
        Metodo para modificar las solicitudes de modificacion
    */
    public function modificar($key) {        
        if(!$id = DwSecurity::isValidKey($key, 'upd_incidencias', 'int')) {
            return DwRedirect::toAction('registro');
        }        
        
        $incidencias = new Incidencias();
        if(!$incidencias->getInformacionIncidencias($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('registro');
        }
        
        if(Input::hasPost('incidencias') && DwSecurity::isValidKey(Input::post('incidencias_id_key'), 'form_key')) {
            if(Incidencias::setIncidencias('update', Input::post('incidencias'), array('id'=>$id))){
                DwMessage::valid('La solicitud se ha actualizado correctamente!');
                return DwRedirect::toAction('registro');
            }
        } 
        $this->incidencias = $incidencias;
        $this->page_title = 'Actualizar solicitud';        
    }
    
    /**
     * Método para eliminar
     */
    public function eliminar($key) {         
        if(!$id = DwSecurity::isValidKey($key, 'del_incidencias', 'int')) {
            return DwRedirect::toAction('listar');
        }        
        
        $incidencias = new Incidencias();
        if(!$incidencias->getInformacionIncidencias($id)) {            
            DwMessage::get('id_no_found');
            return DwRedirect::toAction('listar');
        }                
        try {
            if(Incidencias::setIncidencias('delete', array('id'=>$incidencias->id))) {
                DwMessage::valid('La solicitud se ha eliminado correctamente!');
            }
        } catch(KumbiaException $e) {
            DwMessage::error('Esta solicitud no se puede eliminar porque se encuentra relacionada con otro registro.');
        }
        
        return DwRedirect::toAction('listar');
    }
}
