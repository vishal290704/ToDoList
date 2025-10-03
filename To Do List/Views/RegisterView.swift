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
                    TextField("Enter E-mail Adress", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Enter Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLbutton(title: "Create account", background: .green ) {
                        //Attempt registration
                    }
                }
                .offset(y: 50)
            }
            
        }
    
}
}
    
    



#Preview {
    RegisterView()
}
