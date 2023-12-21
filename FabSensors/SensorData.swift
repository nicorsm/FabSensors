//
//  SensorData.swift
//  FabSensors
//
//  Created by Nicola Giancecchi on 21/12/23.
//

import Foundation

enum Visibility: String, Codable {
    case `public`
    case `private`
    case unknown
}

struct SensorData: Codable, Identifiable {
    let username: String
    let id: Int
    let description: String
    let license: String
    let history: Bool
    let enabled: Bool
    let visibility: Visibility
    let unit_type: String?
    let unit_symbol: String?
    let last_value: String
    let created_at: String
    let updated_at: String
    let wipper_pin_info: String?
    let key: String
    let writable: Bool
    let group: Group
    let groups: [Group]
}

struct Owner: Codable, Identifiable {
    let id: Int
    let username: String
}

struct Group: Codable, Identifiable {
    let id: Int
    let key: String
    let name: String
    let user_id: Int
}
