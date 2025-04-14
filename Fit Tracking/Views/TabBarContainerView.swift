//
//  TabBarContainerView.swift
//  Fit Tracking
//
//  Created by Baruck Botton on 13/04/25.
//

import SwiftUI

struct TabBarContainerView: View {
    var body: some View {
        TabView{
            InicioView()
                .tabItem{
                    Image(systemName: "house")
                    Text("inicio")
                }
            EvaluacionView()
                .tabItem{
                    Image(systemName: "video")
                    Text("evaluacion")
                }
            FeedbackView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("feedback")
                }
        }
    }
}

#Preview {
    TabBarContainerView()
}
