//
//  HomeFocus.swift
//  FocusScreen
//
//  Created by Alberto Di Ronza on 24/10/22.
//

import SwiftUI

struct FocusView: View {
    @Environment(\.presentationMode) var dismissButton
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                //dismiss button for reeturn to the home page
//                Button() {
//                    dismissButton.wrappedValue.dismiss()} label: {Image (systemName: "chevron.left")}
//                    .offset(x: -170 , y: -430)
//                    .padding([.top, .bottom, .trailing])
                
                HStack{
                              VStack (alignment: .leading, spacing: 0)
                           {
                               Text("Lack of Focus?")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top , 50)
                                 Text("Try these techniques: ")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom)
                               }//end of VStack
                           .offset(x: 10, y: -400 ) //text position
                    
                               Spacer()
                    
                    }//end of HStack
                
                VStack (spacing : 0)
                {
                    Image("Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 370 , height: 300)
                        .position(x: 195, y: 70)
                    
                    HStack{
                        Image("Image1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180 , height: 190)
                            .position(x: 100 , y: 70)
                        
                        Image("Image2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180 , height: 190)
                            .position(x: 90 , y: 70)
                    }//end of HStack
                    
                    HStack{
                        Image("Image3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180 , height: 190)
                            .position(x: 100 , y: 30)
                        
                        
                        Image("Image4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180 , height: 190)
                            .position(x: 90 , y: 30)
                          }//end of HStack
                    
                    }//end of VStack
                
                Image("Crown")
                          .resizable()
                          .scaledToFit()
                          .frame(width: 80 , height: 80)
                          .position(x: 45 , y: 5)

//navigation buttons for the other views
                 NavigationLink(destination: PomodoroView()) {
                  label: do {Image (systemName: "chevron.right")}
                 } .position(x: 350 , y: 140)
                    
                NavigationLink(destination: SmartGoalsView()) {
                 label: do {Image (systemName: "chevron.right")}
                } .position(x: 355 , y: 507)
                
                NavigationLink(destination: GetThingsDoneView()) {
                 label: do {Image (systemName: "chevron.right")}
                } .position(x: 355 , y: 335)
                
                NavigationLink(destination: EatThatFrogView()) {
                 label: do {Image (systemName: "chevron.right")}
                } .position(x: 165 , y: 507)
                
                NavigationLink(destination: EisenhowerMatrixView()) {
                 label: do {Image (systemName: "chevron.right")}
                } .position(x: 165 , y: 335)

//text on cards
                ZStack{
                    Text("Pomodoro technique")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .offset(x: -80 , y: -180)
                        .padding()
                
                        Text("Go get your Tomatoes!")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                            .offset(x: -90 , y: -160)
                            .padding()
                    HStack{
                        VStack{
                            Text("Eisenhower Matrix")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .offset(x: -20 , y: 65)
                                .padding()
                            
                            Text("Try to pronunce it!")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                                .offset(x: -25 , y: 40)
                            
                            Text("Eat that frog!")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .offset(x: -40 , y: 155)
                                .padding()
                            
                            Text("Do you eat that?")
                                .font(.footnote)
                                .fontWeight(.regular)
                                .multilineTextAlignment(.leading)
                                .offset(x: -30 , y: 130)
                        }//end of VStack
                        
                            VStack{
                                Text("Getting things done")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .offset(x: -8 , y: 65)
                                    .padding()
                                
                                Text("Stop procrastinating.")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.leading)
                                    .offset(x: -8 , y: 40)
                                
                                Text("Smart Goals")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .offset(x: -30 , y: 155)
                                    .padding()
                                
                                Text("Work smart not hard.")
                                    .font(.footnote)
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.leading)
                                    .offset(x: -5 , y: 130)
                            }//end of VStack
                        }//end of HStack
                    }//end of ZStack
            }//end of ZStack
              .padding(.top, 130.0)
        }//end of NavigationView
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView()
    }
}
