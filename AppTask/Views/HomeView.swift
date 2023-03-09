//
//  HomeView.swift
//  AppTask
//
//  Created by Mohamed Samaha on 07/03/2023.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Tabs = .home
    @State var searchedText: String = ""
    @Binding var postModel: [PostModel]
    @State var showSearchTXT: Bool = false
    @State var containTXT: String = ""
    @FocusState var keyboardFoucused: Bool
    
    var body: some View {
        VStack {
            CustomHomeBody(searchedText: searchedText, postModel: postModel, showSearchTXT: showSearchTXT, containTXT: containTXT)
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(postModel: .constant([PostModel(id: 1, firstName: "", lastName: "", title: "", body: "")]))
        
    }
}
