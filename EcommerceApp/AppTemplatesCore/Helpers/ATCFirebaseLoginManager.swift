//
//  ATCFirebaseLoginManager.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/6/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import FirebaseAuth

public class ATCFirebaseLoginManager {
    static func login(credential: AuthCredential, completionBlock: @escaping (_ user: ATCUser?) -> Void) {
        Auth.auth().signInAndRetrieveData(with: credential) { (result, error) in
            completionBlock(ATCFirebaseLoginManager.atcUser(for: result?.user))
        }
    }

    static func signIn(email: String, pass: String, completionBlock: @escaping (_ user: ATCUser?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let errCode = AuthErrorCode(rawValue: error._code) {
                switch errCode {
                case .userNotFound:
                    Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
                        if error == nil {
                            ATCFirebaseLoginManager.signIn(email: email, pass: pass, completionBlock:completionBlock)
                        }
                    }
                default:
                    return
                }
            } else {
                completionBlock(ATCFirebaseLoginManager.atcUser(for: result?.user))
            }
        }
    }

    static func atcUser(for firebaseUser: User?) -> ATCUser? {
        guard let fUser = firebaseUser else { return nil }
        return ATCUser(uid: fUser.uid, firstName: fUser.displayName ?? "", lastName: "", avatarURL: fUser.photoURL?.absoluteString ?? "", email: fUser.email ?? "")
    }
}
