//
//  homework_1_Snapshot_Tests_DetailTaskView.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 28.06.2022.
//

@testable import homework_1
import XCTest
import SnapshotTesting

class homework_1_Snapshot_Tests_DetailTaskView: XCTestCase {
    
    // MARK: - DetailTaskView

    func testCangingTaskViewLowPriorityIsDone() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "test", priority: .low, isDone: true)
        let view = CnangeTaskView(newTask: task, allTasks: viewModel)
        // When
        viewModel.taskStorage = [task]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testCangingTaskViewMediumPriorityIsNotDone() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "test", priority: .medium)
        let view = CnangeTaskView(newTask: task, allTasks: viewModel)
        // When
        viewModel.taskStorage = [task]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testCangingTaskViewHighPriorityIsDoneWithoutDescription() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "", priority: .high, isDone: true)
        let view = CnangeTaskView(newTask: task, allTasks: viewModel)
        // When
        viewModel.taskStorage = [task]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testCangingTaskViewCriticalPriorityIsNotDoneWithoutDescription() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "", priority: .critical)
        let view = CnangeTaskView(newTask: task, allTasks: viewModel)
        // When
        viewModel.taskStorage = [task]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
  
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

