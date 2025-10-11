//
//  ListView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewModel()
    @State var showModal = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    TextField("検索アイテム", text: $viewModel.searchItem)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Picker("並び替え", selection: $viewModel.sortOption) {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    
                    List {
                        ForEach(viewModel.searchFilterAndSortItem) { item in
                            Text(item.name)
                        }
                        .onDelete(perform: viewModel.remove)
                    }
                }
                Button {
                    showModal = true
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 50, height: 50)
                        .background(Color.gray)
                        .clipShape(.circle)
                        .foregroundColor(.white)
                }
                .padding(30)
            }
            .navigationTitle("果物リスト")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showModal) {
                AddListView(viewModel: viewModel)
            }
            .task {
                await viewModel.loadItems()
            }
        }
    }
}

#Preview {
    ListView()
}

