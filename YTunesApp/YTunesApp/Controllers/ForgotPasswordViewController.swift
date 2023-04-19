//
//  ForgotPasswordViewController.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 18.04.2023.
//

import UIKit
import SnapKit

class ForgotPasswordViewController: UIViewController {

    private let logoView = LogoView(title: "Firebase", subTitle: "Reset password")
    private let emailTextField = CustomTextField(fieldType: .email)
    private let resetPasswordButton = CustomButton(title: "Reset password", withBackgroundColor: true, fontSize: .big)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.view.addSubviews(view: [logoView, emailTextField, resetPasswordButton])
        
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonDidTap), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupConstraints()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
    }
    
    @objc private func resetPasswordButtonDidTap() {
        let email = emailTextField.text ?? ""
        
        if !Validator.isValidEmail(email: email) {
            AlertManager.preventInvalidEmail(on: self)
            return
        }
        
        AuthManager.shared.forgotPassword(with: email) { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showResetPasswordAlert(on: self, with: error)
                return
            }
            
            AlertManager.showPasswordResetAlert(on: self)
        }
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
        
        resetPasswordButton.snp.makeConstraints { make in
            make.width.equalTo(270)
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField).inset(85)
        }
    }
}
