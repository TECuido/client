//
//  CheckedItem.swift
//  TECuido
//
//  Created by Alumno on 13/01/24.
//

import SwiftUI

struct CheckedItem: View {
    
    var title: String
    var subtitle: String = ""
    
    var body: some View {
        ZStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(Color.green)
        }
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Lato", size:FontSize.text.rawValue))
                .bold()
            Text(subtitle)
                .font(.custom("Lato", size:FontSize.text.rawValue))
        }
        .frame(maxWidth:.infinity, alignment: .leading)
        .padding(.leading, 10)
    }
}


