//
//  HomeView.swift
//  HomeView
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI

struct HomeView: View {
    var homePosts: [RecipePost] = [
        RecipePost(postingUser: "Ome Asraf", description: "The Quick Brown Fox", numbOfLikes: 501, image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"),
        RecipePost(postingUser: "Ome Asraf", description: "Gourmet meal and white wine", numbOfLikes: 330, image: "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=953&q=80"),
        RecipePost(postingUser: "Ome Asraf", description: "Awesome Recipe", numbOfLikes: 50, image: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"),
        RecipePost(postingUser: "Ome Asraf", description: "Awesome Recipe", numbOfLikes: 190, image: "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"),
        RecipePost(postingUser: "Ome Asraf", description: "Everything I’ve been craving this winter. In one pretty little bowl.", numbOfLikes: 1029, image: "https://images.unsplash.com/photo-1484980972926-edee96e0960d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80")
       
    ]
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Spacer().frame(width: 10)
                    ForEach(0..<1) {_ in
                        StoryCircleView()
                    }
                    Spacer().frame(width: 10)
                }
                .frame(height: 80)
            }
            ScrollView{
                ForEach(homePosts, id: \.id) {post in
                   PostView(post: post)
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
