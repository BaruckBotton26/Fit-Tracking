//
//  CamaraView.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 14/04/25.
//

import SwiftUI

struct CamaraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraPreviewViewController{
        return CameraPreviewViewController()
    }
    func updateUIViewController(_ uiViewController: CameraPreviewViewController, context: Context) {}
    }


