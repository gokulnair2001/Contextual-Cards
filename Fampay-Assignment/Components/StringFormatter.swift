//
//  StringFormatter.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 31/07/22.
//

import Foundation
import SwiftUI

// MARK: - String Formatter
extension View {
    // Format the text and creates a feed for customCardText()
    func formatText(input: String, replaceBy: [Entity]) -> [Entity] {
        
        if replaceBy.isEmpty {
            return [Entity.init(text: input, color: "#000000")]
        }
        
        let stringArray = input.components(separatedBy: " ") // Formatted Title text
        var count = 0 // Counter to keep 👀 on array elements
        var entityModel:[Entity] = [Entity]() // Result model which consists of final Entity
        
        for i in 0..<stringArray.count {

            /// Checks for {} in the string
            if stringArray[i] == "{}" || stringArray[i] == "{}!" {
                
                /// If {} present then add the desired text and color type
                entityModel.append(Entity.init(text: replaceBy[count].text, color: replaceBy[count].color))
                count += 1
                
            }else {
                
                /// If {} not present then add the existing string
                entityModel.append(Entity.init(text: stringArray[i], color: "#000000"))
            }
        }
        
        // Returns final Entity
        return entityModel
    }
    
    // Text builder for formatted titles
    func customCardText(entity: [Entity]) -> Text {
        
        var finalText = Text("")
        
        entity.forEach { entity in
            finalText = finalText + Text("\(entity.text) ").foregroundColor(Color(hexStringToUIColor(hex: entity.color)))
        }
        
        return finalText
    }
}
