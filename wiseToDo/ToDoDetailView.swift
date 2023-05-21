//
//  ToDoDetailView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/18/23.
//

import SwiftUI

struct ToDoDetailView: View {
  let toDoDetails: ToDoEntity
  
    var body: some View {
      VStack {
        Group {
          Text(toDoDetails.name ?? "" ).font(.title3).fontWeight(.semibold).padding(.leading).frame(maxWidth: .infinity, alignment: .leading)
          List {
            Text("Status: \(toDoDetails.status ?? "")")
              .swipeActions {
                if (toDoDetails.status != "Completed") {
                  Button(action: {
                    toDoDetails.status = "Competed"
                    CoreDataStack.shared.saveContext()
                  }) {
                    Label("Complete", systemImage: "checkmark")
                  }
                  .tint(.green)
                }
              }
                Text("Notes: \(toDoDetails.notes ?? "")")
                  .foregroundColor(Color.gray)
                  .frame(height: 100.0, alignment: .top)
                  .multilineTextAlignment(.trailing)
                }
               
          }
        
      }
    }
}

//struct ToDoDetailView_Previews: PreviewProvider {
//  static var toDos = [
//    ToDo(name: "Learn Swfit UI", details: [ToDoDetails(status: "todo")]),
//    ToDo(name: "Build an app", details: [ToDoDetails(status: "todo")]),
//    ToDo(name: "Release the app", details: [ToDoDetails(status: "completed")])
//  ]
//    static var previews: some View {
//        ToDoDetailView(toDoDetails: ToDoEntity)
//    }
//}
