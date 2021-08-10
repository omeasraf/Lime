//
//  PostView.swift
//  PostView
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI
import Kingfisher
import FontAwesomeSwiftUI

struct PostView: View {
    var post: RecipePost
    var body: some View {
        VStack{
            KFImage(URL(string: post.image)!)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white)
                .opacity(0.8)
            VStack{
                HStack{
                    Image(systemName: "heart")
           
                    
                    Text(AwesomeIcon.comment.rawValue)
                        .font(.awesome(style: .regular, size: 20))
                        .foregroundColor(Color(UIColor.label))
                    Spacer()
                    Image(systemName: "bookmark")
                }
                HStack {
                    Text("\(post.numbOfLikes) Likes")
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                }.padding(.top, 6)
                 .padding(.bottom, 1)
                HStack{
                    Text(post.postingUser)
                        .font(.system(size: 14, weight: .bold))
                    Text(post.description)
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                }
            }.padding()

        }
    }
}

struct PostView_Previews: PreviewProvider {
 
    static var previews: some View {
        PostView(post:  RecipePost(postingUser: "Ome Asraf", description: "Awesome Recipe", numbOfLikes: 501, image: "https://images.unsplash.com/photo-1484980972926-edee96e0960d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"))
    }
}
