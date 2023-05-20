//
//  wiseToDoApp.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/16/23.
//

import SwiftUI

@main
struct wiseToDoApp: App {
  let coreDataStack = CoreDataStack.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, coreDataStack.context)
        }
    }
}
