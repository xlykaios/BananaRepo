//
//  Task.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation
import SwiftUI

struct Tasky : Hashable, Identifiable{
    var id: UUID
    var name : String
    var bio : String
    var priority : Priority
    var date : Date?
    var isDone : Bool
    /// tag ?
}

