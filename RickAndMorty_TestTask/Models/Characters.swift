//
//  Characters.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct CharacterLocation: Codable {
    let name: String
    let url: String
}

struct CharacterList: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
