//
//  Double+Extensions.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 27.03.2024.
//

import Foundation

extension Double {
    var formatTemperatureString: String {
        String(format: "%.0f°", self)
    }
    
    var formatMaxTemperatureString: String {
        "H: \(formatTemperatureString)"
    }
    
    var formatMinTemperatureString: String {
        "L: \(formatTemperatureString)"
    }
}
