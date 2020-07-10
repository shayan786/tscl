<?php
	include '../php/session_check.php';
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

	<?php include $_SERVER['DOCUMENT_ROOT'].'/php/head_code.php'; ?>
       
</head>
    <body>
       <?php include $_SERVER['DOCUMENT_ROOT'].'/php/header.php'; ?>
       
       <div class="container">
        	<div class="col-md-8">
            	  <div class="panel panel-default"> 
                    <div class="panel-heading"> 
                    	<h2 class="panel-title"> Admin </h2> 
                     </div>
                    
                    <div class="panel-body">
                    		<h3 class="third_header"> Confirm game (Y/N): </h3>
                    
							<?php
                                include '../php/connect.php';
                                
                                $user_type = $_COOKIE['user_type'];
                                $club_name = $_COOKIE['club_name'];
                                
                                $no = $_GET['no'];
                                $table_name = $_GET['table_name'];
                                                    
                                //if EC member then have access to the following items
                                if (strcasecmp($user_type,"captain")==0  || strcasecmp($user_type,"ec, captain")==0) {
                                     
                                    $query = "SELECT * FROM ".$table_name." WHERE no = '$no'";
                                    $result = mysqli_query($con, $query);
                                    
                                    echo '<form class="conf_game_yn" action="conf_game_success.php?no='.$no.'&table_name='.$table_name.'" method="post">';
                                        echo '<input type="radio" name="conf_game" value="yes"> YES <br><br>';
                                        echo '<input type="radio" name="conf_game" value="no"> NO <br><br>';								
                                        
                                        echo '<br><br>';
                                        
                                        echo '<textarea name="comments" rows="12" cols="50" placeholder="Enter game remarks here..."></textarea><br><br>';
                                        
                                        echo '<input type="submit" value="Submit">';
                                        
                                    echo '</form>';
                                    
                                    mysqli_close($con);
                                }
                                
                                else {
                                    echo "Sorry you do not have sufficient privileges!";	
                                }
                                                
                            ?>
                     </div>
                  </div>
             </div>
             
             <div class="col-md-4">
                  <?php include $_SERVER['DOCUMENT_ROOT'].'/php/upcoming_matches.php' ?>
                  
                  <?php include $_SERVER['DOCUMENT_ROOT'].'/php/weather.php' ?>
             </div>
        </div>
        
    </body>

</html>