//
//  SettingsView.swift
//  wiseToDo
//
//  Created by Jason Wise on 5/19/23.
//

import SwiftUI

struct SettingsView: View {
  @State private var hasCustomStatus = false

    var body: some View {
      List {
        Toggle("Use Custom Status", isOn: $hasCustomStatus)
        Text("Has custom status").disabled(hasCustomStatus)  .foregroundColor(hasCustomStatus ? .primary : .gray)
      }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
