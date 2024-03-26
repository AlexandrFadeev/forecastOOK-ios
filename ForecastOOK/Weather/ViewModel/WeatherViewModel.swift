//
//  WeatherViewModel.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation
import Combine

protocol WeatherViewModelable {
    func fetchWeather(for location: Location)
}

final class WeatherViewModel: WeatherViewModelable, ObservableObject {
    
    private let networkManager = NetworkManager<WeatherResponse>()
    
    func fetchWeather(for location: Location) {
        networkManager.fetch(endpoint: .weather(for: location))
    }
}
