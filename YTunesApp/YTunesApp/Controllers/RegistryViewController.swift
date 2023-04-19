//
//  RegistryViewController.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 18.04.2023.
//

import UIKit
import SnapKit

class RegistryViewController: UIViewController {

    private let router: MainRouter = Router.shared
    private let logoView = LogoView(title: "Firebase", subTitle: "Create new account")
    private let userNameTextField = CustomTextField(fieldType: .username)
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordTextField = CustomTextField(fieldType: .password)
    private let registerButton = CustomButton(title: "Register", withBackgroundColor: true, fontSize: .big)
    private let switchAccountButton = CustomButton(title: "Do you have an account? Sign in", fontSize: .medium)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.view.addSubviews(view: [logoView, userNameTextField, emailTextField, passwordTextField, registerButton, switchAccountButton])
        
        registerButton.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        switchAccountButton.addTarget(self, action: #selector(switchAccountButtonDidTap), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
    }
    
    @objc private func registerButtonDidTap() {
        let registerUser = RegisterUserInfo(
            userName: userNameTextField.text ?? "",
            email: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
        
        // check username
        if !Validator.isValidUserName(userName: registerUser.userName) {
            AlertManager.preventInvaliUserName(on: self)
            return
        }
        
        // check email
        if !Validator.isValidEmail(email: registerUser.email) {
            AlertManager.preventInvalidEmail(on: self)
            return
        }
        
        // check password
//        if !Validator.isPasswordValid(password: registerUser.password) {
//            AlertManager.preventInvalidPassword(on: self)
//            return
//        }
        
        AuthManager.shared.registerUser(with: registerUser) { [weak self] wasRegistered, error in
            guard let self = self else { return}
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthenfication()
                }
            }
        }
    }
    
    @objc private func switchAccountButtonDidTap() {
        router.showLogin(from: self)
    }
    
    private func setupConstraints() {
        logoView.snp.makeConstraints { make in
            make.height.width.equalTo(300)
            make.top.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        userNameTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.width.equalTo(300)
            make.top.equalTo(logoView).inset(300)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.width.equalTo(300)
            make.top.equalTo(userNameTextField).inset(65)
            make.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.width.equalTo(300)
            make.top.equalTo(emailTextField).inset(65)
            make.centerX.equalToSuperview()
        }
        
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(270)
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(85)
        }
        
        switchAccountButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton).inset(50)
            make.centerX.equalToSuperview()
        }
    }

    
}
