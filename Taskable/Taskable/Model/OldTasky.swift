//
//  OldTasky.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 26/10/22.
//

import Foundation

struct OldTasky : Hashable, Identifiable{
    var id: UUID
    var name : String
    var bio : String
    var priority : Priority
    var date : Date?
    var isDone : Bool
    /// tag ?
}
