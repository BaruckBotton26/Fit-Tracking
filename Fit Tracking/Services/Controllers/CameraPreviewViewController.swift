//
//  CameraPreviewViewController.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 14/04/25.
//

import AVFoundation
import UIKit

class CameraPreviewViewController: UIViewController {
    private let CaptureSession = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let camera = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: camera),
              CaptureSession.canAddInput(input) else {
            return
        }
        
        CaptureSession.addInput(input)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: CaptureSession)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
        
        CaptureSession.startRunning()
    }
}
