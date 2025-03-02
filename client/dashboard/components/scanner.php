<div class="video_container">
    <div class="row mb-3">
        <video id="video" autoplay></video>
    </div>  
    <div class="row ">
        <div class="col-auto flex-fill">
            <button id="startCamera">Start Camera</button>
        </div>
        <div class="col-auto flex-fill">
            <button id="captureBtn">Scan Passport</button>
        </div>
        <div class="col-auto flex-fill">
            <select id="selectCam"></select>
        </div>
        <div class="col-auto flex-fill">
            <button id="stopBtn">Stop</button>
        </div>
    </div>
    
    <canvas id="canvas" style="display: none;"></canvas>
    <pre id="output"></pre>
</div>