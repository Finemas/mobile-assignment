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
        }
    }
}

private extension RocketsListView {

    @ViewBuilder
    var content: some View {
        switch viewModel.rockets {
        case .notRequested, .isLoading:
            loadingView

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
                NavigationLink {
                    let vm = RocketDetailViewModel(rocket: rocket)
                    RocketDetailView(viewModel: vm)
                } label: {
                    RocketCell(rocket: rocket)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
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

    var loadingView: some View {
        ProgressView(.laoding)
            .progressViewStyle(CircularProgressViewStyle(tint: .pink))
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = RocketsListViewModel(
            rockets: .loaded(Rocket.all)
        )
        RocketsListView(viewModel: vm)
    }
}
