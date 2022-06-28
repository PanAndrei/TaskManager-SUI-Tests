//
//  TasksVM.swift
//  homework-1
//
//  Created by Andrei Panasenko on 28.05.2022.
//

import Foundation
import Combine

protocol TaskVMProtocol: ObservableObject {
    var taskStorage: [TaskModel] { get }

    func filterTasks(byPriority priority: TaskPriority) -> [TaskModel]

    func sortTasks(byPriority priority: TaskPriority)

    func removeTask(matchingTask task: TaskModel)

    func updateTaskStatus(matching: TaskModel)

    func updateTask(withTask task: TaskModel, oldTask: TaskModel)
    
    func getNumberOfTasks(priority: TaskPriority) -> String
    
    func addTask(task: TaskModel)
}

class TaskVM: TaskVMProtocol {
    @Published var taskStorage: [TaskModel] = []
    
    private let mainStorageKey = "tasks"
    private let userDefaultsStorage = UserDefaults.standard
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        self.taskStorage = userDefaultsStorage.object([TaskModel].self, with: mainStorageKey)?.sorted(by: { t1, _ in
            !t1.isDone
        }) ?? []
        
        $taskStorage
            .sink { [unowned self] tasks in
                self.userDefaultsStorage.set(object: tasks, forKey: mainStorageKey)
            }.store(in: &cancellableSet)
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


