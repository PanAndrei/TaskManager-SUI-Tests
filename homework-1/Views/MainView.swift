//
//  ContentView.swift
//  homework-1
//
//  Created by Andrei Panasenko on 27.05.2022.
//

import SwiftUI


struct MainView<ViewModel: TaskVMProtocol>: View {
    @StateObject var tasks: ViewModel
    @State var sectionState: [String : Bool]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .ignoresSafeArea()
                
                List {
                    Section() {
                        buildCreateTaskSection()
                        
                        ForEach(TaskPriority.allCases, id: \.self) { priority in
                            Section(header: buildHeaderSection(priority: priority)
                                        .onTapGesture {
                                self.sectionState[priority.rawValue] = !self.isExpanded(priority.rawValue)
                            }) {
                                if self.isExpanded(priority.rawValue) {
                                    buildTaskSection(priority: priority)
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Список.задач".localized)
        }
        .navigationViewStyle(.stack)
    }
    
    private func isExpanded(_ section: String) -> Bool {
        sectionState[section] ?? false
    }
    
    @ViewBuilder
    private func buildCreateTaskSection() -> some View {
        NavigationLink {
            CreateTaskView(tasks: tasks, task: CreateTaskVM())
        } label: {
            Text("Добавить.новую.задачу".localized)
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func buildHeaderSection(priority: TaskPriority) -> some View {
        HStack {
            Text(priority.rawValue.localized)
            Spacer()
            Text(tasks.getNumberOfTasks(priority: priority))
        }
        .padding()
        .background(priority.color)
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func buildTaskSection(priority: TaskPriority) -> some View {
        ForEach(tasks.filterTasks(byPriority: priority)) { task in
            NavigationLink {
                CnangeTaskView(newTask: task, allTasks: tasks)
            } label: {
                TaskCellView(task: task)
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    tasks.removeTask(matchingTask: task)
                } label: {
                    Image(systemName: Images.delete.rawValue)
                }
            }
            .swipeActions(edge: .leading) {
                Button {
                    tasks.updateTaskStatus(matching: task)

                    withAnimation(.easeIn) {
                        tasks.sortTasks(byPriority: priority)
                    }
                } label: {
                    Image(task.isDone ? Images.changeToNotDone.rawValue : Images.changeToDone.rawValue)
                }
            }
        }
    }
}





