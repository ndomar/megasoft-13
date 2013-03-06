<?php

class members_model extends CI_Model {

    // Login Checking Part 
    public function validate() {
   	$this->db->where('username', $this->input->post('username'));
		$this->db->where('password', md5($this->input->post('password')));
		$query = $this->db->get('members');
		
		if($query->num_rows == 1)
		{
			return true;
		}
    }

    // Signup Part (by inserting inputs to the members table)
    public function create_member() {
        // Create an assorted array fron the input data.
        $new_member_insert_data = array('first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'email' => $this->input->post('email'),
            'username' => $this->input->post('username'),
            'password' => md5($this->input->post('password')));
        // Insert the array in the members database.
        $insert = $this->db->insert('members', $new_member_insert_data);
        return $insert;
    }

}

?>
