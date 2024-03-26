//
//  WeatherResponse.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: Weather?
    let temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
    }
    
    enum TemperatureKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let temperatureContainer = try container.nestedContainer(keyedBy: TemperatureKeys.self, forKey: .main)
        
        weather = try container.decode([Weather].self, forKey: .weather).first
        temperature = try temperatureContainer.decode(Double.self, forKey: .temperature)
    }
}
