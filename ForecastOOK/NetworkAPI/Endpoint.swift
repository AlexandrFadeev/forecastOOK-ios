//
//  Endpoint.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    
    static var environment: ApiKeyable {
        Environment(resourceName: "API-Keys")
    }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "api.openweathermap.org"
        components.path = "/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
}

extension Endpoint {
    static func weather(for location: Location) -> Self {
        Endpoint(
            path: "data/2.5/weather",
            queryItems: [
                URLQueryItem(
                    name: QueryName.latitude.rawValue,
                    value: "\(location.latitude)"
                ),
                URLQueryItem(
                    name: QueryName.longitude.rawValue,
                    value: "\(location.longitude)"
                ),
                URLQueryItem(
                    name: QueryName.units.rawValue,
                    value: QueryValue.metric.rawValue
                ),
                URLQueryItem(
                    name: QueryName.appID.rawValue,
                    value: environment.apiKey
                )
            ]
        )
    }
}

private extension Endpoint {
    enum QueryName: String {
        case latitude = "lat"
        case longitude = "lon"
        case units
        case appID = "appid"
    }
    
    enum QueryValue: String {
        case metric
    }
}
