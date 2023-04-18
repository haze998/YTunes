//
//  MainRouter.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 18.04.2023.
//

import Foundation
import UIKit

protocol MainRouter {
    func showLogin(from viewController: UIViewController)
    func showRegistry(from viewController: UIViewController)
    func showForgotPass(from viewController: UIViewController)
}

extension Router: MainRouter {
    func showLogin(from viewController: UIViewController) {
        // TODO
    }
    
    func showRegistry(from viewController: UIViewController) {
        let vc = RegistryViewController()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showForgotPass(from viewController: UIViewController) {
        let vc = ForgotPasswordViewController()
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
