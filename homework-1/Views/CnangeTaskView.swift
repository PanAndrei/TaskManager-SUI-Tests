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
        .navigationTitle(String.taskTitle)
    }
    
    @ViewBuilder
    private func buildTaskName() -> some View {
        if isChangingTask {
            HStack {
                Text(String.taskTitle)
                
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
                Text(String.taskTitle)
                
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
                Text(String.taskDescription)
                
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
                Text(String.taskDescription)
                
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
                Text(String.taskPriority)
                
                Picker(selection: $newTask.priority) {
                    Text(TaskPriority.critical.rawValue)
                        .tag(TaskPriority.critical)
                    Text(TaskPriority.high.rawValue)
                        .tag(TaskPriority.high)
                    Text(TaskPriority.medium.rawValue)
                        .tag(TaskPriority.medium)
                    Text(TaskPriority.low.rawValue)
                        .tag(TaskPriority.low)
                } label: {}
                .pickerStyle(.segmented)
            }
            .getBackground()
        } else {
            HStack {
                Text(String.taskPriority)
                
                Spacer()
                
                Text(newTask.priority.rawValue)
            }
            .getBackground()
        }
    }
    
    @ViewBuilder
    private func buildTaskStatus() -> some View {
        if isChangingTask {
            HStack {
                Text(newTask.isDone ? String.isDone : String.isNotDone)
                
                Spacer()
                
                Toggle(isOn: $newTask.isDone) {}
            }
            .getBackground()
        } else {
            HStack {
                Text(String.taskStatus)
                
                Spacer()
                
                Text(newTask.isDone ? String.isDone : String.isNotDone)
                
            }
            .getBackground()
        }
    }
    
    @ViewBuilder
    private func buildChangesButtons() -> some View {
        if isChangingTask {
            HStack {
                Button {
                    let index = allTasks.taskStorage.firstIndex(of: oldTask!)
                    allTasks.taskStorage[index!] = newTask
                    oldTask = newTask
                    isChangingTask = false
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(String.saveTask)
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
                    Text(String.cancellChanges)
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
                Text(String.modifyTask)
            }
            .foregroundColor(Color.black)
            .getBackground()
        }
    }
}

//struct TaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        CnangeTaskView(newTask: TaskVM.shared.taskStorage[0], allTasks: TaskVM.shared)
//    }
//}
