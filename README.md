# YOLO - Combate de papel, tijera y piedra


Modelo de detección para piedra, papel y tijera basado en **YOLOv8**. Este repositorio presenta el proceso de entrenamiento, evaluación y uso del modelo utilizando un dataset descargado desde Roboflow. La documentación está orientada a reproducibilidad y evaluación técnica del modelo.

## 1. Descripción general

El proyecto tiene como objetivo entrenar un modelo YOLOv8 capaz de identificar tres clases gestuales:

- rock
- paper
- scissors
Con el fin de poder realizar combate entre dos jugadores, obteniendo el resultado final de cual es el ganador y cual fue la razon.

El modelo fue entrenado en un ambiente controlado con GPU T4 y utiliza configuraciones estándar de YOLOv8 para clasificación mediante detección.

## 2. Dataset

- **Proveedor:** Roboflow  
- **URL:** https://universe.roboflow.com/roboflow-58fyf//rock-paper-scissors-sxsw  
- **Cantidad total de imágenes:** 3.129  
- **Clases disponibles:** rock, paper, scissors  
- **Formato:** anotaciones YOLO

El dataset fue descargado directamente y utilizado sin modificaciones adicionales.

## 3. Ambiente de entrenamiento

- Plataforma: Google Colab  
- Hardware: GPU T4  
- Framework: Ultralytics YOLOv8  
- Lenguaje: Python 3.x

## 4. Configuración del entrenamiento

- Epochs: 30  
- Tamaño de imagen: 640  
- Aumentación: configuraciones predeterminadas de YOLOv8  
- Modelo base: yolov8n.pt

**Comando utilizado:**

```bash
yolo detect train \
    data=data.yaml \
    model=yolov8n.pt \
    epochs=30 \
    imgsz=640
```
## 5. Configuración del entrenamiento
Resultados luego del entrenamiento

| Clase    | Imágenes | Instancias | P     | R     | mAP50 | mAP50-95 |
| -------- | -------- | ---------- | ----- | ----- | ----- | -------- |
| all      | 604      | 418        | 0.939 | 0.927 | 0.961 | 0.763    |
| Paper    | 139      | 146        | 0.951 | 0.929 | 0.963 | 0.776    |
| Rock     | 128      | 150        | 0.940 | 0.934 | 0.960 | 0.736    |
| Scissors | 118      | 122        | 0.926 | 0.919 | 0.961 | 0.778    |

