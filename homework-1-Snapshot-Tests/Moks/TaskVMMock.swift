//
//  TaskVMMock.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 26.06.2022.
//

import Foundation
@testable import homework_1

class TaskVMMock: TaskVMProtocol {
    @Published var taskStorage: [TaskModel]
    
    init(storage: [TaskModel] = []) {
        self.taskStorage = storage
    }
}

