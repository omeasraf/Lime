//
//  LimeApp.swift
//  Lime
//
//  Created by Ome Asraf on 8/9/21.
//

import SwiftUI

@main
struct LimeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
