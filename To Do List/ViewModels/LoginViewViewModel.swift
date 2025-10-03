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

    init(){}
    
    func login(){
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
    }
    
    func validate(){
        
    }
}
