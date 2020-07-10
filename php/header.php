<?php
	$root = (!empty($_SERVER['HTTPS']) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . '/';
	
	echo '
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="'.$root.'main.php"><img src="'.$root.'images/tscl.png" style="width: 85px; margin-top: -10px;"></a>
		</div>
	
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-collapse-1">
		  <ul class="nav navbar-nav navbar-right">
			<li><a href="'.$root.'main.php">Home</a></li>
			
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Game Zone <span class="caret"></span> </a>
				<ul class="dropdown-menu">
					<li><a href="'.$root.'game_zone/fixtures/fixtures.php">Fixtures / Scorecards</a></li>
					<li><a href="'.$root.'game_zone/stats/stats.php">Statistics</a></li>
					<li><a href="'.$root.'game_zone/points_table/points_table.php">Points Table</a></li>
					<li><a href="'.$root.'game_zone/players/players.php">Players List</a></li>
					<li><a href="'.$root.'game_zone/approved_umpires/approved_umpires.php">Approved Umpires</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="'.$root.'game_zone/mom/mom.php">Man of Match</a></li>
				</ul>
			</li>
			
			
			
			<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Operations <span class="caret"></span> </a>
				<ul class="dropdown-menu">
<li><a href="'.$root.'operations/constitution.php">Constitution</a></li>
					<li><a href="'.$root.'operations/bylaws.php">ByLaws</a></li>
					<li><a href="'.$root.'operations/tscl_laws.php">TSCL 35 Over Playing conditions</a></li>

                                        <li><a href="'.$root.'operations/tscl_laws_T20.php">TSCL T20 Playing conditions</a></li>

					<li><a href="'.$root.'operations/mcc_laws.php">Laws of Cricket</a></li>
					<li><a href="'.$root.'operations/exec_committee.php">Executive Committee</a></li>
					<li><a href="'.$root.'operations/jud_committee.php">Judiciary Committee</a></li>
					<li><a href="'.$root.'operations/umpiring.php">Umpiring Committee</a></li>
					<li><a href="'.$root.'operations/umpiring_qa.php">Umpiring Committee Q & A</a></li>
					<li><a href="'.$root.'operations/meeting_minutes_menu.php">Meeting Minutes</a></li>
					
				</ul>
			</li>
			
<li><a href="'.$root.'clubs_grounds/clubs_grounds.php">Clubs & Grounds</a></li>';
		
			if(isset($_COOKIE['tscl_id'])) {
				$user_type = $_COOKIE['user_type'];
				$club_name = $_COOKIE['club_name'];
				
				echo '<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Hello, '. $_COOKIE['userlogin'] .'<span class="caret"></span> </a>';
					echo '<ul class="dropdown-menu">';
						//Player access rights
						if (strcasecmp($user_type,"player")==0) {
							echo '<li> <a href="'.$root.'admin/show_umpire_evals.php"> Show Completed Umpire Evaluations </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_match_reports.php"> Show Completed Match Reports </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_coc_violations.php"> COC Violations </a> </li>';
							echo '<li> <a href="#"> View Active Polls (Coming Soon) </a></li>';
							echo '<li> <a href="'.$root.'admin/report_problem.php"> Report A Problem</a></li>';
						}
						if (strcasecmp($user_type,"captain")==0) {
							echo '<li> <a href="'.$root.'admin/conf_game.php"> Confirm Game </a></li>';
							echo '<li> <a href="'.$root.'admin/conf_umpire.php"> Confirm Umpiring </a></li>';
							echo '<li> <a href="'.$root.'admin/match_report.php"> Complete Match Report </a></li>';
							
							echo '<li role="separator" class="divider"></li>';
							echo '<li> <a href="'.$root.'admin/umpire_eval.php"> Complete Umpire Evaluation </a></li>';
							echo '<li> <a href="'.$root.'admin/upload_scorecard_captain.php"> Upload a Scorecard </a></li>';
							echo '<li> <a href="'.$root.'admin/show_umpire_evals.php"> Show Completed Umpire Evaluations </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_match_reports.php"> Show Completed Match Reports </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_coc_violations.php"> COC Violations </a> </li>';
						}
						//if EC member then have access to the following items
						if (strcasecmp($user_type,"ec")==0) {
							echo '<li> <a href="'.$root.'admin/edit_player_ec_add.php"> Add a Player</a> </li>';
							echo '<li> <a href="'.$root.'admin/edit_player_ec.php"> Edit Player Info </a> </li>';
							echo '<li> <a href="'.$root.'admin/edit_news.php"> Edit News Postings </a> </li>';
							echo '<li> <a href="'.$root.'admin/edit_schedule.php"> Edit Schedule </a> </li>';
							echo '<li> <a href="'.$root.'admin/select_mom_ec.php"> Select MOMs </a> </li>';
							echo '<li> <a href="'.$root.'admin/post_trivia.php"> Post a Trivia Question </a> </li>';
							echo '<li> <a href="'.$root.'admin/points_table.php"> Update Points Table </a> </li>';
							echo '<li> <a href="'.$root.'admin/upload_meeting_minutes.php"> Upload Meeting Minutes </a> </li>';
							echo '<li> <a href="'.$root.'admin/view_uploaded_scorecards.php"> View Uploaded PDBs </a> </li>';
							echo '<li> <a href="'.$root.'admin/upload_scorecard_ec.php"> Upload Scorecard For Parsing </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_umpire_evals.php"> Show Completed Umpire Evaluations </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_match_reports.php"> Show Completed Match Reports </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_coc_violations.php"> COC Violations </a> </li>';
							echo '<li> <a href="'.$root.'admin/upload_photos.php"> Upload Photos</a> </li>';
							
							echo '<li role="separator" class="divider"></li>';
							echo '<li> <a href="'.$root.'admin/email_all_captains.php"> Email All Captains</a> </li>';
							echo '<li> <a href="'.$root.'admin/email_all.php"> Email All Members</a> </li>';
						}
						
						//add exceptions for ec & captain menu
						if (strcasecmp($user_type,"ec, captain")==0) {
							echo '<li> <a href="'.$root.'admin/edit_player_ec_add.php"> Add a Player</a> </li>';
							echo '<li> <a href="'.$root.'admin/edit_player_ec.php"> Edit Player Info </a> </li>';
							echo '<li> <a href="'.$root.'admin/edit_news.php"> Edit News Postings </a> </li>';
							echo '<li> <a href="'.$root.'admin/edit_schedule.php"> Edit Schedule </a> </li>';
							echo '<li> <a href="'.$root.'admin/select_mom_ec.php"> Select MOMs </a> </li>';
							echo '<li> <a href="'.$root.'admin/post_trivia.php"> Post a Trivia Question </a> </li>';
							echo '<li> <a href="'.$root.'admin/points_table.php"> Update Points Table </a> </li>';
							echo '<li> <a href="'.$root.'admin/upload_meeting_minutes.php"> Upload Meeting Minutes </a> </li>';
							echo '<li> <a href="'.$root.'admin/view_uploaded_scorecards.php"> View Uploaded PDBs </a> </li>';
							echo '<li> <a href="'.$root.'admin/upload_scorecard_ec.php"> Upload Scorecard For Parsing </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_umpire_evals.php"> Show Completed Umpire Evaluations </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_match_reports.php"> Show Completed Match Reports </a> </li>';
							echo '<li> <a href="'.$root.'admin/show_coc_violations.php"> COC Violations </a> </li>';
							echo '<li> <a href="'.$root.'admin/upload_photos.php"> Upload Photos</a> </li>';
							
							echo '<li role="separator" class="divider"></li>';
							echo '<li> <a href="'.$root.'admin/email_all_captains.php"> Email All Captains</a> </li>';
							echo '<li> <a href="'.$root.'admin/email_all.php"> Email All Members</a> </li>';
							
							echo '<li role="separator" class="divider"></li>';
							echo '<li> <a href="'.$root.'admin/conf_game.php"> Confirm Game </a></li>';
							echo '<li> <a href="'.$root.'admin/conf_umpire.php"> Confirm Umpiring </a></li>';
							echo '<li> <a href="'.$root.'admin/match_report.php"> Complete Match Report </a></li>';
							echo '<li> <a href="'.$root.'admin/umpire_eval.php"> Complete Umpire Evaluation </a></li>';
							echo '<li> <a href="'.$root.'admin/upload_scorecard_captain.php"> Upload a Scorecard </a></li>';
						}
			
				
						echo '<li role="separator" class="divider"></li>';
				//		echo '<li> <a href="'.$root.'admin/umpire_exam_0.php"> Take Level 0 Exam </a> </li>';
						echo '<li><a href="'.$root.'admin/edit_profile.php?edit_flag=0">My Profile</a></li>';
						echo '<li> <a href="'.$root.'change_password.php"> Change Password </a> </li>';
						echo '<li><a href="'.$root.'logout.php">Logout</a></li>';	
				   echo '</ul>';
				
				echo '</li>';	
			}
			else {
				echo '<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Login<span class="caret"></span> </a>';
				
					echo '<div class="dropdown-menu" style="padding:17px 12px 12px 12px;">';
							echo '<form class="form" action="'.$root.'php/login_check.php" method="post">
							  <div class="form-group">
								<input type="text" class="form-control" placeholder="TSCL ID" style="margin-bottom: 10px;" name="tscl_id">
								<input type="password" class="form-control" placeholder="Password" name="password">
							  </div>
							  <button type="submit" class="btn btn-default" style="width: 100%; margin-bottom: 10px;">Login</button>
							</form>';
							echo '<a href="'.$root.'register.php"> Register </a>';
				   echo '</div>';
				
				echo '</li>';	
			}
			
			echo '
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	';
?>