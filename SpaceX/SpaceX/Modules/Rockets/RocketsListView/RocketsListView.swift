//
//  RocketsListView.swift
//  SpaceX
//
//  Created by Jan Provaznik on 15.07.2022.
//

import SwiftUI

struct RocketsListView: View {
    @ObservedObject var viewModel: RocketsListViewModel
    
    var body: some View {
        VStack {
            Text(Rocket.falcon1.name)
            Text(Rocket.falcon1.firstFlight.stringFormat(format: "dd.MM.yyyy"))

            Text(Rocket.falcon9.name)
            Text(Rocket.falcon9.firstFlight.stringFormat(format: "dd.MM.yyyy"))

            Text(Rocket.falconHeavy.name)
            Text(Rocket.falconHeavy.firstFlight.stringFormat(format: "dd.MM.yyyy"))

            Text(Rocket.starship.name)
            Text(Rocket.starship.firstFlight.stringFormat(format: "dd.MM.yyyy"))
        }
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = RocketsListViewModel(
            rockets: Rocket.all
        )
        RocketsListView(viewModel: vm)
    }
}
