<?php
session_start();
if(!isset($_SESSION['vpn_user']) and trim($_SESSION['vpn_user']) == "")
 header("location:login.php");
?>