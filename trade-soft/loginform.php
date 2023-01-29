<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title>ATIL | Log in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

    </head>
    <body class="bg-black">
        <div class="form-box" id="login-box">
            <div class="header"><?=$loginmessage;?></div>
            <form action="index.php" method="post" autocomplete="off">
                <div class="body bg-gray">
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="User ID" autofocus />
                    </div>
                    <div class="form-group">
                        <input type="password" name="userpass" class="form-control" placeholder="Password"/>
                    </div>          
                </div>
                <div class="footer">                                                               
                    <button type="submit" name = 'submit' class="btn bg-olive btn-block">Sign me in</button>  
                    
                    
                    
                </div>
            </form>

        </div>


        <!-- jQuery 2.0.2 -->
        <script src="js/jquery.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>
<? die(); ?>