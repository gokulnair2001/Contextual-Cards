//
//  ToastView.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 31/07/22.
//

import Foundation
import SwiftUI

struct ToastView: View {
    
    // Toast text
    @State var text: String
    // Toast icon name
    @State var icon: String
    // Toast logo color
    @State var logoColor: Color = .orange
    
    // Binding var to present toast
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack() {
            
            Spacer()
            
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .resizable()
                    .font(Font.title.weight(.medium))
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(logoColor)
                
                Text(text)
                    .font(.custom("Avenir Medium", size: 18))
                    .foregroundColor(.primary)
                
            }
            .padding(8)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(Color(hexStringToUIColor(hex: "#F7F6F3")))
            .cornerRadius(15)
            .frame(alignment: .center)
            .shadow(color: .gray.opacity(0.6), radius: 1, x: 0, y: 0)
            .padding()
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isShowing.toggle()
                }
            }
        }
        .padding(.top, 20)
    }
}


struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(text: "Removed from view", icon: "rectangle.grid.1x2", isShowing: .constant(true))
    }
}
