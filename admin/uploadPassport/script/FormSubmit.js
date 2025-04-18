import { Toast } from "./Form.module.js";
const file = `${window.location.origin}/dashboard/TourAndTravel/PPVS/admin/uploadPassport/request/uploadData.php`;

async function submitForm(data) {
    const formData = new FormData();
    for (let key in data) {
        if (data[key] !== null) {
            formData.append(key, data[key]);
        }
    }
    
    const response = await fetch(file, {
        method: "POST",
        body: formData
    })
    
    
    const json = await response.json();
    if(json.status === "success")
    {
        Toast("Application submitted successfully!");
        return true;
    }
    else
    {
        Toast("An error occured while submitting the application!");
        return false;
    }
}
export async function validateForm(form){
    const Data = {
        passport_type: form.querySelector("#passport_type").value ? form.querySelector("#passport_type").value : null,
        country_code: form.querySelector("#country_code").dataset.value ? form.querySelector("#country_code").dataset.value : null, //dataset
        passport_number: form.querySelector("#passport_number").value ?  form.querySelector("#passport_number").value : null,
        issued_date: form.querySelector("#issued_date").value ? form.querySelector("#issued_date").value : null,
        expiry_date: form.querySelector("#expiry_date").value ? form.querySelector("#expiry_date").value : null,
        lname: form.querySelector("#lname").value ? form.querySelector("#lname").value : null,
        fname: form.querySelector("#fname").value ? form.querySelector("#fname").value : null,
        mname: form.querySelector("#mname").value ? form.querySelector("#mname").value : null,
        nationality: form.querySelector("#nationality").dataset.value ? form.querySelector("#nationality").dataset.value : null, //dataset
        dateofbirth: form.querySelector("#dateofbirth").value ? form.querySelector("#dateofbirth").value : null,
        address: form.querySelector("#address").value ? form.querySelector("#address").value : null,
        email: form.querySelector("#email").value ? form.querySelector("#email").value : null,
        phone: form.querySelector("#phone").value ? form.querySelector("#phone").value : null,
        gender: form.querySelector('input[name="gender"]:checked')?.value || null,
        Input_file_passport: form.querySelector("#Input_file_passport").files[0] ? form.querySelector("#Input_file_passport").files[0] : null,
    }

    function isEmpty()
    {
        for (let key in Data) {
            if (Data[key] === null || Data[key] === "") {
                console.log(`Missing: ${key}`);
                return true;
            }
        }
        return false;
    }
    if(!isEmpty())
    {   
        return await submitForm(Data);
    }
    else
    {
        Toast("Please fill all the required fields!");
        return false;
    }
}