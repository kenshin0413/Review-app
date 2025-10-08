//
//  ListView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = FruitViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.fruits) { fruit in
                        Text(fruit.name)
                    }
                    .onDelete(perform: viewModel.remove)
                }
            }
            .navigationTitle("果物リスト")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListView()
}

