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
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signup_visible = false
    var body: some View {
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
                        
                    }       }
                }
                VStack{
                    Spacer().frame(height: 30)
                    Button {
                        Firestore.firestore().collection("users").whereField("email", isEqualTo: self.email).getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Unable to retrieve user data: \(err)")
                            }
                            else{
                                if querySnapshot!.documents.count <= 0 {
                                    let alert = SPAlertView(title: "Email not found", message: "Make sure you've entered the correct email.", preset: SPAlertIconPreset.error)
                                    alert.present(duration: 3, haptic: SPAlertHaptic.error) {
                                        print("Done")
                                    }
                                }
                                for document in querySnapshot!.documents {
                                    print("\(document.documentID) => \(document.data())")
                                    let alert = SPAlertView(title: "Success", message: "Successfully signed in.", preset: SPAlertIconPreset.done)
                                    alert.present(duration: 3, haptic: SPAlertHaptic.success) {
                                        print("Done")
                                    }
                                }
                            }
                        }
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
                            SignUpView()
                                .background(Color(UIColor.systemBackground))
                        })
                    }
                    Spacer().frame(height: 50)
                }
            }.padding(20)
        }
        .navigationBarTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarHidden(true)
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
