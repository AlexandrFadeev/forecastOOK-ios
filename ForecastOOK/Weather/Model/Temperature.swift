//
//  Temperature.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import Foundation

struct Temperature: Decodable {
    let temperature: Double
    let minTemperature: Double
    let maxTemperature: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
    }
}
