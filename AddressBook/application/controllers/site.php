<?php

class site extends CI_Controller {

    // The page contructor used to check if the user is logged-in
    function __construct() {
        parent::__construct();
        $this->is_logged_in();
    }

    // It loads the contacts_view (Homepage to see the contacts) with all the contacts retrieved from the database
    function membersarea() {
        // Loads the contacts_model
        $this->load->model('contacts_model');
        // Create an empty array to avoid null errors.
        $data = array();
        //Get records from the model and save them in the array
        if ($q = $this->contacts_model->getAll_records()) {
            $data['records'] = $q;
        }
        // Loads the view with the records
        $this->load->view('contacts_view', $data);
    }

    // Checks if the user is logged-in if not close the session and redirects to a permission page
    // to avoid direct url access problems
    function is_logged_in() {

        $is_logged_in = $this->session->userdata('islogged_in');

        if (!isset($is_logged_in) || $is_logged_in != TRUE) {
            echo 'Don\'t have permission to Continue<a href="../login">Login</a>';
            die();
        }
    }

    // Loads the add_contact page
    function add_contact() {
        $this->load->view('create_contact');
    }
    function search()
    {           $this->load->model('contacts_model');
		$query = $this->contacts_model->search();


                  $data2 = array();
        //Get records from the model and save them in the array
        if ($q = $this->contacts_model->search()) {
            $data2['records'] = $q;
        }
        // Loads the view with the records
        $this->load->view('search_results', $data2);
    }
    function delete_contact($f)
    {
                $this->load->model('contacts_model');
		$query = $this->contacts_model->delete($f);
                                 	redirect('site/membersarea');
               // $this->load->view('search_results');

    }
    function search_contact()
    {           
                     $this->load->view('search_results');





    }

    // Validates the inputs to add a contact in the contact list
    function create() {

        // Using the validation library it validates the user inputs
        $this->load->library('form_validation');
        $this->form_validation->set_rules('first_name', 'First Name', 'trim|required');
        $this->form_validation->set_rules('last_name', 'Last Name', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required');
        $this->form_validation->set_rules('phone', 'Phone', 'integer|trim|required');

        // If the validation fails it restarts the add_contact page
        if ($this->form_validation->run() == FALSE) {
            $this->add_contact();
        } else {
            // Else it calls the model to insert the inputs to the database
            $this->load->model('contacts_model');
            if ($q = $this->contacts_model->add_record()) {
                $this->load->view('contact_added_successful');
            } else {
                echo 'Failed TO add Contact';
            }
        }
    }

}

?>
