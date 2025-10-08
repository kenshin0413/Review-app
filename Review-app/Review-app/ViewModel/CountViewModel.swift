//
//  CountViewModel.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import Foundation

class CountViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var maxCount: Int = 0
    @Published var minCount: Int = 0
    @Published var showAlert = false
    @Published var alertMessage = ""
    func plusCount() {
        if count < maxCount {
            count += 1
        } else if count == maxCount {
            showAlert = true
            alertMessage = "上限値に達しました。"
        }
    }
    
    func minusCount() {
        if count > minCount {
            count -= 1
        } else if count == minCount {
            showAlert = true
            alertMessage = "下限値に達しました。"
        }
    }
}
