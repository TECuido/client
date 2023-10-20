//
//  RecetaTabView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct RecetaTabView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }
    
    var body: some View {
        // Vistas para contacto y grupos
        TabView{
            
            MostarRecetaView()
                .tabItem{
                    Image(systemName: "text.justify")
                }
                .tint(.blue)
            
            SimplificarRecetaView()
                .tabItem{
                    Image(systemName: "text.quote")
                }
            
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(red: 0.1294, green: 0.5882, blue: 0.9529, alpha: 0)
            UITabBar.appearance().backgroundColor = UIColor(red: 0.1294, green: 0.5882, blue: 0.9529, alpha: 1)
        }
        .toolbarBackground(Color(red: 0.1294, green: 0.5882, blue: 0.9529), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
        .tint(Color(red: 0.98, green: 0.98, blue: 0.98))
        
        
    }
}

struct RecetaTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecetaTabView()
    }
}
