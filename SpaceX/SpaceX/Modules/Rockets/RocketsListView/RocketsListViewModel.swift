//
//  RocketsListViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import Combine

class RocketsListViewModel: ObservableObject {
    @Published var rockets: Loadable<[Rocket], Error>
    @Published var searchText = ""

    var filteredRockets: [Rocket] {
        guard case let .loaded(rockets) = rockets else {
            return []
        }

        if searchText.isEmpty {
            return rockets
        } else {
            return rockets.filter { $0.name.contains(searchText) }
        }
    }

    init(rockets: Loadable<[Rocket], Error> = .notRequested) {
        self.rockets = rockets
    }
}
