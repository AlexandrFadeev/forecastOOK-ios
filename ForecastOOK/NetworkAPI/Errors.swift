//
//  Errors.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation

enum WeatherError: Error {
    case decodingFailure
    case invalidStatusCode
    case custom(String)
}
