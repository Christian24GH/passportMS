<?php
    $local_url = $_SERVER["DOCUMENT_ROOT"]."/TourAndTravel/PPVS";
    include "$local_url/admin/connection.php";

    header('Content-Type: application/json');
    
    class responseFormat {
        public $applicationID;
        public $note;
        public $status;
        public $message;
    }

    $json = json_decode(file_get_contents("php://input"),true);
    $rejectionQuery = $conn->prepare("INSERT into rejections(applicationID, description) VALUES (?,?)");

    $data = new responseFormat();
    
    if($json != null){
        $data->applicationID = isset($json["applicationID"])?(int)$json["applicationID"]:null;
        $data->note = isset($json["note"])?$json["note"]:null;

        if($data->applicationID === null || $data->note === null){
            $data->status = "Bad";
            $data->message = "invalid data";
            echo json_encode($data);
            exit;
        }else{
            $rejectionQuery->bind_param("is", $data->applicationID, $data->note);
            if($rejectionQuery->execute()){
                $conn->query("UPDATE application SET status = 'rejected' WHERE applicationID = {$data->applicationID}");
            }
            $data->status = "ok";
            $data->message = "successful";
            echo json_encode($data);
            exit;
        }
    }else{
        $data->status = "Bad";
        $data->message = "Invalid JSON";
        echo json_encode($data);
    }
?>