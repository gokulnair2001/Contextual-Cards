//
//  ContentView.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct ContentView: View {
    
    /// ViewModel observing object
    @ObservedObject var CardVM = CardViewModel()
    
    /// Var used to track remindLater cards
    @State var remindLaterCards = [Int]()
    
    /// Used to show alerts
    @State private var showingAlert = false
    
    /// User default to track dismissed cards
    @State var dismissedCards:[Int] = UserDefaultsRepository.GET(key: UserDefaultKey.dismissCardList) ?? []
    
    /// Flag to check fetch status
    @State var isDataFetched = true
    
    /// Toast Flag
    @State var isShowingToast = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    
                    VStack {
                        Image("fampaylogo")
                            .resizable()
                    }
                    .frame(width: 86, height: 30, alignment: .center)
                    .offset(x:0, y: -20)
                    
                    /// Network Warning
                    if !isDataFetched {
                        ZStack {
                            networkWarning
                        }
                    }
                    
                    /// Main Card view
                    mainCardsView
                }
                .zIndex(2)
                
                // Toast View
                if isShowingToast {
                    ToastView(text: "Removed from list", icon: "rectangle.grid.1x2", logoColor: .orange, isShowing: $isShowingToast)
                        .transition(.move(edge: .bottom))
                        .zIndex(3)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"),
                      message: Text("Seems like you got into some issue😞!\nCheck your internet connection"),
                      primaryButton: .default(Text("Got it!")),
                      secondaryButton: .default(Text("Retry"), action: {
                    fetchCards()
                }))
            }
        }.onAppear {
            fetchCards()
        }
    }
}

// MARK: - ContentView views
extension ContentView {
    
    /// No Network Label
    var networkWarning: some View {
        
        HStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.white)
            
            Text("No connection")
                .font(.roboto(weight: .regular, size: 17))
            
        }.frame(width: UIScreen.main.bounds.width, height: 30, alignment: .center)
            .background(Color(hexStringToUIColor(hex: "#f0a834")))
    }
    
    /// Main Card View
    var mainCardsView: some View {
        ScrollView {
            /// Custom refreshable view
            PullToRefresh(spaceName: "refreshable") {
                fetchCards()
            }
            /// Safety check to present view
            if !CardVM.cards.isEmpty {
                ForEach(CardVM.cards[0].cardGroups) { cardGroup in
                    
                    switch cardGroup.designType {
                        
                    case CardTypes.HC1.rawValue:
                        HC1(Card: cardGroup)
                        
                    case CardTypes.HC3.rawValue:
                        if !remindLaterCards.contains(cardGroup.cardId) && !dismissedCards.contains(cardGroup.cardId) {
                            HC3(Card: cardGroup, remindLaterCards: $remindLaterCards, dismissedCards: $dismissedCards, isShowingToast: $isShowingToast)
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
            .coordinateSpace(name: "refreshable")
    }
}

// MARK: -  ContentView Methods
extension ContentView {
    
    // Fetch Cards Method
    func fetchCards() {
        Task {
            do {
                try await CardVM.fetchCards(with: Keys.getCards)
                withAnimation {
                    isDataFetched = true
                }
            }catch {
                print(error.localizedDescription)
                withAnimation {
                    isDataFetched = false
                }
                showingAlert.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
