<?php
    function getApplicantInfo(){
        $local_url = $_SERVER["DOCUMENT_ROOT"]."/TourAndTravel/PPVS";
        include "$local_url/admin/connection.php";

        $sql = "SELECT * FROM getpassportInfo";
        $result = $conn->query($sql);
        
        if($result->num_rows > 0){
            $tr = "";
            $mn = "";
            $status = "";
            while($row = $result->fetch_assoc()){
                if($row['middleName'] != ""){
                    $mn = " {$row['middleName']}";
                }
                if($row['status'] == "waiting"){
                    $status = "<div class='badge text-bg-primary text-wrap' style='width:6rem;'>Waiting</div>";
                }else if($row['status'] == "approved"){
                    $status = "<div class='badge text-bg-success text-wrap' style='width:6rem;'>Approved</div>";
                }else if($row['status'] == "rejected"){
                    $status = "<div class='badge text-bg-danger text-wrap' style='width:6rem;'>Rejected</div>";
                }else if($row['status'] == "cancelled"){
                    $status = "<div class='badge text-bg-warning text-wrap' style='width:6rem;'>Cancelled</div>";
                }
                $tr .= "<tr class='border p-0' data-aid='{$row['applicationID']}' data-pid='{$row['passportID']}' data-ppn='{$row['passportNumber']}'>
                            <th scope='row' class='ps-5'>{$row['applicationID']}</th>
                            <td>{$row['passportNumber']}</td>
                            <td>{$row['lastName']}, {$row['firstName']} {$mn}</td>
                            <td>{$row['gender']}</td>
                            <td>{$row['nationality']}</td>
                            <td class='text-capitalize'>{$status}</td>
                        </tr>";
            }
            echo $tr;
        }else{
            echo "No Table Record";
        }
    }
    getApplicantInfo();
?>