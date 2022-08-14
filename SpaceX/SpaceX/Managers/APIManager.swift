//
//  APIManager.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

import Combine
import Foundation

struct APIManager {
    var getRockets: () async throws -> [Rocket]
    var getRocketDetail: (String) async throws -> RocketDetail
}

extension APIManager {

    static var live: Self {
        Self {
            let service = APIService(baseURL: Constants.baseURL)
            let request = await service.buildRequest(path: "/rockets", method: .get)
            let dto: [RocketDTO] = try await service.send(request)
            return dto.map { $0.domain }
        } getRocketDetail: { rocketID in
            let service = APIService(baseURL: Constants.baseURL)
            let request = await service.buildRequest(path: "/rockets/\(rocketID)", method: .get)
            let dto: RocketDetailDTO = try await service.send(request)
            return dto.domain
        }
    }

    static var debug: Self {
        Self {
            return Rocket.all
        } getRocketDetail: { _ in
            RocketDetail.falcon9
        }
    }
}
