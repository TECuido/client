//
//  MedicoMainView.swift
//  TECuido
//
//  Created by Alumno on 25/10/23.
//

import SwiftUI

struct MedicoMainView: View {
    @State private var isSidebarVisible = false
    var body: some View {
        ZStack{
            Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                Text("TECuido")
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .font(.system(size: 34, weight: .black))
                Spacer()
                
                    

                ZStack {
                    // Rectangulos de fondo
                    RoundedRectangle(cornerRadius: 30)
                    .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))

                    RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    ScrollView{
                        VStack{
                            // Presentacion de dr
                            HStack(spacing: 100){
                                VStack(alignment: .leading){
                                    Text("Hola,")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.53, green: 0.59, blue: 0.73))
                                    // Aqui falta back con el nombre personalizado
                                    Text("Dr. Carlos")
                                        .font(.system(size: 25, weight: .bold))
                                }
                                
                                // Aqui falta back para conectar con la imagen personalizada
                                Image("icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                            .padding(20)
                                                    
                            // Botones de servicios
                            HStack{
                                Text("Servicios")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                            }
                            
                            
                            // Aqui falta back (posiblemente; en el figma hay un cuadro como para agregar mas funcionalidades)
                            HStack{
                                Spacer()
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 128, height: 144)
                                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                    VStack(alignment: .leading, spacing: 30){
                                        
                                        ZStack{
                                            Circle()
                                                .frame(width: 56, height: 56)
                                                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                            Image("pacientes")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                        }
                                        
                                        Text("Pacientes ")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    }
                                }
                                Spacer()
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 128, height: 144)
                                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                    VStack(alignment: .leading, spacing: 30){
                                        
                                        ZStack{
                                            Circle()
                                                .frame(width: 56, height: 56)
                                                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                            Image("recetas")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                        }
                                        
                                        Text("Recetas     ")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    }
                                }
                                Spacer()
                            }
                            HStack{
                                Text("Últimos pacientes")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                            }
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            VStack(spacing:20){
                                
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 355, height: 67)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    HStack(spacing: 190){
                                        Text("Pedro Lopez")
                                            .bold()
                                        Image(systemName: "arrow.right")
                                    }
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 355, height: 67)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    HStack(spacing: 190){
                                        Text("Pedro Lopez")
                                            .bold()
                                        Image(systemName: "arrow.right")
                                    }
                                }
                            }
                            HStack{
                                Text("Últimas Recetas")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                            }
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            VStack(spacing: 20){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 355, height: 67)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    
                                    HStack(spacing: 160){
                                        
                                            HStack(spacing: 20){
                                                ZStack{
                                                    Circle()
                                                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                                        .frame(width: 50, height: 50)
                                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 0, y: 4)
                                                    Text("1")
                                                        .font(.system(size: 20, weight: .bold))
                                                        .foregroundColor(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                                                }
                                                
                                                Text("Receta 8")
                                                    .bold()
                                            }
                                        
                                        Image(systemName: "arrow.right")
                                        
                                    }
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 355, height: 67)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    HStack(spacing: 160){
                                        HStack(spacing: 20){
                                            ZStack{
                                                Circle()
                                                    .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                                    .frame(width: 50, height: 50)
                                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 0, y: 4)
                                                Text("2")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .foregroundColor(Color(red: 0.9765, green: 0.9765, blue: 0.9765))
                                            }
                                            
                                            Text("Receta 4")
                                                .bold()
                                        }
                                        Image(systemName: "arrow.right")
                                        
                                    }
                                }
                                .padding(.bottom, 50)
                            }
                            
                        }
                    }
                    .padding()
                }
                .ignoresSafeArea()
                .frame(width: 393, height: 675)
            }
        }
    }
}

struct MedicoMainView_Previews: PreviewProvider {
    static var previews: some View {
        MedicoMainView()
    }
}
