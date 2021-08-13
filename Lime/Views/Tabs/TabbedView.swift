//
//  ContentView.swift
//  Lime
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI

struct TabbedView: View {
    init() {
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemBackground
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    var body: some View {
        UIKitTabView([
            UIKitTabView.Tab(
                view:
                    HomeView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ,
                barItem: UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
            ),
            UIKitTabView.Tab(
                view:
                    ProfileView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ,
                barItem: UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
            ),
            UIKitTabView.Tab(
                view:
                    NewPostView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ,
                barItem: UITabBarItem(title:"",image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
            )
        ])
    }
}


struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
            .preferredColorScheme(.dark)
    }
}
