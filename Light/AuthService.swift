//
//  AuthService.swift
//  Light
//
//  Created by Kemar Galloway on 7/29/19.
//  Copyright © 2019 Kemar Galloway. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class AuthService {
    
//    static var shared = AuthService()
    
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        print("sign in")
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        })
    }
    
    static func signUp(username: String, email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        print("sign up")
        Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            let uid = user?.user.uid as String?
            self.setUserInformation(username: username, email: email, uid: uid!, onSuccess: onSuccess)

//            print("description: \(newUserReference.description())")
            
        })
    }
    
    static func setUserInformation(username: String, email: String, uid: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let usersReference = ref.child("users")
//        let uid = user?.user.uid as String?
        let newUserReference = usersReference.child(uid)
        newUserReference.setValue(["username": username, "email": email])
        onSuccess()
    }
}
