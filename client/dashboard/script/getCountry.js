import { fetchlist, autocomplete, createMap, appendListOptions } from "./module.js";
const baseUrl = window.location.origin
const cFile = `${baseUrl}/visams/client/request/fetchCountryList.php`
const cEl = document.getElementById("country_code");
const country_listcon = document.getElementById("listContainer_country");

let countryList = await fetchlist(cFile);
let map = createMap(countryList);
appendListOptions(map, country_listcon);

cEl.addEventListener("input", (e)=>{
    autocomplete(e, map);
})
