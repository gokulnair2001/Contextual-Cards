//
//  HC6.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 29/07/22.
//

import SwiftUI

struct HC6: View {
    
    @State var CardVM: Card
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        HStack {
           // ForEach(CardVM) { card in
                HStack {
                    AsyncImage(url: URL(string: CardVM.icon?.imageURL ?? "")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.yellow
                    }
                    .frame(width: 20, height: 20)
                    
                    Text(CardVM.formattedTitle?.text ?? "")
                    
                }.onTapGesture {
                    openURL(URL(string: CardVM.url)!)
                }
           // }
        }.frame(height: 100)
            .background(.white)
    }
}

//extension HC6 {
//    @ViewBuilder
//    func CustomTextBuilder(originalText: String, replaceBy:String, color: Color) -> some View {
//
//    }
//}

//struct HC6_Previews: PreviewProvider {
//    static var previews: some View {
//       HC6()
//    }
//}
