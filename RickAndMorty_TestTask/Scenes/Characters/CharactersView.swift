//
//  CharactersView.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import SwiftUI

struct CharactersView: View {
    
    @ObservedObject private var viewModel = CharactersViewModel()
    
    @State private var isSelected = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(characters) { character in
                        CharacterCell(character: character)
                    }
                    
                    if viewModel.characterListFull == false {
                        ProgressView()
                        .onAppear {
                            viewModel.getCharactersList()
                        }
                    }
                }
                .searchable(text: $viewModel.searchText)
            }
            .navigationTitle(isSelected ? "Favorites" : "Characters")
            .toolbar {
                Button {
                    isSelected.toggle()
                } label: {
                    Image(systemName: isSelected ? "star.fill" : "star")
                        .padding()
                }
            }
        }
    }
    
    var characters: [Character] {
        if viewModel.filteredCharacters.isEmpty {
            return viewModel.characters
        } else {
            return viewModel.filteredCharacters
        }
    }
    
    
    
}

#if DEBUG
struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
#endif