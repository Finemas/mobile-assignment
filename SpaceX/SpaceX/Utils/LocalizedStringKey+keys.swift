//
//  LocalizedStringKey+keys.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

extension LocalizedStringKey {

    static let laoding: LocalizedStringKey = "loading"

    enum RocketsListView {
        static let title: LocalizedStringKey = "rockets_title"
        static let noRockets: LocalizedStringKey = "rockets_empty"

        static func firstFlight(date: String) -> LocalizedStringKey {
            "rockets_first_flight \(date)"
        }
    }
}
