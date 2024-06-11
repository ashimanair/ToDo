//
//  ContentView.swift
//  ToDoList & SwiftData
//
//  Created by Scholar on 6/11/24.
//hi

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                Spacer()
                
                Button {
                    //makes NewToDo pop up slower
                    withAnimation {
                        self.showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                }
            }
            .padding()
        }
                //pushes title to top
                //pushes title to top
                Spacer()
                
                List {
                    ForEach(toDos) { toDoItem in
                        if toDoItem.isImportant == true {
                            Text("‼️" + toDoItem.title)
                        } else {
                            Text(toDoItem.title)
                        }
                        // Text(toDoItem.title)
                    }
                    .onDelete(perform: deleteToDo)
                }
                .listStyle(.plain)
        
                //since its a boolean, its saying if showNewTask is true, you dont need to write == true
                if showNewTask {
                    ToDoSecond(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
                }
            }
    
            func deleteToDo(at offsets: IndexSet) {
                for offset in offsets {
                    let toDoItem = toDos[offset]
                    modelContext.delete(toDoItem)
                }
            }
}

#Preview {
    ContentView()
}


