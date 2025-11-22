
FROM python:3.10-slim

# Evitar preguntas interactivas
ENV DEBIAN_FRONTEND=noninteractive

# Actualización + dependencias básicas
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de la app
WORKDIR /app

# Copiar requirements 
COPY requirements.txt .

fastapi
uvicorn
ultralytics
opencv-python-headless
pydantic
python-multipart


# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar la API y el modelo
COPY . .

from fastapi import FastAPI, UploadFile, File
from ultralytics import YOLO
import cv2
import numpy as np

app = FastAPI()
model = YOLO("best.pt")

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    image_bytes = await file.read()
    nparr = np.frombuffer(image_bytes, np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

    results = model(img)[0]

    detections = []
    for box in results.boxes:
        detections.append({
            "class": model.names[int(box.cls)],
            "confidence": float(box.conf),
            "bbox": box.xyxy[0].tolist()
        })

    return {"detections": detections}


# Exponer puerto de FastAPI
EXPOSE 8000

# Comando de arranque de la API
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "8000"]
