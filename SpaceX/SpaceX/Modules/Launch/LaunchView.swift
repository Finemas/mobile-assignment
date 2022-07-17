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
                Text("pith: \(motionData.attitude.pitch * 100)")
            }

            content

            HStack {
                Button {
                    viewModel.startReceivingMotionData()
                } label: {
                    Text("Start gyro")
                }

                Button {
                    viewModel.stopReceivingMotionData()
                } label: {
                    Text("Stop gyro")
                }
            }
        }
        .onAppear {
            viewModel.startReceivingMotionData()
        }
        .onDisappear {
            viewModel.stopReceivingMotionData()
        }
    }
}

private extension LaunchView {

    @ViewBuilder
    var content: some View {
        switch viewModel.motionState {
        case .notRequested, .paused:
            Text("----")
                .font(.title)

        case let .scanning(shouldLaunch):
            if shouldLaunch {
                Text("Launch !!!!!")
                    .font(.title)
            } else {
                Text("Rocket")
                    .font(.title)
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
