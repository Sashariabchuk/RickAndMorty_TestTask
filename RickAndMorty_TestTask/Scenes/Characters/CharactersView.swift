//
//  CharactersView.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject private var viewModel = CharactersViewModel()
    @State private var showFavoritesOnly = false
    
    private var characters: [Character] {
        if viewModel.searchText.isEmpty {
            return viewModel.characters
        } else {
            return viewModel.characters.filter { $0.name.contains(viewModel.searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(characters) { character in
                        if showFavoritesOnly {
                            if FavoritesService.shared.contains(character) {
                                NavigationLink {
                                    SingleCharacterView(character: character)
                                } label: {
                                    CharacterCell(character: character)
                                }
                            }
                        } else {
                            NavigationLink {
                                SingleCharacterView(character: character)
                            } label: {
                                CharacterCell(character: character)
                            }
                        }
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
            .navigationTitle(showFavoritesOnly ? "Favorites" : "Characters")
            .toolbar {
                Button {
                    showFavoritesOnly.toggle()
                } label: {
                    Image(systemName: showFavoritesOnly ? "star.fill" : "star")
                        .padding()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#if DEBUG
struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
#endif
