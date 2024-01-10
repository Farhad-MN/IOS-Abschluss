//
//  CategoryListView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 23.11.23.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel: CategoryViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CustomHeader(title: "Category") { }
                    ForEach(viewModel.category) { category in
                        NavigationLink(destination: viewForCategory(category)) {
                            CategoryCard(category: category)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
            .foregroundColor(.white)
        }
        
    }

    func viewForCategory(_ category: Category) -> some View {
        switch category.title {
        case "Mountainbike":
            return AnyView(MountainbikeView())
        case "Rennrad":
            return AnyView(RennradView())
        case "Fahrrad":
            return AnyView(FahrradView())
        case "Bikepacking":
            return AnyView(BikepackingView())
        case "Laufen":
            return AnyView(LaufenView())
        case "Wandern":
            return AnyView(WandernView())
        // Füge ähnliche Cases für andere Kategorien hinzu
        default:
            return AnyView(EmptyView())
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(viewModel: CategoryViewModel())
    }
}
