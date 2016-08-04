$(document).ready(function(){
//alert($.parseJSON('{"status":1,"data":"Your request under process, please wait","message_type":"reply","type":"group_change","value":{"id":"10","value":"1 "}}'));
    var conn = new ab.Session('ws://192.81.220.57:8080',
        function() {
            conn.subscribe(token, function(topic, resp) {
                // This is the place to handle server pushes
                console.log(resp);
                var data=$.parseJSON(resp);
                //alert(data.type);
                console.log(data);
                if(data.free_field=="yes"){
                    $(".overlay_"+data.data.id).css("display", "none");
                }
                if(data.type=="edit_display"){
                    $(".display_"+data.value.id).editable('toggleDisabled');
                    $(".display_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                }else if(data.type=="change_location"){
                    $(".location_"+data.value.id).editable('toggleDisabled');
                    $(".location_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                }else if(data.type=="change_tunnel_to_server"){
                    $(".overlay_"+data.value.id).css("display", "block");
                }else if(data.type=="change_tunnel_to_client"){
                    $(".overlay_"+data.value.id).css("display", "block");
                }else if(data.type=="request_real_ip"){
                    $(".overlay_"+data.id).css("display", "block");
                }else if(data.type=="real_ip_status"){
                    $(".overlay_"+data.value.id).css("display", "block");
                }else if(data.type=="delete_tunnel"){
                    $(".delete_tunnel_"+data.value.id).addClass("inactive");
                    $(".delete_tunnel_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                    /*$(".tunnel_body_"+data.value).remove();*/
                }else if(data.type=="gateway_change_result"){
                    if(data.data.value==1){
                        $(".tunnel_gate_"+data.data.id).html('<i class="fa fa-check" style="color:#1D9E74"></i>');
                        $(".tunnel_gate_"+data.data.id).attr("data-val", data.data.value);
                        $(".tunnel_gate_"+data.data.id).attr("data-original-title", "Yes");
                    }else if(data.data.value==0){
                        $(".tunnel_gate_"+data.data.id).html('<i class="fa fa-times" style="color:#DA3838"></i>');
                        $(".tunnel_gate_"+data.data.id).attr("data-val", data.data.value);
                        $(".tunnel_gate_"+data.data.id).attr("data-original-title", "No");
                    }
                    notify_msg("success", "Gateway changed successfully");
                }else if(data.type=="bidirection_change_result"){
                    if(data.data.value==0){
                        $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left"><i class="fa fa-chevron-right"></i>');
                        $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
                        $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 1");
                    }else if(data.data.value==1){
                        $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>');
                        $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
                        $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 2");
                    }else if(data.data.value==2){
                        $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right"></i>');
                        $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
                        $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 3");
                    }else if(data.data.value==3){
                        $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>');
                        $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
                        $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 4");
                    }
                    notify_msg("success", "Bidirection mode changed successfully");
                }else if(data.type=="group_change_result"){
                    if(data.data.value in group_arr){
                        $(".tunnel_grp_"+data.data.id).attr('data-val',data.data.value);
                        $(".tunnel_grp_"+data.data.id).html(group_arr[data.data.value]);
                        $(".tunnel_grp_"+data.data.id).parent("div").closest('.tunnel_chk').addClass('tunnel_grp_chk_'+data.data.value);
                        $(".tunnel_grp_"+data.data.id).attr('data-original-title','Group '+group_arr[data.data.value]);
                    }else{
                        data.data.value=0;
                        if(data.data.value in group_arr){
                            $(".tunnel_grp_"+data.data.id).attr('data-val',data.data.value);
                            $(".tunnel_grp_"+data.data.id).html(group_arr[data.data.value]);
                            $(".tunnel_grp_"+data.data.id).parent("div").closest('.tunnel_chk').addClass('tunnel_grp_chk_'+data.data.value);
                            $(".tunnel_grp_"+data.data.id).attr('data-original-title','Group '+group_arr[data.data.value]);
                        }
                    }
                    notify_msg("success", "Group changed successfully");
                }else if(data.type=="internet_change_result"){
                    if(data.data.value==1){
                        $(".tunnel_internet_"+data.data.id).html('<i class="fa fa-fw fa-globe" style="color:#1D9E74"></i>');
                        $(".tunnel_internet_"+data.data.id).attr("data-val", data.data.value);
                    }else if(data.data.value==0){
                        $(".tunnel_internet_"+data.data.id).html('<i class="fa fa-fw fa-globe" style="color:#393333"></i>');
                        $(".tunnel_internet_"+data.data.id).attr("data-val", data.data.value);
                    }
                    notify_msg("success", "Internet changed successfully");
                }else if(data.type=="route_change_result"){
                    if(data.data.value==1){
                        $(".tunnel_route_"+data.data.id).html('<i class="fa fa-fw fa-road" style="color:#1D9E74"></i>');
                        $(".tunnel_route_"+data.data.id).attr("data-val", data.data.value);
                    }else if(data.data.value==0){
                        $(".tunnel_route_"+data.data.id).html('<i class="fa fa-fw fa-road" style="color:#393333"></i>');
                        $(".tunnel_route_"+data.data.id).attr("data-val", data.data.value);
                    }
                    notify_msg("success", "Route changed successfully");
                }else if(data.type=="edit_email_result"){
                    $(".tunnel_email_"+data.data.id).html('<a href="javascript:void(0);" class="email sck_editable" data-type="text" data-pk="'+data.data.id+'" data-title="Enter Email ID">'+data.data.value+'</a>');
                    $(".tunnel_email_"+data.data.id).attr("data-original-title", data.data.value);
                    $(".sck_editable").trigger("click");
                }else if(data.type=="edit_display_result"){
                    $(".tunnel_display_"+data.data.id).html('<a href="javascript:void(0);" class="display sck_editable" data-type="text" data-pk="'+data.data.id+'" data-title="Enter display_name">'+data.data.value+'</a>');
                    $(".tunnel_display_"+data.data.id).attr("data-original-title", data.data.value);
                    $(".sck_editable").trigger("click");
                }else if(data.type=="change_location_result"){
                    $(".tunnel_location_"+data.data.id).html('<a href"javascript:void(0);" class="change_location sck_editable" data-type="select" data-source="request.php?request=get_server_name" data-pk="'+data.data.id+'">'+location_option[data.data.value]+'</a>');
                    $(".tunnel_display_"+data.data.id).attr("data-original-title", data.data.value);
                    $(".sck_editable").trigger("click");
                }else if(data.type=="change_tunnel_to_server_result"){
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_yellow");
                    $(".not_client_"+data.data.id).html("");
                    $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-up"></i>');
                    $(".change_tunnel_"+data.data.id).attr("data-type", "client");
                }else if(data.type=="change_tunnel_to_client_result"){
                    var html="";
                    html+='<div class="meta width-100" data-toggle="tooltip" title="Not assigned"><a href="javascript:void(0);" class="real_ip real_ip_'+data.data.id+'" data-val="-1" data-id="'+data.data.id+'">Not assigned</a></div>';
                    html+='<div class="meta cursor"><div class="gateway tunnel_gate_'+data.data.id+'" type="data" data-toggle="tooltip" title="No" data-cast="" data-val="0" data-id="'+data.data.id+'"><i class="fa fa-times" style="color:#DA3838"></i></div></div>';
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").removeClass("bg_yellow");
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_green");
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").css("width","1383px");
                    $(".not_client_"+data.data.id).html(html);
                    $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-down"></i>');
                    $(".change_tunnel_"+data.data.id).attr("data-type", "server");
                }else if(data.type=="add_tunnels_result"){
                    var res_data=tunnels(data.data, packages);
                    $("#tunnel_body").append(res_data);
                    $(".tunnel_editable").trigger("click");
                    notify_msg("success", "A new tunnel created successfully");
                }else if(data.type=="add_server_clone_result"){
                    var res_data=tunnels(data.data, packages);
                    $("#tunnel_body").append(res_data);
                    $(".tunnel_editable").trigger("click");
                    notify_msg("success", "Server clone created");
                }else if(data.type=="add_client_clone_result"){
                    var res_data=tunnels(data.data, packages);
                    $("#tunnel_body").append(res_data);
                    $(".tunnel_editable").trigger("click");
                    notify_msg("success", "Client clone created");
                }else if(data.type=="change_tunnel_server_result"){
                    var html="";
                    html+='<div class="meta width-100" data-toggle="tooltip" title="Not assigned"><a href="javascript:void(0);" class="real_ip real_ip_'+data.data.id+'" data-val="-1" data-id="'+data.data.id+'">Not assigned</a></div>';
                    html+='<div class="meta cursor"><div class="gateway tunnel_gate_'+data.data.id+'" type="data" data-toggle="tooltip" title="No" data-cast="" data-val="0" data-id="'+data.data.id+'"><i class="fa fa-times" style="color:#DA3838"></i></div></div>';
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").removeClass("bg_yellow");
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_green");
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").css("width","1383px");
                    $(".not_client_"+data.data.id).html(html);
                    $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-down"></i>');
                    $(".change_tunnel_"+data.data.id).attr("data-type", "server");
                    notify_msg("success", "Client converted into server successfully done");
                }else if(data.type=="change_tunnel_client_result"){
                    $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_yellow");
                    $(".not_client_"+data.data.id).html("");
                    $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-up"></i>');
                    $(".change_tunnel_"+data.data.id).attr("data-type", "client");
                    notify_msg("success", "Server converted into client successfully done");
                }else if(data.type=="request_real_ip_result"){
                    $(".real_ip_"+data.data.id).html('<a href="javascript:void(0);" style="color:#1D9E74;" class="real_ip real_ip_'+data.data.id+'" data-val="1" data-id="'+data.data.id+'">'+data.data.real_ip+'</a>');
                    $(".real_ip_"+data.data.id).attr("data-val", 1);
                }else if(data.type=="real_ip_status_result"){
                    if(data.data.value==1){
                        $(".real_ip_"+data.data.id).css("color", "#1D9E74");
                        $(".real_ip_"+data.data.id).attr("data-val", 1);
                    }else if(data.data.value==0){
                        $(".real_ip_"+data.data.id).css("color", "#1B1E24");
                        $(".real_ip_"+data.data.id).attr("data-val", 0);
                    }
                    notify_msg("success", "Real ip status has been changed");
                }else if(data.type=="delete_tunnel_result"){
                    $(".tunnel_body_"+data.data.data.id).remove();
                    notify_msg("success", "Tunnel deleted successfully");
                }else if(data.type=="save_a_tunnel"){
                    $(".overlay_"+data.value).css("display", "block");
                }else if(data.type=="save_all_tunnel"){
                    $.each(data.ids, function(key, val){
                        $(".overlay_"+val).css("display", "block");
                    });
                }
                // by tanay
                else if(data.type=="doupdate_profile"){
                    $("#name").val(data.value.name);
                    $("#phone").val(data.value.phone);
                    $("#remail").val(data.value.remail);
                }else if(data.type=="update_plan"){
                    $( "#radio1" ).prop( "checked", false );
                        $( "#radio2" ).prop( "checked", false );
                        if(data.value.plan_id==1){
                        $( "#radio1" ).prop( "checked", true );
                   }else{
                        $( "#radio2" ).prop( "checked", true );
                   }
                }
            });
        },
        function() {
            //alert('WebSocket connection closed');
        },
        {'skipSubprotocolCheck': true}
    );

    function send( text ) {
    conn.publish(token, text);
}

    var group_arr=['<span style="color: #ea4335;"><strong>A</strong></span>', '<span style="color: #839D1C;"><strong>B</strong></span>', '<span style="color: #00A998;"><strong>C</strong></span>', '<span style="color: #F6AE00;"><strong>D</strong></span>', '<span style="color: #4285F4;"><strong>E</strong></span>', '<span style="color: #330033;"><strong>F</strong></span>', '<span style="color: #FF404E;"><strong>G</strong></span>', '<span style="color: #FFFF00;"><strong>H</strong></span>', '<span style="color: #FF3300;"><strong>I</strong></span>', '<span style="color: #CC6600;"><strong>J</strong></span>', '<span style="color: #9999CC;"><strong>K</strong></span>', '<span style="color: #0000CC;"><strong>L</strong></span>', '<span style="color: #FF0000;"><strong>M</strong></span>', '<span style="color: #003366;"><strong>N</strong></span>', '<span style="color: #003333;"><strong>0</strong></span>', '<span style="color: #FF00CC;"><strong>P</strong></span>', '<span style="color: #FF0066;"><strong>Q</strong></span>', '<span style="color: #CC0000;"><strong>R</strong></span>', '<span style="color: #CC6600;"><strong>S</strong></span>', '<span style="color: #666666;"><strong>T</strong></span>', '<span style="color: #330066;"><strong>U</strong></span>', '<span style="color: #CC99CC;"><strong>V</strong></span>', '<span style="color: #FFCC66;"><strong>W</strong></span>', '<span style="color: #FF3399;"><strong>X</strong></span>', '<span style="color: #99CCFF;"><strong>Y</strong></span>', '<span style="color: #0099FF;"><strong>Z</strong></span>'];

    $.ajax({
        url:"request.php?request=job_queue_info",
        success:function(resp){
            var data = $.parseJSON(resp);
            $.each(data, function(key, item){
                    $(".overlay_"+item).css("display", "block");
            });
        }
    });

    $.fn.editable.defaults.mode = 'popup';

    $('body').on('click','.email',function(e){
        var ths=$(this);
        $(this).editable({
            type: 'text',
            url:'request.php?request=edit_email&token='+token,
            ajaxOptions: {
                type: 'POST',
                success:function(resp){
                    data=$.parseJSON(resp);
                    if(data.status==1){
                        //notify_msg("success", data.data);
                         ths.editable('toggleDisabled');
                        // ths.parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                        send(resp);
                    }
                }
            }
        });
    });

    $('body').on('click','.display',function(e){
        var ths=$(this);
        $(this).editable({
            type: 'text',
            url:'request.php?request=edit_display&token='+token,
            ajaxOptions: {
                type: 'POST',
                success:function(resp){
                    data=$.parseJSON(resp);
                    if(data.status==1){
                        //notify_msg("success", data.data);
                        ths.editable('toggleDisabled');
                        //ths.parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                        send(resp);
                    }
                }
            }
        });
    });

    var location_option="";
    $.ajax({
        url:"request.php?request=get_server_name",
        success:function(resp){
            location_option=$.parseJSON(resp);
        }
    });

    var packages="";
    $.ajax({
        url:"request.php?request=packages",
        success:function(resp){
            packages=$.parseJSON(resp);
        }
    });

    $('#login-form').validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 6
            }
        },
        messages: {
            email: "Please enter a valid email address",
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 6 characters long"
            }
        },
        submitHandler: function(form) {
            $('#login-form-submit-btn').attr('disabled', 'disabled');
            $.ajax({
                url : "request.php?request=dologin",
                type : "POST",
                data : $("#login-form").serialize(),
                success : function(resp){
                    $('#login-form-submit-btn').removeAttr('disabled');
                    $('#login-response-message').show();
                    try {
                        var result = $.parseJSON(resp);

                        if (result.status == 1) {

                            $('#login-response-message').html(result.data);
                            $(form)[0].reset();
                            setTimeout(function () {
                                window.location.href = "contacts.php"
                            }, 2000);
                        }
                        else if (result.status == 0) {

                            $('#login-response-message').html(result.data);
                        }else if (result.status == 2) {

                            $('#login-response-message').html(result.data);
                            $(form)[0].reset();
                            setTimeout(function () {
                                window.location.href = "contacts.php"
                            }, 2000);
                        }
                        else {

                            $('#login-response-message').html("can not process your request, try again");
                        }
                    }
                    catch (e){
                        $('#login-response-message').html("unexpected error occurred, try again");
                    }
                },
                error : function(){
                }
            });
            return false;
        }
    });

$('#customButton').on('click', function(e) {
        // Open Checkout with further options
        handler.open({
          name: 'Account',
          description: '',
          amount: $('.txt_amount').val()*100
        });
        e.preventDefault();
      });
      // Close Checkout on page navigation
      $(window).on('popstate', function() {
        handler.close();
        //window.location.href="request.php?request=stripe_cancel";
      });

    $('.btn-plan-save').on('click', function(e) {
           var selectedVal = "";
           var selected = $("input[type='radio'][name='radio']:checked");
       if (selected.length > 0) {
           selectedVal = selected.val();
       }
       $.ajax({
           url:'request.php?request=update_plan',
           type:'POST',
           data:'selectedVal='+selectedVal,
           success:function(resp){
               //alert(resp);
               var data=$.parseJSON(resp);
               if(data.status==1){
                 send(resp);
                 $("#edtplan-response-message").html('<div class="alert alert-success">'+data.data+"</div>");
                 setTimeout(function(){
                   $("#edtplan-response-message").html('');
                 }, 3000);
               }
           }
       });
    });

    $('#btn-edit-profile').click(function(){
       $.ajax({
           url:'request.php?request=update_profile',
           type:'POST',
           data:$('#profile_form').serialize(),
           success:function(resp){
              //alert(resp);
               var data=$.parseJSON(resp);
               if(data.status==1){
               send(resp);
               $("#edtprofile-response-message").html('<div class="alert alert-success">'+data.data+"</div>");
               setTimeout(function(){
                   $("#edtprofile-response-message").html('');
                 }, 3000);
               }
           }
       });
   });

$('#change_password_form').validate({
        rules: {
            opassword: {
                required: true,
                minlength: 6
            },
            password: {
                required: true,
                minlength: 6
            },
            cfmPassword: {
                required: true,
                equalTo: "#password"
            }
        },
            messages: {
                opassword: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 6 characters long"
                },
            password: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 6 characters long"
                },
            cfmPassword: {
                    required: "Please provide a password",
                    minlength: "Your password must be at least 6 characters long"
                }
        },
        submitHandler: function(form) {
            $.ajax({
            url:'request.php?request=changePassword',
            type:'POST',
            data:$('#change_password_form').serialize(),
            success:function(resp){
                var data=$.parseJSON(resp);
                if(data.status==1){
                  $("#edtpass-response-message").html('<div class="alert alert-success">'+data.data+"</div>");
                  setTimeout(function(){
                    $("#edtpass-response-message").html('');
                  }, 2000);
                    $('#opassword').val('');
                    $('#password').val('');
                    $('#cfmPassword').val('');
                } else {
                  $("#edtpass-response-message").html('<div class="alert alert-danger">'+data.data+"</div>");
                }
            }
        });
    return false;
    }
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
                url : "request.php?request=user_register",
                type : "POST",
                data : $("#reg-form").serialize(),
                success : function(resp){
                    //alert(resp);
                    $('#reg-form-submit-btn').removeAttr('disabled');
                    $('#reg-response-message').show();
                    try {
                        var result = $.parseJSON(resp);
                        if (result.status == 1) {
                            $('#reg-response-message').html(result.data);
                            $(form)[0].reset();
                            setTimeout(function () {
                                window.location.href = "login.php"
                            }, 2000);
                        }
                        else if (result.status == 0) {
                            $('#reg-response-message').html(result.data);
                        }else if (result.status == 2) {
                            $('#reg-response-message').html(result.data);
                            $(form)[0].reset();
                            setTimeout(function () {
                                window.location.href = "registration.php"
                            }, 2000);
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

    $('#add_voucher_form').validate({
        rules: {
            voucher: {
                required: true,
            }
        },
        messages: {
            voucher: {
                required: "Please provide a Voucher Code"
            }
        },
        submitHandler: function(form) {
            $.ajax({
                url:'request.php?request=add_voucher',
                type:'POST',
                data : $(form).serialize(),
                success : function(resp){
                    //alert(resp);
                        var result = $.parseJSON(resp);
                        //alert(result.status);
                        if(result.status == 1){
                            $('#manual_voucher_success_message').show();
                            $('#manual_voucher_error_message').hide();
                            $('#manual_voucher_success_message').html(result.data);
                            setTimeout(function(){location.reload()}, 2000)
                        }
                        else{
                            $('#manual_voucher_success_message').hide();
                            $('#manual_voucher_error_message').html(result.data);
                            $('#manual_voucher_error_message').show();
                        }
                }
            });
            return false;
        }
    });

    $('#add_contact_manually_form').validate({
        rules: {
            contact_name: {
                required: true,
            },
            contact_mail: {
                required: true,
                email: true
            }
        },
        messages: {
            contact_name: {
                required: "Please provide a Name"
            },
            contact_mail: {
                required: "Please enter a valid email address"
            }
        },
        submitHandler: function(form) {
            $.ajax({
                url:'request.php?request=add_contact',
                type:'POST',
                data : $(form).serialize(),
                success : function(resp){
                    //alert(resp);
                        var result = $.parseJSON(resp);
                        //alert(result.status);
                        if(result.status == 1){
                            $('#manual_add_message').html('<div class="alert alert-success">'+result.data+"</div>");
                            setTimeout(function(){location.reload()}, 2000)
                        }
                        else{
                            $('#manual_add_message').html('<div class="alert alert-danger">'+result.data+"</div>");
                        }
                }
            });
            return false;
        }
    });

    $('#add_cloud_form').validate({
        rules: {
            cloud_name: {
                required: true
            },
            cloud_email: {
                required: true
            }
        },
        messages: {
            cloud_name: {
                cloud_name: "Please enter cloud name"
            },
            cloud_email: {
                cloud_email: "Please enter email address"
            }
        },
        submitHandler: function(form) {
            $.ajax({
                url:'request.php?request=add_cloud',
                type:'POST',
                data : $(form).serialize(),
                success : function(resp){
                    //alert(resp);
                        var result = $.parseJSON(resp);
                        if(result.status == 1){
                            $('#manual_add_success_message').show();
                            $('#manual_add_error_message').hide();
                            $('#manual_add_success_message').html(result.data);
                            setTimeout(function(){location.reload()}, 2000)
                        }
                        else if(result.status == 0){
                            $('#manual_add_success_message').hide();
                            $('#manual_add_error_message').show();
                            $('#manual_add_error_message').html(result.data);
                        }
                        else{
                            $('#manual_add_success_message').hide();
                            $('#manual_add_error_message').show();
                            $('#manual_add_error_message').html('Error occurred, try again');
                        }
                }
            });
            return false;
        }
    });

    $("#tunnel_add_form_btn").click(function(){
        var cloud_id=$(this).attr("data-val");
        var email=$(this).attr("data-mail");
        var html="";
        if($("#contact_ms").val()==null){
            var i=parseInt($(this).attr("data-count"));
            html+='<div class="list_header" id="tunnel_form"><input type="hidden" name="arr_'+i+'[cloud_id]" value='+cloud_id+'><div class="meta" data-toggle="tooltip" data-placement="right" title="Add tunnel as server"><input type="radio" name="arr_'+i+'[type]" value="server" id="tunnel_type"/></div>';
            html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Add tunnel as client"><input type="radio" value="client" name="arr_'+i+'[type]" id="tunnel_type"/></div>';
            html+='<div class="meta width-100" data-toggle="tooltip" data-placement="bottom" title="Groups"><input type="hidden" class="tunnel_group_'+i+'" name="arr_'+i+'[group]" value="0"><div type="tunnel" data-count="'+i+'" class="group">A</div></div>';
            html+='<input type="hidden" name="arr_'+i+'[email]" value="'+email+'"/>';
            html+='<div class="meta width-140" data-toggle="tooltip" data-placement="bottom" title="Tunnel name"><input type="text" name="arr_'+i+'[name]" placeholder="Enter name"/></div>';
            //html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Status"><input type="hidden" class="tunnel_status_'+i+'" name="arr_'+i+'[status]" value="0"><div type="tunnel" data-count="'+i+'" class="status"><i class="fa fa-fw fa-circle" style="color:#DA3838"></i></div></div>';
            html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Bidirection mode"><input type="hidden" class="tunnel_bidirection_'+i+'" name="arr_'+i+'[bidirection]" value="0"><div type="tunnel" data-count="'+i+'" class="biderection"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i></div></div>';
            //html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Select location"><select id="location" name="arr_'+i+'[location]"><option>Select location</option>'+location_option+'</select></div>';
            //html+='<div class="meta width-80" data-toggle="tooltip" data-placement="bottom" title="Location"><input type="hidden" name="arr_'+i+'[location]" value="location"/></div>';
            html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Gateway mode"><input type="hidden" class="tunnel_gateway_'+i+'" name="arr_'+i+'[gateway]" value="0"><div type="tunnel" data-count="'+i+'" class="gateway"><i class="fa fa-times" style="color:#DA3838"></i></div></div></div>';
            i=i+1;
            $(this).attr("data-count", i);
        }else{
            var arr=$("#contact_ms").val();
            var n = arr.length;
            if(n>0){
                for (i=0; i<n; i++){
                    html+='<div class="list_header"><input type="hidden" name="arr_'+i+'[cloud_id]" value='+cloud_id+'><div class="meta" data-toggle="tooltip" data-placement="right" title="Add tunnel as server"><input type="radio" name="arr_'+i+'[type]" value="server" id="tunnel_type"/></div>';
                    html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Add tunnel as client"><input type="radio" value="client" name="arr_'+i+'[type]" id="tunnel_type"/></div>';
                    html+='<div class="meta width-100" data-toggle="tooltip" data-placement="bottom" title="Groups"><input type="hidden" class="tunnel_group_'+i+'" name="arr_'+i+'[group]" value="0"><div type="tunnel" data-count="'+i+'" class="group">Group A</div></div>';
                    html+='<input type="hidden" value="'+arr[i]+'" name="arr_'+i+'[email]"/>';
                    html+='<div class="meta width-140" data-toggle="tooltip" data-placement="bottom" title="Tunnel name">'+arr[i]+'<input type="hidden"  value="'+arr[i]+'" name="arr_'+i+'[name]"/></div>';
                    html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Bidirection mode"><input type="hidden" class="tunnel_bidirection_'+i+'" name="arr_'+i+'[bidirection]" value="0"><div type="tunnel" data-count="'+i+'" class="biderection"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i></div></div>';
                    //html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Select location"><select id="location" name="arr_'+i+'[location]"><option>Select location</option>'+location_option+'</select></div>';
                    //html+='<div class="meta width-80" data-toggle="tooltip" data-placement="bottom" title="Location"><input type="hidden" name="arr_'+i+'[location]" value="location"/></div>';
                    html+='<div class="meta" data-toggle="tooltip" data-placement="bottom" title="Gateway mode"><input type="hidden" class="tunnel_gateway_'+i+'" name="arr_'+i+'[gateway]" value="0"><div type="tunnel" data-count="'+i+'" class="gateway"><i class="fa fa-times" style="color:#DA3838"></i></div></div></div>';
                }
            }
        }
        $("#tunnels_form_field").append(html);
        $("#tunnels_form_field").attr("style","");
    });

    $("#tunnel_form_close_btn").click(function(){
        $("#tunnel_form").html("");
        $("#tunnels_form_field").css("display", "none");
    })

    $('#btn_add_tunnel').click(function(){
        var cloud=$(this).attr("data-cloud");
        $.ajax({
            url:'request.php?request=addTunnel&token='+token,
            type:'POST',
            data:$('#tunnels_form_field').serialize(),
            success:function(resp){
                data=$.parseJSON(resp);
                //alert(resp);
                if(data.status==1){
                    //$("#tunnel_body").append(tunnels(data.value, packages));
                    notify_msg("success", data.data);
                    $("#tunnel_form").html("");
                    $("#tunnels_form_field").css("display", "none");
                    //$(".tunnel_editable").trigger("click");
                }else if(data.status==0){
                    notify_msg("danger", data.data);
                }else if(data.status==2){
                     notify_msg("danger", data.data);
                }
            }
        });
  });

    $("body").on("click", ".delete_tunnel", function(){
        var id=$(this).attr('data-id');
        var type=$(this).attr('data-type');
        var ths=$(this);
        if(confirm("Are you sure?")){
            $.ajax({
                url:"request.php?request=delete_tunnel&id="+id+"&type="+type+", &token="+token,
                success:function(data){
                    resp=$.parseJSON(data);
                    if(resp.status==1){
                        notify_msg("success", resp.data);
                        $(ths).closest(".tunnel_body").remove();
                    }
                }
            });
        }
    });

    var status_arr=['<i class="fa fa-fw fa-circle" style="color:#DA3838"></i>', '<i class="fa fa-fw fa-circle" style="color:#1D9E74"></i>'];
    var gateway_arr=['<i class="fa fa-times" style="color:#DA3838"></i>', '<i class="fa fa-check" style="color:#1D9E74"></i>'];
    var internet_arr=['<i class="fa fa-globe" style="color:#393333"></i>', '<i class="fa fa-globe" style="color:#1D9E74"></i>'];
    var route_arr=['<i class="fa fa-road" style="color:#393333"></i>', '<i class="fa fa-road" style="color:#1D9E74"></i>'];
    var biderection_arr=[
            '<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i>',
            '<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>',
            '<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right"></i>',
            '<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>'
    ];
    $('body').on('mousedown','.status',function(e){
        var id = $(this).attr('data-id');
        var key = parseInt($(this).attr('data-val'));
        var type=$(this).attr("type");
        if(e.button==0){
            key=key+1;
            if(type=="data"){
                if(key in status_arr){
                    $('.status_'+id).val(key);
                    $(this).attr('data-val',key);
                    $(this).html(status_arr[key]);
                }else{
                    key=0;
                    if(key in status_arr){
                        $('.status_'+id).val(key);
                        $(this).attr('data-val',key);
                        $(this).html(status_arr[key]);
                    }
                }
                $.ajax({
                    url:"request.php?request=status_change&id="+id+"&val="+key,
                    success:function(resp){
                        var data=$.parseJSON(resp);
                        if(data.status==1){
                            notify_msg("success", data.data);
                        }
                    }
                });
            } else {
                var count=$(this).attr("data-count");
                if(key in status_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_status_"+count).attr('value',key);
                    $(this).html(status_arr[key]);
                }else{
                    key=0;
                    if(key in status_arr){
                        $(this).attr('data-val',key);
                        $(".tunnel_status_"+count).attr('value',key);
                        $(this).html(status_arr[key]);
                    }
                }
            }
        }
         //document.oncontextmenu = function() {return true;};
    });

    $('body').on('mousedown','.gateway',function(e){
        var id = $(this).attr('data-id');
        var type=$(this).attr("type");
        var ths=$(this);
        if(e.button==0){
            if(type=="data"){
                if($(".tunnel_"+id).attr('data-val')==1){
                    $(".tunnel_chk").each(function(){
                        if($(this).attr('data-val')==1){
                            var id=$(this).attr('data-id');
                            var j=$(ths).attr('data-pos');
                            //if(j>0){
                                var key = parseInt($(".tunnel_gate_"+id).attr('data-val'));
                                key=key+1;
                            /*}else{
                                var key = parseInt($(ths).attr('data-val'));
                            }*/
                            if(key in gateway_arr){
                                $('.gateway_'+id).val(key);
                                $(".tunnel_gate_"+id).attr('data-val',key);
                                $(".tunnel_gate_"+id).html(gateway_arr[key]);
                            }else{
                                key=0;
                                if(key in gateway_arr){
                                    $('.gateway_'+id).val(key);
                                    $(".tunnel_gate_"+id).attr('data-val',key);
                                    $(".tunnel_gate_"+id).html(gateway_arr[key]);
                                }
                            }
                            $.ajax({
                                url:"request.php?request=gateway_change&id="+id+"&val="+key+"&token="+token,
                                success:function(resp){
                                    //alert(JSON.stringify(resp['value']));
                                    var data=$.parseJSON(resp);
                                    if(data.status==1){
                                        /*json="{"+id+":{gateway_change:{id:"+id+", value:"+key+"}}}";
                                        store.set("tunnels_data", json);*/
                                        //value = store.get("gateway_change");
                                        //console.log(value);
                                        //notify_msg("success", data.data);
                                        // $(".tunnel_gate_"+id).addClass("inactive");
                                        // $(".tunnel_gate_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                        //send(resp);
                                    }
                                }
                            });
                        }
                    });$(".gateway").attr("data-pos", 1);
                } else if($(".tunnel_"+id).attr('data-val')==0){
                    $(".gateway").attr("data-pos", 0);
                    $(".tunnel_chk").each(function(){
                        if($(this).attr('data-val')==1){
                            var id=$(this).attr('data-id');
                            var key = parseInt($(ths).attr('data-val'));
                            if(key in gateway_arr){
                                $('.gateway_'+id).val(key);
                                $(".tunnel_gate_"+id).attr('data-val',key);
                                $(".tunnel_gate_"+id).html(gateway_arr[key]);
                            }else{
                                key=0;
                                if(key in gateway_arr){
                                    $('.gateway_'+id).val(key);
                                    $(".tunnel_gate_"+id).attr('data-val',key);
                                    $(".tunnel_gate_"+id).html(gateway_arr[key]);
                                }
                            }
                            $.ajax({
                                url:"request.php?request=gateway_change&id="+id+"&val="+key+"&token="+token,
                                success:function(resp){
                                    var data=$.parseJSON(resp);
                                    if(data.status==1){
                                        /*json="{"+id+":{gateway_change:{id:"+id+", value:"+key+"}}}";
                                        store.set("tunnels_data", json);*/
                                        // notify_msg("success", data.data);
                                        // $(".tunnel_gate_"+id).addClass("inactive");
                                        // $(".tunnel_gate_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                        //send(resp);
                                    }
                                }
                            });
                        }
                    });
                }
            }else{
                var count=$(this).attr("data-count");
                var key=parseInt($(".tunnel_gateway_"+count).attr('value'));
                key=key+1;
                if(key in gateway_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_gateway_"+count).attr('value',key);
                    $(this).html(gateway_arr[key]);
                }else{
                    key=0;
                    if(key in gateway_arr){
                        $(this).attr('data-val',key);
                        $(".tunnel_gateway_"+count).attr('value',key);
                        $(this).html(gateway_arr[key]);
                    }
                }
            }
        }
    });

    $('body').on('mousedown','.biderection',function(e){
        var id = $(this).attr('data-id');
        var type=$(this).attr("type");
        var ths=$(this);
        if(e.button==0){
            if(type=="data"){
                if($(this).hasClass("inactive")==false){
                    if($(".tunnel_"+id).attr('data-val')==1){
                        $(".tunnel_chk").each(function(){
                            if($(this).attr('data-val')==1){
                                var id=$(this).attr('data-id');
                                var j=$(ths).attr('data-pos');
                                //if(j>0){
                                    var key = parseInt($(".tunnel_bi_"+id).attr('data-val'));
                                    key=key+1;
                                /*}else{
                                    var key = parseInt($(ths).attr('data-val'));
                                }*/
                                if(key in biderection_arr){
                                    $(".tunnel_bi_"+id).attr('data-val',key);
                                    $(".tunnel_bi_"+id).html(biderection_arr[key]);
                                }else{
                                    key=0;
                                    if(key in biderection_arr){
                                        $(".tunnel_bi_"+id).attr('data-val',key);
                                        $(".tunnel_bi_"+id).html(biderection_arr[key]);
                                    }
                                }
                                $.ajax({
                                    url:"request.php?request=bidirection_change&id="+id+"&val="+key+"&token="+token,
                                    success:function(resp){
                                        var data=$.parseJSON(resp);
                                        if(data.status==1){
                                            /*json="{"+id+":{bidirection_change:{id:"+id+", value:"+key+"}}}";
                                            store.set("tunnels_data", json);
                                            console.log(store.getAll());*/
                                            // notify_msg("success", data.data);
                                            // $(".tunnel_bi_"+id).addClass("inactive");
                                            // $(".tunnel_bi_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                            //send(resp);
                                        }
                                    }
                                });
                            }
                        });$(".biderection").attr("data-pos", 1);
                    }else if($(".tunnel_"+id).attr('data-val')==0){
                        $(".biderection").attr("data-pos", 0);
                        $(".tunnel_chk").each(function(){
                            if($(this).attr('data-val')==1){
                                var id=$(this).attr('data-id');
                                var key = parseInt($(ths).attr('data-val'));
                                if(key in biderection_arr){
                                    $(".tunnel_bi_"+id).attr('data-val',key);
                                    $(".tunnel_bi_"+id).html(biderection_arr[key]);
                                }else{
                                    key=0;
                                    if(key in biderection_arr){
                                        $(".tunnel_bi_"+id).attr('data-val',key);
                                        $(".tunnel_bi_"+id).html(biderection_arr[key]);
                                    }
                                }
                                $.ajax({
                                    url:"request.php?request=bidirection_change&id="+id+"&val="+key+", &token="+token,
                                    success:function(resp){
                                        var data=$.parseJSON(resp);
                                        if(data.status==1){
                                            /*json="{"+id+":{bidirection_change:{id:"+id+", value:"+key+"}}}";
                                            store.set("tunnels_data", json);*/
                                            // notify_msg("success", data.data);
                                            // $(".tunnel_bi_"+id).addClass("inactive");
                                            // $(".tunnel_bi_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                            //send(resp);
                                        }
                                    }
                                });
                            }
                        });
                    }
                }
            }else{
                var count=$(this).attr("data-count");
                var key=parseInt($(".tunnel_bidirection_"+count).attr('value'));
                key=key+1;
                if(key in biderection_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_bidirection_"+count).attr('value',key);
                    $(this).html(biderection_arr[key]);
                }else{
                    key=0;
                    if(key in biderection_arr){
                        $(this).attr('data-val',key);
                        $(".tunnel_bidirection_"+count).attr('value',key);
                        $(this).html(biderection_arr[key]);
                    }
                }
            }
        }
    });

    $('body').on('mousedown','.group',function(e){
        var type=$(this).attr("type");
        var ths=$(this);
        // var j=0;
        // var k=0;
        if(type=="data"){
            var data_val=$(this).attr('data-id');
            var val=$(this).attr('data-val');
            if($(".tunnel_"+data_val).attr('data-val')==1){
                $(".tunnel_chk").each(function(){
                    if($(this).attr('data-val')==1){
                      /*  if(val==$(".tunnel_grp_"+id).attr("data-val")){
                            k=k+1;
                        }*/
                        var id=$(this).attr('data-id');
                        var j=$(ths).attr('data-pos');
                        if(j>0){
                            var key=parseInt($(".tunnel_grp_"+id).attr("data-val"));
                            key=key+1;
                        }else{
                            key=parseInt($(ths).attr("data-val"));
                        }
                        //alert(key);
                        if(key in group_arr){
                            $(".tunnel_grp_"+id).attr('data-val',key);
                            $(".tunnel_grp_"+id).html(group_arr[key]);
                            $(ths).html(group_arr[key]);
                            $(".tunnel_grp_"+id).parent('.tunnel_chk').addClass('tunnel_grp_chk_'+key);
                        }else{
                            key=0;
                            if(key in group_arr){
                                $(".tunnel_grp_"+id).attr('data-val',key);
                                $(".tunnel_grp_"+id).html(group_arr[key]);
                                $(ths).html(group_arr[key]);
                                $(".tunnel_grp_"+id).parent('.tunnel_chk').addClass('tunnel_grp_chk_'+key);
                            }
                        }
                        $.ajax({
                            url:"request.php?request=group_change&id="+id+"&val="+key+"&token="+token,
                            success:function(resp){
                                var data=$.parseJSON(resp);
                                if(data.status==1){
                                    // notify_msg("success", data.data);
                                    // $(".tunnel_grp_"+id).addClass("inactive");
                                    // $(".tunnel_grp_"+id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                                    //send(resp);
                                }
                            }
                        });
                    }
                });
                $(".group").attr('data-pos', 1);
            }else if($(".tunnel_"+data_val).attr('data-val')==0){
                var i=0;
                $(".group").attr('data-pos', 0);
                $(".tunnel_chk").each(function(){
                    if($(this).attr('data-val')==1){
                        var id=$(this).attr('data-id');
                        var key=parseInt($(ths).attr("data-val"));
                        if(key in group_arr){
                            $(".tunnel_grp_"+id).attr('data-val',key);
                            $(".tunnel_grp_"+id).html(group_arr[key]);
                            $(ths).html(group_arr[key]);
                            $(".tunnel_grp_"+id).parent('.tunnel_chk').addClass('tunnel_grp_chk_'+key);
                        }else{
                            key=0;
                            if(key in group_arr){
                                $(".tunnel_grp_"+id).attr('data-val',key);
                                $(".tunnel_grp_"+id).html(group_arr[key]);
                                $(ths).html(group_arr[key]);
                                $(".tunnel_grp_"+id).parent('.tunnel_chk').addClass('tunnel_grp_chk_'+key);
                            }
                        }
                        $.ajax({
                            url:"request.php?request=group_change&id="+id+"&val="+key+"&token="+token,
                            success:function(resp){
                                var data=$.parseJSON(resp);
                                if(data.status==1){
                                    // notify_msg("success", data.data);
                                    // $(".tunnel_grp_"+id).addClass("inactive");
                                    // $(".tunnel_grp_"+id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                                    //send(resp);
                                }
                            }
                        });
                        i=i+1;
                    }
                });
                if(i==0){
                    var val=$(this).attr("data-val");
                    $(".tunnel_grp_chk_"+val).html("<i class='fa fa-fw fa-check-square-o'></i>");
                    $(".tunnel_grp_chk_"+val).attr("data-val", 1);
                    $(".tunnel_grp_chk_"+val).attr("data-val", 1);
                    $(".tunnel_grp_chk_"+val).parent('.list_body').addClass('row_chk');
                }
            }
        } else{
            var count=$(this).attr("data-count");
            var key=parseInt($(".tunnel_group_"+count).attr('value'));
            key=key+1;
            if(key in group_arr){
                $(this).attr('data-val',key);
                $(".tunnel_group_"+count).attr('value',key);
                $(this).html(group_arr[key]);
            }else{
                key=0;
                if(key in group_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_group_"+count).attr('value',key);
                    $(this).html(group_arr[key]);
                }
            }
        }
    });

    //internet change section
    $('body').on('mousedown','.internet_change',function(e){
        var type=$(this).attr("type");
        var ths=$(this);
        if(type=="data"){
            var data_val=$(this).attr('data-id');
            if($(".tunnel_"+data_val).attr('data-val')==1){
                $(".tunnel_chk").each(function(){
                    if($(this).attr('data-val')==1){
                        var id=$(this).attr('data-id');
                        var j=$(ths).attr('data-pos');
                        //if(j>0){
                            var key=parseInt($(".tunnel_internet_"+id).attr("data-val"));
                            key=key+1;
                        /*}else{
                            key=parseInt($(ths).attr("data-val"));
                        }*/
                        //alert(key);
                        if(key in internet_arr){
                            $(".tunnel_internet_"+id).attr('data-val',key);
                            $(".tunnel_internet_"+id).html(internet_arr[key]);
                            $(ths).html(internet_arr[key]);
                        }else{
                            key=0;
                            if(key in internet_arr){
                                $(".tunnel_internet_"+id).attr('data-val',key);
                                $(".tunnel_internet_"+id).html(internet_arr[key]);
                                $(ths).html(internet_arr[key]);
                            }
                        }
                        $.ajax({
                            url:"request.php?request=internet_change&id="+id+"&val="+key+"&token="+token,
                            success:function(resp){
                                var data=$.parseJSON(resp);
                                if(data.status==1){
                                    // notify_msg("success", data.data);
                                    // $(".tunnel_internet_"+id).addClass("inactive");
                                    // $(".tunnel_internet_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                    //send(resp);
                                }
                            }
                        });
                    }
                });
                $(".internet_change").attr('data-pos', 1);
            }else if($(".tunnel_"+data_val).attr('data-val')==0){
                $(".internet_change").attr('data-pos', 0);
                $(".tunnel_chk").each(function(){
                    if($(this).attr('data-val')==1){
                        var id=$(this).attr('data-id');
                        var key=parseInt($(ths).attr("data-val"));
                        if(key in internet_arr){
                            $(".tunnel_internet_"+id).attr('data-val',key);
                            $(".tunnel_internet_"+id).html(internet_arr[key]);
                            $(ths).html(internet_arr[key]);
                        }else{
                            key=0;
                            if(key in internet_arr){
                                $(".tunnel_internet_"+id).attr('data-val',key);
                                $(".tunnel_internet_"+id).html(internet_arr[key]);
                                $(ths).html(internet_arr[key]);
                            }
                        }
                        $.ajax({
                            url:"request.php?request=internet_change&id="+id+"&val="+key+"&token="+token,
                            success:function(resp){
                                var data=$.parseJSON(resp);
                                if(data.status==1){
                                    // notify_msg("success", data.data);
                                    // $(".tunnel_internet_"+id).addClass("inactive");
                                    // $(".tunnel_internet_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                    //send(resp);
                                }
                            }
                        });
                    }
                });
            }
        } /*else{
            var count=$(this).attr("data-count");
            var key=parseInt($(".tunnel_group_"+count).attr('value'));
            key=key+1;
            if(key in group_arr){
                $(this).attr('data-val',key);
                $(".tunnel_group_"+count).attr('value',key);
                $(this).html(group_arr[key]);
            }else{
                key=0;
                if(key in group_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_group_"+count).attr('value',key);
                    $(this).html(group_arr[key]);
                }
            }
        }*/
    });

    //route change section
    $('body').on('mousedown','.route_change',function(e){
        var type=$(this).attr("type");
        var ths=$(this);
        if(type=="data"){
            var data_val=$(this).attr('data-id');
            if($(".tunnel_"+data_val).attr('data-val')==1){
                $(".tunnel_chk").each(function(){
                    if($(this).attr('data-val')==1){
                        var id=$(this).attr('data-id');
                        var j=$(ths).attr('data-pos');
                        //if(j>0){
                            var key=parseInt($(".tunnel_route_"+id).attr("data-val"));
                            key=key+1;
                        /*}else{
                            key=parseInt($(ths).attr("data-val"));
                        }*/
                        //alert(key);
                        if(key in route_arr){
                            $(".tunnel_route_"+id).attr('data-val',key);
                            $(".tunnel_route_"+id).html(route_arr[key]);
                            $(ths).html(route_arr[key]);
                        }else{
                            key=0;
                            if(key in route_arr){
                                $(".tunnel_route_"+id).attr('data-val',key);
                                $(".tunnel_route_"+id).html(route_arr[key]);
                                $(ths).html(route_arr[key]);
                            }
                        }
                        $.ajax({
                            url:"request.php?request=route_change&id="+id+"&val="+key+"&token="+token,
                            success:function(resp){
                                var data=$.parseJSON(resp);
                                if(data.status==1){
                                    // notify_msg("success", data.data);
                                    // $(".tunnel_route_"+id).addClass("inactive");
                                    // $(".tunnel_route_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                    //send(resp);
                                }
                            }
                        });
                    }
                });
                $(".route_change").attr('data-pos', 1);
            }else if($(".tunnel_"+data_val).attr('data-val')==0){
                $(".route_change").attr('data-pos', 0);
                $(".tunnel_chk").each(function(){
                    if($(this).attr('data-val')==1){
                        var id=$(this).attr('data-id');
                        var key=parseInt($(ths).attr("data-val"));
                        if(key in route_arr){
                            $(".tunnel_route_"+id).attr('data-val',key);
                            $(".tunnel_route_"+id).html(route_arr[key]);
                            $(ths).html(route_arr[key]);
                        }else{
                            key=0;
                            if(key in route_arr){
                                $(".tunnel_route_"+id).attr('data-val',key);
                                $(".tunnel_route_"+id).html(route_arr[key]);
                                $(ths).html(route_arr[key]);
                            }
                        }
                        $.ajax({
                            url:"request.php?request=route_change&id="+id+"&val="+key+"&token="+token,
                            success:function(resp){
                                var data=$.parseJSON(resp);
                                if(data.status==1){
                                    // notify_msg("success", data.data);
                                    // $(".tunnel_route_"+id).addClass("inactive");
                                    // $(".tunnel_route_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                                    //send(resp);
                                }
                            }
                        });
                    }
                });
            }
        } /*else{
            var count=$(this).attr("data-count");
            var key=parseInt($(".tunnel_group_"+count).attr('value'));
            key=key+1;
            if(key in group_arr){
                $(this).attr('data-val',key);
                $(".tunnel_group_"+count).attr('value',key);
                $(this).html(group_arr[key]);
            }else{
                key=0;
                if(key in group_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_group_"+count).attr('value',key);
                    $(this).html(group_arr[key]);
                }
            }
        }*/
    });

    $("body").on("click", ".add_clone", function(){
        var id=$(this).attr("data-id");
        var type=$(this).attr("data-type");
        if(type=="server"){
            $.ajax({
                url:"request.php?request=add_server_clone&id="+id+"&token="+token,
                success:function(resp){
                    var data=$.parseJSON(resp);
                    if(data.status==1){
                        //$("#tunnel_body").append(tunnels(data.value, packages));
                        notify_msg("success", data.data);
                        //$(".tunnel_editable").trigger("click");
                        send(resp);
                    }else if(data.status==2){
                        notify_msg("danger", data.data);
                    }
                }
            });
        }else if(type=="client"){
            $.ajax({
                url:"request.php?request=add_client_clone&id="+id+"&token="+token,
                success:function(resp){
                    var data=$.parseJSON(resp);
                    if(data.status==1){
                        // $("#tunnel_body").append(tunnels(data.value, packages));
                        notify_msg("success", data.data);
                        // $(".tunnel_editable").trigger("click");
                        //send(resp);
                    }else if(data.status==2){
                        notify_msg("danger", data.data);
                    }
                }
            });
        }
    });

    $("#chk_all_tunnel").click(function(){
        var val=$(this).attr("data-val");
        if(val==0){
            $(this).html("<i class='fa fa-fw fa-check-square-o'></i>");
            $(".tunnel_chk").html("<i class='fa fa-fw fa-check-square-o'></i>");
            $(this).attr("data-val", 1);
            $(".tunnel_chk").attr("data-val", 1);
            $(".tunnel_chk").parent('.list_body').addClass('row_chk');
        }else if(val==1){
            $(this).html("<i class='fa fa-fw fa-square-o'></i>");
            $(".tunnel_chk").html("<i class='fa fa-fw fa-square-o'></i>");
            $(this).attr("data-val", 0);
            $(".tunnel_chk").attr("data-val", 0);
            $(".tunnel_chk").parent('.list_body').removeClass('row_chk');
        }
    });

    $("body").on("click", ".tunnel_chk", function(){
        var val=$(this).attr("data-val");
        if(val==0){
            $(this).html("<i class='fa fa-fw fa-check-square-o'></i>");
            $(this).attr("data-val", 1);
            $(this).parent('.list_body').addClass('row_chk');
        }else if(val==1){
            $(this).html("<i class='fa fa-fw fa-square-o'></i>");
            $(this).attr("data-val", 0);
            $(this).parent('.list_body').removeClass('row_chk');
            // $("#chk_all_tunnel").attr("data-chk", 0);
        }
    });

    $('#contact_ms').select2({
        placeholder: "Select users...",
        allowClear: true
    });

    $("body").on("click", "#tunnel_vew_by_tnl", function(){
        $("#tunnel_vew_by_email, #tunnel_vew_by_name, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway, #tunnel_view_by_grp").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_email, #tunnel_vew_by_name, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway, #tunnel_view_by_grp").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=tunnel",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="server"){
                    ths.attr("data-dif", "client");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }else{
                    ths.attr("data-dif", "server");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }
            }
        });
    });

    $("body").on("click", "#tunnel_vew_by_grp", function(){
        $("#tunnel_vew_by_email, #tunnel_vew_by_name, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_email, #tunnel_vew_by_name, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=group",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });

    /*$("body").on("click", "#tunnel_vew_by_email", function(){
        $("#tunnel_vew_by_grp, #tunnel_vew_by_name, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_grp, #tunnel_vew_by_name, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=email",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });*/

    $("body").on("click", "#tunnel_vew_by_name", function(){
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_gateway").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=name",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });

    $("body").on("click", "#tunnel_vew_by_bidirection", function(){
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_gateway, #tunnel_vew_by_name").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_gateway, #tunnel_vew_by_name").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=bidirection",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });

    $("body").on("click", "#tunnel_vew_by_gateway", function(){
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_name").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_name").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=gateway",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });

    $("body").on("click", "#tunnel_vew_by_internet", function(){
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_name, #tunnel_vew_by_route").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_name, #tunnel_vew_by_route").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=internet",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });

    $("body").on("click", "#tunnel_vew_by_route", function(){
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_name, #tunnel_vew_by_internet").html('<i class="fa fa-sort"></i>');
        $("#tunnel_vew_by_grp, #tunnel_vew_by_email, #tunnel_vew_by_bidirection, #tunnel_vew_by_name, #tunnel_vew_by_internet").attr("data-dif", "asc");
        var cloud=$(this).attr("data-cloud");
        var dif=$(this).attr("data-dif");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=getTunnel&cloud="+cloud+"&dif="+dif+"&type=route",
            success:function(resp){
                //alert(resp);
                 var data=$.parseJSON(resp);
                 $("#tunnel_body").html(tunnels(data, packages));
                 $(".tunnel_editable").trigger("click");
                 if(dif=="asc"){
                    ths.attr("data-dif", "desc");
                    ths.html("<i class='fa fa-caret-down'></i>");
                 }else{
                    ths.attr("data-dif", "asc");
                    ths.html("<i class='fa fa-caret-up'></i>");
                 }
            }
        });
    });

    $("body").on("click", ".real_ip",function(){
        var id=$(this).attr("data-id");
        var val=$(this).attr("data-val");
        var ip=$(this).html();
        var ths=$(this);
        if(val==-1){
            $.ajax({
                url:"request.php?request=request_real_ip&id="+id+"&token="+token,
                success:function(resp){
                    var data=$.parseJSON(resp);
                    if(data.status==1){
                        notify_msg("success", data.data);
                        $(".overlay_"+data.id).css("display", "block");
                        //ths.addClass("inactive");
                        //ths.parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                        //ths.html(data.value);
                        //ths.attr("data-val", 1);
                        //ths.css("color", "#1D9E74");
                        send(resp);
                    }else{
                        notify_msg("danger", data.data);
                    }
                }
            });
        }else{
            $.ajax({
                url:"request.php?request=real_ip_status&val="+val+"&ip="+ip+"&id="+id+"&token="+token,
                success:function(resp){
                    var data=$.parseJSON(resp);
                    if(data.status==1){
                        notify_msg("success", data.data);
                        $(".overlay_"+data.value.id).css("display", "block");
                        /*if(val==1){
                            ths.attr("data-val", 0);
                            ths.css("color", "#1B1E24");
                        }else{
                            ths.attr("data-val", 1);
                            ths.css("color", "#1D9E74");
                        }*/
                        // ths.addClass("inactive");
                        // ths.parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                        send(resp);
                    }
                }
            });
        }
    });

    $("body").on("click", ".change_location", function(){
        var ths=$(this);
        $(this).editable({
            url:"request.php?request=change_location&token="+token,
            ajaxOptions: {
                type:"POST",
                success:function(resp){
                    data=$.parseJSON(resp);
                    if(data.status==1){
                        notify_msg("success", data.data);
                        ths.editable('toggleDisabled');
                        ths.parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
                        send(resp);
                    }
                }
            }
        });
    });

    $(".tunnel_editable").trigger("click");

    $("body").on("click", ".change_tunnel", function(){
        var id=$(this).attr("data-id");
        var type=$(this).attr("data-type");
        var ths=$(this);
        $.ajax({
            url:"request.php?request=change_tunnel&id="+id+"&type="+type+"&token="+token,
            success:function(resp){
                data=$.parseJSON(resp);
                if(data.status==1){
                    notify_msg("success", data.data);
                    $(".overlay_"+data.value.id).css("display", "block");
                    send(resp);
                }
            }
        });
    });

    $("body").on("click", ".save_this_client", function(){
        var id = $(this).attr("data-id");
        $.ajax({
            url:"request.php?request=save_a_tunnel&id="+id+"&token="+token,
            success:function(resp){
                data=$.parseJSON(resp);
                if(data.status==1){
                    notify_msg("success", data.data);
                    $(".overlay_"+id).css("display", "block");
                    send(resp);
                }else if(data.status==0){
                    notify_msg("danger", data.data);
                }
            }
        });
    });

    $("#all_tunnel_save_btn").click(function(){
        $.ajax({
            url:"request.php?request=save_all_tunnel&token="+token,
            success:function(resp){
                data=$.parseJSON(resp);
                if(data.status==1){
                    notify_msg("success", data.data);
                    $.each(data.ids, function(key, val){
                        $(".overlay_"+val).css("display", "block");
                    });
                    send(resp);
                }else if(data.status==0){
                    notify_msg("danger", data.data);
                }
            }
        });
    });

    $("#delete_cloud").click(function(){
        if(confirm("Are you sure want to delete this cloud?")){
            var cloud=$(this).attr("data-val");
            $.ajax({
                url:"request.php?request=delete_cloud&cloud_id="+cloud+"&token="+token,
                success:function(resp){
                    window.location.href = "profile.php";
                }
            });
        }
    });


});

//gateway change php section
function gateway(stat, tunnel_id, user_id){
    var html="";
    if(stat==0){
        html+='<input type="hidden" class="edit_gateway_s" name="gateway" value=0>';
        html+='<div class="gateway tunnel_gate_'+tunnel_id+'" type="data" data-toggle="tooltip" title="No" data-cast="'+user_id+'" data-val="0" data-id="'+tunnel_id+'"><i class="fa fa-times" style="color:#DA3838"></i></div>';
        /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
        $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i><div>';*/
    }else if(stat==1){
        html+='<input type="hidden" class="edit_gateway_s" name="gateway" value=1>';
        html+='<div class="gateway tunnel_gate_'+tunnel_id+'" type="data" data-toggle="tooltip" title="Yes" data-cast="'+user_id+'" data-val="1" data-id="'+tunnel_id+'"><i class="fa fa-check" style="color:#1D9E74"></i></div>';
        /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
        $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
    }
    return html;
}

//bidirection change php section
function biderection (stat, tunnel_id, user_id){
    var html="";
    if(stat==0){
        html+='<input type="hidden" id="edit_biderection_s" name="biderection" value=0>';
        html+='<div class="biderection tunnel_bi_'+tunnel_id+'" type="data" data-toggle="tooltip" title="Mode 1" data-ctrl="0" data-cast="'+user_id+'" data-val="0" data-id="'+tunnel_id+'" data-url="change_biderection">';
        html+='<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i></div>';
        /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
        $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
    }
    if(stat==1){
        html+='<input type="hidden" id="edit_biderection_s" name="biderection" value=1>';
        html+='<div class="biderection tunnel_bi_'+tunnel_id+'" type="data" data-toggle="tooltip" title="Mode 2" data-ctrl="0" data-cast="'+user_id+'" data-val="1" data-id="'+tunnel_id+'" data-url="change_biderection">';
        html+='<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i></div>';
        /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
        $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
    }
    if(stat==2){
        html+='<input type="hidden" id="edit_biderection_s" name="biderection" value=2>';
        html+='<div class="biderection tunnel_bi_'+tunnel_id+'" type="data" data-toggle="tooltip" title="Mode 3" data-ctrl="0" data-cast="'+user_id+'" data-val="2" data-id="'+tunnel_id+'" data-url="change_biderection">';
        html+='<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right"></i></div>';
        /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
        $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
    }
    if(stat==3){
        html+='<input type="hidden" id="edit_biderection_s" name="biderection" value=3>';
        html+='<div class="biderection tunnel_bi_'+tunnel_id+'" type="data" data-toggle="tooltip" title="Mode 4" data-ctrl="0" data-cast="'+user_id+'" data-val="2" data-id="'+tunnel_id+'" data-url="change_biderection">';
        html+='<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i></div>';
        /*$html.='<div class="lock_btn" data-i="unlock"><i class="fa fa-unlock"></i></div>';
        $html.='<div class="lock_btn" data-i="lock"><i class="fa fa-lock"></i></div>';*/
    }
    return html;
}

function tunnels(data, packages){
    var group_arr=['<span style="color: #ea4335;"><strong>A</strong></span>', '<span style="color: #839D1C;"><strong>B</strong></span>', '<span style="color: #00A998;"><strong>C</strong></span>', '<span style="color: #F6AE00;"><strong>D</strong></span>', '<span style="color: #4285F4;"><strong>E</strong></span>', '<span style="color: #330033;"><strong>F</strong></span>', '<span style="color: #FF404E;"><strong>G</strong></span>', '<span style="color: #FFFF00;"><strong>H</strong></span>', '<span style="color: #FF3300;"><strong>I</strong></span>', '<span style="color: #CC6600;"><strong>J</strong></span>', '<span style="color: #9999CC;"><strong>K</strong></span>', '<span style="color: #0000CC;"><strong>L</strong></span>', '<span style="color: #FF0000;"><strong>M</strong></span>', '<span style="color: #003366;"><strong>N</strong></span>', '<span style="color: #003333;"><strong>0</strong></span>', '<span style="color: #FF00CC;"><strong>P</strong></span>', '<span style="color: #FF0066;"><strong>Q</strong></span>', '<span style="color: #CC0000;"><strong>R</strong></span>', '<span style="color: #CC6600;"><strong>S</strong></span>', '<span style="color: #666666;"><strong>T</strong></span>', '<span style="color: #330066;"><strong>U</strong></span>', '<span style="color: #CC99CC;"><strong>V</strong></span>', '<span style="color: #FFCC66;"><strong>W</strong></span>', '<span style="color: #FF3399;"><strong>X</strong></span>', '<span style="color: #99CCFF;"><strong>Y</strong></span>', '<span style="color: #0099FF;"><strong>Z</strong></span>'];
    var internet_arr=['<i class="fa fa-globe" style="color:#393333"></i>', '<i class="fa fa-globe" style="color:#1D9E74"></i>'];
    var route_arr=['<i class="fa fa-road" style="color:#393333"></i>', '<i class="fa fa-road" style="color:#1D9E74"></i>'];
    var html='';
    for(x in data){
         if(data[x].tunnel_type=="client"){
            html+='<div class="overlay_'+data[x].tunnel_id+' overlay-server" style="display:none;"></div><div class="list_body bg_yellow tunnel_body tunnel_body_'+data[x].tunnel_id+'">';
         }else{
            html+='<div class="overlay_'+data[x].tunnel_id+' overlay-client" style="display:none;"></div><div class="list_body bg_green tunnel_body tunnel_body_'+data[x].tunnel_id+'">';
         }
         html+='<div class="meta" data-toggle="tooltip" data-placement="right" title="'+(data[x].tunnel_type!="client"?"Downgrade to client":"Upgrade to server")+'"><a href="javascript:void(0)" class="change_tunnel change_tunnel_'+data[x].tunnel_id+'" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'">'+(data[x].tunnel_type!="client"?"<i class='fa fa-long-arrow-down'></i>":"<i class='fa fa-long-arrow-up'></i>")+'</a></div>';

         html+='<div class="meta" data-toggle="tooltip" title="Add clone"><a href="javascript:void(0)" class="add_clone" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'"><i class="fa fa-fw fa-plus"></i></a></div>';
         html+='<div class="meta" data-toggle="tooltip" title="Save this"><a href="javascript:void(0)" class="save_this_client" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'"><i class="fa fa-floppy-o"></i></a></div>';
         html+='<div class="meta cursor tunnel_chk tunnel_'+data[x].tunnel_id+' tunnel_grp_chk_'+data[x].group_id+'" data-val="0" data-id="'+data[x].tunnel_id+'" data-toggle="tooltip" title="Select tunnel"><i class="fa fa-fw fa-square-o"></i></div>';
         html+='<div class="meta cursor tunnel_grp" data-toggle="tooltip" data-gid="'+data[x].group_id+'" title="'+data[x].group_id+'"><div class="group tunnel_grp_'+data[x].tunnel_id+'" type="data" data-cast="'+data[x].customer_id+'" data-val="'+data[x].group_id+'" data-id="'+data[x].tunnel_id+'">'+((data[x].group_id in group_arr)?group_arr[data[x].group_id]:"")+'</div></div>';

         //html+='<div class="meta width-140 tunnel_email_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="bottom" title="'+data[x].email+'">'+data[x].email+'</div>';

         html+='<div class="meta width-140 tunnel_display_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="bottom" title="'+data[x].display_name+'"><a href="#" class="display display_'+data[x].tunnel_id+' tunnel_editable" data-type="text" data-pk="'+data[x].tunnel_id+'" data-title="Enter display name">'+data[x].display_name+'</a></div>';
         //html+='<div class="meta cursor"></div>';
         html+='<div class="meta cursor">'+biderection(data[x].bidirectional_mode, data[x].tunnel_id, data[x].customer_id)+'</div>';
         html+='<div class="meta width-80 tunnel_location_'+data[x].tunnel_id+'" data-toggle="tooltip" title=""><a href"javascript:void(0);" class="change_location location_'+data[x].tunnel_id+' tunnel_editable" data-type="select" data-source="request.php?request=get_server_name" data-pk="'+data[x].tunnel_id+'">'+(data[x].location!=null?data[x].location:"Select Location")+'</a></div>';
         html+='<div class="meta width-100" data-toggle="tooltip" title="'+data[x].cloud_ip+'">'+data[x].cloud_ip+'</div>';
         html+='<div class="meta" data-toggle="tooltip" title="">'+(data[x].tunnel_type!="client"?packages.Server:packages.Client)+'</div>';
         html+='<div class="meta" data-toggle="tooltip" title=""><div data-val="'+data[x].internet+'" class="internet_change cursor tunnel_internet_'+data[x].tunnel_id+'" type="data" data-pos="0" data-id="'+data[x].tunnel_id+'">'+(data[x].internet==1?"<i class='fa fa-fw fa-globe' style='color:#1D9E74'></i>":"<i class='fa fa-fw fa-globe' style='color:#393333'></i>")+'</div></div>';

         html+='<div class="meta" data-toggle="tooltip" title=""><div data-val="'+data[x].route+'" class="route_change cursor tunnel_route_'+data[x].tunnel_id+'" type="data" data-pos="0" data-id="'+data[x].tunnel_id+'">'+(data[x].route==1?"<i class='fa fa-fw fa-road' style='color:#1D9E74'></i>":"<i class='fa fa-fw fa-road' style='color:#393333'></i>")+'</div></div>';
         html+='<span class="not_client_'+data[x].tunnel_id+'">';
         if(data[x].tunnel_type!="client"){
            html+='<div class="meta width-100" data-toggle="tooltip" title="'+(data[x].real_ip!=null?data[x].real_ip:"Not assigned")+'"><a href="javascript:void(0);" data class="real_ip real_ip_'+data[x].tunnel_id+'" style="'+(data[x].active>0?"color:#1B1E24":"color:#1D9E74")+'" data-val="'+(data[x].active!=null?data[x].active:-1)+'" data-id="'+data[x].tunnel_id+'">'+(data[x].real_ip!=""?data[x].real_ip:"Not assigned")+'</a></div>';
            html+='<div class="meta cursor">'+gateway(data[x].gateway_mode, data[x].tunnel_id, data[x].customer_id)+'</div>';
         }
         html+='</span>';
         html+='<div class="meta" data-toggle="tooltip" title="Delete this tunnel" ><a href="javascript:void(0);" data-id="'+data[x].tunnel_id+'" class="delete_tunnel_'+data[x].tunnel_id+' delete_tunnel" data-type="'+data[x].tunnel_type+'"><i class="fa fa-fw fa-trash" style="color:#DA3838"></i></a></div>';
      //html+='</div>';
    }
    return html;
}

function notify_msg (status, msg) {
    notify({
        type: status,
        title: "Success",
        message: msg,
        position: {
          x: "left",
          y: "bottom"
        },
        icon: '',
        size: "small",
        overlay: false,
        closeBtn: true,
        overflowHide: false,
        spacing: 20,
        theme: "default",
        autoHide: true,
        delay: 3000,
        onShow: null,
        onClick: null,
        onHide: null,
        template: '<div class="notify"><div class="notify-text"></div></div>'
    });
}

