//
//  StageView.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

struct StageView: View {
    let title: LocalizedStringKey
    let stage: Stage

    var reusable: LocalizedStringKey {
        stage.reusable
            ? .RocketDetail.reusable
            : .RocketDetail.notReusable
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)

            rowFactory(image: Icons.reusable.rawValue, text: reusable)
            rowFactory(image: Icons.engine.rawValue, text: .RocketDetail.engines(number: stage.engines))
            rowFactory(image: Icons.fuel.rawValue, text: .RocketDetail.fuelTons(tons: stage.fuelAmount))
            rowFactory(image: Icons.reusable.rawValue, text: .RocketDetail.burnTime(seconds: stage.burnTime))
        }
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

private extension StageView {

    func rowFactory(image: String, text: LocalizedStringKey) -> some View {
        HStack(spacing: 8) {
            Image(image)

            Text(text)

            Spacer()
        }
    }
}

struct StageView_Previews: PreviewProvider {
    static var previews: some View {
        StageView(
            title: "First Stage",
            stage: Stage(
                engines: 9,
                reusable: true,
                fuelAmount: 385,
                burnTime: 162
            )
        ).padding()
    }
}
