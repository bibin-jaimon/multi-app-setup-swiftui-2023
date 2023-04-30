//
//  FruitCellView.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import SwiftUI

struct FruitCellView: View {
    
    let fruit: Fruit
    
    var cellBackground: LinearGradient {
        LinearGradient(
            colors: fruit.gradientColors,
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var body: some View {
        HStack {
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(cellBackground)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(fruit.headline)
                    .lineLimit(2)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

struct FruitCellView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCellView(fruit: getFruitMockData()[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
