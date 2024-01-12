//
//  RegistroView.swift
//  frontend
//
//  Created by Erick on 12/10/23.
//

import SwiftUI

struct TipoCuentaView: View {
    
    @StateObject var viewModel = RegistroViewModel()
    @State private var showRegisterView = false
    @State private var selectedCuenta: TipoUsuario?
    @Binding var path: NavigationPath

    
    static var tag = "TipoCuenta"

    var body: some View {
        
                ZStack{
                    Color("BackgroundColor")

                    // Texto general
                    VStack{
                        Spacer()
                        Text("Cuenta")
                            .font(.largeTitle)
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .bold()
                            .padding(1)
                        HStack{
                            Text("Elige tu tipo de cuenta:")
                                .foregroundColor(Color(red: 0,green: 0,blue: 0))
                                .font(.title2)
                                .bold()
                                .padding(25)
                        }
                        
                        // Boton Registrarse
                        Button("Persona Sorda"){
                            selectedCuenta = .personaSorda
                            showRegisterView = true
                        }
                        .accessibilityLabel("Persona sorda")
                        .foregroundColor(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .frame(width: 340, height:70)
                        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(30)
                        .font(.title2)
                        .bold()
                        

                        // Boton Registrarse
                        Button("Persona Oyente"){
                            selectedCuenta = .personaOyente
                            showRegisterView = true
                        }
                        .accessibilityLabel("Persona oyente")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .frame(width: 340, height:70)
                        .background(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(20)
                        .font(.title2)
                        .bold()
                        


                        // Boton Iniciar Sesion
                        Button("Médico"){
                            selectedCuenta = .medico
                            showRegisterView = true
                        }
                        .accessibilityLabel("Médico")
                        .foregroundColor(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .frame(width: 340, height:70)
                        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(30)
                        .font(.title2)
                        .bold()
                        
//                        NavigationLink(destination: LoginView(), isActive: $showLoginView) {
//                            EmptyView()
//                        }
                        // Aquí validamos si se seleccionó un tipo de cuenta
                        NavigationLink(destination: RegistroView(typeCuenta: $selectedCuenta), isActive: $showRegisterView) {
                            EmptyView()
                        }
                        
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
