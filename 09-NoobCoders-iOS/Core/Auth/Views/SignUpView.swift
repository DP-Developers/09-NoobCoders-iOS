//
//  SignUpView.swift
//  09-NoobCoders-iOS
//
//  Created by Prathamesh Araikar on 25/09/22.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var authVm: AuthViewModel = AuthViewModel()
    @AppStorage("currentUserSignIn") var currentUserSignIn: Bool = false
    @AppStorage("userOnLoginScreen") var userOnLoginScreen: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    @State var showPassword: Bool = false
    @State var showEmailAlert: Bool = false
    @State var showPasswordAlert: Bool = false
    @State var emailAlertTitle: String = ""
    @State var passwordAlertTitle: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 0.0) {
                Text("Sign Up")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.accent)
                    .padding()
                    .padding(.bottom, 30)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.theme.secondaryBackground)
                    .frame(width: UIScreen.main.bounds.width/1.15, height: UIScreen.main.bounds.height/1.5)
                    .shadow(radius: 10)
                    .overlay(
                        VStack(alignment: .leading) {
                            HStack(spacing: 20.0) {
                                Image(systemName: "envelope")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.theme.accent)
                                    .padding(.leading, 25)
                                
                                Text("Email")
                                    .foregroundColor(Color.theme.accent)
                                    .font(.title3)
                                    .fontWeight(.light)
                            }
                            .padding(.top, 30)
                            
                            
                            TextField("", text: $email)
                                .placeholder(when: email.isEmpty, placeholder: {
                                    Text("mikasa@gmail")
                                        .foregroundColor(Color.theme.secondaryText)
                                })
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .background(Color.theme.secondaryText.opacity(0.1))
                                .cornerRadius(20)
                                .foregroundColor(Color.theme.accent)
                                .padding()
                                .disableAutocorrection(true)
                                .textInputAutocapitalization(.never)
                            
                            Divider()
                            
                            HStack(spacing: 20.0) {
                                Image(systemName: "lock")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.theme.accent)
                                    .padding(.leading, 25)
                                
                                Text("Password")
                                    .foregroundColor(Color.theme.accent)
                                    .font(.title3)
                                    .fontWeight(.light)
                            }
                            .padding(.top)
                            
                            
                            HStack {
                                if showPassword {
                                    TextField("", text: $password)
                                        .placeholder(when: password.isEmpty, placeholder: {
                                            Text("123456")
                                                .foregroundColor(Color.theme.secondaryText)
                                        })
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .foregroundColor(Color.theme.accent)
                                        .background(Color.theme.secondaryText.opacity(0.1))
                                        .cornerRadius(20)
                                        .padding()
                                        .disableAutocorrection(true)
                                        .textInputAutocapitalization(.never)
                                } else {
                                    SecureField("", text: $password)
                                        .placeholder(when: password.isEmpty, placeholder: {
                                            Text("123456")
                                                .foregroundColor(Color.theme.secondaryText)
                                        })
                                        .frame(height: 55)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal)
                                        .foregroundColor(Color.theme.accent)
                                        .background(Color.theme.accent.opacity(0.1))
                                        .cornerRadius(20)
                                        .padding()
                                        .disableAutocorrection(true)
                                        .textInputAutocapitalization(.never)
                                }
                                
                                Button {
                                    showPassword.toggle()
                                } label: {
                                    Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor( showPassword ? Color.theme.accent : .green)
                                        .frame(width: 30, height: 30)
                                        .padding(.trailing)
                                }
                            }
                            
                            Button {
                                emailAlertTitle = handleEmailAlert()
                                passwordAlertTitle = handlePasswordAlert()
                                if emailAlertTitle == "" && passwordAlertTitle == "" {
                                    handleSignUpButtonPressed()
                                }
                            } label: {
                                Text("Sign Up")
                                    .foregroundColor(Color.theme.accent)
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.theme.darkOrangeColor)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(.horizontal)
                            }
                            .alert(emailAlertTitle, isPresented: $showEmailAlert) {}
                            .alert(passwordAlertTitle, isPresented: $showPasswordAlert) {}
                            .alert(authVm.userAlreadyExistsTitle, isPresented: $authVm.showUserAlreadyExistsAlert) {}
                            
                            Divider()
                            
                            VStack(alignment: .center) {
                                Text("OR")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.theme.accent)
                            }
                            .frame(maxWidth: .infinity)
                            
                            Button {
                                handleLoginButtonPressed()
                            } label: {
                                Text("Login")
                                    .foregroundColor(Color.theme.accent)
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .frame(height: 55)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.theme.lightOrangeColor)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(.horizontal)
                            }
                            Spacer()
                        }
                    )
            }
        }
    }
}

extension SignUpView {
    
    func handleEmailAlert() -> String {
        
        if email.isEmpty {
            showEmailAlert.toggle()
            return "Please enter your email id 😭"
        }
        
        if email.count < 10 {
            showEmailAlert.toggle()
            return "Please enter complete email id 🥺🥺🥺"
        }
        
        if  !email.contains("@") {
            showEmailAlert.toggle()
            return "Invalid email 😢😢😢"
        }
        
        return ""
    }
    
    func handlePasswordAlert() -> String {
        if password.isEmpty {
            showPasswordAlert.toggle()
            return "Please enter a password 😱"
        }
        
        if password.count < 6 {
            showPasswordAlert.toggle()
            return "Password should be atleast 6 characters long 🧐🧐🧐"
        }
        
        return ""
    }
    
    func handleSignUpButtonPressed() {
        authVm.signUp(email: email, password: password)
    }
    
    func handleLoginButtonPressed() {
        withAnimation(.spring()) {
            userOnLoginScreen = true
        }
    }
    
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
