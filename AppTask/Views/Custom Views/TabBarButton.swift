//
//  bBarButton.swift
//  AppTask
//
//  Created by Mohamed Samaha on 07/03/2023.
//

import SwiftUI

struct TabBarButton: View {
    
    var tabIcon: String
    var isActive: Bool
    
    var body: some View {
        GeometryReader { geo in
            if isActive {
                Rectangle().foregroundColor(Color("SigninColor"))
                    .frame(width: geo.size.width / 2, height: 3)
                    .padding(.leading, geo.size.width / 4)
                
                VStack(alignment: .center, spacing: 4) {
                    Image(systemName: tabIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color("SigninColor"))
                    
                    
                } //: VSTACK
                .frame(width: geo.size.width, height: geo.size.height)
                
            } else {
                VStack(alignment: .center, spacing: 4) {
                    Image(systemName: tabIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                    
                    
                } //: VSTACK
                .frame(width: geo.size.width, height: geo.size.height)
                
            }
            
            
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(tabIcon: "bubble.left", isActive: true)
            .previewLayout(.sizeThatFits)

    }
}
