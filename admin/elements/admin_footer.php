
            <!-- </div>
        </div> -->
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="../assets/plugins/bootstrapv3/js/bootstrap.min.js" type="text/javascript"></script>

    <script src="../assets/plugins/pace/pace.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-block-ui/jqueryblockui.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-numberAnimate/jquery.animateNumbers.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>

    <script src="../webarch/js/webarch.js" type="text/javascript"></script>
    <script src="../assets/js/chat.js" type="text/javascript"></script>

    <script src="../assets/plugins/bootstrap-select2/select2.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-datatable/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../assets/plugins/jquery-datatable/extra/js/dataTables.tableTools.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../assets/plugins/datatables-responsive/js/datatables.responsive.js"></script>
    <script type="text/javascript" src="../assets/plugins/datatables-responsive/js/lodash.min.js"></script>
    <script src="../assets/js/datatables.js" type="text/javascript"></script>

    <script src="../assets/js/jquery.notify.min.js" type="text/javascript"></script>
    <!-- <script src="../assets/js/custom.js" type="text/javascript"></script> -->

</body>
</html>
<script type="text/javascript">
         $(document).ready(function(){
            $("body").on("click", ".active_user", function(){
                var id=$(this).attr("data-id");
                var val=$(this).attr("data-val");
                var ths=$(this);
                $.ajax({
                    url:"../request.php?request=active_user_by_admin&id="+id+"&val="+val,
                    success:function(resp){
                        if(resp==1){
                            if(val==1){
                                ths.attr("data-val", 0)
                                ths.html('<i class="fa fa-fw fa-circle text-navy"></i>');
                            }else if(val==0){
                                ths.attr("data-val", 1)
                                ths.html('<i class="fa fa-fw fa-circle text-danger"></i>');
                            }
                        }
                    }
                });
            });

            $("#remote_id").blur(function(){
                if($(this).val()!=""){
                    if(ipv4addr($(this).val())==false){
                        alert("Enter valid ip address, e.g. '192.168.0.1'");
                        $(this).val("");
                    }
                 }
            });

            setTimeout(function(){$("#msg").css("display", "none")}, 5000);

            $("#test").click(function(){
                var ip=$("#remote_id").val();
                var uname=$("#username").val();
                var pass=$("#password").val();
                if(ip!="" || uname!="" || pass!=""){
                    $.ajax({
                        url:'../request.php?request=test_remote',
                        type:"POST",
                        data:{"ip":ip, "uname": uname, "pass": pass},
                        success:function(resp){
                            if(resp==1){
                                alert("Connection OK");
                            }else{
                                alert("Connection failed, please check");
                            }
                        }
                    });
                }else{
                    alert("Fill all field");
                }
            });

            $("#testall").click(function(){
                $.ajax({
                    url:'../request.php?request=test_all_remote',
                    success:function(resp){
                        res=$.parseJSON(resp);
                        $.each(res, function(key, value){
                            if(value.result==1){
                                $(".remote_list_"+key).css("background-color", "#c6ff7f");
                                $(".stat_"+key).html('<i class="fa fa-circle" style="color:#449D44;margin-left:10px;"></i>');
                            }else if(value.result==0){
                                $(".remote_list_"+key).css("background-color", "#FF9589");
                                $(".stat_"+key).html('<i class="fa fa-circle" style="color:#D6465F;margin-left:10px;"></i>');
                            }
                        });
                    }
                });
            });

            setInterval(function(){
                $.ajax({
                    url:'../request.php?request=test_all_remote',
                    success:function(resp){
                        res=$.parseJSON(resp);
                        $.each(res, function(key, value){
                            if(value.result==1){
                                $(".remote_list_"+key).css("background-color", "#c6ff7f");
                                $(".stat_"+key).html('<i class="fa fa-circle" style="color:#449D44;margin-left:10px;"></i>');
                            }else if(value.result==0){
                                $(".remote_list_"+key).css("background-color", "#FF9589");
                                $(".stat_"+key).html('<i class="fa fa-circle" style="color:#D6465F;margin-left:10px;"></i>');
                            }
                        });
                    }
                });
            }, 40000);

            $("body").on("click", ".status", function(){
                var val = $(this).attr("data");
                var id = $(this).attr("data-pk");
                var chk=$(this);
                $.ajax({
                    url:'../request.php?request=remote_server_status_change',
                    type:"POST",
                    data:{"id": id, "val": val},
                    success:function(resp){
                        if(resp==1){
                            if(val==1){
                                chk.attr("data", "0");
                                chk.html('<i class="fa fa-circle" style="color:#449D44;margin-left:10px;"></i>');
                            }else if(val==0){
                                chk.attr("data", "1");
                                chk.html('<i class="fa fa-circle" style="color:#D6465F;margin-left:10px;"></i>');
                            }
                        }
                    }
                });
            });

            $("body").on("click", ".edit", function(){
                var id=$(this).attr("data-pk");
                //$('option').removeAttr("selected");
                $.ajax({
                    url:'../request.php?request=remote_server_edit',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          val=$.parseJSON(resp);
                          $("#remote_id").val(val.remote_ip);
                          $("#username").val(val.server_uname);
                          $("#password").val(val.server_pass);
                          $("#sname").val(val.server_name);
                          $("#email").val(val.email);
                          // $("#"+val.remote_group).attr("selected", "selected");
                          // $("#"+val.remote_group).trigger("click");
                          $("#sel1").val(val.remote_group);
                          $('html, body').animate({
                              scrollTop: $("#scroll_div").offset().top
                          }, 1000);
                      }
                });
            });

            $("body").on("click", ".edit_user", function(){
                var id=$(this).attr("data-id");
                $.ajax({
                    url:'../request.php?request=cust_edit',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          val=$.parseJSON(resp);
                          $("#cname").val(val.name);
                          $("#cphone").val(val.phone);
                          $("#ccash").val(val.Cash_amount);
                          $("#cid").val(val.customer_id);
                          if(val.is_admin==1){
                            $("#is_admin_1").prop('checked', true);
                          } else if(val.is_admin==0){
                            $("#is_admin_0").prop('checked', true);
                          }
                          $('html, body').animate({
                              scrollTop: $("#scroll_div").offset().top
                          }, 1000);
                      }
                });
            });

            $("body").on("click", ".edit_plan", function(){
                var id=$(this).attr("data-id");
                $.ajax({
                    url:'../request.php?request=plan_edit',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          val=$.parseJSON(resp);
                          $("#plan").val(val.plans);
                          $("#tcost").val(val.tunnel);
                          $("#gcost").val(val.gateway);
                          $("#bcost").val(val.bidirection);
                          $("#rcost").val(val.realip);
                          $("#pid").val(val.plan_id);
                          $('html, body').animate({
                              scrollTop: $("#scroll_div").offset().top
                          }, 1000);
                      }
                });
            });

            $("body").on("click", ".edit_voucher", function(){
                var id=$(this).attr("data-id");
                $.ajax({
                    url:'../request.php?request=voucher_edit',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          val=$.parseJSON(resp);
                          $("#vno").val(val.voucher_no);
                          $("#amount").val(val.amount);
                          $("#vid").val(val.id);
                          $("#btn_submin").val(0);
                          $("#btn_submin").html("Update");
                          if(val.is_active==1){
                            $("#is_active_1").prop('checked', true);
                          } else if(val.is_active==0){
                            $("#is_active_0").prop('checked', true);
                          }
                          $('html, body').animate({
                              scrollTop: $("#scroll_div").offset().top
                          }, 1000);
                      }
                });
            });

            $("#add_voucher").click(function(){
              $("#btn_submin").val(1);
              $("#btn_submin").html("Submit");
              $('html, body').animate({
                  scrollTop: $("#scroll_div").offset().top
              }, 1000);
            });

            $("#add_real").click(function(){
              $('html, body').animate({
                  scrollTop: $("#scroll_div").offset().top
              }, 1000);
            });

            $("#add_vpn").click(function(){
              $('html, body').animate({
                  scrollTop: $("#scroll_div").offset().top
              }, 1000);
            });

            $("body").on("click", ".delete", function(){
                var id=$(this).attr("data-pk");
                $.ajax({
                    url:'../request.php?request=remote_server_delete',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          if(resp==1){
                              $(".remote_list_"+id).remove();
                          }
                      }
                });
            });

            $("body").on("click", ".delete_user", function(){
                var id=$(this).attr("data-pk");
                $.ajax({
                    url:'../request.php?request=delete_user_by_admin',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          if(resp==1){
                              $(".cust_tr_"+id).remove();
                          }
                      }
                });
            });

            $("body").on("click", ".delete_voucher", function(){
                var id=$(this).attr("data-id");
                $.ajax({
                    url:'../request.php?request=delete_voucher_by_admin',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          if(resp==1){
                              $(".v_tr_"+id).remove();
                          }
                      }
                });
            });

            $("body").on("click", ".delete_vpn", function(){
                var id=$(this).attr("data-id");
                $.ajax({
                    url:'../request.php?request=delete_vpn_by_admin',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          if(resp==1){
                              location.reload();
                          }
                      }
                });
            });

            $("body").on("click", ".delete_real", function(){
                var id=$(this).attr("data-id");
                $.ajax({
                    url:'../request.php?request=delete_real_by_admin',
                    type:"POST",
                    data:{"id": id},
                      success:function(resp){
                          if(resp==1){
                              location.reload();
                          }
                      }
                });
            });

            $('#reg-form').validate({
              rules: {
                  name: {
                      required: true,
                  },
                  email: {
                      required: true,
                      email: true
                  },

                  password: {
                      required: true,
                      minlength: 6
                  },
                  cpassword: {
                      required: true,
                      equalTo: "#password"
                  }
              },
              messages: {
                  email: "Please enter a valid email address",
                  password: {
                      required: "Please provide a password",
                      minlength: "Your password must be at least 6 characters long"
                  },
                  cpassword: {
                      required: "Please provide a password",
                      equalTo: "CPassword not matched with "
                  }
              },
              submitHandler: function(form) {
                  $('#reg-form-submit-btn').attr('disabled', 'disabled');
                  $.ajax({
                      url : "../request.php?request=user_register",
                      type : "POST",
                      data : $("#reg-form").serialize(),
                      success : function(resp){
                          alert(resp);
                          $('#reg-form-submit-btn').removeAttr('disabled');
                          $('#reg-response-message').show();
                          try {
                              var result = $.parseJSON(resp);
                              if (result.status == 1) {
                                  $('#reg-response-message').html(result.data);
                                  $(form)[0].reset();
                                  setTimeout(function () {
                                      location.reload();
                                  }, 2000);
                              }
                              else if (result.status == 0) {
                                  $('#reg-response-message').html(result.data);
                              }else if (result.status == 2) {
                                  $('#reg-response-message').html(result.data);
                                  $(form)[0].reset();
                              }
                              else {
                                  $('#reg-response-message').html("can not process your request, try again");
                              }
                          }
                          catch (e){
                              $('#reg-response-message').html("unexpected error occurred, try again");
                          }
                      },
                      error : function(){
                      }
                  });
                  return false;
              }
          });

          $("#add_text").click(function(){
              var html="";
              html+='<div class="form-group">';
                  html+='<input type="text" class="form-control" id="" name="vpn[]" placeholder="Enter vpn ip" required>';
                  html+='<i class="fa fa-minus-square al" id=""></i>';
              html+='</div>';
              $("#multiple_vpn_form").append(html);
          });

          $("#add_text_real").click(function(){
              var html="";
              html+='<div class="form-group">';
                  html+='<input type="text" class="form-control" id="" name="real[]" placeholder="Enter real ip" required>';
                  html+='<i class="fa fa-minus-square al" id=""></i>';
              html+='</div>';
              $("#multiple_real_form").append(html);
          });

          $("body").on("click", ".al", function(){
              $(this).closest(".form-group").remove();
          });

          $("#set_def_cash").click(function(){
              var data = $(this).closest("form").serialize();
              $.ajax({
                  url:"../request.php?request=set_def_cash",
                  data:data,
                  type:"POST",
                  success:function(resp){
                      if(resp){
                          $("#def_msg").html("<div class='alert alert-success'>Default cash changed successfully</div>");
                          setTimeout(function(){$("#def_msg").html("");}, 5000);
                      }
                  }
              });
          });

          $("#set_point_val").click(function(){
              var data = $(this).closest("form").serialize();
              $.ajax({
                  url:"../request.php?request=set_point_val",
                  data:data,
                  type:"POST",
                  success:function(resp){
                      if(resp){
                          $("#def_msg").html("<div class='alert alert-success'>Points limit changed successfully</div>");
                          setTimeout(function(){$("#def_msg").html("");}, 5000);
                      }
                  }
              });
          });

            /*$(".login_as_user").click(function(){
              var id=$(this).attr("data-id");
              $.ajax({
                url:"../request.php?request=login_as_user",
                data:{id:id},
                type:"POST",
                success:function(resp){
                  data=$.parseJSON(resp);
                  if(data.status==1){
                    window.location="contacts.php";
                  }
                }
              });
            });*/

            function ipv4addr(value) {
              var ip = /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/;
              var res;
              if (value.match(ip)) {
                 arr=[];
                  arr=value.split('.');
                  //alert(arr);
                      if(parseInt(arr[0]) <= 255){
                          if(parseInt(arr[1]) <= 255){
                              if(parseInt(arr[2]) <= 255){
                                  if(parseInt(arr[3]) <= 255){
                                      return true;
                                  }
                              }
                          }
                      }else{
                          return false;
                      }
              }
              else {
                 return false;
              }
          }
     });
     </script>