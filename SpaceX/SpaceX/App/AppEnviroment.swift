//
//  AppEnviroment.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

struct AppEnviroment {
    let apiManager: APIManager
}

extension AppEnviroment {

    var rocketsManager: RocketsManager {
        .init(
            getRockets: apiManager.getRockets,
            getRocketDetail: apiManager.getRocketDetail
        )
    }
}

extension AppEnviroment {

    static var live: Self {
        Self(
            apiManager: APIManager.live
        )
    }

    static var debug: Self {
        Self(
            apiManager: APIManager.debug
        )
    }
}
