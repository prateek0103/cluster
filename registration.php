<?php session_start();
/*$_SESSION['vpn_user'] = md5(2);
$_SESSION['user_id'] = 2;
$_SESSION['email'] = 'rajenpal033@gmail.com';
$_SESSION['user_type'] = 'customer';
header("Location:remote_data_ctrl.php");*/
require_once 'includes/config.php';
if(!$config['SITE_STATUS'])
{
    header('Location: ../app/offline.html');
    die();
}
if(!$config['REG_STATUS'])
{
    header('Location: ../app/login.php');
    die();
}
include('common/head.php');?>
<body class="error-body no-top">
<div class="container">
<div class="row login-container column-seperation">
<div class="col-md-5 col-md-offset-1">
<h2>Sign in to webarch</h2>
<p>Use Facebook, Twitter or your email to sign in.<br>

<a href="login.php">Sign in Now!</a> for a webarch account,It's free and always will be..</p><br>
<a href="#" class="btn btn-lg btn-danger"><i class="fa fa-fw fa-google-plus fa-6"></i>Login With Google+</a>
</div>
<div class="col-md-5">
<br>
<div class="panel-body">
    <div id="reg-response-message"></div>
        <form id="reg-form">
            <fieldset>
                <div class="form-group">
                    <input class="form-control" placeholder="Name" name="name" type="text" autofocus>
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="Password" name="password" id="password" type="password" value="">
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="Confirm password" name="cpassword" id="cpassword" type="password" value="">
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <button type="submit" id="reg-form-submit-btn" class="btn btn-primary btn-cons pull-right">Sign up</button>
            </fieldset>
        </form>
    </div>
</div>
</div>
</div>
<?php include_once 'common/script.php';?>

