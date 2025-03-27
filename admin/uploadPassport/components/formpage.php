<div class="container-sm" style="min-height:50vh; max-width:50rem">
    <div id="formpage">
        <div class="row w-100 d-flex" >
            <div class="col-auto flex-fill p-3">
                <form autocomplete="off" id="passport_form" enctype="multipart/form-data">
                    <div id="page1">
                        <div class="row mb-3">
                            <div class="col-auto flex-fill">
                                <label for="lname" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="lname" placeholder="Last name" required>
                            </div>
                            <div class="col-auto flex-fill">
                                <label for="fname" class="form-label">First Name</label>
                                <input type="text" class="form-control " id="fname" placeholder="First name" required>
                            </div>
                            <div class="col-auto flex-fill">
                                <label for="mname" class="form-label">Middle Name</label>
                                <input type="text" class="form-control" id="mname" placeholder="Middle name">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="flex-fill col-auto">
                                <label for="nationality" class="form-label">Nationality</label>
                                <div class="autocompleteInput">
                                    <input class="form-control" name="nationality" id="nationality" list="listContainer_nationality" data-value="" required/>
                                    <datalist id="listContainer_nationality" class="optionlist" tabindex="0"></datalist>
                                </div>    
                            </div>
                        </div>
                        <div class="row mb-3 gap-3">
                            <div class="flex-fill col-auto">
                                <label for="dateofbirth" class="form-label">Date of Birth</label>
                                <input type="date" class="form-control" id="dateofbirth" required>
                            </div>
                            <div class="flex-fill col-auto">
                                <label class="form-label">Gender</label>
                                <div class="pt-2">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input gender" id="male" type="radio" name="gender" value="male">
                                        <label class="form-check-label" for="male">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input gender" id="female" type="radio" name="gender" value="female">
                                        <label class="form-check-label" for="female">
                                            Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="flex-fill col-auto">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" placeholder="Address" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="flex-fill col-auto">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="flex-fill col-auto">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" placeholder="Phone" required>
                            </div>
                        </div>
                    </div>
                    <div id="page2" style="display:none;">
                        <div class="row mb-3 gap-3">
                            <div class="col-auto flex-fill">
                                <label for="passport_type" class="form-label">Passport Type</label>
                                <select class="form-select" id="passport_type" required>
                                    <option value="">Select Here Passport</option>
                                    <option value="P">Ordinary Passport</option>
                                    <option value="D">Diplomatic Passport</option>
                                    <option value="O">Official Passport</option>
                                    <option value="S">Service Passport</option>
                                </select>
                            </div>
                            <div class="col-auto flex-fill">
                                <label for="country_code" class="form-label">Country Code</label>
                                <div class="autocompleteInput">
                                    <input id="country_code" class="form-control" type="text" list="listContainer_country" data-value="" required/>
                                    <datalist id="listContainer_country" class="optionlist"></datalist>
                                </div>
                            </div>
                            <div class="col-auto flex-fill">
                                <label for="passport_number" class="form-label">Passport Number</label>
                                <input id="passport_number" type="text" class="form-control" placeholder="Passport Number" required>
                            </div>
                        </div>
                        <div class="row mb-3 gap-3">
                            <div class="col-auto flex-fill">
                                <label for="issued_date" class="form-label">Issued Date</label>
                                <input id="issued_date" type="date" class="form-control" required>
                            </div>
                            <div class="col-auto flex-fill">
                                <label for="expiry_date" class="form-label">Expiry Date</label>
                                <input id="expiry_date" type="date" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="Input_file_passport" class="form-label">Supporting Documents</label>
                            <input class="form-control" type="file" id="Input_file_passport" required accept="image/*">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div id="lastpage" style="display:none">
        <div class="row w-100 d-flex align-items-center justify-content-center">
            <div class="col-auto p-3 text-center d-flex flex-column justify-content-center">
                <div class="header">
                    <h1>Application Status</h1>
                </div>
                <div class="content">
                    <div class="container">
                        <div class="icon" style="font-size: 50px;">✔️</div>
                        <div class="message">The document was submitted and is waiting for approval. We will notify you once done.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
