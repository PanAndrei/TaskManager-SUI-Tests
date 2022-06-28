//
//  homework_1_Snapshot_Tests_MainView.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 26.06.2022.
//
//
@testable import homework_1
import XCTest
import SnapshotTesting

class homework_1_Snapshot_Tests_MainView: XCTestCase {
    
    // MARK: - MainView

    func testEmptyTaskView() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [:])
        
        // When
        viewModel.taskStorage = []
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testOneTaskView() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [:])
        
        // When
        viewModel.taskStorage = [.init(name: "test", text: "test", priority: .critical)]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
    
    func testManyTasksView() {
        // Given
        let viewModel = TaskVMMock()
        let view = MainView(tasks: viewModel, sectionState: [TaskPriority.critical.rawValue : true])

        // When
        viewModel.taskStorage = [.init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical),
                                 .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical),
                                 .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical),
                                 .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical),
                                 .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical), .init(name: "test", text: "test", priority: .critical)]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .sizeThatFits))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhoneSe)))
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12ProMax)))
    }
}
