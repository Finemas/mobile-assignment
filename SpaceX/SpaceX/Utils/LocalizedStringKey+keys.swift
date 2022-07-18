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

    enum RocketDetail {
        static let launch: LocalizedStringKey = "rocket_launch"
        static let description: LocalizedStringKey = "rocket_description"
        static let parameters: LocalizedStringKey = "rocket_parameters"
        static let firstStage: LocalizedStringKey = "rocket_first_stage"
        static let secondStage: LocalizedStringKey = "rocket_Second_stage"
        static let photos: LocalizedStringKey = "rocket_photos"

        static let length: LocalizedStringKey = "rocket_lenght"
        static let diameter: LocalizedStringKey = "rocket_diameter"
        static let masss: LocalizedStringKey = "rocket_mass"

        static let reusable: LocalizedStringKey = "rocket_reusable"
        static let notReusable: LocalizedStringKey = "rocket_not_reusable"

        static func engines(number: Int) -> LocalizedStringKey {
            "rocket_engines \(number)"
        }
        static func fuelTons(tons: Int) -> LocalizedStringKey {
            "rocket_fuel_tons \(tons)"
        }
        static func burnTime(seconds: Int) -> LocalizedStringKey {
            "rocket_burn_time \(seconds)"
        }
    }
}
