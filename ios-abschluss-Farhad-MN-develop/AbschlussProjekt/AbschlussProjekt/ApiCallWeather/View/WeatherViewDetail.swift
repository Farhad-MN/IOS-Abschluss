//
//  WeatherViewDetail.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 03.01.24.
//

import SwiftUI

struct WeatherViewDetail: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    
                    Button(action: {
                        showWeatherView = false
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("< Back")
                            .font(.title2)
                            .foregroundStyle(.blue)
                    }
                    
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
              
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "smoke")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
//                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Image("city")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100)
                        .padding()
                    
                placeholder: do {
                    ProgressView()
                }
                    Spacer()
                        .padding()
                    
                }
                .frame(maxWidth: .infinity)
               
            }
            
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 80)
                .foregroundColor(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
                .background(.blue)
                .cornerRadius(20, corners: [.topLeft, .topRight] )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.655, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
    @Binding var showWeatherView: Bool
    @Environment(\.presentationMode) var presentationMode
}

#Preview {
    WeatherViewDetail(weather: previewWeather, showWeatherView: .constant(true))
}
