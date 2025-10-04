//
//  RegisterViewViewModel.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessage = ""
    @Published var didRegister = false

    init() {}

    func register() {
        // Clear any previous message
        errorMessage = ""

        guard validate() else {
            errorMessage = "Please fill all fields correctly."
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }

            if let error = error {
                let nsError = error as NSError
                DispatchQueue.main.async {
                    if let code = AuthErrorCode(rawValue: nsError.code) {
                        switch code {
                        case .operationNotAllowed:
                            self.errorMessage = "Email/Password sign-in is disabled for this Firebase project. Enable it in Firebase Console → Authentication → Sign-in method."
                        case .invalidEmail:
                            self.errorMessage = "The email address is badly formatted."
                        case .emailAlreadyInUse:
                            self.errorMessage = "An account already exists for this email."
                        case .weakPassword:
                            self.errorMessage = "Password should be at least 6 characters."
                        default:
                            self.errorMessage = error.localizedDescription
                        }
                    } else {
                        self.errorMessage = error.localizedDescription
                    }
                }
                return
            }

            guard let userId = result?.user.uid else {
                DispatchQueue.main.async {
                    self.errorMessage = "Failed to get user ID."
                }
                return
            }

            self.insertUserRecord(id: userId)
        }
    }

    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)

        let db = Firestore.firestore()
        db.collection("Users").document(id)
            .setData(newUser.asDictionary()) { [weak self] error in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                    } else {
                        // Force the newly registered user to log in manually.
                        // Firebase automatically signs in after createUser; we sign out to enforce your flow.
                        do {
                            try Auth.auth().signOut()
                        } catch {
                            // Not fatal for the flow, but log if needed.
                            print("Sign out after registration failed: \(error)")
                        }
                        self.errorMessage = ""
                        self.didRegister = true
                    }
                }
            }
    }

    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard email.contains("@") && email.contains(".") else { return false }
        guard password.count >= 6 else { return false }

        return true
    }
}
