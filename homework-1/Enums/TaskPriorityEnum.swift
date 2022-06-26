//
//  TextEnums.swift
//  homework-1
//
//  Created by Andrei Panasenko on 29.05.2022.
//

import Foundation
import SwiftUI

enum TaskPriority: String, Codable, CaseIterable {
    case critical = "Критический"
    case high = "Высокий"
    case medium = "Средний"
    case low = "Низкий"
    
    var color: Color {
        switch self {
        case .low :
            return Color.green.opacity(0.5)
        case .medium :
            return Color.yellow.opacity(0.5)
        case .high :
            return Color.orange.opacity(0.5)
        case .critical :
            return Color.red.opacity(0.5)
        }
    }
}




