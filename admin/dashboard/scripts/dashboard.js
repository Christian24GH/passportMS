import {fetchData, postData} from "../../global/script/request.module.js";
const applicantTotal = document.getElementById("applicantTotal");
const waitingApplicant = document.getElementById("waitingApplicant");

async function getData(){
    const file = `${window.location.origin}/dashboard/TourAndTravel/PPVS/admin/dashboard/request/getAnalytics.php`;
    const data = await fetchData(file);
    applicantTotal.innerText = data[0]["Total"];
    waitingApplicant.innerText = data[0]["Waiting"];
};
getData();