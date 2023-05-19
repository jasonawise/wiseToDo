//
//  ContentView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var data = ToDoModel()
  @State private var isShowingSheet = false
  
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
            NavigationLink(destination: SettingsView()) {
              HStack {
                Image(systemName: "gear")
              }
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
              isShowingSheet = true
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
      .sheet(isPresented: $isShowingSheet) {
        AddToDoView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
