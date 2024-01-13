//
//  MainTabView.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct MainTabView<Content: View>: View {
    let content: Content

    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }

    var body: some View {
        TabView {
            content
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(Color("LightBlue").opacity(0))
            UITabBar.appearance().backgroundColor = UIColor(Color("LightBlue").opacity(1))
        }
        .toolbarBackground(Color("LightBlue"), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
        .tint(Color("White"))
    }
    
}

