//
//  CreateTaskView.swift
//  homework-1
//
//  Created by Andrei Panasenko on 28.05.2022.
//

import SwiftUI

struct CreateTaskView<ViewModel: TaskVMProtocol, TaskViewModel: CreateTaskVMProtocol>: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var tasks: ViewModel
    @ObservedObject var task: TaskViewModel
    
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
            Text("Название.задачи".localized)

            TextField("Введите.текст".localized, text: $task.task.taskName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16)
                                .stroke())
        }
    }
    
    @ViewBuilder
    private func buildCreateTaskText() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Описание".localized)
            
            TextField("Введите.текст".localized, text: $task.task.taskText)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16)
                                .stroke())
        }
    }
    
    @ViewBuilder
    private func buildCreateTaskPriority() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Приоритет".localized)
            
            Picker(selection: $task.task.priority) {
                ForEach(TaskPriority.allCases, id: \.self) { priority in
                    Text(priority.rawValue.localized)
                        .tag(priority)
                }
            } label: {}
            .pickerStyle(.segmented)
        }
    }
    
    private func buildCreateTaskButton() -> some View {
        VStack {
            Text("обязательное.поле.для.исполнения".localized)
            Button {
                tasks.taskStorage.append(task.task)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Добавить.новую.задачу".localized)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16)
                                    .stroke())
                    .foregroundColor(task.task.taskName.count == 0 ? Color.gray : Color.blue)
                
            }
            .disabled(task.task.taskName.count == 0)
        }
    }
}


