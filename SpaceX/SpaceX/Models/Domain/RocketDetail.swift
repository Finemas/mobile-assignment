//
//  RocketDetail.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import Foundation

// Richer model of rocket
struct RocketDetail {
    // Rocket ID
    let id: String
    // Rocket name
    let name: String
    // Rocket description
    let description: String
    // Rocket parameters
    let parameters: [Parameter]
    // The first stage
    let firstStage: Stage
    // The second stage
    let secondStage: Stage
    // Images of rocket
    let images: [URL]
}
