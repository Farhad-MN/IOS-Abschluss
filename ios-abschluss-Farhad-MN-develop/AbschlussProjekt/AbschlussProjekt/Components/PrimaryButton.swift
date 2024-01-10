//
//  PrimaryButton.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 20.11.23.
//

import SwiftUI

struct PrimaryButton: View {
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
        }
        .padding(.vertical, 12)
        .background(Color.accentColor)
        .cornerRadius(12)
    }
    
// MARK: - Variable
    
    let title: String
    let action: () -> Void
}

#Preview {
    PrimaryButton(title: "LogOut") {}
}
