<?php



class Admin extends CI_Controller
{
	private $data = array();
	public function __construct()
	{
		parent::__construct();
		$this->load->model('modelo');

		$this->load->helper(array('form', 'url'));
		
		$this->load->library('session');
		$this->load->library('form_validation');


		if ($this->session->userdata('user_id') != 100)
		{
			if ($this->input->get('m') != 'login' && $this->input->get('m') != 'do_login')
			{
				redirect('c=admin&m=login', 'refresh');
			}
		}
		$this->data['title'] = 'Default';
		$this->data['project_name'] = "<span class=\"glyphicon glyphicon-list\" aria-hidden=\"true\"></span> Sistema X";
	}

	public function login()
	{
		$this->load->view('admin/login');
	}

	public function do_login()
	{
		if($this->input->post('user') == 'admin' and $this->input->post('passwd') == 'admin')
		{
			$this->session->set_userdata('user_id', 100);
			$this->modelo->add_login(-1);
			$this->index();
		}
		else
		{
			redirect('c=admin&m=login', 'refresh');
		}
	}

	public function index()
	{
		$this->data['title'] = 'Inicio';
		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/principal');
		$this->load->view('admin/footer');
	}


	public function organizaciones()
	{
		$this->data['title'] = 'Organizaciones';
		$this->data['organizaciones'] = $this->modelo->list_organizaciones();
		$this->data['usuarios'] = $this->modelo->list_usuarios();
		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/organizaciones', $this->data);
		$this->load->view('admin/footer');
	}

	public function delete_organizacion()
	{
		$oid = $this->input->get('oid');
		$this->modelo->delete_organizacion($oid);

		$this->data['info'] = TRUE;
		$this->data['mensaje_info'] = "<b>&Eacute;xito</b>: organizaci&oacute;n eliminada.";
		$this->organizaciones();
	}


	public function add_organizacion()
	{
		$this->form_validation->set_rules('nombre', 'nombre', 'required');
		$this->form_validation->set_rules('mail', 'mail', 'required');
		$ok=FALSE;
		if ($this->form_validation->run() == TRUE)
		{
			$this->modelo->add_organizacion(htmlentities($this->input->post('nombre')), $this->input->post('mail'));
			$ok = TRUE;
		}

		if (!$ok)
		{
			$this->data['error'] = TRUE;
			$this->data['mensaje'] = "<b>Error</b>: debe llenar el formulario.";
		}
		else
		{
			$this->data['exito'] = TRUE;
			$this->data['mensaje'] = "<b>&Eacute;xito</b>: organizaci&oacute;n agregada.";
		}

		$this->organizaciones();
	}

	public function usuarios()
	{
		$uid = $this->input->get('uid');
		$this->data['title'] = 'Usuario';
		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/usuarios', $this->data);
		$this->load->view('admin/footer', $this->data);	
	}

	public function add_usuario()
	{
		$this->form_validation->set_rules('oid','oid','required');
		$this->form_validation->set_rules('user','user','required');
		$this->form_validation->set_rules('passwd','passwd','required');
		$this->form_validation->set_rules('repasswd','repasswd','required');
		$this->form_validation->set_rules('nombre','nombre','required');
		$this->form_validation->set_rules('apellidos','apellidos','required');
		$this->form_validation->set_rules('cargo','cargo','required');
		$this->form_validation->set_rules('mail','mail','required');
		$ok = FALSE;
		if ($this->form_validation->run() == TRUE)
		{
			if ($this->modelo->find_organizacion($this->input->post('oid')) and $this->input->post('passwd') == $this->input->post('repasswd'))
			{
				$this->modelo->add_usuario($this->input->post('oid'),$this->input->post('user'),
				$this->input->post('passwd'), $this->input->post('nombre'), $this->input->post('apellidos'),
				$this->input->post('cargo'), $this->input->post('mail'));
				$ok = TRUE;
			}
		}

		if (!$ok)
		{
			$this->data['error'] = TRUE;
			$this->data['mensaje'] = "<b>Error:</b> debe llenar el formulario completo.";
		}
		else
		{
			$this->data['exito'] = TRUE;
			$this->data['mensaje'] = "<b>&Eacute;xito:</b> usuario <b>".$this->input->post('user')."</b> agregado.";
		}

		$this->organizaciones();
	}

	public function resultados()
	{
		$this->data['title'] = 'Resultados';
		$this->data['cuestionarios'] = $this->modelo->list_cuestionarios();
		$this->data['organizaciones'] = $this->modelo->list_organizaciones();
		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/resultados', $this->data);
		$this->load->view('admin/footer', $this->data);
	}

	public function cuestionarios()
	{
		$this->data['title'] = "Cuestionarios";
		$this->data['cuestionarios'] = $this->modelo->list_cuestionarios();
		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/cuestionarios', $this->data);
		$this->load->view('admin/footer');
	}

	public function add_cuestionario()
	{
		$config = array(
		'upload_path' => "./upload/",
		'allowed_types' => "xls",
		'file_name' => 'uploaded_file',
		'overwrite' => TRUE,
		'max_size' => "2048000",
		'max_height' => "2000",
		'max_width' => "2000"
		);
		
		$this->load->library('upload', $config);
		$ok = TRUE;
		$mensaje = "";
		if(!$this->upload->do_upload())
		{
			$ok = FALSE;
			$mensaje = "Error al subir el archivo. ";
		}
		$this->form_validation->set_rules('cuestionario', 'cuestionario', 'required');
		if (!$this->form_validation->run())
		{
			$ok = FALSE;
			$mensaje .="Debes rellenar el formulario";
		}

		if (!$ok)
		{
			$this->data['error'] = TRUE;
			$this->data['mensaje'] = $mensaje;
			$this->cuestionarios();
			return;
		}

		require_once 'application/third_party/excel_reader2.php';
		$data = new Spreadsheet_Excel_Reader($this->upload->data()['full_path']);
		$data->val(1,1);
		$row = 1;
		$cuid = $this->modelo->add_cuestionario($this->input->post('cuestionario'));

		while ($data->val($row,1) != "")
		{
			$codigo = $data->val($row, 1);
			$pregunta = $data->val($row, 2);
			$categoria = $data->val($row, 3);
			$sub_categoria = $data->val($row, 4);
			$dependencia = $data->val($row, 5);
			$normas = array();
			$col = 6;

			while ($data->val($row,$col) != "")
			{
				array_push($normas, $this->modelo->add_norma($data->val($row, $col++)));
			}

			if ($dependencia != "")
			{
				$dependencia = $this->modelo->get_pregunta_by_codigo($dependencia,$cuid)['id'];
			}
			/*
			echo 'row: '.$row.', ';
			echo 'codigo: '.$codigo.', ';
			echo 'pregunta: '.$pregunta.', ';
			echo 'categoria: '.$categoria.', ';
			echo 'dependencia: '.$dependencia.'<br>';
			*/
			$caid = $this->modelo->add_categoria($categoria);
			$scid = $this->modelo->add_sub_categoria($caid,$sub_categoria);
			$this->modelo->add_pregunta($cuid, $caid, $scid ,$normas, $pregunta, $codigo, $dependencia);
			$row++;
		}
		$row--;
		$this->data['exito'] = TRUE;
		$this->data['mensaje'] = "Se a&ntilde;adieron <b>$row</b> preguntas al cuestionario <b>".$this->input->post('cuestionario')."</b>";
		$this->cuestionarios();
	}

	public function delete_cuestionario()
	{
		if ($this->input->post('id'))
		{
			$this->modelo->delete_cuestionario($this->input->post('id'));
			$this->data['info'] = TRUE;
			$this->data['mensaje_info'] = 'Elemento eliminado con &eacute;xito';
		}
		
		$this->cuestionarios();
	}

	public function normas()
	{
		$this->data['title'] = "Normas";
		$this->data['normas'] = $this->modelo->list_normas();

		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/normas', $this->data);
		$this->load->view('admin/footer', $this->data);
	}

	public function categorias()
	{
		$this->data['title'] = "Categorias";
		$this->data['categorias'] = $this->modelo->list_categorias();

		$this->load->view('admin/header', $this->data);
		$this->load->view('admin/categorias', $this->data);
		$this->load->view('admin/footer', $this->data);
	}
	public function test()
	{
		$this->load->view('admin/header',$this->data);
		$this->load->view('admin/resultados');
		$this->load->view('admin/footer');
	}

	public function logout()
	{
		$this->session->unset_userdata('user_id');
		$this->login();
	}

	public function get_resultados()
	{
		$cuid = $this->input->get('cuid');
		$oid = $this->input->get('oid');
		$lista = $this->modelo->list_categorias_en_cuestionario($cuid);
		$r = array();
		$labels = array();
		$datasets = array();
		foreach ($lista as $l) {
			$add = array('categoria' => html_entity_decode($l['categoria']),
				'porcentaje' => $this->modelo->get_porcentaje_categoria_en_organizacion($oid, $l['id'], $cuid));
			array_push($r, $add);

			array_push($labels, html_entity_decode(trim($l['categoria'],"\'")));
			array_push($datasets, $this->modelo->get_porcentaje_categoria_en_organizacion($oid, $l['id'], $cuid));
		}

		$r = array('labels' => $labels, 'datasets' => array(array('label' => 'datos', 
            "fillColor" => "rgba(151,187,205,0.2)",
            "strokeColor" => "rgba(151,187,205,1)",
            "pointColor" => "rgba(151,187,205,1)",
            "pointStrokeColor" => "#fff",
            "pointHighlightFill" => "#fff",
            'data' => $datasets)));

		$this->output->set_content_type('application/json')->set_output(json_encode($r));
	}


}

?>