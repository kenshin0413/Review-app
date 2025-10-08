//
//  CountView.swift
//  Review-app
//
//  Created by miyamotokenshin on R 7/10/08.
//

import SwiftUI

struct CountView: View {
    @StateObject var viewModel = CountViewModel()
    @State var showModal = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("\(viewModel.count)")
                    .font(.title)
                    .foregroundColor(viewModel.count > 0 ? .green : viewModel.count < 0 ? .red : .black)
                HStack(spacing: 30) {
                    Button {
                        viewModel.minusCount()
                    } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .font(.title)
                    
                    Button {
                        viewModel.plusCount()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    .font(.title)
                }
                
                Button("リセット") {
                    viewModel.reset()
                }
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 330, height: 40)
                .background(Color.blue)
                .cornerRadius(8)
                
                Button("設定") {
                    showModal = true
                }
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 330, height: 40)
                .background(Color.gray)
                .cornerRadius(8)
            }
        }
        .navigationTitle("カウント")
        .navigationBarTitleDisplayMode(.inline)
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {}
        }
        .alert(viewModel.alertResetMessage, isPresented: $viewModel.showResetAlert) {
            Button("Ok", role: .destructive) {
                viewModel.count = 0
            }
            Button("Cancel", role: .cancel) {}
        }
        
        .sheet(isPresented: $showModal) {
            CountSettingView(maxCount: $viewModel.maxCount, minCount: $viewModel.minCount)
        }
    }
}

#Preview {
    CountView()
}

