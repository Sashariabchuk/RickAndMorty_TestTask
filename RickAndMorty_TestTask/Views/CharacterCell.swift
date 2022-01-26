//
//  SingleCharacterView.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CharacterCell: View {
    
    var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: character.image))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(character.name)
                        .font(.title3)
                        .multilineTextAlignment(.leading)

                    Image(systemName: FavoritesService.shared.contains(character) ? "heart.fill" : "heart")
                }
                
                HStack {
                    Text(character.status)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#if DEBUG
struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: Character(id: 1, name: "Rick", status: "alive", species: "species", type: "type", gender: "gender", origin: Origin(name: "nameOrigin", url: "urlOrigin"), location: CharacterLocation(name: "fdf", url: "fdf"), image: "image", episode: ["episode"], url: "url", created: "created"))
    }
}
#endif
