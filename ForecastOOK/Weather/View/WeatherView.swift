//
//  ContentView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import SwiftUI

struct WeatherView: View {
    
    private let viewModel: WeatherViewModelable
    
    init(viewModel: WeatherViewModelable) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Weather")
            .onAppear(perform: {
                viewModel.fetchWeather(
                    for: Location(
                        latitude: 47.0245117,
                        longitude: 28.8322923
                    )
                )
            })
    }
}

#Preview {
    WeatherView(viewModel: WeatherViewModel())
}
