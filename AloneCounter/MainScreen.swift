//
//  MainScreen.swift
//  AloneCounter
//
//  Created by Ba Kien on 28/11/2022.
//

import SwiftUI
import TabBar

struct MainContent: View{
    private enum Item: Int, Tabbable {
        case first = 0
        case second
        case third
        case fourth
        case fifth
        case sixth
        
        
        var icon: String {
            switch self {
            case .first: return "house"
            case .second: return "magnifyingglass"
            case .third: return "person"
            case .fourth: return "house"
            case .fifth: return "magnifyingglass"
            case .sixth: return "person"
                
            }
        }
        
        var title: String {
            switch self {
            case .first: return "Home"
            case .second: return "Diary"
            case .third: return "Discover"
            case .fourth: return "Stories"
            case .fifth: return "Message"
            case .sixth: return "Setup"
            }
        }
    }
    
    @State private var selection: Item = .first
    @State private var visibility: TabBarVisibility = .visible
    
    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            Button {
                withAnimation {
                    visibility.toggle()
                }
            } label: {
                HomeView()
            }
            .tabItem(for: Item.first)
            
            DiaryView()
                .tabItem(for: Item.second)
            
            DiscoverView()
                .tabItem(for: Item.third)
            
            StoryView()
                .tabItem(for: Item.fourth)
            
            MessageView()
                .tabItem(for: Item.fifth)
            
            SetupView()
                .tabItem(for: Item.sixth)
        }
        //.tabBar(style: CustomTabBarStyle())
        //.tabItem(style: CustomTabItemStyle())
        
    }
    
    
}
