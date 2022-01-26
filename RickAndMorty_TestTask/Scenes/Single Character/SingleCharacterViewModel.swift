//
//  SingleCharacterViewModel.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 25.01.2022.
//

import Foundation
import Combine

public class SingleCharacterViewModel: ObservableObject {
    
    @Published private (set) var favoritesArray: Set<String> = []
    
    
    var cancellable =  Set<AnyCancellable>()
    

}
