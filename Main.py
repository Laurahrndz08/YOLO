from fastapi import FastAPI, UploadFile, File
from detection import run_inference

app = FastAPI(title="Rock-Paper-Scissors YOLO API")

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    contents = await file.read()
    result = run_inference(contents)
    return {"prediction": result}
