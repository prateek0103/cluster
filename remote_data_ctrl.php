<?php
    //include_once 'common/session_check.php';
    require_once 'includes/config.php';
    require_once 'includes/connection.php';
    $check="";
    $arr=$db->query("SELECT * FROM `remote_server_list`");
    if(!empty($_POST)){
        $res=$db->query("SELECT * FROM `remote_server_list` WHERE `remote_ip`='".$_POST['remote_ip']."'");
        if($res->num_rows>0){
            if($db->query("UPDATE `remote_server_list` SET `server_uname`='".$_POST['username']."', `server_pass`='".$_POST['password']."', `remote_group`='".$_POST['remote_grp']."' WHERE `remote_ip`='".$_POST['remote_ip']."'")){
                $check=1;
            }
        }else{
          $db->query("INSERT INTO `remote_server_list` (`email`, `remote_ip`, `server_uname`, `server_pass`, `remote_group`) VALUES('".$_POST['email']."', '".$_POST['remote_ip']."', '".$_POST['username']."', '".$_POST['password']."', '".$_POST['remote_grp']."')");
                                  $check=1;
                                  $subject ='Remote Server';
                                 $message ='<html>
                                     <head>
                                         <title>"'.$subject.'"</title>
                                     </head>
                                     <body>
                                          Dear sir/madam,<br>
                                              A new remote server added.<br><br>
                                          Thank you,<br>
                                          Demovpn team.
                                     </body>
                                 </html>';
                                 $headers = "MIME-Version: 1.0" . "\r\n";
                                 $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                                 $headers .= 'From:DemoVPN <demovpn@comenzarit.com>' . "\r\n";
                                 mail($_POST['email'],$subject,$message,$headers);
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
    <?php include_once 'common/head.php';?>
<body>
    <div id="wrapper">
        <?php include_once 'common/header.php';?>
        <div id="page-wrapper" style=" min-height: 581px;">
            <form role="form" action="" method="post">
                <div class="form-group">
                <?php if($check==1){
                    ?>
                      <div id="msg" class="bg-success" style="padding:7px;mergin-top:5px;"><strong>Changes applied successfully</strong></div>
                    <?php
                  } ?>
                  <label for="email">Remote IP:</label>
                  <input type="text" class="form-control" id="remote_id" name="remote_ip" placeholder="Enter remote ip" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Mysql user name:</label>
                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Mysql password:</label>
                  <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                </div>
                <div class="form-group">
                  <label for="pwd">Email ID:</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required>
                </div>
                 <div class="form-group">
                  <label for="sel1">Remote group:</label>
                  <select class="form-control" id="sel1" name="remote_grp" required>
                    <option>Select a category</option>
                    <option id="a" value="a">a</option>
                    <option id="b" value="b">b</option>
                  </select>
                </div>
                <!-- <button type="button" id="test" class="btn btn-primary">Test</button> -->
                <button type="button" id="testall" class="btn btn-primary">Test all server</button>
                <button type="submit" class="btn btn-success">Save</button>
              </form>
              <h3>All Remote Server</h3>
              <table class="table table-bordered" style="margin-top: 12px;">
                <thead>
                  <tr>
                    <th>Remote Server IP</th>
                    <th>Mysql user name</th>
                    <th>Group</th>
                    <!-- <th>Edit information</th> -->
                  </tr>
                </thead>
                <tbody>
                <?php while($val=$arr->fetch_assoc()){ ?>
                    <tr class="remote_list_<?php echo $val['id']; ?>">
                      <td>
                        <?php echo $val['remote_ip']; ?>
                        <i class="fa fa-pencil-square-o edit" data-pk="<?php echo $val['id']; ?>" style="color:#4285F4; margin-left:10px; cursor:pointer;"></i>
                        <i class="fa fa-trash-o delete" data-pk="<?php echo $val['id']; ?>" style="color:#E40303; margin-left:10px; cursor:pointer;"></i>
                        <?php if($val['is_active']==0){ ?>
                          <a href="javascript:void()" class="status stat_<?php echo $val['id']; ?>" data="1" data-pk="<?php echo $val['id']; ?>" value="Active"><i class="fa fa-circle" style="color:#D6465F;margin-left:10px;"></i></a>
                      <?php }else{
                        ?>
                            <a href="javascript:void()" class="status stat_<?php echo $val['id']; ?>" data="0" data-pk="<?php echo $val['id']; ?>" value="Inactive"><i class="fa fa-circle" style="color:#449D44;margin-left:10px;"></i></a>
                        <?php
                        } ?>
                      </td>
                      <td><?php echo $val['server_uname']; ?></td>
                      <td><?php echo $val['remote_group']; ?></td>
                        <!-- <td><input type="button" class="edit btn btn-primary" data-pk="<?php echo $val['id']; ?>" value="Edit"/></td> -->
                    </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
    </div>

</body>
</html>
<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script>
    $(document).ready(function(){
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
                    url:'request.php?request=test_remote',
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
                url:'request.php?request=test_all_remote',
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
                url:'request.php?request=test_all_remote',
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

        $(".status").click(function(){
            var val = $(this).attr("data");
            var id = $(this).attr("data-pk");
            var chk=$(this);
            $.ajax({
                url:'request.php?request=remote_server_status_change',
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

        $(".edit").click(function(){
            var id=$(this).attr("data-pk");
            //$('option').removeAttr("selected");
            $.ajax({
                url:'request.php?request=remote_server_edit',
                type:"POST",
                data:{"id": id},
                  success:function(resp){
                      val=$.parseJSON(resp);
                      $("#remote_id").val(val.remote_ip);
                      $("#username").val(val.server_uname);
                      $("#password").val(val.server_pass);
                      $("#email").val(val.email);
                      // $("#"+val.remote_group).attr("selected", "selected");
                      // $("#"+val.remote_group).trigger("click");
                      $("#sel1").val(val.remote_group);
                  }
            });
        });

        $(".delete").click(function(){
            var id=$(this).attr("data-pk");


            $.ajax({
                url:'request.php?request=remote_server_delete',
                type:"POST",
                data:{"id": id},
                  success:function(resp){
                      alert(resp);
                      if(resp==1){
                          $(".remote_list_"+id).remove();
                      }
                  }
            });
        });

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