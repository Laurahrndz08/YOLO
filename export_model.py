from ultralytics import YOLO

def export():
    model = YOLO("models/best.pt")

    model.export(format="onnx")
    model.export(format="engine")
    model.export(format="torchscript")

if __name__ == "__main__":
    export()
