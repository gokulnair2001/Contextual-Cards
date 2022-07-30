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
                        // .frame(width: UIScreen.main.bounds.width)
                        //.cornerRadius(10)
                    }
                }
            }
        }
        
        if !Card.isScrollable {
            VStack {
                ForEach(Card.cards) { card in
                    hc3CardUI(card: card)
                }
            }
        }
    }
}

extension HC3 {
    @ViewBuilder
    func hc3CardUI(card: Card) -> some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: URL(string: card.bgImage?.imageURL ?? "")) { image in
                image.resizable()
                    .aspectRatio(card.bgImage?.aspectRatio ?? 1, contentMode: .fit)
            } placeholder: {
                Color(hexStringToUIColor(hex: card.bgColor ?? "#000000"))
            }//.aspectRatio(card.bgImage?.aspectRatio ?? 1, contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 28) {
                
                Text(card.title ?? "Error")
                    .font(.roboto(weight: .medium, size: 30))
                    .padding(.leading, 20)
                    .padding(.trailing, 27)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .hLeading()
                
                Text(card.cardDescription ?? "Error")
                    .font(.roboto(weight: .regular, size: 12))
                    .padding(.leading, 20)
                    .padding(.trailing, 40)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .hLeading()
                
                HStack{
                    Button{
                        print("Action")
                    }label: {
                        Text("Action")
                            .font(.roboto(weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 128, height: 42, alignment: .center)
                            .background(.black)
                            .cornerRadius(6)
                    }
                }.padding(.leading, 20)
            }
            .frame(width: UIScreen.main.bounds.width-60, height: (400-125))
            
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
