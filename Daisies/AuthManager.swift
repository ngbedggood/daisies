//
//  AuthManager.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 14/01/2025.
//

import Foundation
import FirebaseAuth

@Observable

class AuthManager {
    
    var isSignedIn: Bool = false
    var email: String = ""
    var password: String = ""
    
    func signUp() async throws {
        do {
            let _ = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Signed up successfully?")
        } catch {
            print("Sign up error: \(error.localizedDescription)")
        }
    }
    
    func logIn() async throws {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print("\(authResult.user) has logged in!")
            isSignedIn = true
        } catch {
            print("Log in error: \(error.localizedDescription)")
        }
    }
    
}
