//
//  FahrradView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 09.01.24.
//

import SwiftUI

struct FahrradView: View {
    @State private var isMapViewPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("fahrrad")
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(20)
                    .clipped()
                
                MapButton(action: {
                    self.isMapViewPresented = true
                })
                .sheet(isPresented: $isMapViewPresented) {
                    NavigationView {
                        MapView()
                    }
                    
                }
                
                .padding(50)
                Spacer()
                
            }
            .padding()
            .navigationTitle("Fahrrad")
            .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
        }
    }
    
    
}

#Preview {
    FahrradView()
}
