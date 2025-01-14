//
//  LoginView.swift
//  Daisies
//
//  Created by Nathaniel Bedggood on 13/01/2025.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(AuthManager.self) private var am
    
    @State private var showPassword: Bool = false
    @State private var isSignUp: Bool = true
    
    func authenticate() {
        Task {
            await isSignUp ? try am.signUp() : try am.logIn()
        }
    }
    /*
    func signUp() {
        Task {
            do {
                try await am.signUp()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func logIn() {
        Task {
            do {
                try await am.logIn()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    */
    var body: some View {
        //This can be done too
        //@Bindable var am = am
        
        VStack {
            Spacer()
            Text("Daisies")
                .padding(.bottom, 30)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundStyle(.brown)

            TextField("Email", text: Bindable(am).email)
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
                    TextField("Password", text: Bindable(am).password)
                        .autocorrectionDisabled()
                        .frame(height: 22)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.inputBorder, lineWidth: 2)
                        )
                } else {
                    SecureField("Password", text: Bindable(am).password)
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
            VStack {
                Button(action: {
                    authenticate()
                }, label: {
                    Text("\(isSignUp ? "Sign Up" : "Log In")")
                })
                .buttonStyle(.borderedProminent)
                
                Button(action: {
                    isSignUp.toggle()
                }, label: {
                    Text("\(isSignUp ? "I already have an account" : "I don't have an account")")
                })
                .padding(.top, 20)
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
