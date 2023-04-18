//
//  CustomTextField.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 07.04.2023.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case username
        case email
        case password
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 15
        tintColor = .orange
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.size.height))
        
        switch fieldType {
        case .username:
            placeholder = "Username"
        case .email:
            placeholder = "Email adress"
            keyboardType = .emailAddress
            textContentType = .emailAddress
        case .password:
            placeholder = "Password"
            textContentType = .oneTimeCode
            isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
