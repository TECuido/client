//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EmergenciasView: View {
    
    @State var selection: Int
    @State var hayEmergencia: Bool
    @State var emergencia: DataEmergenciaGrupoModel

    
    init(
        selection: Int,
        hayEmergencia: Bool = false,
        emergencia: DataEmergenciaGrupoModel = DataEmergenciaGrupoModel.defaultEmergencia) {
        self.selection = selection
        self.hayEmergencia = hayEmergencia
        self.emergencia = emergencia
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }
    
    var body: some View {
        
        TabView(selection: $selection){
            
            
            MandarEmergenciaView()
                .tabItem{
                    Image(systemName: "text.bubble.fill")
                }
                .tint(.blue)
                .tag(1)

            if hayEmergencia {
                AlertEmergenciasView(dataEmergencia: emergencia)
                .tabItem{
                    Image(systemName: "exclamationmark.triangle.fill")
                }
                    .tag(2)
            } else {
                SinEmergenciasView()
                .tabItem{
                    Image(systemName: "exclamationmark.triangle.fill")
                }
                    .tag(2)
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

struct EmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        EmergenciasView(selection: 2, hayEmergencia: true, emergencia: DataEmergenciaGrupoModel.defaultEmergencia)
    }
}



