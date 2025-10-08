//
//  HomeView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ListView()
            }
            .tabItem {
                Label("リスト", systemImage: "eraser")
            }
            .tag(1)
            
            NavigationStack {
                CountView()
            }
            .tabItem {
                Label("数字", systemImage: "pencil")
            }
            .tag(2)
        }
    }
}

#Preview {
    HomeView()
}
