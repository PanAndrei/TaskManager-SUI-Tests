//
//  CreateTaskView.swift
//  homework-1
//
//  Created by Andrei Panasenko on 28.05.2022.
//

import SwiftUI

struct CreateTaskView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var taskName: String = ""
    @State var taskText: String = ""
    @State var priority: TaskPriority = .low
    
    var tasks: TaskVM
    
    var body: some View {
        VStack(spacing: 40) {

            buildCreateName()
            
            buildCreateTaskText()

            buildCreateTaskPriority()
            
            Spacer()
            
            buildCreateTaskButton()

        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    private func buildCreateName() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(String.taskName)
            
            TextField(String.enterText, text: $taskName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16)
                                .stroke())
        }
    }
    
    @ViewBuilder
    private func buildCreateTaskText() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(String.taskDescription)
            
            TextField(String.enterText, text: $taskText)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16)
                                .stroke())
        }
    }
    
    @ViewBuilder
    private func buildCreateTaskPriority() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(String.taskPriority)
            
            Picker(selection: $priority) {
                ForEach(TaskPriority.allCases, id: \.self) { priority in
                    Text(priority.rawValue)
                        .tag(priority)
                }
            } label: {}
            .pickerStyle(.segmented)
        }
    }
    
    private func buildCreateTaskButton() -> some View {
        VStack {
            Text(String.shouldAdd)
            
            Button {
                let tasksa = TaskModel(name: taskName, text: taskText, priority: priority)
                tasks.taskStorage.append(tasksa)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text(String.addTask)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16)
                                    .stroke())
                    .foregroundColor(taskName.isEmpty ? Color.gray : Color.blue)
                
            }
            .disabled(taskName.isEmpty)
        }
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        TestTaskView()
    }
    
    struct TestTaskView: View {
        @State var text1 = "task1"
        @State var text2 = "task2"
        @State var prior = 1
        
        var body: some View {
            CreateTaskView(taskName: text1, taskText: text2, priority: .low, tasks: TaskVM.shared)
        }
    }
}

