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
//        ZStack{
//            RoundedRectangle(cornerRadius: 0)
//                .foregroundColor(background)
//                .rotationEffect(Angle(degrees:angle))
////                .frame(width: UIScreen.main.bounds.width * 3, height: 300)
//                
//            
//            VStack{
//                Text(title)
//                    .font(.system(size: 50))
//                    .foregroundColor(Color.white)
//                    .bold()
//                
//                Text(subtitle)
//                    .foregroundColor(Color.white)
//                    .font(.system(size: 30))
//                
//            }
//            .padding(.top, 220)
//        }
//        .frame(width: UIScreen.main.bounds.width * 4, height: 500)
//        .offset(y: -250)
//        .frame(height: 300)
//    Spacer()
        
        ZStack {
                    // Rotated rectangle background
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(background)
                        .rotationEffect(Angle(degrees: angle))
                        .frame(width: UIScreen.main.bounds.width * 2, height: 400)
                        .offset(y: -150)
                    
                    VStack(spacing: 10) {
                        Text(title)
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(subtitle)
                            .font(.system(size: 22, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .padding(.top, -120)
                }
                .frame(height: 250)
    }
        
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .red)
}

