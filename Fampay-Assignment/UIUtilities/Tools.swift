//
//  Tools.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import Foundation
import SwiftUI


// MARK: - Extension used to convert HEX -> UIColor
extension View {
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}


// MARK: - Alignment Extensions
extension View {
    
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func vLeading() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}

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


// MARK: - Font Extension
extension Font {
    
    enum RobotoFont {
        case medium
        case regular
        
        var style: String {
            switch self {
            case .medium:
                return "Roboto-Medium"
            case .regular:
                return "Roboto-Regular"
            }
        }
    }
    
    static func roboto(weight: RobotoFont, size: CGFloat = 14) -> Font {
        return .custom(weight.style, size: size)
    }
}


// MARK: - URL Validator
extension View {
    func verifiedUrl (_ urlString: String?) -> String {
        var state = false
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                state = UIApplication.shared.canOpenURL(url as URL)
            }
        }
    
        return state ? urlString! : defaultURL.fampayURL
    }
}
