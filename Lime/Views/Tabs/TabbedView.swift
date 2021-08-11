//
//  ContentView.swift
//  Lime
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI


struct TabbedView: View {
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    @State private var selection = 0
    let tabBarIcons = [
        "house",
        "magnifyingglass",
        "person"
        
    ]
    
    let fillTabBarIcons = [
        "house.fill",
        "magnifyingglass",
        "person.fill"
    ]
    
    var body: some View{
        
        VStack(spacing: 0) {
            ZStack {
                switch selection {
                case 0:
                    NavigationView {
                        HomeView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                case 1:
                    NavigationView {
                        SearchView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                default:
                    NavigationView {
                        LoginView()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                    }
                }
            }
            //            Spacer()
            Divider()
                .padding(8)
            HStack {
                ForEach(0..<tabBarIcons.count){ num in
                    Button {
                        self.selection = num
                    } label: {
                        Spacer()
                        Image(systemName: self.selection == num ? fillTabBarIcons[num] : tabBarIcons[num])
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(self.selection == num ? Color.accentColor.opacity(0.7) :  Color(UIColor.label).opacity(0.7))
                            .animation(.easeInOut(duration: 0.25), value: self.selection == num)
                        Spacer()
                    }
                    
                    
                }
                
                
            }.background(Color(UIColor.systemBackground))
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
