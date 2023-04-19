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
    
    public func signOutUser(completion: @escaping (Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    public func forgotPassword(with email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            completion(error)
        }
    }
    
    public func fetchUser(completion: @escaping(User?, Error? ) -> Void) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userUID)
            .getDocument { snapShot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let snapShot = snapShot,
                   let snapShotData = snapShot.data(),
                   let userName = snapShotData["username"] as? String,
                   let email = snapShotData["email"] as? String {
                    let user = User(userName: userName, email: email, userUID: userUID)
                    completion(user, nil)
                }
            }
    }
    
}
