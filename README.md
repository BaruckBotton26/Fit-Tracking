# Fit Tracking 📱🏋️‍♂️

**Fit Tracking** es una aplicación móvil desarrollada en SwiftUI que permite analizar la ejecución de ejercicios de fuerza en tiempo real utilizando la cámara del dispositivo y tecnologías de visión por computadora como MediaPipe.

---

## 🚀 Características

- 📷 **Detección en vivo con cámara integrada**
- 💪 **Análisis biomecánico de ejercicios como sentadillas y peso muerto**
- 🧠 **Retroalimentación basada en IA**
- 🔄 **Interfaz de evaluación con flujo entre vistas**
- 📊 **Sección de feedback con errores detectados**
- 🧩 **Arquitectura MVVM modular y escalable**

---

## 🧱 Estructura del proyecto

```
FitTracking/
├── Views/
│   ├── InicioView.swift
│   ├── EvaluacionView.swift
│   └── FeedbackView.swift
├── Components/
│   └── CameraView.swift
├── UIKitControllers/
│   └── CameraPreviewViewController.swift
├── ViewModels/
│   └── EvaluacionViewModel.swift  // opcional
├── Assets.xcassets
├── Info.plist
└── Fit_TrackingApp.swift
```
## ⚙️ Tecnologías usadas

- **SwiftUI**
- **AVFoundation** (para cámara en vivo)
- **UIViewControllerRepresentable**
- **MediaPipe (externo o por backend)**
- **Git & GitHub**

## 🧪 Estado actual

- ✅ Vistas principales implementadas  
- ✅ Cámara integrada en EvaluacionView  
- 🟡 Feedback dinámico aún en desarrollo  
- 🟡 Conexión a backend con MediaPipe pendiente
