//
//  User.swift
//  User
//
//  Created by Ome Asraf on 8/12/21.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    
    var name: String
    var email: String
    var username: String
    var password: String
}
