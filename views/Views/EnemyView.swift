//
//  EnemyView.swift
//  views
//
//  Created by Diogo Santos on 03/08/2022.
//

import SwiftUI

struct EnemyView: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    let ran = Int.random(in: 1..<151)
    let newid = 0
    let newname = ""
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(ran).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
                    
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)

        }
    }
}

struct EnemyView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
