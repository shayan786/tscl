<div class="panel panel-default"> 
    	<div class="panel-heading"> 
        	<h2 class="panel-title"> Man of the Matches </h2>
        </div>
        <div class="panel-body" style="min-height: 300px">
            <div id="mom-carousel" class="carousel slide" data-ride="carousel">
            		<?php 
                      include './connect.php';
					  
					  	$year = date('Y');
						$over_format = "35";
						$table_name = "schedule_".date('Y')."_".$over_format;
					  
						$query = "SELECT * FROM $table_name WHERE mom_tscl_id IS NOT NULL AND mom_tscl_id <> '' ORDER BY no ASC";
                     	$result = mysqli_query($con, $query);
						$i = 1;
						
						echo '<div class="carousel-inner" role="listbox">';
							while ($row = mysqli_fetch_array($result)) {
								$player_query = "SELECT * FROM login_users WHERE tscl_id = '".$row['mom_tscl_id']."'";
								$player_info = mysqli_fetch_array(mysqli_query($con,$player_query));
								
										if ($i == 1) {
											echo '<div class="item active" style="background-image: url('."'".'../../images/mom/'.$row['mom_url']."'".')">';
										}
										else {
											echo '<div class="item" style="background-image: url('."'".'../../images/mom/'.$row['mom_url']."'".')">';
										}
										  echo '<div class="carousel-caption">
													<h4>'.$player_info['first_name'].' '.$player_info['last_name'].'</h4>
													<h5>'.$row['no'].' - '.$row['home']." vs ".$row['away'].'</h5>
												  </div>
										</div>';
								
								$i++;
							}
						echo '</div>';
					?>
        </div>
    </div>
</div>