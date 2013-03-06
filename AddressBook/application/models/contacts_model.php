<?php

class contacts_model extends CI_Model {

    // Retrieve All the contacts records related to the logged-in user
    function getAll_records() {
        // Select records where the username is equal to the logged-in user.
        $this->db->where('username', $this->session->userdata('username'));
        // Get all the selected records
        $q = $this->db->get('contacts');
        return $q->result();
    }
    
    function search()
    {
         $this->db->where('username', $this->session->userdata('username'));
           $this->db->where('first_name', $this->input->post('searchfor'));
              $q = $this->db->get('contacts');
        return $q->result();
    }
    function delete($f)
    {
                    $this->db->where('username', $this->session->userdata('username'));
           $this->db->where('id', $f);
           $q =$this->db->delete("contacts");
    }

    // To add a contact to the logged-in user contacts list
    function add_record() {
        // Create an assorted array fron the input data.
        $data = array('first_name' => $this->input->post('first_name'),
            'last_name' => $this->input->post('last_name'),
            'email' => $this->input->post('email'),
            'phone' => $this->input->post('phone'),
            'address' => $this->input->post('address'),
            'username' => $this->session->userdata('username'),
            'city' => $this->input->post('city'),
            'country' => $this->input->post('country'));
        // Insert the array in the contacts database
        $insert = $this->db->insert('contacts', $data);
        return $insert;
    }

    // To update and edit a Contact
    function update_record() {

    }

    // To delete a contact from the contacts list
    function delete_record() {

    }

}

?>
