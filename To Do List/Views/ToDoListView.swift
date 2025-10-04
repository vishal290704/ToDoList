//
//  ToDoListItemsView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import SwiftUI
import FirebaseAuth

struct ToDoListView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome to your account!")
            Button("Sign Out") {
                try? Auth.auth().signOut()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}

#Preview {
    ToDoListView()
}
