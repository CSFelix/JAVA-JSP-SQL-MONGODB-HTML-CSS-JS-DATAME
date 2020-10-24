// objeto que gerencia a câmera do usuário e exibe a imagem do mesmo
const cam = document.getElementById("cam");

// dados para comparação final
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const nickname_usuario = urlParams.get("label");
const acuracia_meta = 0.01;

// resultados obtidos pela análise
var acuracia_final = 0;
var label_final;
var dados = [,];

alert("A página pode demorar um pouco para carregar, espere até ela desenhar pontos em seu rosto.");
alert("Ao desenhar os pontos, nossa Assistente Virtual demorará certa de 60 segundos para analisar seu rosto."
    + " Passado o tempo, você será redirecionado para o painel de notícias automaticamente.");

/* reconhecimento e carregamento da câmera do usuário */
const startVideo = () => {
    // lista dos dispositivos de entrada\saída
    navigator.mediaDevices.enumerateDevices()
    .then(devices => {
    
        // checar se encontrou dispositivos
        if (Array.isArray(devices)) {
            // filtragem pelo dispositivo de vídeo
            devices.forEach(device => {
                if (device.kind === 'videoinput') {
                    if (device.label.includes('')) {
                        
                        // acesso à câmera
                        navigator.getUserMedia(
                            { video: { deviceId: device.deviceId }},
                            stream => cam.srcObject = stream,
                            error => console.error(error)
                        );
                    }
                }
            });
        }
    });
}

/* carregamento da label para reconhecimento */
const loadLabels = () => {
    const labels = [nickname_usuario];
    return Promise.all(labels.map(async label => {
        const descriptions = [];           
                                          
        for (let i = 1; i <= 1; i++) {     
            const img = await faceapi.fetchImage(`/assets/imagensReconhecimento/${nickname_usuario}.png`);
        

            const detections = await faceapi
                .detectSingleFace(img)
                .withFaceLandmarks()
                .withFaceDescriptor()

            descriptions.push(detections.descriptor);
        }

        return new faceapi.LabeledFaceDescriptors(label, descriptions);
    }));
}

/* modelos da face api carregadas para reconheceram e detectarem faces */
Promise.all([
    // detecta faces\rostos
    faceapi.nets.tinyFaceDetector.loadFromUri("/assets/lib/face-api/models"),

    // detecta os traços dos rostos (os 128 pontos)
    faceapi.nets.faceLandmark68Net.loadFromUri("/assets/lib/face-api/models"),

    // reconhece faces\rostos
    faceapi.nets.faceRecognitionNet.loadFromUri("/assets/lib/face-api/models"),

    // utilizada em segundo plano para detecção do rosto
    faceapi.nets.ssdMobilenetv1.loadFromUri("/assets/lib/face-api/models")
]).then(startVideo);


/* exibição do vídeo na página e toda a lógica da detecção\reconhecimento da face */
cam.addEventListener('play', async () => {
    // desenho do canvas com atualização dinâmica das imagens
    const canvas = faceapi.createCanvasFromMedia(cam);
    const canvasSize = { width: cam.width, height: cam.height }
    const labels = await loadLabels();
    faceapi.matchDimensions(canvas, canvasSize);
    document.body.appendChild(canvas);

    setInterval(async () => {
        
        const detections = await faceapi
            .detectAllFaces(cam, new faceapi.TinyFaceDetectorOptions())
            .withFaceLandmarks()
            .withFaceDescriptors();
        const resizedDetections = faceapi.resizeResults(detections, canvasSize)
        const faceMatcher = new faceapi.FaceMatcher(labels, acuracia_meta)
        const results = resizedDetections.map(d => faceMatcher.findBestMatch(d.descriptor))

        // reset do canvas
        canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height);
        
        // detecção da face
        faceapi.draw.drawDetections(canvas, resizedDetections);

        // detecção dos pontos do rosto
        faceapi.draw.drawFaceLandmarks(canvas, resizedDetections);

        // reconhecimento de faces
        results.forEach((result, index) => {
            const box = resizedDetections[index].detection.box;
            const { label, distance } = result;
            new faceapi.draw.DrawTextField([
                //`${label} (${parseInt(distance * 100, 10)})`
                `${nickname_usuario} (${parseInt(distance * 100, 10)})`
            ], box.bottomRight).draw(canvas);

            //dados[0] = label;
            dados[0] = nickname_usuario;
            dados[1] = distance;
        });

        distancia_obtida = parseInt(dados[1] * 100, 10);
        label_final = dados[0];
        acuracia_final = distancia_obtida > acuracia_final ?
                            distancia_obtida
                            : acuracia_final;
    }, 100);

    setTimeout(function(){ 
        // reconhecido
        if (label_final == nickname_usuario && acuracia_final >= parseInt(acuracia_meta * 100, 10)) {
            window.location.replace("http://localhost:8080/DataMe/painel.jsp?tipo_acesso=1");
        }

        // não-reconhecido
        else { 
            window.location.replace("http://localhost:8080/DataMe/painel.jsp?tipo_acesso=0");
        }
    }, 30000);
});