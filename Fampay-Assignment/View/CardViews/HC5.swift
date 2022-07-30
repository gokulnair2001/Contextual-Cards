//
//  HC5.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC5: View {
    
    @State var Card: CardGroup
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Card.cards) { card in
                        hc5CardUI(card: card)
                            .frame(width: UIScreen.main.bounds.width-20)
                            .cornerRadius(10)
                    }
                }
            }
        }
        
        if !Card.isScrollable {
            HStack {
                ForEach(Card.cards) { card in
                    hc5CardUI(card: card)
                        .padding(.leading, 5)
                }
            }
        }
    }
}

extension HC5 {
    @ViewBuilder
    func hc5CardUI(card: Card) -> some View {
        HStack {
            AsyncImage(url: URL(string: card.bgImage?.imageURL ?? "")) { image in
                image.resizable()
                    .aspectRatio(CGFloat(card.bgImage?.aspectRatio ?? 1), contentMode: .fill)
            } placeholder: {
                ZStack {
                    Color.white
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }
        }.frame(height: 150, alignment: .center)
            .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
            .onTapGesture {
                openURL(URL(string: card.url)!)
            }
    }
}

//struct HC5_Previews: PreviewProvider {
//    static var previews: some View {
//        HC5()
//    }
//}
