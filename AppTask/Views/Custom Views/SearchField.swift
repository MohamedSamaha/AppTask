//
//  SearchField.swift
//  AppTask
//
//  Created by Mohamed Samaha on 09/03/2023.
//

import SwiftUI

struct SearchField: View {
    
    @State var searchedText: String = ""
    @State private var hide: Bool = false
    @State var showSearchTXT: Bool = true
    
    var body: some View {
        ZStack{
        
            Button(action: {
                showSearchTXT.toggle()
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.black).imageScale(.large)
            }.offset(x: -170, y:0)
                TextField(
                    "Type Somthing...",
                    text: $searchedText
                ).padding(60).frame(height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
            
            Button(action: {
                
                searchedText = ""
            }) {
                Image(systemName: "x.circle")
                    .foregroundColor(Color.black).imageScale(.large)
            }.offset(x: 170, y:0)
            
            
        } //: ZSTACK
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
        
    }
}
