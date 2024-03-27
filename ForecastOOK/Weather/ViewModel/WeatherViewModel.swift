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
    @Published var weatherError: Error?
    @Published var isLoading = false
    
    private var networkManager = NetworkManager<WeatherResponse>()
    
    func fetchWeather(for location: Location) async {
        isLoading = true
        do {
            weatherResponse = try await networkManager.fetch(endpoint: .weather(for: location))
            isLoading = false
        } catch {
            weatherError = error
            isLoading = false
        }
    }
    
    func formatTemperatureString(from temperature: Double) -> String {
        String(format: "%.0f°", temperature)
    }
    
    func formatHighTemperatureString(from temperature: Double) -> String {
        let temperature = formatTemperatureString(from: temperature)
        return String(format: "H", <#T##arguments: any CVarArg...##any CVarArg#>)
    }
}
