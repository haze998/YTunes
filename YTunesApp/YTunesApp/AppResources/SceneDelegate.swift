//
//  SceneDelegate.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 07.04.2023.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.checkAuthenfication()
    }
    
    private func setupWindow(with scene: UIScene ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    public func checkAuthenfication() {
        if Auth.auth().currentUser == nil {
            // Go to Login In screen
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        } else {
            // Go to Home screnn
            let vc = HomeViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = nav
        }
    }
    
//    private func goToController(with viewController: UIViewController) {
//        DispatchQueue.main.async { [weak self] in
//            UIView.animate(withDuration: 0.25) {
//                self?.window?.layer.opacity = 0
//            } completion: { [weak self] _ in
//                let nav = UINavigationController(rootViewController: viewController)
//                nav.modalPresentationStyle = .fullScreen
//                self?.window?.rootViewController = nav
//            }
//
//        }
//    }
}

