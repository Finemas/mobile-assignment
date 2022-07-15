//
//  Rocket+instances.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import Foundation

extension Rocket {

    static let all: [Rocket] = [
        .falcon1,
        .falcon9,
        .falconHeavy,
        .falconHeavy,
        .starship
    ]

    static let falcon1 = Rocket(
        name: "Falcon 1",
        firstFlight: Date("24.3.2006", stringFormat: "dd.MM.yyy")
    )

    static let falcon9 = Rocket(
        name: "Falcon 9",
        firstFlight: Date("6.4.2010", stringFormat: "dd.MM.yyy")
    )

    static let falconHeavy = Rocket(
        name: "Falcon Heavy",
        firstFlight: Date("2.6.2018", stringFormat: "dd.MM.yyy")
    )

    static let starship = Rocket(
        name: "Starship",
        firstFlight: Date("12.1.2021", stringFormat: "dd.MM.yyy")
    )
}
