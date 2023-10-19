//
//  RegistroView.swift
//  frontend
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct TipoCuentaView: View {
    
    @StateObject var viewModel = RegistroViewModel()
    @State private var showRegisterView = false
    @State private var selectedCuenta: Int = 0

    var body: some View {
        
            NavigationView{
                ZStack{
                    //Diseño
                    Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                        .ignoresSafeArea()
                    Circle()
                        .scale(2)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.75)
                        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                    
                    // Texto general
                    VStack{
                        Spacer()
                        Text("Cuenta")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .bold()
                            .font(.system(size: 45))
                            .padding(1)
                        HStack{
                            Text("Elige tu tipo de cuenta:")
                                .foregroundColor(Color(red: 0,green: 0,blue: 0))
                                .font(.system(size: 28))
                                .bold()
                                .padding(25)
                            Spacer()
                        }
                        
                        // Boton Registrarse
                        Button("Persona Sorda"){
                            selectedCuenta = 1
                            showRegisterView = true
                        }
                        .accessibilityLabel("Registrate")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .frame(width: 340, height:64)
                        .background(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(30)
                        .font(.system(size: 30))
                        .bold()
                        
//                        NavigationLink(destination: TipoCuentaView(), isActive: $showRegisterView) {
//                            EmptyView()
//                        }
                        // Boton Registrarse
                        Button("Persona Oyente"){
                            selectedCuenta = 2
                            showRegisterView = true
                        }
                        .accessibilityLabel("Registrate")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .frame(width: 340, height:64)
                        .background(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(20)
                        .font(.system(size: 30))
                        .bold()
                        
//                        NavigationLink(destination: TipoCuentaView(), isActive: $showRegisterView) {
//                            EmptyView()
//                        }

                        // Boton Iniciar Sesion
                        Button("Médico"){
                            selectedCuenta = 3
                            showRegisterView = true
                        }
                        .accessibilityLabel("Iniciar sesión")
                        .foregroundColor(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .frame(width: 340, height:64)
                        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(30)
                        .font(.system(size: 30))
                        .bold()
                        
//                        NavigationLink(destination: LoginView(), isActive: $showLoginView) {
//                            EmptyView()
//                        }
                        // Aquí validamos si se seleccionó un tipo de cuenta
                        if selectedCuenta != 0 {
                            NavigationLink(destination: RegistroView(typeCuenta: $selectedCuenta), isActive: $showRegisterView) {
                                EmptyView()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

struct TipoCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        TipoCuentaView()
    }
}
