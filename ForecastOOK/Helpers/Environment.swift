//
//  Environment.swift
//  ForecastOOK
//
//  Created by Alexandr Fadeev on 25.03.2024.
//

import Foundation

protocol ApiKeyable {
    var apiKey: String { get }
}

class Environment: ApiKeyable {

    enum Key: String {
        case apiKey
    }
    
    let dictionary: [String: Any]
    
    var apiKey: String {
        dictionary[Key.apiKey.rawValue] as? String ?? ""
    }
    
    init(resourceName: String) {
        guard let fileURL = Bundle.main.url(forResource: resourceName, withExtension: "plist"),
              let data = try? Data(contentsOf: fileURL) else {
            fatalError("Could'n file '\(resourceName)' plist file")
        }
        
        dictionary = (try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any]) ?? [:]
    }
}
