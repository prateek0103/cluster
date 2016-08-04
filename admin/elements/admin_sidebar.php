<body>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul id="side-menu" class="nav metismenu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                             </span>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">David Williams</strong>
                             </span> <span class="text-muted text-xs block">ADMIN </span> </span> </a>
                    </div>
                    <div class="logo-element">
                        IN+
                    </div>
                </li>
                <li class="special_link">
                    <a href="javascript:void(0);" data-toggle="modal" data-target="#create_cust_modal"><i class="fa fa-plus"></i> <span class="nav-label">Create new customer</span></a>
                </li>
                <li class="special_link">
                    <a href="cust_info.php"><i class="fa fa-group"></i> <span class="nav-label">Customer data</span></a>
                </li>
                <li class="special_link">
                    <a href="cust_admin_info.php"><i class="fa fa-group"></i> <span class="nav-label">Admin customer data</span></a>
                </li>
                <li class="special_link">
                    <a href="remote_data.php"><i class="fa fa-database"></i> <span class="nav-label">Remote data list</span></a>
                </li>
                <li class="special_link">
                    <a href="cost_ctrl.php"><i class="fa fa-dollar"></i> <span class="nav-label">Cost control list</span></a>
                </li>
                <li class="special_link">
                    <a href="voucher_ctrl.php"><i class="fa fa-money"></i> <span class="nav-label">Voucher control list</span></a>
                </li>
                <li class="special_link">
                    <a href="vpn_ip.php"><i class="fa fa-dollar"></i> <span class="nav-label">VPN IP list</span></a>
                </li>
                <li class="special_link">
                    <a href="real_ip.php"><i class="fa fa-dollar"></i> <span class="nav-label">Real IP list</span></a>
                </li>
				 <li class="special_link">
                    <a href="global_settings.php"><i class="fa fa-dollar"></i> <span class="nav-label">Global settings</span></a>
                </li>
            </li>
            </ul>

            </div>
        </nav>

<div class="modal fade" id="create_cust_modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close"
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Create new customer
                </h4>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
            <div id="reg-response-message"></div>
                <form id="reg-form" novalidate="novalidate">
                    <fieldset>
                        <div class="form-group">
                            <input type="text" name="name" placeholder="Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" placeholder="E-mail" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="password" value="" id="password" name="password" placeholder="Password" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="password" value="" id="cpassword" name="cpassword" placeholder="Confirm password" class="form-control">
                        </div>
                        <!-- Change this to a button or input when using this as a form -->
                        <button class="btn btn-primary btn-cons pull-right" id="reg-form-submit-btn" type="submit">Sign up</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- <div class="modal fade" id="create_voucher_modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close"
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Create new voucher
                </h4>
            </div>

            <div class="modal-body">

                <form id="reg-form" novalidate="novalidate">
                    <fieldset>
                        <div class="form-group">
                            <input type="text" name="name" placeholder="Name" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" placeholder="E-mail" class="form-control">
                        </div>

                        <button class="btn btn-primary btn-cons pull-right" id="reg-form-submit-btn" type="submit">Sign up</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div> -->