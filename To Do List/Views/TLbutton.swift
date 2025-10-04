//
//  TLbutton.swift
//  To Do List
//
//  Created by Vishal Srivastava on 03/10/25.
//

import SwiftUI

struct TLbutton: View {
    let title: String
    let background:  Color
    let action: () -> Void
    
    
    var body: some View {
        Button {
            //Action
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .frame(height: 40)
                
                
            }
//            .padding()
        }
        
    }

    }
#Preview {
    TLbutton(title: "Value", background: .pink){
        
    }
}

