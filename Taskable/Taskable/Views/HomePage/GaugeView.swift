//
//  GaugeView.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation
import SwiftUI



struct GaugeView: View {
    @FetchRequest(entity: Tasky.entity(), sortDescriptors: []) var taskitems : FetchedResults<Tasky>
    @EnvironmentObject var TaskyVM: TaskViewModel
    @State private var minValue = 0.0
    @State private var maxValue = 0.0
    @State public var current: Double = .zero
    
    
    //var numeroUrgenti = urgentTaskCounter(taskyArray: taskVM.taskyArray)
    let gradcolour = Color(UIColor.systemIndigo)
    let gradient = Gradient(colors : [.accentColor,.red])
    var body: some View {
        VStack {
            Text("Tasks Completed Today")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.bottom, 54.0)
            Gauge(value: TaskyVM.counter, in: minValue...urgentTaskCounter(taskVM: taskitems)) {
                } currentValueLabel: {
                    Text(TaskyVM.counter.formatted())
                } minimumValueLabel: {
                    Text("")
                } maximumValueLabel: {
                    /*Text(urgentTaskCounter(taskVM: taskitems).formatted()+" Urgent Remaining")
                        .font(.title)*/
                    Text("")
                }
                .padding(.bottom, 10.0)
                .gaugeStyle(.accessoryCircular)
                .tint(urgentTaskCounter(taskVM: taskitems)==0 ? .green : .red )
                .scaleEffect(2.3)
            if(urgentTaskCounter(taskVM: taskitems) == 0){
                Text("Well Done!")
                    .font(.callout)
                    .fontWeight(.medium)
            }
                Text(urgentTaskCounter(taskVM: taskitems).formatted()+" Urgent Tasks Remaining")
                .font(.callout)
                .fontWeight(.medium)
            
//            Text("Urgent Tasks Completed")
//                .font(.title3)
//                .fontWeight(.light)
        }
           // .scaleEffect(3)
    }
    
    func urgentTaskCounter(taskVM : FetchedResults<Tasky>) -> Double{
        var urgentCounter : Double = 0.0
        for item in taskVM {
            if (item.priority == .urgent){
                urgentCounter += 1.0
            }
        }
        return urgentCounter
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

 


