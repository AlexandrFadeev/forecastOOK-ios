//
//  WeatherConditionView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 27.03.2024.
//

import SwiftUI

struct WeatherConditionView: View {
    
    private let imageCode: String
    
    init(imageCode: String) {
        self.imageCode = imageCode
    }
    
    var body: some View {
        switch imageCode {
        case "01d", "01n":
            Image(systemName: "sun.max.fill")
                .renderingMode(.original)
            
        case "02d", "02n":
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
            
        case "03d", "03n", "04d", "04n":
            Image(systemName: "cloud.fill")
                .renderingMode(.original)
            
        case "09d", "09n":
            Image(systemName: "cloud.heavyrain.fill")
                .renderingMode(.original)
            
        case "10d", "10n":
            Image(systemName: "cloud.rain.fill")
                .renderingMode(.original)
            
        case "11d", "11n":
            Image(systemName: "cloud.bolt.rain.fill")
                .renderingMode(.original)
            
        case "13d", "13n":
            Image(systemName: "snowflake")
                .renderingMode(.original)
            
        case "50d":
            Image(systemName: "sun.haze.fill")
                .renderingMode(.original)
            
        case "50n":
            Image(systemName: "moon.haze.fill")
                .renderingMode(.original)
            
            
        default:
            Image(systemName: "")
        }
    }
}

#Preview {
    WeatherConditionView(imageCode: "13d")
}
