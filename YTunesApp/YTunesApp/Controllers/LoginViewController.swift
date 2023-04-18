//
//  LoginViewController.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 07.04.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let router: MainRouter = Router.shared
    private let logoView = LogoView(title: "Firebase", subTitle: "Sign in to your account")
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordTextField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Sign in", withBackgroundColor: true, fontSize: .big)
    private let createAccButton = CustomButton(title: "Let's create a new account?", fontSize: .medium)
    private let forgotPassButton = CustomButton(title: "Forgot Password?", fontSize: .small)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        view.addSubviews(view: [logoView, emailTextField, passwordTextField, signInButton, createAccButton, forgotPassButton])
        
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        createAccButton.addTarget(self, action: #selector(didTapCreateAccButton), for: .touchUpInside)
        forgotPassButton.addTarget(self, action: #selector(didTapForgotPassButton), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    private func setupUI() {
        self.view.backgroundColor = .systemBackground
    }
    
    @objc private func didTapSignInButton() {
        print("SignIn btn tapped")
    }
    
    @objc private func didTapCreateAccButton() {
        router.showRegistry(from: self)
    }
    
    @objc private func didTapForgotPassButton() {
        router.showForgotPass(from: self)
    }
    
    private func setupConstraints() {
        logoView.snp.makeConstraints { make in
            make.height.width.equalTo(300)
            make.top.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.width.equalTo(300)
            make.top.equalTo(logoView).inset(300)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.width.equalTo(300)
            make.top.equalTo(emailTextField).inset(65)
            make.centerX.equalToSuperview()
        }
        
        signInButton.snp.makeConstraints { make in
            make.width.equalTo(270)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(110)
        }
        
        createAccButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton).inset(50)
            make.centerX.equalToSuperview()
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField).inset(50)
            make.trailing.equalTo(passwordTextField).inset(5)
        }
    }

}

