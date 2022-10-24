//
//  NewTaskView.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 24/10/22.
//

import SwiftUI

struct NewTaskView: View {
    
    @State private var taskName = ""
    @State private var taskNotes = ""
    @State private var taskPriority: Priority = .normal
    @State private var hasDeadline: Bool = true
    @State private var date = Date()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Const.backgroundColor.ignoresSafeArea(.all)
                ScrollView {
                    
                    VStack {
                        // MARK: - Text input section
                        VStack {
                            TextField(Const.titlePlaceholder, text: $taskName)
                                .padding([.horizontal, .top], 16)
                                .padding([.bottom], 7)
                                .cornerRadius(8)
                            Divider()
                            TextField(Const.notesPlaceholder, text: $taskNotes)
                                .padding([.horizontal, .bottom], 16)
                                .padding([.top], 7)
                            
                        }
                        .background(Const.accentColor)
                        .cornerRadius(8)
                        
                        
                        // MARK: - Deadline section
                        Toggle(isOn: $hasDeadline) {
                            Text(Const.deadlineTitle)
                                .font(.headline)
                        }
                        .padding([.horizontal], 16)
                        .padding([.vertical], 11)
                        .background(Const.accentColor)
                        .cornerRadius(8)
                        
                        // MARK: - Datetime section
                        if hasDeadline {
                            VStack {
                                DatePicker(
                                    Const.dateTitle,
                                    selection: $date,
                                    in: Date()...
                                )
                                .foregroundColor(.white)
                                .padding([.horizontal], 9)
                                .datePickerStyle(.graphical)
                                .background(Const.accentColor, in: RoundedRectangle(cornerRadius: 20))
                            }
                        }
                        
                        // MARK: - Priority section
                        HStack {
                            Text(Const.priorityTitle)
                                .font(.headline)
                            Spacer()
                            Text(taskPriority.rawValue)
                                .font(.body)
                            Image(systemName: "chevron.right")
                        }
                        .padding(13)
                        .background(Const.accentColor)
                        .cornerRadius(8)
                        
                        // MARK: - Tags section
                        HStack {
                            Text(Const.tagsTitle)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding(13)
                        .background(Const.accentColor)
                        .cornerRadius(8)
                        
                        Spacer()
                    }
                    .padding(12)
                }
            }
            .foregroundColor(Const.labelColor)
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
                        // TODO: implement saving new task
                        dismiss()
                    }
                }
            }
        }
    }
    
    init() {
        // Navigation bar title style
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.label]
    }
}

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
        
        static let backgroundColor = Color("BackgroundColor")
        static let accentColor = Color(.systemGray6)
        static let labelColor = Color(.label)
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
