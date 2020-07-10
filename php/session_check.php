<?php
	if(!isset($_COOKIE['user_type'])) {		
		header("Location: ../php/login_failure.php");
	}
	
?>