//
//  ContentView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import CoreData
import SwiftUI

struct ContentView: View {
  @State private var isSheetShowing: Bool = false
  @Environment(\.managedObjectContext) private var viewContext

  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \ToDoEntity.name, ascending: true)],
    animation: .default
  )
  private var todos: FetchedResults<ToDoEntity>

  var body: some View {
    VStack {
      
      NavigationView {
        List {
          ForEach(todos) { todo in
            NavigationLink(destination: ToDoDetailView(toDoDetails: todo)) {
              Text(todo.name ?? "")
            }
          }
          .onDelete { indexSet in
            deleteToDoEntries(at: indexSet)
          }
        }
        .navigationTitle("Task List")
        
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: SettingsView()) {
              HStack {
                Image(systemName: "line.3.horizontal.decrease.circle")
                  
                  
              }
            }
          }
          ToolbarItem(placement: .navigationBarLeading) {
            NavigationLink(destination: SettingsView()) {
              HStack {
                Image(systemName:  "gear")
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
              isSheetShowing = true
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
      .sheet(isPresented: $isSheetShowing) {
        AddToDoView()
      }
      .onChange(of: isSheetShowing) { isSheetShowing in
        if !isSheetShowing {
          withAnimation(.easeOut(duration: 0.95)) {
            // Any additional view updates or actions when the sheet closes
          }
        }
      }
    }
    .onDisappear {
      CoreDataStack.shared.saveContext()
    }
  }

  private func deleteToDoEntries(at offsets: IndexSet) {
    offsets.forEach { index in
      let todo = todos[index]
      viewContext.delete(todo)
    }

    do {
      try viewContext.save()
    } catch {
      print("Error deleting entries: \(error)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
