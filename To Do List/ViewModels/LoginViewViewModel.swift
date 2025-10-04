//
//  LoginViewViewModel.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//
import Foundation
class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){
        
    }
    
    func login() {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email"
            return
        }
        print("Called")
    }
    
    func Validate() {
        
    }
}
