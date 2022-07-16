//
//  SpaceXApp.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

@main
struct SpaceXApp: App {
    var isDebug = true

    var body: some Scene {
        WindowGroup {
            if isDebug {
                RocketsListView(
                    viewModel:
                        RocketsListViewModel(
                            rockets: .loaded(Rocket.all)
                        )
                )
            } else {
                RocketsListView(viewModel: RocketsListViewModel())
            }
        }
    }
}
