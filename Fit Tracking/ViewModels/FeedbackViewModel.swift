import Foundation
import SwiftUI
import AVFoundation

class FeedbackViewModel: ObservableObject {
    @Published var player: AVPlayer?
    @Published var keypoints: [[String: Float]] = []
    
    private var poseAnalyzer = PoseAnalyzer()
    
    func configurePlayer(with url: URL) {
        player = AVPlayer(url: url)
    }
    
     func startFrameProcessing(with player: AVPlayer?) {
     guard let player = player else { return }
     
     var lastTimestamp: Int64 = -1 // 🚀 Guarda el último timestamp
     
     player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: 600), queue: .main) { [weak self] time in
     guard let currentItem = player.currentItem else { return }
     let generator = AVAssetImageGenerator(asset: currentItem.asset)
     generator.appliesPreferredTrackTransform = true
     
     generator.generateCGImageAsynchronously(for: time) { cgImage, actualTime, error in
     if let cgImage = cgImage {
     print("🖼️ Frame capturado correctamente")
     if let pixelBuffer = cgImage.toPixelBuffer() {
     let timestampMs = Int64(Date().timeIntervalSince1970 * 1000)
     
     // 🚨 Si el timestamp no es creciente, ignora
     if timestampMs <= lastTimestamp {
     print("⚠️ Frame ignorado por timestamp no creciente")
     return
     }
     
     lastTimestamp = timestampMs // Actualiza último timestamp
     
     if let newKeypoints = self?.poseAnalyzer.extractPoseLandmark(from: pixelBuffer, at: timestampMs) {
     DispatchQueue.main.async {
     self?.keypoints = newKeypoints
     print("🟥 Frame procesado: \(newKeypoints.count) keypoints detectados")
     }
     } else {
     print("🟠 No se detectaron keypoints en este frame")
     }
     } else {
     print("🟡 No se pudo convertir CGImage a PixelBuffer")
     }
     } else {
     print("No se pudo capturar el frame")
     }
     }
     }
     }
     }
     
