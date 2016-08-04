<?php @session_start();
include_once 'common/session_check.php';
require_once 'includes/config.php';
require_once 'includes/connection.php';
$sql1 = $db->query("SELECT * FROM `customers_data` WHERE `customer_id`='".$db->real_escape_string($_SESSION['user_id'])."'");
include_once 'common/head.php';
include_once 'common/header.php';?>
<a href="#" class="scrollup">Scroll</a>
    <div class="page-content">
        <div id="wrapper">
        <!-- Navigation -->
        <div id="page-wrapper">
            <div class="container-fluid" style="margin-top: 100px;">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                    <?php
                        while($row1=$sql1->fetch_assoc()){
                            $cust_id=$row1['customer_id'];
                        }
                    ?>
                    </div>
                </div>
                <?php
                if(isset($_SESSION['msg_stripe_s'])){
                    ?>
                    <div class="alert alert-success" role="alert">
                    <?php
                            echo $_SESSION['msg_stripe_s'];
                            unset($_SESSION['msg_stripe_s']);
                        ?>
                   </div>
                   <?php
                }

                if(isset($_SESSION['msg_stripe_u'])){
                    ?>
                    <div class="alert alert-danger" role="alert">
                    <?php
                            echo $_SESSION['msg_stripe_u'];
                            unset($_SESSION['msg_stripe_u']);
                        ?>
                   </div>
                   <?php
                }

                if(isset($_SESSION['msg_stripe_c'])){
                    ?>
                    <div class="alert alert-danger" role="alert">
                    <?php
                            echo $_SESSION['msg_stripe_c'];
                            unset($_SESSION['msg_stripe_c']);
                        ?>
                   </div>
                   <?php
                }

                if(isset($_SESSION['msg_paypal_s'])){
                    ?>
                    <div class="alert alert-success" role="alert">
                    <?php
                            echo $_SESSION['msg_paypal_s'];
                            unset($_SESSION['msg_paypal_s']);
                        ?>
                   </div>
                   <?php
                }

                if(isset($_SESSION['msg_paypal_u'])){
                    ?>
                    <div class="alert alert-danger" role="alert">
                    <?php
                            echo $_SESSION['msg_paypal_u'];
                            unset($_SESSION['msg_paypal_u']);
                        ?>
                   </div>
                   <?php
                }

                if(isset($_SESSION['voucher_s_msg'])){
                    ?>
                    <div class="alert alert-success" role="alert">
                    <?php
                            echo $_SESSION['voucher_s_msg'];
                            unset($_SESSION['voucher_s_msg']);
                        ?>
                   </div>
                   <?php
                }

                if(isset($_SESSION['voucher_us_msg'])){
                    ?>
                    <div class="alert alert-danger" role="alert">
                    <?php
                            echo $_SESSION['voucher_us_msg'];
                            unset($_SESSION['voucher_us_msg']);
                        ?>
                   </div>
                   <?php
                }

                ?>
                <!-- <div class="col-lg-4">
                    <div class="bg_white min_height">
                <div class="row">
                <div class="col-lg-12">
                <div id="edtplan-response-message"></div>
                    <h3 class="pr_heading">Choose a plan</h3>
                    <?php $sql2 = $db->query("SELECT * FROM plans inner join customers_data on `plans`.`id` = `customers_data`.`plan_id` WHERE `customer_id`='".$db->real_escape_string($_SESSION['user_id'])."'");
                    if($sql2->num_rows>0){
                        while($row2=$sql2->fetch_assoc()){
                            if($row2['plan_id']==1){
                                ?>
                                 <div class="row">
                                <div class="col-lg-6"><input type="radio" class="plan" name="radio" id="radio1" value="1" checked="checked">Individual Plan</div>
                                <div class="col-lg-6"><input type="radio" class="plan" name="radio" id="radio2" value="2">Business Plan</div></div>
                    <?php
                            }else{
                                ?>
                                 <div class="row">
                                <div class="col-lg-6"><input type="radio" class="plan" name="radio" id="radio1" value="1">Individual Plan</div>
                                <div class="col-lg-6"><input type="radio" class="plan" name="radio" id="radio2" value="2" checked="checked">Business Plan</div></div>
                                <?php
                            }
                        }
                    }else{
                            ?>
                            <div class="row">
                            <div class="col-lg-6"><input type="radio" class="plan" id="radio1" name="radio" value="1">Individual Plan</div>
                            <div class="col-lg-6"><input type="radio" class="plan" id="radio2" name="radio" value="2">Business Plan</div>
                        </div>
                            <?php }?>

                    <div class="col-lg-12" style="margin-top:10px;"><a class="btn btn-primary btn-plan-save" value="<?php echo $_SESSION['user_id'];?>">Save</a></div>
                </div>
                </div>
            </div>
                </div> -->

                 <div class="col-lg-6">
                    <div class="bg_white min_height">
                        <div class="row">
                        <div class="col-lg-12">
                            <h3 class="pr_heading">Recharge Your Account</h3>
                            <form action="request.php?request=redirect_paypal" method="post">
                                <div class="form-group" style="position:relative;">
                                    <input type="text" name="amount" class="txt_amount form-control" id="" value="200" placeholder="Amount" style="padding-left: 33px !important;"><span class="doller">$</span>
                                </div>
                            <button class="btn btn-primary" type="submit">Pay with Paypal</button>
                            <button class="btn btn-primary" id="customButton">Pay with Stripe</button>
                            </form>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="bg_white min_height">
                        <div class="row">
                        <div class="col-lg-12">
                            <h3 class="pr_heading">Apply your voucher here</h3>
                            <a class="btn btn-primary btn-xm" data-toggle="modal" data-target="#check_voucher"> <i class="fa fa-fw fa-plus"></i> Voucher apply here </a>
                        </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12"  style="margin-top:30px;">
                <form action="" method="POST">
                  <script
                    src="https://checkout.stripe.com/checkout.js"
                    data-key="pk_test_kyZ1HJ1r4nMnmzFTbbq5xe2V"
                    data-amount="2000"
                    data-name="Demo Site"
                    data-description="2 widgets ($20.00)"
                    data-image="/128x128.png">
                  </script>
                </form>
                <script src="https://checkout.stripe.com/checkout.js"></script>
                <!-- undo -->
                </div>

                <div class="col-lg-12">
                    <div class="bg_white min_height">
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="alert-msg" class="alert" role="alert" style="display: none;"></div>
                            </div>
                            <div class="col-lg-12">
                                <h3 class="pr_heading">Send your friend some points</h3>
                                <form action="" id="send_point_form" method="post">
                                    <div class="form-group" style="position:relative;">
                                    <input type="hidden" name="id" value="<?php echo $_SESSION['user_id'];?>">
                                    <input type="text" name="point" class="form-control" value="" placeholder="Give points" style="padding-left: 40px !important;margin-bottom: 8px;">
                                    <span class="doller"><i class="fa fa-fw fa-money"></i></span>

                                    <input type="email" name="email" class="form-control" value="" placeholder="Email id" style="padding-left: 40px !important;margin-bottom: 8px;">
                                    <span class="email-p"><i class="fa fa-fw fa-envelope-o"></i></span>
                                    </div>
                                    <button class="btn btn-primary" id="send_point_btn" type="button">Send</button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
             <div class="clearfix"></div>
        </div>
    </div>
  </div>
</div>

<?php include_once 'common/script.php'; ?>

    <div class="modal fade" id="check_voucher" tabindex="-1" role="dialog" aria-labelledby="check_voucher" aria-hidden="true">
        <div class="modal-dialog" style="z-index:1200">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">Voucher apply here</h4>
                </div>
                <div class="modal-body">
                        <div class="alert alert-success" role="alert" id="manual_voucher_success_message" style="display: none;">
                        </div>
                       <div class="alert alert-danger" role="alert" id="manual_voucher_error_message" style="display: none;">

                        </div>
                    <form id="add_voucher_form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Voucher Number:</label>
                            <input type="text" name="voucher" id="voucher" placeholder="Enter Voucher Number" ><br>
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
<script src="https://checkout.stripe.com/checkout.js"></script>
<script>
    var handler = StripeCheckout.configure({
        key: 'pk_test_kyZ1HJ1r4nMnmzFTbbq5xe2V',
        image: '/img/documentation/checkout/marketplace.png',
        token: function(token) {
          // Use the token to create the charge with a server-side script.
          // You can access the token ID with `token.id`
          var token_id=token.id;
          var token_email=token.email;
          var amount=$('.txt_amount').val()*100;
          window.location.href="request.php?request=stripe&token_id="+token_id+"&email="+token_email+"&amount="+amount;
        }
      });
</script>


