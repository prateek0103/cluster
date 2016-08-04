
<?php @session_start();
//print_r($_SESSION);
require_once 'includes/config.php';
require_once 'includes/connection.php';
if(!$config['SITE_STATUS'])
{
    header('Location: ../app/offline.html');
    die();
}
ob_end_flush();
global $db;
$sql=$db->query("SELECT * FROM `clouds_data` WHERE `user_token`='".$db->real_escape_string($_SESSION['token'])."'");
//echo "SELECT * FROM `clouds_data` WHERE `cloud_id` = (SELECT `cloud_id` FROM `shared_tunnel` WHERE `shared_with`=".$_SESSION['user_id'].")";die;
$sql1=$db->query("SELECT * FROM `clouds_data` WHERE `cloud_id` IN (SELECT `cloud_id` FROM `shared_tunnel` WHERE `shared_with`=".$_SESSION['user_id'].")");

$sql2=$db->query("SELECT * FROM `customers_data` WHERE `token`='".$db->real_escape_string($_SESSION['token'])."'");

$sql_point=$db->query("SELECT `settings_value` FROM `settings` WHERE `settings_name`='cast_to_point'"); ?>

<body class="grey">
<div class="header navbar navbar-inverse ">
    <div class="navbar-inner">
        <div class="header-seperation">
            <ul class="nav pull-left notifcation-center visible-xs visible-sm">
                <li class="dropdown">
                    <a href="#main-menu" data-webarch="toggle-left-side">
                        <div class="iconset top-menu-toggle-white"></div>
                    </a>
                </li>
            </ul>
            <a href="">
                <img src="assets/img/logo.png" class="logo" alt="Demovpn" width="106" height="21"/>
            </a>
        </div>

        <div class="header-quick-nav">
            <div class="pull-left">
                <ul class="nav quick-section">
                    <li class="quicklinks" style="display:none;">
                        <a href="javascript:void(0);" class="" id="layout-condensed-toggle">
                            <div class="iconset top-menu-toggle-dark"><i class="fa fa-bars"></i></div>
                        </a>
                    </li>
                </ul>
                <ul class="nav quick-section">
                    <!-- <li class="quicklinks">
                        <a href="#" class="">
                        <div class="iconset top-reload"></div>
                        </a>
                    </li> -->
                    <!-- <li class="quicklinks">
                        <a href="#" class="">
                            <div class="iconset top-tiles"></div>
                        </a>
                    </li> -->
                    <li class="m-r-10 input-prepend inside search-form no-boarder">
                        <span class="add-on"> <span class=" top-search"></span></span>
                        <input name="" type="text" class="no-boarder " placeholder="Search Dashboard" style="width:250px;">
                    </li>
                </ul>
            </div>

        <div class="pull-right">
                <ul class="nav quick-section ">
                    <li class="quicklinks">
                        <a data-toggle="dropdown" class="dropdown-toggle  pull-right " href="#" id="user-options">
                            <span style="margin-right:5px;">
                                <img class="avatar-view img_upload" src="" data-name="<?php echo $_SESSION['uname'][0] ?>" alt="<?php echo $_SESSION['uname'][0] ?>" style="height:27px;"/>
                            </span>
                        </a>
                        <ul class="dropdown-menu  pull-right" role="menu" aria-labelledby="user-options">
                            <li>
                                <div style="margin-top:5px; margin-left:5px"><?php echo $_SESSION['email'] ?></div>
                                <a href="request.php?request=acc_logout"><i class="fa fa-power-off"></i>&nbsp;&nbsp;Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        <div class="pull-right amount_div">
            <div class="show_div">
                <?php
                    $row1 = $sql2->fetch_assoc();
                    $point = $sql_point->fetch_assoc();
                ?>
                    <b class="show_div_b" data-p="<?php echo $point['settings_value']; ?>">Available Points: <?php echo round($row1['Cash_amount'], 2) * $point['settings_value'] ?></b>
            </div>
            <i class="fa fa-eye-slash hide_amount" title="Hide"></i>
        </div>

         <div class="pull-right amount_div1" style="display:none">
            <i class="fa fa-eye show_amount" title="Show"></i>
        </div>
       </div>
    </div>
</div>

<div class="page-container row-fluid">
<div class="page-sidebar " id="main-menu">
    <div class="page-sidebar-wrapper scrollbar-dynamic" id="main-menu-wrapper">
        <ul>
            <li> <a href="contacts.php"> <i class="fa fa fa-group"></i> <span class="title">Contacts</span>  </a>
              
            </li>
            <li> <a href="profile.php"> <i class="fa fa fa-user"></i> <span class="title">Profile</span> </a> 
               
            </li>
            <li> <a href="billing.php"> <i class="fa fa fa-dollar"></i> <span class="title">Billing</span> </a> 
                
            </li>
            <li> <a href="javascript:;"> <i class="fa fa fa-cloud"></i> <span class="title">Connectivity manager</span> <span class=" arrow"></span> </a>
                <ul class="sub-menu">
                    <li> <a href="javascript:;"> <span class="title">Personal&nbsp;&nbsp;&nbsp;(owner) </span> <span class=" arrow"></span> </a>
                    <ul class="sub-menu">
                        <?php while($row = $sql->fetch_assoc()) { ?>
                            <li> <a href="tunnels.php?cloud=<?php echo $row['cloud_id']; ?>" class="personal_cloud" onclick=tunnel_redirect(<?php echo $row['cloud_id']; ?>) cloud-id="<?php echo $row['cloud_id']; ?>"><?php echo $row['cloud_name']; ?></a> </li>
                        <?php } ?>
                    </ul>
                    </li>

                    <li> <a href="javascript:;"> <span class="title">Shared</span> <span class=" arrow"></span> </a>
                    <ul class="sub-menu">
                    <?php while($row1 = $sql1->fetch_assoc()) { ?>
                            <li> <a href="shared_tunnel.php?cloud=<?php echo $row1['cloud_id']; ?>" class="personal_cloud" onclick=tunnel_redirect(<?php echo $row1['cloud_id']; ?>) cloud-id="<?php echo $row1['cloud_id']; ?>"><?php echo $row1['cloud_name']; ?></a> </li>
                        <?php } ?>
                    </ul>
                    </li>
                    <li> <a href="javascript:;" data-toggle="modal" data-target="#add_cloud"> Create cloud </a> </li>
                </ul>
            </li>
            <li class="hidden-lg hidden-md hidden-xs" id="more-widgets"> <a href="javascript:;"> <i class="fa fa-plus"></i></a>
            <ul class="sub-menu"></ul>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
</div>

<div class="modal fade" id="add_cloud" tabindex="-1" role="dialog" aria-labelledby="add_cloud" aria-hidden="true">
        <div class="modal-dialog" style="z-index:1200">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Add New Cloud</h4>
                </div>
                <form id="add_cloud_form">
                <div class="modal-body">
                    <div class="alert alert-success" role="alert" id="manual_add_success_message" style="display: none;"></div>
                    <div class="alert alert-danger" role="alert" id="manual_add_error_message" style="display: none;"></div>

                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Cloud Name:</label>
                            <input type="text" class="form-control" name="cloud_name" id="cloud_name" placeholder="enter cloud name">
                        </div>
                        <input type="hidden" name="cloud_email" id="cloud_email" value="<?php echo $_SESSION['email'] ?>">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"> Save </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>