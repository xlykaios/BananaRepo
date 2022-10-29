//
//  Test.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import SwiftUI

struct Test: View {
    @EnvironmentObject var TaskyVM: TaskViewModel
    var body: some View {
        NavigationView{
            VStack {
                GaugeView()
                    .padding(.top, 40.0)
                FocusButton()
                    .padding(.vertical, 25.0)
                ListButtons()
                    .padding(.bottom, 30.0)
                    .frame(width: 400.0)
                ListCoreDataUI()
                    .padding(.top, -22.0)
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static let TaskEnv = TaskViewModel()
    static var previews: some View {
        Test()
            .environmentObject(TaskEnv)
            .preferredColorScheme(.dark)
    }
}
