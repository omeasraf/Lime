//
//  RecipePost.swift
//  RecipePost
//
//  Created by Ome Asraf on 8/9/21.
//

import Foundation
import SwiftUI

struct RecipePost: Identifiable{
    var id = UUID()
    
    var postingUser: String
    var description: String
    var numbOfLikes: Int
    var image: String
}
