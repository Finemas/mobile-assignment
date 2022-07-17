//
//  MotionManager.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

import CoreMotion

class MotionManager {
    @Published var motionData: Result<CMDeviceMotion, Error>?
    private let motionManager: CMMotionManager

    init(updateInterval: TimeInterval = 0.1) {
        let motionManager = CMMotionManager()
        motionManager.deviceMotionUpdateInterval = updateInterval
        self.motionManager = motionManager
    }

    init(motionManager: CMMotionManager) {
        self.motionManager = motionManager
    }

    func startReceivingMotionUpdates() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
            guard let self = self else {
                return
            }

            if let error = error {
                self.motionData = .failure(error)
                return
            }

            if let motionData = data {
                self.motionData = .success(motionData)
            }
        }
    }

    func stopReceivingMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
    }
}
