<?php

class Modelo extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	//--------------------CUESTIONARIOS--------------------

	public function list_cuestionarios()
	{
		$query = $this->db->get("cuestionarios");

		return $query->result_array();
	}

	public function exists_cuestionario($cid)
	{
		$cid = $this->db->escape($cid);
		$query = $this->db->query("select count(*) from cuestionarios where id = ".$cid);
		$r = $query->result_array()[0]['count(*)'];
		if ($r == 1)
		{
			return TRUE;
		}
		return FALSE;
	}

	public function add_cuestionario($cuestionario)
	{
		$cuestionario = $this->db->escape_str($cuestionario);
		$this->db->query("insert into cuestionarios values (NULL, '$cuestionario', NOW());");
		$query = $this->db->query('select last_insert_id();');
		return $query->result_array()[0]['last_insert_id()'];
	}

	public function delete_cuestionario($id)
	{
		$this->db->delete('cuestionarios', array('id' => $id));
	}

	//--------------------FIN CUESTIONARIOS--------------------


	//--------------------NORMAS--------------------
	public function find_norma($norma)
	{
		$query = $this->db->get_where('normas', array('norma' => $norma));
		if (count($query->result()) == 1)
		{
			return TRUE;
		}
		return FALSE;
	}
	
	public function add_norma($norma)
	{
		if (!$this->find_norma($norma)){
			$this->db->insert("normas", array('norma' => $norma));
			$query = $this->db->query('select last_insert_id();');
			return $query->result_array()[0]['last_insert_id()'];
		} 
		else 
		{
			return $this->get_norma($norma)['id'];
		}
	}

	public function get_norma($norma)
	{
		$n = "norma";
		if (is_numeric($norma))
		{
			$n = "id";
		}
		$query = $this->db->get_where("normas", array($n => $norma));
		if (count($query->result()) != 0)
		{
			return $query->result_array()[0];
		}
		else
		{
			return FALSE;
		}
	}

	public function list_normas()
	{
		$query = $this->db->get('normas');
		return $query->result_array();
	}


	//--------------------FIN NORMAS--------------------


	//--------------------CATEGORIAS--------------------
	public function find_categoria($categoria)
	{
		$query = $this->db->get_where('categorias', array('categoria' => $categoria));
		if (count($query->result()) != 0)
		{
			return TRUE;
		}
		return FALSE;
	}

	public function get_categoria($cat)
	{
		$n = "categoria";
		if (is_numeric($cat))
		{
			$n = "id";
		}
		$query = $this->db->get_where("categorias", array($n => $cat));
		if (count($query->result()) != 0)
		{
			return $query->result_array()[0];
		}
		else
		{
			return FALSE;
		}
	}

	public function list_categorias()
	{
		$query = $this->db->get('categorias');
		return $query->result_array();
	}


	public function list_categorias_en_cuestionario($cuid)
	{
		$list = $this->list_categorias();
		$r = array();
		foreach ($list as $l) {
			$c = $this->db->query('select count(*) from preguntas where cuid = '.$cuid.' and caid = '.$l['id']);
			if ($c->result_array()[0]['count(*)'] > 0)
			{
				array_push($r,$l);
			}
		}
		return $r;
	}

	
	public function add_categoria($categoria)
	{
		$categoria = $this->db->escape($categoria);
		if (!$this->find_categoria($categoria)){
			$this->db->insert('categorias', array('categoria' => $categoria));
			$query = $this->db->query('select last_insert_id();');
			return $query->result_array()[0]['last_insert_id()'];
		}
		else
		{
			return $this->get_categoria($categoria)['id'];
		}
	}

	//--------------------FIN CATEGORIAS--------------------

	//--------------------SUB_CATEGORIAS--------------------

	public function add_sub_categoria($cid, $sub_categoria)
	{
		$sb = $this->find_sub_categoria($cid, $sub_categoria);
		if ($sb == FALSE){
			$this->db->insert('sub_categorias', array('cid' => $cid, 'sub_categoria' => $sub_categoria));
			$query = $this->db->query('select last_insert_id()');
			return $query->result_array()[0]['last_insert_id()'];
		}
		else
		{
			return $sb;
		}
	}

	public function get_sub_categoria($cat)
	{
		$n = "sub_categoria";
		if (is_numeric($cat))
		{
			$n = "id";
		}
		$query = $this->db->get_where("sub_categorias", array($n => $cat));
		if (count($query->result()) != 0)
		{
			return $query->result_array()[0];
		}
		else
		{
			return FALSE;
		}
	}

	public function find_sub_categoria($cid, $sub_categoria)
	{
		$query = $this->db->get_where('sub_categorias', array('cid' => $cid, 'sub_categoria' => $sub_categoria));
		$result = $query->result_array();
		if (count($result) == 0)
		{
			return FALSE;
		}
		return $result[0]['id'];
	}

	//--------------------FIN SUB_CATEGORIAS--------------------

	//--------------------PREGUNTAS--------------------

	public function get_pregunta_cuestionario($users, $cid){
		$consulta = "";
		for ($i=0; $i < count($users); $i++)
		{
			$consulta .= 'respuestas.uid = '.$users[$i]['id'];
			if (count($users) - 2 >= $i)
			{
				$consulta .= ' or ';
			}
		}
		$cid = $this->db->escape_str($cid);
		$query = $this->db->query('select * from respuestas inner join preguntas on respuestas.pid = preguntas.id
		 where preguntas.cuid = '.$cid.' and ('.$consulta.') order by respuestas.pid desc limit 1');
		$presult = $query->result_array();
		$next_query = array();
		if (count($presult) == 0)
		{
			$next_query = $this->db->query('select * from preguntas where cuid = '.$cid.' limit 1');
		}
		else
		{
			$next_query = $this->db->query('select * from preguntas where cuid = '.$cid.' and id > '.$presult[0]['pid'].' limit 1');
			if (count($next_query->result_array()) == 0)
			{
				return FALSE;
			}
		}

		return $next_query->result_array()[0];
	}

	public function responder_pregunta($user, $cid, $resp)
	{
		$pr = $this->get_pregunta_cuestionario(array(array('id' => $user)), $cid);
		if ($pr !== FALSE)
		{
			if ($resp == 0)
			{
				$this->db->insert('respuestas', array('uid' => $user, 'pid' => $pr['id'], 'respuesta' => 0));
				$dep = $this->find_dependencia($pr['id']);
				foreach ($dep as $d) {
					$this->db->insert('respuestas', array('uid' => $user, 'pid' => $d['id'], 'respuesta' => 0));
				}
				return TRUE;
			}
			elseif ($resp == 1) {
				$this->db->insert('respuestas', array('uid' => $user, 'pid' => $pr['id'], 'respuesta' => 1));
				return TRUE;
			}
		}
		return FALSE;
	}

	public function get_cuantas_preguntas_faltan_porcentaje($cid)
	{
		$cid = $this->db->escape($cid);
		$q1 = $this->db->query("select count(*) from respuestas inner join preguntas on preguntas.id = respuestas.pid where preguntas.cuid = ".$cid);
		$q2 = $this->db->query("select count(*) from preguntas where cuid = ".$cid);

		$val1 = (float)(($q1->result_array()[0]['count(*)']*100)/$q2->result_array()[0]['count(*)']);
		$val1 = (int)($val1*100);
		$val1 = (float)$val1/100.0;
		return $val1;
	}

	public function find_dependencia($pid)
	{
		$query = $this->db->get_where('preguntas', array('dependencia' => $pid));
		return $query->result_array();
	}

	public function get_pregunta_by_id($id)
	{
		$result = $query->db->get_where('preguntas', array('id' => $id));
		return $result->result_array()[0];
	}

	public function find_pregunta($pregunta, $caid, $cuid)
	{
		$pregunta = $this->db->escape_str($pregunta);
		$cuid = $this->db->escape_str($cuid);
		$caid = $this->db->escape_str($caid);

		$query = $this->db->get_where('preguntas', array('pregunta' => $pregunta, 'caid' => $caid, 'cuid' => $cuid));
		$result = $query->result();
		if (count($result) == 1)
		{
			return TRUE;
		}
		return FALSE;
	}


	public function add_pregunta($cuid, $caid, $scid, $nid, $pregunta, $codigo, $dependencia)
	{
		$cuid = $this->db->escape_str($cuid);
		$caid = $this->db->escape_str($caid);
		$pregunta = $this->db->escape($pregunta);

		if (is_array($nid) and !$this->find_pregunta($pregunta, $caid, $cuid)){
			$this->db->insert('preguntas', array('caid' => $caid, 'cuid' => $cuid, 'scid' => $scid,
			 'pregunta' => $pregunta, 'codigo' => $codigo, 'dependencia' => $dependencia));
			$query = $this->db->get_where('preguntas', array('caid' => $caid, 'cuid' => $cuid, 'pregunta' => $pregunta));
			$id = $query->result()[0]->id;
			foreach ($nid as $n) {
				$this->db->insert('normas_en_preguntas', array('pid' => $id, 'nid' => $n));
			}
		}
		return FALSE;
	}

	public function get_pregunta_by_codigo($codigo, $cuid)
	{
		$query = $this->db->get_where('preguntas', array('codigo' => $codigo, 'cuid' => $cuid));
		return $query->result_array()[0];
	}

	//--------------------FIN PREGUNTAS--------------------


	//--------------------ORGANIZACIONES--------------------
	public function find_organizacion($id)
	{
		$query = $this->db->get_where('organizaciones', array('id' => $id));
		if (count($query->result()) == 1)
		{
			return TRUE;
		}
		return FALSE;
	}

	public function add_organizacion($nombre, $mail)
	{
		$this->db->insert('organizaciones', array('nombre'=> $nombre, 'mail' => $mail));
	}

	public function delete_organizacion($oid)
	{
		$oid = $this->db->escape_str($oid);
		$this->db->delete('organizaciones', array('id' => $oid));
	}

	public function list_organizaciones()
	{
		$query = $this->db->get('organizaciones');
		return $query->result_array();
	}

	//--------------------FIN ORGANIZACIONES--------------------


	//--------------------USUARIOS--------------------
	public function list_usuarios()
	{
		$query = $this->db->get('usuarios');
		return $query->result_array();
	}

	public function get_usuario($uid)
	{
		$uid = $this->db->escape_str($uid);
		$query = $this->db->get_where('usuarios', array('id' => $uid));
		return $query->result_array()[0];
	}

	public function list_usuarios_en_organizacion($user_id)
	{
		$oid = $this->db->get_where('usuarios', array('id' => $user_id));
		$oid = $oid->result_array()[0]['oid'];

		$query = $this->db->get_where('usuarios', array('oid' => $oid));
		return $query->result_array();
	}

	public function check_usuario($user, $passwd)
	{
		$user = $this->db->escape_str($user);
		$passwd = $this->db->escape_str($passwd);
		$query = $this->db->query("select * from usuarios where user='".$user."' and passwd = md5('".$passwd."') ");
		$result = $query->result_array();

		if(count($result) == 1)
		{
			return $result[0]['id'];
		}
		return FALSE;

	}

	public function check_usuario_by_id($user)
	{
		$query = $this->db->get_where('usuarios', array('id' => $user));
		if (count($query->result_array()) == 1)
		{
			return TRUE;
		}
		return FALSE;
	}

	public function add_login($uid)
	{
		$query = $this->db->query('insert into historial_logins values (NULL, '.$uid.', NOW())');
	}

	public function is_usuario_online($uid)
	{
		
	}

	public function add_usuario($oid, $user, $passwd, $nombre, $apellidos, $cargo, $mail)
	{
		$arraydata = array('user' => $user, "passwd" => $passwd);
		$this->db->query("insert into usuarios values (NULL, ".$oid.", '".$user."', md5('".$passwd."'), '$nombre', '$apellidos', '$cargo', '$mail' , NOW())");
	}
	//--------------------FIN USUARIOS--------------------

	//--------------------RESULTADOS--------------------

	public function get_porcentaje_categoria_en_organizacion($oid, $caid, $cuid)
	{
		$users = $this->db->get_where('usuarios', array('oid' => $oid));
		$users = $users->result_array();
		$consulta = "";
		for ($i=0; $i < count($users); $i++)
		{
			$consulta .= 'respuestas.uid = '.$users[$i]['id'];
			if (count($users) - 2 >= $i)
			{
				$consulta .= ' or ';
			}
		}
		
		$q1 = $this->db->query('select count(*) from preguntas where cuid = '.$cuid.' and caid = '.$caid);
		$q2 = $this->db->query('select count(*) from respuestas inner join preguntas on preguntas.id = respuestas.pid 
			where preguntas.cuid = '.$cuid.' and preguntas.caid = '.$caid.' and respuestas.respuesta = 1 and ('.$consulta.')');
		$result = ($q2->result_array()[0]['count(*)']*100)/$q1->result_array()[0]['count(*)'];
		return (int)($result);
	}

	//--------------------FIN RESULTADOS--------------------
}

?>