<?php @session_start();
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

include('common/head.php');?>
<body class="error-body no-top">
<div class="container">
<div class="row login-container column-seperation">
<div class="col-md-5 col-md-offset-1">
<h2>Sign in to Demovpn</h2>
<p>Use Facebook, Twitter or your email to sign in.<br>
<?php if($config['REG_STATUS']): ?>
<a href="registration.php">Sign up Now!</a> for a webarch account,It's free and always will be..</p><br>
<?php endif; ?>
<a href="request.php?request=redirect_to_auth" class="btn btn-lg btn-danger"><i class="fa fa-fw fa-google-plus"></i>Login With Google+</a>
</div>
<div class="col-md-5">
<br>
<div class="panel-body">
    <div id="login-response-message"></div>
        <form id="login-form">
            <fieldset>
                <div class="form-group">
                    <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                </div>
                <!-- Change this to a button or input when using this as a form -->
                <button type="submit" id="login-form-submit-btn" class="btn btn-primary btn-cons pull-right">Login</button>
            </fieldset>
        </form>
    </div>
</div>
</div>
</div>
<?php include_once 'common/script.php';?>
</body>
</html>