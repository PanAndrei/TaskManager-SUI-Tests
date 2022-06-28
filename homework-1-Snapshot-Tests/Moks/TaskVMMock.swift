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
    
    func filterTasks(byPriority priority: TaskPriority) -> [TaskModel] {
        return taskStorage.filter { $0.priority == priority }
    }
    
    func sortTasks(byPriority priority: TaskPriority) {
        taskStorage.sort(by: { t1, _ in
            !t1.isDone && t1.priority == priority
        })
    }
    
    func removeTask(matchingTask task: TaskModel) {
        let index = taskStorage.firstIndex(of: task)
        taskStorage.remove(at: index!)
    }
    
    func updateTaskStatus(matching: TaskModel) {
        let index = taskStorage.firstIndex(of: matching)
        taskStorage[index!].isDone.toggle()
    }
    
    func updateTask(withTask task: TaskModel, oldTask: TaskModel) {
        let index = taskStorage.firstIndex(of: oldTask)
        taskStorage[index!] = task
    }
    
    func getNumberOfTasks(priority: TaskPriority) -> String {
        return String(taskStorage.filter { $0.priority == priority }.count)
    }
    
    func addTask(task: TaskModel) {
        taskStorage.append(task)
    }
}

