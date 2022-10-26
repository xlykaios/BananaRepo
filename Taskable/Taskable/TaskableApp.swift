//
//  TaskableApp.swift
//  Taskable
//
//  Created by Antonio Giordano on 24/10/22.
//

import SwiftUI

@main
struct TaskableApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
