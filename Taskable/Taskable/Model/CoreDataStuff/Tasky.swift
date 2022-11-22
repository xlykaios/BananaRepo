//
//  Task.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 26/10/22.
//

import Foundation
import CoreData

public class Tasky: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var bio: String
    @NSManaged public var priorityNumber: Int32
    @NSManaged public var isDone: Bool
    @NSManaged public var deadline: Date
}

extension Tasky {
    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNumber)) ?? .normal }
        set {
            self.priorityNumber = Int32(newValue.rawValue)
        }
    }
}
