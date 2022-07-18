//
//  RocketDetailViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import Combine

class RocketDetailViewModel: ObservableObject {

    enum Route {
        case launch
    }

    @Published var rocketDetail: Loadable<RocketDetail, Error>
    @Published var route: Route?

    let rocket: Rocket

    init(
        rocket: Rocket,
        rocketDetail: Loadable<RocketDetail, Error> = .notRequested
    ) {
        self.rocket = rocket
        self.rocketDetail = rocketDetail
    }
}
