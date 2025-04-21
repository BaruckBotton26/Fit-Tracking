//
//  PoseOverlayView.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 20/04/25.
//
import SwiftUI

struct PoseOverlayView: View {
    var keypoints: [[String: Float]]
    let connections: [(Int, Int)] = [
            (11, 13), (13, 15),
            (12, 14), (14, 16),
            (11, 12),
            (23, 24),
            (11, 23), (12, 24),
            (23, 25), (25, 27),
            (24, 26), (26, 28)
        ]
    var body: some View {
        Canvas { context, size in
            for (startIdx, endIdx) in connections {
                            if startIdx < keypoints.count, endIdx < keypoints.count {
                                if let startX = keypoints[startIdx]["x"], let startY = keypoints[startIdx]["y"],
                                   let endX = keypoints[endIdx]["x"], let endY = keypoints[endIdx]["y"] {
                                    
                                    let startPoint = CGPoint(x: CGFloat(startX) * size.width, y: CGFloat(startY) * size.height)
                                    let endPoint = CGPoint(x: CGFloat(endX) * size.width, y: CGFloat(endY) * size.height)
                                    
                                    var path = Path()
                                    path.move(to: startPoint)
                                    path.addLine(to: endPoint)
                                    
                                    context.stroke(path, with: .color(.blue), lineWidth: 2)
                                }
                            }
                        }
            for keypoint in keypoints {
                if let xValue = keypoint["x"], let yValue = keypoint["y"] {
                    let x = CGFloat(xValue) * size.width
                    let y = CGFloat(yValue) * size.height
                    
                    // 🛠️ Dibujamos un circulito en cada keypoint
                    let circle = Path(ellipseIn: CGRect(x: x - 3, y: y - 3, width: 6, height: 6))
                    context.fill(circle, with: .color(.red))
                }
            }
        }
        .allowsHitTesting(false) 
        .frame(maxWidth: .infinity)
        .frame(height: 400)
    }
}
