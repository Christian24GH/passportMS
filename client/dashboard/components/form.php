<form autocomplete="off" id="passport_form" method="post">
    <div class="row mb-3 gap-3">
        <div class="col-auto flex-fill">
            <label for="passport_type" class="form-label">Passport Type</label>
            <select class="form-select" id="passport_type">
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
                <input id="country_code" class="form-control" type="text" list="listContainer_country" data-value=""/>
                <datalist id="listContainer_country" class="optionlist"></datalist>
            </div>
        </div>
        <div class="col-auto flex-fill">
            <label for="passport_number" class="form-label">Passport Number</label>
            <input id="passport_number" type="text" class="form-control" placeholder="Passport Number">
        </div>
    </div>
    <div class="row mb-3 gap-3">
        <div class="col-auto flex-fill">
            <label for="issued_date" class="form-label">Issued Date</label>
            <input id="issued_date" type="date" class="form-control">
        </div>
        <div class="col-auto flex-fill">
            <label for="expiry_date" class="form-label">Expiry Date</label>
            <input id="expiry_date" type="date" class="form-control">
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-auto flex-fill">
            <label for="lname" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lname" placeholder="Last name">
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-auto flex-fill">
            <label for="fname" class="form-label">First Name</label>
            <input type="text" class="form-control " id="fname" placeholder="First name">
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-auto flex-fill">
            <label for="mname" class="form-label">Middle Name</label>
            <input type="text" class="form-control" id="mname" placeholder="Middle name">
        </div>
    </div>
    <div class="row mb-3">
        <div class="flex-fill col-auto">
            <label for="nationality" class="form-label">Nationality</label>
            <div class="autocompleteInput">
                <input class="form-control" name="nationality" id="nationality" list="listContainer_nationality" data-value=""/>
                <datalist id="listContainer_nationality" class="optionlist" tabindex="0"></datalist>
            </div>
            
        </div>
    </div>
    <div class="row mb-3 gap-3">
        <div class="flex-fill col-auto">
            <label for="dateofbirth" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" id="dateofbirth">
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
</form>
<hr>
<div class="container d-flex justify-content-center mt-5">
    <button id="submit_btn" class="btn btn-primary w-25">Submit</button>
</div>