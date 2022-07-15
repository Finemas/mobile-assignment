//
//  LocalizedStringKey+keys.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

extension LocalizedStringKey {

    enum RocketsListView {
        static let title: LocalizedStringKey = "rockets_title"
        static func firstFlight(date: String) -> LocalizedStringKey {
            "rockets_first_flight \(date)"
        }
    }
}
