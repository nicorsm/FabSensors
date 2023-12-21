//
//  APIManager.swift
//  FabSensors
//
//  Created by Nicola Giancecchi on 21/12/23.
//

import Foundation

enum SensorError: Error {
    case wrongURL
    case genericError
}

struct APIManager {
    
    private let feedUrl = "https://io.adafruit.com/api/v2/mconti/feeds/test"
    
    func fetchData() async -> Result<SensorData, SensorError> {
        
        guard let url = URL(string: feedUrl) else {
            return .failure(.wrongURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let sensorData = try JSONDecoder().decode(SensorData.self, from: data)
            return .success(sensorData)
        } catch _ {
            return  .failure(.genericError)
        }
        
    }
}
