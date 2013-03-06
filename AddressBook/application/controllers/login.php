<?php

class login extends CI_Controller {

    // Automatically loaded at startup it loads the login-form view
    public function index() {
        $this->load->view('login_form');
    }

    // If the login data is valid it redirects to the members zone else it reloads the login-page
    // Now it only compares it with my account it should be replaced with normal login

    public function validate_inputs() {


    $this->load->model('members_model');
		$query = $this->members_model->validate();

		if($query) // if the user's credentials validated...
		{
			$data = array(
				'username' => $this->input->post('username'),
				'is_logged_in' => true
			);
			$this->session->set_userdata($data);
			redirect('site/membersarea');
		}
		else // incorrect username or password
		{

			$this->index();
		}


  
    }

    // Load the sign-up form page
    function signup() {

        $this->load->view('signup_form');
    }

    // Create a member from the input data after validation
    function createmember() {

        // Using the validation library it validates the user inputs
        $this->load->library('form_validation');
        $this->form_validation->set_rules('first_name', 'First Name', 'trim|required');
        $this->form_validation->set_rules('last_name', 'Last Name', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
        $this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[4]');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('password2', 'Password Confirmation', 'trim|required|min_length[4]|max_length[32]|matches[password]');

        // If the validation fails it restarts the signup page
        if ($this->form_validation->run() == FALSE) {
            $this->signup();
        } else {

            // Else it calls the model to insert the inputs to the database
            $this->load->model('members_model');
            if ($q = $this->members_model->create_member()) {
                $this->load->view('signup_successful');
            } else {
                // If there is a problem (Record not inserted) it restars the signup page
                $this->signup();
            }
        }
    }

    // To Logout from the current session
    function logout() {

    }

}

?>
