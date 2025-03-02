export function createMap(obj){
    const map = new Map();
    
    for(const [key, value] of Object.entries(obj)){
        map.set(Number(key), value);
    }
    return map;
}

export async function fetchlist(file){
    const result = await fetch(file);
    const items = await result.json();

    return items;
}

export async function submit(object, targetFile){
    const response = await fetch(targetFile, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(object)
    })
    const data =  await response.json();
    return data;
}

export function appendListOptions(map, listContainer){
    map.forEach((value, key)=>{
        const option = document.createElement("option");
        option.dataset.value = key;
        option.textContent = value;
        listContainer.appendChild(option);
    })
}

export function autocomplete(input, map){
    let characters = input.target.value;
    let list = Array.from(map.values());
    const isValid = list.some(e=> e.startsWith(characters));

    function getByValue(map, targetValue){
        for(let [key, value] of map.entries()){
            if(value === targetValue){
                return key;
            }
        }
    }
    if(isValid){
        let foundKey = getByValue(map, input.target.value);
        if(foundKey !== undefined){
            input.target.dataset.value = foundKey;
            console.log(foundKey);
        }
    }else{
        input.target.value = characters.slice(0, -1);
    }
}