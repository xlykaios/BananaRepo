//
//  ListCoreDataUI.swift
//  Taskable
//
//  Created by Antonio Giordano on 28/10/22.
//

import SwiftUI

struct ListCoreDataUI: View {
    @EnvironmentObject var TaskyVM: TaskViewModel
    @FetchRequest(entity: Tasky.entity(), sortDescriptors: []) var taskitems : FetchedResults<Tasky>
    @Environment(\.managedObjectContext) var context
    var body: some View {
        List {
            ForEach(taskitems){
                task in
                    
                    NavigationLink{
                    }label:{
                        TaskRow(currtask: task)
                    }
                    .swipeActions(edge:.trailing) {
                     
                        //DONE BUTTON
                        Button(role: .destructive){
                            //done actions
                            TaskyVM.increaseCounter()
                            deleteTask(itemToDelete: task)
                           
                        }label:{
                            Label("Done",systemImage: "checkmark")
                        }.tint(.green)
                        
                    }
                }
        }.listStyle(.inset)
        .scrollContentBackground(.hidden)
    }
    func deleteTask(itemToDelete : Tasky) {
        
            context.delete(itemToDelete)
        
        DispatchQueue.main.async { [self] in
            do {
                try context.save()
            } catch {
                print(error)
    } }
    }
}


struct ListCoreDataUI_Previews: PreviewProvider {
    static var previews: some View {
        ListCoreDataUI()
    }
}
