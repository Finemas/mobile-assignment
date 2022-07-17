//
//  MotionManager.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

import Foundation
import Combine
import CoreMotion

class MotionManager: ObservableObject {

    enum MotionState {
        case notRequested
        case scanning(Double)
        case paused
        case failure(Error)
    }

    @Published var state: MotionState = .notRequested
    @Published var pitch: Double = 0.0

    private var motionManager: CMMotionManager

    init(motionManager: CMMotionManager = CMMotionManager()) {
        self.motionManager = motionManager
    }

    func startReceivingMotionUpdates() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
            guard let self =  self else {
                return
            }

            if let error = error {
                self.state = .failure(error)
                return
            }

            if let motionData = data {
                let pitch = motionData.attitude.pitch
                self.pitch = pitch
                self.state = .scanning(pitch)
            }
        }
    }

    func stopReceivingMotionUpdates() {
        motionManager.stopDeviceMotionUpdates()
        state = .paused
    }
}
