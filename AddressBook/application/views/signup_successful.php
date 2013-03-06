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
                <h1>Sign-up <span>Success</span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <?php echo anchor('login', 'Login', 'class="to_register"');
                            ?>
                        </div>

                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>