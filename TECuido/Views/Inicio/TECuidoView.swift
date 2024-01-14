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
    
    @State private var path: NavigationPath = .init()
    
    var body: some View {
        //nav view
        NavigationStack(path: $path){
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
            .navigationDestination(for: String.self){ tag in
                switch tag {
                case LoginView.tag:
                    LoginView(path: $path)
                case TipoCuentaView.tag:
                    TipoCuentaView(path: $path)
                case AgregarUsuarioDetallesView.tag:
                    AgregarUsuarioDetallesView(path: $path)
                case HomeView.tag:
                    HomeView(path: $path)
                case LesionesView.tag:
                    LesionesView(path: $path)
                case UsuarioDetallesView.tag:
                    UsuarioDetallesView(path: $path)
                case RecetasView.tag:
                    RecetasView(path: $path)
                case ContactosView.tag:
                    ContactosView(path: $path)
                case ContactosDetallesView.tag:
                    ContactosDetallesView(path: $path)
                case CreaGrupoView.tag:
                    CreaGrupoView(path: $path)
                default:
                    TECuidoView()
                }
            }
            .navigationDestination(for: TipoUsuario.self){tipo in
                RegistroView(path: $path,
                             typeCuenta: tipo)
            }
            .navigationDestination(for: GrupoModel.self){grupo in
                GruposDetallesView(path: $path, grupo: grupo)
            }
            .navigationDestination(for: GrupoNavigationModel.self){item in
                switch item.tag {
                case EditarGrupoView.tag:
                    EditarGrupoView(path: $path, grupo: item.grupo)
                default:
                    TECuidoView()
                }
            }
            .navigationDestination(for: ClassificationNavModel.self){item in
                ClassificationView(path: $path, data: item.data, model: item.model)
            }
            .navigationDestination(for: EmergenciaNavModel.self){item in
                EmergenciasView(path: $path, selection: item.selection, hayEmergencia: item.hayEmergencia)
            }
            
        }//aqui termina navigation view
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct 
TECuidoView_Previews: PreviewProvider {
    static var previews: some View {
        TECuidoView()
    }
}
