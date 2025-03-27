<div id="left_nav">
    <div class="container d-flex flex-column gap-1">
        <div class="menu-header d-flex justify-content-between w-100 py-2">
            <h2>BRAND</h2>
            <div class="ratio ratio-1x1 me-2 " style="width:3rem;" >
                <img id="closeBtn" src="<?php echo $server_url?>/client/global/icons/burger-menu.svg" class="h-100" alt="">
            </div>
        </div>
        <div class="w-100 border-top pt-4 px-2">
            <h6>Admin</h6>
            <div class="list-group list-group-flush ps-2 hoverable">
                <a href="<?php echo "$server_url/admin/dashboard/index.php"?>" class="list-group-item" >Dashboard</a>
            </div>
        </div>
        <div class="w-100 border-top py-4 px-2">
            <h6>Module List</h6>
            <div class="w-100 border-top">
                <div class="accordion accordion-flush">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne">
                                Passport Management
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
                            <div class="list-group list-group-flush ps-2 hoverable">
                                <a href="<?php echo "$server_url/admin/passportInfo/index.php"?>" class="list-group-item" >Passport Information</a>
                            </div>
                            <div class="list-group list-group-flush ps-2 hoverable">
                                <a href="<?php echo "$server_url/admin/uploadPassport/index.php"?>" class="list-group-item" >Upload Passport</a>
                            </div>
                            <div class="list-group list-group-flush ps-2 hoverable">
                                <a href="<?php echo "$server_url/admin/apptrack/index.php"?>" class="list-group-item" >Passport Tracking</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>