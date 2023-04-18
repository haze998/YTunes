//
//  RegistryViewController.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 18.04.2023.
//

import UIKit
import SnapKit

class RegistryViewController: UIViewController {

    private let logoView = LogoView(title: "Firebase", subTitle: "Register your account")
    private let userNameTextField = CustomTextField(fieldType: .username)
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordTextField = CustomTextField(fieldType: .password)
    private let registerButton = CustomButton(title: "Register", withBackgroundColor: true, fontSize: .big)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.view.addSubviews(view: [logoView, userNameTextField, emailTextField, passwordTextField, registerButton])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
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
            make.top.equalTo(passwordTextField).inset(95)
        }
    }

    
}
