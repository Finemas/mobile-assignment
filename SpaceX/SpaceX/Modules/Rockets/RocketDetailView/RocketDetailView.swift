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
        VStack {
            Text("Detail")
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.rocket.name)
    }
}

struct RocketDetail_Previews: PreviewProvider {
    static var previews: some View {
        let vm = RocketDetailViewModel(rocket: .falcon1)
        RocketDetailView(viewModel: vm)
    }
}
