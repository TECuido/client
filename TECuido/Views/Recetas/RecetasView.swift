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
    }
    
    var body: some View {
        
        MainTabView{
            
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
        
        
    }
}

struct RecetasView_Previews: PreviewProvider {
    static var previews: some View {
        RecetasView(path: .constant(NavigationPath()))
            .environmentObject(SessionManager())
    }
}
