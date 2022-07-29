//
//  HC1.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC1: View {
    
    @State var Card: CardGroup
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Card.cards) { card in
                        hc1CardUI(card: card)
                            .frame(width: UIScreen.main.bounds.width - 40)
                    }
                }
            }
        }
        
        if !Card.isScrollable {
            ForEach(Card.cards) { card in
                hc1CardUI(card: card)
            }
        }
    }
}

extension HC1 {
    @ViewBuilder
    func hc1CardUI(card: Card) -> some View {
        HStack {
            AsyncImage(url: URL(string: card.icon?.imageURL ?? "")) { image in
                image.resizable()
                // image.aspectRatio(Card.bgImage?.aspectRatio ?? 1, contentMode: .fill)
            } placeholder: {
                Color(hexStringToUIColor(hex: card.bgColor ?? "#000000"))
            }
            .frame(width: 40, height: 40, alignment: .center)
            .cornerRadius(20)
            .padding(.leading, 10)
            
            VStack(spacing: 3) {
                Text(card.name)
                    .font(.custom("Avenir Medium", size: 14))
                    .fontWeight(.medium)
                
                Text(card.title ?? "Error")
                    .font(.custom("Avenir Light", size: 14))
                    .fontWeight(.light)
                
            }.frame(alignment: .leading)
                .padding(.leading, 10)
            
            Spacer()
            
        }.frame(height: 60)
         .background(Color(hexStringToUIColor(hex: card.bgColor ?? "#ffffff")))
         .cornerRadius(10)
         .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
         
        .onTapGesture {
            openURL(URL(string: card.url)!)
        }
    }
}

//struct HC1_Previews: PreviewProvider {
//    static var previews: some View {
//        HC1()
//    }
//}
