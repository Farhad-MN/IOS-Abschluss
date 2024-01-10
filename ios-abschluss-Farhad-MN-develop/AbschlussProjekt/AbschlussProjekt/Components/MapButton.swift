//
//  MapButton.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 09.01.24.
//

import SwiftUI

struct MapButton: View {
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 50)
                
                Image(systemName: "map.fill")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
    }
    // MARK: - Variables
    
    let action: () -> Void
}

struct MapButton_Previews: PreviewProvider {
    static var previews: some View {
        MapButton(action: {
            print("Button tapped")
        })
    }
}
