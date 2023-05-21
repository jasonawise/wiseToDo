//
//  AddToDoView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/18/23.
//

import SwiftUI

struct AddToDoView: View {
  @State private var name: String = ""
  @State private var selectedOption: String = "To do"
  @State private var fullText: String = "Add Notes..."

  @ObservedObject var toDoStatus = ToDoStatusModel()
  @Environment(\.presentationMode) var presentationMode

  
  var body: some View {
    Form {
      Section(header: Text("What do you want to do?")) {
        TextField("Todo ....", text: $name)
      }
      
      Section(header: Text("Details")) {
        Picker(selection: $selectedOption, label: Text("Task Status")) {
          ForEach(toDoStatus.status, id: \.status) { option in
            Text(option.status)
          }
        }
        TextEditor(text: $fullText)
          .frame(height: 200)
    }
      Button(action: {
        let newTodo = ToDoEntity(context: CoreDataStack.shared.context)
        newTodo.name = name
        newTodo.status = selectedOption
        newTodo.notes = fullText
        CoreDataStack.shared.saveContext()
        return presentationMode.wrappedValue.dismiss()
      }) {
        Text("Add")
      }
     
    }
  }
}

struct AddToDoView_Previews: PreviewProvider {
  static var previews: some View {
    AddToDoView()
  }
}
