//
//  MainViewViewModel.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self]_, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? "" 
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
