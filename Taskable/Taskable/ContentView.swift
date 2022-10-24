//
//  ContentView.swift
//  Taskable
//
//  Created by Antonio Giordano on 24/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNewTaskViewPresented: Bool = false
    
    var body: some View {
        Button("Create new task") {
            isNewTaskViewPresented.toggle()
        }
        .sheet(isPresented: $isNewTaskViewPresented) {
            NewTaskView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
