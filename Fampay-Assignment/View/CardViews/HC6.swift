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
            .aspectRatio(card.bgImage?.aspectRatio ?? 1, contentMode: .fill)
            .frame(width: 30, height: 30)
            
            textGenerator(entity: formatText(input: (card.formattedTitle?.text ?? card.title) ?? "ERROR", replaceBy: card.formattedTitle?.entities ?? [Entity].init()))
                .font(.roboto(weight: .medium, size: 14))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 10, height: 16)
            
        }.padding(.horizontal, 20)
        .hLeading()
        .onTapGesture {
            openURL(URL(string: card.url)!)
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 60)
         .background(Color(hexStringToUIColor(hex: card.bgColor ?? "#ffffff")))
         .cornerRadius(15)
         .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
    }
}
