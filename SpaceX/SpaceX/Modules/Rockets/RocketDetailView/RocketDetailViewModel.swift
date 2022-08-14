//
//  RocketDetailViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import Combine

@MainActor
class RocketDetailViewModel: ObservableObject {

    enum Route {
        case launch
    }

    @Published var rocketDetail: Loadable<RocketDetail, Error> = .notRequested
    @Published var route: Route?

    let rocket: Rocket
    let manager: RocketsManager

    init(rocket: Rocket, manager: RocketsManager) {
        self.rocket = rocket
        self.manager = manager
    }

    func fetchRocketDetail() {
        Task {
            self.rocketDetail = .isLoading

            do {
                let rocketDetail = try await manager.getRocketDetail(rocket.id)
                self.rocketDetail = .loaded(rocketDetail)
            } catch let error as APIError {
                self.rocketDetail = .failed(error)
            } catch {
                self.rocketDetail = .failed(APIError.unknownError)
            }
        }
    }
}
