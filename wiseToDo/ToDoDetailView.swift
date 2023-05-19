//
//  ToDoDetailView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/18/23.
//

import SwiftUI

struct ToDoDetailView: View {
  let toDoDetails: ToDo
  
    var body: some View {
      VStack {
        Group {
          Text(toDoDetails.name).font(.title3).fontWeight(.semibold).padding(.leading).frame(maxWidth: .infinity, alignment: .leading)
          List {
            Text("Status: \(toDoDetails.details![0].status)")
          }
        }
      }
    }
}

struct ToDoDetailView_Previews: PreviewProvider {
  static var toDos = [
    ToDo(name: "Learn Swfit UI", details: [ToDoDetails(status: "todo")]),
    ToDo(name: "Build an app", details: [ToDoDetails(status: "todo")]),
    ToDo(name: "Release the app", details: [ToDoDetails(status: "completed")])
  ]
    static var previews: some View {
        ToDoDetailView(toDoDetails: toDos[0])
    }
}
