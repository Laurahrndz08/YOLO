import cv2
import numpy as np
from ultralytics import YOLO
from utils import load_image_from_bytes

model = YOLO("models/best.pt")

def run_inference(image_bytes):
    img = load_image_from_bytes(image_bytes)
    results = model(img)[0]

    detections = []
    for box in results.boxes:
        cls = int(box.cls[0])
        conf = float(box.conf[0])
        detections.append({
            "class": model.names[cls],
            "confidence": conf
        })

    return detections
