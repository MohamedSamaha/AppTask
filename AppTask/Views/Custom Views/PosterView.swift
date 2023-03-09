//
//  PosterView.swift
//  AppTask
//
//  Created by Mohamed Samaha on 07/03/2023.
//

import SwiftUI

struct PosterView: View {
    var firstName: String = ""
    var lastName: String = ""
    var title: String = ""
    var content: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image("ProfileImage")
                VStack {
                    Text("\(firstName) \(lastName)").frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(2)
                    Text("2 days ago").frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        .frame(alignment: .leading)
                        .padding(2)
                }
                Spacer()
            }
            .padding(20) //: HSTACK
            Text("\(title)\n\(content)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 17))
                .fontWeight(.regular)
                .lineSpacing(7)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
            
            HStack {
                Image("PosterImageOne")
                    .resizable()
                    .scaledToFit()
                    .offset(x: 2, y: 0)
                
                VStack{
                    Image("PosterImageTwo")
                        .resizable()
                        .scaledToFit()
                        .offset(x: 0, y: 2)
                    Image("PosterImageThree")
                        .resizable()
                        .scaledToFit()
                        .offset(x: 0, y: -2)
                } //: VSTACK
                .offset(x: -2, y: 0)
                
            } //: HSTACK
            .frame(height: 400)
            
            Rectangle().foregroundColor(.gray)
                .frame(width: .infinity / 2, height: 0.15).padding(.bottom, 10)
            
        } //; STACK
        
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView()
            .previewLayout(.sizeThatFits)
    }
}
