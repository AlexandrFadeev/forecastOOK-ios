//
//  NetworkManager.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation
import Combine

final class NetworkManager<T: Decodable> {
    
    func fetch(endpoint: Endpoint) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: endpoint.url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 || response.statusCode <= 300 else {
            throw WeatherError.invalidStatusCode
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }  catch {
            throw WeatherError.decodingFailure
        }
    }
}
