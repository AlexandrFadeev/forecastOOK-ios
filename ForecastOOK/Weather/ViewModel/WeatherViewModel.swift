//
//  WeatherViewModel.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {
    
    @Published var weatherResponse: WeatherResponse?
    @Published var shouldShowError = false
    @Published var errorMessage: String?
    
    private var networkManager = NetworkManager<WeatherResponse>()
    
    func fetchWeather(for location: Location) async {
        do {
            weatherResponse = try await networkManager.fetch(endpoint: .weather(for: location))
        } catch {
            shouldShowError = true
            errorMessage = error.localizedDescription
        }
    }
}
