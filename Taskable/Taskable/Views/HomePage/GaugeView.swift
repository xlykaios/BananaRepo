//
//  GaugeView.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation
import SwiftUI



struct GaugeView: View {
    @EnvironmentObject var TaskyVM: TaskViewModel
    @State private var minValue = 0.0
    @State private var maxValue = 0.0
    @State public var current: Double = .zero
    
    
    //var numeroUrgenti = urgentTaskCounter(taskyArray: taskVM.taskyArray)
    let gradcolour = Color(UIColor.systemIndigo)
    let gradient = Gradient(colors : [Color("PinkTuna"),.red])
    var body: some View {
        VStack {
            Text("Urgent Tasks Completed")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.bottom, 60.0)
            Gauge(value: TaskyVM.counter, in: minValue...urgentTaskCounter(taskVM: TaskyVM)) {
                } currentValueLabel: {
                    Text(TaskyVM.counter.formatted())
                } minimumValueLabel: {
                    Text("")
                } maximumValueLabel: {
                    Text(urgentTaskCounter(taskVM: TaskyVM).formatted()+" Remaining")
                }
                .padding(.bottom, 24.0)
                .gaugeStyle(.accessoryCircular)
                .tint(gradient)
                .scaleEffect(2.3)
            
//            Text("Urgent Tasks Completed")
//                .font(.title3)
//                .fontWeight(.light)
        }
           // .scaleEffect(3)
    }
}

//PREVIEW PROVIDER

struct GaugeView_Previews: PreviewProvider {
    static let TaskEnv = TaskViewModel()
    static var previews: some View {
        GaugeView()
            .environmentObject(TaskEnv)
    }
}

//DEPRECATED FUNC FOR COUNTER

func urgentTaskCounter(taskVM : TaskViewModel) -> Double{
    var urgentCounter : Double = 0.0
    for item in taskVM.ClassifiedTasks {
        if (item.priority == .urgent){
            urgentCounter += 1.0
        }
    }
    return urgentCounter
}
 


