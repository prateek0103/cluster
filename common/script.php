<!-- ACL search modal -->
<div id="ACLsearchModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Search destination ACL</h4>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-6">
                    <input type="text" class="form-control acl_search_input" placeholder="Enter email id to search destination acl"/>
                    <level class=""></level>
                </div>
                <div class="col-lg-2">
                    <input type="button" class="btn acl_search_btn" value="Search">
                </div>
                <div class="col-lg-4">

                </div>
            </div>
            <div class="col-lg-12">
                <div id="msg" class=""></div>
            </div>
            <div class="col-lg-12">
                <div class="acl_search_result" style="overflow: scroll; height: 928px; width: 1125px;">

                </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<!-- end of ACL search modal -->


<script src="assets/js/initial.js" type="text/javascript"></script>

<script src="assets/plugins/bootstrapv3/js/bootstrap.min.js" type="text/javascript"></script>

<!-- crop css library -->
<!-- <link href="assets/crop/dist/cropper.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/crop/dist/css/main.css" rel="stylesheet" type="text/css"/> -->
<!-- end of crop css library -->

<!-- crop image js -->
<script src="assets/crop/dist/cropper.min.js" type="text/javascript"></script>

<script src="assets/crop/dist/js/main.js" type="text/javascript"></script>
<!-- end of crop image js -->

<script src="webarch/js/jquery.dragscroll.js" type="text/javascript"></script>

<script src="assets/plugins/pace/pace.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-block-ui/jqueryblockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-unveil/jquery.unveil.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-numberAnimate/jquery.animateNumbers.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>

<script src="webarch/js/webarch.js" type="text/javascript"></script>

<script src="webarch/js/jquery-ui.min.js" type="text/javascript"></script>

<script src="assets/js/chat.js" type="text/javascript"></script>

<script src="assets/plugins/bootstrap-select2/select2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-datatable/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-datatable/extra/js/dataTables.tableTools.min.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/plugins/datatables-responsive/js/datatables.responsive.js"></script>
<script type="text/javascript" src="assets/plugins/datatables-responsive/js/lodash.min.js"></script>
<script src="assets/js/datatables.js" type="text/javascript"></script>

<script src="assets/plugins/jquery-mixitup/jquery.mixitup.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.notify.min.js" type="text/javascript"></script>
<script src="assets/js/fancywebsocket.js" type="text/javascript"></script>

<script src="assets/js/search_results.js" type="text/javascript"></script>
<script src="assets/js/select2.min.js" type="text/javascript"></script>
<script src="assets/js/bootstrap-editable.min.js" type="text/javascript"></script>

<script src="webarch/js/popover.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var user_cloud="<?php echo $_SESSION['cloud']; ?>";
</script>



<script src="assets/js/custom.js" type="text/javascript"></script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.3.1/jquery.cookie.min.js"></script>

<script type = "text/javascript">
    $( document ).ready(function() {
        if ($.cookie('hide-after-load') == 'yes') {
          $('.amount_div').hide();
          $('.amount_div1').show();
        }else{
            $('.amount_div').show();
          $('.amount_div1').hide();
        }
    $('.hide_amount').click(function(){
        {
            $.cookie('hide-after-load', 'yes', {expires: 7 });
            $('.amount_div1').show();
            $('.amount_div').hide();
        }
    });
    $('.show_amount').click(function(){
        {
            $.cookie('hide-after-load', '', {expires: 0 });
             $('.amount_div').show();
            $('.amount_div1').hide();
        }
    });
});
</script>
<?php ob_end_flush() ?>