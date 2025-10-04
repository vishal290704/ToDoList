//
//  LoginViewViewModel.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//
import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoading = false

    init() {}

    func login() {
        guard validate() else { return }

        errorMessage = ""
        isLoading = true

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error as NSError? {
                    if let code = AuthErrorCode(rawValue: error.code) {
                        switch code {
                        case .invalidEmail:
                            self.errorMessage = "The email address is badly formatted."
                        case .userDisabled:
                            self.errorMessage = "This account has been disabled."
                        case .userNotFound:
                            self.errorMessage = "No account found for this email."
                        case .wrongPassword:
                            self.errorMessage = "Incorrect password. Please try again."
                        case .tooManyRequests:
                            self.errorMessage = "Too many attempts. Please try again later."
                        default:
                            self.errorMessage = error.localizedDescription
                        }
                    } else {
                        self.errorMessage = error.localizedDescription
                    }
                } else {
                    // Success: MainView will switch to ToDoListView via auth state listener.
                    self.errorMessage = ""
                }
            }
        }
    }

    private func validate() -> Bool {
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }

        guard email.contains("@"), email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }

        return true
    }
}
