//
//  FruitNutrientView.swift
//  Fructus
//
//  Created by Tim on 07/06/2021.
//

import SwiftUI

struct FruitNutrientView: View {
    //MARK:- PROPERTIES
    var fruit: Fruit
    let nutrients: [String] = ["Sugar", "Energy", "Fat", "Protein", "Vitamins", "Minerals"]
    
    //MARK:- BODY
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutritional Value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}


//MARK:- PROPERTIES
struct FruitNutrientView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
