//
//  CategoryCard.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 23.11.23.
//

import SwiftUI

// MARK: Definiert eine SwiftUI View mit dem Namen CategoryCard
struct CategoryCard: View {
    
    var body: some View {
        HStack {
            Image(category.image)
                .resizable()
                .frame(width: 130, height: 90)
            
            Text(category.title)
                .font(.title)
                .bold()
                .foregroundStyle(.black)
            Spacer()
        }
        .padding()
// MARK: Setzt den Hintergrund
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
     
        .overlay {
            Rectangle().stroke(.black, lineWidth: 2)
                .cornerRadius(20)
        }
    }
    @State var category: Category
}

#Preview {
    // MARK: Beispielaufruf der CategoryCard mit einer Kategorie "Mountainbike"
    CategoryCard(category: Category(title: "Mountainbike", image: "mountainbike"))
}
