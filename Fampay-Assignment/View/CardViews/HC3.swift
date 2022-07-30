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
        ZStack {
            
            Color.white
            
            hc3BottomCardUI(card: card)
            
            hc3CardTopUI(card: card)
            
        }.frame(height: 400, alignment: .center)
            .shadow(color: .gray.opacity(0.5), radius: 3, x: 0, y: 0)
            .cornerRadius(12)
            .onTapGesture {
                openURL(URL(string: card.url)!)
            }
            .onLongPressGesture {
                print("long pressss")
            }
    }
    
    
    // MARK: - Top Visible Card UI
    @ViewBuilder
    func hc3CardTopUI(card: Card) -> some View {
        AsyncImage(url: URL(string: card.bgImage?.imageURL ?? "")) { image in
            image.resizable()
                .aspectRatio(card.bgImage?.aspectRatio ?? 1, contentMode: .fit)
        } placeholder: {
            Color(hexStringToUIColor(hex: card.bgColor ?? "#000000"))
        }
        
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
        .padding(.top, 125)
    }
    
    
    // MARK: - Card Bottom UI
    @ViewBuilder
    func hc3BottomCardUI(card: Card) -> some View {
        VStack(spacing: 37) {
            
            hc3Button(image: "Subtract", title: "remind later") {
                print("subtract card")
            }
            
            hc3Button(image: "Dismiss", title: "dismiss now") {
                print("dismiss button")
            }
            
        }
        .padding(.leading, 21)
        .hLeading()
    }
    
    
    // MARK: - Custom Button Builder
    @ViewBuilder
    func hc3Button(image:String, title: String ,action: @escaping (()->Void)) -> some View {
        Button {
            
            action()
            
        }label: {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                
                Text(title)
                    .font(.roboto(weight: .regular, size: 10))
                    .foregroundColor(.black)
            }
            .frame(width: 72, height: 59)
            .background(Color(hexStringToUIColor(hex: "#F7F6F3")))
            .cornerRadius(12)
        }
    }
}


//struct HC3_Previews: PreviewProvider {
//    static var previews: some View {
//        HC3()
//    }
//}
