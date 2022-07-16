//
//  Icons.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

enum Icons: String {
    case burn = "Burn"
    case engine = "Engine"
    case fuel = "Fuel"
    case reusable = "Reusable"
    case flyingRocket = "Rocket Flying"
    case rocketIdle = "Rocket Idle"
    case rocket = "Rocket"

    var image: Image {
        Image(self.rawValue)
    }
}
