//
//  ToDoModel.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/19/23.
//

import Foundation

struct ToDo: Identifiable {
  let id = UUID()
  let name: String
  var details: [ToDoDetails]?
}

struct ToDoDetails: Identifiable {
  let id = UUID()
  let status: String
}


class ToDoModel: ObservableObject {
  @Published var toDos: [ToDo] = [
    ToDo(name: "Learn Swfit UI", details: [ToDoDetails(status: "To do")]),
    ToDo(name: "Build an app", details: [ToDoDetails(status: "To do")]),
    ToDo(name: "Release the app", details: [ToDoDetails(status: "Completed")])
  ]
  
  @Published var isSheetShowing: Bool = false

  func addToDo(toDoName: String) {
    toDos.append(ToDo(name: toDoName, details: [ToDoDetails(status: "To do")]))
  }
}
