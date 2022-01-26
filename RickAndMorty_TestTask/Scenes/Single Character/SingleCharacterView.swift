//
//  SingleCharacterView.swift
//  RickAndMorty_TestTask
//
//  Created by Sasha Riabchuk on 23.01.2022.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct SingleCharacterView: View {
    
    var character: Character
    @ObservedObject private var viewModel = SingleCharacterViewModel()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    WebImage(url: URL(string: character.image))
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(.gray)
                        }
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    HStack {
                        Text("Name")
                            .fontWeight(.light)
                        Spacer()
                        Button(action: {
                            if FavoritesService.shared.contains(character) {
                                FavoritesService.shared.remove(character)
                            } else {
                                FavoritesService.shared.add(character)
                            }
                        }) {
                            HStack {
                                Image(systemName: FavoritesService.shared.contains(character) ? "heart.fill" : "heart")
                            }
                        }
                    }
                    Spacer()
                    HStack {
                        Text(character.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .fixedSize(horizontal: false, vertical: true)
            
            Divider()
            VStack(alignment: .leading) {
                Group {
                    DetailTextCell(detailTitle: "Status", character: character.status)
                    DetailTextCell(detailTitle: "Species", character: character.species)
                    DetailTextCell(detailTitle: "Type", character: character.type)
                    DetailTextCell(detailTitle: "Gender", character: character.gender)
                    DetailTextCell(detailTitle: "Origin", character: character.origin.name)
                    DetailTextCell(detailTitle: "Location", character: character.location.name)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            }
        }
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
        .padding()
    }
}

struct DetailTextCell: View {
    var detailTitle: String
    var character: String
    
    var body: some View {
        HStack {
            Text(detailTitle)
                .frame(maxWidth: .infinity)
            Text(character)
                .fontWeight(.black)
                .frame(maxWidth: .infinity)
        }
    }
}

#if DEBUG
struct SingleCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCharacterView(character:
                                Character(id: 1,
                                          name: "Rick",
                                          status: "alive",
                                          species: "species",
                                          type: "type",
                                          gender: "gender",
                                          origin: Origin(name: "OriginName", url: "OriginURL"),
                                          location: CharacterLocation(name: "LocationName", url: "LocationURL"),
                                          image: "image",
                                          episode: ["episode"],
                                          url: "url",
                                          created:"created")
        )
    }
}
#endif
