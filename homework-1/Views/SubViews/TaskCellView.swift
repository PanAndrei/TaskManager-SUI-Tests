//
//  TaskCellView.swift
//  homework-1
//
//  Created by Andrei Panasenko on 29.05.2022.
//

import SwiftUI

struct TaskCellView: View {
    let task: TaskModel
    
    var body: some View {
        HStack {
            VStack {
                Text(task.taskName)
                    .font(.system(size: 14, weight: .heavy))
                Text(task.taskText)
                    .font(.system(size: 14, weight: .medium))
            }
            
            Spacer()
            
            Image(task.priority.rawValue)
                .resizable()
                .frame(width: 30, height: 30)
            
            Image(task.isDone ? Images.isDone.rawValue : Images.isNotDone.rawValue)
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}
