//
//  RocketsListViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import Combine

class RocketsListViewModel: ObservableObject {
    @Published var rockets: [Rocket]
    @Published var searchText = ""
    var filteredRockets: [Rocket] {
        if searchText.isEmpty {
            return rockets
        } else {
            return rockets.filter { $0.name.contains(searchText) }
        }
    }

    init(rockets: [Rocket] = []) {
        self.rockets = rockets
    }
}
