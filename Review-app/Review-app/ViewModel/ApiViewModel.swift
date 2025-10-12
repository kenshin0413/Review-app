//
//  ApiViewModel.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/11.
//

import Foundation

class ApiViewModel: ObservableObject {
    @Published var userInfo: [UserInfo] = []
    @Published var errorMessage = ""
    @Published var showErrorAlert = false
    func getData() async {
        do {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([UserInfo].self, from: data)
            userInfo = decoded
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }
}
