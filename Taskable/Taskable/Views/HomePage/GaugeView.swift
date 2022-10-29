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
    let gradient = Gradient(colors : [Color("PinkTuna"),.red])
    var body: some View {
        VStack {
            Text("Urgent Tasks Completed")
                .font(.title3)
                .fontWeight(.medium)
                .padding(.bottom, 60.0)
            Gauge(value: TaskyVM.counter, in: minValue...urgentTaskCounter(taskVM: taskitems)) {
                } currentValueLabel: {
                    Text(TaskyVM.counter.formatted())
                } minimumValueLabel: {
                    Text("")
                } maximumValueLabel: {
                    Text(urgentTaskCounter(taskVM: taskitems).formatted()+" Remaining")
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

 


