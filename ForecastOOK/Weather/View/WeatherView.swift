//
//  ContentView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let currentLocation = locationManager.location {
                Text("your location is: \(currentLocation.latitude) \(currentLocation.longitude)")
            } else {
                WelcomeView().environmentObject(locationManager)
            }
        }
    }
}

#Preview {
    WeatherView()
}
