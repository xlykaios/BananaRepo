//
//  ModelData.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation

class TaskViewModel : ObservableObject{
    @Published var ClassifiedTasks : [Tasky] = [task1,task2,task3]
    @Published var CompletedTasks = 0.0
    //var GaugeCount = GaugeView()
    
    func remove(at offsets: IndexSet){
        ClassifiedTasks.remove(atOffsets: offsets)
        //GaugeCount.taskDone()
    }
}
