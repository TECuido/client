//
//  LlamadasView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct LlamadasView: View {
    var body: some View {
        VStack{
            Text("Sigue en producción")
                .font(.largeTitle)
                .bold()
            Image(systemName: "phone.fill")
                .resizable()
                .frame(width: 80,height: 80)
        }
       
    }
}

struct LlamadasView_Previews: PreviewProvider {
    static var previews: some View {
        LlamadasView()
    }
}
