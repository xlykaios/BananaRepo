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
        static let dateTitle = "Date"
        static let priorityTitle = "Priority"
        static let tagsTitle = "Tags"
        
        static let backgroundColor = Color(red: 0.141, green: 0.141, blue: 0.149)
        static let accentColor = Color(red: 0.11, green: 0.11, blue: 0.118)
    }
    
    @State private var taskName = ""
    @State private var taskNotes = ""
    @State private var taskPriority: Priority = .normal
    @State private var hasDeadline: Bool = true
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            ZStack {
                Const.backgroundColor.ignoresSafeArea(.all)
                VStack {
                    
                    // MARK: - Text input section
                    VStack {
                        TextField(Const.titlePlaceholder, text: $taskName)
                            .padding([.horizontal, .top], 16)
                        .cornerRadius(8)
                        Divider()
                        TextField(Const.notesPlaceholder, text: $taskNotes)
                            .padding([.horizontal, .bottom], 16)
                            
                    }
                    .background(Const.accentColor)
                    .cornerRadius(8)
                    
                    
                    // MARK: - Deadline section
                    Toggle(isOn: $hasDeadline) {
                        Text(Const.deadlineTitle)
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
                        Spacer()
                        Text(taskPriority.rawValue)
                    }
                    .padding(13)
                    .background(Const.accentColor)
                    .cornerRadius(8)
                    
                    // MARK: - Tags section
                    HStack {
                        Text(Const.tagsTitle)
                        Spacer()
                    }
                    .padding(13)
                    .background(Const.accentColor)
                    .cornerRadius(8)
                    
                    Spacer()
                }
                .padding(12)
            }
            .foregroundColor(.white)
            // MARK: - Navigation setup
            .navigationTitle("New Task").foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        print("Tapped close")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        print("Tapped done")
                    }
                }
            }
        }
    }
    
    init() {
//        super.init()
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView()
    }
}
