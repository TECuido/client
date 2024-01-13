//
//  SinEmergenciasView.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct SinEmergenciasView: View {

    var body: some View {
        ZStack{
            VStack{
                // Titulo
                Text("Emergencias")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 55))
                    .bold()
                    .padding()
                // Imagen principal
                Image("bien")
                    .padding()
                // Texto de todo bien
                Text("Todo se encuentra bien")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                .padding()
                
                
            }
            
                
            
        }
    }
}

struct SinEmergenciasView_Previews: PreviewProvider {
    static var previews: some View {
        SinEmergenciasView()
    }
}
