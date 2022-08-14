//
//  Loadable.swift
//  SpaceX
//
//  Created by Jan Provaznik on 16.07.2022.
//

enum Loadable<Value, Error> {
    case notRequested
    case isLoading
    case loaded(Value)
    case failed(Error)
}
