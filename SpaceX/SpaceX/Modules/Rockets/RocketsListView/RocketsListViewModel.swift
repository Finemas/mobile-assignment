//
//  RocketsListViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import Combine

class RocketsListViewModel: ObservableObject {
    @Published var rockets: [Rocket]

    init(rockets: [Rocket]) {
        self.rockets = rockets
    }
}
