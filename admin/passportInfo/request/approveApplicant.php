<?php
    $local_url = $_SERVER["DOCUMENT_ROOT"]."/TourAndTravel/PPVS";
    include "$local_url/admin/connection.php";

    header('Content-Type: application/json');
    $json = json_decode(file_get_contents("php://input"),true);

    $conn->query("UPDATE application SET status = 'approved' WHERE applicationID = {$json['applicationID']}");

    echo json_encode(array('status'=>'ok'));
?>