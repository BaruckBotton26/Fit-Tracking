//
//  FeedbackView.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 13/04/25.
//

import SwiftUI

struct FeedbackView: View {
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack(alignment: .top) {
                    Color.white.ignoresSafeArea()
                    
                    VStack(spacing: 30) {
                        Rectangle()
                            .frame(height: 400)
                            .cornerRadius(12)
                            .foregroundColor(.black)
                        Text("Análisis del ejercicio:")
                            .font(.headline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: .gray.opacity(0.5), radius: 8, x: 4, y: 8)
                                
                            )
                        
                        VStack(alignment: .leading, spacing: 12){
                            Text("Errores detectados:")
                                .font(.headline)
                            Text("🔴 Profundidad Insuficiente")
                            Text("🔴 Rodillas Desalineadas")
                            Text("🟡 Pérdida de Tensión en el Core")
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: .gray.opacity(0.5), radius: 8, x: 4, y: 8)
                        )
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Recomendaciones")
                                    .font(.headline)
                                    .bold()
                                Spacer()
                                Image(systemName: "bolt.fill") // ⚡ ícono de energía
                                    .foregroundColor(Color.yellow)
                                    .font(.title3)
                            }
                            
                            Text("• Baja hasta que las caderas estén por debajo de las rodillas para una activación completa del cuádriceps, isquiotibiales y glúteos. Asegúrate de mantener la espalda recta y el core activado para soportar el peso de manera adecuada.")
                            
                            Text("• Mantén las rodillas en línea con los pies durante todo el movimiento. Imagina que estás empujando el suelo con los pies para mantener las rodillas estables.")
                            
                            Text("• Activa fuertemente tu core durante todo el ejercicio. Piensa en contraer los abdominales como si te fueras a recibir un golpe en el estómago, lo que ayuda a mantener la columna en una posición segura.")
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)
                        )
                        .padding(.horizontal, 0)
                    }
                }
                .padding(.horizontal, 20) // ← Añadimos padding lateral aquí
                .padding(.top)            // Padding superior si lo deseas
            }
        }
    }
}
#Preview {
    FeedbackView()
}
