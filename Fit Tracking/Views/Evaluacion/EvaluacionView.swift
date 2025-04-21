    //
    //  EvaluacionView.swift
    //  Fit Tracking
    //
    //  Created by Baruck Botton on 13/04/25.
    //

import SwiftUI

struct EvaluacionView: View {
    @State private var cameraController: CameraPreviewViewController?
    @State private var navigateToFeedback = false
    @State private var recordedVideoURL: URL?

    var body: some View {
        NavigationStack { // ✅ Asegúrate de envolver todo en NavigationStack
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    CamaraView(
                        onStart: { controller in
                            self.cameraController = controller
                        },
                        onVideoSaved: { videoURL in
                            self.recordedVideoURL = videoURL
                            self.navigateToFeedback = true  // 🔥 Aquí sí navegas cuando guardas
                        }
                    )
                    .frame(height: 400)
                    .cornerRadius(12)
                    .clipped()
                    
                    Text("Realizando Análisis en tiempo real...")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Button(action: {
                        cameraController?.startRecording()
                    }) {
                        Text("Iniciar Grabación")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        cameraController?.stopRecording()
                        // 🔥 Aquí solo detienes grabación
                    }) {
                        HStack(spacing: 30) {
                            Image(systemName: "doc.text")
                                .font(.system(size: 28))
                            
                            Text("Terminar\nEvaluación")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: 180)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top)
            }
            .navigationDestination(isPresented: $navigateToFeedback) {
                FeedbackView(videoURL: recordedVideoURL ?? URL(fileURLWithPath: ""))
            }
        }
    }
}

#Preview {
    EvaluacionView()
}
