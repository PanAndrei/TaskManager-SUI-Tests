//
//  TaskModel.swift
//  homework-1
//
//  Created by Andrei Panasenko on 28.05.2022.
//

import Foundation

struct TaskModel: Identifiable, Codable, Equatable {
    let id: UUID
    var taskName: String
    var taskText: String
    var priority: TaskPriority
    var isDone: Bool
    
    init(name: String, text: String, priority: TaskPriority, isDone: Bool = false) {
        self.id = UUID()
        self.taskName = name
        self.taskText = text
        self.priority = priority
        self.isDone = isDone
    }
}
