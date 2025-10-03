//
//  HeaderView.swift
//  To Do List
//
//  Created by Vishal Srivastava on 14/03/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees:angle))
                
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    Spacer()
    }
        
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .red)
}

