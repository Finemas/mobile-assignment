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
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                description(rocket)

                parameters(rocket)


                StageView(title: .RocketDetail.firstStage, stage: rocket.firstStage)

                StageView(title: .RocketDetail.secondStage, stage: rocket.secondStage)

                photos(rocket)

                Spacer()
            }.padding(.horizontal)
        }
    }

    func description(_ rocket: RocketDetail) -> some View {
        SectionContainer(
            title: .RocketDetail.description,
            content: {
                Text(rocket.description)
                    .font(.body)
            }
        )
    }

    func parameters(_ rocket: RocketDetail) -> some View {
        SectionContainer(
            title: .RocketDetail.parameters,
            content: {
                HStack {
                    ForEach(rocket.parameters) { parameter in
                        let number = Locale.current.usesMetricSystem
                        ? "\(parameter.metric)\(parameter.type.unit(.metric))"
                        : "\(parameter.imperial)\(parameter.type.unit(.imperial))"

                        BoxText(title: number, subtitle: LocalizedStringKey(parameter.name))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 100)
            }
        )
    }

    func photos(_ rocket: RocketDetail) -> some View {
        SectionContainer(
            title: .RocketDetail.photos,
            content: {
                VStack(spacing: 8) {
                    ForEach(rocket.photos) { photo in
                        AsyncImageWrapper(url: photo.url)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .contentShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
            }
        )
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
