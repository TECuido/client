//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EmergenciasView: View {
    var body: some View {
        
        TabView{
            MandarEmergenciaView()
                .tabItem{
                    Image(systemName: "text.bubble.fill")
                }
                
            SinEmergenciasView()
                .tabItem{
                    
                    Image(systemName: "exclamationmark.triangle.fill")
                }
        }
    }
}

struct EmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        EmergenciasView()
    }
}
