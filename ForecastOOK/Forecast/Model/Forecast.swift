//
//  Model.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 27.03.2024.
//

import Foundation

struct ForecastResponse: Decodable {
    let forecasts: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case forecasts = "list"
    }
}

struct Forecast: Decodable, Identifiable {
    let id = UUID()
    let weather: Weather
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case weather
        case date = "dt_txt"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let weathers = try container.decode([Weather].self, forKey: .weather)
        let dateString = try container.decode(String.self, forKey: .date)
        
        guard let weather = weathers.first else {
            throw ForecatError.decodingFailure
        }
        
        self.weather = weather
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        date = dateFormatter.date(from: dateString)
    }
}
