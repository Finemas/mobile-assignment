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
        NavigationView {
            List {
                ForEach(viewModel.filteredRockets) { rocket in
                    NavigationLink {
                        Text("Detail")
                    } label: {
                        RocketCell(rocket: rocket)
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle(.RocketsListView.title)
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
