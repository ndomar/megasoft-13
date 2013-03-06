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
                            <?php echo form_open('login/validate_inputs'); ?>
                            <h1>Log in</h1> 
                            <p> 
                                <label for="username" class="uname" data-icon="u" > Your email or username </label>
                                <input id="username" name="username"  required="required" type="text" placeholder="myusername or mymail@mail.com"/>
                            </p>
                            <p> 
                                <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                                <input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                            </p>
                            <p class="login button"> 
                                <input type="submit" name="submit" value="Login" /> 
                            </p>
                            <p class="change_link">
                                Not a member yet ?
                                <?php echo anchor('login/signup', 'Join us', 'class="to_register"'); ?>
                            </p>
                            <?php echo form_close(); ?>
                        </div>
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>