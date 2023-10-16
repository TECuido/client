//
//  TECuidoView.swift
//  frontend
//
//  Created by Erick on 12/10/23.
//
import SwiftUI
struct TECuidoView: View {
    @State private var showLoginView = false
    @State private var showRegisterView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("InicioBack")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.all)
                // Texto general
                VStack{
                    VStack{
                        Text("TECiudo")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .font(.system(size: 80))
                            .bold()
                            .padding(3)
                        Text("Salud sin barreras")
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            .font(.system(size: 20))
                            .bold()
                            .padding(3)
                        Image("icon")
                        
                        
                        // Boton Iniciar Sesion
                        Button("Iniciar Sesión"){
                            showLoginView = true
                        }
                        .foregroundColor(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .frame(width: 340, height:64)
                        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(20)
                        .font(.system(size: 30))
                        
                        NavigationLink(destination: LoginView(), isActive: $showLoginView) {
                            EmptyView()
                        }
                        
                        // Boton Registrarse
                        Button("Regístrate"){
                            showRegisterView = true
                        }
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .frame(width: 340, height:64)
                        .background(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                        .clipShape(Capsule())
                        .shadow(color: Color(red: 0.1294, green: 0.5882, blue: 0.9529).opacity(0.5), radius: 5, x: 0, y: 5)
                        .padding(27)
                        .font(.system(size: 30))
                        
                        NavigationLink(destination: RegistroView(), isActive: $showRegisterView) {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    struct TECuidoView_Previews: PreviewProvider {
        static var previews: some View {
            TECuidoView()
        }
    }
}