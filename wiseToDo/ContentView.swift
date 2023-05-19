//
//  ContentView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import SwiftUI

struct ToDoDetails: Identifiable {
  let id = UUID()
  let status: String
}

struct ToDo: Identifiable {
  let id = UUID()
  let name: String
  var details: [ToDoDetails]?
}

struct ContentView: View {
  @State private var toDos = [
    ToDo(name: "Learn Swfit UI", details: [ToDoDetails(status: "todo")]),
    ToDo(name: "Build an app", details: [ToDoDetails(status: "todo")]),
    ToDo(name: "Release the app", details: [ToDoDetails(status: "completed")])
  ]

  var body: some View {
    VStack {
      NavigationView {
        List {
          ForEach(toDos) { todo in
            NavigationLink(destination: ToDoDetailView(toDoDetails: todo)) {
              Text(todo.name)
            }
          }
          .onDelete { indexSet in
            toDos.remove(atOffsets: indexSet)
          }
        }
        .navigationTitle("To Do's")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
