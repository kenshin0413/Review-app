//
//  ListViewModel.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import Foundation

class FruitViewModel: ObservableObject {
    @Published var fruits = [Fruit(name: "スイカ"), Fruit(name: "キウイ")]
    
    func remove(index: IndexSet) {
        fruits.remove(atOffsets: index)
    }
}
