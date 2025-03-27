<div class="container p-1 w-25">
    <div class="w-100 bg-warning bg-gradient"> 
        <h5 class="text-center py-2">Passports</h5>
    </div>
    <ol id="passportList" class="list-group list-group-flush list-group-numbered hoverable">
        <?php
            include $local_url."/admin/passportInfo/request/getPassportList.php";
        ?>
    </ol>
</div>

<div class="vr"></div>