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
        VStack {
            HStack {
                Text("上限値：")
                Stepper(value: $maxCount, step: 1) {
                    Text("\(maxCount)")
                }
            }
            
            HStack {
                Text("下限値：")
                Stepper(value: $minCount, step: 1) {
                    Text("\(minCount)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    CountSettingView(maxCount: .constant(0), minCount: .constant(0))
}

