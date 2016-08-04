<?php include 'elements/admin_head.php'; ?>

<body class="gray-bg">

    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">IN+</h1>

            </div>
            <h3>Welcome to Demovpn Admin</h3>
            <p>Login in. To see it in action.</p>
            <div class="alert danger"><?php echo (isset($_SESSION['msg'])?$_SESSION['msg']:"") ?></div>
            <form class="m-t" role="form" action="../request.php?request=admin_login" method="POST" >
                <div class="form-group">
                    <input type="text" name="email" id="email" class="form-control" placeholder="Username" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="">
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b" name="login_submit" id="login_submit">Login</button>
            </form>
        </div>
    </div>

    <!-- Mainly scripts -->
    <?php include 'elements/admin_footer.php';?>

</body>

</html>