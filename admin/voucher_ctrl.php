<?php include 'elements/admin_header.php';

if(!empty($_POST)){
    //echo "UPDATE `voucher` SET `voucher_no`='".$_POST['vno']."', `amount`='".$_POST['amount']."', `is_active`=".$_POST['is_active']." WHERE `id`=".$_POST['id'];die;
    if($_POST['submit']!=1){
        if($db->query("UPDATE `voucher` SET `voucher_no`='".$_POST['vno']."', `amount`='".$_POST['amount']."', `is_active`=".$_POST['is_active']." WHERE `id`=".$_POST['id'])){
            $check=1;
        }
    }else{
        if($db->query("INSERT INTO `voucher` SET `voucher_no`='".$_POST['vno']."', `amount`='".$_POST['amount']."', `is_active`=".$_POST['is_active'])){
            $check=2;
        }
    }
}
?>

 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>FooTable</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">Voucher info</a>
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
                    <a href="javascript:void(0);" id="add_voucher" class=""><i class="fa fa-fw fa-plus"></i>Create Voucher</a>
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
                    <?php if($check==1){
                        ?>
                          <div id="msg" class="bg-success" style="padding:7px;mergin-top:5px;"><strong>Changes applied successfully</strong></div>
                        <?php } else if($check==2){ ?>
                        <div id="msg" class="bg-success" style="padding:7px;mergin-top:5px;"><strong>Voucher created successfully</strong></div>
                        <?php } ?>
                    <div id="" style=" min-height: 581px;">

                    <table class="footable table table-stripped toggle-arrow-tiny" data-page-size="8">
                        <thead>
                        <tr>
                            <th>Voucher No.</th>
                            <th>Amount</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                                <?php $user_query=$db->query("SELECT * FROM `voucher`");
                               while($user_query_array=$user_query->fetch_assoc()){ ?>

                                <tr id="v_tr_<?php echo $user_query_array['id'] ?>">
                                    <td><?php echo $user_query_array['voucher_no'] ?></td>
                                    <td><?php echo $user_query_array['amount'] ?></td>
                                    <td>
                                        <a href="javascript:void(0);" class="edit_voucher" data-id="<?php echo $user_query_array['id'] ?>"><i class="fa fa-fw fa-pencil-square-o"></i></a>

                                        <a href="javascript:void(0);" class="delete_voucher" data-id="<?php echo $user_query_array['id'] ?>"><i class="fa fa-fw fa-trash text-danger"></i></a>
                                    </td>
                                </tr>
                                <?php } ?>
                        </tbody>
                    </table>

                        <form role="form" action="" method="post">
                            <div class="form-group" id="scroll_div">

                              <label for="email">Voucher name:</label>
                              <input type="text" class="form-control" id="vno" name="vno" placeholder="Enter customer name" required>
                            </div>
                            <div class="form-group">
                              <label for="pwd">Amount:</label>
                              <input type="text" class="form-control" id="amount" name="amount" placeholder="Enter phone number" required>
                            </div>
                            <input type="hidden" class="form-control" id="vid" name="id">
                            <div class="form-group">
                              <label for="pwd">Is active:</label>
                              <input type="radio" class="" id="is_active_1" value="1" name="is_active" required>Active
                              <input type="radio" class="" id="is_active_0" value="0" name="is_active" required>Inactive
                            </div>
                            <!-- <button type="button" id="test" class="btn btn-primary">Test</button> -->
                            <button type="submit" class="btn btn-success" id="btn_submin" name="submit" value="1">Create</button>
                          </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
         <?php include 'elements/admin_footer.php';?>

