//
//  ContentView.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var CardVM = CardViewModel()
    
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
                                ForEach(cardGroup.cards) { card in
                                    
                                    switch cardGroup.designType {
                                        
                                    case CardTypes.HC1.rawValue:
                                        EmptyView()
                                        
                                    case CardTypes.HC3.rawValue:
                                        EmptyView()
                                        
                                    case CardTypes.HC5.rawValue:
                                        EmptyView()
                                        
                                    case CardTypes.HC6.rawValue:
                                        HC6(CardVM: card)
                                        
                                    case CardTypes.HC9.rawValue:
                                        EmptyView()
                                        
                                    default:
                                        EmptyView()
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    
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
