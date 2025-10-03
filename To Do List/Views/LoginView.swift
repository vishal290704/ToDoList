//
//  LoginView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import SwiftUI

struct LoginView: View {
//    @StateObject var viewModel = LoginViewViewModel()
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView{
            VStack {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .red)
                //Login Form
                Form{
                    TextField("Email Address", text: $email)
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $password)
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLbutton(title: "Log In", background: .blue) {
                        //Attemt to login
                    }.padding()
                }
                    //Create an acoount
                    VStack{
                        Text("New Here")
//                            .font(.system(size: 15, weight: .semibold))
                        
                        
                        NavigationLink("Create an account", destination: RegisterView())
                    }
                    .padding(.bottom, 20)
                    Spacer()
                }
            }
        }
}
#Preview {
    LoginView()
}
