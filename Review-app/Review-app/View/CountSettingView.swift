//
//  CountSettingView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct CountSettingView: View {
    @Binding var maxCount: Int
    @Binding var minCount: Int
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("上限値：")
                    Stepper(value: $maxCount, step: 1) {
                        Text("\(maxCount)")
                            .foregroundColor(maxCount > 0 ? .green : maxCount < 0 ? .red : .black)
                    }
                }
                
                HStack {
                    Text("下限値：")
                    Stepper(value: $minCount, step: 1) {
                        Text("\(minCount)")
                            .foregroundColor(minCount < 0 ? .red : minCount > 0 ? .green : .black)
                    }
                }
            }
            .navigationTitle("カウント設定")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

#Preview {
    CountSettingView(maxCount: .constant(0), minCount: .constant(0))
}

