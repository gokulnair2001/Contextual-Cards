//
//  HC3.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC3: View {
    
    /// Card model instance
    @State var Card: CardGroup
    
    /// Binding var for remind later
    @Binding var remindLaterCards:[Int]
    /// Binding var for dismissed cards
    @Binding var dismissedCards:[Int]
    /// Binding var for showing toast
    @Binding var isShowingToast:Bool
    
    /// Card slide animation tracker
    @State var isSlided = false
    /// Card position tracker
    @State var xPos = 0
    
    /// Environment key to openURL
    @Environment(\.openURL) var openURL
    
    var body: some View {
        if Card.isScrollable {
            ScrollView(.horizontal, showsIndicators: false) {
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

// MARK: - HC3 Card View Builders
extension HC3 {
    // HC3 Card UI builder
    @ViewBuilder
    func hc3CardUI(card: Card) -> some View {
        ZStack {
            
            Color.white
            
            hc3BottomCardUI(card: card)
                .background(.white)
                .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 0)
                .onTapGesture {
                    slideCard()
                }
            
            hc3CardTopUI(card: card)
                .offset(x: CGFloat(xPos), y: 0)
                .onTapGesture {
                    openURL(URL(string: verifiedUrl(card.url))!)
                }
            
        }.frame(height: 400, alignment: .center)
            .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 0)
            .cornerRadius(12)
            .onLongPressGesture {
                slideCard()
            }
            .zIndex(0)
    }
    
    
    // MARK: Top Visible Card UI
    @ViewBuilder
    func hc3CardTopUI(card: Card) -> some View {
        ZStack {
            AsyncImage(url: URL(string: card.bgImage?.imageURL ?? "")) { image in
                image.resizable()
                    .cornerRadius(12)
                    .aspectRatio(CGFloat(card.bgImage?.aspectRatio ?? 1), contentMode: .fill)
            } placeholder: {
                Color(hexStringToUIColor(hex: card.bgColor ?? "#000000"))
            }
            
            VStack(alignment: .leading, spacing: 28) {
                
                customCardText(entity: formatText(input: (card.formattedTitle?.text ?? card.title) ?? "",
                                                  replaceBy: card.formattedTitle?.entities ?? [Entity].init()))
                    .font(.roboto(weight: .medium, size: 30))
                    .frame(alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.trailing, 27)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                customCardText(entity: formatText(input: (card.formattedDescription?.text ?? card.cardDescription) ?? "",
                                                  replaceBy: card.formattedDescription?.entities ?? [Entity].init()))
                    .font(.roboto(weight: .regular, size: 14))
                    .padding(.leading, 20)
                    .padding(.trailing, 40)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .hLeading()
                
                HStack{
                    Button{
                        openURL(URL(string: verifiedUrl(card.cta?[0].url ?? ""))!)
                    }label: {
                        Text(card.cta?[0].text ?? "Action")
                            .font(.roboto(weight: .medium))
                            .foregroundColor(Color(hexStringToUIColor(hex: card.cta?[0].textColor ?? "#ffffff")))
                            .frame(width: 128, height: 42, alignment: .center)
                            .background(Color(hexStringToUIColor(hex: card.cta?[0].bgColor ?? "#000000")))
                            .cornerRadius(6)
                    }
                }.padding(.leading, 20)
            }
            .frame(width: UIScreen.main.bounds.width-60, height: (400-125))
            .padding(.top, 125)
        }.zIndex(1)
    }
    
    
    // Card Bottom UI
    @ViewBuilder
    func hc3BottomCardUI(card: Card) -> some View {
        VStack(spacing: 37) {
            
            hc3Button(image: "Subtract", title: "remind later") {
                withAnimation {
                    remindLaterCards.append(Card.cardId)
                    isShowingToast.toggle()
                }
            }
            
            hc3Button(image: "Dismiss", title: "dismiss now") {
                dismissCard()
            }
            
        }.frame(height: 400)
            .padding(.leading, 31)
            .hLeading()
    }
    
    
    // Custom Button Builder
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

// MARK: - HC3 Card Methods
extension HC3 {
    // Card Slide animation method
    func slideCard() {
        withAnimation {
            isSlided.toggle()
            xPos = isSlided ? 140 : 0
        }
    }
    
    // Method to dismiss card
    func dismissCard() {
        if !dismissedCards.contains(Card.cardId) {
            withAnimation {
                dismissedCards.append(Card.cardId)
                isShowingToast.toggle()
            }
            UserDefaultsRepository.SET(key: UserDefaultKey.dismissCardList, value: dismissedCards)
            slideCard()
        }
    }

}
