//
//  ListViewModel.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items = [Item(name: "スイカ"), Item(name: "キウイ")]
    @Published var addItem = ""
    
    func remove(index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func addList(name: String) {
        items.append(Item(name: name))
    }
}
