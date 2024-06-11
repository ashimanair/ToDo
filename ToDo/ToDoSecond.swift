//
//  NewToDoView.swift
//  ToDoList & SwiftData
//
//  Created by Scholar on 6/11/24.
//

import SwiftUI
import SwiftData

struct ToDoSecond: View {
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool

    var body: some View {
        VStack {
            Text("Task Title: ")
                .font(.title)
                .bold()
            
            //from library
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
            
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it important?")
                    .padding()
            }
            
            Button {
                addToDo()
                self.showNewTask = false
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
    
    func addToDo() {
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

//#Preview {
//    ToDoSecond()
//}
