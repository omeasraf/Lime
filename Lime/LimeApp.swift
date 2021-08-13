//
//  LimeApp.swift
//  Lime
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI
import UIKit
import FontAwesomeSwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        FontAwesome.register()
        return true
    }
}

@main
struct LimeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    let persistenceController = PersistenceController.shared
    @ObservedObject var viewModel = AppViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn {
                TabbedView()
                    .navigationBarTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    .environmentObject(viewModel)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            else{
                LoginView()
                    .navigationBarTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    .environmentObject(viewModel)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}
