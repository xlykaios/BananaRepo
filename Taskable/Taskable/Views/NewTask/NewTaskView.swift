//
//  NewTaskView.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 24/10/22.
//

import SwiftUI

struct NewTaskView: View {
    
    // MARK: - State variables
    
    @State private var taskName = ""
    @State private var taskNotes = ""
    @State private var taskPriority: Priority = .urgent
    @State private var hasDeadline: Bool = false
    @State private var date = Date()
    
    // MARK: - Environment variables
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            
            Form {
                // MARK: - Text input section
                Section {
                    TextField(Const.titlePlaceholder, text: $taskName)
                    TextField(Const.notesPlaceholder, text: $taskNotes, axis: .vertical)
                }
                // MARK: - Deadline section
                Section {
                    Toggle(isOn: $hasDeadline) {
                        Text(Const.deadlineTitle)
                            .font(.headline)
                    }
                    // MARK: - Datetime section
                    if hasDeadline {
                        DatePicker(
                            Const.dateTitle,
                            selection: $date,
                            in: Date()...
                        )
                        .datePickerStyle(.graphical)
                    }
                }
                // MARK: - Priority section
                Section {
                    HStack {
                        Text(Const.priorityTitle)
                            .font(.headline)
                        Picker("", selection: $taskPriority) {
                            ForEach(Priority.allCases) { priority in
                                Text(priority.title)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                // MARK: - Tags section
                Section {
                    NavigationLink {
                        TagsSelectionView()
                    } label: {
                        HStack {
                            Text(Const.tagsTitle)
                                .font(.headline)
                        }
                    }
                }
            }
            
            // MARK: - Navigation setup
            .navigationTitle(Const.viewTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(Const.doneBarButtonTitle) {
                        saveNewTask()
                        dismiss()
                    }
                }
            }
        }
    }
    
    // MARK: - Initialization
    
    init() {
        // Navigation bar title style
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.label]
    }
    
    func saveNewTask() {
        guard !taskName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
            return
        }
        
        let newTask = Tasky(context: context)
        newTask.id = UUID()
        newTask.title = taskName
        newTask.bio = taskNotes
        newTask.priority = taskPriority
        newTask.isDone = false
        if hasDeadline {
            newTask.deadline = date
        }
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

// MARK: - Constants

private extension NewTaskView {
    private enum Const {
        static let viewTitle = "New Task"
        static let closeBarButtonTitle = "Close"
        static let doneBarButtonTitle = "Done"
        
        static let titlePlaceholder = "Title"
        static let notesPlaceholder = "Notes"
        
        static let deadlineTitle = "Deadline"
        static let dateTitle = "Date"
        static let priorityTitle = "Priority"
        static let tagsTitle = "Tags"
        
        static let alertMessage = "The title shouldn't be empty"
        
        static let backgroundColor = Color("BackgroundColor")
        static let accentColor = Color(.systemGray6)
        static let labelColor = Color(.label)
    }
}

// MARK: - Preview

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
