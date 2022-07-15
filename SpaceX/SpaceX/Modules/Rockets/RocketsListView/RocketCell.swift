//
//  RocketCell.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

struct RocketCell: View {
    let rocket: Rocket
    var firstFlight: String {
        let date = rocket.firstFlight.stringFormat(format: "dd.MM.yyyy")
        return "First flight: \(date)"
    }

    var body: some View {
        HStack(spacing: 20) {
            Icons.rocket.image

            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.headline)

                Text(firstFlight)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
