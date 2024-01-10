//
//  MainTabView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import SwiftUI

struct MainTabView: View {
    // Hauptansicht für die TabBar-Ansicht
    var body: some View {
        NavigationView {
            // TabView zur Darstellung von Tabs
          
            TabView(selection: $selectedTab) {
                
                HomeView(tab: $selectedTab)
                    .tabItem {
                        
                        Label(TabItem.category.title, systemImage: TabItem.category.icon)
                           
                    }
                    .tag(TabItem.category)
                WeatherView()
                    .tabItem {
                        Label(TabItem.weather.title, systemImage: TabItem.weather.icon)
                    }
                    .tag(TabItem.weather)
                ProfileView()
                    .tabItem {
                        Label(TabItem.person.title, systemImage: TabItem.person.icon)
                    }
                    .tag(TabItem.person)
                    
            }
        }
    }
    // Variable zum Speichern des ausgewählten Tabs
    @State private var selectedTab: TabItem = .category
    
}

#Preview {
    MainTabView()
        .environmentObject(UserViewModel())
    
}
