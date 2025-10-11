//
//  Item.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import Foundation

struct Item: Identifiable, Encodable, Decodable {
    var id = UUID()
    var name: String
    var date: Date
}

enum SortOption: String, CaseIterable {
    case new = "新しい順"
    case old = "古い順"
}
