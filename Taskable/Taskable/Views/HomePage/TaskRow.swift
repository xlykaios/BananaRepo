//
//  TaskRow.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import SwiftUI

struct TaskRow: View {
    var currtask : Tasky
    var body: some View {
        
        HStack{
            Circle()
                .frame(width: 10.0, height: 10.0)
                .foregroundColor(currtask.priority == .urgent ? Color.red : Color.green)
            Text(currtask.title)
                
                
        }
    }
}

