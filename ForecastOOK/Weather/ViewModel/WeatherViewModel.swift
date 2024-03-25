//
//  WeatherViewModel.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation
import Combine

protocol WeatherViewModelable {
    func check()
}

final class WeatherViewModel: WeatherViewModelable, ObservableObject {
    func check() {
        debugPrint("is working")
    }
}
