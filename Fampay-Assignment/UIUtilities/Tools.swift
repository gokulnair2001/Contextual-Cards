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
    
    func formatText(input: String, replaceBy: [Entity]) -> [Entity] {
        
        let stringArray = input.components(separatedBy: " ")
        var count = 0
        var entityModel:[Entity] = [Entity]()
        
        for i in 0..<stringArray.count {
            if stringArray[i] == "{}" || stringArray[i] == "{}!" {
                entityModel.append(Entity.init(text: replaceBy[count].text, color: replaceBy[count].color))
                count += 1
            }else {
                entityModel.append(Entity.init(text: stringArray[i], color: "#000000"))
            }
        }
        
        return entityModel
    }
    
    // Text View builder for formatted titles
    @ViewBuilder
    func textGenerator(entity: [Entity]) -> some View {
        let layout = [GridItem(.flexible())]
        
        VStack {
            LazyHGrid(rows: layout, alignment: .firstTextBaseline, spacing: 5) {
                ForEach(entity) { ent in
                    VStack(spacing: 0) {
                        Text(ent.text.trimmingCharacters(in: .whitespacesAndNewlines))
                            .foregroundColor(Color(hexStringToUIColor(hex: ent.color)))
                            .lineLimit(1)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 8)
                        
                    }.frame(height: 50, alignment: .leading)
                }
            }
        }.padding(.leading, 20)
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
