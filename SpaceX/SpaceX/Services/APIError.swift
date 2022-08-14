//
//  APIError.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

enum APIError: Error {
    // Bad request (400)
    case badRequest
    // Build request error
    case buildRequestError
    // Failed to decode
    case failedToDecode
    // Not found (404)
    case notFound
    // Conflict (409)
    case serverFailure
    // Unauthorized (401)
    case unauthorized
    // Unexpected nil
    case unexpectedNil
    // Unknown error
    case unknownError
    // UnsupportedAPI
    case unsupportedAPI
}
