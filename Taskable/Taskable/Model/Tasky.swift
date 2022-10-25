//
//  Task.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation
import SwiftUI

enum Priority: String, Identifiable, Hashable, CaseIterable {
    case urgent
    case normal
    var id: Self { self }
}

struct Tasky: Hashable, Identifiable{
    var id: UUID
    var name: String
    var bio: String
    var priority: Priority
    var date: Date?
    /// tag ?
    
    
    static func emptyTask() -> Tasky {
        Tasky(id: UUID(), name: "", bio: "", priority: .normal)
    }
}

