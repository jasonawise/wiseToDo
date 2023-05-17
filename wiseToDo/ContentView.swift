//
//  ContentView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import SwiftUI

struct ToDo: Identifiable {
  let id = UUID()
  let name: String
}

struct ContentView: View {
  @State private var toDos = [
    ToDo(name: "Learn Swift UI"),
    ToDo(name: "Build an app"),
    ToDo(name: "Release the app")
  ]
  
    var body: some View {
      VStack {
        List {
          ForEach(toDos) { toDo in
            Text(toDo.name)
          }
          .onDelete(perform: delete)
        }
      }
    }
  
  func delete(at offset: IndexSet) {
    toDos.remove(atOffsets: offset)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
