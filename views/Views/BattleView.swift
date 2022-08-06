//
//  BattleView.swift
//  views
//
//  Created by Diogo Santos on 01/08/2022.
//

import SwiftUI

struct BattleView: View {
    @State var percentEnemy: CGFloat = 100
    @State var percentAlly: CGFloat = 100
    @EnvironmentObject var vm: ViewModel
    let pokemon: Pokemon
    let enemyAttack = Int.random(in: 1..<200)
    let allyAttack = Int.random(in: 1..<100)
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                EnemyHealthBar(percent:percentEnemy, color1: Color(.green), color2: Color(.red))
                    .animation(.linear)
                Text("\(Int(percentEnemy))%")
                    .font(.system(size: 29, weight: .bold))
                Spacer()
                PokemonView(pokemon: pokemon)
                Button("Normal Attack")
                {
                    if percentAlly > 0 {
                        if  allyAttack <= 50 {
                            percentEnemy = percentEnemy - 15
                        } else {
                            percentEnemy -= 35
                        }
                        
                        
                    }
                    //Enemy Attacks
                    //Normal
                    if(enemyAttack <= 50 && percentEnemy > 0){
                        percentAlly -= 15
                    }
                    //Special
                    if(enemyAttack > 50 && enemyAttack <= 100 && percentEnemy > 0){
                        percentAlly -= 40
                    }
                    //normal Critical
                    if(enemyAttack > 100 && enemyAttack <= 150 && percentEnemy > 0){
                        percentAlly -= 30
                    }
                    //Special Critical
                    if(enemyAttack > 150 && enemyAttack <= 200 && percentEnemy > 0){
                        percentAlly -= 80
                    }
                    
                    //Health Reaches 0 does not become negative
                    if(percentAlly < 0){
                        percentAlly = 0
                    }
                    
                    if(percentEnemy < 0){
                        percentEnemy = 0
                    }
                }.frame(width: 200, height: 200)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    .foregroundColor(Color.white)
                    .font(.title)
            }
            VStack(alignment: .leading) {
                EnemyView(pokemon: pokemon)
                Spacer()
                HealthBarView(percent: percentAlly, color1: Color(.green), color2: Color(.red))
                    .animation(.linear)
                Text ("\(Int(percentAlly))%")
                    .font(.system(size: 29, weight: .bold))
                Button("Special Attack")
                {
                    if percentAlly > 0 {
                    if  allyAttack <= 50 {
                        percentEnemy = percentEnemy - 40
                    } else {
                        percentEnemy -= 80
                    }
                    
                    
                }
                //Enemy Attacks
                //Normal
                if(enemyAttack <= 50 && percentEnemy > 0){
                    percentAlly -= 15
                }
                //Special
                if(enemyAttack > 50 && enemyAttack <= 100 && percentEnemy > 0){
                    percentAlly -= 40
                }
                //normal Critical
                if(enemyAttack > 100 && enemyAttack <= 150 && percentEnemy > 0){
                    percentAlly -= 30
                }
                //Special Critical
                if(enemyAttack > 150 && enemyAttack <= 200 && percentEnemy > 0){
                    percentAlly -= 80
                }
                
                //Health Reaches 0 does not become negative
                if(percentAlly < 0){
                    percentAlly = 0
                }
                
                if(percentEnemy < 0){
                    percentEnemy = 0
                }
                }.frame(width: 200, height: 200)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    .foregroundColor(Color.white)
                    .font(.title)
            }
            Spacer()
        }
    }
}

struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
        
    }
}
