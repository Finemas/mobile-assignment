//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

import Combine

class LaunchViewModel: ObservableObject {
    @Published var motionState: MotionState = .notRequested

    let motionManager: MotionManager

    var cancellables = Set<AnyCancellable>()

    init(motionManager: MotionManager = MotionManager()) {
        self.motionManager = motionManager
    }

    func startReceivingMotionData() {
        if case .scanning = motionState {
            return
        }

        motionManager.startReceivingMotionUpdates()

        motionManager.$motionData
            .sink { [weak self] result in
                guard
                    let self = self,
                    let result = result else {
                    return
                }

                switch result {
                case let .success(motionData):
                    let tolerance: Double = 5
                    let pitch = motionData.attitude.pitch * 100 + tolerance
                    self.motionState = .scanning(shouldLaunch: pitch < 0)

                case let .failure(error):
                    self.motionState = .failure(error)
                }
            }
            .store(in: &cancellables)
    }

    func stopReceivingMotionData() {
        if case .paused = motionState {
            return
        }

        motionManager.stopReceivingMotionUpdates()
        motionState = .paused
    }
}
