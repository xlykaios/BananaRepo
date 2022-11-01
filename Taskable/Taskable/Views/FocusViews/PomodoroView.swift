//
//  PomodoroView.swift
//  HomeFocus1
//
//  Created by Alberto Di Ronza on 25/10/22.
//

import SwiftUI

struct PomodoroView: View {
    
   
    @StateObject private var pm = TimerModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width : Double = 250
    let quotes : [String] =
        [
        "Time for a break!",
        "Go for a walk!",
        "Take a coffee.",
        "Play with your pet.",
        "Rest.",
        "Go get some sleep.",
        "Enjoy some food"
        ]
    var rand : Int = Int.random(in: 0...5)

    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    Text("\(pm.time)")
                        .font(.system(size: 70 , weight: .medium , design: .rounded))
                        .foregroundColor(.red)
                        .padding()
                        .frame(width: width)
                        .overlay(Circle()
                            .fill(.gray)
                            .frame(width: 250, height: 250)
                            .opacity(0.2))
                        .offset(x: 0 , y: -40)
                
                    ZStack{
                        HStack{
                            Text("Repetition before a long break:   \(pm.count)")
                                .frame(alignment: .leading)
                                .padding()
                                .opacity(pm.workOrBreak ? 1.0 : 0.0)
                            
                            Spacer()
                        }//end of HStack
                        .offset(x: 0 , y: 40)
                        
                        if(!pm.workOrBreak){Text("\(quotes[rand])").offset(x: 0 , y: 40)}
                    }//end of ZStack
            
                        Button("Start"){pm.start(minutes: pm.minutes)}
                        .tint(.white)
                        .disabled(pm.isActive)
                        .frame(width: width)
                        .offset(x: 0, y: 200)
                        .overlay(Circle()
                            .fill(.green)
                            .opacity(pm.isVisible ? 0.5 : 0.0)
                            .frame(width: 100, height: 100)
                            .offset(x: 0, y: 200)
                        )
                        .overlay(Circle()
                            .fill(.gray)
                            .opacity(pm.isVisible ? 0.3 : 0.0)
                            .frame(width: 90, height: 90)
                            .offset(x: 0, y: 200)
                        )
                        .opacity(pm.isVisible ? 1.0 : 0.0)
                     
                    Button("Reset"){pm.reset()}
                  .tint(.white)
                  .frame(width: width)
                  .offset(x: 0, y: 180)
                  .overlay(Circle()
                      .fill(.red)
                      .opacity(pm.isVisible ? 0.0 : 0.5)
                      .frame(width: 100, height: 100)
                      .offset(x: 0, y: 180)
                  )
                  .overlay(Circle()
                      .fill(.gray)
                      .opacity(pm.isVisible ? 0.0 : 0.3)
                      .frame(width: 90, height: 90)
                      .offset(x: 0, y: 180)
                  )
                  .opacity(pm.isVisible ? 0.0 : 1.0)
                    
                }//end of VStack
                .onReceive(timer) { _ in pm.updateCountdown()}
                
            }//end of ZStack
        }//end of navigationView
    }//end of body
}//end of View

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}
