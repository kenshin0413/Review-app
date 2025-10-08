import func SwiftUI.__designTimeFloat
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeInteger
import func SwiftUI.__designTimeBoolean

#sourceLocation(file: "/Users/kenshin/Desktop/Review-app/Review-app/Review-app/ContentView.swift", line: 1)
//
//  ContentView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: __designTimeString("#42626_0", fallback: "globe"))
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(__designTimeString("#42626_1", fallback: "Hello, world!"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
