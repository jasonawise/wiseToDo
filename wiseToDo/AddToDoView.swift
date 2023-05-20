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
  @ObservedObject var status = ToDoStatusModel()
  @ObservedObject var data = ToDoModel()
  
  var body: some View {
    Form {
      Section(header: Text("What do you want to do?")) {
        TextField("Todo ....", text: $name)
      }
      
      Section(header: Text("Status")) {
        Picker(selection: $selectedOption, label: Text("Select an option")) {
          ForEach(status.status, id: \.status) { option in
            Text(option.status)
          }
        }
        
        Button(action: {
          data.addToDo(toDoName: name)
          data.isSheetShowing.toggle()
        }) {
          Text("Add")
        }
        
    }
     
    }
  }
}

struct AddToDoView_Previews: PreviewProvider {
  static var previews: some View {
    AddToDoView()
  }
}
