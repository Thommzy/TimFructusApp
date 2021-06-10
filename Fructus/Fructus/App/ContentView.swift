//
//  ContentView.swift
//  Fructus
//
//  Created by Tim on 22/02/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK:-  PROPERTIES
    @State private var isShowingSettingsView: Bool = false
    var fruits: [Fruit] = fruitsData
    
    // MARK:-  BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)) {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    }
                }
            }.navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettingsView = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            }))
            .sheet(isPresented: $isShowingSettingsView, content: {
                SettingsView()
            })
        } // MARK:- Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK:-  PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            .previewDevice("iPhone 11 Pro")
    }
}
