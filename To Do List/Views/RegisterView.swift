//
//  RegisterView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 13/03/25.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel: RegisterViewViewModel
   @Environment(\.dismiss) private var dismiss

    init(viewModel: RegisterViewViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .orange)
                    
                
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Enter full name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Enter E-mail Adress", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Enter Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Section {
                        TLbutton(title: "Create account", background: .green) {
                            viewModel.register()
                        }
                        .listRowInsets(EdgeInsets()) // optional, removes default side padding
                    }

                }
//                .offset(y: 50)
                
            }
            .onChange(of: viewModel.didRegister) { didRegister in
                if didRegister {
                    // On success, dismiss back to previous screen (e.g., Login)
                    dismiss()
                }
            }
            
        }
    
}
}
    
    



#Preview {
    RegisterView(viewModel: RegisterViewViewModel())
}

