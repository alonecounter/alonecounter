//
//  CustomTabBarStyle.swift
//  AloneCounter
//
//  Created by Ba Kien on 03/02/2023.
//

import SwiftUI
import TabBar

struct CustomTabBarStyle: TabBarStyle {
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        itemsContainer()
            .background(Color("color.tab.bar.background"))
            .cornerRadius(25.0)
            .frame(height: 50.0)
            .padding(.horizontal, 24.0)
            .padding(.bottom, 16.0 + geometry.safeAreaInsets.bottom)
    }
    
}

