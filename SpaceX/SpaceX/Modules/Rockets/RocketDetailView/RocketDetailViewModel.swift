//
//  RocketDetailViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import Combine

class RocketDetailViewModel: ObservableObject {
    @Published var rocket: Rocket

    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
