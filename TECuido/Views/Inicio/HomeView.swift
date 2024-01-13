

//
//  HomeView.swift
//  frontend
//
//  Created by Alumno on 11/10/23.
//
import SwiftUI
struct HomeView: View {
    
    @EnvironmentObject var session: SessionManager
        
    @State private var showEmergenciasView = false
    @State private var showContactosView = false
    @State private var showRecetasMedicasView = false
    @State private var showLlamadasView = false
    @State private var showLesionesView = false
    @State private var scale = 1.0
    
    @Binding var path: NavigationPath
    
    static var tag = "Home"
    
    
    var body: some View {
        //Nota el navegation es para pruebas favor de quitarlo
        
        //NavigationView{
            
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    
                    HStack {
                        Spacer()
                        Image("icon")
                            .resizable()
                            .foregroundColor(.accentColor)
                            .onTapGesture {
                                if(scale <= 1.0){
                                    scale += 0.15
                                } else {
                                    scale -= 0.15
                                }
                            }
                            .scaleEffect(scale)
                            .animation(.easeIn, value: scale)
                            .frame(width:120, height:120)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                    
                    
                    
                    // Botón para la vista de emergencias
                    LargeButton(
                        title:  "Emergencias",
                        iconName: "exclamationmark.triangle.fill",
                        hint: "Reporta una emergencia a tus compañeros"
                    ){
                        path.append(EmergenciasView.tag)
                    }
                    
                    
                    HStack{
                        // Botón para la vista de Contactos
                        BigButton(
                            title: session.tipoUsuario == 2 ? "Pacientes" : "Contactos",
                            iconName: "person.crop.circle.fill",
                            hint: "Añade contactos o un grupo"
                        ){
                            path.append(ContactosView.tag)
                        }
                        
                        // Botón para la vista de Recetas médicas
                        BigButton(
                            title:  "Recetas médicas",
                            iconName: "pills.circle£.fill",
                            hint: "Lee un resumen de tus recetsas médicas"
                        ){
                            path.append(RecetasView.tag)
                        }
                    }
                    
                    HStack{
                        // Botón para la vista de Perfil
                        BigButton(
                            title:  "Perfil médico",
                            iconName: "heart.text.square.fill",
                            hint: "Ve tu perfil médico"
                        ){
                            path.append(UsuarioDetallesView.tag)
                        }
                        
                        // Botón para la vista de Lesiones
                        BigButton(
                            title:  "Lesiones",
                            iconName: "bandage.fill",
                            hint: "Recibe recomendaciones de qué hacer ante quemaduras, heridas y picaduras"
                        ){
                            path.append(LesionesView.tag)
                        }
                        
                    }
                    
                }
            }
            .task {
                Task {
                    // request push notification authorization
                    await registerForNotifications()
                }
            }
            
            
        }
        // Aqui acaba el nav
    //}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(path: .constant(NavigationPath()))
            .environmentObject(SessionManager())
    }
}

