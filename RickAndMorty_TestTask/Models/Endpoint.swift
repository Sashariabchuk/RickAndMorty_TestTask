//
//  Constants.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 24.01.2022.
//

import Foundation


struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    static func getCharacters(name: String, page: Int) -> Self {
        Endpoint(
            path: "api/character/",
            queryItems: [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "name", value: name)
            ]
        )
    }
}
