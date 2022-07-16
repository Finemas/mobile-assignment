//
//  RocketDetailView.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

import SwiftUI

struct RocketDetailView: View {
    @ObservedObject var viewModel: RocketDetailViewModel

    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(viewModel.rocket.name)
    }
}

private extension RocketDetailView {

    @ViewBuilder
    var content: some View {
        switch viewModel.rocketDetail {
        case .notRequested, .isLoading:
            LoadingView()

        case let .loaded(rocket):
            rocketView(rocket)

        case let .failed(error):
            Text(error.localizedDescription)
        }
    }

    func rocketView(_ rocket: RocketDetail) -> some View {
        VStack(alignment: .leading, spacing: 32) {
            description(rocket)

            parameters(rocket)

            Spacer()
        }.padding(.horizontal)
    }

    func description(_ rocket: RocketDetail) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(.RocketDetail.description)
                .font(.headline)
                .fontWeight(.bold)

            Text(rocket.description)
                .font(.body)
        }
    }

    func parameters(_ rocket: RocketDetail) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(.RocketDetail.parameters)
                .font(.headline)
                .fontWeight(.bold)

            HStack() {
                ForEach(rocket.parameters) { parameter in
                    if Locale.current.usesMetricSystem {
                        let number = "\(parameter.metric)\(parameter.type.unit(.metric))"
                        BoxText(title: number, subtitle: parameter.name)

                    } else {
                        let number = "\(parameter.imperial)\(parameter.type.unit(.imperial))"
                        BoxText(title: number, subtitle: parameter.name)
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 100)
        }
    }
}

struct RocketDetail_Previews: PreviewProvider {
    static var previews: some View {
        let vm = RocketDetailViewModel(
            rocket: .falcon9,
            rocketDetail: .loaded(.falcon9)
        )
        RocketDetailView(viewModel: vm)
    }
}
