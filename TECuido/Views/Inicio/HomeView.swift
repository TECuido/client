

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
                        .frame(width:140,height:140)
                    
                    HStack{
                        // Botón para la vista de emergencias
                        Button(action: {
                            showEmergenciasView = true
                        }) {
                            createSection(title: "Emergencias", iconName: "exclamationmark.triangle.fill", hint:"Reporta una emergencia a tus contactos")
                        }
                      
                        
                    }
                    
                    HStack{
                        // Botón para la vista de Contactos
                        Button(action: {
                            showContactosView = true
                        }) {
                            createSection(title: session.tipoUsuario == 2 ? "Pacientes" : "Contactos", iconName: "person.crop.circle.fill", hint:"Añade contactos o un grupo")
                        }
                        // Botón para la vista de Recetas médicas
                        Button(action: {
                        showRecetasMedicasView = true
                        }) {
                            createSection(title: "Recetas médicas", iconName: "doc.text.fill", hint:"Lee un resumen de tus recetas médicas")
                        }
                        
                    }
                    HStack{
                        // Botón para la vista de Llamadas
                        Button(action: {
                            showLlamadasView = true
                        }) {
                             createSection(title: "Perfil de Usuario", iconName: "person.crop.circle.fill", hint: "Ve tu perfil de usuario")
                        }
                        
                        // Botón para la vista de Lesiones
                        Button(action: {
                            showLesionesView = true
                        }) {
                            createSection(title: "Lesiones", iconName: "bandage.fill", hint: "Recibe recomendaciones de qué hacer ante quemaduras, heridas y picaduras")
                        }
                    }
                    
                }
            }
            .task {
                Task {
                    // request push notification authorization
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { allowed, error in
                        if allowed {
                            // register for remote push notification
                            DispatchQueue.main.async {
                                UIApplication.shared.registerForRemoteNotifications()
                            }
                            print("Notificaciones remotas autorizadas por el usuario")
                        } else {
                            print("Error al solicitar el prermiso para notificaciones remotas. Error \(error)")
                        }
                    }
                }
            }
            .padding()
            .background(
                NavigationLink("", destination: EmergenciasView(selection: 1), isActive: $showEmergenciasView)
            )
            .background(
                NavigationLink("", destination: ContactosView(), isActive: $showContactosView)
            )
           
            .background(
                NavigationLink("", destination: RecetasView(),isActive: $showRecetasMedicasView)
            )
        
        
            .background(
                NavigationLink("", destination: UsuarioDetallesView(),isActive: $showLlamadasView)
            )
            .background(
                NavigationLink("", destination: LesionesView(), isActive: $showLesionesView)
            )
            
        }
        
        
        // Aqui acaba el nav
    //}
    private func createSection(title: String, iconName: String, hint: String) -> some View {
                
        ZStack {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
            }
            .frame(width: 170, height: 170)
            .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
            .cornerRadius(16)
            .padding(5)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            .font(.title)
            .accessibilityLabel(title)
            .accessibilityHint(hint)
        }
        
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(path: .constant(NavigationPath()))
    }
}

