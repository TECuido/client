//
//  SelectionTabView.swift
//  TECuido
//
//  Created by Alumno on 15/01/24.
//

import SwiftUI

struct SelectionTabView<Content: View>: View {
    @Binding var selection: Int
    let content: Content

    init(selection: Binding<Int>, @ViewBuilder _ content: () -> Content) {
        self._selection = selection
        self.content = content()
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }

    var body: some View {
        TabView(selection: $selection) {
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
