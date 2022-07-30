//
//  HC9.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC9: View {
    
    @State var Card: CardGroup
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Card.cards) { card in
                        hc9CardUI(card: card)
                    }
                }
            }
        }
        
        if !Card.isScrollable {
            ForEach(Card.cards) { card in
                hc9CardUI(card: card)
            }
        }
    }
}

extension HC9 {
    @ViewBuilder
    func hc9CardUI(card: Card) -> some View {
        ZStack {
            AsyncImage(url: URL(string: card.bgImage?.imageURL ?? "")!) { image in
                image.resizable()
            } placeholder: {
                ZStack {
                    Color.white
                    
                    Image("logo")
                        .resizable()
                }
            }.aspectRatio(card.bgImage?.aspectRatio ?? 1, contentMode: .fit)
                .cornerRadius(5)
                .padding(3)
            
        }.frame(height: 195)
            .cornerRadius(5)
            .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
            .onTapGesture {
                openURL(URL(string: card.url)!)
            }
    }
}

//struct HC9_Previews: PreviewProvider {
//    static var previews: some View {
//        HC9()
//    }
//}
