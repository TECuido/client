//
//  MenuEliminar.swift
//  TECuido
//
//  Created by Alumno on 14/01/24.
//

import SwiftUI

struct MenuEliminar: View {
    var action: () -> Void
    var body: some View {
        Menu {
            Button(action: {
                action()
            }) {
                Label("Borrar", systemImage: "trash")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
        }
    }
}

struct MenuEliminar_Previews: PreviewProvider {
    static var previews: some View {
        MenuEliminar(action: {})
    }
}
