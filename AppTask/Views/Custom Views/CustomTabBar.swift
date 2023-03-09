//
//  CustomTabBar.swift
//  AppTask
//
//  Created by Mohamed Samaha on 07/03/2023.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case market = 1
    case offeres = 2
    case images = 3
    case profile = 4
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    var body: some View {
        HStack{
            Button {
                // code.
                selectedTab = .home
            } label: {
                TabBarButton(tabIcon: "house.fill", isActive: selectedTab == .home)
            }
            
            
            Button {
                // code.
                selectedTab = .market
            } label: {
                
                TabBarButton(tabIcon: "building.columns", isActive: selectedTab == .market)
            }
            Button {
                // code.
                selectedTab = .offeres
            } label: {
                TabBarButton(tabIcon: "percent", isActive: selectedTab == .offeres)
            }
            
            Button {
                // code.
                selectedTab = .images
            } label: {
                TabBarButton(tabIcon: "photo.fill", isActive: selectedTab == .images)
            }
            
            Button {
                // code.
                selectedTab = .profile
            } label: {
                TabBarButton(tabIcon: "person.fill", isActive: selectedTab == .profile)
            }
            
        } //: HStack
        .frame(height: 60)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home)).previewLayout(.sizeThatFits)
        
    }
}

