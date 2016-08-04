<?php include 'elements/admin_header.php';

if(!empty($_POST)){
    if(isset($_POST['plan'])){
        $db->query("UPDATE `plans` SET `plans`='".$_POST['plan']."' WHERE `id`=".$_POST['id']);
    }
    if($db->query("UPDATE `package_data` SET `tunnel`='".$_POST['tcost']."', `gateway`='".$_POST['gcost']."', `bidirection`='".$_POST['bcost']."', `realip`=".$_POST['rcost']." WHERE `plan_id`='".$_POST['id']."'")){
        $check=1;
    }
}
?>

 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>FooTable</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">Package cost info</a>
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
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
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
                <div id="def_msg"></div>
                    <form method="post" action="" role="form">
                        <div class="form-group">
                                <label for="pwd">1$ :</label>
                                <input type="text" required="" placeholder="Enter default cash" name="dcash" id="" class="form-control">
                        </div>

                        <button class="btn btn-success" type="button" id="set_point_val">Submit</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5></h5>

                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">
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
                <div id="def_msg"></div>
                    <form method="post" action="" role="form">
                        <div class="form-group">
                                <label for="pwd">Default cash:</label>
                                <input type="text" required="" placeholder="Enter default cash" name="dcash" id="" class="form-control">
                        </div>

                        <button class="btn btn-success" type="button" id="set_def_cash">Submit</button>
                    </form>
                </div>
            </div>
        </div>
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
                                <th>Plan</th>
                                <th>Tunnel</th>
                                <th>Gateway</th>
                                <th data-hide="all">Bidirection</th>
                                <th data-hide="all">Real IP</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                                    <?php $user_query=$db->query("SELECT * FROM `package_data` JOIN `plans` ON `plans`.`id`=`package_data`.`plan_id`");
                                   while($user_query_array=$user_query->fetch_assoc()){ ?>

                                    <tr id="plan_tr_<?php echo $user_query_array['plan_id'] ?>">
                                    <td><?php echo $user_query_array['plans'] ?></td>
                                        <td><?php echo $user_query_array['tunnel'] ?></td>
                                        <td><?php echo $user_query_array['gateway'] ?></td>
                                        <td><?php echo $user_query_array['bidirection'] ?></td>
                                        <td><?php echo $user_query_array['realip'] ?></td>
                                        <td>
                                            <a href="javascript:void(0);" class="edit_plan" data-id="<?php echo $user_query_array['plan_id'] ?>"><i class="fa fa-fw fa-pencil-square-o"></i></a>
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
                              <label for="email">Plan name:</label>
                              <input type="text" class="form-control" id="plan" name="plan" placeholder="Enter tunnel cost" required>
                              <label for="email">Tunnel cost:</label>
                              <input type="text" class="form-control" id="tcost" name="tcost" placeholder="Enter tunnel cost" required>
                            </div>
                            <div class="form-group">
                              <label for="pwd">Gateway cost:</label>
                              <input type="text" class="form-control" id="gcost" name="gcost" placeholder="Enter gateway cost" required>
                            </div>
                            <input type="hidden" class="form-control" id="pid" name="id">
                            <div class="form-group">
                              <label for="pwd">Bidirection cost:</label>
                              <input type="text" class="form-control" id="bcost" name="bcost" placeholder="Enter bidirection cost" required>
                            </div>
                            <div class="form-group">
                              <label for="pwd">Realip cost:</label>
                              <input type="text" class="form-control" id="rcost" name="rcost" placeholder="Enter realip cost" required>
                            </div>
                            <button type="submit" class="btn btn-success">Update</button>
                          </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
         <?php include 'elements/admin_footer.php';?>

