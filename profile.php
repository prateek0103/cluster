<?php @session_start();
$get_cusid=$_SESSION['user_id'];
include_once 'common/session_check.php';
require_once 'includes/config.php';
require_once 'includes/connection.php';
include_once 'common/head.php';
include_once 'common/header.php';
$sql_user = $db->query("SELECT * FROM `customers_data` where `customer_id`='".$get_cusid."'");
$row = $sql_user->fetch_assoc(); ?>
<a href="#" class="scrollup">Scroll</a>
    <div class="page-content">
        <div id="portlet-config" class="modal hide">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"></button>
                <h3>Widget Settings</h3>
            </div>
            <div class="modal-body"> Widget settings form goes here </div>
        </div>
        <div class="clearfix"></div>
        <div class="content">
            <ul class="breadcrumb">
                <li>
                    <p>YOU ARE HERE</p>
                </li>
                <li><a href="#" class="active">Edit profile</a> </li>
            </ul>

            <div class="row">
              <div class="alert alert-success" role="alert" style=<?php echo (isset($_SESSION['msg'])?"display: block;":"display: none;"); ?>><?php echo $_SESSION['msg'] ?></div>
              <div class="col-lg-6">
                <div class="alert alert-success" role="alert" id="manual_add_success_message" style="display: none;"></div>
                <div class="alert alert-danger" role="alert" id="manual_add_error_message" style="display: none;"></div>
                <div id="edtprofile-response-message"></div>
                <h4 class="pr_heading">Edit your profile</h4>
                <form id="profile_pic_change" method="post" enctype="multipart/form-data">
                  <div id="crop-avatar-user">
                    <!-- <a href="javascript:void(0);"></a> -->
                    <div id="image_crop_div"><img class="avatar-view img_upload" src="" data-name="<?php echo $row['name'];?>" alt="<?php echo $row['name'];?>"/></div>
                    <input type="file" name="prof_img" id="profile_pic_change_btn"/>
                  </div>
                </form>
                <form id="profile_form" method="post">
                  <div class="col-lg-12">

                    <!-- <div id="crop-avatar-user">
                      <div id="image_crop_div"><img class="avatar-view img_upload" src="" data-name="<?php echo $row['name'];?>" alt="<?php echo $row['name'];?>"/></div>
                      <input type="file" name="prof_img"/>
                    </div> -->

                  </div>
                  <input type="hidden" name="get_cus_id" id="get_cus_id" value="<?php echo $get_cusid;?>">
                  <div class="col-lg-12">
                    <label for="ex3">Name: </label>
                    <input class="form-control" id="name" type="text" value="<?php echo $row['name'];?>" name="name">
                  </div>
                  <div class="col-lg-12">
                    <label for="ex3">Phone number: </label>
                    <input class="form-control" id="phone" type="text" value="<?php echo $row['phone'];?>" pattern= "[7-9]{1}[0-9]{9}" name="phone">
                  </div>
                  <div class="col-lg-12">
                    <label for="ex3">Your mail address: </label>
                    <input class="form-control" id="email" type="text" value="<?php echo $row['email'];?>" name="email" disabled>
                  </div>
                  <div class="col-lg-12">
                    <label for="ex3">Your Recovery Email address: </label>
                    <input class="form-control" id="remail" type="text" value="<?php echo $row['remail'];?>" name="reemail">
                  </div>

                  <div class="col-lg-12">
                  <a class="btn btn-primary btn-success btn-recovery" href="javascript:void(0)" id="btn-edit-profile">Save</a>
                  </div>
                </form>

              </div>
                <div class="col-lg-6">
                  <h4 class="pr_heading">Change your password</h4>
                  <div id="edtpass-response-message"></div>
                  <form id="change_password_form">
                    <div class="col-lg-12">
                      <label for="ex3">Old password: </label>
                      <input type="password" class="form-control" id="opassword" type="text" name="opassword">
                    </div>
                    <div class="col-lg-12">
                      <label for="ex3">New password: </label>
                      <input type="password" class="form-control" id="password" type="text" value="" name="password">
                    </div>
                    <div class="col-lg-12">
                      <label for="ex3">Confirm password: </label>
                      <input type="password" class="form-control" id="cfmPassword" type="text" name="cfmPassword" required>
                    </div>
                    <div class="col-lg-12">
                    <button type="submit" name="submit" value="Submit" class="btn btn-primary btn-success btn-cpassword" href="javascript:void(0)" id="btn-editpass-profile"/>Update Password</button>
                    </div>
                  </form>
              </div>
            </div>
        </div>

        <div class="addNewRow"></div>
    </div>
</div>
<?php include_once 'common/script.php'; ?>
</body>
<!-- Mirrored from revox.io/webarch/2.8/html/datatables.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 27 Dec 2015 14:41:03 GMT -->
</html>