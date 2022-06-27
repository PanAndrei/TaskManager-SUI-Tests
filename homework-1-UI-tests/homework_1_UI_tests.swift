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
    
    func testOneTaskStorage() {
        // When
        let expectedStorage: [TaskModel] = [.init(name: "", text: "", priority: .low)]
        
        // Given
        viewModel.taskStorage = expectedStorage
        mockedVM.taskStorage = expectedStorage
        
        // Then
        XCTAssertEqual(expectedStorage, mockedVM.taskStorage)
    }
}

class CreateTaskTests: XCTestCase {
    
    var viewModel: CreateTaskVM!
    var mockedVM: CreateTaskVMMock = CreateTaskVMMock()
    
    override func setUp() {
        super.setUp()
        
        viewModel = CreateTaskVM()
    }
    
    func testOneTaskStorage() {
        // When
        let expectedStorage: TaskModel = .init(name: "", text: "", priority: .low)
        
        // Given
        viewModel.task = expectedStorage
        
        // Then
        XCTAssertEqual(expectedStorage.taskText, mockedVM.task.taskText)
    }
}

class homework_1_UI_tests: XCTestCase {

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
