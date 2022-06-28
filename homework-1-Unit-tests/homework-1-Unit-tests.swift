//
//  homework_1_UI_tests.swift
//  homework-1-UI-tests
//
//  Created by Andrei Panasenko on 26.06.2022.
//

import XCTest
@testable import homework_1


class TasksVMTests: XCTestCase {
    
    var viewModel: TaskVM!
    var mockedVM: TaskVMMock = TaskVMMock()
    
    override func setUp() {
        super.setUp()
        
        viewModel = TaskVM()
    }
    
    func testTasksEmptyStorage() {
        // When
        let expectedStorage: [TaskModel] = []
        
        // Given
        viewModel.taskStorage = expectedStorage
        
        // Then
        XCTAssertEqual(expectedStorage, mockedVM.taskStorage)
    }
    
    func testAddOneTask() {
        // When
        let expectedStorage: [TaskModel] = [.init(name: "test", text: "test", priority: .low)]
        
        // Given
        viewModel.taskStorage = expectedStorage
        mockedVM.addTask(task: .init(name: "test", text: "test", priority: .low))
        
        // Then
        XCTAssertEqual(expectedStorage.count, mockedVM.taskStorage.count)
    }
    
    func testGetNumberOfTasks() {
        // When
        let expectedStorage: [TaskModel] = [.init(name: "test", text: "test", priority: .low)]
        
        // Given
        viewModel.taskStorage = expectedStorage
        
        // Then
        XCTAssertEqual(viewModel.getNumberOfTasks(priority: .low), "1")
    }
    
    func testUpdateStatus() {
        // When
        let task: TaskModel = .init(name: "test", text: "test", priority: .low)
        let expectedStorage: [TaskModel] = [task]
        
        // Given
        viewModel.taskStorage = expectedStorage
        viewModel.updateTaskStatus(matching: task)
        
        // Then
        XCTAssertEqual(viewModel.taskStorage[0].isDone, true)
    }
    
    func testUpdateTask() {
        // When
        let oldTask: TaskModel = .init(name: "test", text: "test", priority: .low)
        let newTask: TaskModel = .init(name: "Test", text: "Test", priority: .high, isDone: true)
        let expectedStorage: [TaskModel] = [oldTask]
        
        // Given
        viewModel.taskStorage = expectedStorage
        viewModel.updateTask(withTask: newTask, oldTask: oldTask)
        
        // Then
        XCTAssertEqual(viewModel.taskStorage[0], newTask)
    }
    
    func testRemoveTask() {
        // When
        let task: TaskModel = .init(name: "test", text: "test", priority: .low)
        let expectedStorage: [TaskModel] = [task]

        // Given
        viewModel.taskStorage = expectedStorage
        viewModel.removeTask(matchingTask: task)

        // Then
        XCTAssertEqual(viewModel.taskStorage.count, 0)
    }
}
