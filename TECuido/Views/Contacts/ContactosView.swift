//
//  ContactosView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ContactosView: View {
    
    @Binding var path: NavigationPath

    static var tag = "ContactosView"
    
    init(path: Binding<NavigationPath>) {
        self._path = path
    }
    
    var body: some View {
        // Vistas para contacto y grupos
        MainTabView{
            ListaContactosView(path: $path)
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                }
            
            ListaGruposView(path: $path)
                .tabItem{
                    Image(systemName: "person.3.fill")
                }
        }
    }
}


struct ContactosView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosView(path: .constant(NavigationPath()))
            .environmentObject(SessionManager())
    }
}
