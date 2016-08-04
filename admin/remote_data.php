<?php include 'elements/admin_header.php';
set_include_path(get_include_path() . PATH_SEPARATOR . dirname(__FILE__) . DIRECTORY_SEPARATOR . '..'.DIRECTORY_SEPARATOR.'includes'.DIRECTORY_SEPARATOR.'phpseclib');
include('Net'.DIRECTORY_SEPARATOR.'SSH2.php');
$check="";
function run_ssh_command($cmd, $ip)
{

    $result = "Openning ssh to " . $ip . "<br/>";
    $ssh = new Net_SSH2($ip);
    if (!$ssh->login('root', 'demovpn!@#')) {
        return $result . 'Login Failed';
    }
    $result .= "Logged in. Executing commands..." . "<br/>";
    $ssh->enableQuietMode();
    $result .= '<b>stop test_runner:</b></br>';
    $result .=  nl2br($ssh->exec("stop test_runner"));
    $result .= '<b>stop resourcesmon_runner:</b></br>';
    $result .=  nl2br($ssh->exec("stop resourcesmon_runner"));
    if(strcasecmp($cmd, "restart") == 0) {
        $result = $result . '<b>start test_runner:</b></br>';
        $result = $result . nl2br($ssh->exec("start test_runner"));
        $result = $result . '<b>start resourcesmon_runner:</b></br>';
        $result = $result . nl2br($ssh->exec("start resourcesmon_runner"));
    }
    $ssh->disconnect();
    $result .=  "<br/>" . "Done.";
    return $result;
}
function restart_webserver_scripts($cmd)
{
    $result = "Openning ssh to 192.81.220.57<br/>";
    $ssh = new Net_SSH2('192.81.220.57');
    if (!$ssh->login('root', 'demovpn!@#')) {
        return $result . 'Login Failed';
    }
    $ssh->enableQuietMode();
    $result .= '<b>stop mon_runner:</b></br>';
    $result .=  nl2br($ssh->exec("stop mon_runner"));
    $result .= '<b>stop serverphp_runner:</b></br>';
    $result .=  nl2br($ssh->exec("stop serverphp_runner"));
    $result .= '<b>stop deduct_cash_runner:</b></br>';
    $result .=  nl2br($ssh->exec("stop deduct_cash_runner"));
    $result .= '<b>stop process_complete_runner:</b></br>';
    $result .=  nl2br($ssh->exec("stop process_complete_runner"));
    if(strcasecmp($cmd, "restart") == 0) {
        $result = $result . '<b>start mon_runner:</b></br>';
        $result = $result . nl2br($ssh->exec("start mon_runner"));
    }
    $ssh->disconnect();
    $result .=  "<br/>" . "Done.";
    return $result;
}
if(!empty($_POST)) {
    if (!empty($_POST['command'])) {
        $command = trim($_POST['command']);
        if(strcasecmp($command, "switchmon") == 0)
        {
            $db->query("UPDATE `remote_server_list` SET `is_monitored`=" . (trim($_POST['monstat']) == 0 ? "1" : "0") . " WHERE id="  . trim($_POST['id']));
        }
        else
        {
            $bashresult = run_ssh_command($command, trim($_POST['ip']));
        }
    }
    else if(!empty($_POST['maincommand'])) {
        $command = trim($_POST['maincommand']);
        $bashresult = restart_webserver_scripts($command);
    }
    else {
        $res = $db->query("SELECT * FROM `remote_server_list` WHERE `remote_ip`='" . $_POST['remote_ip'] . "'");
        if ($res->num_rows > 0) {
            if ($db->query("UPDATE `remote_server_list` SET `server_uname`='" . $_POST['username'] . "', `server_pass`='" . $_POST['password'] . "', `server_name`='" . $_POST['sname'] . "', `remote_group`='" . $_POST['remote_grp'] . "' WHERE `remote_ip`='" . $_POST['remote_ip'] . "'")) {
                $check = 1;
            }
        } else {
            $db->query("INSERT INTO `remote_server_list` (`email`, `remote_ip`, `server_uname`, `server_pass`, `server_name`, `remote_group`) VALUES('" . $_POST['email'] . "', '" . $_POST['remote_ip'] . "', '" . $_POST['username'] . "', '" . $_POST['password'] . "', '" . $_POST['sname'] . "', '" . $_POST['remote_grp'] . "')");
            $check = 1;
            $subject = 'Remote Server';
            $message = '<html>
                                 <head>
                                     <title>"' . $subject . '"</title>
                                 </head>
                                 <body>
                                      Dear sir/madam,<br>
                                          A new remote server added.<br><br>
                                      Thank you,<br>
                                      Demovpn team.
                                 </body>
                             </html>';
            $headers = "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
            $headers .= 'From:DemoVPN <demovpn@comenzarit.com>' . "\r\n";
            mail($_POST['email'], $subject, $message, $headers);
            /*$conn = new mysqli($_POST['remote_ip'], $_POST['username'], $_POST['password']);

            if ($conn) {
                  if($conn->query("CREATE DATABASE `operations_queue`")){
                        $conn->query("USE `operations_queue`");
                        $tables="CREATE TABLE IF NOT EXISTS `job_queue` (
                                                  `job_id` int(10) NOT NULL AUTO_INCREMENT,
                                                  `tunnel_type` varchar(100) NOT NULL,
                                                  `tunnel_id` int(10) DEFAULT NULL,
                                                  `action` text NOT NULL,
                                                  `data` text NOT NULL,
                                                  `cloud_id` int(11) NOT NULL,
                                                  `is_complete_action` tinyint(1) NOT NULL DEFAULT '-1',
                                                  `is_updated` tinyint(1) NOT NULL DEFAULT '0',
                                                  `added_time` datetime NOT NULL,
                                                  PRIMARY KEY (`job_id`)
                                                )";
                        if($conn->query($tables)){
                              $conn->close();
                              $db->query("INSERT INTO `remote_server_list` (`email`, `remote_ip`, `server_uname`, `server_pass`, `remote_group`) VALUES('".$_POST['email']."', '".$_POST['remote_ip']."', '".$_POST['username']."', '".$_POST['password']."', '".$_POST['remote_grp']."')");
                                    $check=1;
                                    $subject ='Remote Server';
                                   $message ='<html>
                                       <head>
                                           <title>"'.$subject.'"</title>
                                       </head>
                                       <body>
                                            Dear sir/madam,<br>
                                                A new remote server added.<br><br>
                                            Thank you,<br>
                                            Demovpn team.
                                       </body>
                                   </html>';
                                   $headers = "MIME-Version: 1.0" . "\r\n";
                                   $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                                   $headers .= 'From:DemoVPN <demovpn@comenzarit.com>' . "\r\n";
                                   mail($_POST['email'],$subject,$message,$headers);
                        }
                    }
              }else{
                  echo "Error creating database: ";
              }*/
        }
    }
}
$arr=$db->query("SELECT * FROM `remote_server_list`");
$serverphp = false;
$socket_trigger = false;
$deduct_cash = false;
$process_complete = false;
$mon = false;
$sshcon = new Net_SSH2('192.81.220.57');
if ($sshcon->login('root', 'demovpn!@#')) {
    $monstr = $sshcon->exec("status mon_runner");
    if(strpos($monstr, 'stop/waiting') === false)
        $mon = true;

    $serverphpstr = $sshcon->exec("status serverphp_runner");
    if(strpos($serverphpstr, 'stop/waiting') === false)
        $serverphp = true;

    $socket_triggerstr = $sshcon->exec("status socket_trigger_runner");
    if(strpos($socket_triggerstr, 'stop/waiting') === false)
        $socket_trigger = true;

    $deduct_cashstr = shell_exec("status deduct_cash_runner");
    if(strpos($deduct_cashstr, 'stop/waiting') === false) {
        $deduct_cash = true;
    }

    $process_completestr = shell_exec("status process_complete_runner");
    if(strpos($process_completestr, 'stop/waiting') === false) {
        $process_complete = true;
    }
}

?>
<?php if(!empty($bashresult)): ?>
    <div class="row wrapper">
        <h3>Bash output:</h3>
        <div class="row wrapper" style="background-color: black; color: white">
            <?php echo $bashresult; ?>
        </div>
    </div>
<?php endif;?>
 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>FooTable</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">Remote Server</a>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">

    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>MainScript control</h5>
                </div>
                <div class="ibox-content">
                    <div class="row wrapper">
                        <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                            <thead>
                            <tr>
                                <th>Service</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr id="monrunner">
                                <td>moitor</td>
                                <td>
                                    <?php if($mon){
                                        echo '<span style="color: green;">Running</span>';
                                    }
                                    else
                                    {
                                        echo '<span style="color: red;">Down</span>';
                                    }
                                    ?>
                                </td>
                            </tr>
                            <tr id="serverphp">
                                <td>server.php</td>
                                <td>
                                    <?php if($serverphp){
                                        echo '<span style="color: green;">Running</span>';
                                    }
                                    else
                                    {
                                        echo '<span style="color: red;">Down</span>';
                                    }
                                    ?>
                                </td>
                            </tr>
                            <tr id="deduct_cash">
                                <td>deduct_cash caller</td>
                                <td>
                                    <?php if($deduct_cash){
                                        echo '<span style="color: green;">Running</span>';
                                    }
                                    else
                                    {
                                        echo '<span style="color: red;">Down</span>';
                                    }
                                    ?>
                                </td>
                            </tr>
                            <tr id="deduct_cash">
                                <td>process_complete caller</td>
                                <td>
                                    <?php if($process_complete){
                                        echo '<span style="color: green;">Running</span>';
                                    }
                                    else
                                    {
                                        echo '<span style="color: red;">Down</span>';
                                    }
                                    ?>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row wrapper">
                        <form role="form" action="" method="post">
                            <div class="form-group" id="scroll_div">
                                <button type="submit" class="btn btn-success" name="maincommand" value="restart">Restart</button>
                                <button type="submit" class="btn btn-success" name="maincommand" value="stop">Stop</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5></h5>

                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#">Config option 1</a>
                            </li>
                            <li><a href="#">Config option 2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>

                <div class="ibox-content">

                    <div id="scroll_div" style=" min-height: 581px;">
            <form role="form" action="" method="post">
                <div class="form-group">
                <?php if($check==1){
                    ?>
                      <div id="msg" class="bg-success" style="padding:7px;mergin-top:5px;"><strong>Changes applied successfully</strong></div>
                    <?php
                  } ?>
                  <label for="email">Remote IP:</label>
                  <input type="text" class="form-control" id="remote_id" name="remote_ip" placeholder="Enter remote ip" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Mysql user name:</label>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Mysql password:</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Server name:</label>
                  <input type="text" class="form-control" id="sname" name="sname" placeholder="Enter server name" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Email ID:</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
                </div>
                 <div class="form-group">
                  <label for="sel1">Remote group:</label>
                  <select class="form-control" id="sel1" name="remote_grp" required>
                    <option>Select a category</option>
                    <option id="a" value="a">a</option>
                    <option id="b" value="b">b</option>
                  </select>
                </div>
                <!-- <button type="button" id="test" class="btn btn-primary">Test</button> -->
                <button type="button" id="testall" class="btn btn-primary">Test all server</button>
                <button type="submit" class="btn btn-success">Save</button>
              </form>
              <h3>All Remote Server</h3>
              <table class="table table-bordered" style="margin-top: 12px;">
                <thead>
                  <tr>
                      <th>Remote Server IP</th>
                      <th>Mysql user name</th>
                      <th>Server name</th>
                      <th>Group</th>
                      <th>Tests completed</th>
                      <th>MonStatus</th>
                      <th>ScriptStatus</th>
                      <th>ResourceUsage</th>
                      <th></th>
                    <!-- <th>Edit information</th> -->
                  </tr>
                </thead>
                <tbody>
                <?php while($val=$arr->fetch_assoc()){ ?>
                    <tr class="remote_list_<?php echo $val['id']; ?>">
                      <td>
                        <?php echo $val['remote_ip']; ?>
                        <i class="fa fa-pencil-square-o edit" data-pk="<?php echo $val['id']; ?>" style="color:#4285F4; margin-left:10px; cursor:pointer;"></i>
                        <i class="fa fa-trash-o delete" data-pk="<?php echo $val['id']; ?>" style="color:#E40303; margin-left:10px; cursor:pointer;"></i>
                        <?php if($val['is_active']==0){ ?>
                          <a href="javascript:void()" class="status stat_<?php echo $val['id']; ?>" data="1" data-pk="<?php echo $val['id']; ?>" value="Active"><i class="fa fa-circle" style="color:#D6465F;margin-left:10px;"></i></a>
                      <?php }else{
                        ?>
                            <a href="javascript:void()" class="status stat_<?php echo $val['id']; ?>" data="0" data-pk="<?php echo $val['id']; ?>" value="Inactive"><i class="fa fa-circle" style="color:#449D44;margin-left:10px;"></i></a>
                        <?php
                        } ?>
                      </td>
                      <td><?php echo $val['server_uname']; ?></td>
                      <td><?php echo $val['server_name']; ?></td>
                        <td><?php echo $val['remote_group']; ?></td>
                        <td><?php echo $val['tests_number']; ?></td>
                        <td><?php echo $val['is_monitored'] ? '<span style="color: green;">On</span>' : '<span style="color: red;">Off</span>'; ?></td>
                        <td><?php echo $val['current_status']; ?></td>
                        <td><?php echo $val['ressnap']; ?></td>
                        <td>
                            <form role="form" action="" method="post">
                                <div class="form-group" id="scroll_div">
                                    <input type="hidden" name="ip" value="<?php echo $val['remote_ip']; ?>" />
                                    <input type="hidden" name="id" value="<?php echo $val['id']; ?>" />
                                    <input type="hidden" name="monstat" value="<?php echo $val['is_monitored']; ?>" />
                                    <button type="submit" class="btn btn-success" name="command" value="switchmon"><?php echo $val['is_monitored'] ? "Stop mon" : "Start mon"; ?></button>
                                    <?php if($val['is_monitored'] == 0): ?>
                                        <button type="submit" class="btn btn-success" name="command" value="restart">Restart</button>
                                        <button type="submit" class="btn btn-success" name="command" value="stop">Stop</button>
                                    <?php endif; ?>
                                </div>
                            </form>


                        </td>
                        <!-- <td><input type="button" class="edit btn btn-primary" data-pk="<?php echo $val['id']; ?>" value="Edit"/></td> -->
                    </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
                </div>
            </div>
        </div>
    </div>
</div>
         <?php include 'elements/admin_footer.php';?>

