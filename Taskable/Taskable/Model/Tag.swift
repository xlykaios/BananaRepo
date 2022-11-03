//
//  Tag.swift
//  Taskable
//
//  Created by Ekaterina Grishina on 27/10/22.
//

import Foundation
import SwiftUI

enum Tag: String, CaseIterable, Identifiable {
    case work
    case education
    case routine
    case home
    case shopping
    case health
    case entertainment
    
    var id: Self { self }
    
    var image: Image {
        switch self {
        case .education:
            return Image(systemName: "graduationcap")
        case .work:
            return Image(systemName: "briefcase")
        case .health:
            return Image(systemName: "stethoscope")
        case .home:
            return Image(systemName: "house")
        case .routine:
            return Image(systemName: "note.text")
        case .shopping:
            return Image(systemName: "cart")
        case .entertainment:
            return Image(systemName: "gamecontroller")
        }
    }
}
