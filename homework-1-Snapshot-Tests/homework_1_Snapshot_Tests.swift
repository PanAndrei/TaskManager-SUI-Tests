//
//  homework_1_Snapshot_Tests.swift
//  homework-1-Snapshot-Tests
//
//  Created by Andrei Panasenko on 26.06.2022.
//
//
@testable import homework_1
import XCTest
import SnapshotTesting

class homework_1_Snapshot_Tests: XCTestCase {
    
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
    
    // MARK: - AddTaskView
    
    // добавить вм или мок модель 
    
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

    }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
