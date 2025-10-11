//
//  ListViewModel.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject {
    @Published var items = [Item(name: "スイカ", date: Date()), Item(name: "キウイ", date: Date())]
    @Published var addItem = ""
    @Published var searchItem = ""
    @Published var sortOption: SortOption = .new
    func remove(index: IndexSet) {
        items.remove(atOffsets: index)
        Task {
            await saveItems()
        }
    }
    
    func addList(name: String) {
        items.append(Item(name: name, date: Date()))
        Task {
            await saveItems()
        }
    }
    
    var searchFilterAndSortItem: [Item] {
        let filtered: [Item]
        
        if searchItem.isEmpty {
            filtered = items
        } else {
            filtered = items.filter { item in
                item.name.contains(searchItem)
            }
        }
        
        switch sortOption {
        case .new:
            return filtered.sorted { $0.date > $1.date }
        case .old:
            return filtered.sorted { $0.date < $1.date }
        }
    }
    
    func saveItems() async {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let data = try JSONEncoder().encode(items)
            let url = URL.documentsDirectory.appendingPathComponent("items.json")
            try data.write(to: url)
            print("保存完了：\(url.lastPathComponent)")
        } catch {
            print("保存エラー：\(error)")
        }
    }
    
    func loadItems() async {
        do {
            let url = URL.documentsDirectory.appendingPathComponent("items.json")
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Item].self, from: data)
            items = decoded
            print("読み込み完了：\(decoded.count)件")
        } catch {
            print("読み込みエラー：\(error)")
        }
    }
}
