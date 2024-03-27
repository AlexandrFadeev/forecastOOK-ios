//
//  WeatherView.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 26.03.2024.
//

import SwiftUI

struct WeatherView: View {
    
    private let location: Location
    @StateObject private var viewModel = WeatherViewModel()
    @State private var showAlert = false
    
    init(location: Location) {
        self.location = location
    }
    
    var body: some View {
        if let response = viewModel.weatherResponse {
            ScrollView {
                VStack {
                    Text("My Location")
                        .font(.largeTitle)
                    
                    Text(viewModel.formatTemperatureString(from: response.temperature.temperature))
                        .font(.system(size: 120, weight: .light, design: Font.Design.default))
                    
                    VStack {
                        Text(response.weather.condition)
                            .font(.title3)
                        HStack {
                            
                        }
                    }
                    
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 60, leading: 0.0, bottom: 0.0, trailing: 0.0))
            }
            
        } else {
            LoaderView()
                .opacity(showAlert ? 1 : 0)
                .task {
                    await viewModel.fetchWeather(for: location)
                }
                .onReceive(viewModel.$weatherError, perform: { error in
                    if error != nil {
                        showAlert.toggle()
                    }
                })
                .alert(isPresented: $showAlert, content: {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.weatherError?.localizedDescription ?? "")
                    )
                })
        }
    }
}

#Preview {
    WeatherView(location: Location(latitude: 47.0245117, longitude: 28.8322923))
}
