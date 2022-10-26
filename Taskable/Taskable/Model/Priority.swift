//
//  Priority.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 26/10/22.
//

import Foundation

enum Priority: Int, Identifiable, Hashable, CaseIterable {
    case urgent = 0
    case normal = 1
    var id: Self { self }
    
    var title: String {
        switch self {
        case .urgent:
            return "Urgent"
        case .normal:
            return "Normal"
        }
    }
}
