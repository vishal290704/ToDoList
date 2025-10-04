//
//  RegisterView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
                    
                
                Form{
                    TextField("Enter full name", text: $name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Enter E-mail Adress", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Section {
                        TLbutton(title: "Create account", background: .green) {
//                            viewModel.login()
                        }
                        .listRowInsets(EdgeInsets()) // optional, removes default side padding
                    }

                }
//                .offset(y: 50)
                
            }
            
        }
    
}
}
    
    



#Preview {
    RegisterView()
}
