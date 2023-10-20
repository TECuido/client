//
//  ContactosView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ContactosView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }
    
    var body: some View {
        // Vistas para contacto y grupos
        TabView{
            
            ListaContactosView()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                }
                .tint(.blue)
            
            GruposView()
                .tabItem{
                    Image(systemName: "person.3.fill")
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

struct ContactosView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosView()
    }
}
