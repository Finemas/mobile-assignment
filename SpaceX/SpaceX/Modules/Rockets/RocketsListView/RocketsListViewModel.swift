//
//  RocketsListViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import Combine

@MainActor
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

    let manager: RocketsManager

    init(
        manager: RocketsManager,
        rockets: Loadable<[Rocket], Error> = .notRequested
    ) {
        self.manager = manager
        self.rockets = rockets
    }

    func fetchRockets() {
        Task {
            self.rockets = .isLoading

            do {
                let rockets = try await manager.getRockets()
                self.rockets = .loaded(rockets)
            } catch let error as APIError {
                self.rockets = .failed(error)
            } catch {
                self.rockets = .failed(APIError.unknownError)
            }
        }
    }
}
