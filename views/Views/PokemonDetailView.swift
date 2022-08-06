//
//  PokemonDetailView.swift
//  views
//
//  Created by Diogo Santos on 31/07/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var selector = false
    let pokemon: Pokemon
    
    
    var body: some View {
        NavigationView{
            
        }
        VStack {
            PokemonView(pokemon: pokemon)
            Button ("Select Pokemon") {
                selector.toggle()
            }
            
            if selector {
                Text("Pokemon Selected")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            }
            
            VStack(spacing: 10) {
                Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                
            }
            .padding()
            
            NavigationLink ("Start Battle".capitalized, destination: BattleView( pokemon: pokemon))
            .padding()
            .background(Color(red:0.2, green: 0.7, blue: 0.2))
            .clipShape(Capsule())
            .foregroundColor(.white)
            .font(.largeTitle)
        }
        .onAppear {
            vm.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
