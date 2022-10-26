//
//  TaskListViewAllOnSide.swift
//  hometest
//
//  Created by Antonio Giordano on 25/10/22.
//

import SwiftUI

struct TaskListViewAllOnSide: View {
    @EnvironmentObject var TaskyVM: TaskViewModel
    @State private var showingDeleteAlert = false
   // @State var taskToDelete : Tasky
    var body: some View {
        List {
            ForEach(Array(TaskyVM.ClassifiedTasks.enumerated()), id: \.offset) {
                (index, task) in
                    
                    NavigationLink{
                    }label:{
                        TaskRow(currtask: task)
                    }
                    .swipeActions(edge:.trailing) {
                        
                        /* //DELETE BUTTON
                         Button(role: .destructive){
                         TaskyVM.del(task)
                         showingDeleteAlert = true
                         }label:{
                         Label("Delete", systemImage: "trash")
                         }.tint(.red)*/
                        
                        //DONE BUTTON
                        Button(role: .destructive){
                            //done actions
                            TaskyVM.increaseCounter()
                            TaskyVM.del(task)
                        }label:{
                            Label("Done",systemImage: "checkmark")
                        }.tint(.green)
                        
                        
                        //EDIT BUTTON
                        /*  Button{
                         //edit actions
                         }label:{
                         Label("Edit",systemImage: "square.and.pencil")
                         }.tint(.orange) */
                    }
                    
                    /* .confirmationDialog(Text("Are you sure that you want to delete it?"), isPresented: $showingDeleteAlert, titleVisibility: .visible){
                     Button("Delete"){
                     TaskyVM.del(task)
                     }
                     } */
                }
        }.listStyle(.inset)
        .scrollContentBackground(.hidden)
        
        
        }
    }
    
    func edit(_ task:OldTasky){
        //editing task function with call to screen
    }


struct ListPreview: PreviewProvider {
    static var previews: some View {
        TaskListViewAllOnSide()
    }
}

