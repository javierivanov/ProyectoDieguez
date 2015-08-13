<?php

class User extends CI_Controller
{
	private $user_id = -1;
	private $login_url = 'c=user&m=login';
	private $data = array();
	public function __construct()
	{
		parent::__construct();
		$this->load->model('modelo');
		$this->load->helper(array('form', 'url'));
		$this->load->library(array('session','form_validation'));
		$this->data['title'] = 'Usuario';
		$this->data['footer'] = "Derechos reservados UFRO 2015 &copy;";
		$m = $this->input->get('m');
		$noLogin = array('do_login', 'login', 'get_status');
		if (!in_array($m, $noLogin))
		{
			$this->require_login();
		}
	}

	public function require_login($json = FALSE)
	{
		if ($this->session->userdata('user_online') == 1)
		{
			$userid = $this->session->userdata('user_id');
			if ($this->modelo->check_usuario_by_id($userid))
			{
				$this->user_id = $userid;
				$this->data['user'] = $this->modelo->get_usuario($userid)['nombre'];
				return TRUE;
			}
		}
		if ($json == FALSE)
		{
			redirect($this->login_url, 'refresh');
		}
		return FALSE;
	}

	public function login()
	{
		if ($this->input->get('m') == 'login' and $this->require_login(TRUE))
		{
			$this->index();
		}
		else
		{
			$this->data['title'] = 'Login de usuario';
			$this->load->view('user/header', $this->data);
			$this->load->view('user/login', $this->data);
			$this->load->view('user/footer', $this->data);
		}
	}


	public function do_login()
	{
		$this->form_validation->set_rules('user', 'user', 'required');
		$this->form_validation->set_rules('passwd', 'passwd', 'required');
		if ($this->form_validation->run() == FALSE)
		{
			$this->data['error'] = TRUE;
			$this->data['mensaje'] = '<strong>Error:</strong> Debe llenar el formulario';
		}
		$respond = $this->modelo->check_usuario($this->input->post('user'), $this->input->post('passwd'));
		if ($respond != FALSE)
		{
			$this->session->set_userdata('user_online', 1);
			$this->session->set_userdata('user_id', $respond);
			$this->user_id = $respond;
			$this->data['user'] = $this->modelo->get_usuario($respond)['nombre'];
			$this->data['exito'] = TRUE;
			$this->data['mensaje'] = 'Usuario conectado';
			$this->data['js_files'] = array('dist/js/local/principal.js');
			$this->data['title'] = 'Principal';
			$this->modelo->add_login($respond);
			$this->load->view('user/header', $this->data);
			$this->load->view('user/principal', $this->data);
			$this->load->view('user/footer', $this->data);
		}
		else
		{
			if (@$this->data['error'] != TRUE)
			{
				$this->data['error'] = TRUE;
				$this->data['mensaje'] = '<strong>Error:</strong> Usuario y/o password no coinciden';
			}
			$this->data['title'] = 'Login de usuario';
			$this->data['js_files'] = array('dist/js/local/login-error.js');
			$this->load->view('user/header', $this->data);
			$this->load->view('user/login', $this->data);
			$this->load->view('user/footer', $this->data);
		}
	}

	public function index()
	{
		$this->data['title'] = 'Principal';
		$this->load->view('user/header', $this->data);
		$this->load->view('user/principal', $this->data);
		$this->load->view('user/footer', $this->data);	
	}

	public function cuestionarios()
	{
		$this->data['title'] = 'Cuestionarios';

		$cuestionarios = array();

		$list = $this->modelo->list_cuestionarios();

		foreach ($list as $l) {
			array_push($cuestionarios, array('id' => $l['id'],
			 'cuestionario' => $l['nombre'],
			  'porcentaje' => $this->modelo->get_cuantas_preguntas_faltan_porcentaje($l['id']),
			  'fecha' => $l['fecha'])

			);
		}
		$this->data['cuestionarios'] = $cuestionarios;

		$this->load->view('user/header', $this->data);
		$this->load->view('user/cuestionarios', $this->data);
		$this->load->view('user/footer', $this->data);	
	}

	public function respuestas()
	{
		$this->data['title'] = 'Responder cuestionario';
		$this->data['cid'] = $this->input->get('cid');
		$this->data['js_files'] = array('dist/js/local/respuestas.js');
		$this->load->view('user/header', $this->data);
		if ($this->modelo->exists_cuestionario($this->data['cid']) == FALSE)
		{
			$this->load->view('user/principal', $this->data);
		}
		else
		{
			$this->load->view('user/respuestas', $this->data);
		}
		$this->load->view('user/footer', $this->data);
	}

	public function get_pregunta()
	{
		$cid = $this->input->get('cid');
		if ($this->modelo->exists_cuestionario($cid) === FALSE)
		{
			refresh('index.php', 'refresh');
		}
		$users = $this->modelo->list_usuarios_en_organizacion($this->session->userdata('user_id'));
		$r = $this->modelo->get_pregunta_cuestionario($users,$cid);
		if ($r === FALSE)
		{
			$this->output->set_content_type('application/json')->set_output(json_encode(array('fin' => 1)));
		}
		else
		{
			$categoria =$this->modelo->get_categoria($r['caid']);
			$sub_categoria =$this->modelo->get_sub_categoria($r['scid']);
			$json = array('pregunta' =>  trim(html_entity_decode($r['pregunta']),"\'"),
				'categoria' => trim(html_entity_decode($categoria['categoria']),"\'"),
				'sub_categoria' => trim(html_entity_decode($sub_categoria['sub_categoria']),"\'"),
				'codigo' => $r['codigo'],
				'porcentaje' => $this->modelo->get_cuantas_preguntas_faltan_porcentaje($cid),
				'fin' => 0);
			$this->output->set_content_type('application/json')->set_output(json_encode($json));
		}
	}

	public function get_status()
	{
		$json = array('status' => FALSE);
		if ($this->require_login(TRUE))
		{
			$json['status'] = TRUE;
		}
		$this->output->set_content_type('application/json')->set_output(json_encode($json));
	}


	public function responder_pregunta()
	{
		$cid = $this->input->get('cid');
		$user = $this->session->userdata('user_id');
		$resp = $this->input->get('resp');
		$this->modelo->responder_pregunta($user, $cid, $resp);
	}

	public function logout()
	{
		$this->session->unset_userdata('user_online');
		$this->session->unset_userdata('user_id');
		unset($this->data['user']);
		$this->data['info'] = TRUE;
		$this->data['mensaje_info'] = 'Usuario desconectado';
		$this->data['js_files'] = array('dist/js/local/logout.js');
		$this->login();
	}


}

?>