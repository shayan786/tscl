<?php
	$root = (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . '/';

	echo '<script type="text/javascript" src="'.$root.'js/jquery.js"></script>';  
	echo '<script type="text/javascript" src="'.$root.'js/menu.js"></script>';	
	
	echo '<link rel="stylesheet" type="text/css" href="'.$root.'css/menu.css" media="screen" />';
	echo '<link rel="stylesheet" type="text/css" href="'.$root.'css/styles.css" media="screen" />';
	echo '<link rel="stylesheet" type="text/css" href="'.$root.'css/flick/jquery-ui-1.10.3.custom.css" media="screen" />';
	echo '<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">';
	echo '<link rel="stylesheet type="text/css" href="'.$root.'php/web/css/poll_style.css" />';
	echo '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">';
	
	echo '<link rel="shortcut icon" href="'.$root.'images/favicon.png" />';
	
	echo '<meta http-equiv="content-type" content="text/html; charset=utf-8" />';
	echo '<meta http-equiv="content-type" content="cache" />';
	echo '<meta name="robots" content="INDEX,FOLLOW" />';
        echo '<meta name="keywords" content="cricket, oklahoma, oklahoma city, witchita, stillwater, tscl, tscl.us, tulsa, tri-state, tristate, two-state, twostate, league, tristatecricket, cricket, cricket league" />';			
	echo ' <meta name="description" content="Cricket League in Oklahoma & Kansas, USA" />';
	echo '<meta name="viewport" content="width=device-width, initial-scale=1.0">';
	
	echo '<title>Two-State Cricket League</title>';
	
	echo '<script src="'.$root.'js/jquery.easing.js"></script>';
	echo '<script type="text/javascript" src="'.$root.'js/jquery-ui-1.10.3.custom.js"></script>';
	echo '<script type="text/javascript" src="'.$root.'js/jquery.tools.min.js"></script>';		
	echo '<script type="text/javascript" src="'.$root.'php/web/js/ajax_poll.js"></script>';
	echo '<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>';
	echo '<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>';
	echo '<script src="'.$root.'js/app.js"></script>';
	echo '<script src="'.$root.'js/jquery.simpleWeather.min.js"></script>';
	
	echo '<script>';
		echo '$(function() {';
		echo '$( "#datepicker" ).datepicker();';
		echo '});';
	echo '</script>';
                
?>