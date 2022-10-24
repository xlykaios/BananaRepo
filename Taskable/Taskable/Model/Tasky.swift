//
//  Task.swift
//  hometest
//
//  Created by Antonio Giordano on 23/10/22.
//

import Foundation
import SwiftUI

enum prio : Hashable, Codable{
    case urgent,normal
}

struct Tasky : Hashable, Codable, Identifiable{
    var id: UUID
    var name : String
    var bio : String
    var priority : prio
    var date : Date?
    /// tag ?
}

