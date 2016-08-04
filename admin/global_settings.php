<?php
ob_start();
include 'elements/admin_header.php';

if(!empty($_POST)){
    $file = '../includes/config.php';
    $content = file_get_contents ($file);
    $str_to_find = "";
    $str_to_replace = "";
    $command = $_POST['command'];
    if($command == "site")
    {
        $str_to_find = "'SITE_STATUS' => " + $config['SITE_STATUS'] ? 'true' : 'false';
        $str_to_replace = "'SITE_STATUS' => " + $config['SITE_STATUS'] ? 'false' : 'true';
        file_put_contents ($file, str_replace($str_to_find, $str_to_replace, $content));
    }
    else if($command == "reg")
    {
        $str_to_find = "'REG_STATUS' => " + $config['REG_STATUS'] ? '1' : '0';
        $str_to_replace = "'REG_STATUS' => " + $config['REG_STATUS'] ? '0' : '1';
        file_put_contents ($file, str_replace($str_to_find, $str_to_replace, $content));
    }
    sleep(2);
    ob_clean();
    header('Location: ../admin/global_settings.php');
die();
}

ob_end_flush();

?>
 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>FooTable</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">ServiceControl</a>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row wrapper">
        <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
            <thead>
            <tr>
                <th>Service</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
                <tr id="site_status">
                    <td>site status</td>
                    <td>
                        <?php echo $config['SITE_STATUS'] ? '<span style="color: green;">Online</span>' : '<span style="color: red;">Offline</span>' ?>
                    </td>
                    <td>
                        <form method="post">
                            <button type="submit" class="btn btn-success" name="command" value="site"><?php echo $config['SITE_STATUS'] ? 'Go offline' : 'Go online'; ?></button>
                        </form>

                    </td>
                </tr>
                <tr id="serverphp">
                    <td>registration status</td>
                    <td>
                        <?php echo $config['REG_STATUS'] ? '<span style="color: green;">Enabled</span>' : '<span style="color: red;">Disabled</span>' ?>
                    </td>
                    <td>
                        <form method="post">
                            <button type="submit" class="btn btn-success" name="command" value="reg"><?php echo $config['REG_STATUS'] ? 'Disable' : 'Enable'; ?></button>
                        </form>

                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<?php include 'elements/admin_footer.php';?>


