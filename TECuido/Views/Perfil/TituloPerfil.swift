//
//  TituloPerfil.swift
//  TECuido
//
//  Created by Alumno on 17/01/24.
//

import SwiftUI

struct TituloPerfil: View {

        var isEditing: Bool
        var onEditButtonTapped: () -> Void

        var body: some View {
     
           HStack {
                Spacer()
               // Titulo centrado
               Title(text: "Perfil de Usuario");
               Spacer()
                Button(action: {
                    onEditButtonTapped()
                }) {
                    Image(systemName: isEditing ? "pencil.circle.fill" : "pencil.circle")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .padding()
        }
    }


struct TituloPerfil_Previews: PreviewProvider {
    static var previews: some View {
        TituloPerfil(isEditing: false,
                     onEditButtonTapped: {}
)
    }
}
