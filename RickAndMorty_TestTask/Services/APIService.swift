//
//  APIService.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import Foundation
import Combine

struct Response<T> {
    let value: T
    let response: URLResponse
}

class APIClient {
    static func fetch<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
