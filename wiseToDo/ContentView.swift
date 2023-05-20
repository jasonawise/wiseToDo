//
//  ContentView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
//  @StateObject private var data = ToDoModel()
  @State private var isSheetShowing: Bool = false
  @Environment(\.managedObjectContext) private var viewContext

  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \ToDoEntity.name, ascending: true)],
    animation: .default)
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
              isSheetShowing = true
              let newTodo = ToDoEntity(context: CoreDataStack.shared.context)
              newTodo.name = "New To DO from core data again!! with status"
              newTodo.status = "To do"
              CoreDataStack.shared.saveContext()
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
      .sheet(isPresented: $isSheetShowing ) {
//        AddToDoView(data: data)
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
