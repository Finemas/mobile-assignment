//
//  RocketDTO.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

import Foundation

struct RocketDTO: Codable {
    // Rocket ID
    let id: String
    // Rocket name
    let name: String
    // First flight of the rocket
    let firstFlight: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case firstFlight = "first_flight"
    }
}

extension RocketDTO: DTOProtocol {
    typealias Domain = Rocket

    var domain: Domain {
        Domain(
            id: id,
            name: name,
            firstFlight: firstFlight.toDate() ?? Date()
        )
    }
}
