//
//  HomeViewController.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 19.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        AuthManager.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserAlert(on: self, with: error)
            }
        }
    }

    private func setupUI() {
        self.view.backgroundColor = .green
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonDidTap))
    }
    
    @objc private func logoutButtonDidTap() {
        AuthManager.shared.signOutUser { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthenfication()
            }
        }
    }
}
