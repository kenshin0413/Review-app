//
//  AddListView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct AddListView: View {
    @ObservedObject var viewModel = ListViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("追加するアイテムを入力", text: $viewModel.addItem)
                    .textFieldStyle(.roundedBorder)
                
                Button("追加する") {
                    viewModel.addList(name: viewModel.addItem)
                    dismiss()
                }
                // addItemが空だったらボタンを押せない
                .disabled(viewModel.addItem.isEmpty)
            }
            .padding()
        }
    }
}

#Preview {
    AddListView()
}
