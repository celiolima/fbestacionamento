<?php

defined('BASEPATH') or exit('Ação não permitida');

class Galeria_model extends CI_Model
{



    public function get_all($table = NULL, $condition = NULL)
    {

        if ($table) {

            if (is_array($condition)) {
                $this->db->where($condition);
            }

            $this->db->order_by('id', 'DESC');
            return $this->db->get($table)->result();
        } else {
            return false;
        }
    }
}
