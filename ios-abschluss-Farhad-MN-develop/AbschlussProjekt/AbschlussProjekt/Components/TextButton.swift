//
//  TextButton.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 20.11.23.
//

import SwiftUI

struct TextButton: View {
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
        }
        .foregroundColor(.red)
    }

// MARK: - Variables
    
    let title: String
    let action: () -> Void
}

#Preview {
    TextButton(title: "Delete profiles") {}
}
