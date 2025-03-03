import { submit, Toast } from "./module.js";
const form = document.getElementById("passport_form");
document.getElementById("submit_btn").addEventListener("click",()=>{
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
        gender: null,
        set setGender(gender){
            this.gender = gender;
        }
    }

    try{
        Data["setGender"] = form.querySelector('input[name="gender"]:checked').value;
    }catch(e){
        console.log("Undefined Gender");
    }

    function isEmpty()
    {
        for(let key in Data)
        {
            if(Data[key] === null || Data[key] === "")
            {
                return true
            }
        }
        return false;
    }

    if(!isEmpty())
    {
        const baseUrl = window.location.origin + "/VisaMS/client/request/dbInsert.php";
        const $response = submit(Data, baseUrl);
        $response.then((e)=>{
            console.log(e);
        })
        
        Toast("The data has been saved successfully.");
    }
    else
    {
        Toast("Please fill all the required fields!");
    }
    

    console.log(Data);
})

