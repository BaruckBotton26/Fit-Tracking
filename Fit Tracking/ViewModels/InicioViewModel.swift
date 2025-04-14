//
//  InicioViewModel.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 14/04/25.
//

import Foundation
import AVFoundation

class InicioViewModel:ObservableObject{
    @Published var puedeNavegar = false
    
    func solicitarPermisoCamara(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            puedeNavegar = true
            AVCaptureDevice.requestAccess(for: .video) { (acceso) in
                DispatchQueue.main.async {
                    self.puedeNavegar = acceso
                }
            }
        default:
            puedeNavegar = false
        }
    }
}
