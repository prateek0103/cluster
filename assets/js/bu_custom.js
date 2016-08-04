var Server;
var acl_value={};
var items = ["#996600", "#003366", "#336699", "#00cc66", "#ff6666"];

function send( text ) {
    Server.send( 'message', text );
}
$(document).ready(function(){
    //fancy webocket
    console.log('Connecting...');
    Server = new FancyWebSocket('ws://192.81.220.57:8880');
    //console.log(Server);
    //Let the user know we're connected
    Server.bind('open', function() {
        console.log( "Connected." );
        var data={"type":"authorize","message_type":"request","value":{"token":token}};
        send(JSON.stringify(data));
        /*var get={"type":"get_subnet", "message_type":"request", "data":{"id":49, "ip":"192.168.255.255"}};
        setTimeout(function(){
            send(JSON.stringify(get));
        }, 5000);*/

    });
    //OH NOES! Disconnection occurred.
    Server.bind('close', function( data ) {
        console.log( "Disconnected." );
    });
    //Log any messages sent from server
    Server.bind('message', function( payload ) {
        console.log(payload);
        var data=$.parseJSON(payload);
        //alert(data.type);
        //alert(data);
        console.log(data);
        if(data.free_field=="yes"){
            //$(".overlay_"+data.data.id).css("display", "none");
            $(".tunnel_"+data.data.id).html("<i class='fa fa-fw fa-square-o'></i>");
            $(".tunnel_"+data.data.id).addClass("tunnel_chk");
            $(".tunnel_"+data.data.id).attr("data-original-title", "Select tunnel");
        }
        if(data.type=="edit_display"){
            $(".display_"+data.value.id).editable('toggleDisabled');
            $(".display_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
        }else if(data.type=="change_location"){
            $(".location_"+data.value.id).editable('toggleDisabled');
            $(".location_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
        }else if(data.type=="change_tunnel_to_server"){
            // $(".overlay_"+data.value.id).css("display", "block");
            $(".tunnel_"+data.value.id).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
            $(".tunnel_"+data.value.id).removeClass("tunnel_chk");
            $(".tunnel_"+data.value.id).attr("data-original-title", "Request submitted, please wait...");
        }else if(data.type=="change_tunnel_to_client"){
            // $(".overlay_"+data.value.id).css("display", "block");
            $(".tunnel_"+data.value.id).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
            $(".tunnel_"+data.value.id).removeClass("tunnel_chk");
            $(".tunnel_"+data.value.id).attr("data-original-title", "Request submitted, please wait...");
        }else if(data.type=="request_real_ip"){
            //$(".overlay_"+data.id).css("display", "block");
            $(".tunnel_"+data.id).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
            $(".tunnel_"+data.id).removeClass("tunnel_chk");
            $(".tunnel_"+data.id).attr("data-original-title", "Request submitted, please wait...");
        }else if(data.type=="real_ip_status"){
            //$(".overlay_"+data.value.id).css("display", "block");
            $(".tunnel_"+data.value.id).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
            $(".tunnel_"+data.value.id).removeClass("tunnel_chk");
            $(".tunnel_"+data.value.id).attr("data-original-title", "Request submitted, please wait...");
        }else if(data.type=="delete_tunnel"){
            //$(".overlay_"+data.value).css("display", "block");
            $(".tunnel_"+data.value).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
            $(".tunnel_"+data.value).removeClass("tunnel_chk");
            $(".tunnel_"+data.value).attr("data-original-title", "Request submitted, please wait...");
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
        }else if(data.type=="status_change_result"){
            if(data.data.value==1){
                $(".tunnel_stat_"+data.data.id).html('<i class="fa fa-circle" style="color:#1D9E74"></i>');
                $(".tunnel_stat_"+data.data.id).attr("data-val", data.data.value);
                $(".tunnel_stat_"+data.data.id).attr("data-original-title", "Active");
                $(".tunnel_body_"+data.data.id).css("background-color", "");
            }else if(data.data.value==0){
                $(".tunnel_stat_"+data.data.id).html('<i class="fa fa-circle" style="color:#DA3838"></i>');
                $(".tunnel_stat_"+data.data.id).attr("data-val", data.data.value);
                $(".tunnel_stat_"+data.data.id).attr("data-original-title", "Inactive");
                $(".tunnel_body_"+data.data.id).css("background-color", "#cecece");
            }
            notify_msg("success", "Status changed successfully");
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
                $(".tunnel_internet_"+data.data.id).attr("data-val", data.data.value);
            }else if(data.data.value==0){
                $(".tunnel_internet_"+data.data.id).css("opacity", '0.25');
                $(".tunnel_internet_"+data.data.id).attr("data-val", data.data.value);
            }
            notify_msg("success", "Internet changed successfully");
        }else if(data.type=="route_change_result"){
            if(data.data.value==1){
                $(".tunnel_route_"+data.data.id).css("background-color", '#1D9E74');
                $(".tunnel_route_"+data.data.id).attr("data-val", data.data.value);
            }else if(data.data.value==0){
                $(".tunnel_route_"+data.data.id).css("background-color", '#393333');
                $(".tunnel_route_"+data.data.id).attr("data-val", data.data.value);
            }
            notify_msg("success", "Route changed successfully");
        }else if(data.type=="plan_change_result"){
            if(data.data.value==2){
                $(".acc_type_"+data.data.id).attr("data-val", 2);
                $(".acc_type_"+data.data.id).html("Premium");
                $(".acc_type_"+data.data.id).css("color", "black");
                $(".plan_cost_"+data.data.id).html(data.data.p_cost);
            }else if(data.data.value==1){
                $(".acc_type_"+data.data.id).attr("data-val", 1);
                $(".acc_type_"+data.data.id).html("Premium");
                $(".acc_type_"+data.data.id).css("color", "white");
                $(".plan_cost_"+data.data.id).html(data.data.p_cost);
            }
            notify_msg("success", "Account type has been changed successfully");
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
            $(".change_tunnel_"+data.data.id).html('Client');
            $(".change_tunnel_"+data.data.id).attr("data-type", "client");
        }else if(data.type=="change_tunnel_to_client_result"){
            var html="";
            html+='<div class="meta width-100" data-toggle="tooltip" title="Not assigned"><a href="javascript:void(0);" class="real_ip real_ip_'+data.data.id+'" data-val="-1" data-id="'+data.data.id+'">Not assigned</a></div>';
            html+='<div class="meta cursor"><div class="gateway tunnel_gate_'+data.data.id+'" type="data" data-toggle="tooltip" title="No" data-cast="" data-val="0" data-id="'+data.data.id+'"><i class="fa fa-times" style="color:#DA3838"></i></div></div>';
            $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").removeClass("bg_yellow");
            $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_green");
            $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").css("width","1383px");
            $(".not_client_"+data.data.id).html(html);
            $(".change_tunnel_"+data.data.id).html('Server');
            $(".change_tunnel_"+data.data.id).attr("data-type", "server");
        }else if(data.type=="add_tunnels_result"){
            var res_data=tunnels(data.data);
            $("#tunnel_body").append(res_data);
            $(".tunnel_editable").trigger("click");
            notify_msg("success", "A new tunnel created successfully");
        }else if(data.type=="add_server_clone_result"){
            var res_data=tunnels(data.data);
            $("#tunnel_body").append(res_data);
            $(".tunnel_editable").trigger("click");
            notify_msg("success", "Server clone created");
        }else if(data.type=="add_client_clone_result"){
            var res_data=tunnels(data.data);
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
           // $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-down"></i>');
            $(".change_tunnel_"+data.data.id).attr("data-type", "server");
            $(".plan_cost_"+data.data.id).html(data.data.cost);
            notify_msg("success", "Client converted into server successfully done");
        }else if(data.type=="change_tunnel_client_result"){
            $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_yellow");
            $(".not_client_"+data.data.id).html("");
          //  $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-up"></i>');
            $(".change_tunnel_"+data.data.id).attr("data-type", "client");
            $(".plan_cost_"+data.data.id).html(data.data.cost);
            notify_msg("success", "Server converted into client successfully done");
            $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").removeClass("row_chk");
        }else if(data.type=="request_real_ip_result"){
            $(".real_ip_"+data.data.id).html('<a href="javascript:void(0);" style="color:#1D9E74;" class="real_ip real_ip_'+data.data.id+'" data-val="1" data-id="'+data.data.id+'">'+data.data.real_ip+'</a>');
            $(".real_ip_"+data.data.id).attr("data-val", 1);
            $(".plan_cost_"+data.data.id).html(data.data.cost);
        }else if(data.type=="real_ip_status_result"){
            if(data.data.value==1){
                $(".real_ip_"+data.data.id).css("color", "#1D9E74");
                $(".real_ip_"+data.data.id).attr("data-val", 1);
            }else if(data.data.value==0){
                $(".real_ip_"+data.data.id).css("color", "#1B1E24");
                $(".real_ip_"+data.data.id).attr("data-val", 0);
            }
            $(".plan_cost_"+data.data.id).html(data.data.cost);
            notify_msg("success", "Real ip status has been changed");
        }else if(data.type=="delete_tunnel_result"){
            $(".tunnel_body_"+data.data.data.id).remove();
            notify_msg("success", "Tunnel deleted successfully");
        }else if(data.type=="save_a_tunnel"){
            //$(".overlay_"+data.value).css("display", "block");
            $(".tunnel_"+data.value).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
            $(".tunnel_"+data.value).removeClass("tunnel_chk");
            $(".tunnel_"+data.value).attr("data-original-title", "Request submitted, please wait...");
        }else if(data.type=="save_all_tunnel"){
            $.each(data.ids, function(key, val){
                //$(".overlay_"+val).css("display", "block");
                $(".tunnel_"+val).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
                $(".tunnel_"+val).removeClass("tunnel_chk");
                $(".tunnel_"+val).attr("data-original-title", "Request submitted, please wait...");
            });
        }else if(data.type=="get_subnet"){
            $(".subnet_"+data.data.id).html(data.data.ip);
        }else if(data.type=="get_DeV"){
            if(data.data.state==-1){
                $("#DeV_"+data.data.id).removeClass();
                $("#DeV_"+data.data.id).addClass("dev-disconnected");
                $("#DeV_"+data.data.id).addClass("width-50");
                 $("#DeV_"+data.data.id).html(data.data.device);
            }else if(data.data.state==0){
                $("#DeV_"+data.data.id).removeClass();
                $("#DeV_"+data.data.id).addClass("dev-connecting");
                $("#DeV_"+data.data.id).addClass("width-50");
                 $("#DeV_"+data.data.id).html(data.data.device);
            }else if(data.data.state==1){
                $("#DeV_"+data.data.id).removeClass();
                $("#DeV_"+data.data.id).addClass("dev-connected");
                $("#DeV_"+data.data.id).addClass("width-50");
                $("#DeV_"+data.data.id).html(data.data.device);
            }
        }else if(data.type=="deduct_cash_result"){
            var sett_val = $(".show_div_b").attr("data-p");

            var res = data.data.toString();
            var res = res*sett_val;
            var res1 = Math.round(res);

            $(".show_div").html('<b class="show_div_b" data-p="'+sett_val+'">Available Points: '+res1+'</b>');
        }
        //31.03.2016
        else if(data.type=="delete_acl_result"){
            var res = data.data.id
            $(".acl_div_"+res).remove();
            notify_msg("ACL deleted successfully");
        }else if(data.type=="clear_acl_values_result"){
            var res = data.data.id
            $(".box_"+res).children("div").css("opacity", "0.35");
            notify_msg("ACL cleared successfully");
        }else if(data.type=="create_acl_clone_result"){
            acl(data.data, data.type);
            notify_msg("ACL clone created successfully");
        }else if(data.type=="create_new_acl_result"){
            $.ajax({
                url:"request.php?request=get_acl_info&id="+data.data.id,
                success:function(resp){
                    var res = $.parseJSON(resp);
                    acl(res, data.type);
                }
            });
            notify_msg("New ACL created successfully");
        }else if(data.type=="save_acl_values_result"){
            var html="";
            var acl_id="";
            var value="";
            var database="";
            var val="";
            var k="";
            var v="";
            $.each(data.data.data, function(key, value){
                acl_id = key;
                $.each(value, function(ky, val){
                    database = ky;
                    $.each(val, function(k, v){
                        if(v!=""){
                            $('.'+k+'-'+ky+'-'+key).css("opacity", "1");
                            $('.'+k+'-'+ky+'-'+key).attr("title", v);
                        }
                    });
                });
            });
        }else if(data.type=="change_acl_result"){

            console.log(data.data);
        } else if (data.type=="get_app_result"){
            var res = data.data;
            var html="";
            var itemz = data.class.split("-");
            html+="<select class='acl_option' data-id='"+itemz[2]+"' data-type='"+itemz[1]+"' data-value='"+itemz[0]+"'>";
                html+="<option value=''>Select one...</option>";
                for(x in res){
                    html+="<option value='"+res[x].value+"'>"+res[x].label+"</option>";
                }
            html+="</select>";
            $("#acl_div_cont").html(html);
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
    Server.connect();
    //end of fancy websocket

    // var conn = new ab.Session('ws://192.81.220.57:8080',
    //     function() {
    //         conn.subscribe(token, function(topic, resp) {
    //             // This is the place to handle server pushes
    //             console.log(resp);
    //             var data=$.parseJSON(resp);
    //             //alert(data.type);
    //             console.log(data);
    //             if(data.free_field=="yes"){
    //                 $(".overlay_"+data.data.id).css("display", "none");
    //             }
    //             if(data.type=="edit_display"){
    //                 $(".display_"+data.value.id).editable('toggleDisabled');
    //                 $(".display_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
    //             }else if(data.type=="change_location"){
    //                 $(".location_"+data.value.id).editable('toggleDisabled');
    //                 $(".location_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
    //             }else if(data.type=="change_tunnel_to_server"){
    //                 $(".overlay_"+data.value.id).css("display", "block");
    //             }else if(data.type=="change_tunnel_to_client"){
    //                 $(".overlay_"+data.value.id).css("display", "block");
    //             }else if(data.type=="request_real_ip"){
    //                 $(".overlay_"+data.id).css("display", "block");
    //             }else if(data.type=="real_ip_status"){
    //                 $(".overlay_"+data.value.id).css("display", "block");
    //             }else if(data.type=="delete_tunnel"){
    //                 $(".delete_tunnel_"+data.value.id).addClass("inactive");
    //                 $(".delete_tunnel_"+data.value.id).parent("div").attr("data-original-title", "This field is processing its last job, please wait...");
    //                 /*$(".tunnel_body_"+data.value).remove();*/
    //             }else if(data.type=="gateway_change_result"){
    //                 if(data.data.value==1){
    //                     $(".tunnel_gate_"+data.data.id).html('<i class="fa fa-check" style="color:#1D9E74"></i>');
    //                     $(".tunnel_gate_"+data.data.id).attr("data-val", data.data.value);
    //                     $(".tunnel_gate_"+data.data.id).attr("data-original-title", "Yes");
    //                 }else if(data.data.value==0){
    //                     $(".tunnel_gate_"+data.data.id).html('<i class="fa fa-times" style="color:#DA3838"></i>');
    //                     $(".tunnel_gate_"+data.data.id).attr("data-val", data.data.value);
    //                     $(".tunnel_gate_"+data.data.id).attr("data-original-title", "No");
    //                 }
    //                 notify_msg("success", "Gateway changed successfully");
    //             }else if(data.type=="bidirection_change_result"){
    //                 if(data.data.value==0){
    //                     $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left"><i class="fa fa-chevron-right"></i>');
    //                     $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
    //                     $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 1");
    //                 }else if(data.data.value==1){
    //                     $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>');
    //                     $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
    //                     $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 2");
    //                 }else if(data.data.value==2){
    //                     $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right"></i>');
    //                     $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
    //                     $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 3");
    //                 }else if(data.data.value==3){
    //                     $(".tunnel_bi_"+data.data.id).html('<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>');
    //                     $(".tunnel_bi_"+data.data.id).attr("data-val", data.data.value);
    //                     $(".tunnel_bi_"+data.data.id).attr("data-original-title", "Mode 4");
    //                 }
    //                 notify_msg("success", "Bidirection mode changed successfully");
    //             }else if(data.type=="group_change_result"){
    //                 if(data.data.value in group_arr){
    //                     $(".tunnel_grp_"+data.data.id).attr('data-val',data.data.value);
    //                     $(".tunnel_grp_"+data.data.id).html(group_arr[data.data.value]);
    //                     $(".tunnel_grp_"+data.data.id).parent("div").closest('.tunnel_chk').addClass('tunnel_grp_chk_'+data.data.value);
    //                     $(".tunnel_grp_"+data.data.id).attr('data-original-title','Group '+group_arr[data.data.value]);
    //                 }else{
    //                     data.data.value=0;
    //                     if(data.data.value in group_arr){
    //                         $(".tunnel_grp_"+data.data.id).attr('data-val',data.data.value);
    //                         $(".tunnel_grp_"+data.data.id).html(group_arr[data.data.value]);
    //                         $(".tunnel_grp_"+data.data.id).parent("div").closest('.tunnel_chk').addClass('tunnel_grp_chk_'+data.data.value);
    //                         $(".tunnel_grp_"+data.data.id).attr('data-original-title','Group '+group_arr[data.data.value]);
    //                     }
    //                 }
    //                 notify_msg("success", "Group changed successfully");
    //             }else if(data.type=="internet_change_result"){
    //                 if(data.data.value==1){
    //                     $(".tunnel_internet_"+data.data.id).html('<i class="fa fa-fw fa-globe" style="color:#1D9E74"></i>');
    //                     $(".tunnel_internet_"+data.data.id).attr("data-val", data.data.value);
    //                 }else if(data.data.value==0){
    //                     $(".tunnel_internet_"+data.data.id).html('<i class="fa fa-fw fa-globe" style="color:#393333"></i>');
    //                     $(".tunnel_internet_"+data.data.id).attr("data-val", data.data.value);
    //                 }
    //                 notify_msg("success", "Internet changed successfully");
    //             }else if(data.type=="route_change_result"){
    //                 if(data.data.value==1){
    //                     $(".tunnel_route_"+data.data.id).html('<i class="fa fa-fw fa-road" style="color:#1D9E74"></i>');
    //                     $(".tunnel_route_"+data.data.id).attr("data-val", data.data.value);
    //                 }else if(data.data.value==0){
    //                     $(".tunnel_route_"+data.data.id).html('<i class="fa fa-fw fa-road" style="color:#393333"></i>');
    //                     $(".tunnel_route_"+data.data.id).attr("data-val", data.data.value);
    //                 }
    //                 notify_msg("success", "Route changed successfully");
    //             }else if(data.type=="edit_email_result"){
    //                 $(".tunnel_email_"+data.data.id).html('<a href="javascript:void(0);" class="email sck_editable" data-type="text" data-pk="'+data.data.id+'" data-title="Enter Email ID">'+data.data.value+'</a>');
    //                 $(".tunnel_email_"+data.data.id).attr("data-original-title", data.data.value);
    //                 $(".sck_editable").trigger("click");
    //             }else if(data.type=="edit_display_result"){
    //                 $(".tunnel_display_"+data.data.id).html('<a href="javascript:void(0);" class="display sck_editable" data-type="text" data-pk="'+data.data.id+'" data-title="Enter display_name">'+data.data.value+'</a>');
    //                 $(".tunnel_display_"+data.data.id).attr("data-original-title", data.data.value);
    //                 $(".sck_editable").trigger("click");
    //             }else if(data.type=="change_location_result"){
    //                 $(".tunnel_location_"+data.data.id).html('<a href"javascript:void(0);" class="change_location sck_editable" data-type="select" data-source="request.php?request=get_server_name" data-pk="'+data.data.id+'">'+location_option[data.data.value]+'</a>');
    //                 $(".tunnel_display_"+data.data.id).attr("data-original-title", data.data.value);
    //                 $(".sck_editable").trigger("click");
    //             }else if(data.type=="change_tunnel_to_server_result"){
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_yellow");
    //                 $(".not_client_"+data.data.id).html("");
    //                 $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-up"></i>');
    //                 $(".change_tunnel_"+data.data.id).attr("data-type", "client");
    //             }else if(data.type=="change_tunnel_to_client_result"){
    //                 var html="";
    //                 html+='<div class="meta width-100" data-toggle="tooltip" title="Not assigned"><a href="javascript:void(0);" class="real_ip real_ip_'+data.data.id+'" data-val="-1" data-id="'+data.data.id+'">Not assigned</a></div>';
    //                 html+='<div class="meta cursor"><div class="gateway tunnel_gate_'+data.data.id+'" type="data" data-toggle="tooltip" title="No" data-cast="" data-val="0" data-id="'+data.data.id+'"><i class="fa fa-times" style="color:#DA3838"></i></div></div>';
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").removeClass("bg_yellow");
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_green");
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").css("width","1383px");
    //                 $(".not_client_"+data.data.id).html(html);
    //                 $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-down"></i>');
    //                 $(".change_tunnel_"+data.data.id).attr("data-type", "server");
    //             }else if(data.type=="add_tunnels_result"){
    //                 var res_data=tunnels(data.data, packages);
    //                 $("#tunnel_body").append(res_data);
    //                 $(".tunnel_editable").trigger("click");
    //                 notify_msg("success", "A new tunnel created successfully");
    //             }else if(data.type=="add_server_clone_result"){
    //                 var res_data=tunnels(data.data, packages);
    //                 $("#tunnel_body").append(res_data);
    //                 $(".tunnel_editable").trigger("click");
    //                 notify_msg("success", "Server clone created");
    //             }else if(data.type=="add_client_clone_result"){
    //                 var res_data=tunnels(data.data, packages);
    //                 $("#tunnel_body").append(res_data);
    //                 $(".tunnel_editable").trigger("click");
    //                 notify_msg("success", "Client clone created");
    //             }else if(data.type=="change_tunnel_server_result"){
    //                 var html="";
    //                 html+='<div class="meta width-100" data-toggle="tooltip" title="Not assigned"><a href="javascript:void(0);" class="real_ip real_ip_'+data.data.id+'" data-val="-1" data-id="'+data.data.id+'">Not assigned</a></div>';
    //                 html+='<div class="meta cursor"><div class="gateway tunnel_gate_'+data.data.id+'" type="data" data-toggle="tooltip" title="No" data-cast="" data-val="0" data-id="'+data.data.id+'"><i class="fa fa-times" style="color:#DA3838"></i></div></div>';
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").removeClass("bg_yellow");
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_green");
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").css("width","1383px");
    //                 $(".not_client_"+data.data.id).html(html);
    //                 $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-down"></i>');
    //                 $(".change_tunnel_"+data.data.id).attr("data-type", "server");
    //                 notify_msg("success", "Client converted into server successfully done");
    //             }else if(data.type=="change_tunnel_client_result"){
    //                 $(".change_tunnel_"+data.data.id).parent(".meta").parent(".list_body").addClass("bg_yellow");
    //                 $(".not_client_"+data.data.id).html("");
    //                 $(".change_tunnel_"+data.data.id).html('<i class="fa fa-long-arrow-up"></i>');
    //                 $(".change_tunnel_"+data.data.id).attr("data-type", "client");
    //                 notify_msg("success", "Server converted into client successfully done");
    //             }else if(data.type=="request_real_ip_result"){
    //                 $(".real_ip_"+data.data.id).html('<a href="javascript:void(0);" style="color:#1D9E74;" class="real_ip real_ip_'+data.data.id+'" data-val="1" data-id="'+data.data.id+'">'+data.data.real_ip+'</a>');
    //                 $(".real_ip_"+data.data.id).attr("data-val", 1);
    //             }else if(data.type=="real_ip_status_result"){
    //                 if(data.data.value==1){
    //                     $(".real_ip_"+data.data.id).css("color", "#1D9E74");
    //                     $(".real_ip_"+data.data.id).attr("data-val", 1);
    //                 }else if(data.data.value==0){
    //                     $(".real_ip_"+data.data.id).css("color", "#1B1E24");
    //                     $(".real_ip_"+data.data.id).attr("data-val", 0);
    //                 }
    //                 notify_msg("success", "Real ip status has been changed");
    //             }else if(data.type=="delete_tunnel_result"){
    //                 $(".tunnel_body_"+data.data.data.id).remove();
    //                 notify_msg("success", "Tunnel deleted successfully");
    //             }else if(data.type=="save_a_tunnel"){
    //                 $(".overlay_"+data.value).css("display", "block");
    //             }else if(data.type=="save_all_tunnel"){
    //                 $.each(data.ids, function(key, val){
    //                     $(".overlay_"+val).css("display", "block");
    //                 });
    //             }
    //             // by tanay
    //             else if(data.type=="doupdate_profile"){
    //                 $("#name").val(data.value.name);
    //                 $("#phone").val(data.value.phone);
    //                 $("#remail").val(data.value.remail);
    //             }else if(data.type=="update_plan"){
    //                 $( "#radio1" ).prop( "checked", false );
    //                     $( "#radio2" ).prop( "checked", false );
    //                     if(data.value.plan_id==1){
    //                     $( "#radio1" ).prop( "checked", true );
    //                }else{
    //                     $( "#radio2" ).prop( "checked", true );
    //                }
    //             }
    //         });
    //     },
    //     function() {
    //         //alert('WebSocket connection closed');
    //     },
    //     {'skipSubprotocolCheck': true}
    // );

    //redchat websocket data sending function
    /*function send( text ) {
        conn.publish(token, text);
    }*/

    var group_arr=['<span style="color: #ea4335;"><strong>A</strong></span>', '<span style="color: #839D1C;"><strong>B</strong></span>', '<span style="color: #00A998;"><strong>C</strong></span>', '<span style="color: #F6AE00;"><strong>D</strong></span>', '<span style="color: #4285F4;"><strong>E</strong></span>', '<span style="color: #330033;"><strong>F</strong></span>', '<span style="color: #FF404E;"><strong>G</strong></span>', '<span style="color: #FFFF00;"><strong>H</strong></span>', '<span style="color: #FF3300;"><strong>I</strong></span>', '<span style="color: #CC6600;"><strong>J</strong></span>', '<span style="color: #9999CC;"><strong>K</strong></span>', '<span style="color: #0000CC;"><strong>L</strong></span>', '<span style="color: #FF0000;"><strong>M</strong></span>', '<span style="color: #003366;"><strong>N</strong></span>', '<span style="color: #003333;"><strong>0</strong></span>', '<span style="color: #FF00CC;"><strong>P</strong></span>', '<span style="color: #FF0066;"><strong>Q</strong></span>', '<span style="color: #CC0000;"><strong>R</strong></span>', '<span style="color: #CC6600;"><strong>S</strong></span>', '<span style="color: #666666;"><strong>T</strong></span>', '<span style="color: #330066;"><strong>U</strong></span>', '<span style="color: #CC99CC;"><strong>V</strong></span>', '<span style="color: #FFCC66;"><strong>W</strong></span>', '<span style="color: #FF3399;"><strong>X</strong></span>', '<span style="color: #99CCFF;"><strong>Y</strong></span>', '<span style="color: #0099FF;"><strong>Z</strong></span>'];

    $.ajax({
        url:"request.php?request=job_queue_info",
        success:function(resp){
            var data = $.parseJSON(resp);
            $.each(data, function(key, item){
                    $(".tunnel_"+item).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
                    $(".tunnel_"+item).removeClass("tunnel_chk");
                    $(".tunnel_"+item).attr("data-original-title", "Request submitted, please wait...");
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
        if($(".tunnel_"+$(this).attr("data-pk")).attr("data-val")==1){
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
        }
    });

    var location_option;
    $.ajax({
        url:"request.php?request=get_server_name",
        success:function(resp){
            //alert(resp);
            location_option=$.parseJSON(resp);
            //alert(location_option);
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

    $("#tunnel_form_close_btn").click(function(){
        $("#tunnel_form").html("");
        $("#tunnels_form_field").css("display", "none");
    })

    $('#tunnel_add_form_btn').click(function(){
        var cloud=$(this).attr("data-cloud");
        $.ajax({
            url:'request.php?request=addTunnel&token='+token,
            type:'POST',
            data:{"cloud_id":$(this).attr("data-val"), "mail_id":$(this).attr("data-mail")},
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
                    notify_msg("error", data.data);
                }else if(data.status==2){
                     notify_msg("error", data.data);
                }
            }
        });
  });

    $("body").on("click", ".delete_tunnel", function(){
        var id=$(this).attr('data-id');
        if($(".tunnel_"+id).attr("data-val")==1){
            var type=$(this).attr('data-type');
            var ths=$(this);
            if(confirm("Are you sure?")){
                $.ajax({
                    url:"request.php?request=delete_tunnel&id="+id+"&type="+type+", &token="+token,
                    success:function(data){
                        resp=$.parseJSON(data);
                        if(resp.status==1){
                            notify_msg("success", resp.data);
                            $(".overlay_"+id).css("display", "block");
                        }
                    }
                });
            }
        }else{
            notify_msg("error", "Please 1st select this tunnel");
        }
    });

    var status_arr=['<i class="fa fa-fw fa-circle" style="color:#DA3838"></i>', '<i class="fa fa-fw fa-circle" style="color:#1D9E74"></i>'];
    var gateway_arr=['<i class="fa fa-times" style="color:#DA3838"></i>', '<i class="fa fa-check" style="color:#1D9E74"></i>'];
    var internet_arr=['<i class="fa fa-globe" style="color:#393333"></i>', '<i class="fa fa-globe" style="color:#1D9E74"></i>'];
    var btn_arr=['#393333', '#1D9E74'];
    var biderection_arr=[
            '<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right"></i>',
            '<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>',
            '<i class="fa fa-chevron-left" style="color:#1D9E74"></i><i class="fa fa-chevron-right"></i>',
            '<i class="fa fa-chevron-left"></i><i class="fa fa-chevron-right" style="color:#1D9E74"></i>'
    ];

    //status change
    $('body').on('mousedown','.status',function(e){
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
                            var key = parseInt($(".tunnel_stat_"+id).attr('data-val'));
                            key=key+1;
                            if(key in status_arr){
                                //$('.gateway_'+id).val(key);
                                $(".tunnel_stat_"+id).attr('data-val',key);
                                $(".tunnel_stat_"+id).html(status_arr[key]);
                            }else{
                                key=0;
                                if(key in status_arr){
                                    //$('.gateway_'+id).val(key);
                                    $(".tunnel_stat_"+id).attr('data-val',key);
                                    $(".tunnel_stat_"+id).html(status_arr[key]);
                                    alert(token);
                                }
                            }
                            $.ajax({
                                url:"request.php?request=status_change&id="+id+"&val="+key+"&token="+token,
                                success:function(resp){
                                    //alert(JSON.stringify(resp['value']));
                                    var data=$.parseJSON(resp);
                                    if(data.status==1){

                                    }
                                }
                            });
                        }
                    });$(".status").attr("data-pos", 1);
                } else if($(".tunnel_"+id).attr('data-val')==0){
                    $(".status").attr("data-pos", 0);
                    $(".tunnel_chk").each(function(){
                        if($(this).attr('data-val')==1){
                            var id=$(this).attr('data-id');
                            var key = parseInt($(ths).attr('data-val'));
                            if(key in status_arr){
                                $(".tunnel_stat_"+id).attr('data-val',key);
                                $(".tunnel_stat_"+id).html(status_arr[key]);
                            }else{
                                key=0;
                                if(key in status_arr){
                                    $(".tunnel_stat_"+id).attr('data-val',key);
                                    $(".tunnel_stat_"+id).html(status_arr[key]);
                                }
                            }
                            $.ajax({
                                url:"request.php?request=status_change&id="+id+"&val="+key+"&token="+token,
                                success:function(resp){
                                    var data=$.parseJSON(resp);
                                    if(data.status==1){

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
                if(key in status_arr){
                    $(this).attr('data-val',key);
                    $(".tunnel_gateway_"+count).attr('value',key);
                    $(this).html(gateway_arr[key]);
                }else{
                    key=0;
                    if(key in status_arr){
                        $(this).attr('data-val',key);
                        $(".tunnel_gateway_"+count).attr('value',key);
                        $(this).html(gateway_arr[key]);
                    }
                }
            }
        }
    });

    //gateway change
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
                                var key = parseInt($(".tunnel_gate_"+id).attr('data-val'));
                                key=key+1;
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
                    if($(".tunnel_grp_chk_"+val).hasClass("tunnel_chk")){
                        $(".tunnel_grp_chk_"+val).html("<i class='fa fa-fw fa-check-square-o'></i>");
                        $(".tunnel_grp_chk_"+val).attr("data-val", 1);
                        $(".tunnel_grp_chk_"+val).attr("data-val", 1);
                        $(".tunnel_grp_chk_"+val).parent('.list_body').addClass('row_chk');
                    }
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
                        if(key in btn_arr){
                            $(".tunnel_internet_"+id).attr('data-val',key);
                            $(".tunnel_internet_"+id).css("background-color", "#b9c3c8");
                            $(".tunnel_internet_"+id).css("opacity", "1");
                            $(".tunnel_internet_"+id).css("color", "white");
                            $(ths).css("background-color", "#b9c3c8");
                        }else{
                            key=0;
                            if(key in btn_arr){
                                $(".tunnel_internet_"+id).attr('data-val',key);
                                $(".tunnel_internet_"+id).css("background-color", "transparent");
                                $(".tunnel_internet_"+id).css("opacity", "0.35");
                                $(".tunnel_internet_"+id).css("color", "black");
                                $(ths).css("background-color","transparent");
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
                        if(key in btn_arr){
                            $(".tunnel_internet_"+id).attr('data-val',key);
                            $(".tunnel_internet_"+id).css("background-color", "#b9c3c8");
                            $(".tunnel_internet_"+id).css("opacity", "1");
                            $(".tunnel_internet_"+id).css("color", "white");
                            $(ths).css("background-color", "#b9c3c8");
                        }else{
                            key=0;
                            if(key in btn_arr){
                                $(".tunnel_internet_"+id).attr('data-val',key);
                                $(".tunnel_internet_"+id).css("background-color", "transparent");
                                $(".tunnel_internet_"+id).css("opacity", "0.35");
                                $(".tunnel_internet_"+id).css("color", "black");
                                $(ths).css("background-color", "transparent");
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
                        if(key in btn_arr){
                            $(".tunnel_route_"+id).attr('data-val',key);
                            $(".tunnel_route_"+id).css("background-color", "#b9c3c8");
                            $(".tunnel_route_"+id).css("opacity", "1");
                            $(".tunnel_route_"+id).css("color", "white");
                            $(ths).css("background-color", "#b9c3c8");
                        }else{
                            key=0;
                            if(key in btn_arr){
                                $(".tunnel_route_"+id).attr('data-val',key);
                                $(".tunnel_route_"+id).css("background-color", "transparent");
                                $(".tunnel_route_"+id).css("opacity", "0.35");
                                $(".tunnel_route_"+id).css("color", "black");
                                $(ths).css("background-color", "transparent");
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
                        if(key in btn_arr){
                            $(".tunnel_route_"+id).attr('data-val',key);
                            $(".tunnel_route_"+id).css("background-color", "#b9c3c8");
                            $(".tunnel_route_"+id).css("opacity", "1");
                            $(".tunnel_route_"+id).css("color", "white");
                            $(ths).css("background-color", "#b9c3c8");
                        }else{
                            key=0;
                            if(key in btn_arr){
                                $(".tunnel_route_"+id).attr('data-val',key);
                                $(".tunnel_route_"+id).css("background-color", "transparent");
                                $(".tunnel_route_"+id).css("opacity", "0.35");
                                $(".tunnel_route_"+id).css("color", "black");
                                $(ths).css("background-color", "transparent");
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
        if($(".tunnel_"+id).attr("data-val")==1){
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
                            //send(resp);
                        }else if(data.status==2){
                            notify_msg("error", data.data);
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
                            notify_msg("error", data.data);
                        }
                    }
                });
            }
        } else{
            notify_msg("error", "Please 1st seect this tunnel");
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
        /*$(".display").trigger("click");
        $(".change_location").trigger("click");*/
    });

    $("body").on("click", ".tunnel_chk", function(){
        var html="";
        var val=$(this).attr("data-val");
        var id=$(this).attr("data-id");
        if(val==0){
            $(this).html("<i class='fa fa-fw fa-check-square-o'></i>");
            $(this).attr("data-val", 1);
            $(this).parent('.list_body').addClass('row_chk');
            /*if($("#p_div_"+id).html()!=null){
                html+='<a class="btn holbol acc_type cursor acc_type_'+id+' " style="margin-left: 0px;" data-id="'+id+'" data-val="1" data-toggle="tooltip" data-placement="bottom" title="Basic">Basic</a>';
                html+='<a data-val="0" class="btn holbol route_change cursor tunnel_route_'+id+'" type="data" data-pos="0" data-id="'+id+'" style="background-color:#393333">Route</a>';

                html+='<a data-val="0" class="btn holbol internet_change cursor tunnel_internet_'+id+'" type="data" data-pos="0" data-id="'+id+'" style="background-color:#393333">Internet</a>';
                $("#p_div_"+id).html(html);
            }*/
        }else if(val==1){
            $(this).html("<i class='fa fa-fw fa-square-o'></i>");
            $(this).attr("data-val", 0);
            $(this).parent('.list_body').removeClass('row_chk');
            //$("#p_div_"+id).html("");
            // $("#chk_all_tunnel").attr("data-chk", 0);
        }
        // $(".display_"+$(this).attr("data-id")).trigger("click");
        // $(".location_"+$(this).attr("data-id")).trigger("click");
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
                 $("#tunnel_body").html(tunnels(data));
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
        if($(".tunnel_"+id).attr("data-val")==1){
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
                            //send(resp);
                        }else{
                            notify_msg("error", data.data);
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
                            //send(resp);
                        }
                    }
                });
            }
        }else{
            notify_msg("error", "Please 1st select this tunnel");
        }
    });

    $("body").on("click", ".change_location", function(){
        if($(".tunnel_"+$(this).attr("data-pk")).attr("data-val")==1){
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
        }
    });

    $(".tunnel_editable").trigger("click");

    $("body").on("click", ".change_tunnel", function(){
        var id=$(this).attr("data-id");
        if($(".tunnel_"+id).attr("data-val")==1){
            var type=$(this).attr("data-type");
            if(type == "server")
            {
                $(this).attr("data-type", "client");
                $(this).css("opacity", "0.25");
                $(this).css("color", "black");
                $(this).css("background-color", "transparent");
            } else if(type == "client")
            {
                $(this).attr("data-type", "server");
                $(this).css("background-color", "#b9c3c8");
                $(this).css("opacity", "1");
                $(this).css("color", "white");
            }
            $.ajax({
                url:"request.php?request=change_tunnel&id="+id+"&type="+type+"&token="+token,
                success:function(resp){
                    data=$.parseJSON(resp);
                    if(data.status==1){
                       // notify_msg("success", data.data);
                      //  $(".tunnel_"+data.value.id).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
                      //  $(".tunnel_"+data.value.id).removeClass("tunnel_chk");
                      //  $(".tunnel_"+data.value.id).attr("data-original-title", "Request submitted, please wait...");
                      //  send(resp);
                    }
                }
            });
        }else{
            notify_msg("error", "Please 1st select this tunnel");
        }
    });

    $("body").on("click", ".save_this_client", function(){
        var id = $(this).attr("data-id");
        $.ajax({
            url:"request.php?request=save_a_tunnel&id="+id+"&token="+token,
            success:function(resp){
                data=$.parseJSON(resp);
                if(data.status==1){
                    notify_msg("success", data.data);
                    $(".tunnel_"+id).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
                    $(".tunnel_"+id).removeClass("tunnel_chk");
                    $(".tunnel_"+id).attr("data-original-title", "Request submitted, please wait...");
                    $(".tunnel_body_"+id).removeClass("row_chk");
                    send(resp);
                }else if(data.status==0){
                    notify_msg("error", data.data);
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
                        $(".tunnel_"+val).html("<i class='fa fa-fw fa-circle-o-notch fa-spin'></i>");
                        $(".tunnel_"+val).removeClass("tunnel_chk");
                        $(".tunnel_"+val).attr("data-original-title", "Request submitted, please wait...");
                        $(".tunnel_body_"+val).removeClass("row_chk");
                    });
                    send(resp);
                }else if(data.status==0){
                    notify_msg("error", data.data);
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

    $("body").on("click", ".acc_type", function(){
        var id=$(this).attr("data-id");
        var ths=$(this);
        var val=ths.attr("data-val");
       //if($(".tunnel_"+id).attr("data-val")!=1){
        /*    if(val==1){
                val=2;
            }else if(val==2){
                val=1;
            }*/
        //}
        $(".tunnel_chk").each(function() {
            var tid=$(this).attr("data-id");
            if($(this).attr("data-val")==1 && tid == id) {
                //   var tid=$(this).attr("data-id");
                // alert(val);
                if (val == 1) {
                    val = 2;
                    $(".acc_type_" + id).attr("data-val", 2);
                    $(".acc_type_" + id).html("Premium");
                    $(".acc_type_" + id).css("opacity", "0.25");
                    $(".acc_type_" + id).css("color", "black");
                    $(".acc_type_" + id).css("background-color", "transparent");
                } else if (val == 2) {
                    val = 1;
                    $(".acc_type_" + id).attr("data-val", 1);
                    $(".acc_type_" + id).html("Premium");
                    $(".acc_type_" + id).css("color", "white");
                    $(".acc_type_" + id).css("opacity", "1");
                    $(".acc_type_" + id).css("background-color", "#b9c3c8");
                }
                //  alert(".acc_type_"+id);
                // alert(val);
                $.ajax({
                    url: "request.php?request=plan_change&id=" + id + "&val=" + val + "&token=" + token,
                    success: function (resp) {
                        /*var data=$.parseJSON(resp);
                         if(data.status==1){
                         // notify_msg("success", data.data);
                         // $(".tunnel_route_"+id).addClass("inactive");
                         // $(".tunnel_route_"+id).attr("data-original-title", "This field is processing its last job, please wait...");
                         //send(resp);
                         }*/
                    }
                });
            }
        });
            //}
        //});
    });

    //for acl modal
    $(".simple").show();
     $(".advanced").hide();
   $(".sm").click(function(){
      $('.advanced').show();
      $('.simple').hide();

   });

      $(".ad").click(function(){
      $('.simple').show();
      $('.advanced').hide();

   });


    var box_btn_val;
    $("body").on('click', '.showACL', function(){
        //$("#aclModal").modal("show");
        var opened = $(this).hasClass('open');
        var tunnel_id = $(this).attr("data-id");
        var cloud = $(this).attr("data-cloud");
        var ths = $(this);
        if(!opened){
            $(this).addClass('open');

            $.ajax({
                url:"request.php?request=get_acl_info&id="+tunnel_id,
                success:function(resp){
                    var data = $.parseJSON(resp);
                    box_btn_val = data;
                    if(data.status != undefined && data.status == 0){
                        notify_msg("error", data.message);
                    }
                    else{
                    $(".source_acl_content_"+ths.attr("data-id")).html('');
                    $(".destination_acl_content_"+ths.attr("data-id")).html('');
                    acl(data, null, tunnel_id);
                    $(".box").trigger("mouseover");
                     $(".tunnel_acl_div_"+ths.attr("data-id")).toggle();
                  }
                }
            });
            //if($(".source_acl_content_"+tunnel_id).html()==""){
                // alert("Source=="+$(".source_acl_content_"+ths.attr("data-id")).html());
                // alert($(".destination_acl_content_"+ths.attr("data-id")).html());
            //}
        }
        else{
            $(this).removeClass('open');
            $(".source_acl_content_"+ths.attr("data-id")).next('div');
            $(".destination_acl_content_"+ths.attr("data-id")).next('div');
            $('.tunnel_acl_div_'+ths.attr("data-id")).toggle();
        }
    });

    $("body").on("click", ".font-awesome", function(){
        var btn_type = $(this).attr("btn-type");
        var acl_id = $(this).attr("data-id");
        var tid = $(this).attr("data-tid");
        //alert(btn_type);
        if(btn_type=="clone"){
            if(confirm("Are you sure?")){
                $.ajax({
                    url:"request.php?request=create_acl_clone&id="+acl_id+"&tid="+tid+"&token="+token,
                    success:function(resp){
                        alert(resp);
                    }
                });
            }
        }
        if(btn_type=="delete"){
            if(confirm("Are you sure want to delete?")){
                $.ajax({
                    url:"request.php?request=delete_acl&id="+acl_id+"&tid="+tid+"&token="+token,
                    success:function(resp){
                        data=$.parseJSON(resp);
                        if(data.status==1){
                            notify_msg("success", data.data);
                        }
                    }
                });
            }
        }
        if(btn_type=="clear"){
            if(confirm("Are you sure want to clear all data?")){
                $.ajax({
                    url:"request.php?request=clear_acl_values&id="+acl_id+"&tid="+tid+"&token="+token,
                    success:function(resp){
                        data=$.parseJSON(resp);
                        if(data.status==1){
                            notify_msg("success", data.data);
                        }
                    }
                });
            }
        }
        if(btn_type=="change"){
            alert($(this).attr("data-val"));
            if(confirm("Are you sure want to change ACL base?")){
                $.ajax({
                    url:"request.php?request=change_acl&id="+acl_id+"&tid="+tid+"&token="+token+"&val="+$(this).attr("data-val"),
                    success:function(resp){
                        data=$.parseJSON(resp);
                        if(data.status==1){
                            notify_msg("success", data.data);
                        }
                    }
                });
            }
        }
        if(btn_type=="save"){
            if(!$.isEmptyObject(acl_value)){
                $.ajax({
                    url:"request.php?request=save_acl_values",
                    data:{tid:tid, token:token, data:acl_value},
                    type:"POST",
                    success:function(resp){
                        data=$.parseJSON(resp);
                        if(data.status==1){
                            notify_msg("success", data.data);
                            acl_value={};
                        }
                    }
                });
            }
        }
    });

    $("#simple_Destination").click(function(){
        $("#simple_tool_body").css("display", "block");
        $("#simple_tool_source").css("display", "none");
        $("#simple_tool_destination").css("display", "block");
    });

    $("#simple_Source").click(function(){
        $("#simple_tool_body").css("display", "block");
        $("#simple_tool_destination").css("display", "none");
        $("#simple_tool_source").css("display", "block");
    });

    $("#advance_destination").click(function(){
        //$(".series").css("display", "block");
        $(".series").css("display", "none");
        $("#advance_destination_own_div").css("display", "block");
        $("#advance_destination_full_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "none");
    });

    $("#advance_source").click(function(){
        //$(".series").css("display", "block");
        $(".series").css("display", "none");
        $("#advance_source_own_div").css("display", "block");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "block");
    });

    $("#advance_destination_forwarding").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "block");
        $("#advance_destination_forwarding_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "none");
    });

    $("#advance_source_firewall").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_source_firewall_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "block");
    });

    $("#advance_source_tos").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_source_tos_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "block");
    });

    $("#advance_source_qos").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_source_qos_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "block");
    });

    $("#advance_source_forwarding").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_source_forwarding_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "none");
        $("#advance_source_full_div").css("display", "block");
    });

    $("#advance_cloud_forwarding").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_cloud_forwarding_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "block");
        $("#advance_source_full_div").css("display", "none");
    });

    $("#advance_cloud_qos").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_cloud_qos_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "block");
        $("#advance_source_full_div").css("display", "none");
    });

    $("#advance_cloud_routing").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_cloud_routing_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "block");
        $("#advance_source_full_div").css("display", "none");
    });

    $("#advance_cloud_firewall").click(function(){
        $(".series").css("display", "none");
        $("#advance_destination_full_div").css("display", "none");
        $("#advance_cloud_firewall_div").css("display", "block");
        $("#advance_cloud_full_div").css("display", "block");
        $("#advance_source_full_div").css("display", "none");
    });

    $("#acl_modal_close").click(function(){
        $(".series").css("display", "block");
        $(".simple").css("display", "block");
        $(".advanced").css("display", "none");
        $("#simple_tool_body").css("display", "none");
        $("#advance_source_full_div").css("display", "none");
        $("#advance_cloud_full_div").css("display", "none");
    });

    dialog = $( "#dialog-form" ).dialog({
      minWidth: 700,
      modal: false,
      autoOpen: false
    });

    dialog_sponsore = $( "#dialog-sponsore-form" ).dialog({
      minWidth: 700,
      modal: false,
      autoOpen: false
    });

    var box_ths;
    /*$( "body" ).on( "click", ".box", function() {
        var id = $(this).attr("data-id");
        //alert($(".destination_"+id).find("b").length);
        var type = $(this).attr('data-type');
        var cloud = $(this).attr('data-cloud');
        var tunnel_id = $(this).attr('data-tid');
        //$(".btn_add_acl_"+tunnel_id).attr("data-id", id);
        box_ths = $(this);
        var html="";
        $.each(box_btn_val[id][type], function(key, val){
            if(key == "specific_tunnel" || key == "specific_group"){
                html+='<button class="btn btn-primary acl_spl_btn" data-tid="'+tunnel_id+'" data-cloud="'+cloud+'" data-type="'+type+'" data-id="'+id+'" data-value="'+key+'" type="button">'+val.label+'</button>';
            }else if(key == "ip_port" || key == "ip_port_protoco"){
                html+='<button class="btn btn-primary acl_ip_spl_btn" data-tid="'+tunnel_id+'" data-cloud="'+cloud+'" data-type="'+type+'" data-id="'+id+'" data-value="'+key+'" type="button">'+val.label+'</button>';
            } else{
                html+='<button class="btn btn-primary acl_btn" data-type="'+type+'" data-id="'+id+'" data-value="'+key+'" type="button">'+val.label+'</button>';
            }
        });
        html+='<div class="row">';
            html+='<div class="col-md-12 t20" style="display:none;">';
                html+='<input type="text" class="acl_val_text" data-type="'+type+'" data-id="'+id+'" style="margin-right:10px;">';
                html+='<button class="btn btn-sm btn-info update_acl" data-type="'+type+'" data-id="'+id+'" type="button">Update</button>';
                html+='<button class="btn btn-warning reset_acl" data-type="'+type+'" data-id="'+id+'" type="button">Reset</button>';
            html+='</div>';
        html+='</div>';aaa

        html+='<div class="row">';
            html+='<div class="col-md-12 one-day" style="display:none;">';
                html+='<select class="acl_option" class="" data-type="'+type+'" data-id="'+id+'">';
                html+='</select>';
                //html+='<input type="checkbox" class="btn btn-sm btn-default" data-type="'+type+'" data-id="'+id+'"/> This tunnel';
            html+='</div>';
        html+='</div>';

        html+='<div class="row">';
            html+='<div class="col-md-12 ranji" style="display:none;">';
            html+='</div>';
        html+='</div>';
        if(type=="destination" || type=="source"){
            $("#acl_div_cont").html(html);
            dialog.dialog( "open" );
        } else{
            if($(".destination_"+id).find("div").length>0 && $(".source_"+id).find("div").length>0){
                $("#acl_div_cont").html(html);
                dialog.dialog( "open" );
            }
        }

    });*/

    var popOverSettings = {
    //toggle:"popover",
    placement:"right",
    html: true,
    trigger: "hover",
    selector: '.box-con',
    content: function () {
        var html = '';
        $(this).children('div').each(function(){
            var value = $(this).attr("title");
            var color = $(this).attr("style").split(":");
            if(color[0]=="display"){
                var style = $(this).attr("style").split("; ");
                b_clr = style[1].split(":");
                //alert(style[2]);
                html += ' <b style="background-color:'+b_clr[1]+'">'+value+'</b>';
            }
            if(color[0] == "background-color"){
                html += ' <b style="background-color:'+color[1]+'">'+value+'</b>';
            }

        });
        return html;
        }
    };

    var counter;

    /*$('body').popover(
        popOverSettings
    );*/

    /*$("body").on("mouseover", ".box-con", function(){
        //alert("dshjf");
        $(this).webuiPopover({
                        trigger:'hover',
                        width:'auto',
                        delay:{
                            show:0,
                            hide:100
                        },
                        content: function () {
                                var html = '';

                                $(this).children('div').each(function(){
                                    var value = $(this).attr("title");
                                    var tunnel_id = $(this).attr("data-tid");
                                    var color = $(this).attr("style").split(":");
                                    var clas = $(this).prop("class").split(" ");
                                    if(clas[2] == undefined){
                                        clas[2]="";
                                    }

                                    if(color[0]=="display"){
                                        var style = $(this).attr("style").split("; ");
                                        b_clr = style[1].split(":");

                                        html+='<b class="popover-box '+clas[1]+' '+clas[2]+'" data-tid="'+tunnel_id+'" style="background-color:'+b_clr[1]+'; color:#fff; '+style[2]+'">'+value+'</b>';
                                    }
                                    if(color[0] == "background-color"){
                                        var style1 = $(this).attr("style").split("; ");
                                        //alert(style1[1]);
                                        //opacity = style1[1].split(":");
                                        html+='<b class="popover-box '+clas[1]+' '+clas[2]+'" data-tid="'+tunnel_id+'" style="background-color:'+color[1]+'; color:#fff; '+style1[1]+'">'+value+'</b>';
                                    }

                                });
                                return html;
                                }
                        });
    });*/

    /*$("body").on("mouseleave", ".box-con", function(){
        $(this).webuiPopover('destroy');
    });*/



    $("body").on("click", ".acl_btn", function(){
        var type = $(this).attr('data-type');
        var id = $(this).attr('data-id');
        var data = $(this).attr('data-value');
        $(".acl_val_text").attr("data-type", type);
        $(".acl_val_text").attr("data-id", id);
        $(".acl_val_text").attr("data-value", data);
        $(".acl_val_text").attr("data-text", $(this).text());
        if(data !="specific_tunnel" && data !="specific_group"){
            $.ajax({
                url:"request.php?request=get_acl_val",
                data:{"id":id, "type":type, "name":data},
                type:"POST",
                success:function(resp){
                    if(resp!=0){
                        $(".acl_val_text").val(resp);
                    } else{
                        $(".acl_val_text").val("");
                    }
                    $(".one-day, .ranji").css("display", "none");
                    $(".t20").css("display", "block");
                }
            });
        }
    });

    $("body").on("click", ".acl_ip_spl_btn", function(){
        var type = $(this).attr('data-type');
        var id = $(this).attr('data-id');
        var data = $(this).attr('data-value');
        var html="";
        //if(data=="ip_port"){
            html+='<div class="row">';
                html+='<div class="col-md-4">';
                    html+='<input type="text" class="acl_ip_text" data-type="'+type+'" data-id="'+id+'" style="margin-right:10px;" placeholder="Enter IP address..."><label class="error" style="background-color:#FFFFFF"></label>';
                html+='</div>';
                html+='<div class="col-md-4">';
                    html+='<input type="text" class="acl_ip_port" data-type="'+type+'" data-id="'+id+'" style="margin-right:10px;" placeholder="Enter IP port..."><label class="error" style="background-color:#FFFFFF"></label>';
                html+='</div>';

        //}else if(data=="ip_port_protoco"){

        //}
            html+='<div class="col-md-4">';
                html+='<input type="button" class="btn acl_ip_btn" data-type="'+type+'" data-id="'+id+'" value="Save">';
            html+='</div>';
        html+='</div>';

        $(".ranji").html(html);

        $(".acl_ip_text").attr("data-type", type);
        $(".acl_ip_text").attr("data-id", id);
        $(".acl_ip_text").attr("data-value", data);
        $(".acl_ip_text").attr("data-text", $(this).text());
        if(data !="specific_tunnel" && data !="specific_group"){
            $.ajax({
                url:"request.php?request=get_acl_val",
                data:{"id":id, "type":type, "name":data},
                type:"POST",
                success:function(resp){
                    res = resp.split(",");
                    if(resp!=0){
                        $(".acl_ip_text").val(res[0]);
                        $(".acl_ip_port").val(res[1]);
                    } else{
                        $(".acl_ip_text").val("");
                        $(".acl_ip_port").val("");
                    }
                    $(".ranji").css("display", "block");
                    $(".one-day, .t20").css("display", "none");
                }
            });
        }
    });

    $("body").on("click", ".acl_ip_btn", function(){
        var type = $("#acl_ip_text").attr('data-type');
        var id = $("#acl_ip_text").attr('data-id');
        var text = $("#acl_ip_text").attr("data-text");
        var ips = [];
        var ports = [];
        var i=0;
        var val="";
        $("input[name='ip[]']").each(function() {
            i++;
            ips.push($(this).val());
        });
        $("input[name='port[]']").each(function() {
            ports.push($(this).val());
        });
        for(j=0; j<i; j++){
            val += ips[j]+","+ports[j]+":";
        }
        //alert(val.replace(/:+$/, ''));
        if(ipv4addr($(".acl_ip_text").val()) == true){
            if(isNumber($(".acl_ip_port").val(), 4) == true){

                if(acl_value[id]==undefined)
                    acl_value[id]={};
                if(acl_value[id][type]==undefined)
                    acl_value[id][type]={};
                acl_value[id][type][text]=val.replace(/:+$/, '');
                $("."+text+"-"+type+"-"+id).css("opacity", 1);
                notify_msg("warning", "You have to save this settings...");

            }else {
                $(".acl_ip_port").next("label").html("Please enter valid 4 digit port number");
                $(".acl_ip_port").addClass("error");
            }
        }else{
            $(".acl_ip_text").next("label").html("Please enter valid IP address");
            $(".acl_ip_text").addClass("error");
        }
    });

    $("body").on("click", ".color-box", function(){
        if($(this).hasClass("no")){}else{
            var info = $(this).prop("class");
            var all = info.split(" ")[1].split("-");
            var field = all[0];
            var database = all[1];
            var id = all[2];
            var html="";

            if(field == "app" || field == "process" || field == "apps" || field == "processes"){
                // var get={"type":"get_"+field, "message_type":"request"};
                var get={"type":"get_app", "message_type":"request", "class":field+"-"+database+"-"+id};
                send(JSON.stringify(get));
                $("#acl_div_cont").html("<i class='fa fa-spinner fa-spin'></i>Please Wait... Your request under process.");
                dialog.dialog( "open" );
            } else if(field == "ip_port" || field == "ip_port_protoco"){
                $.ajax({
                    url:"request.php?request=get_acl_val",
                    data:{"id":id, "type":database, "name":field},
                    type:"POST",
                    success:function(resp){
                        if(resp.indexOf(":")==-1){
                            if(resp!=0){
                                var ips = resp.split(",");
                            }
                            html+='<div class="row">';
                                html+='<form class="ip-protoco-form">';
                                    html+='<div class="col-md-12 acl_ip_text_div acl_ip_text_div_1">';
                                        html+='<div class="col-md-4">';
                                            html+='<input type="text" id="acl_ip_text" class="acl_ip_text" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" style="margin-right:10px;" value="'+(resp!=0?ips[0]:"")+'" name="ip[]" placeholder="Enter IP address..."><label class="error" style="background-color:#FFFFFF"></label>';
                                        html+='</div>';
                                        html+='<div class="col-md-4">';
                                            html+='<input type="text" id="acl_ip_port" class="acl_ip_port" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" style="margin-right:10px;" value="'+(resp!=0?ips[1]:"")+'" name="port[]" placeholder="Enter IP port..."><label class="error" style="background-color:#FFFFFF"></label>';
                                        html+='</div>';
                                        html+='<div class="col-md-2">';
                                            html+='<a class="btn btn-danger acl-ip-data-delete" data-val="1"><i class="fa fa-trash"></i></a>';
                                        html+='</div>';
                                    html+='</div>';
                                html+='</form>';

                                html+='<div class="col-md-12 pull-right">';
                                    html+='<div class="col-md-2">';
                                        html+='<a class="btn btn-primary ip-protoco-btn" data-text="'+field+'" data-type="'+database+'" data-val="1" data-id="'+id+'"><i class="fa fa-plus"></i></a>';
                                    html+='</div>';
                                    html+='<div class="col-md-2">';
                                        html+='<input type="button" class="btn acl_ip_btn" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" value="Save">';
                                    html+='</div>';
                                html+='</div>';
                            html+='</div>';
                        } else{
                            var i=0;
                            ipNports=resp.split(":");
                            html+='<div class="row">';
                                html+='<form class="ip-protoco-form">';

                                    for (x in ipNports){
                                        i++;
                                        var ipNport = ipNports[x].split(",");
                                        html+='<div class="col-md-12 acl_ip_text_div acl_ip_text_div_'+i+'">';
                                            html+='<div class="col-md-4">';
                                                html+='<input type="text" id="acl_ip_text" class="acl_ip_text" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" style="margin-right:10px;" value="'+ipNport[0]+'" name="ip[]" placeholder="Enter IP address..."><label class="error" style="background-color:#FFFFFF"></label>';
                                            html+='</div>';
                                            html+='<div class="col-md-4">';
                                                html+='<input type="text" id="acl_ip_port" class="acl_ip_port" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" style="margin-right:10px;" value="'+ipNport[1]+'" name="port[]" placeholder="Enter IP port..."><label class="error" style="background-color:#FFFFFF"></label>';
                                            html+='</div>';
                                            html+='<div class="col-md-2">';
                                                html+='<a class="btn btn-danger acl-ip-data-delete" data-val="'+i+'"><i class="fa fa-trash"></i></a>';
                                            html+='</div>';
                                        html+='</div>';
                                    }


                                html+='</form>';
                                html+='<div class="row">';
                                    html+='<div class="col-md-12">';
                                        html+='<div class="col-md-1">';
                                            html+='<a class="btn btn-primary ip-protoco-btn" data-text="'+field+'" data-type="'+database+'" data-val="'+i+'" data-id="'+id+'"><i class="fa fa-plus"></i></a>';
                                        html+='</div>';

                                        html+='<div class="col-md-1">';
                                            html+='<input type="button" class="btn acl_ip_btn" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" value="Save">';
                                        html+='</div>';
                                    html+='</div>';
                                html+='</div>';
                        html+='</div>';
                        }
                        $("#acl_div_cont").html(html);
                        dialog.dialog( "open" );
                    }
                });

            } else if(field == "specific_tunnel" || field == "specific_group"){

                var tunnel = $(this).attr("data-tid");
                var res="";

                var ths = $(this);
                if(database == "destination" || database == "source"){
                    $.ajax({
                        url:"request.php?request=chk_res&type="+database+"&id="+id+"&val="+field,
                        success:function(resp){
                            res = $.parseJSON(resp);

                            if(field != "specific_group"){
                                $.ajax({
                                    url:"request.php?request=getTunnel&cloud="+user_cloud+"&dif=asc&type=tunnel",
                                    success:function(resp){
                                        data = $.parseJSON(resp);
                                        html+='<select class="acl_option" class="" multiple="multiple" data-value="'+field+'" data-type="'+database+'" data-id="'+id+'">';

                                            html+='<option>Select one...</option>';

                                            for(x in data){
                                                if(parseInt(res.exist_tunnel) != data[x].tunnel_id){
                                                    /*if(data[x].tunnel_id == tunnel){
                                                        html+='<option value="'+data[x].tunnel_id+'" '+(parseInt(res.option_val)==data[x].tunnel_id?"selected":"")+'>'+data[x].display_name+'(Group '+group_arr[data[x].group_id]+')(This tunnel)</option>';
                                                    }else {*/
                                                    if(res.option_val.indexOf(":")==-1){
                                                        html+='<option value="'+data[x].tunnel_id+'" '+(parseInt(res.option_val)==data[x].tunnel_id?"selected":"")+'>'+data[x].display_name+'(Group '+group_arr[data[x].group_id]+')</option>';
                                                    } else {
                                                        var tnls = res.option_val.split(":");
                                                        for(y in tnls){
                                                            html+='<option value="'+data[x].tunnel_id+'" '+(parseInt(tnls[y])==data[x].tunnel_id?"selected":"")+'>'+data[x].display_name+'(Group '+group_arr[data[x].group_id]+')</option>';
                                                        }
                                                    }
                                                    //}
                                                }
                                            }
                                        html+='</select>';
                                        $("#acl_div_cont").html(html);
                                        dialog.dialog( "open" );
                                    }
                                });
                            }else{
                                html+='<select class="acl_option" class="" multiple="multiple" data-value="'+field+'" data-type="'+database+'" data-id="'+id+'">';

                                    html+='<option>Select one...</option>';
                                    $.each(group_arr, function(key, val){
                                        if(res.option_val.indexOf(":")==-1){
                                            html+='<option value="'+key+'" '+(parseInt(res.option_val)==key?"selected":"")+'>Group '+val+'</option>';
                                        }else{
                                            var grps = res.option_val.split(":");
                                            for(y in grps){
                                                html+='<option value="'+key+'" '+(parseInt(grps[y])==key?"selected":"")+'>Group '+val+'</option>';
                                            }
                                        }
                                    });
                                html+='</select>';
                                $("#acl_div_cont").html(html);
                                dialog.dialog( "open" );
                            }
                        }
                    });
                }
            } else{
                $.ajax({
                    url:"request.php?request=get_acl_val",
                    data:{"id":id, "type":database, "name":field},
                    type:"POST",
                    success:function(resp){
                        var i=0;
                        html+='<div class="row">';
                            html+='<div class="acl-multi-val">';
                                if(resp.indexOf(":")==-1){
                                    i=1;
                                    html+='<div class="col-md-12 t20 t20_'+i+'">';
                                        html+='<input type="text" class="acl_val_text" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" name="acl_val[]" value="'+resp+'" style="margin-right:10px;margin-bottom:2px;">';
                                        html+='<a class="btn btn-sm btn-danger acl-val-input-delete" data-val="'+i+'" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'"><i class="fa fa-trash"></i></a>';

                                    html+='</div>';
                                } else{
                                    var arr = resp.split(":");
                                    for(x in arr){
                                        i++;
                                        html+='<div class="col-md-12 t20 t20_'+i+'">';
                                            html+='<input type="text" class="acl_val_text" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" name="acl_val[]" value="'+arr[x]+'" style="margin-right:10px;margin-bottom:2px;">';
                                            html+='<a class="btn btn-sm btn-danger acl-val-input-delete" data-val="'+i+'" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'"><i class="fa fa-trash"></i></a>';
                                        html+='</div>';
                                    }
                                }
                            html+='</div>';
                            html+='<div class="row">';
                                html+='<div class="col-md-12">';
                                    html+='<div class="col-md-1">';
                                        html+='<a class="btn btn-sm btn-primary multi-acl-val-btn" data-text="'+field+'" data-type="'+database+'" data-val="'+i+'" data-id="'+id+'"><i class="fa fa-plus"></i></a>';
                                    html+='</div>';
                                    html+='<div class="col-md-1">';
                                        html+='<button class="btn btn-sm btn-info update_acl" data-text="'+field+'" data-type="'+database+'" data-id="'+id+'" type="button">Update</button>';
                                    html+='</div>';
                                html+='</div>';
                            html+='</div>';
                        html+='</div>';
                        $("#acl_div_cont").html(html);
                        dialog.dialog( "open" );
                    }
                });
            }
            //alert(html);
            /*$("#acl_div_cont").html(html);
            dialog.dialog( "open" );*/
            //alert(field+"~~"+database+"~~"+id);
        }
    });

    $("body").on("click", ".ip-protoco-btn", function(){
        var i = $(this).attr("data-val");
        i++;
        var html="";
        html+='<div class="col-md-12 acl_ip_text_div acl_ip_text_div_'+i+'">';
            html+='<div class="col-md-4">';
                html+='<input type="text" class="acl_ip_text" data-text="" data-type="" data-id="" style="margin-right:10px;" value="" name="ip[]" placeholder="Enter IP address..."><label class="error" style="background-color:#FFFFFF"></label>';
            html+='</div>';
            html+='<div class="col-md-4">';
                html+='<input type="text" class="acl_ip_port" data-text="" data-type="" data-id="" style="margin-right:10px;" value="" name="port[]" placeholder="Enter IP port..."><label class="error" style="background-color:#FFFFFF"></label>';
            html+='</div>';
            html+='<div class="col-md-4">';
                html+='<a class="btn btn-danger acl-ip-data-delete" data-val="'+i+'"><i class="fa fa-trash"></i></a>';
            html+='</div>';
        html+='</div>';

        $(this).attr("data-val", i);
        $(".ip-protoco-form").append(html);
    });

    $("body").on("click", ".multi-acl-val-btn", function(){
        var i = $(this).attr("data-val");
        i++;
        var html="";
        html+='<div class="col-md-12 t20_'+i+'">';
            html+='<input type="text" class="acl_val_text" data-text="" data-type="" data-id="" value="" name="acl_val[]" style="margin-right:10px;margin-bottom:2px;">';

            html+='<a class="btn btn-sm btn-danger acl-val-input-delete" data-text="" data-type="" data-id="" data-val="'+i+'"><i class="fa fa-trash"></i></a>';
        html+='</div>';
        $(this).attr("data-val", i);
        $(".acl-multi-val").append(html);
    });

    $("body").on("click", ".acl-val-input-delete", function(){
        if($(".t20").length==1){
            $(".acl_val_text").val("");
        }else{
            $(".t20_"+$(this).attr("data-val")).remove();
        }
    });

    $("body").on("blur", ".acl_ip_text", function(){
        var val = ipv4addr($(this).val());
        if(val==false){
            $(this).next("label").html("Please enter valid IP address");
            $(this).addClass("error");
        } else{
            $(this).next("label").html("");
            $(this).removeClass("error");
        }
    });

    $("body").on("blur", ".acl_ip_port", function(){
        var val = isNumber($(this).val(), 4);
        if(val == false){
            $(this).next("label").html("Please enter valid 4 digit port number");
            $(this).addClass("error");
        } else{
            $(this).next("label").html("");
            $(this).removeClass("error");
        }
    });

    $("body").on("click", ".acl_spl_btn", function(){
        var cloud = $(this).attr("data-cloud");
        var tunnel = $(this).attr("data-tid");
        var type = $(this).attr('data-type');
        var id = $(this).attr('data-id');
        var data = $(this).attr('data-value');
        var res="";
        var ress;
        $(".acl_option").attr("data-type", type);
        $(".acl_option").attr("data-id", id);
        $(".acl_option").attr("data-value", data);
        $(".acl_option").attr("data-text", $(this).text());
        var html="";
        var ths = $(this);
        if(type == "destination" || type == "source"){
            $.ajax({
                url:"request.php?request=chk_res&type="+type+"&id="+id+"&val="+data,
                success:function(resp){
                    res = $.parseJSON(resp);
                    if(ths.attr("data-value") == "specific_tunnel"){
                        var typ = "tunnel";
                    }
                    $(".t20").css("display", "none");
                    if(ths.attr("data-value") != "specific_group"){

                        $.ajax({
                            url:"request.php?request=getTunnel&cloud="+cloud+"&dif=asc&type="+typ,
                            success:function(resp){
                                data = $.parseJSON(resp);
                                html+='<option>Select one...</option>';

                                for(x in data){
                                    if(parseInt(res.exist_tunnel) != data[x].tunnel_id){
                                        if(data[x].tunnel_id == tunnel){
                                            html+='<option value="'+data[x].tunnel_id+'" '+(parseInt(res.option_val)==data[x].tunnel_id?"selected":"")+'>'+data[x].display_name+'(Group '+group_arr[data[x].group_id]+')(This tunnel)</option>';
                                        }else {
                                            html+='<option value="'+data[x].tunnel_id+'" '+(parseInt(res.option_val)==data[x].tunnel_id?"selected":"")+'>'+data[x].display_name+'(Group '+group_arr[data[x].group_id]+')</option>';
                                        }
                                    }
                                }
                                $(".acl_option").html(html);
                                $(".one-day").css("display", "block");
                            }
                        });
                    }else{
                        //console.log(ress);
                        html+='<option>Select one...</option>';
                        $.each(group_arr, function(key, val){
                            html+='<option value="'+key+'" '+(parseInt(res.option_val)==key?"selected":"")+'>Group '+val+'</option>';
                        });
                        $(".acl_option").html(html);
                        $(".one-day").css("display", "block");
                    }
                }
            });
        }

    });

    $("body").on("click", ".acl-ip-data-delete", function(){
        if($(".acl_ip_text_div").length==1){
            $(".acl_ip_text").val("");
            $(".acl_ip_port").val("");
        }else{
            $(".acl_ip_text_div_"+$(this).attr("data-val")).remove();
        }
    });

    $("body").on("click", ".update_acl", function(){
        var type = $(".acl_val_text").attr('data-type');
        var id = $(".acl_val_text").attr('data-id');
        var data = $(".acl_val_text").attr("data-text");
        var val="";
        $("input[name='acl_val[]']").each(function() {
            if($.trim($(this).val())!=""){
                val += $(this).val()+":";
            }
        });
        //alert(val.replace(/:+$/, ''));

        //alert(type+"=="+data+"=="+id);
        if(acl_value[id]==undefined)
            acl_value[id]={};
        if(acl_value[id][type]==undefined)
            acl_value[id][type]={};
        var value_box = data+'-'+type+'-'+id;

        if(val!=""){
            acl_value[id][type][data]=val.replace(/:+$/, '');
            $('.'+value_box).css("opacity", 1);
        }else{
            acl_value[id][type][data]="";
            $('.'+value_box).css("opacity", 0.25);

            notify_msg("warning", "Now you have no value set for this option.");
        }

        notify_msg("warning", "You have to save this settings...");
    });

    $("body").on("change", ".acl_option", function(){
        var type = $(this).attr('data-type');
        var id = $(this).attr('data-id');
        var data = $(this).attr('data-value');
        var val = "";
        $(".acl_option option:selected").each(function (){
            var $this = $(this);
            if ($this.length) {
                val += $this.val()+":";
            }
        });
        //alert(val);
        //var text = $(this).attr("data-text");
        //alert(type+"=="+data+"=="+id);
        if(acl_value[id]==undefined)
            acl_value[id]={};
        if(acl_value[id][type]==undefined)
            acl_value[id][type]={};
        acl_value[id][type][data]=val.replace(/:+$/, '');
        //alert(JSON.stringify(acl_value));
        $("."+data+"-"+type+"-"+id).css("opacity", 1);
        notify_msg("warning", "You have to save this settings...");

    });

    $("body").on("click", ".reset_acl", function(){
        var type = $(".acl_val_text").attr('data-type');
        var id = $(".acl_val_text").attr('data-id');
        var data = $(".acl_val_text").attr('data-value');
        var text = $(".acl_val_text").attr("data-text");
        $.ajax({
            url:"request.php?request=acl_update",
            data:{"id":id, "type":type, "name":data, "val":0},
            type:"POST",
            success:function(resp){
                if(resp==1){
                    var value_box = data+'-'+type+'-'+id;
                    if($('.'+value_box).length > 0){
                        if(box_ths.children('b').length>4){
                            var i=0;
                            box_ths.children('b').each(function(){
                                if(i == 4){
                                    $(this).removeAttr("style");
                                }
                                i++;
                            });

                        }
                        $('.'+value_box).remove();
                    }

                    if(box_ths.children('b').length == 0){
                         if(box_ths.hasClass('"box-con')){
                             box_ths.removeClass("box-con");
                        }
                        box_ths.addClass('blank');
                    }
                    notify_msg("success", "ACL updated successfully");
                }else{
                    notify_msg("error", "Somthing went wrong");
                }
            }
        });
    });

    $("body").on("change", ".acl_radio", function(){
        var id = $(this).attr("data-id");
        var val = $(this).val();
        $.ajax({
            url:"request.php?request=create_new_acl&id="+id+"&val="+val+"&token="+token,
            success:function(resp){
                data=$.parseJSON(resp);
                if(data.status==1){
                    notify_msg("success", data.data);
                }
            }
        });
    });

    //$(".btn_add_acl").click(function(){
    $(".btn_add_acl").webuiPopover({
                        trigger:'hover',
                        width:'auto',
                        delay:{
                            show:0,
                            hide:100
                        },
                        content: function () {
                            var html = '';
                            var tunnel_id = $(this).attr("data-id");

                            html+='<input type="radio" class="acl_radio" data-id="'+tunnel_id+'" name="type" value="destination"/> Destination &nbsp;';
                            html+='<input type="radio" class="acl_radio" data-id="'+tunnel_id+'" name="type" value="source"/> Source';
                            return html;
                        }
                    });


    $('#Parks').dragScroll({});

    /*setTimeout(function(){
        var data={"type":"get_DeV","message_type":"request","data":{"id":43, "value":0}};
        send(JSON.stringify(data));
    },3000);*/

    $(".img_upload").click(function(){
        $(".edit_modal").modal("show");
    });

    $("#send_point_btn").click(function(){
        if($("input[name=point]").val()==""){
            $("input[name=point]").addClass("error");
            $("input[name=point]").removeClass("ok");
        } else {
            $("input[name=point]").removeClass("error");
            $("input[name=point]").addClass("ok");
        }
        if($("input[name=email]").val()==""){
            $("input[name=email]").addClass("error");
            $("input[name=email]").removeClass("ok");
        } else {
            var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
            if (testEmail.test($("input[name=email]").val())){
                $("input[name=email]").removeClass("error");
                $("input[name=email]").addClass("ok");
            } else {
                $("input[name=email]").addClass("error");
                $("input[name=email]").removeClass("ok");
            }
        }
        if($("input[name=email]").hasClass("ok")){
            if($("input[name=point]").hasClass("ok")){
                $.ajax({
                    url:"request.php?request=point",
                    data: $("#send_point_form").serialize(),
                    type: "POST",
                    success:function(resp){
                        if(resp==1){
                            $("#alert-msg").css("display", "block");
                            $("#alert-msg").addClass("alert-success");
                            $("#alert-msg").removeClass("alert-danger");
                            $("#alert-msg").html($("input[name=point]").val()+" points debited from your account.");
                        }else{
                            $("#alert-msg").css("display", "block");
                            $("#alert-msg").addClass("alert-danger");
                            $("#alert-msg").removeClass("alert-success");
                            $("#alert-msg").html("Something went wrong, email id not exist or you don't have sufficient points");
                        }
                    }
                });
                setTimeout(function(){
                    $(".alert").css("display", "none");
                    $(".alert").html("");
                }, 3000);
            }
        }
    });

    $(".img_upload").initial();

    $(".sponsore").click(function(){

        dialog_sponsore.dialog( "open" );
        $(".shared_submit_btn").attr("data-cloud", $(this).attr('data-cloud'));
        $(".shared_submit_btn").attr("data-u", $(this).attr('data-u'));
        $(".shared_submit_btn").attr("data-tid", $(this).attr('data-tid'));
    });

    $(".shared_submit_btn").click(function(){
        var shared_val = $("#cust_ms").val();
        var val="";
        /*for(x in shared_val){
            val+=shared_val[x]+","
        }
        val = val.replace(/,+$/, '');*/
        $.ajax({
            url:"request.php?request=shared_tunnel",
            data:{"user_id":$(this).attr('data-u'), "t_id":$(this).attr('data-tid'), "c_id":$(this).attr('data-cloud'), "shared_with":shared_val},
            type:"POST",
            success:function(resp){
                if(resp){
                    notify_msg("success", "Tunnel shared successfully");
                }
            }
        });
    });

    $("#cust_ms").select2({
        placeholder: "Select customer...",
        allowClear: true
    });

    $(".acl_search_btn").click(function(){
        var tunnel_id = $(this).attr("data-tunnel");
        var email = $(".acl_search_input").val();
        var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
        if (testEmail.test(email)){
            $(".acl_search_input").removeClass("error");
            $(".acl_search_input").next("level").removeClass("error");
            $(".acl_search_input").next("level").html("");

            $.ajax({
                url:"request.php?request=get_acl_destination_base&email="+email,
                type:"POST",
                success:function(resp){
                    //alert(resp);
                    if(resp!=0){
                        var res = $.parseJSON(resp);
                        share_acl(res, tunnel_id);
                    }else if(resp==0){
                        $(".acl_search_input").addClass("error");
                        $(".acl_search_input").next("level").html("This email id is not exist or giving your own, please try another one");
                        $(".acl_search_input").next("level").addClass("error");
                    }
                }
            });
        } else {
            $(".acl_search_input").addClass("error");
            $(".acl_search_input").next("level").html("Enter valid email id");
            $(".acl_search_input").next("level").addClass("error");
        }
        setTimeout(function(){
            $(".acl_search_input").next("level").removeClass("error");
            $(".acl_search_input").next("level").html("");
        }, 7000);
    });

    $('.acl_search_result').dragScroll({});

    $("body").on("click", ".acl_destination_search_btn", function(){
        $("#ACLsearchModal").modal("show");
        $(".acl_search_btn").attr("data-tunnel", $(this).attr("data-tid"));
    });

    $("body").on("click", ".install_acl", function(){
        var tunnel_id=$(this).attr("data-tunnel");
        var acl_id=$(this).attr("data-acl");
        $.ajax({
            url:"request.php?request=install_acl",
            data:{"tunnel_id":tunnel_id, "acl_id":acl_id},
            type:"POST",
            success:function(resp){
                if(resp==1){
                    $("#msg").removeClass("alert-danger");
                    $("#msg").addClass("alert-success");
                    $("#msg").html("ACL Install successfully");
                }else{
                    $("#msg").removeClass("alert-success");
                    $("#msg").addClass("alert-danger");
                    $("#msg").html("Somthing went wrong");
                }
            }
        });
        setTimeout(function(){
            $(".alert").removeClass("alert-success");
            $(".alert").removeClass("alert-danger");
            $(".alert").html("");
        },5000);
    });

    $('#profile_pic_change_btn').change(function(evt){
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            var files = evt.target.files;
            var file=files[0];
            if (!file.type.match('image.*')) {
                return false;
            }else{
                var formData = new FormData($('#profile_pic_change')[0]);
                $.ajax({
                    url: 'request.php?request=change_profile_picture',
                    type: 'POST',
                    data: formData,
                    async: true,
                    success: function (data){
                        var message=$.parseJSON(data);
                        if (message.status=='success') {
                            $('.img_upload').attr('src','assets/user_img/'+message.msg);
                            //$('#pro_pic').attr('src','assets/user_img/'+message.msg);
                        }else if(message.status=='unsuccess') {
                            notify_msg('error', 'Error: Please Try again!');
                        }
                    },
                    cache: false,
                    contentType: false,
                    processData: false
                });
            }
        } else {
            alert('The File APIs are not fully supported in this browser.');
        }
    });

    $("#layout-condensed-toggle").trigger("click");
    $('#main-menu').mouseover(function(){
        if($(this).hasClass('mini')){
          $("#layout-condensed-toggle").trigger("click");
        }
    });
    $('#main-menu').mouseout(function(){
        if(!$(this).hasClass('mini')){
          $("#layout-condensed-toggle").trigger("click");
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

function tunnels(data){
   // return "";
    var group_arr=['<span style="color: #ea4335;"><strong>A</strong></span>', '<span style="color: #839D1C;"><strong>B</strong></span>', '<span style="color: #00A998;"><strong>C</strong></span>', '<span style="color: #F6AE00;"><strong>D</strong></span>', '<span style="color: #4285F4;"><strong>E</strong></span>', '<span style="color: #330033;"><strong>F</strong></span>', '<span style="color: #FF404E;"><strong>G</strong></span>', '<span style="color: #FFFF00;"><strong>H</strong></span>', '<span style="color: #FF3300;"><strong>I</strong></span>', '<span style="color: #CC6600;"><strong>J</strong></span>', '<span style="color: #9999CC;"><strong>K</strong></span>', '<span style="color: #0000CC;"><strong>L</strong></span>', '<span style="color: #FF0000;"><strong>M</strong></span>', '<span style="color: #003366;"><strong>N</strong></span>', '<span style="color: #003333;"><strong>0</strong></span>', '<span style="color: #FF00CC;"><strong>P</strong></span>', '<span style="color: #FF0066;"><strong>Q</strong></span>', '<span style="color: #CC0000;"><strong>R</strong></span>', '<span style="color: #CC6600;"><strong>S</strong></span>', '<span style="color: #666666;"><strong>T</strong></span>', '<span style="color: #330066;"><strong>U</strong></span>', '<span style="color: #CC99CC;"><strong>V</strong></span>', '<span style="color: #FFCC66;"><strong>W</strong></span>', '<span style="color: #FF3399;"><strong>X</strong></span>', '<span style="color: #99CCFF;"><strong>Y</strong></span>', '<span style="color: #0099FF;"><strong>Z</strong></span>'];
    var btn_arr=['#393333', '#1D9E74'];
    //var route_arr=['<i class="fa fa-road" style="color:#393333"></i>', '<i class="fa fa-road" style="color:#1D9E74"></i>'];
    var html='';
    for(x in data){
         // if(data[x].tunnel_type=="client"){
            html+='<div class="list_body tunnel_body tunnel_body_'+data[x].tunnel_id+'">';
         // }else{
            //html+='<div class="list_body bg_green tunnel_body tunnel_body_'+data[x].tunnel_id+'">';
         // }
         html+='<div class="meta">';
            html+='<a href="javascript:void(0)" class="showACL" data-toggle="tooltip" data-placement="right" title="ACL view" data-cloud="'+data[x].cloud_id+'" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'"><i class="fa fa-wrench"></i></a>';
            html+='<a href="javascript:void(0)" class="btn_add_acl btn_add_acl_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="right" title="Create ACL" data-id="'+data[x].tunnel_id+'"><i class="fa fa-fw fa-plus" style="margin-left: 5px; font-size: 10px;"></i></a>';
        html+='</div>';

         html+='<div class="meta" data-toggle="tooltip" data-placement="right" title="'+(data[x].tunnel_type!="client"?"Downgrade to client":"Upgrade to server")+'"><a href="javascript:void(0)" class="change_tunnel change_tunnel_'+data[x].tunnel_id+'" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'">'+(data[x].tunnel_type!="client"?"<i class='fa fa-long-arrow-down'></i>":"<i class='fa fa-long-arrow-up'></i>")+'</a></div>';

         html+='<div class="meta" data-toggle="tooltip" title="Add clone"><a href="javascript:void(0)" class="add_clone" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'"><i class="fa fa-fw fa-plus"></i></a></div>';
         html+='<div class="meta" data-toggle="tooltip" title="Save this"><a href="javascript:void(0)" class="save_this_client" data-type="'+data[x].tunnel_type+'" data-id="'+data[x].tunnel_id+'"><i class="fa fa-floppy-o"></i></a></div>';
         html+='<div class="meta cursor tunnel_chk tunnel_'+data[x].tunnel_id+' tunnel_grp_chk_'+data[x].group_id+'" data-val="0" data-id="'+data[x].tunnel_id+'" data-toggle="tooltip" title="Select tunnel"><i class="fa fa-fw fa-square-o"></i></div>';
         html+='<div class="meta cursor tunnel_grp" data-toggle="tooltip" data-gid="'+data[x].group_id+'" title="'+data[x].group_id+'"><div class="group tunnel_grp_'+data[x].tunnel_id+'" type="data" data-cast="'+data[x].customer_id+'" data-val="'+data[x].group_id+'" data-id="'+data[x].tunnel_id+'">'+((data[x].group_id in group_arr)?group_arr[data[x].group_id]:"")+'</div></div>';

         //html+='<div class="meta width-140 tunnel_email_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="bottom" title="'+data[x].email+'">'+data[x].email+'</div>';

         html+='<div class="meta width-140 tunnel_display_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="bottom" title="'+data[x].display_name+'"><a href="#" class="display display_'+data[x].tunnel_id+' tunnel_editable" data-type="text" data-pk="'+data[x].tunnel_id+'" data-title="Enter display name">'+data[x].display_name+'</a></div>';
         //html+='<div class="meta cursor"></div>';
         html+='<div class="meta cursor">'+biderection(data[x].bidirectional_mode, data[x].tunnel_id, data[x].customer_id)+'</div>';
         html+='<div class="meta width-80 tunnel_location_'+data[x].tunnel_id+'" data-toggle="tooltip" title=""><a href"javascript:void(0);" class="change_location location_'+data[x].tunnel_id+' tunnel_editable" data-type="select" data-source="request.php?request=get_server_name" data-pk="'+data[x].tunnel_id+'">Select Location</a></div>';
         //new
         html+='<div class="meta width-77"><div class="" id="DeV_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="top" title=""></div></div>';
         html+='<div class="meta width-77"><div class="acc_type acc_type_'+data[x].tunnel_id+'" data-id="'+data[x].tunnel_id+'" data-val="'+data[x].plan_id+'" data-toggle="tooltip" data-placement="bottom" title="'+(data[x].plan_id==1?"Premium":"Premium")+'">'+(data[x].plan_id==1?"Premium":"Premium")+'</div></div>';
         //!new
         html+='<div class="meta width-80 subnet_'+data[x].tunnel_id+'" data-toggle="tooltip" data-placement="bottom" title="'+data[x].cloud_ip+'">'+(data[x].cloud_ip!=undefined || data[x].cloud_ip!=""?data[x].cloud_ip:"&nbsp;")+'</div>';
         html+='<div class="meta plan_cost_'+data[x].tunnel_id+'" data-toggle="tooltip" title="">'+data[x].cost+'</div>';
         html+='<div class="meta" data-toggle="tooltip" title=""><div data-val="'+data[x].internet+'" class="internet_change cursor tunnel_internet_'+data[x].tunnel_id+'" type="data" data-pos="0" data-id="'+data[x].tunnel_id+'">'+(data[x].internet==1?"<i class='fa fa-fw fa-globe' style='color:#1D9E74'></i>":"<i class='fa fa-fw fa-globe' style='color:#393333'></i>")+'</div></div>';

         html+='<div class="meta" data-toggle="tooltip" title=""><div data-val="'+data[x].route+'" class="route_change cursor tunnel_route_'+data[x].tunnel_id+'" type="data" data-pos="0" data-id="'+data[x].tunnel_id+'">'+(data[x].route==1?"<i class='fa fa-fw fa-road' style='color:#1D9E74'></i>":"<i class='fa fa-fw fa-road' style='color:#393333'></i>")+'</div></div>';
         html+='<span class="not_client_'+data[x].tunnel_id+'">';
         if(data[x].tunnel_type!="client"){
            html+='<div class="meta width-100" data-toggle="tooltip" title="'+(data[x].real_ip!=null?data[x].real_ip:"Not assigned")+'"><a href="javascript:void(0);" data class="real_ip real_ip_'+data[x].tunnel_id+'" style="'+(data[x].active==0||data[x].active==""?"color:#1B1E24":"color:#1D9E74")+'" data-val="'+(data[x].active!=null?data[x].active:-1)+'" data-id="'+data[x].tunnel_id+'">'+(data[x].real_ip!=undefined || data[x].real_ip!=""?data[x].real_ip:"Not assigned")+'</a></div>';
            html+='<div class="meta cursor">'+gateway(data[x].gateway_mode, data[x].tunnel_id, data[x].customer_id)+'</div>';
         }
         html+='</span>';
         html+='<div class="meta" data-toggle="tooltip" title="Delete this tunnel" ><a href="javascript:void(0);" data-id="'+data[x].tunnel_id+'" class="delete_tunnel_'+data[x].tunnel_id+' delete_tunnel" data-type="'+data[x].tunnel_type+'"><i class="fa fa-fw fa-trash" style="color:#DA3838"></i></a></div>';
        html+='</div>';
        html += '<div class="tunnel_acl_div_'+data[x].tunnel_id+' tunnel_acl_div" style="display:none;"></div>';
    }
    return html;
}

function packages(type, plan, id){
    $.ajax({
        url:"request.php?request=packages&type="+type+"&p_id="+plan+"&id="+id,
        success:function(resp){
            return resp;
        }
    });
}

function acl(data, res_type, cur_tunnel){

    var tunnel="";
    //var html="";
    var xyz=0;
    var source="";
    var destination="";
    var source_count=0;
    var destination_count=0;
    $.each(data, function(key, value){
    var html="";
    var id = key;
    xyz++;
    tunnel = value.tunnel_id;
    new_class='';//" acl_installed ";

    html+='<div class="acl_upper_div">';
    html += '<div class="acl_div_'+id+' acl_div" style="display:block;">';
    html+='<div class="soumya_btn">';
        html+='<a href="javascript:void(0);" class="font-awesome" btn-type="clone" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Create ACL clone"><i class="fa fa-fw fa-copy"></i></a>';
        html+='<a href="javascript:void(0);" class="font-awesome" btn-type="save" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Save"><i class="fa fa-fw fa-floppy-o"></i></a>';
        html+='<a href="javascript:void(0);" class="font-awesome" btn-type="clear" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Clear"><i class="fa fa-fw fa-cut"></i></a>';

        if(cur_tunnel == parseInt(value.source.specific_tunnel.value)){
            html+='<a href="javascript:void(0);" class="font-awesome" btn-type="change" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-val="source" data-toggle="tooltip" title="Change ACL base"><i class="fa fa-fw fa-arrow-left"></i></a>';
        }

        if(cur_tunnel == parseInt(value.destination.specific_tunnel.value)){
            html+='<a href="javascript:void(0);" class="font-awesome" btn-type="change" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-val="destination" data-toggle="tooltip" title="Change ACL base"><i class="fa fa-fw fa-arrow-right"></i></a>';
        }

        if($(".acl_div").length>1 || xyz>1){
            html+='<a href="javascript:void(0);" class="font-awesome" btn-type="delete" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Delete"><i class="fa fa-fw fa-trash-o red"></i></a>';

        }
        html+='<div class="onoffswitch">';
            html+='<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>';
            html+='<label class="onoffswitch-label" for="myonoffswitch">';
                html+='<span class="onoffswitch-inner"></span>';
                html+='<span class="onoffswitch-switch"></span>';
            html+='</label>';
        html+='</div>';
    html+='</div>';
    html+='<div>';

    if(cur_tunnel == parseInt(value.source.specific_tunnel.value)){
        source = parseInt(value.source.specific_tunnel.value);
        // html+='<p>Source base</p>';
    } else if(cur_tunnel == parseInt(value.destination.specific_tunnel.value)){
        destination = parseInt(value.destination.specific_tunnel.value);
        // html+='<p>Destination base</p>';
    }
    html+='</div>';
    html+='<div class="soumya">';
    html+='<div class="box-holder">';
    html+='<span>then</span>';
     html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-id="'+id+'" data-type="d_final" data-toggle="confirmation">'+show_updated_value(value.d_final, "d_final", id, tunnel)+'</div>';
    html+='<label>Final Dst</label>';
    html+='<div class="add_div">';
    html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
    html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    if(cur_tunnel != parseInt(value.destination.specific_tunnel.value)){
        html+='<div class="box box-con box_'+id+' destination_'+id+'  '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="destination" data-id="'+id+'" style="border:3px solid #000">'+show_updated_value(value.destination, "destination", id, tunnel, cur_tunnel)+'</div>';
    } else {
        destination_count++;
        html+='<div class="box box-con box_'+id+' destination_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="destination" data-id="'+id+'" style="border:3px solid #000;background-color:#00A998">&nbsp;</div>';
    }
      html+='<label>Destination</label>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
    html+='<i class="fa  fa-long-arrow-left green"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
       html+='<span>then</span>';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_forwarding" data-id="'+id+'">'+show_updated_value(value.c_forwarding, "c_forwarding", id, tunnel)+'</div>';
      html+='<label>Forwarding</label>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
       html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>then</span>';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_qos" data-id="'+id+'">'+show_updated_value(value.c_qos, "c_qos", id, tunnel)+'</div>';

      html+='<span>QOS</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>then</span>';
        html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_routing" data-id="'+id+'">'+show_updated_value(value.c_routing, "c_routing", id, tunnel)+'</div>';

      html+='<span>Routing</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
        html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
        html+='<span>If</span>';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_firewall" data-id="'+id+'">'+show_updated_value(value.c_firewall, "c_firewall", id, tunnel)+'</div>';

        html+='<span>Firewall</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
        html+='<i class="fa  fa-long-arrow-left green"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>Aliasing</span>';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_aliasing"  data-id="'+id+'">'+show_updated_value(value.s_aliasing, "s_aliasing", id, tunnel)+'</div>';
      html+='<span>&nbsp;</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
      html+='<span>If</span>';
      if(cur_tunnel != parseInt(value.source.specific_tunnel.value)){
        html+='<div class="box box-con box_'+id+' source_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="source" data-id="'+id+'" style="border:3px solid #000">'+show_updated_value(value.source, "source", id, tunnel, cur_tunnel)+'</div>';
    } else {
        source_count++;
        html+='<div class="box box-con box_'+id+' source_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="source" data-id="'+id+'" style="border:3px solid #000; background-color:#00A998">&nbsp;</div>';
    }
       html+='<span>Source</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
       html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_qos" data-id="'+id+'">'+show_updated_value(value.s_qos, "s_qos", id, tunnel);

          //html+='<i class="fa  fa-close lg_close"></i>';
      html+='</div>';
      html+='<span>QOS</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>If</span>';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_firewall" data-id="'+id+'">'+show_updated_value(value.s_firewall, "s_firewall", id, tunnel)+'</div>';

      html+='<span>Firewall</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
      html+='<span>If</span>';
      html+='<div class="box box-con box_'+id+' '+new_class+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_tos" data-id="'+id+'">'+show_updated_value(value.s_tos, "s_tos", id, tunnel)+'</div>';

        html+='<span>binding/TOS</span>';
              html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';
    html+='</div>';
    html+='</div>';
    html+='</div>';

    if(cur_tunnel == parseInt(value.source.specific_tunnel.value)){
        $(".source_acl_content_"+value.tunnel_id).prepend(html);
    } else if(cur_tunnel == parseInt(value.destination.specific_tunnel.value)){
        $(".destination_acl_content_"+value.tunnel_id).prepend(html);
    } else{
        $(".source_acl_content_"+cur_tunnel).prepend(html);
    }
    //alert("source=="+source_count+"   destination count"+destination_count);
    if(source_count==0){
        $(".source_no_data_p_"+cur_tunnel).html("  (Source ACL not found)");
    } else {
        $(".source_no_data_p_"+cur_tunnel).html("");
    }
    if(destination_count==0){
        $(".destination_no_data_p_"+cur_tunnel).html("  (Destination ACL not found)");
    } else {
        $(".destination_no_data_p_"+cur_tunnel).html("");
    }

    if(destination_count==0 && source_count==0){
        $(".source_"+id).attr("style", "border:3px solid #000; background-color:#00A998");
        $(".source_"+id).html("&nbsp;");
    }

    });
    /*if(res_type=="create_acl_clone_result"){
        if(cur_tunnel == source){
            $(".source_acl_content_"+value.tunnel).prepend(html);
        } else if(cur_tunnel == destination){
            $(".destination_acl_content_"+value.tunnel).prepend(html);
        }
    } else {
        if(cur_tunnel == source){
            $(".source_acl_content_"+tunnel).html(html);
        } else if(cur_tunnel == destination){
            $(".destination_acl_content_"+tunnel).html(html);
        }
    }*/
}

function share_acl(data, tunnel_id){ //tunnel_id for where aci is searched
    cur_tunnel=null;
    var tunnel="";
    //var html="";
    var xyz=0;
    var source="";
    var destination="";
    var source_count=0;
    var destination_count=0;
    $.each(data, function(key, value){
    var html="";
    var id = key;
    xyz++;
    tunnel = value.tunnel_id;


    html+='<div class="acl_upper_div">';
    html += '<div class="acl_div_'+id+' share_acl_div" style="display:block;">';
    html+='<div class="soumya_btn">';
        html+='<a href="javascript:void(0);" class="font-awesome" btn-type="clone" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Create ACL clone"><i class="fa fa-fw fa-copy"></i></a>';
        html+='<a href="javascript:void(0);" class="font-awesome" btn-type="save" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Save"><i class="fa fa-fw fa-floppy-o"></i></a>';
        html+='<a href="javascript:void(0);" class="font-awesome" btn-type="clear" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Clear"><i class="fa fa-fw fa-cut"></i></a>';

        if(cur_tunnel == parseInt(value.source.specific_tunnel.value)){
            html+='<a href="javascript:void(0);" class="font-awesome" btn-type="change" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-val="source" data-toggle="tooltip" title="Change ACL base"><i class="fa fa-fw fa-arrow-left"></i></a>';
        }

        if(cur_tunnel == parseInt(value.destination.specific_tunnel.value)){
            html+='<a href="javascript:void(0);" class="font-awesome" btn-type="change" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-val="destination" data-toggle="tooltip" title="Change ACL base"><i class="fa fa-fw fa-arrow-right"></i></a>';
        }

        if($(".share_acl_div").length>1 || xyz>1){
            html+='<a href="javascript:void(0);" class="font-awesome" btn-type="delete" data-tid="'+value.tunnel_id+'" data-id="'+id+'" data-toggle="tooltip" title="Delete"><i class="fa fa-fw fa-trash-o red"></i></a>';

        }
        html+='<div class="onoffswitch">';
            html+='<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>';
            html+='<label class="onoffswitch-label" for="myonoffswitch">';
                html+='<span class="onoffswitch-inner"></span>';
                html+='<span class="onoffswitch-switch"></span>';
            html+='</label>';
        html+='</div>';
    html+='</div>';
    html+='<div>';

    if(cur_tunnel == parseInt(value.source.specific_tunnel.value)){
        source = parseInt(value.source.specific_tunnel.value);
        // html+='<p>Source base</p>';
    } else if(cur_tunnel == parseInt(value.destination.specific_tunnel.value)){
        destination = parseInt(value.destination.specific_tunnel.value);
        // html+='<p>Destination base</p>';
    }
    html+='</div>';
    html+='<div class="soumya">';
    html+='<div class="box-holder">';
    html+='<span>then</span>';
     html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-id="'+id+'" data-type="d_final" data-toggle="confirmation">'+show_updated_value(value.d_final, "d_final", id, tunnel)+'</div>';
    html+='<label>Final Dst</label>';
    html+='<div class="add_div">';
    html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
    html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    if(cur_tunnel != parseInt(value.destination.specific_tunnel.value)){
        html+='<div class="box box-con box_'+id+' destination_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="destination" data-id="'+id+'" style="border:3px solid #000">'+show_updated_value(value.destination, "destination", id, tunnel, cur_tunnel)+'</div>';
    } else {
        destination_count++;
        html+='<div class="box box-con box_'+id+' destination_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="destination" data-id="'+id+'" style="border:3px solid #000;background-color:#00A998">&nbsp;</div>';
    }
      html+='<label>Destination</label>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
    html+='<i class="fa  fa-long-arrow-left green"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
       html+='<span>then</span>';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_forwarding" data-id="'+id+'">'+show_updated_value(value.c_forwarding, "c_forwarding", id, tunnel)+'</div>';
      html+='<label>Forwarding</label>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
       html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>then</span>';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_qos" data-id="'+id+'">'+show_updated_value(value.c_qos, "c_qos", id, tunnel)+'</div>';

      html+='<span>QOS</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>then</span>';
        html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_routing" data-id="'+id+'">'+show_updated_value(value.c_routing, "c_routing", id, tunnel)+'</div>';

      html+='<span>Routing</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
        html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
        html+='<span>If</span>';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="c_firewall" data-id="'+id+'">'+show_updated_value(value.c_firewall, "c_firewall", id, tunnel)+'</div>';

        html+='<span>Firewall</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
        html+='<i class="fa  fa-long-arrow-left green"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>Aliasing</span>';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_aliasing"  data-id="'+id+'">'+show_updated_value(value.s_aliasing, "s_aliasing", id, tunnel)+'</div>';
      html+='<span>&nbsp;</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
      html+='<span>If</span>';
      if(cur_tunnel != parseInt(value.source.specific_tunnel.value)){
        html+='<div class="box box-con box_'+id+' source_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="source" data-id="'+id+'" style="border:3px solid #000">'+show_updated_value(value.source, "source", id, tunnel, cur_tunnel)+'</div>';
    } else {
        source_count++;
        html+='<div class="box box-con box_'+id+' source_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="source" data-id="'+id+'" style="border:3px solid #000; background-color:#00A998">&nbsp;</div>';
    }
       html+='<span>Source</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
       html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_qos" data-id="'+id+'">'+show_updated_value(value.s_qos, "s_qos", id, tunnel);

          //html+='<i class="fa  fa-close lg_close"></i>';
      html+='</div>';
      html+='<span>QOS</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
    html+='<span>If</span>';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_firewall" data-id="'+id+'">'+show_updated_value(value.s_firewall, "s_firewall", id, tunnel)+'</div>';

      html+='<span>Firewall</span>';
          html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<div class="arroww">';
      html+='<i class="fa  fa-long-arrow-left"></i>';
    html+='</div>';

    html+='<div class="box-holder">';
      html+='<span>If</span>';
      html+='<div class="box box-con box_'+id+'" data-tid="'+value.tunnel_id+'" data-cloud="" data-type="s_tos" data-id="'+id+'">'+show_updated_value(value.s_tos, "s_tos", id, tunnel)+'</div>';

        html+='<span>binding/TOS</span>';
              html+='<div class="add_div">';
          html+='</div>';
    html+='</div>';

    html+='<input type="button" class="btn btn-primary install_acl" data-acl="'+id+'" data-tunnel="'+tunnel_id+'" value="Install"/>';

    html+='</div>';
    html+='</div>';
    html+='</div>';

    $(".acl_search_result").prepend(html);

    //alert("source=="+source_count+"   destination count"+destination_count);

    });
}

function check_blank(data){
    var i = 0;
    $.each(data, function(key, val){
        if(val.value!=0){
            i = 1;
        }
    });
    return i;
}

function show_updated_value(data, database_name, id, tunnel_id, cur_tunnel){
    var items = ["black", "black", "black", "black", "black"];//["#996600", "#003366", "#336699", "#00cc66", "#ff6666"];
    var item = items[Math.floor(Math.random()*items.length)];
    var database="";
    var html="";
    var i = 0;
    //console.log(data);
    $.each(data, function(key, val){
        if(val.value!=0){
            if(database_name == "destination" || database_name == "source"){
                if(cur_tunnel == parseInt(val.value) && key == "specific_tunnel"){
                    database = database_name;
                    html+='<div class="color-box '+key+'-'+database_name+'-'+id+'" style="background-color:'+item+'" data-tid="'+tunnel_id+'" data-toggle="tooltip" title="'+val.label+'">'+val.label.charAt(0)+'</div>';
                } else if(database != database_name){
                    html+='<div class="color-box '+key+'-'+database_name+'-'+id+'" style="background-color:'+item+'" data-tid="'+tunnel_id+'" data-toggle="tooltip" title="'+val.label+'">'+val.label.charAt(0)+'</div>';
                }
            } else if(key == "bind_all" || key == "allow_all" || key =="deny_all" || key =="any" || key =="internet" || key =="my_cloud" || key =="every_cloud" || key =="every_cloud"){
                html+='<div class="color-box '+key+'-'+database_name+'-'+id+' no" style="background-color:'+item+'" data-tid="'+tunnel_id+'" data-toggle="tooltip" title="'+val.label+'">'+val.label.charAt(0)+'</div>';
            } else {
                html+='<div class="color-box '+key+'-'+database_name+'-'+id+'" style="background-color:'+item+'" data-tid="'+tunnel_id+'" data-toggle="tooltip" title="'+val.label+'">'+val.label.charAt(0)+'</div>';
            }
        } else if(val.value==0){
            if(database != database_name){
                if(key == "bind_all" || key == "allow_all" || key =="deny_all" || key =="any" || key =="internet" || key =="my_cloud" || key =="every_cloud" || key =="every_cloud"){
                    html+='<div class="color-box '+key+'-'+database_name+'-'+id+' no" style="background-color:transparent; color: black; opacity:0.35;" data-tid="'+tunnel_id+'" data-toggle="tooltip" title="'+val.label+'">'+val.label.charAt(0)+'</div>';
                } else {
                    html+='<div class="color-box '+key+'-'+database_name+'-'+id+'" style="background-color:transparent; color: black; opacity:0.35;" data-tid="'+tunnel_id+'" data-toggle="tooltip" title="'+val.label+'">'+val.label.charAt(0)+'</div>';
                }
            }
        }
        //alert(html);
    });
    return html;
}

function notify_msg (status, msg) {
    notify({
        type: status,
        title: status,
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



function isNumber(n, length_check) {
    if(length_check > 0){
        return !isNaN(parseFloat(n)) && isFinite(n) && (n.length==4);
    }
  return !isNaN(parseFloat(n)) && isFinite(n);
}

