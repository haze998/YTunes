//
//  AuthManager.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 19.04.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthManager {
    
    static let shared = AuthManager()
    
    private init() { }
    
    public func registerUser(with userInfo: RegisterUserInfo, completion: @escaping (Bool, Error?) -> Void) {
        let userName = userInfo.userName
        let email = userInfo.email
        let password = userInfo.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let userResult = result?.user else {
                completion(false, nil)
                return
            }
            
            let dataBase = Firestore.firestore()
            dataBase.collection("users")
                .document(userResult.uid)
                .setData([
                    "userName" : userName,
                    "email" : email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
        }
    }
    
    public func signInUser(with userRequest: LoginUserInfo, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(
            withEmail: userRequest.email,
            password: userRequest.password
        ) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOutUser(complition: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            complition(nil)
        } catch let error {
            complition(error)
        }
    }
}
