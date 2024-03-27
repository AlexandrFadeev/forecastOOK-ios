//
//  ContentView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import SwiftUI

struct WeatherContainerView: View {
    
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let currentLocation = locationManager.location {
                WeatherView(
                    location: Location(
                        latitude: currentLocation.latitude,
                        longitude: currentLocation.longitude
                    )
                )
            } else {
                WelcomeView().environmentObject(locationManager)
            }
        }
    }
}

#Preview {
    WeatherContainerView()
}
