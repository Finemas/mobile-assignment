//
//  DTOProtocol.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

protocol DTOProtocol: Decodable {
    associatedtype Domain

    var domain: Domain { get }
}
