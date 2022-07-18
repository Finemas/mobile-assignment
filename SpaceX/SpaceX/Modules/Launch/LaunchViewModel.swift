//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

import Combine
import Foundation

class LaunchViewModel: ObservableObject {
    @Published var motionState: MotionState = .notRequested

    let motionManager: MotionManager

    private var cancellables = Set<AnyCancellable>()

    init(motionManager: MotionManager = MotionManager()) {
        self.motionManager = motionManager
    }

    func startReceivingMotionData() {
        if case .scanning = motionState {
            return
        }

        motionManager.startReceivingMotionUpdates()

        motionManager.$motionData
            .filter { state in
                if case let .scanning(shouldLaunch) = self.motionState {
                    return !shouldLaunch
                } else {
                    return true
                }
            }
            .sink { [weak self] result in
                guard
                    let self = self,
                    let result = result else {
                    return
                }

                switch result {
                case let .success(motionData):
                    let shouldLaunch = motionData.attitude.pitch > 0.5
                    self.motionState = .scanning(shouldLaunch: shouldLaunch)

                    if shouldLaunch {
//                        self.stopReceivingMotionData()
                        self.resetRocketLaunched()
                    }

                case let .failure(error):
                    self.motionState = .failure(error)
                }
            }
            .store(in: &cancellables)
    }

    func stopReceivingMotionData() {
        motionManager.stopReceivingMotionUpdates()
    }

    func resetRocketLaunched() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.motionState = .notRequested
            self.startReceivingMotionData()
        }
    }
}
