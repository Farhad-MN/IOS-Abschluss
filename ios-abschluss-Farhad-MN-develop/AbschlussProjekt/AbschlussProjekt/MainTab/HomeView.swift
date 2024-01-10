//
//  HomeView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            NavigationView {
                CategoryListView(viewModel: CategoryViewModel())
            }
            
        }
        
    }
    @Binding var tab: TabItem
  
}
#Preview {
    HomeView(tab: .constant(.category))
}
