<?php
    $root = $_SERVER["DOCUMENT_ROOT"] . '/TourAndTravel/PPVS';
    include $root.'/client/connection.php';
 
    header("Content-Type: application/json");
    $response = array();
     
    $result = $conn->query("SELECT nID, nationality from nationality");
    
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            $response += [$row["nID"] => $row["nationality"]];
        }
    }
    echo json_encode($response);
?>