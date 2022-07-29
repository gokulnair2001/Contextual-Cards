//
//  HC6.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC6: View {
    
    @State var Card: CardGroup
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Card.cards) { card in
                       hc6CardUI(card: card)
                    }
                }
            }
        }
        
        if !Card.isScrollable {
            HStack {
                ForEach(Card.cards) { card in
                   hc6CardUI(card: card)
                        .padding(.leading, 7)
                }
            }
        }
    }
}

extension HC6 {
    @ViewBuilder
    func hc6CardUI(card: Card) -> some View {
        HStack {
            AsyncImage(url: URL(string: card.icon?.imageURL ?? "")) { image in
                image.resizable()
            } placeholder: {
                Color.yellow
            }
            .frame(width: 20, height: 20)
            
            Text(card.formattedTitle?.text ?? "")
            
        }.onTapGesture {
            openURL(URL(string: card.url)!)
            
        }.frame(height: 100)
            .background(Color(hexStringToUIColor(hex: card.bgColor ?? "#ffffff")))
    }
}
