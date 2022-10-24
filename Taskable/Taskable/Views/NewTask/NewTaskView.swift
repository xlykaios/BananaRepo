//
//  NewTaskView.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 24/10/22.
//

import SwiftUI

struct NewTaskView: View {
    
    private enum Const {
        static let titlePlaceholder = "Title"
        static let notesPlaceholder = "Notes"
        
        static let deadlineTitle = "Deadline"
        static let priorityTitle = "Priority"
        static let tagsTitle = "Tags"
    }
    
    @Binding var task: Tasky
    @State private var hasDeadline: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                // MARK: - Text input section
                TextField(Const.titlePlaceholder, text: $task.name)
                TextField(Const.notesPlaceholder, text: $task.bio)
                
                // MARK: - Deadline section
                HStack {
                    Toggle(isOn: $hasDeadline) {
                        Text(Const.deadlineTitle)
                    }
                }
                
                // MARK: - Priority section
                HStack {
                    Text(Const.priorityTitle)
                    Spacer()
                    Text(task.priority.rawValue)
                }
                
                // MARK: - Tags section
                HStack {
                    Text(Const.tagsTitle)
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle("New Task")
            .padding(16)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(task: .constant(Tasky.emptyTask()))
    }
}
