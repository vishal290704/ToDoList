//
//  LoginView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .red)

                Spacer().frame(height: 30)

                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.callout)
                    }

                    TextField("Email Address", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .textFieldStyle(DefaultTextFieldStyle())

                    SecureField("Password", text: $viewModel.password)
                        .textContentType(.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .onSubmit {
                            viewModel.login()
                        }

                    Section {
                        TLbutton(title: viewModel.isLoading ? "Logging In..." : "Log In",
                                 background: .blue) {
                            viewModel.login()
                        }
                        .disabled(viewModel.isLoading)
                        .listRowInsets(EdgeInsets())
                    }
                }

                // Create an account
                VStack {
                    Text("New here?")
                    NavigationLink("Create an account",
                                   destination: RegisterView(viewModel: RegisterViewViewModel()))
                }
                .padding(.bottom, 20)

                Spacer()
            }
            .navigationBarHidden(true)
            .overlay {
                if viewModel.isLoading {
                    ZStack {
                        Color.black.opacity(0.2).ignoresSafeArea()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
