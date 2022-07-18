//
//  MotionState.swift
//  SpaceX
//
//  Created by Jan Provaznik on 17.07.2022.
//

enum MotionState {
    case notRequested
    case scanning(shouldLaunch: Bool)
    case failure(Error)
}
