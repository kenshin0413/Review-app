//
//  ApiView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/11.
//

import SwiftUI

struct ApiView: View {
    @StateObject var viewModel = ApiViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.userInfo) { info in
                        Text("UserID：\(info.userId)")
                        Text("ID：\(info.id)")
                        Text("title：\(info.title)")
                        Text("body：\(info.body)")
                    }
                }
                .task {
                    await viewModel.getData()
                }
            }
            .navigationTitle("APIリスト")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ApiView()
}
