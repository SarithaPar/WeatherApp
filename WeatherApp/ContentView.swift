//
//  ContentView.swift
//  WeatherApp
//
//  Created by Saritha Parsoya on 8/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack() {
                CityTextView(title: "Cupertino, CA")
                
                CityWeatherView(weatherImage: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 10) {
                    WeatherDayView(dayOfWeek: "TUE", 
                                   weatherImage: "cloud.sun.fill",
                                   temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", 
                                   weatherImage: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU", 
                                   weatherImage: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", 
                                   weatherImage: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT", 
                                   weatherImage: "snow",
                                   temperature: 25)
                }
                Spacer()
                
                WeatherButton(title: "Change Day Time")
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CityWeatherView: View {
    var weatherImage: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color? = .blue
    var backgroundColor: Color? = Color.white
    
    var body: some View {
        Button{
            print("tapped")
        } label: {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
    }
}
