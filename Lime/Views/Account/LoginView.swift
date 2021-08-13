//
//  LoginView.swift
//  LoginView
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI
import FontAwesomeSwiftUI
import Firebase
import SPAlert

struct LoginView: View {
    @EnvironmentObject var appModel: AppViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signup_visible = false
    
    @State private var isEmailValid : Bool   = true
    var body: some View {
        NavigationView{
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 0){
                        VStack{
                            Spacer().frame(height: UIScreen.main.bounds.height < 600 ? 20 : 50)
                            HStack {
                                Text("Login with one of the following options.")
                                Spacer()
                            }
                            HStack{
                                Button(action: {}, label: {
                                    Text(AwesomeIcon.google.rawValue)
                                        .font(.awesome(style: .brand, size: 35))
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(minWidth: 20, maxWidth: .infinity)
                                })
                                    .background(Color(red: 23 / 255, green: 23 / 255, blue: 23 / 255, opacity: 1))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255), lineWidth: 4))
                                    .padding(20)
                                Button(action: {}, label: {
                                    Text(AwesomeIcon.apple.rawValue)
                                        .font(.awesome(style: .brand, size: 35))
                                        .foregroundColor(Color.white)
                                        .padding()
                                        .frame(minWidth: 20, maxWidth: .infinity)
                                })
                                    .background(Color(red: 23 / 255, green: 23 / 255, blue: 23 / 255, opacity: 1))
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255), lineWidth: 4))
                                    .padding(20)
                            }
                            Spacer().frame(height: 50)
                            VStack{
                                HStack{
                                    Text("Email")
                                    Spacer()
                                }
                                TextField("john@example.com", text: $email, onEditingChanged: { (isChanged) in
                                    print(isChanged)
                                    if !isChanged {
                                        if textFieldValidatorEmail(self.email) {
                                            self.isEmailValid = true
                                        } else {
                                            self.isEmailValid = false
                                        }
                                    }
                                    
                                })
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(self.email == "" ? Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255) :
                                                        self.isEmailValid ? Color.accentColor : Color(red: 252 / 255, green: 50 / 255, blue: 91 / 255), lineWidth: 4))
                            }
                            Spacer().frame(height: 10)
                            VStack{
                                HStack{
                                    Text("Password")
                                    Spacer()
                                }
                                SecureField("Password", text: $password)
                                    .disableAutocorrection(true)
                                    .autocapitalization(.none)
                                    .padding()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255), lineWidth: 4))
                                
                            }       }
                    }
                    VStack{
                        Spacer().frame(height: 30)
                        
                            Button {
                                
                                guard !self.email.isEmpty, !self.password.isEmpty else {
                                    let alert = SPAlertView(title: "Error", message: "Email and Password fields cannot be empty", preset: SPAlertIconPreset.error)
                                    alert.present(duration: 3, haptic: SPAlertHaptic.error) {
                                        print("Error signing in")
                                    }
                                    return
                                }
                                appModel.signIn(email: self.email, password: self.password)
                            } label: {
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color(red: 4 / 255, green: 220 / 255, blue: 4 / 255), Color(red: 0 / 255, green: 221 / 255, blue: 132 / 255)]), startPoint: .leading, endPoint: .trailing)
                                    Text("Login")
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .foregroundColor(Color.white)
                                }
                                .frame(minWidth: 20, maxWidth: .infinity)
                                .frame(height: 60)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                        Spacer().frame(height: 10)
                        HStack{
                            Text("Don't have an acccount?")
                            Button {
                                self.signup_visible.toggle()
                            } label: {
                                Text("Sign up")
                                    .foregroundColor(Color(UIColor.label))
                                    .font(.system(size: 15, weight: .bold, design: .default))
                            }.sheet(isPresented: $signup_visible, content: {
                                SignUpView(showSheet: $signup_visible)
                                    .background(Color(UIColor.systemBackground))
                            })
                        }
                        Spacer().frame(height: 50)
                    }
                }.padding(20)
            }
            .navigationBarTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
