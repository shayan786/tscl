<div id="team_rankings">
		<div class="panel panel-default"> 
            <div class="panel-heading"> 
                <h2 class="panel-title"> Points Table </h2>
            </div>
            <div class="panel-body" style="height: 300px; overflow-y: auto;">
            	<ul class="nav nav-tabs">
                    <li class="active"><a href="#">35 Overs</a></li>
                    <li><a href="#">20 Overs</a></li>
                  </ul>
              
            <table id="35-rankings" class="table table-condensed">
                 <thead>
                        <tr>
                            <th class="text-center"> Rank </th>
                        <th> Team </th>
                        <th class="text-center"> GP </th>
                        <th class="text-center"> W </th>
                        <th class="text-center"> L </th>
                        <th class="text-center"> Points </th>
                     </tr>
                 </thead>
                 
                 <tbody>
                        <?php
                            $query = "SELECT * FROM points_table_2020_35 ORDER BY (total_points+0) DESC";
                            $result = mysqli_query($con, $query);
                        
                            $i = 1;
                    
                            while ($row = mysqli_fetch_array($result)) {
                                $gp = $row['tied']+$row['wins']+$row['losses']+substr($row['ff'],1,1);
                                
                                echo '<tr>';
                                    echo '<td class="text-center"> '.$i.' </td>';
                                    echo '<td> '.$row['team'].' </td>';
                                    echo '<td class="text-center"> '.$gp.'</td>';
                                    echo '<td class="text-center"> '.$row['wins'].' </td>';
                                    echo '<td class="text-center"> '.$row['losses'].' </td>';
                                    echo '<td class="text-center"> '.$row['total_points'].' </td>';
                                echo '</tr>';							
                                
                                $i++;
                            }
                        ?>
                 </tbody>
                </table>
                
              <table id="20-rankings" class="table table-condensed" style="display: none;">
                 <thead>
                        <tr>
                            <th class="text-center"> Rank </th>
                        <th> Team </th>
                        <th class="text-center"> GP </th>
                        <th class="text-center"> W </th>
                        <th class="text-center"> L </th>
                        <th class="text-center"> Points </th>
                     </tr>
                 </thead>
                 
                 <tbody>
                        <?php
                            $query = "SELECT * FROM points_table_2020_20 ORDER BY (total_points+0) DESC";
                            $result = mysqli_query($con, $query);
                        
                            $i = 1;
                    
                            while ($row = mysqli_fetch_array($result)) {
                                $gp = $row['tied']+$row['wins']+$row['losses']+substr($row['ff'],1,1);
                                
                                echo '<tr>';
                                    echo '<td class="text-center"> '.$i.' </td>';
                                    echo '<td> '.$row['team'].' </td>';
                                    echo '<td class="text-center"> '.$gp.'</td>';
                                    echo '<td class="text-center"> '.$row['wins'].' </td>';
                                    echo '<td class="text-center"> '.$row['losses'].' </td>';
                                    echo '<td class="text-center"> '.$row['total_points'].' </td>';
                                echo '</tr>';							
                                
                                $i++;
                            }
                        ?>
                 </tbody>
                </table>
            </div>
        </div>
</div>
