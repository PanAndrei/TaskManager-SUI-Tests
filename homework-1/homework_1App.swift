//
//  homework_1App.swift
//  homework-1
//
//  Created by Andrei Panasenko on 27.05.2022.
//

import SwiftUI

@main
struct homework_1App: App {
    let tasks: some TaskVMProtocol = TaskVM()
    var body: some Scene {
        WindowGroup {
            MainView(tasks: tasks, sectionState: [:])
        }
    }
}
