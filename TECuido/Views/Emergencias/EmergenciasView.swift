//
//  EmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EmergenciasView: View {
    
    @Binding var path: NavigationPath
    @State var selection: Int = 1
    @State var hayEmergencia: Bool = false
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @StateObject var emergenciaViewModel = EmergenciaViewModel()
    
    static var tag = "EmergenciasView"

    
    var body: some View {
        
        VStack {
   
            SelectionTabView(selection: $selection){
       
                EnviarEmergenciaView(path: $path)
                    .tabItem{
                        Image(systemName: "text.bubble.fill")
                    }
                    .tag(1)
                
                if hayEmergencia {
                    AlertEmergenciasView(
                        path: $path,
                        dataEmergencia: $notificationViewModel.emergencia
                    )
                        .tabItem{
                            Image(systemName: "exclamationmark.triangle.fill")
                        }
                        .tag(2)
                } else if emergenciaViewModel.hayEmergencia {
                    AlertEmergenciasView(
                        path: $path,
                        dataEmergencia: $emergenciaViewModel.emergencia)
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
        EmergenciasView(path: .constant(NavigationPath()), selection: 1, hayEmergencia: true)
            .environmentObject(NotificationViewModel())
    }
}



