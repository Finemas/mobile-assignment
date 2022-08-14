//
//  LaunchView.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

import SwiftUI

struct LaunchView: View {
    @ObservedObject var viewModel: LaunchViewModel

    var body: some View {
        VStack {
            Text("Motion Data")
            if
                let motionData = viewModel.motionManager.motionData,
                case let .success(motionData) = motionData
            {
                Text("pith: \(motionData.attitude.pitch)")
            }

            content
        }
        .onAppear {
            viewModel.startReceivingMotionData()
        }
        .onDisappear {
            viewModel.stopReceivingMotionData()
        }
    }

    @ViewBuilder
    var content: some View {
        switch viewModel.motionState {
        case .notRequested:
            Icons.rocketIdle.image

        case let .scanning(shouldLaunch):
            if shouldLaunch {
                Icons.flyingRocket.image
                    .offset(y: -UIScreen.main.bounds.height)
                    .transition(.scale.animation(.default.speed(0.1)))

                Text("Launch successfull!")
            } else {
                Icons.rocketIdle.image
                Text("Move your phone up \nto launch the rocket")
            }

        case let .failure(error):
            Text(error.localizedDescription)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: LaunchViewModel())
    }
}
