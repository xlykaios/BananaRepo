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
    @StateObject private var viewModel: TaskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            Test()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel)
        }
    }
}
