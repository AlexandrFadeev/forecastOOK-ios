//
//  Weather.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation



struct Weather: Decodable {
    let condition: String
    let iconName: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case condition = "main"
        case iconName = "icon"
        case description
    }
}
