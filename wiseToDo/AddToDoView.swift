//
//  AddToDoView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/18/23.
//

import SwiftUI

struct AddToDoView: View {
  @State private var name: String = ""
  @State private var selectedOption: String = "Option 1"
  let options = ["to do", "in progress", "completed"]

  var body: some View {
    Form {
      Section(header: Text("What Do you want to do?")) {
        TextField("Todo ....", text: $name)
      }

      Section(header: Text("Status")) {
        Picker(selection: $selectedOption, label: Text("Select an option")) {
          ForEach(options, id: \.self) { option in
            Text(option)
          }
        }
      }
      Button("Add") {
        // action to add to do
      }
    }
  }
}

struct AddToDoView_Previews: PreviewProvider {
  static var previews: some View {
    AddToDoView()
  }
}
