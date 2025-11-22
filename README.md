# YOLO - Combate de papel, tijera y piedra


# rock-paper-scissors-eval  
Modelo de detección para gestos de **piedra, papel y tijera** utilizando **YOLOv8**.  
Este repositorio contiene el código, pesos, scripts, API y proceso completo de entrenamiento basado en el dataset descargado desde Roboflow.  
Toda la documentación está orientada a reproducibilidad técnica.

---

## 1. Descripción general  
El objetivo del proyecto es entrenar un modelo YOLOv8 capaz de detectar las siguientes clases:

- **rock**  
- **paper**  
- **scissors**

El modelo fue entrenado con GPU T4 en Google Colab utilizando el modelo base **yolov8n.pt**.

---

## 2. Dataset  
- **Proveedor:** Roboflow  
- **URL:** https://universe.roboflow.com/roboflow-58fyf//rock-paper-scissors-sxsw  
- **Total de imágenes:** 3,129  
- **Clases:** rock, paper, scissors  
- **Formato:** YOLO  
- **Obtención:** Descargado directamente desde Roboflow sin modificaciones adicionales.

Código real usado para descarga:

```python
from roboflow import Roboflow
rf = Roboflow(api_key="TU_API_KEY")
project = rf.workspace("roboflow-58fyf").project("rock-paper-scissors-sxsw")
dataset = project.version(3).download("yolov8")
```
## 5. Configuración del entrenamiento
Resultados luego del entrenamiento

| Clase    | Imágenes | Instancias | P     | R     | mAP50 | mAP50-95 |
| -------- | -------- | ---------- | ----- | ----- | ----- | -------- |
| all      | 604      | 418        | 0.939 | 0.927 | 0.961 | 0.763    |
| Paper    | 139      | 146        | 0.951 | 0.929 | 0.963 | 0.776    |
| Rock     | 128      | 150        | 0.940 | 0.934 | 0.960 | 0.736    |
| Scissors | 118      | 122        | 0.926 | 0.919 | 0.961 | 0.778    |

