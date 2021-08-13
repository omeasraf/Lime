//
//  GlobalEnvironment.swift
//  GlobalEnvironment
//
//  Created by Ome Asraf on 8/12/21.
//

import Foundation

class GlobalEnvironment : ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User = User.init(name: "", email: "", username: "", password: "")
    
}
