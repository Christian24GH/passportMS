const video = document.getElementById('video');
const canvas = document.getElementById('canvas');
const output = document.getElementById('output');
const captureBtn = document.getElementById('captureBtn');
const startCamera = document.getElementById('startCamera');
const stopBtn = document.getElementById("stopBtn");
const selectCam = document.getElementById("selectCam");

async function onInit(){
    video.muted = true
    let deviceId = selectCam.value
    await onStart(deviceId)
}

async function onStart(deviceId){
    try{
        let config = {
            video: {deviceId: deviceId, height: 200, width: 250},
            audio: false
        }
        stream = await navigator.mediaDevices.getUserMedia(config)
        video.srcObject = stream
    }catch(error){
        console.error('Camera access error:', error)
    }
}
function stopCamera(){
    if (stream) {
        let tracks = stream.getTracks();
        tracks.forEach(track => track.stop()); 
    }
    video.srcObject = null
}

function enumerateDevices(){
    selectCam.innerHTML = ""
    navigator.mediaDevices.enumerateDevices()
    .then(devices=>{
        devices.forEach(device=>{
            if(device.kind === "videoinput"){
                let option = document.createElement("option")
                option.value = device.deviceId
                option.innerHTML = device.label
                selectCam.appendChild(option)
            }
        })
    })
}

startCamera.addEventListener("click", onInit)
selectCam.addEventListener("change", onInit)
stopBtn.addEventListener("click", stopCamera)

enumerateDevices();