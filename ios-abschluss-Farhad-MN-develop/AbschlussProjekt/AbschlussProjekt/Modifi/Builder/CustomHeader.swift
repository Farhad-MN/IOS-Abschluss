//
//  CustomHeader.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 27.11.23.
//

import SwiftUI

struct CustomHeader<Content: View>: View {
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            content()
        }
        .bold()
    }
    // MARK: - Variables
    
    let title: String
    
    @ViewBuilder var content: () -> Content
}

#Preview {
    CustomHeader(title: "Test") { }
}
