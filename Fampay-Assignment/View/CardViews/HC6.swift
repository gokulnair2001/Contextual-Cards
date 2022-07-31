//
//  HC6.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC6: View {
    
    /// Card model instance
    @State var Card: CardGroup
    
    /// Environment key to openURL
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal, showsIndicators: false) {
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

// MARK: - HC6 Card View Builders
extension HC6 {
    // HC6 Card UI builder
    @ViewBuilder
    func hc6CardUI(card: Card) -> some View {
        HStack {
            AsyncImage(url: URL(string: card.icon?.imageURL ?? "")) { image in
                image.resizable()
            } placeholder: {
                Image("logo")
                    .resizable()
            }
            .aspectRatio(card.bgImage?.aspectRatio ?? 1, contentMode: .fill)
            .frame(width: 30, height: 30)
            
            VStack(alignment: .leading, spacing: 3) {
                customCardText(entity: formatText(input: (card.formattedTitle?.text ?? card.title) ?? "",
                                                  replaceBy: card.formattedTitle?.entities ?? [Entity].init()))
                .font(.roboto(weight: .medium, size: 14))
                
                
                customCardText(entity: formatText(input: (card.formattedDescription?.text ?? card.cardDescription) ?? "",
                                                  replaceBy: card.formattedDescription?.entities ?? [Entity].init()))
                .font(.roboto(weight: .regular, size: 14))
            }
            .padding(.leading, 15)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 10, height: 16)
            
        }.padding(.horizontal, 20)
            .hLeading()
            .onTapGesture {
                openURL(URL(string: verifiedUrl(card.url))!)
            }
            .frame(width: UIScreen.main.bounds.width - 30, height: 60)
            .background(Color(hexStringToUIColor(hex: card.bgColor ?? "#ffffff")))
            .cornerRadius(15)
    }
}
