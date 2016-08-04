<?php @session_start();
    include_once 'common/session_check.php';
    require_once 'includes/config.php';
    require_once 'includes/connection.php';

    $sql_user = $db->query("SELECT `users_data`.`id`, `users_data`.`user_email`, `users_data`.`name`, `users_data`.`date_added` FROM `users_data` INNER JOIN `customer_user_relations` ON `users_data`.`id`=`customer_user_relations`.`user_id` AND `customer_user_relations`.`user_token`='".$db->real_escape_string($_SESSION['token'])."'");

    include_once 'common/head.php';
    include_once 'common/header.php';
?>
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
                <li><a href="#" class="active">Contact Tables</a> </li>
            </ul>
            <div class="row">
                <div class="col-md-12">
                    <a href="request.php?request=google_auth&code=<?php echo $_GET['code'];?>" class="btn btn-sm btn-danger" style="margin-bottom: 5px;"><i class="fa fa-fw fa-google"></i>Import Google Contacts </a>
                    <a href="" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#add_contact" style="margin-bottom: 5px;"><i class="fa fa-fw fa-plus"></i>Add manually</a>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <div class="grid simple ">
                        <div class="grid-title">
                            <h4>Contact <span class="semi-bold">tables</span></h4>
                        </div>
                        <div class="grid-body ">
                            <table class="table table-striped" id="example2">
                                <thead>
                                    <tr>
                                        <th>User id</th>
                                        <th>Name</th>
                                        <th>Email id</th>
                                        <th>Subscription Ddate</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                 <tbody>
                                <?php
                                while ($user = $sql_user->fetch_assoc()) { ?>
                                    <tr>
                                        <td><?php echo $user['id'];?></td>
                                        <td><?php echo (empty($user['name'])? 'Not assign':$user['name']);?></td>
                                        <td><?php echo $user['user_email'];?></td>
                                        <td><?php echo $user['date_added'];?></td>
                                        <td><a href="request.php?request=del_cus&cus_id=<?php echo $user['id'];?>" class="btn btn-warning btn-xs btn_user_remove"  onclick="return confirm('Are you sure to Delete?');"><i class="fa fa-times"></i></a></td>
                                    </tr>
                                <?php }?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="addNewRow"></div>
    </div>
</div>
<?php include_once 'common/script.php'; ?>
<div class="modal fade" id="add_contact" tabindex="-1" role="dialog" aria-labelledby="add_contact" aria-hidden="true">
        <div class="modal-dialog" style="z-index:1200;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Add New Contact</h4>
                </div>
                <div class="modal-body">
                    <div id="manual_add_message"></div>
                    <form id="add_contact_manually_form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Name:</label>
                            <input type="text" class="form-control" name="contact_name" id="contact_name" placeholder="enter Name of the contact">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Email ID:</label>
                            <input type="text" class="form-control" name="contact_mail" id="contact_mail" placeholder="enter email of the contact">
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"> Save </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>