//
//  ListaContactosView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct ListaContactosView: View {
    
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    Text("Contactos")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                    
                    List{
                        Text("papa")
                        Text("d")
                    }
                    
                    /*NavigationLink("", destination: EstatusEmergenciaView(), isActive: $showEstatusView)*/
   
                }
            }
        }
    }
    
    
    struct ListaContactosView_Previews: PreviewProvider {
        static var previews: some View {
            ListaContactosView()
        }
    }
}
