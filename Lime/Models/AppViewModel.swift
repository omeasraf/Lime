//
//  AppViewModel.swift
//  AppViewModel
//
//  Created by Ome Asraf on 8/13/21.
//

import SwiftUI
import FirebaseAuth
import SPAlert

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                if let error = error as NSError? {
                    print(error.description.description)
                    let alert = SPAlertView(title: "Error", message: error.localizedDescription.description, preset: SPAlertIconPreset.error)
                    alert.present(duration: 3, haptic: SPAlertHaptic.error) {
                        print("Error signing in")
                    }
                    guard AuthErrorCode(rawValue: error.code) != nil else {
                        print("Unable to decode firebase auth error codes")
                        return
                    }
                    
//                    switch errorCode {
//
//                                case .invalidEmail:
//                        return ""
//                    }
                }
                
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String, name: String){
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            let user = self?.auth.currentUser
               if let user = user {
                   let changeRequest = user.createProfileChangeRequest()

                  changeRequest.displayName = name
                  
                   changeRequest.commitChanges { error in
//                    if let error = error {
//                    } else {
//                      print("Updated")
//
//                    }
                  }
                }
            
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }

    
    func signOut(){
        try? auth.signOut()
        
        self.signedIn = false
        
    }
}
