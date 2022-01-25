//
//  CharactersViewModel.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import Foundation
import Combine

public class CharactersViewModel: ObservableObject {
    
    @Published private (set) var characters: [Character] = []
    @Published var searchText = ""
    
    var characterListFull = false
    var currentPage = 1
    var maxItemPerPage = 20
    
    var cancellable =  Set<AnyCancellable>()
    
    init() {
//        $searchText
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .removeDuplicates()
//            .sink(receiveValue: { (text: String) in
//                if !text.isEmpty && text.count > 3 {
//                    self.getCharacters(for: text)
//                }
//            })
//            .store(in: &cancellable)
    }
    
    func getCharactersList() {
        let endpoint = Endpoint.getCharacters(name: searchText, page: currentPage)
        
        request(endpoint)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: {
                self.currentPage += 1
                self.characters.append(contentsOf: $0.results)
                if $0.results.count < self.maxItemPerPage {
                    self.characterListFull = true
                }
            })
            .store(in: &cancellable)
    }
    
//    func getCharacters(for name: String = "") {
//        let endpoint = Endpoint.getCharacters(name: searchText, page: currentPage)
//
//        request(endpoint)
//            .mapError({ (error) -> Error in
//                print(error)
//                return error
//            })
//            .sink(receiveCompletion: { _ in }, receiveValue: {
//                self.currentPage += 1
//                if $0.results.count < self.maxItemPerPage {
//                    self.characterListFull = true
//                }
//            })
//            .store(in: &cancellable)
//    }
    
    func request(_ endpoint: Endpoint) -> AnyPublisher<CharacterList, Error> {

        let request = URLRequest(url: endpoint.url)
        
        return APIClient.fetch(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
