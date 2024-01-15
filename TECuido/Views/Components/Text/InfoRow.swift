//
//  InfoRow.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct InfoRow: View {
    var titulo: String
    var respuesta: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(titulo)
                .foregroundColor(Color.gray.opacity(0.8))
                .font(.custom("Inter", size: FontSize.captions.rawValue))
                .padding(.leading, 15)
                .lineLimit(nil)
            
            Text(respuesta)
                .foregroundColor(Color("PlaceholderColor"))
                .font(.custom("Inter", size: FontSize.text.rawValue))
                .padding(.leading, 15)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            
            Divider().background(Color.gray.opacity(0.2)) // Divider gris
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(titulo: "Titulo", respuesta: "Respuestas")
    }
}
