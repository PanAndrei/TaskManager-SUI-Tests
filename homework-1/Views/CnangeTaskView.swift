//
//  CnangeTaskView.swift
//  homework-1
//
//  Created by Andrei Panasenko on 28.05.2022.
//

import SwiftUI

struct CnangeTaskView<ViewModel: TaskVMProtocol>: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isChangingTask: Bool = false
    @State var oldTask: TaskModel?
    @State var newTask: TaskModel
    
    var allTasks: ViewModel
    
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.2)
            
            VStack(spacing: 30) {
                
                buildTaskName()
                
                buildTaskDescription()
                
                buildTaskPriority()
                
                buildTaskStatus()
                
                buildChangesButtons()
                
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .onAppear {
            self.oldTask = newTask
        }
        .navigationTitle("Задача".localized)
    }
    
    @ViewBuilder
    private func buildTaskName() -> some View {
        if isChangingTask {
            HStack {
                Text("Задача".localized)
                
                Spacer()
                
                TextField(newTask.taskName, text: $newTask.taskName)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16)
                                    .stroke())
                    .frame(width: 200)
            }
            .getBackground()
        } else {
            HStack {
                Text("Задача".localized)
                Spacer()
                Text(newTask.taskName)
            }
            .getBackground()
        }
    }
    
    @ViewBuilder
    private func buildTaskDescription() -> some View {
        if isChangingTask {
            HStack {
                Text("Описание".localized)
                
                Spacer()
                TextField(newTask.taskText, text: $newTask.taskText)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16)
                                    .stroke())
                    .frame(width: 200)
            }
            .getBackground()
        } else {
            HStack {
                Text("Описание".localized)
                Spacer()
                Text(newTask.taskText)
            }
            .getBackground()
        }
    }
    
    @ViewBuilder
    private func buildTaskPriority() -> some View {
        if isChangingTask {
            VStack {
                Text("Приоритет".localized)
                
                Picker(selection: $newTask.priority) {
                    Text(TaskPriority.critical.rawValue.localized)
                        .tag(TaskPriority.critical)
                    Text(TaskPriority.high.rawValue.localized)
                        .tag(TaskPriority.high)
                    Text(TaskPriority.medium.rawValue.localized)
                        .tag(TaskPriority.medium)
                    Text(TaskPriority.low.rawValue.localized)
                        .tag(TaskPriority.low)
                } label: {}
                .pickerStyle(.segmented)
            }
            .getBackground()
        } else {
            HStack {
                Text("Приоритет".localized)
                Spacer()
                
                Text(newTask.priority.rawValue.localized)
            }
            .getBackground()
        }
    }
    
    @ViewBuilder
    private func buildTaskStatus() -> some View {
        if isChangingTask {
            HStack {
                Text(newTask.isDone ? "Выполнено".localized : "Не.выполнено".localized)
                Spacer()
                
                Toggle(isOn: $newTask.isDone) {}
            }
            .getBackground()
        } else {
            HStack {
                Text("Статус".localized)
                
                Spacer()
                
                Text(newTask.isDone ? "Выполнено".localized : "Не.выполнено".localized)
            }
            .getBackground()
        }
    }
    
    @ViewBuilder
    private func buildChangesButtons() -> some View {
        if isChangingTask {
            HStack {
                Button {
                    allTasks.updateTask(withTask: newTask, oldTask: oldTask!)
                    oldTask = newTask
                    isChangingTask = false
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Сохранить".localized)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke())
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Button {
                    newTask = oldTask!
                    isChangingTask = false
                } label: {
                    Text("Отменить".localized)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke())
                        .foregroundColor(.red)
                }
            }
            .getBackground()
        } else {
            Button {
                isChangingTask = true
            } label: {
                Text("Редактировать".localized)
            }
            .foregroundColor(Color.black)
            .getBackground()
        }
    }
}

