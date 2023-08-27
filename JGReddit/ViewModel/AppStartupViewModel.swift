//
//  AppStartupViewModel.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import Foundation

class AppStartupViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var accessTokenFailed = false

    func getAccessToken() {
        isLoading = true
        NetworkManager.shared.obtainAccessToken() { [weak self] success in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                DispatchQueue.main.async {
                    guard let self = self else { return } // Ensure self is still valid
                    self.isLoading = false
                    self.accessTokenFailed = !success
                }
            }
        }
    }
}
