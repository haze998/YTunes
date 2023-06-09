//
//  Validator.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 19.04.2023.
//

import Foundation

class Validator {
    
    static func isValidEmail(email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    static func isValidUserName(userName: String) -> Bool {
        let userName = userName.trimmingCharacters(in: .whitespacesAndNewlines)
        let userNameRegEx = "\\w{4,24}"
        let userNamePredicate = NSPredicate(format: "SELF MATCHES %@", userNameRegEx )
        return userNamePredicate.evaluate(with: userName)
    }
    
    static func isPasswordValid(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
//        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$#!%*?&]).{6,32}$"
        let passwordRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.{1}[A-Za-z]{2,64}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }}
