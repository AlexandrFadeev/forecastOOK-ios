//
//  Weather.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation

struct Weather: Decodable {
    let condition: String
    
    enum RootKeys: String, CodingKey {
        case weather
    }
    
    enum WeatherCodingKeys: String, CodingKey {
        case condition = "main"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherCodingKeys.self, forKey: .weather)
        
        self.condition = try weatherContainer.decode(String.self, forKey: .condition)
    }
}
