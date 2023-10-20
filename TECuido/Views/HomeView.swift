//
//  HomeView.swift
//  frontend
//
//  Created by Alumno on 11/10/23.
//


import SwiftUI


struct HomeView: View {
    @State private var showEmergenciasView = false
    @State private var showContactosView = false
    @State private var showEmocionesView = false
    @State private var showRecetasMedicasView = false
    @State private var showLlamadasView = false
    @State private var showLesionesView = false
    
    @State private var scale = 1.0

    var body: some View {
        //Nota el navegation es para pruebas favor de quitarlo
        
        NavigationView{
            
            ZStack {
                Color(red: 0.98, green: 0.98, blue: 0.98)
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
                        // Botón para la vista de Contactos
                        Button(action: {
                            showContactosView = true
                        }) {
                            createSection(title: "Contactos", iconName: "person.crop.circle.fill", hint:"Añade contactos o un grupo")
                        }
                        
                    }
                    
                    HStack{
                        // Botón para la vista de Emociones
                        Button(action: {
                            showEmocionesView = true
                        }) {
                            createSection(title: "Emociones", iconName: "smiley.fill", hint:"Lleva un seguimiento de tus emociones")
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
                            createSection(title: "Llamadas", iconName: "phone.fill.arrow.down.left", hint: "Realiza una llamada traduciendo de señas a voz")
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
            .padding()
            
            .background(
                NavigationLink("", destination: EmergenciasView(), isActive: $showEmergenciasView)
            )
            .background(
                NavigationLink("", destination: ContactosView(), isActive: $showContactosView)
            )
            .background(
                NavigationLink("", destination: EmergenciasView(), isActive: $showEmocionesView)
            )
            .background(
                NavigationLink("", destination: RecetasView(),isActive: $showRecetasMedicasView)
            )
            .background(
                NavigationLink("", destination: EmergenciasView(),isActive: $showLlamadasView)
            )
            .background(
                NavigationLink("", destination: EmergenciasView(), isActive: $showLesionesView)
            )
            
        }
        
        
        // Aqui acaba el nav
    }

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
        HomeView()
    }
}
