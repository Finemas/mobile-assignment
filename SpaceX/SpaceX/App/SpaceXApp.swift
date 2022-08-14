//
//  SpaceXApp.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

@main
struct SpaceXApp: App {
    let appEnviroment: AppEnviroment = Constants.isDebug ? .debug : .live

    var body: some Scene {
        WindowGroup {
            RocketsListView(viewModel:
                RocketsListViewModel(manager: appEnviroment.rocketsManager)
            )
        }
    }
}
