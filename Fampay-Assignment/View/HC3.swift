//
//  HC3.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC3: View {
    @State var Card: CardGroup
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Card.cards) { card in
                        hc3CardUI(card: card)
                            .frame(width: UIScreen.main.bounds.width)
                            .cornerRadius(10)
                    }
                }
            }
        }
        
        if !Card.isScrollable {
            VStack {
                ForEach(Card.cards) { card in
                    hc3CardUI(card: card)
                        .padding(.leading, 5)
                }
            }
        }
    }
}

extension HC3 {
    @ViewBuilder
    func hc3CardUI(card: Card) -> some View {
        ZStack {
            AsyncImage(url: URL(string: card.bgImage?.imageURL ?? "")) { image in
                image.resizable()
                // image.aspectRatio(Card.bgImage?.aspectRatio ?? 1, contentMode: .fill)
            } placeholder: {
                Color(hexStringToUIColor(hex: card.bgColor ?? "#000000"))
            }
            
            VStack {
                
                Text(card.title ?? "Error")
                
                HStack{
                    Button{
                        print("Action")
                    }label: {
                        Text("Action")
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50, alignment: .center)
                            .background(.black)
                            .cornerRadius(10)
                    }
                }.hLeading()
            }
            .padding()
            
        }.frame(height: 400, alignment: .center)
            .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
            .cornerRadius(12)
            .onTapGesture {
                openURL(URL(string: card.url)!)
            }
    }
}

//struct HC3_Previews: PreviewProvider {
//    static var previews: some View {
//        HC3()
//    }
//}
