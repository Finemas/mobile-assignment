//
//  LaunchView.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

import SwiftUI

struct LaunchView: View {
    @ObservedObject var motion: MotionManager

    var body: some View {
        VStack {
            Text("Motion Data")
            Text("pith: \(motion.pitch * 100)")

            content
        }
        .onAppear {
            motion.startReceivingMotionUpdates()
        }
        .onDisappear {
            motion.stopReceivingMotionUpdates()
        }
    }
}

private extension LaunchView {

    @ViewBuilder
    var content: some View {
        switch motion.state {
        case .notRequested, .paused:
            Text("----")
                .font(.title)

        case let .scanning(pitch):
            if pitch < 0 {
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
        LaunchView(motion: MotionManager() )
    }
}
