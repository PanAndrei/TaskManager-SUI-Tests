//
//  homework_1_Snapshot_Tests_OneTaskSubView.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 28.06.2022.
//

@testable import homework_1
import XCTest
import SnapshotTesting

class homework_1_Snapshot_Tests_OneTaskSubView: XCTestCase {
    
    // MARK: - OneTaskSubView
    
    func testSubTasksViewLowIsDoneWithDescription() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "test", priority: .low, isDone: true)
        let view = TaskCellView(task: task)
        
        // When
        viewModel.taskStorage = []
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testSubTasksViewMediumIsDoneWithoutDescription() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "", priority: .medium, isDone: true)
        let view = TaskCellView(task: task)
        
        // When
        viewModel.taskStorage = []
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testSubTasksViewHighIsNotDoneWithoutDescription() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "", priority: .high, isDone: false)
        let view = TaskCellView(task: task)
        
        // When
        viewModel.taskStorage = []
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testSubTasksViewCriticalIsNotDoneWithDescription() {
        // Given
        let viewModel = TaskVMMock()
        let task = TaskModel(name: "test", text: "test", priority: .high, isDone: false)
        let view = TaskCellView(task: task)
        
        // When
        viewModel.taskStorage = []
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
}


