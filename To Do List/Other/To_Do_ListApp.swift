//
//  To_Do_ListApp.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//
import FirebaseCore
import SwiftUI

@main
struct To_Do_ListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
