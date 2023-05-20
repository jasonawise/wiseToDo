//
//  ToDoStatusModel.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/19/23.
//

import Foundation

struct ToDoStatus: Codable {
  var status: String
}

class ToDoStatusModel: ObservableObject {
  @Published var status: [ToDoStatus] = [
    ToDoStatus(status: "To do"),
    ToDoStatus(status: "In progress"),
    ToDoStatus(status: "Completed")
  ]
}
