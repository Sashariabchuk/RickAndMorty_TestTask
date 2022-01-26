//
//  UserDefaultService.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 25.01.2022.
//

import Foundation

class FavoritesService {
    
    static var shared = FavoritesService()
    
    var favorites: Set<String> = []
    let defaults = UserDefaults.standard

    init() {        
        self.favorites = Set(defaults.array(forKey: "Favorites") as? [String] ?? [])
    }

    func getTaskIds() -> Set<String> {
        return self.favorites
    }

    func contains(_ character: Character) -> Bool {
        favorites.contains("\(character.id)")
    }

    func add(_ character: Character) {
        favorites.insert("\(character.id)")
        save()
    }

    func remove(_ character: Character) {
        favorites.remove("\(character.id)")
        save()
    }

    func save() {
        self.defaults.set(Array(self.favorites), forKey: "Favorites")
        defaults.synchronize()
    }
}
