//
//  ContentView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import SwiftUI

struct WeatherView: View {
    
    private let viewModel: WeatherViewModelable
    
    init(viewModel: WeatherViewModelable) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("Weather")
    }
}

#Preview {
    WeatherView(viewModel: WeatherViewModel())
}
