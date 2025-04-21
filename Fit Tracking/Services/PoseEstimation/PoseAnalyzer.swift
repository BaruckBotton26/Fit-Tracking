//
//  PoseAnalyzer.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 20/04/25.
//

import Foundation
import MediaPipeTasksVision

class PoseAnalyzer {
    private var poseLandmarker: PoseLandmarker?
    
    init(){
        do{
            guard let modelPath = Bundle.main.path(forResource: "pose_landmarker_lite", ofType: "task") else {
                fatalError("No se encontró el archivo pose_landmarker_lite.task en el bundle")
            }
            var options = PoseLandmarkerOptions()
            options.baseOptions.modelAssetPath = modelPath
            options.runningMode = .video
            options.minPoseDetectionConfidence = 0.5
            options.minPosePresenceConfidence = 0.5
            options.minTrackingConfidence = 0.6
            options.shouldOutputSegmentationMasks = false
            options.numPoses = 1
            
            poseLandmarker = try PoseLandmarker(options: options)
            } catch {
                print("Error al inicializar PoseLandmarker: \(error)")
        }
    }
    
    func extractPoseLandmark(from pixelBuffer:CVPixelBuffer, at timestamp: Int64) -> [[String: Float]]? {
        guard let poseLandmarker = poseLandmarker else { return [] }
        
        do {
            let mpImage = try MPImage(pixelBuffer: pixelBuffer)
            let result = try poseLandmarker.detect(videoFrame: mpImage, timestampInMilliseconds: Int(timestamp))
            if let poseLandmarks = result.landmarks.first {
                var keypoints: [[String: Float]] = []
                
                for landmark in poseLandmarks {
                    keypoints.append([
                        "x": landmark.x,
                        "y": landmark.y,
                        "z": landmark.z,
                        "visibility": landmark.visibility?.floatValue ?? 0.0
                    ])
                }
                return keypoints
            }else{
                return []
            }
        }catch {
            print("Error al detectar poses: \(error)")
            return []
        }
    }
    }

