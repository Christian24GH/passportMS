import { validateForm } from "./FormSubmit.js";
const form = document.getElementById("passport_form");
const formpage = document.getElementById("formpage");
const p1 = document.getElementById("page1");
const p2 = document.getElementById("page2");
const lastpage = document.getElementById("lastpage");
const progress_bar = document.getElementById("progress-bar");
const next_btn = document.getElementById("next_btn");
const prev_btn = document.getElementById("prev_btn");
const submit_btn = document.getElementById("submit_btn");
const progress_bar_container = document.getElementById("progress-bar-container");
const formButtons = document.getElementById("formButtons");
const okayBtn = document.getElementById("okay_btn");

let currentPage = 1;

function onPageChange(state){
    //prev
    if(state === "prev" && currentPage > 1){
        currentPage = currentPage - 1;
    }
    //next
    if(state === "next" && currentPage < 3){
        currentPage = currentPage + 1;
    }
    displayPage(currentPage);
}

function displayPage(pageNumber){
    switch(pageNumber){
        case 1:
            onPage1();
            break;
        case 2:
            onPage2();
            break;
    }
}

function onPage1(){
    formpage.style.display = "block";
    p1.style.display = "block";
    p2.style.display = "none";
    lastpage.style.display = "block !important";
    document.getElementById("prev_btn").disabled = true;
    progress_bar.style.width = "0%";
    progress_bar_container.querySelector("#progress_bar_btn2").classList.remove("btn-primary");
    progress_bar_container.querySelector("#progress_bar_btn2").classList.add("btn-secondary");
    next_btn.style.display = "block";
    submit_btn.style.display = "none";
}

function onPage2(){
    formpage.style.display = "block";
    p2.style.display = "block";
    p1.style.display = "none";
    lastpage.style.display = "none";
    document.getElementById("prev_btn").disabled = false;
    progress_bar.style.width = "50%";
    progress_bar_container.querySelector("#progress_bar_btn2").classList.remove("btn-secondary");
    progress_bar_container.querySelector("#progress_bar_btn2").classList.add("btn-primary");
    progress_bar_container.querySelector("#progress_bar_btn3").classList.remove("btn-primary");
    progress_bar_container.querySelector("#progress_bar_btn3").classList.add("btn-secondary");
    next_btn.style.display = "none";
    submit_btn.style.display = "block";
}

function onLastPage(){
    lastpage.style.display = "block";
    formpage.style.display = "none";
    progress_bar.style.width = "100%";
    progress_bar_container.querySelector("#progress_bar_btn3").classList.remove("btn-secondary");
    progress_bar_container.querySelector("#progress_bar_btn3").classList.add("btn-primary");
    prev_btn.style.display = "none";
    formButtons.classList.remove("justify-content-evenly");
    formButtons.classList.add("justify-content-center");
    submit_btn.style.display = "none";
    okayBtn.style.display = "block";
}
function onOkay(){
    window.location.href = `${window.location.origin}/dashboard/TourAndTravel/PPVS/admin/dashboard/index.php `;
}
async function onSubmit(){
    let result = await validateForm(form);
    if(result === true){
        onLastPage();
    }
}

next_btn.addEventListener("click", ()=>onPageChange("next"));
prev_btn.addEventListener("click",  ()=>onPageChange("prev"));
okayBtn.addEventListener("click", onOkay);
form.addEventListener("submit", (e)=>{
    e.preventDefault();
    onSubmit();
});
submit_btn.addEventListener("click", function(event) {
    event.preventDefault();  // Extra safety if needed.
    form.dispatchEvent(new Event("submit"));
});

