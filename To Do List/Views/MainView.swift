//
//  ContentView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()

    // Track session transition from signed-out -> signed-in
    @State private var wasSignedIn = false
    @State private var showWelcome = false

    var body: some View {
        Group {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                ToDoListView()
                    .onAppear {
                        // Initialize state based on current auth status
                        wasSignedIn = true
                    }
                    .onChange(of: viewModel.currentUserId) { newValue in
                        let nowSignedIn = !newValue.isEmpty
                        // Show welcome only when transitioning from signed-out to signed-in during this app session
                        if nowSignedIn && wasSignedIn == false {
                            showWelcome = true
                        }
                        wasSignedIn = nowSignedIn
                    }
                    .sheet(isPresented: $showWelcome) {
                        VStack(spacing: 16) {
                            Text("Welcome to your account!")
                                .font(.title2)
                                .padding(.top, 8)
                            Button("Continue") {
                                showWelcome = false
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .padding()
                    }
            } else {
                LoginView()
                    .onAppear {
                        wasSignedIn = false
                        showWelcome = false
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
