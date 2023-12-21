//
//  ContentView.swift
//  FabSensors
//
//  Created by Nicola Giancecchi on 21/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        VStack {
            Button("Call API") {
                self.dataManager.fetchData()
            }
            Text("User: " + (dataManager.lastSensorData?.username ?? ""))
            Text("Last value: " + (dataManager.lastSensorData?.last_value ?? ""))
                .font(.title)
            Text("Last UI update: " + (dataManager.lastUIUpdate?.ISO8601Format() ?? ""))
        }
        .onAppear {
            dataManager.startPolling()
        }
        .onDisappear {
            dataManager.stopPolling()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
