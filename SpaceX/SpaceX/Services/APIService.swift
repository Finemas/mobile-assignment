//
//  APIService.swift
//  SpaceX
//
//  Created by Jan Provaznik on 14.08.2022.
//

import Foundation

actor APIService {

    let baseURL: URL
    let decoder: JSONDecoder
    private let session: URLSession

    init(
        baseURL: URL,
        decoder: JSONDecoder = JSONDecoder(),
        urlSession: URLSession = URLSession(configuration: .default)
    ) {
        self.baseURL = baseURL
        self.decoder = decoder
        self.session = urlSession
    }

    func buildRequest(
        path: String,
        method: HttpMethod
    ) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }

    func send<T: Decodable>(
        _ request: URLRequest
    ) async throws -> T {
        let (data, response) = try await session.data(for: request)

        try validateResponse(response: response)

        return try parseData(type: T.self, data: data)
    }

    func validateResponse(response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse else {
            throw APIError.unsupportedAPI
        }

        switch response.statusCode {
        case 200...299:
            break
        case 401:
            throw APIError.unauthorized
        case 403:
            throw APIError.unexpectedNil
        case 404:
            throw APIError.notFound
        case 409:
            throw APIError.serverFailure
        default:
            throw APIError.unknownError
        }
    }

    func parseData<T: Decodable>(type: T.Type, data: Data) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.failedToDecode
        }
    }
}
