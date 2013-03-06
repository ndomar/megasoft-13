<html lang="en" class="no-js"> 
    <head>
        <meta charset="UTF-8" />
        <title>Address-Book</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/style.css" />
    </head>
    <body>
        <div class="container">
            <header>
                <h1>Address-Book <span> Login</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <?php echo form_open('login/createmember'); ?>
                            <h1> Sign up </h1> 
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">First name</label>
                                <input id="usernamesignup" name="first_name" required="required" type="text" placeholder="mysuperusername690" />
                            </p>
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">Last name</label>
                                <input id="usernamesignup" name="last_name" required="required" type="text" placeholder="mysuperusername690" />
                            </p>
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                <input id="usernamesignup" name="username" required="required" type="text" placeholder="mysuperusername690" />
                            </p>
                            <p> 
                                <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                <input id="emailsignup" name="email" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                            </p>
                            <p> 
                                <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                <input id="passwordsignup" name="password" required="required" type="password" placeholder="eg. X8df!90EO"/>
                            </p>
                            <p> 
                                <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                <input id="passwordsignup_confirm" name="password2" required="required" type="password" placeholder="eg. X8df!90EO"/>
                            </p>
                            <p class="signin button"> 
                                <input type="submit" name="submit" value="Sign up"/> 
                            </p>
                            <p class="change_link">  
                                Already a member ?
                                <?php echo anchor('login', ' Go and log in ', 'class="to_register"'); ?>
                            </p>
                            <?php echo form_close(); ?>
                            <?php echo validation_errors('<p class="error"></p>'); ?>
                        </div>

                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>