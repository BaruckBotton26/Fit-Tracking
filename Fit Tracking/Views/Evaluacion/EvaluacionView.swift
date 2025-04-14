    //
    //  EvaluacionView.swift
    //  Fit Tracking
    //
    //  Created by Baruck Botton on 13/04/25.
    //

    import SwiftUI

    struct EvaluacionView: View {
        var body: some View {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    CamaraView()
                        .frame(height: 400)
                        .cornerRadius(12)
                        .clipped()
                    
                    Text("Realizando Análisis en tiempo real...")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)

                    NavigationLink(destination: FeedbackView()) {
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
                                    )                        }

                }
                .padding(.horizontal, 20)
                .padding(.top)
            }
        }
    }

    #Preview {
        EvaluacionView()
    }
