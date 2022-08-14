//
//  StageDTO.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

struct StageDTO: Decodable {
    // Number of engines
    let engines: Int
    // If is reusable again
    let reusable: Bool
    // Amount of fuel in tons
    let fuelAmount: Double
    // Burn time in seconds
    let burnTime: Int?

    enum CodingKeys: String, CodingKey {
        case engines, reusable
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
}

extension StageDTO: DTOProtocol {
    typealias Domain = Stage

    var domain: Domain {
        .init(
            engines: engines,
            reusable: reusable,
            fuelAmount: fuelAmount,
            burnTime: burnTime
        )
    }
}
