<?php

	//logon credentials
	/*
	$server_name = "localhost";
	$username = "root";
	$password = "Ksjfldf786";
	$db_name = "tscl_test";
	*/
	
	//tscl.us credentials
	$server_name = "tsclus.ipagemysql.com";
	$username = "tscl_admin";
	$password = "tscl_password";
	$db_name = "tscl_db";
	
	/*
	$server_name = "mysql16.000webhost.com";
	$username = "a3219270_tscl";
	$password = "tscl_test";
	$db_name = "a3219270_tscl";
	*/
	
	// Create connection
	$con=mysqli_connect($server_name,$username,$password,$db_name);
	
	// Check connection
	if (mysqli_connect_errno($con))
	  {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();
	  }

?>