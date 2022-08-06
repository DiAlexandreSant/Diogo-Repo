//
//  EnemyHealthBar.swift
//  views
//
//  Created by Diogo Santos on 05/08/2022.
//

import SwiftUI

struct EnemyHealthBar: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 60
    var color1 = Color(#colorLiteral(red: 0.2612338535, green: 0.1718185603, blue: 1, alpha: 1))
    var color2 = Color(#colorLiteral(red: 1, green: 0.7169475999, blue: 0.09180776649, alpha: 1))
    
    
    var body: some View {
        let multiplier = width / 100
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
            .foregroundColor(.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color2, color1]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                )
                .foregroundColor(.clear)
        }
    }
}

struct EnemyHealthBar_Previews: PreviewProvider {
    static var previews: some View {
        EnemyHealthBar()
    }
}
