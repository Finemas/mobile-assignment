//
//  RocketsManager.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

struct RocketsManager {
    var getRockets: () async throws -> [Rocket]
    var getRocketDetail: (String) async throws -> RocketDetail
}
