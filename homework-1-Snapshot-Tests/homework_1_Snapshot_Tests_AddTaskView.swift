//
//  homework_1_Snapshot_Tests_AddTaskView.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 28.06.2022.
//

@testable import homework_1
import XCTest
import SnapshotTesting

class homework_1_Snapshot_Tests_AddTaskView: XCTestCase {
    
    // MARK: - AddTaskView
        
    func testCreateTaskEmptyFieldsLow() {
        // Given
        let viewModel = TaskVMMock()
        let taskVM = CreateTaskVMMock()
        let view = CreateTaskView(tasks: viewModel, task: taskVM)

        // When
        viewModel.taskStorage = []
        taskVM.task = .init(name: "", text: "", priority: .low)
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testCreateTaskNotEmptyFieldsMedium() {
        // Given
        let viewModel = TaskVMMock()
        let taskVM = CreateTaskVMMock()
        let view = CreateTaskView(tasks: viewModel, task: taskVM)

        // When
        viewModel.taskStorage = []
        taskVM.task = .init(name: "test", text: "test", priority: .medium)
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testCreateTaskEmptyNameFieldsHigh() {
        // Given
        let viewModel = TaskVMMock()
        let taskVM = CreateTaskVMMock()
        let view = CreateTaskView(tasks: viewModel, task: taskVM)

        // When
        viewModel.taskStorage = []
        taskVM.task = .init(name: "", text: "test", priority: .high)
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testCreateTaskEmptyDescriptionFieldsCritical() {
        // Given
        let viewModel = TaskVMMock()
        let taskVM = CreateTaskVMMock()
        let view = CreateTaskView(tasks: viewModel, task: taskVM)

        // When
        viewModel.taskStorage = []
        taskVM.task = .init(name: "test", text: "", priority: .critical)
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
}

