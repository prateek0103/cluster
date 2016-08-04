<?php
ob_start();
include 'elements/admin_header.php';

if(!empty($_POST)){
    if($_POST['act'] == "remove") {
        ob_end_clean();
        $items = $_POST['items'];
        if(count($items) < 1)
            die(json_encode(array( "status" => "ERROR", "ss" => $items)));
        $qstr = " (";
        $i = 0;
        foreach ($items as $itm)
        {
            if($i > 0)
                $qstr .= " OR";
            $qstr .= " real_ip='";
            $qstr .= $itm;
            $qstr .= "'";
            $i++;
        }
        $qstr .= ") ";
        $ipns = $db->query("SELECT COUNT(*) FROM `real_ip_list` WHERE " . $qstr . " AND in_use = '1'");
        $num = $ipns->fetch_row();
        if($num[0] > 0)
        {
            die(json_encode(array( "status" => "IN_USE", "asd" => $qstr)));
        }
        $db->query("DELETE FROM `real_ip_list` WHERE " . $qstr);
        die(json_encode(array( "status" => "OK", "asdasd" => $num[0])));
    }
    else
    {
        $ip1 = trim($_POST['real_from']);
        $ip2 = trim($_POST['real_to']);
        for ($ip = ip2long($ip1); $ip <= ip2long($ip2); $ip++) {
            $exi = $db->query("SELECT COUNT(*) FROM `server_subnets` WHERE `subnet` = '" . long2ip($ip) . "'");
            $num = $exi->fetch_row();
            if ($num[0] < 1)
                $db->query("INSERT INTO `real_ip_list` SET `real_ip`='" . long2ip($ip) . "'");

        }
    }
}


if(isset($_GET['ajax'])) {
    $exi = $db->query("SELECT COUNT(*) FROM `server_subnets`");
    $num = $exi->fetch_row();
    $count = $num[0];
    $pagenum = 0;
    $Limit_Low = $_GET['start'];
    $Limit_Hi = $_GET['length'];
    $order = $_GET['order'][0];
    $orderby = "lst.real_ip";
    if($order['column'] > 0 && $order['column'] < 4) {
        switch ($order['column']) {
            case "1":
                $orderby = "lst.in_use";
                break;
            case "2":
                $orderby = "td.tunnel_id";
                break;
            case "3":
                $orderby = "td.email";
                break;
        }
    }
    $orderdir = $order['dir'];
    $user_query=$db->query("SELECT lst.real_ip, lst.in_use, td.tunnel_id, td.email FROM `real_ip_list` as lst LEFT JOIN `tunnels_data` as td on lst.real_ip = td.real_ip ORDER BY " . $orderby . " " . $orderdir . " LIMIT " . $Limit_Low . ", " . $Limit_Hi );//SELECT lst.subnet, lst.used_ips, td.tunnel_id, td.email FROM `server_subnets` as lst LEFT JOIN `tunnels_data` as td on lst.subnet = td.cloud_ip ORDER BY " . $orderby . " " . $orderdir . " LIMIT " . $Limit_Low . ", " . $Limit_Hi );
    $records = array(
        'draw' => $_GET['draw'],
        'recordsTotal' => $count,
        'recordsFiltered' => $count,

        'data' => array()
    );
    $data = array();
    while($user_query_array=$user_query->fetch_assoc()) {
        /*<tr id="<?php echo str_replace('.', '_', $user_query_array['real_ip']) ?>" data-ip="<?php echo $user_query_array['real_ip'] ?>" data-inuse="<?php echo ($user_query_array['in_use']==1?"1":"0") ?>">
                                    <td><?php echo $user_query_array['real_ip'] ?></td>
                                    <td><?php echo ($user_query_array['in_use']==1?"Used":"Unused") ?></td>
									<td><?php echo ($user_query_array['tunnel_id']!= NULL ? $user_query_array['tunnel_id'] :"") ?></td>
									<td><?php echo ($user_query_array['email']!= NULL ? $user_query_array['email'] :"") ?></td>
                                    <td>
                                        <a href="javascript:remove_ip('<?php echo $user_query_array['real_ip'] ?>');" class="delete_real" data-id="<?php echo $user_query_array['real_ip'] ?>"><i class="fa fa-fw fa-trash text-danger"></i></a>
                                    </td>
                                </tr>*/
        $data[] = array(
            'DT_RowId' =>  str_replace('.', '_', $user_query_array['real_ip']),
            "DT_RowData" => array(
                "inuse" => $user_query_array['in_use']==1?"1":"0",
                "ip" => $user_query_array['real_ip']
            ),
            '0' => $user_query_array['real_ip'],
            '1' => $user_query_array['in_use']==1?"Used":"Unused",
            '2' => $user_query_array['tunnel_id']!= NULL ? $user_query_array['tunnel_id'] :"",
            '3' => $user_query_array['email']!= NULL ? $user_query_array['email'] :"",
            '4' => '<a href="javascript:remove_ip(\'' . $user_query_array['real_ip'] . '\');" class="delete_real" data-id="' . $user_query_array['real_ip'] . '"><i class="fa fa-fw fa-trash text-danger"></i></a>'
        );
    }
    $records['data'] = $data;

    ob_end_clean();
    header('Content-Type: application/json');
    die(json_encode($records));

}



ob_end_flush();
?>

 <div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-lg-10">
        <h2>FooTable</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">Real IP info</a>
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
                    <a href="javascript:void(0);" id="add_real" class=""><i class="fa fa-fw fa-plus"></i>Create real ip</a>
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
                          <div id="msg" class="bg-success" style="padding:7px;mergin-top:5px;"><strong>Real ip created successfully</strong></div>
                        <?php } ?>
                    <div id="" style=" min-height: 581px;">

                    <table id="real_ip_table" class="footable table table-stripped toggle-arrow-tiny table-hover dataTable" data-page-size="8">
                        <thead>
                        <tr>
                            <th>Real IP.</th>
                            <th>Status</th>
							<th>Tunnel</th>
							<th>LoggedIn</th>
                            <!-- <th>Belongs to</th> -->
                            <th>Action</th>
                        </tr>
                        </thead>
                        <!--tbody>
                                <?php //$user_query=$db->query("SELECT lst.real_ip, lst.in_use, td.tunnel_id, td.email FROM `real_ip_list` as lst LEFT JOIN `tunnels_data` as td on lst.real_ip = td.real_ip ORDER BY td.real_ip DESC");
                              // while($user_query_array=$user_query->fetch_assoc()){ ?>


                                <?php //} ?>
                        </tbody-->
                    </table>
                        <div class="row">
                        <a class="btn btn-block btn-primary btn-flat" href="javascript:remove_selected();" style="max-width: 200px; margin: 0;">Remove selected</a>
                        <a class="btn btn-block btn-primary btn-flat" href="javascript:select_all();" style="max-width: 200px; margin: 0;">Select all</a>
                        <a class="btn btn-block btn-primary btn-flat" href="javascript:deselect_all();" style="max-width: 200px; margin: 0;">Clear Selection</a>
                        </div>
                        <form id="ipform" onsubmit="javascript:return ValidateIPaddress();" role="form" action="" method="post">
                            <div class="form-group" id="scroll_div">

                              <label for="email">Real IP:</label>

                              <div class="row">
                                  <div class="col-md-6">
                                    <p id="validate_ip"></p>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-6">
                                      <label for="email">From:</label>
                                      <input type="text" class="form-control" id="realfrom" name="real_from" placeholder="Enter real ip" required>
                                  </div>
                                  <div class="col-md-6">
                                        <label for="email">To:</label>
                                  <input type="text" class="form-control" id="realto" name="real_to" placeholder="Enter real ip" required>
                                  </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success" id="btn_submin" name="submit" value="1">Create</button>
                          </form>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var riptable;
    var pattern = /\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/;
    $(function () {
        riptable = $("#real_ip_table").DataTable({
            "iDisplayLength": 100,
            "searching": false,
            "aoColumns": [
                null,
                null,
                null,
                null,
                { "bSortable": false }
            ],
            serverSide: true,
            ajax: {
                url: 'real_ip.php?ajax=q',
                type: 'GET'
            }
        });
        $('#real_ip_table tbody').on( 'click', 'tr', function () {
            if($(this).data("inuse") == 0) {
                $(this).toggleClass('selected');
            }
        } );


        x = 46;
        $('input[type="text"]').keypress(function (e) {
            if (e.which != 8 && e.which != 0 && e.which != x && (e.which < 48 || e.which > 57)) {
                console.log(e.which);
                return false;
            }
        }).keyup(function () {
            var this1 = $(this);
            if (!pattern.test(this1.val())) {
                $('#validate_ip').css("color", "red");
                $('#validate_ip').text('Not Valid IP');
                while (this1.val().indexOf("..") !== -1) {
                    this1.val(this1.val().replace('..', '.'));
                }
                x = 46;
            } else {
                x = 0;
                var lastChar = this1.val().substr(this1.val().length - 1);
                if (lastChar == '.') {
                    this1.val(this1.val().slice(0, -1));
                }
                var ip = this1.val().split('.');
                if (ip.length == 4) {
                    ValidateIPaddress();
                    //$('#validate_ip').text('Valid IP');
                }
            }
        });
    });
    function remove_ip(ip)
    {
        if (window.confirm("Are you sure?")) {
            var tr = '#' + ip.split('.').join('_');
            if ($(tr).data("inuse") == 0) {
                items = [];
                items[0] = ip;
                $.ajax({
                    type: "POST",
                    url: "real_ip.php",
                    data: {act: "remove", items: items}
                }).done(function (data) {
                    var res = jQuery.parseJSON(data);
                    riptable
                        .row($(tr))
                        .remove()
                        .draw();
                });

            }
            else {
                alert("This ip is in use and cannot be removed!");
            }
        }
        return false;
    }
    function remove_selected()
    {
        if (window.confirm("Are you sure?")) {
            var i = 0;
            items = [];
            $('#real_ip_table tr.selected').each2(function () {
                items[i] = $(this).data("ip");
                i++;
            });
            $.ajax({
                type: "POST",
                url: "real_ip.php",
                data: {act: "remove", items: items}
            }).done(function (data) {
                var res = jQuery.parseJSON(data);
                riptable
                    .rows('.selected')
                    .remove()
                    .draw();
            });
        }
        return false;
    }
    function deselect_all()
    {
        $('#real_ip_table tr.selected' )
            .toggleClass('selected');
        return false;
    }
    function select_all()
    {
        $('#real_ip_table tr' ).each2(function()
        {
            if($(this).data("inuse") == 0) {
                $(this).addClass('selected');
            }
        });
        return false;
    }
    function ValidateIPaddress()
    {
        if (pattern.test($("#realfrom").val()) && pattern.test($("#realto").val()))
        {
            $('#validate_ip').css("color", "green");
            $('#validate_ip').text('Valid IP');
            return (true)
        }
        $('#validate_ip').css("color", "red");
        $('#validate_ip').text('Not Valid IP');
        return (false)
    }
</script>
         <?php include 'elements/admin_footer.php';?>

