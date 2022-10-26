//
//  ModelData.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation
import SwiftUI

class TaskViewModel : ObservableObject{
    @Published var ClassifiedTasks : [OldTasky] = [task1,task2,task3,task4,task5]
    @Published var counter : Double = 0.0
    @State var maxTasks : Double = 0.0
    
    func remove(at offsets: IndexSet){
        ClassifiedTasks.remove(atOffsets: offsets)
    }
    
    func increaseCounter(){
        self.counter += 1
        print("send help")
    }
    func countUrgent() -> Double{
        for _ in ClassifiedTasks {
            maxTasks += 1.0
        }
        print("Porcamadonna")
        return maxTasks
    }
    
    //improved rem function for use in the different listviews
    func del(_ tasky: OldTasky){
        if let deletingTaskIndex = self.ClassifiedTasks.firstIndex(where: {$0.id == tasky.id}){
            self.ClassifiedTasks.remove(at: deletingTaskIndex)
        }
    }
}

