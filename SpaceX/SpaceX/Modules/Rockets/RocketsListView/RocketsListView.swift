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
            content
                .navigationTitle(.RocketsListView.title)
                .onAppear {
                    viewModel.fetchRockets()
                }
        }
    }

    @ViewBuilder
    var content: some View {
        switch viewModel.rockets {
        case .notRequested, .isLoading:
            LoadingView()

        case .loaded:
            if viewModel.filteredRockets.isEmpty {
                emptyView
            } else {
                rocketsList
            }

        case let .failed(error):
            Text(error.localizedDescription)
        }
    }

    var rocketsList: some View {
        List {
            ForEach(viewModel.filteredRockets) { rocket in
                rocketCell(rocket)
            }
        }
        .searchable(text: $viewModel.searchText)
    }

    func rocketCell(_ rocket: Rocket) -> some View {
        NavigationLink {
            let vm = RocketDetailViewModel(
                rocket: rocket,
                manager: viewModel.manager
            )
            RocketDetailView(viewModel: vm)
        } label: {
            RocketCell(rocket: rocket)
        }
    }

    var emptyView: some View {
        VStack {
            Spacer()

            Text(.RocketsListView.noRockets)
                .multilineTextAlignment(.center)

            Spacer()
            Spacer()
        }.padding(.horizontal)
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = RocketsListViewModel(
            manager: AppEnviroment.debug.rocketsManager
        )
        RocketsListView(viewModel: vm)
    }
}
