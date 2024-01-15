//
//  DisclosureGroupText.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct DisclosureGroupText: View {
 var labelText: String
 
 init(labelText: String) {
     self.labelText = labelText
 }

 var body: some View {
     Text(labelText)
         .font(.custom("Inter", size: FontSize.text.rawValue))
         .frame(width: 200)
         .padding(10)
         .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
 }
}

struct DisclosureGroupText_Previews: PreviewProvider {
 static var previews: some View {
     DisclosureGroupText(labelText: "Contenido")
 }
}
