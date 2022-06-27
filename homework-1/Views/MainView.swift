//
//  ContentView.swift
//  homework-1
//
//  Created by Andrei Panasenko on 27.05.2022.
//

import SwiftUI

/*
 Привет!
 
 Сделал все основные задачи
 + группировка по папкам
 + сортировка по статусу выполнено с анимацией
 + по свайпу вправо - изменение статуса выполнено
 + по свайпу влево - удаление задачи
 
 */

/*
 01/06 фиксы
 
 Привет!
 
 Пофиксил все, а именно:
 
 1. перевел текстовые лейблы в стринг статики + UDkey в VM
 2. поправил
 3. все прокидывается VM прокидывается во вьюхи, синглтон оставил только для тестов
 4. методы переименовал, но не стал их выносить в отдельные саб вью, тк они используются 1 раз
 5. то же самое )
 6. переписал на форич как и в главной вьюхе
 7. теперь кнопка сохранить задачу возвращает на главный экран, так же как и кнопка сохранить изменения
 
 8. Поправил сортировку задач при изменении статуса выполнено/нет - теперь сортируются только задачи в блоке
    с этим статусом, а не вообще все
 
 */

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
            .navigationTitle(String.tasksList)
        }
        .navigationViewStyle(.stack)
    }
    
    private func isExpanded(_ section: String) -> Bool {
        sectionState[section] ?? false
    }
    
    @ViewBuilder
    private func buildCreateTaskSection() -> some View {
        NavigationLink {
//            CreateTaskView(tasks: tasks)
//            let task: some CreateTaskVMProtocol = CreateTaskVM()
            CreateTaskView(tasks: tasks, task: CreateTaskVM())
        } label: {
            Text(String.addTask)
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func buildHeaderSection(priority: TaskPriority) -> some View {
        HStack {
            Text(priority.rawValue)
            Spacer()
            Text("\(tasks.taskStorage.filter { $0.priority == priority }.count)")
        }
        .padding()
        .background(priority.color)
        .cornerRadius(16)
    }
    
    @ViewBuilder
    private func buildTaskSection(priority: TaskPriority) -> some View {
        ForEach(tasks.taskStorage.filter { $0.priority == priority} ) { task in
            NavigationLink {
                CnangeTaskView(newTask: task, allTasks: tasks)
            } label: {
                TaskCellView(task: task)
            }
            .swipeActions(edge: .trailing) {
                Button(role: .destructive) {
                    let index = tasks.taskStorage.firstIndex(of: task)
                    tasks.taskStorage.remove(at: index!)
                } label: {
                    Image(systemName: Images.delete.rawValue)
                }
            }
            .swipeActions(edge: .leading) {
                Button {
                    let index = tasks.taskStorage.firstIndex(of: task)
                    tasks.taskStorage[index!].isDone.toggle()
                    
                    withAnimation(.easeIn) {
                        tasks.taskStorage.sort(by: { t1, _ in
                            !t1.isDone && t1.priority == priority
                        })
                    }
                    
                } label: {
                    Image(task.isDone ? Images.changeToNotDone.rawValue : Images.changeToDone.rawValue)
                }
            }
        }
    }
}





