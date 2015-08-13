<?php

class Statics extends CI_Controller
{
    private $data = array();
	public function __construct()
	{
		parent::__construct();
        $this->data['title'] = "Inicio";
		$this->data['footer'] = "Derechos reservados UFRO 2015 &copy; &Uacute;ltima actualizaci&oacute;n 23 dic 2014 16:32:23";
	}

	public function index()
	{
		$this->load->view('templates/header', $this->data);
        $this->load->view('statics/index');
        $this->load->view('templates/footer');
	}


	public function mostrar_formato_csv()
	{
		$this->output->set_content_type('.csv')->set_output(file_get_contents('files/formato.csv'));
	}

}


?>