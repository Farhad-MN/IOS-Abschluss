//
//  DefaultBackground.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 27.11.23.
//

import SwiftUI

struct DefaultBackground: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(color)
            .cornerRadius(12)
    }
}

extension View {
    func defaultBackground(with color: Color = .accentColor) -> some View {
        modifier(DefaultBackground(color: color))
    }
}

