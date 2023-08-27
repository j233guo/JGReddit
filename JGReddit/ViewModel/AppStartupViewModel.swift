//
//  AppStartupViewModel.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import Foundation

class AppStartupViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var accessTokenFailed = false

    func getAccessToken() {
        NetworkManager.shared.obtainAccessToken() { success in
            if success {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.accessTokenFailed = true
                }
            }
        }
    }
}
