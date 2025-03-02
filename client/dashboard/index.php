<?php
    $root = $_SERVER["DOCUMENT_ROOT"] . '/VisaMS';
    include $root.'/client/connection.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passport Scanner</title>
    <link rel="stylesheet" href="./index.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="min-vw-100 overflow-x-hidden">

    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header">
                <img class="rounded me-2" alt="Logo">
                <strong class="me-auto">Bootstrap</strong>
                <small>11 mins ago</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Hello, world! This is a toast message.
            </div>
        </div>
    </div>


    <div class="container-sm" style="width:fit-content">
        <div class="row w-100 d-flex">
            <div class="col-auto flex-fill p-3">
                <?php
                    include $root.'/client/dashboard/components/form.php';
                ?>
            </div>
        </div>
    </div>
</body>

<script type="module" src="./script/module.js"></script>
<script type="module" src="./script/getNationality.js"></script>
<script type="module" src="./script/getCountry.js"></script>
<script type="module" src="./script/submit.js"></script>
</html>