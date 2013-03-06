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
                            <?php echo form_open('site/search'); ?>
                            <h1> Your Address-Book </h1> 
                            <?php

                           // $names =new array();
                         
                            if (isset($records)) {
                                     $i=0;
                                foreach ($records as $row) {
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->first_name . '</label>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->last_name . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->phone . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->address . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->city . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->country . '</label>' . '</p>';
                                    echo '<p>' . '<label for = "usernamesignup" class = "uname">' . $row->email . '</label>' . '</p>';
                                         $i= "site/delete_contact/$row->id";
                                       
                                    echo  anchor($i, 'delete', 'class="to_register"');
                                    //form_submit('delete','delete');
                                    echo '<hr>';

                                }
                            } else {
                                echo form_input('searchfor','First_Name'); echo form_submit('searched','Search');
                            }
                            ?>

                            <?php echo anchor('site/add_contact', 'Add Contact', 'class="to_register"');
                            ?>
                             <?php echo anchor('site/search_contact', 'Search', 'class="to_register"');
                            ?>
                            <?php echo form_close(); ?>
                        </div>

                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>