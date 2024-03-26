//
//  NetworkManager.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation
import Combine

final class NetworkManager<T: Decodable> {
    
    @Published var result: T?
    @Published var isFetching = false
    @Published var error: WeatherError?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetch(endpoint: Endpoint) {
        isFetching = true
        URLSession.shared.dataTaskPublisher(for: endpoint.url)
            .receive(on: DispatchQueue.main)
            .tryMap { publisherResponse in
                guard let response = publisherResponse.response as? HTTPURLResponse,
                      response.statusCode >= 200 || response.statusCode <= 300 else {
                    throw WeatherError.invalidStatusCode
                }
                
                guard let value = try? JSONDecoder().decode(T.self, from: publisherResponse.data) else {
                    debugPrint("failed to decode")
                    throw WeatherError.decodingFailure
                }
                
                return value
            }
            .sink { [weak self] response in
                defer {
                    self?.isFetching = false
                }
                
                switch response {
                case .failure(let error):
                    self?.error = WeatherError.custom(error.localizedDescription)
                default:
                    break
                }
            } receiveValue: { [weak self] value in
                self?.result = value
                debugPrint("Value: \(value)")
            }
            .store(in: &cancellables)
    }
}
