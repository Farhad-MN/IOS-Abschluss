//
//  WeatherView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var locationManager = LocationManager()
    
    @ObservedObject var weatherManagerCity = WeatherViewModel()
    @State var weather: ResponseBody?
    @State var cityName: String = ""
    @State var isSearching = false
    @State var errorAlert = false
    @State var showWeatherView = false 
    
    var body: some View {
        NavigationView {
            VStack {
                if showWeatherView {
                    if let weather = weather {
                        WeatherViewDetail(weather: weather, showWeatherView: $showWeatherView)
                    } else {
                        LoadingView()
                    }
                } else {
                    WelcomeView(cityName: $cityName, isSearching: $isSearching, errorAlert: $errorAlert, weatherManagerCity: weatherManagerCity, weather: $weather, showWeatherView: $showWeatherView)
                        .environmentObject(locationManager)
                        .environmentObject(weatherManagerCity)
                }
            }
            .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
            .navigationTitle("")
            
        }
    }
    
}
#Preview {
    WeatherView()
}
