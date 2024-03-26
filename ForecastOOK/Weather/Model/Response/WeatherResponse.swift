//
//  WeatherResponse.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: Weather
    let temperature: Temperature
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temperature = "main"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        guard let decodedWeather = try container.decodeIfPresent([Weather].self, forKey: .weather)?.first else {
            throw WeatherError.decodingFailure
        }
        
        weather = decodedWeather
        temperature = try container.decode(Temperature.self, forKey: .temperature)
    }
}
