//
//  LoginView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 13/01/2025.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var showPassword: Bool = false
    
    
    func signUpUser() {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { authResult, error in
            if let error = error {
                print("Sign up error: \(error.localizedDescription)")
                return
            }
            print("Signed up successfully?")
        }
    }
    
    func loginUser() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { authResult, error in
            if let error = error {
                print("Log in error: \(error.localizedDescription)")
                return
            }
                print("\(authResult?.user) has logged in!")
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Daisies")
                .padding(.bottom, 30)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundStyle(.brown)

            TextField("Email", text: $userEmail)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .frame(height: 22)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.inputBorder, lineWidth: 2)
                )
            HStack {
                if (showPassword) {
                    TextField("Password", text: $userPassword)
                        .autocorrectionDisabled()
                        .frame(height: 22)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.inputBorder, lineWidth: 2)
                        )
                } else {
                    SecureField("Password", text: $userPassword)
                        .autocorrectionDisabled()
                        .frame(height: 22)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.inputBorder, lineWidth: 2)
                        )
                }
                Button(action: {
                    showPassword.toggle()
                }, label: {
                    Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                        .frame(height: 29)
                })
                .buttonStyle(.borderedProminent)
                //.border(.black)
                
            }
            Spacer()
            HStack {
                Button(action: {
                    signUpUser()
                }, label: {
                    Text("Sign Up")
                })
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                
                Button(action: {
                    loginUser()
                }, label: {
                    Text("Login")
                })
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .padding([.leading, .trailing], 10)
        //.background(Color.background)
    }
}

#Preview {
    LoginView()
}
