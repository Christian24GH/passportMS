const video = document.getElementById('video');

async function capture(){
    const ctx = canvas.getContext('2d');
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

    const imageData = canvas.toDataURL('image/png');

    Tesseract.recognize(imageData, 'eng',{
        tessedit_char_whitelist: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789<'
    }).then(({ data: { text } }) => {
        output.textContent = 'Extracted MRZ:\n' + text;
    })
}
captureBtn.addEventListener("click", capture)