//
//  ContentView.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var CardVM = CardViewModel()
    
    @State var remindLaterCards = [Int]()
    
    @State var dismissedCards:[Int] = UserDefaultsRepository.GET(key: UserDefaultKey.dismissCardList) ?? []
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    VStack {
                        Image("fampaylogo")
                            .resizable()
                    }
                    .frame(width: 80, height: 30, alignment: .center)
                    .offset(x:0, y: -20)
                    
                    ScrollView {
                        if !CardVM.cards.isEmpty {
                            ForEach(CardVM.cards[0].cardGroups) { cardGroup in
                                
                                switch cardGroup.designType {
                                    
                                case CardTypes.HC1.rawValue:
                                    HC1(Card: cardGroup)
                                    
                                case CardTypes.HC3.rawValue:
                                    if !remindLaterCards.contains(cardGroup.cardId) && !dismissedCards.contains(cardGroup.cardId) {
                                        HC3(Card: cardGroup, remindLaterCards: $remindLaterCards, dismissedCards: $dismissedCards)
                                    }
                
                                case CardTypes.HC5.rawValue:
                                    HC5(Card: cardGroup)
                                        
                                case CardTypes.HC6.rawValue:
                                    HC6(Card: cardGroup)
                                       
                                case CardTypes.HC9.rawValue:
                                    HC9(Card: cardGroup)
                                    
                                default:
                                    EmptyView()
                                }
                            }
                            .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                        }
                    }.background(Color(hexStringToUIColor(hex: "#F7F6F3")))
                    
                    Spacer()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            Task {
                do {
                    try await CardVM.fetchCards(with: Keys.getCards)
                }catch {
                    print("❌ \(error.localizedDescription)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
