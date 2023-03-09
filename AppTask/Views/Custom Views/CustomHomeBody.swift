//
//  CustomizeHomeBody.swift
//  AppTask
//
//  Created by Mohamed Samaha on 09/03/2023.
//

import SwiftUI

struct CustomHomeBody: View {
    @State var searchedText: String
    var postModel: [PostModel]
    @FocusState var keyboardFoucused: Bool
    @State var showSearchTXT: Bool
    @State var containTXT: String
    
    var body: some View {
        // NAVIGATION BAR APPEARANS.
        if self.showSearchTXT {
            ZStack{
                
                Button(action: {
                    for i in 0..<postModel.count {
                        // SEARCH INTO DATA TO FIND IF SEARCH INPUT MATCHES WORDS IN BODY OR TITLE.
                        if postModel[i].title.contains(searchedText) == true || postModel[i].body.contains(searchedText) == true{
                        }
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.black).imageScale(.large)
                } //: BUTTON
                .offset(x: -170, y:0)
                TextField(
                    "Type Somthing...",
                    text: $searchedText
                ).disableAutocorrection(true).autocapitalization(.none).padding(60).frame(height: 50)
                    .focused($keyboardFoucused)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                
                Button(action: {
                    searchedText = ""
                    // TOGGOLE BETWEN THE SEARCH FIELD VIEW.
                    showSearchTXT.toggle()
                }) {
                    Image(systemName: "x.circle")
                        .foregroundColor(Color.black).imageScale(.large)
                } //: BUTTON
                .offset(x: 170, y:0)
                
            } //: ZSTACK
        }
        else {
            VStack{
                HStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .padding(.leading, 10)
                    
                    Spacer()
                    Button(action: {
                        showSearchTXT.toggle()
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.black).font(.system(size: 27))
                    } //: BUTTON
                    .offset(x: -10, y:0)
                } //:HSTACK
                .padding(10)
                
                Rectangle().foregroundColor(.gray)
                    .frame(width: .infinity / 2, height: 0.3)
            } //: VSTACK
        }
        
        ScrollView {
            if self.showSearchTXT {
                VStack{
                    ForEach(1..<postModel.count) { index in
                        
                        
                        if self.postModel[index].title.contains(searchedText) == true ||  self.postModel[index].body.contains(searchedText) == true {
                            PosterView(firstName: postModel[index].firstName, lastName: postModel[index].lastName, title: postModel[index].title, content: postModel[index].body)
                            
                        }
                        
                        
                        
                        
                    }
                } //: VSTACK
            } else {
                VStack{
                    // MARK: DISPLAING ALL POSTERS IN THE ARRAY OF POSTMODEL.
                    ForEach(1..<postModel.count) { index in
                        PosterView(firstName: postModel[index].firstName, lastName: postModel[index].lastName, title: postModel[index].title, content: postModel[index].body)
                    }
                }//: VSTACK
            }
            
            
        } //: SCROLLVIEW
    } //: BODY
}

struct CustomizeHomeBody_Previews: PreviewProvider {
    static var previews: some View {
        CustomHomeBody(searchedText: "", postModel: [PostModel(id: 1, firstName: "", lastName: "", title: "", body: "")], showSearchTXT: false, containTXT: "")
    }
}
