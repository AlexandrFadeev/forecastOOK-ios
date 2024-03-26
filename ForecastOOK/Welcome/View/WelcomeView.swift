//
//  WelcomeView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            Text("Please share your current location to get weather in your area")
                .bold()
                .font(.title3)
                .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .multilineTextAlignment(.center)
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    WelcomeView()
}
