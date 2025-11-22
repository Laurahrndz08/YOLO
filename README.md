# YOLO - Combate de papel, tijera y piedra

Modelo YOLOv8 para detección de gestos de piedra, papel y tijera. Este repositorio documenta el proceso de entrenamiento, evaluación y uso del modelo, utilizando un dataset descargado desde Roboflow. El objetivo es asegurar reproducibilidad con un flujo técnico claro.

---

## 1. Descripción general
Este proyecto entrena un modelo YOLOv8 para detectar tres clases correspondientes a los gestos del juego piedra–papel–tijera:

- rock
- paper
- scissors

El modelo fue entrenado en un ambiente con GPU y configuraciones estándar de YOLOv8 para tareas de detección.

---

## 2. Dataset
- Proveedor: Roboflow
- URL: https://universe.roboflow.com/roboflow-58fyf//rock-paper-scissors-sxsw
- Total de imágenes: 3,129
- Formato de anotaciones: YOLO
- Clases etiquetadas:
  - rock
  - paper
  - scissors
- Procedencia: Dataset descargado directamente sin modificaciones adicionales.

---

## 3. Ambiente de entrenamiento
- Plataforma: Google Colab
- Hardware: GPU NVIDIA T4
- Framework: Ultralytics YOLOv8
- Lenguaje: Python 3.x

---

## 4. Configuración del entrenamiento
- Epochs: 30
- Tamaño de imagen: 640
- Aumentación: configuración predeterminada de YOLOv8
- Modelo base: yolov8n.pt

### Comando utilizado
```
rock-paper-scissors-eval/
│
├── models/ # Pesos del modelo (best.pt, last.pt)
├── notebooks/ # Notebooks de entrenamiento
├── src/ # Scripts principales
│ ├── train.py
│ ├── detect.py
│ ├── utils.py
│ └── requirements.txt
├── data.yaml
└── README.md

```

---

## 7. Uso del modelo
### Detección (inferencia)
yolo detect predict model=models/best.pt source="ruta/a/imagen_o_carpeta"


---

## 8. Licencia
Este repositorio puede utilizarse libremente para fines educativos, y evaluación técnica.
