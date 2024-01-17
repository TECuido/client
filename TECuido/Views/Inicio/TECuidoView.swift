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
    @State private var scale = 1.0
    
    @Binding var path: NavigationPath
    
    
    var body: some View {
        //nav view
            ZStack{
                
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("TECuido")
                        .font(.custom("Inter", size: FontSize.largeTitle.rawValue))
                        .foregroundColor(Color("LightBlue"))
                        .bold()
                        .padding(3)
                        
                    Image("icon")
                        .resizable()
                        .frame(width: 175, height: 175)
                        .onTapGesture {
                            if(scale <= 1.0){
                                scale += 0.15
                            } else {
                                scale -= 0.15
                            }
                        }
                        .scaleEffect(scale)
                        .animation(.easeIn, value: scale)
                        .padding(.top, 30)
                    
                    PrimaryButton(title: "Iniciar sesión"){
                        path.append("Login")
                    }
                    
                    // Boton Registrarse
                    SecondaryButton(title: "Regístrate"){
                        path.append("TipoCuenta")
                    }
                    
                    Text("Salud sin barreras")
                        .foregroundColor(Color("PrimaryColor"))
                        .font(.custom("Lato", size: 20))
                        .bold()
                        .padding(3)
                        .padding(.top, 30)
                }
            }
            
            
    }
}


struct 
TECuidoView_Previews: PreviewProvider {
    static var previews: some View {
        TECuidoView(path: .constant(NavigationPath()))
    }
}
