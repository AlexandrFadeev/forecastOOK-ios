//
//  LocationError.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import Foundation

enum LocationError: LocalizedError {
    case permissionAccessFailed
    
    var errorDescription: String? {
        switch self {
        case .permissionAccessFailed: 
            return "Location permission failed"
        }
    }
}
