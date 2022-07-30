//
//  ScrollView.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 30/07/22.
//

import Foundation
import SwiftUI

struct PullToRefresh: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                } else {
                    Image("logo")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                Spacer()
            }
        }.padding(.top, -50)
    }
}
