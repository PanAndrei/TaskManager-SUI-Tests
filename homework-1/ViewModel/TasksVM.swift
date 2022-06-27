//
//  TasksVM.swift
//  homework-1
//
//  Created by Andrei Panasenko on 28.05.2022.
//

import Foundation
import Combine

protocol TaskVMProtocol: ObservableObject {
    var taskStorage: [TaskModel] { get set }
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
}
