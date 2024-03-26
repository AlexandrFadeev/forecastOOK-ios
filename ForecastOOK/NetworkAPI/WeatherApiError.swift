//
//  Errors.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation

enum WeatherApiError: LocalizedError {
    case decodingFailure
    case invalidStatusCode
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .decodingFailure: 
            return "Failed to decode"
            
        case .invalidStatusCode:
            return "Invalid status code"
            
        case .custom(let message):
            return message
        }
    }
}
