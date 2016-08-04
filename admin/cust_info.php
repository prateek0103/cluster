<?php include 'elements/admin_header.php';

if(!empty($_POST)){
    if($db->query("UPDATE `customers_data` SET `name`='".$_POST['name']."', `phone`='".$_POST['phone']."', `Cash_amount`='".$_POST['cash']."', `is_admin`=".$_POST['is_admin']." WHERE `customer_id`='".$_POST['id']."'")){
        $check=1;
    }
}
?>

 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>FooTable</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">Customer info</a>
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

                    <div id="" style=" min-height: 581px;">

                    <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone</th>
                            <th data-hide="all">Email</th>
                            <th data-hide="all">Cash Amount</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                                <?php $user_query=$db->query("SELECT * FROM `customers_data`");
                               while($user_query_array=$user_query->fetch_assoc()){ ?>

                                <tr id="cust_tr_<?php echo $user_query_array['customer_id'] ?>">
                                    <td><?php echo $user_query_array['name'] ?></td>
                                    <td><?php echo $user_query_array['phone'] ?></td>
                                    <td><?php echo $user_query_array['email'] ?></td>
                                    <td><?php echo $user_query_array['Cash_amount'] ?></td>
                                    <td>
                                        <a href="../request.php?request=login_as_user&id=<?php echo $user_query_array['customer_id'] ?>" class="login_as_user" target="_blank"><i class="fa fa-fw fa-sign-in"></i></a>
                                        <a href="javascript:void(0);" class="edit_user" data-id="<?php echo $user_query_array['customer_id'] ?>"><i class="fa fa-fw fa-pencil-square-o"></i></a>
                                        <a href="javascript:void(0);" class="active_user" data-id="<?php echo $user_query_array['customer_id'] ?>" data-val=<?php echo ($user_query_array['is_active']==1?0:1) ?>><?php echo ($user_query_array['is_active']==1?'<i class="fa fa-fw fa-circle text-navy"></i>':'<i class="fa fa-fw fa-circle text-danger"></i>') ?></a>
                                        <a href="javascript:void(0);" class="delete_user" data-id="<?php echo $user_query_array['customer_id'] ?>"><i class="fa fa-fw fa-trash text-danger"></i></a>
                                    </td>
                                </tr>
                                <?php } ?>
                        </tbody>
                    </table>

                        <form role="form" action="" method="post">
                            <div class="form-group" id="scroll_div">
                            <?php if($check==1){
                                ?>
                                  <div id="msg" class="bg-success" style="padding:7px;mergin-top:5px;"><strong>Changes applied successfully</strong></div>
                                <?php
                              } ?>
                              <label for="email">Name:</label>
                              <input type="text" class="form-control" id="cname" name="name" placeholder="Enter customer name" required>
                            </div>
                            <div class="form-group">
                              <label for="pwd">Phone No.:</label>
                              <input type="text" class="form-control" id="cphone" name="phone" placeholder="Enter phone number" required>
                            </div>
                            <input type="hidden" class="form-control" id="cid" name="id">
                            <div class="form-group">
                              <label for="pwd">Cash amount:</label>
                              <input type="text" class="form-control" id="ccash" name="cash" placeholder="Enter password" required>
                            </div>
                            <div class="form-group">
                              <label for="pwd">Is admin:</label>
                              <input type="radio" class="" id="is_admin_1" value="1" name="is_admin" required>Yes
                              <input type="radio" class="" id="is_admin_0" value="0" name="is_admin" required>No
                            </div>
                            <!-- <button type="button" id="test" class="btn btn-primary">Test</button> -->
                            <button type="submit" class="btn btn-success">Update</button>
                          </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
         <?php include 'elements/admin_footer.php';?>

