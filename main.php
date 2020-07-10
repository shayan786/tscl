<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
		session_save_path('/home/users/web/b1463/ipg.tsclus/cgi-bin/tmp');
	}
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    
	<?php 
		include 'php/head_code.php'
    ?>     
		       
</head>
    <body>
    
    	<?php include 'php/header.php'; ?>
        
        
        <div class="container">  
            <div class="col-md-8"> 
                <div id="news">
                    <?php 
                        include 'php/connect.php';
                                
                        $query = "SELECT * FROM news WHERE id='1'";
                        $row1 = mysqli_fetch_array(mysqli_query($con,$query));	
                        
                        $link_query = "SELECT * FROM news_archive WHERE news_topic = '".$row1['news_topic']."'";
                        $link_row1 = mysqli_fetch_array(mysqli_query($con,$link_query));	
                        
                        $query = "SELECT * FROM news WHERE id='2'";
                        $row2 = mysqli_fetch_array(mysqli_query($con,$query));	
                        
                        $link_query = "SELECT * FROM news_archive WHERE news_topic = '".$row2['news_topic']."'";
                        $link_row2 = mysqli_fetch_array(mysqli_query($con,$link_query));	
                        
                        $query = "SELECT * FROM news WHERE id='3'";
                        $row3 = mysqli_fetch_array(mysqli_query($con,$query));	
                        
                        $link_query = "SELECT * FROM news_archive WHERE news_topic = '".$row3['news_topic']."'";
                        $link_row3 = mysqli_fetch_array(mysqli_query($con,$link_query));							
                        
                        $news_topic_1 = $row1['news_topic'];
                        $news_content_1 = $row1['news_content'];
                        
                        $news_topic_2 = $row2['news_topic'];
                        $news_content_2 = $row2['news_content'];
                        
                        $news_topic_3 = $row3['news_topic'];
                        $news_content_3 = $row3['news_content'];
                      ?>
                    
                    <div id="news-carousel" class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                        <li data-target="#news-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#news-carousel" data-slide-to="1"></li>
                        <li data-target="#news-carousel" data-slide-to="2"></li>
                      </ol>
                    
                      <!-- Wrapper for slides -->
                      <div class="carousel-inner" role="listbox">
                        <div class="item active" style="background-image: url('images/news/news_1.jpg')">
                          <div class="carousel-caption">
                            <h3><?php echo $news_topic_1 ?></h3>
                               <p>
                                  <?php 
                                    echo "<a href=	'news_archive_sql.php?id=".$link_row1['id']."'> Read More </a>";
                                  ?>
                            </p>
                          </div>
                        </div>
                        <div class="item" style="background-image: url('images/news/news_2.jpg')">
                          <div class="carousel-caption">
                            <h3><?php echo $news_topic_2 ?></h3>
                               <p>
                                  <?php 
                                    echo "<a href=	'news_archive_sql.php?id=".$link_row2['id']."'> Read More </a>";
                                  ?>
                            </p>
                          </div>
                        </div>
                        <div class="item" style="background-image: url('images/news/news_3.jpg')">
                          <div class="carousel-caption">
                            <h3><?php echo $news_topic_3 ?></h3>
                               <p>
                                  <?php 
                                    echo "<a href=	'news_archive_sql.php?id=".$link_row3['id']."'> Read More </a>";
                                  ?>
                            </p>
                          </div>
                        </div>
                      </div>
                    
                      <!-- Controls -->
                      <a class="left carousel-control" href="#news-carousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#news-carousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div> 
                </div>
                
                <div class="row">
                       <!--
                       <div class="col-md-6">
                        <div id="player_rankings">
                                <ul class="nav nav-tabs">
                                <li class="active"><a href="#">35 (Bat)</a></li>
                                <li><a href="#">35 (Bowl)</a></li>
                                <li><a href="#">20 (Bat)</a></li>
                                <li><a href="#">20 (Bowl)</a></li>
                              </ul>
                        
                                <table id="35-player-rankings-batting" class="table table-condensed">
                                 <thead>
                                        <tr>
                                            <th class="text-center"> Rank </th>
                                        <th> Name  </th>
                                        <th class="text-center"> Runs </th>
                                        <th class="text-center"> SR </th>
                                        <th class="text-center"> Avg </th>
                                     </tr>
                                 </thead>
                                 
                                 <tbody>
                                        <?php
                                            $query = "SELECT * FROM players_2016_35 ORDER BY (bat_runs+0) DESC LIMIT 12";
                                            $result = mysqli_query($con, $query);
                                            
                                            $i = 1;
                                
                                            while ($row = mysqli_fetch_array($result)) {
                                                $player_query = "SELECT * FROM login_users WHERE tscl_id = '".$row['tscl_id']."'";
                                                $player_info = mysqli_fetch_array(mysqli_query($con,$player_query));
                                                
                                                echo '<tr>';
                                                    echo '<td class="text-center"> '.$i.' </td>';
                                                    echo '<td> <a href="game_zone/stats/stats_sql_player.php?tscl_id='.$player_info['tscl_id'].'&over_format=35">'.ucfirst($player_info['first_name'])." ".ucfirst($player_info['last_name']).'</a> </td>';
                                                    echo '<td class="text-center"> '.$row['bat_runs'].' </td>';
                                                    echo '<td class="text-center"> '.$row['bat_sr'].' </td>';
                                                    echo '<td class="text-center"> '.round($row['bat_avg'],2).' </td>';
                                                echo '</tr>';							
                                                
                                                $i++;
                                            }
                                        ?>
                                        
                                        
                                 </tbody>
                                </table>
                                
                              <table id="20-player-rankings-batting" class="table table-condensed" style="display: none;">
                                 <thead>
                                        <tr>
                                            <th class="text-center"> Rank </th>
                                        <th> Name  </th>
                                        <th class="text-center"> Runs </th>
                                        <th class="text-center"> SR </th>
                                        <th class="text-center"> Avg </th>
                                     </tr>
                                 </thead>
                                 
                                 <tbody>
                                        <?php
                                            $query = "SELECT * FROM players_2016_20 ORDER BY (bat_runs+0) DESC LIMIT 12";
                                            $result = mysqli_query($con, $query);
                                            
                                            $i = 1;
                                
                                            while ($row = mysqli_fetch_array($result)) {
                                                $player_query = "SELECT * FROM login_users WHERE tscl_id = '".$row['tscl_id']."'";
                                                $player_info = mysqli_fetch_array(mysqli_query($con,$player_query));
                                                
                                                echo '<tr>';
                                                    echo '<td class="text-center"> '.$i.' </td>';
                                                    echo '<td> <a href="game_zone/stats/stats_sql_player.php?tscl_id='.$player_info['tscl_id'].'&over_format=35">'.ucfirst($player_info['first_name'])." ".ucfirst($player_info['last_name']).'</a> </td>';
                                                    echo '<td class="text-center"> '.$row['bat_runs'].' </td>';
                                                    echo '<td class="text-center"> '.$row['bat_sr'].' </td>';
                                                    echo '<td class="text-center"> '.round($row['bat_avg'],2).' </td>';
                                                echo '</tr>';							
                                                
                                                $i++;
                                            }
                                        ?>
                                        
                                        
                                 </tbody>
                                </table>
                                
                              <table id="35-player-rankings-bowling" class="table table-condensed" style="display: none;">
                                 <thead>
                                        <tr>
                                            <th class="text-center"> Rank </th>
                                        <th> Name  </th>
                                        <th class="text-center"> Wickets </th>
                                        <th class="text-center"> Runs </th>
                                        <th class="text-center"> Econ </th>
                                     </tr>
                                 </thead>
                                 
                                 <tbody>
                                        <?php
                                            $query = "SELECT * FROM players_2016_35 WHERE bowl_overs > 0 ORDER BY (bowl_wickets + 0) DESC, bowl_economy ASC LIMIT 12";
                                            $result = mysqli_query($con, $query);
                                            
                                            $i = 1;
                                
                                            while ($row = mysqli_fetch_array($result)) {
                                                $player_query = "SELECT * FROM login_users WHERE tscl_id = '".$row['tscl_id']."'";
                                                $player_info = mysqli_fetch_array(mysqli_query($con,$player_query));
                                                
                                                echo '<tr>';
                                                    echo '<td align="center"> '.$i.' </td>';
                                                    echo '<td> <a href="game_zone/stats/stats_sql_player.php?tscl_id='.$player_info['tscl_id'].'&over_format=35">'.ucfirst($player_info['first_name'])." ".ucfirst($player_info['last_name']).'</a> </td>';
                                                    echo '<td class="ballsruns"> '.$row['bowl_wickets'].' </td>';
                                                    echo '<td class="ballsruns"> '.$row['bowl_runs'].' </td>';
                                                    echo '<td class="ballsruns"> '.$row['bowl_economy'].' </td>';
                                                echo '</tr>';							
                                                
                                                $i++;
                                            }
                                        ?>
                                        
                                        
                                 </tbody>
                                </table>
                                
                              <table id="20-player-rankings-bowling" class="table table-condensed" style="display: none;">
                                 <thead>
                                        <tr>
                                            <th class="text-center"> Rank </th>
                                        <th> Name  </th>
                                        <th class="text-center"> Wickets </th>
                                        <th class="text-center"> Runs </th>
                                        <th class="text-center"> Econ </th>
                                     </tr>
                                 </thead>
                                 
                                 <tbody>
                                        <?php
                                            $query = "SELECT * FROM players_2016_20 WHERE bowl_overs > 0 ORDER BY (bowl_wickets + 0) DESC, bowl_economy ASC LIMIT 12";
                                            $result = mysqli_query($con, $query);
                                            
                                            $i = 1;
                                
                                            while ($row = mysqli_fetch_array($result)) {
                                                $player_query = "SELECT * FROM login_users WHERE tscl_id = '".$row['tscl_id']."'";
                                                $player_info = mysqli_fetch_array(mysqli_query($con,$player_query));
                                                
                                                echo '<tr>';
                                                    echo '<td align="center"> '.$i.' </td>';
                                                    echo '<td> <a href="game_zone/stats/stats_sql_player.php?tscl_id='.$player_info['tscl_id'].'&over_format=35">'.ucfirst($player_info['first_name'])." ".ucfirst($player_info['last_name']).'</a> </td>';
                                                    echo '<td class="ballsruns"> '.$row['bowl_wickets'].' </td>';
                                                    echo '<td class="ballsruns"> '.$row['bowl_runs'].' </td>';
                                                    echo '<td class="ballsruns"> '.$row['bowl_economy'].' </td>';
                                                echo '</tr>';							
                                                
                                                $i++;
                                            }
                                        ?>
                                        
                                        
                                 </tbody>
                                </table>
                            </div>
                       </div>
               
               -->
               
               <?php include 'php/live_score.php' ?>
           </div>
           
                
            </div>
                
                
             <div class="col-md-4">  
                  <?php include 'php/points_table_original.php' ?>
                  
                  <?php include 'php/mom.php' ?>
                  
                  <?php include 'php/upcoming_matches.php' ?>
                  
                  <?php include 'php/weather.php' ?>
             </div>
             
             <div class="row">
             	 	<div class="col-md-12">
                		<?php include 'php/fb_comments.php' ?>
                	</div>
             </div>
        </div>
        
        <script>
			homepage();
		</script>
        
    </body>

</html>