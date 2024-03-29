//
//  ErrorMessage.swift
//  TECuido
//
//  Created by Alumno on 12/01/24.
//

import SwiftUI

struct ErrorMessage: View {
    var errorText: String
    
    var body: some View {
        Text(errorText)
            .font(.custom("Lato", size: FontSize.text.rawValue))
            .foregroundColor(Color("Red"))
            .frame(width: 300)
            .padding(.top, 5)
            .multilineTextAlignment(.center)
    }
}

struct ErrorMessage_Previews: PreviewProvider {
    static var previews: some View {
        ErrorMessage(errorText: "Error")
    }
}
