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
        } else {
            VStack {
                Image(systemName: "display.trianglebadge.exclamationmark")
                    .scaleEffect(3)
                    .foregroundColor(.red)
                    .frame(width: 75, height: 75)
                Text("Failed to obtain Reddit access token")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
            }
        }
    }
}

struct StartupLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView(status: .loading)
        StartupView(status: .failed)
    }
}
