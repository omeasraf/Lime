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
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TabbedView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
