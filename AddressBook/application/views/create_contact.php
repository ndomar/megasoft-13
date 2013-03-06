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
                <h1>Add <span> Contact</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <?php echo form_open('site/create'); ?>
                            <h1> Add </h1> 
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">First name</label>
                                <input id="usernamesignup" name="first_name" required="required" type="text" placeholder="first name" />
                            </p>
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">Last name</label>
                                <input id="usernamesignup" name="last_name" required="required" type="text" placeholder="last name" />
                            </p>
                            <p> 
                                <label for="emailsignup" class="youmail" data-icon="e" >Email</label>
                                <input id="emailsignup" name="email" required="required" type="email" placeholder="supermail@mail.com"/> 
                            </p>
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">Phone</label>
                                <input id="usernamesignup" name="phone" required="required" type="text" placeholder="960" />
                            </p>
                            <p> 
                                <label for="usernamesignup" class="uname" data-icon="u">Address</label>
                                <input id="usernamesignup" name="address"  type="text" placeholder="1,street" />
                            </p>
                            <p>
                                <label for="usernamesignup" class="uname" data-icon="u">City</label>
                                <input id="usernamesignup" name="city"  type="text" placeholder="city" />
                            </p>
                            <p>
                                <label for="usernamesignup" class="uname" data-icon="u">Country</label>
                                <input id="usernamesignup" name="country" type="text" placeholder="country" />
                            </p>
                            <p class="signin button"> 
                                <input type="submit" name="submit" value="Add"/> 
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