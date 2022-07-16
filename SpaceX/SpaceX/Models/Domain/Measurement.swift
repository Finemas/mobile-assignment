//
//  Measurement.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

enum UnitSystem {
    case metric
    case imperial
}

enum Measurement {
    case length
    case mass

    func unit(_ system: UnitSystem) -> String {
        switch self {
        case .length:
            switch system {
            case .metric:
                return "m"

            case .imperial:
                return "f"
            }

        case .mass:
            switch system {
            case .metric:
                return "kg"

            case .imperial:
                return "lb"
            }
        }
    }
}
