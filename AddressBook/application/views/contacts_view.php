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
                <h1>Address <span>Book</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <?php echo form_open('site/create'); ?>
                            <h1> Your Address-Book </h1> 
                            <?php
                            if (isset($records)) {
                                foreach ($records as $row) {
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->first_name . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->last_name . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->phone . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->address . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->city . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->country . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->email . '</label>' . '</p>' . '<hr>';
                                }
                            } else {
                                echo '<p>' . '<label for = "usernamesignup" class = "uname">' . 'No Records' . '</label>' . '</p>';
                            }
                            ?>

                            <?php echo anchor('site/add_contact', 'Add Contact', 'class="to_register"');
                            ?>
                            <?php echo form_close(); ?>
                        </div>

                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>