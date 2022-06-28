//
//  homework_1_Snapshot_Tests_Sorting.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 28.06.2022.
//

@testable import homework_1
import XCTest
import SnapshotTesting

class homework_1_Snapshot_Tests_Sorting: XCTestCase {
    
    // MARK: - Sorting

    func testSortingFirstIsDone() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [TaskPriority.critical.rawValue : true])

        // When
        viewModel.taskStorage = [.init(name: "test", text: "test", priority: .critical, isDone: true), .init(name: "test", text: "test", priority: .critical, isDone: false)]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testSortingSecondIsDone() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [TaskPriority.critical.rawValue : true])

        // When
        viewModel.taskStorage = [.init(name: "test", text: "test", priority: .critical, isDone: false), .init(name: "test", text: "test", priority: .critical, isDone: true)]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testSortingAllAreDone() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [TaskPriority.critical.rawValue : true])

        // When
        viewModel.taskStorage = [.init(name: "test", text: "test", priority: .critical, isDone: true), .init(name: "test", text: "test", priority: .critical, isDone: true)]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testSortingAllAreNotDone() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [TaskPriority.critical.rawValue : true])

        // When
        viewModel.taskStorage = [.init(name: "test", text: "test", priority: .critical, isDone: false), .init(name: "test", text: "test", priority: .critical, isDone: false)]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
}

