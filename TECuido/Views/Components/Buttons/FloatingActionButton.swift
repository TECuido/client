//
//  FloatingActionButton.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//

import SwiftUI

struct FloatingActionButton: View {
    
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: action){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color("LightBlue"))
            }
            .padding(.bottom, 30)
            .padding(.trailing, 30)
        }
    }
}


struct FloatingActionButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingActionButton(
        ){}
    }
}
