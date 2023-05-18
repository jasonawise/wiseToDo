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
    ToDo(name: "Build an app",  details: [ToDoDetails(status: "todo")]),
    ToDo(name: "Release the app",  details: [ToDoDetails(status: "completed")])
  ]
  
  var body: some View {
    VStack {
      ForEach(toDos) { todo in
        CollapsibleView(
          label: { Text(todo.name) },
          content: {
            ForEach(todo.details!) { detail in
              HStack {
                Text(detail.status)
                Spacer()
              }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.secondary)
          }
        )
        .frame(maxWidth: .infinity)
        .padding()
      }
      Spacer()
    }
  }
}

  
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
