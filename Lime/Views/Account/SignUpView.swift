//
//  SignUpView.swift
//  SignUpView
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI
import FontAwesomeSwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var login_visible = false
    var body: some View {
            
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: 0){
                        VStack{
                            Spacer().frame(height: UIScreen.main.bounds.height < 600 ? 20 : 50)
                            HStack {
                                Text("Sign up with one of the following options.")
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
                                VStack{
                                    HStack{
                                        Text("Name")
                                        Spacer()
                                    }
                                    TextField("John Smith", text: $name)
                                        .padding()
                                        .cornerRadius(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255), lineWidth: 4))
                                }
                                Spacer().frame(height: 10)
                                HStack{
                                    Text("Email")
                                    Spacer()
                                }
                                TextField("john@example.com", text: $email)
                                    .padding()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255), lineWidth: 4))
                            }
                            
                            Spacer().frame(height: 10)
                            VStack{
                                HStack{
                                    Text("Password")
                                    Spacer()
                                }
                                SecureField("Password", text: $password)
                                    .padding()
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(red: 48 / 255, green: 49 / 255, blue: 54 / 255), lineWidth: 4))
                            }
                            
                        }
                        VStack{
                            Spacer().frame(height: 30)
                            Button {
                                
                            } label: {
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color(red: 4 / 255, green: 220 / 255, blue: 4 / 255), Color(red: 0 / 255, green: 221 / 255, blue: 132 / 255)]), startPoint: .leading, endPoint: .trailing)
                                    Text("Create Account")
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
                                Text("Already have an acccount?")
                                NavigationLink(destination: LoginView()){
                                    Text("Login")
                                        .foregroundColor(Color(UIColor.label))
                                        .font(.system(size: 15, weight: .bold, design: .default))
                                }

                            }
                            Spacer().frame(height: 50)
                        }
                }.padding(20)
            }
        }
        .navigationBarTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarHidden(true)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
