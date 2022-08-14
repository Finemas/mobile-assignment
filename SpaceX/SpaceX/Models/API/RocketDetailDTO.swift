//
//  RocketDetailDTO.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

import Foundation

struct LengthDTO: Decodable {
    let meters: Double
    let feet: Double
}

struct MassDTO: Decodable {
    let kg: Double
    let lb: Double
}

// Richer model of rocket
struct RocketDetailDTO: Decodable {
    // Rocket ID
    let id: String
    // Rocket name
    let name: String
    // Rocket description
    let description: String

    let height: LengthDTO
    let diameter: LengthDTO
    let mass: MassDTO
    // The first stage
    let firstStage: StageDTO
    // The second stage
    let secondStage: StageDTO
    // Images of rocket
    let photos: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case photos = "flickr_images"
    }
}

extension RocketDetailDTO: DTOProtocol {
    typealias Domain = RocketDetail

    var domain: Domain {
        .init(
            id: id,
            name: name,
            description: description,
            parameters: [
                Parameter(
                    type: .length,
                    name: "height",
                    metric: height.meters,
                    imperial: height.feet
                )
            ],
            firstStage: firstStage.domain,
            secondStage: secondStage.domain,
            photos: photos.compactMap(Photo.init(stringURL:))
        )
    }
}

