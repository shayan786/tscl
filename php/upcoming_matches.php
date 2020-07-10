<div id="upcoming_matches">
	<div class="panel panel-default"> 
    	<div class="panel-heading"> 
        	<h2 class="panel-title"> Upcoming Matches </h2>
        </div>
        <div class="panel-body">
        	<table id="upcoming_matches" class="table table-condensed">
             <thead>
                 <tr>
                    <th> No. </th>
                    <th> Date </th>
                    <th> Home </th>
                    <th> Away </th>
                    <th> Ground </th>
                 </tr>
             </thead>
             
             <tbody>
                    <?php
							
						   include 'connect.php';
						   
                        $year= date("Y");
                        $over_format = "35";
                        
                        $query = mysqli_query($con, "SELECT * FROM schedule_".$year."_".$over_format." WHERE date >= CURDATE() ORDER BY date,no ASC LIMIT 10");
                        
                        while ($row = mysqli_fetch_array($query)) {
                            echo '<tr>';
                                echo '<td> '.$row['no'].' </td>';
                                echo '<td> '.substr($row['date'],5,5).' </td>';
                                echo '<td> '.$row['home'].' </td>';
                                echo '<td> '.$row['away'].' </td>';
                                echo '<td> '.$row['ground'].' </td>';
                            echo '</tr>';							
                            
                        }
                    ?>
                    
             </tbody>
            </table>
        
        </div>
        
     </div>
                        
 </div>