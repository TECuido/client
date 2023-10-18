//
//  HomeView.swift
//  frontend
//
//  Created by Alumno on 11/10/23.
//


import SwiftUI


struct HomeView: View {
    @State private var showEmergenciasView = false
    @State private var showEmocionesView = false
    @State private var showRecetasMedicasView = false
    @State private var showLlamadasView = false
    @State private var showLesionesView = false


    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(red: 0.98, green: 0.98, blue: 0.98)
                    .ignoresSafeArea()
                
                VStack {
                    Image("icon")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)


                    Button(action: {
                        showEmergenciasView = true
                    }) {
                        Text("Emergencias")
                            .overlay(
                                HStack {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.white)
                                        .padding(.leading, -50)
                                    Spacer()
                                }
                            )
                            .frame(width: 320, height: 80)
                            .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                            .cornerRadius(16)
                            .padding(5)
                            .foregroundColor(.white)
                            .font(.title)
                    }


                    
                    
                    HStack{
                        // Botón para la vista de Emociones
                        Button(action: {
                            showEmocionesView = true
                        }) {
                            createSection(title: "Emociones", iconName: "smiley.fill")
                        }
                        // Botón para la vista de Recetas médicas
                        Button(action: {
                            showRecetasMedicasView = true
                        }) {
                            createSection(title: "Recetas médicas", iconName: "doc.text.fill")
                        }

                    }
                    HStack{
                        // Botón para la vista de Llamadas
                        Button(action: {
                            showLlamadasView = true
                        }) {
                            createSection(title: "Llamadas", iconName: "phone.fill.arrow.down.left")
                        }

                        // Botón para la vista de Lesiones
                        Button(action: {
                            showLesionesView = true
                        }) {
                            createSection(title: "Lesiones", iconName: "bandage.fill")
                        }
                    }
                    
                }
                .padding()
                
                .background(
                    NavigationLink("", destination: EmergenciasView(), isActive: $showEmergenciasView)
                )
                .background(
                    NavigationLink("", destination: EmergenciasView(), isActive: $showEmocionesView)
                )
                .background(
                    NavigationLink("", destination: EmergenciasView(),isActive: $showRecetasMedicasView)
                )
                .background(
                    NavigationLink("", destination: EmergenciasView(),isActive: $showLlamadasView)
                )
                .background(
                    NavigationLink("", destination: EmergenciasView(), isActive: $showLesionesView)
                )
                
            }
            
            
        }
    }


    private func createSection(title: String, iconName: String) -> some View {
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
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
