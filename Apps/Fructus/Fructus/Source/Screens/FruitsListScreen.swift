//
//  FruitsListScreen.swift
//  Fructus
//
//  Created by Jaimon, Bibin on 29/04/23.
//

import SwiftUI

struct FruitsListScreen: View {
    @State var isVisibleSetting: Bool = false
    let fruits: [Fruit]
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailsScreen(fruit: fruit)) {
                        FruitCellView(fruit: fruit)
                            .padding(.vertical, 5)
                    }
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                    FAButton(imageName: "slider.horizontal.3", handler: { isVisibleSetting = true })
            )
            .sheet(isPresented: $isVisibleSetting) {
                FASettings()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FruitsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        FruitsListScreen(fruits: getFruitMockData())
            .preferredColorScheme(.dark)
    }
}
