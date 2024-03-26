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
    
    @Published private(set) var weatherResponse: WeatherResponse?
    @Published private(set) var shouldShowError = false
    @Published private(set) var errorMessage: String?
    
    private var networkManager = NetworkManager<WeatherResponse>()
    
    func fetchWeather(for location: Location) async {
        do {
            weatherResponse = try await networkManager.fetch(endpoint: .weather(for: location))
        } catch {
            shouldShowError = true
            errorMessage = error.localizedDescription
            
            debugPrint("error: \(error.localizedDescription)")
        }
    }
}
