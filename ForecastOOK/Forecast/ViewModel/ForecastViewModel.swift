//
//  ForecastViewModel.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 27.03.2024.
//

import Foundation

@MainActor
final class ForecastViewModel: ObservableObject {
    @Published var forecasts = [Forecast]()
    @Published var isLoading = false
    @Published var error: Error?
    
    private let networkManager = NetworkManager<ForecastResponse>()
    
    func fetchForecast(for location: Location) async {
        isLoading = true
        do {
            let response = try await networkManager.fetch(endpoint: .forecast(for: location))
            forecasts = filter(forecasts: response.forecasts)
            isLoading = false
        } catch {
            isLoading = false
            self.error = error
        }
    }
    
    func formatWeekday(from date: Date?) -> String {
        guard let date else {
            return "-"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let weekDay = dateFormatter.string(from: date)
        
        return weekDay
    }
    
    private func filter(forecasts: [Forecast]) -> [Forecast] {
        forecasts.filter {
            guard let date = $0.date else {
                return false
            }
            let hour = Calendar.current.component(.hour, from: date)
            return hour == 12
        }
    }
}
