//
//  DataManager.swift
//  FabSensors
//
//  Created by Nicola Giancecchi on 21/12/23.
//

import Foundation

class DataManager: ObservableObject {
    
    @Published var lastSensorData: SensorData?
    @Published var lastUIUpdate: Date?
    
    private let apiManager = APIManager()
    private var timer: Timer?
    
    func fetchData() {
        Task {
            let result = await apiManager.fetchData()
            
            DispatchQueue.main.async {
                switch result {
                    case .success(let sensorData):
                        print(sensorData)
                        self.lastSensorData = sensorData
                    case .failure(let failure):
                        print(failure)
                }
                
                self.lastUIUpdate = Date()
            }
        }
    }
    
    func startPolling() {
        timer?.invalidate()
        
        fetchData()
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { timer in
            self.fetchData()
        })
    }
    
    func stopPolling() {
        timer?.invalidate()
        timer = nil
    }
}
