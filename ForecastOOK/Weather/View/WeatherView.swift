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
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Text("My Location")
                            .font(.largeTitle)
                        
                        Text(response.temperature.temperature.formatTemperatureString)
                            .font(.system(size: 120, weight: .light, design: Font.Design.default))
                        
                        VStack {
                            Text(response.weather.condition)
                                .font(.title3)
                            HStack {
                                Text(response.temperature.maxTemperature.formatMaxTemperatureString)
                                Text(response.temperature.minTemperature.formatMinTemperatureString)
                            }
                        }
                        .padding(.bottom)
                        ForecastView(
                            location: location,
                            weatherConditionIconCode: response.weather.iconName,
                            temperature: response.temperature
                        )
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 60, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .frame(height: geometry.size.height)
                }
                .refreshable {
                    await viewModel.fetchWeather(for: location)
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, Color("liteBlue")]),
                        startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .foregroundColor(.white)
                .onAppear {
                    UIRefreshControl.appearance().tintColor = .white
                }
                
                
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
