//
//  AgregaRecetaView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct AgregaRecetaView: View {
    
    
    var body: some View {
        
        ScrollView {
            
            // Texto general
            VStack{
                Text("Iniciar Sesión")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.largeTitle)
                    .bold()
                    .padding(20)
                                    
                //Input Correo
                HStack {
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .frame(width: 30, height: 20)
                        .padding(.leading, 15)
                    TextField("",
                              text: $viewModel.correo,
                              prompt: Text("Correo electrónico")
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                      )
                        .font(.title3)
                        .padding(.leading, 5)
                        .autocapitalization(.none)
                }
                .frame(width: 325, height: 55)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(20)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.red, lineWidth: CGFloat(viewModel.correoError)*2)
                }
                .padding([.top, .bottom], 10)
                
                
                
            
        }
    }
}


struct AgregaRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregaRecetaView()
    }
}
