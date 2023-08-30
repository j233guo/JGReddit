//
//  StartupLoadingView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import SwiftUI

enum StartupStatus {
    case loading, failed
}

struct StartupView: View {
    @EnvironmentObject private var startupViewModel: AppStartupViewModel
    
    let status: StartupStatus
    
    var body: some View {
        if status == .loading {
            VStack {
                ProgressView()
                    .scaleEffect(2)
                    .frame(width: 75, height: 75)
                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
            }
            .padding()
        } else {
            VStack {
                Image(systemName: "exclamationmark.circle")
                    .scaleEffect(3)
                    .foregroundColor(.red)
                    .frame(width: 75, height: 75)
                Text("Failed to obtain Reddit access token")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                Text("Please check Internet connection and credentials")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                Button {
                    startupViewModel.getAccessToken()
                } label: {
                    Label("Retry", systemImage: "arrow.counterclockwise")
                }
                .buttonStyle(.bordered)
                .padding(.top)
            }
            .padding()
        }
    }
}

struct StartupLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView(status: .loading)
            .environmentObject(AppStartupViewModel())
        StartupView(status: .failed)
            .environmentObject(AppStartupViewModel())
    }
}
