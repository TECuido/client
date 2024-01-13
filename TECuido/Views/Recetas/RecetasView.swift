//
//  TabLlamadasView.swift
//  TECuido
//
//  Created by Alumno on 02/11/23.
//
import SwiftUI
struct RecetasView: View {
    
    @Binding var path: NavigationPath
    @EnvironmentObject var session: SessionManager
    static var tag = "RecetasView"
    
    init(path: Binding<NavigationPath>) {
        self._path = path
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }
    
    var body: some View {
        
        TabView{
            
           ListaRecetasView()
                .tabItem{
                    Image(systemName: "doc.text.fill")
                }
                .tint(.blue)
            
            
           AgregaRecetaView()
                .tabItem{
                    Image(systemName: "pencil.circle.fill")
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

struct RecetasView_Previews: PreviewProvider {
    static var previews: some View {
        RecetasView(path: .constant(NavigationPath()))
    }
}
