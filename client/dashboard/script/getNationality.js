import { fetchlist, autocomplete, createMap, appendListOptions } from "./module.js";
const baseUrl = window.location.origin
const nFile = `${baseUrl}/visams/client/request/fetchNationality.php`
const nEl = document.getElementById("nationality");
const listContainer_nationality = document.getElementById("listContainer_nationality");

let nationalityList = await fetchlist(nFile);
let map = createMap(nationalityList);
appendListOptions(map, listContainer_nationality);

nEl.addEventListener("input", (e)=>{
    autocomplete(e, map);
})

