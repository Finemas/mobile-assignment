//
//  RocketDetail+instances.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

extension RocketDetail {

    static let falcon9 = RocketDetail(
        id: "falcon9",
        name: "Falcon 9",
        description: "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.",
        parameters: [
            Parameter(
                type: .length,
                name: "Heighr",
                metric: 70,
                imperial: 229.6
            ),
            Parameter(
                type: .length,
                name: "Diameter",
                metric: 3.7,
                imperial: 12
            ),
            Parameter(
                type: .mass,
                name: "Mass",
                metric: 549054,
                imperial: 1207920
            )
        ],
        firstStage: Stage(
            engines: 9,
            reuasable: true,
            fuelAmount: 385,
            burnTime: 162
        ),
        secondStage: Stage(
            engines: 1,
            reuasable: false,
            fuelAmount: 90,
            burnTime: 397
        ),
        images: [
            URL(string: "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg")!,
            URL(string: "https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg")!,
            URL(string: "https://farm1.staticflickr.com/293/32312415025_6841e30bf1_b.jpg")!,
            URL(string: "https://farm1.staticflickr.com/623/23660653516_5b6cb301d1_b.jpg")!,
            URL(string: "https://farm6.staticflickr.com/5518/31579784413_d853331601_b.jpg")!,
            URL(string: "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg")!
        ]
    )
}
