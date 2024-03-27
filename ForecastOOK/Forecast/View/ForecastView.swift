//
//  ForecatView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 27.03.2024.
//

import SwiftUI

struct ForecastView: View {
    
    @StateObject var viewModel = ForecastViewModel()
    private let location: Location
    private let weatherConditionIconCode: String
    private let temperature: Temperature
    
    init(location: Location, weatherConditionIconCode: String, temperature: Temperature) {
        self.location = location
        self.weatherConditionIconCode = weatherConditionIconCode
        self.temperature = temperature
    }
    
    var body: some View {
        List(viewModel.forecasts) { forecast in
            HStack(spacing: 60) {
                HStack {
                    Text(viewModel.formatWeekday(from: forecast.date))
                    Spacer()
                    WeatherConditionView(imageCode: weatherConditionIconCode)
                }
                HStack {
                    Text(temperature.minTemperature.formatTemperatureString)
                    Spacer()
                    Text(temperature.maxTemperature.formatTemperatureString)
                }
            }
            
            .listRowBackground(Color(white: 1.0, opacity: 0.0))
            .listRowSeparatorTint(.white)
        }
        .scrollContentBackground(.hidden)
        .task {
            await viewModel.fetchForecast(for: location)
        }
    }
}

#Preview {
    ForecastView(
        location: Location(latitude: 47.0245117, longitude: 28.8322923),
        weatherConditionIconCode: "02d",
        temperature: Temperature(temperature: 11.2, minTemperature: 07.4, maxTemperature: 15.8)
    )
}
