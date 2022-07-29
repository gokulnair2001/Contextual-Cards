//
//  CardModel.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import Foundation

struct CardModel: Codable, Identifiable {
    let id = UUID()
    
    let cardGroups: [CardGroup]

    enum CodingKeys: String, CodingKey {
        case cardGroups = "card_groups"
    }
}

// MARK: - CardGroup
struct CardGroup: Codable, Identifiable {
    
    let id = UUID()
    
    let cardId: Int
    let name, designType: String
    let cards: [Card]
    let isScrollable: Bool
    let height: Int?

    enum CodingKeys: String, CodingKey {
        case cardId = "id"
        case name
        case designType = "design_type"
        case cards
        case isScrollable = "is_scrollable"
        case height
    }
}

// MARK: - Card
struct Card: Codable, Identifiable  {
    let id = UUID()
    
    let name: String
    let title: String?
    let formattedTitle: FormattedTitle?
    let cardDescription: String?
    let formattedDescription: FormattedDescription?
    let icon: BgImage?
    let url: String
    let bgImage: BgImage?
    let bgColor: String?
    let cta: [Cta]?

    enum CodingKeys: String, CodingKey {
        case name, title
        case formattedTitle = "formatted_title"
        case cardDescription = "description"
        case formattedDescription = "formatted_description"
        case icon, url
        case bgImage = "bg_image"
        case bgColor = "bg_color"
        case cta
    }
    
}

// MARK: - BgImage
struct BgImage: Codable {
    let imageType: ImageType
    let imageURL: String
    let aspectRatio: Double?

    enum CodingKeys: String, CodingKey {
        case imageType = "image_type"
        case imageURL = "image_url"
        case aspectRatio = "aspect_ratio"
    }
}

enum ImageType: String, Codable {
    case ext = "ext"
}

// MARK: - Cta
struct Cta: Codable {
    let text, bgColor, textColor: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case text
        case bgColor = "bg_color"
        case textColor = "text_color"
        case url
    }
}

// MARK: - FormattedDescription
struct FormattedDescription: Codable {
    let text: String
    let entities: [Entity]
}

// MARK: - Entity
struct Entity: Codable {
    let text, color: String
}

// MARK: - FormattedTitle
struct FormattedTitle: Codable {
    let text: String
    let entities: [Entity]
    let align: String?
}
