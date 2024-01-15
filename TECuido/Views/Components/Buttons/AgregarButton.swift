//
 //  AgregarButton.swift
 //  TECuido
 //
 //  Created by Alumno on 14/01/24.
 //

 import SwiftUI

 struct AgregarButton: View {
     var action: () -> Void
     var body: some View {
         Button(action: {
             self.action()
         }) {
             Image(systemName: "plus")
                 .foregroundColor(Color.blue)
                 .font(.headline)
                 .padding()
                 .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
         }
     }
 }

 // Vista de previsualización
 struct AgregarButton_Previews: PreviewProvider {
     static var previews: some View {
         AgregarButton (

         action: {}
         )
     }
 }
