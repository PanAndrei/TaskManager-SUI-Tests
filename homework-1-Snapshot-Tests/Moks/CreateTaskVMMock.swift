//
//  CreateTaskVMMock.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 27.06.2022.
//

import Foundation
@testable import homework_1

class CreateTaskVMMock: CreateTaskVMProtocol {
    @Published var task: TaskModel
    
    init(task: TaskModel = .init(name: "", text: "", priority: .low)) {
        self.task = task
    }
}
