//
//  CardViewModel.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import Foundation

class CardViewModel: ObservableObject {
    
    @Published var cards = [CardModel]()
    
    // Fetch method: Fetches Card details from server
    func fetchCards(with urlString: String) async throws {
        
        print("🔑 \(urlString)")
        
        guard let url = URL(string:  urlString) else {
            throw HttpError.badURl
        }
        
        let cardResponse:[CardModel] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.cards = cardResponse
        }
        
        print("🎈\(cardResponse)")
    }
}
