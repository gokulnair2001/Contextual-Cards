//
//  ScrollView.swift
//  Fampay-Assignment
//
//  Created by Gokul Nair on 30/07/22.
//

import Foundation
import SwiftUI

/*
 Pre built Refreshable Extension(Modified it!)
 Scroll View doesn't support default refreshable, thus used a custom one.
*/
struct PullToRefresh: View {
    
    // Specifing name for the coordinate space
    var spaceName: String
    
    // Var of type completion block, hold the action to perform
    var onRefresh: ()->()
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            // Checks for increase in height of Space
            if (geo.frame(in: .named(spaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            }
            // Checks for decrease in size to refresh page
            else if (geo.frame(in: .named(spaceName)).maxY < 10) {
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
                    // Shows progress loader
                    ProgressView()
                } else {
                    // Shows custom image before progress view
                    Image("logo")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                
                Spacer()
            }
            
        }.padding(.top, -50)
    }
}
