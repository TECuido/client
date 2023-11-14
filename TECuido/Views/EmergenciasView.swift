//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EmergenciasView: View {
    
    @State var selection: Int = 1
    @State var hayEmergencia: Bool = false
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @StateObject var emergenciaViewModel = EmergenciaViewModel()
    
    
    var body: some View {
        
        VStack {
            
            
            TabView(selection: $selection){
                
                
                MandarEmergenciaView()
                    .tabItem{
                        Image(systemName: "text.bubble.fill")
                    }
                    .tint(.blue)
                    .tag(1)
                
                if hayEmergencia {
                    AlertEmergenciasView(dataEmergencia: $notificationViewModel.emergencia)
                        .tabItem{
                            Image(systemName: "exclamationmark.triangle.fill")
                        }
                        .tag(2)
                } else if emergenciaViewModel.hayEmergencia {
                    AlertEmergenciasView(dataEmergencia: $emergenciaViewModel.emergencia)
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
        .task {
            await emergenciaViewModel.getEmergencia()
            if(emergenciaViewModel.hayEmergencia){
                selection = 2
            }
        }
        
    }
    
}

struct EmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        EmergenciasView(selection: 2, hayEmergencia: true)
    }
}



