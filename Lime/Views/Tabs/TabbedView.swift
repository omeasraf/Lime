//
//  ContentView.swift
//  Lime
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI

struct TabbedView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
        UITabBar.appearance().barTintColor = UIColor.systemBackground
    }

    @State private var selection = 0
    var body: some View{
        TabView(selection: $selection){
            NavigationView {
                HomeView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            .tabItem{
                VStack{
                    Image(systemName:"house")
                    Text("Home")
                }
            }
            NavigationView {
                SearchView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            .tabItem{
                VStack{
                    Image(systemName:"magnifyingglass")
                    Text("Search")
                }
            }
            NavigationView {
                LoginView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            .tabItem{
                VStack{
                    Image(systemName: "person.circle")
                        .foregroundColor(Color.white)
                    Text("Profile")
                }
            }
        }
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TabbedView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}
