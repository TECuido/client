//
//  RegistroView.swift
//  frontend
//
//  Created by Erick on 12/10/23.
//

import SwiftUI

struct TipoCuentaView: View {
    
    @StateObject var viewModel = RegistroViewModel()
    @State private var selectedCuenta: TipoUsuario?
    @Binding var path: NavigationPath

    
    static var tag = "TipoCuenta"

    var body: some View {
        
        ZStack{
            Color("BackgroundColor")

            // Texto general
            VStack{
                Spacer()
                
                Title(text: "Cuenta")
                
                Text("Elige tu tipo de cuenta:")
                    .foregroundColor(Color("TextColor"))
                    .font(.custom("Lato", size: 26))
                    .bold()
                    .padding(25)
                
                PrimaryButton(title: "Persona Sorda"){
                    path.append(TipoUsuario.personaSorda
                    )
                }
                
                SecondaryButton(title: "Persona Oyente"){
                    path.append(TipoUsuario.personaOyente
                    )
                }
                
                PrimaryButton(title: "Médico"){
                    path.append(TipoUsuario.medico
                    )
                }
                .padding(.top, 0)
                
                Spacer()
            }
        }
    }
}

struct TipoCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        TipoCuentaView(path: .constant(NavigationPath()))
    }
}
