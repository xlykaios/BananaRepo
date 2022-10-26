//
//  ListButtons.swift
//  hometest
//
//  Created by Antonio Giordano on 24/10/22.
//

import SwiftUI

struct ListButtons: View {
    @State private var selectedTag: Priority = .normal
    var body: some View {
        HStack {
           
            /*Image(systemName: "line.3.horizontal.decrease")
                .foregroundColor(Color(red: 0.973, green: 0.412, blue: 0.416))
                .padding(.leading, 15.0)
                .imageScale(.large)*/
            Picker("Priority", selection : $selectedTag){
                Text("Urgent").tag(Priority.urgent)
                Text("Normal").tag(Priority.normal)
            }.tint(Color(red: 0.973, green: 0.412, blue: 0.416))
                .padding(.leading, 8.0)
                Spacer()
            Image(systemName: "plus")
                .foregroundColor(Color(red: 0.973, green: 0.412, blue: 0.416))
                .padding(.trailing, 15.0)
                .scaleEffect(1.5)
        }
        
    }
}

struct ListButtons_Previews: PreviewProvider {
    static var previews: some View {
        ListButtons()
    }
}
