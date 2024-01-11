//
//  UsuarioDetallesView.swift
//  TECuido
//
//  Created by Alumno on 10/01/24.
//

import SwiftUI

struct UsuarioDetallesView: View {
    let alergias = ["Alergia1", "Alergia2", "Alergia3"]

    var body: some View {
        ZStack{
            VStack{
                // Titulo
                Text("Perfil de Usuario")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 45))
                    .bold()
                    .frame(width: 380)
                    .padding()
                    .multilineTextAlignment(.center)
                
                VStack {
                            DisclosureGroup("Alergias", content: {
                                ForEach(alergias, id: \.self) { alergia in
                                    Text(alergia)
                                }
                            })
                            .padding()

               
        }
            }
   
    }
}

struct UsuarioDetallesView_Previews: PreviewProvider {
    static var previews: some View {
        UsuarioDetallesView()
    }
}
    }
