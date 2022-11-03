//
//  Timer.swift
//  HomeFocus1
//
//  Created by Alberto Di Ronza on 27/10/22.
//

import Foundation

extension PomodoroView {
    
    final class TimerModel :ObservableObject
    {
        @Published var isActive = false
        @Published var isVisible = true
        @Published var time : String = "25:00"
        @Published var minutes : Float = 25.0
        @Published var workOrBreak : Bool = true
        @Published var count : Int = 3
        {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        //updates immedietly the dysplayed strign

        private var initialTime = 0
        private var endDate = Date()
        private var increasingCount = 0
        
        func start(minutes : Float) {
            self.initialTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.isVisible = false
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
                
            func reset() {
                self.time = "25:00"
                self.minutes = 25.0
                self.isActive = false
                self.isVisible = true
                self.time = "\(Int(minutes)):00"
                self.count = 3
                self.workOrBreak = true
            }
        
            func isOddIsEven (n : Int) -> Bool {
                if n == 1 || n == 3 || n == 5 || n == 7 {return false} else {return true}
            }
            
            func updateCountdown() {
                guard isActive else {return}
                
                let now = Date()
                let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
                
                if diff <= 0 {
                    self.increasingCount += 1
                    self.workOrBreak = isOddIsEven(n: increasingCount)
                    
                    if workOrBreak
                    {
                        self.count -= 1
                        if(self.count == -1){reset(); return}
                        self.time = "25:00"
                        self.minutes = 25.0
                        start(minutes: minutes)
                    }
                    else if (self.increasingCount == 7)
                    {
                        self.time = "15:00"
                        self.minutes = 15.0
                        start(minutes: minutes)
                    }
                    else
                    {
                        self.time = "05:00"
                        self.minutes = 5.0
                        start(minutes: minutes)
                    }
                    return
                }//the timer is over
                
                
                let date = Date(timeIntervalSince1970: diff)
                let calendar = Calendar.current
                
                let minutes = calendar.component(.minute , from: date)
                let seconds = calendar.component(.second , from: date)
                
                
                self.time = String(format: "%d:%02d", minutes, seconds)
                }
        
            }
    }

