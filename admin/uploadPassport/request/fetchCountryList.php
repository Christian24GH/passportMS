<?php
    $root = $_SERVER["DOCUMENT_ROOT"] . '/dashboard/TourAndTravel/PPVS';
    include $root.'/admin/connection.php';

    header("Content-Type: application/json");
    $response = [];
    
    $result = $conn->query("SELECT countryID, country_code from issuing_country");

    if($result !== false && $result->num_rows > 0){
        while($row = $result->fetch_assoc()) {
            $response += [$row["countryID"] => $row["country_code"]];
        }
    }
    echo json_encode($response);
?>