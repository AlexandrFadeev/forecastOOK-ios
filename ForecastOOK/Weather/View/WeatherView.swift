//
//  ContentView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let weather = viewModel.weatherResponse?.weather {
                Text(viewModel.weatherResponse?.weather.condition ?? "Error")
                
            } else {
                Text("Error")
                    .task {
                        await viewModel.fetchWeather(
                            for: Location(
                                latitude: 47.0245117,
                                longitude: 28.8322923
                            )
                        )
                    }
            }
        }
    }
}

#Preview {
    WeatherView()
}
