<?php
    $root = $_SERVER["DOCUMENT_ROOT"] . '/TourAndTravel/PPVS';
    include $root.'/admin/connection.php';
    //localhost/TourAndTravel/PPVS/server/documents/Visa-Page-5.drawio.png
    header("Content-Type: application/json");

    if (!empty($_FILES["Input_file_passport"]["tmp_name"])) {
        $targetDir = $root."/server/documents/";
        $fileName = basename($_FILES["Input_file_passport"]["name"]);
        $targetFile = $targetDir . $fileName;
        $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
    
        $allowedTypes = ["jpg", "jpeg", "png", "gif"];
        if (!in_array($imageFileType, $allowedTypes)) {
            echo json_encode(["status" => "error", "message" => "Invalid file type!"]);
            exit;
        }
        if(move_uploaded_file($_FILES["Input_file_passport"]["tmp_name"], $targetFile)){
            $passport_type = $_POST['passport_type'];
            $country_code = $_POST['country_code'];
            $passport_number = $_POST['passport_number'];
            $issued_date = $_POST['issued_date'];
            $expiry_date = $_POST['expiry_date'];
            $lname = $_POST['lname'];
            $fname = $_POST['fname'];
            $mname = $_POST['mname'];
            $nationality = $_POST['nationality'];
            $dateofbirth = $_POST['dateofbirth'];
            $address = $_POST['address'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            $gender = $_POST['gender'];
            $fileName = $_FILES['Input_file_passport']['name'];
            $filePath = $targetFile;

            $insertstmt = $conn->prepare("CALL insertApplication(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            $insertstmt->bind_param(
                "sssssisssssssiss", 
                $fname, 
                $mname, 
                $lname, 
                $dateofbirth, 
                $gender, 
                $nationality, 
                $address, 
                $email, 
                $phone, 
                $fileName, 
                $filePath, 
                $passport_number, 
                $passport_type, 
                $country_code, 
                $issued_date, 
                $expiry_date
            );

            if ($insertstmt->execute()) {
                echo json_encode(["status" => "success", "message" => "File uploaded successfully!", "file_path" => $targetFile]);
            } else {
                echo json_encode(["status" => "error", "message" => "Error saving file!"]);
            }

        } else {
            echo json_encode(["status" => "error", "message" => "Error saving file!"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "No file uploaded!"]);
    }
    file_put_contents("log.txt", print_r($_FILES, true), FILE_APPEND);
    file_put_contents("Upload_Log.txt", print_r($_POST, true), FILE_APPEND);
?>

