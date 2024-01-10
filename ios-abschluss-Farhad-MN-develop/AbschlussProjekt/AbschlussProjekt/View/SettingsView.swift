//
//  SettingsView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 12.12.23.
//

import SwiftUI

struct SettingsView: View {
    

    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    ForEach(account, id: \.self) {
                        Text($0)
                    }
                }  header: {
                    Text("Account")
                }
                Section(header: Text("deviceConnections")) {
                    ForEach(deviceConnections, id: \.self) {
                        Text($0)
                    }
                }
                
            }
            .navigationTitle("Setting")
            .toolbar {
                Button(action: dismissView) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                }
            }
            
        }
        
    }
    
    // MARK: - Variables
    @Binding var sheet: Sheet?
    
    private func dismissView() {
        sheet = nil
    }
    let account = ["Mitteilungen", "Profil-Infos", "Privatsphäre", "App-Einstellungen"]
    
    let deviceConnections = ["Apple Health", "Bluetooth Connect"]
    
}

#Preview {
    SettingsView(sheet: .constant(nil))
}
