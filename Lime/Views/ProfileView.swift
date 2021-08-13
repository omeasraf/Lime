//
//  ProfileView.swift
//  ProfileView
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appModel: AppViewModel
    var body: some View {
        VStack{
            Text("Profile")
            Button {
                appModel.signOut()
            } label: {
                Text("Sign Out")
            }

        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
