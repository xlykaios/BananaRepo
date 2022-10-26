//
//  ContentView.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var TaskyVM = TaskViewModel()
    var body: some View {
            List{
                ForEach(TaskyVM.ClassifiedTasks){
                    task in NavigationLink{
                    }label:{
                        TaskRow(currtask: task)
                            }
                    .swipeActions(edge: .leading) {
                        Button("Done"){ }
                            .tint(.green)
                            .cornerRadius(4)
                       /* Button("Modify"){ }
                            .tint(.orange)*/
                    }
                }
                .onDelete(perform: TaskyVM.remove)
            }.listStyle(.insetGrouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
