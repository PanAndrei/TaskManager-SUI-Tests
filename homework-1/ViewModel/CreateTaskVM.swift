//
//  CreateTaskVM.swift
//  homework-1
//
//  Created by Andrei Panasenko on 27.06.2022.
//

import Foundation

protocol CreateTaskVMProtocol: ObservableObject {
    var task: TaskModel { get set }
}

class CreateTaskVM: CreateTaskVMProtocol {
    @Published var task: TaskModel
    
    init(task: TaskModel = .init(name: "", text: "", priority: .low)) {
        self.task = task
    }
}
