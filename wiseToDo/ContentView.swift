//
//  ContentView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var data = ToDoModel()

  var body: some View {
    VStack {
      NavigationView {
        List {
          ForEach(data.toDos) { todo in
            NavigationLink(destination: ToDoDetailView(toDoDetails: todo)) {
              Text(todo.name)
            }
          }
          .onDelete { indexSet in
            data.toDos.remove(atOffsets: indexSet)
          }
        }
        .navigationTitle("To Do's")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
              // Add action for the toolbar button
            }) {
              Image(systemName: "gear")
            }
          }
        }
      }
      .overlay(
        VStack {
          Spacer()
          HStack {
            Spacer()
            Button(action: {
              // Add action for the plus button
            }) {
              Image(systemName: "plus")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
            }
            .padding()
          }
        }
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
