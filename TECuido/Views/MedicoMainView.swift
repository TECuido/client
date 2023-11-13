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
                Text("TECuido")
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    .font(.system(size: 34, weight: .black))
                
                ZStack {
                    // Rectangulos de fondo
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)

                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.black, lineWidth: 1)
                    
                    ScrollView{
                        VStack(alignment: .leading){
                            // Presentacion de dr
                            HStack{
                                Spacer()
                                
                                VStack{
                                    Text("Hola,")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color(red: 0.53, green: 0.59, blue: 0.73))
                                    // Aqui falta back con el nombre personalizado
                                    Text("Dr. Carlos")
                                        .font(.system(size: 25, weight: .bold))
                                }
                                .padding(.vertical)
                                
                                Spacer()
                            }
                                     
                            // Botones de servicios
                            Text("Servicios")
                                .font(.system(size: 20, weight: .bold))
                            
                            // Aqui falta back (posiblemente; en el figma hay un cuadro como para agregar mas funcionalidades)
                            HStack{
                                Spacer()
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                        .frame(width: 128, height: 144)
                                    
                                    VStack(alignment: .leading){
                                        ZStack{
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 56, height: 56)
                                            Image("pacientes")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                        }
                                        
                                        Spacer()

                                        Text("Pacientes")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }
                                
                                Spacer()
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                        .frame(width: 128, height: 144)
                                    
                                    VStack(alignment: .leading){
                                        ZStack{
                                            Circle()
                                                .frame(width: 56, height: 56)
                                                .foregroundColor(.white)
                                            
                                            Image("recetas")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                        }
                                        Spacer()
                                        Text("Recetas")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                }
                                Spacer()
                            }
                            
                            Text("Últimos pacientes")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.vertical)
                            
                            VStack(spacing:20){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 5, x: 0, y: 4)
                                    HStack{
                                        Text("Pedro Lopez")
                                            .font(.system(size: 20, weight: .bold))
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                    .padding(20)
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 5, x: 0, y: 4)
                                    HStack{
                                        Text("Pedro Lopez")
                                            .font(.system(size: 20, weight: .bold))

                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                    .padding(20)
                                }
                            }
                            
                            Text("Últimas Recetas")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.vertical)
                            
                            VStack(spacing: 20){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 5, x: 0, y: 4)
                                    
                                    HStack{
                                        ZStack{
                                            Circle()
                                                .fill(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                                .frame(width: 50, height: 50)
                                                .shadow(color: .black, radius: 3, x: 0, y: 4)
                                            
                                            Text("1")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                        
                                        Text("Receta 8")
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.horizontal)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 20, weight: .bold))

                                        
                                    }
                                    .padding()
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.white)
                                        .shadow(color: .black, radius: 5, x: 0, y: 4)
                                    HStack{
                                        ZStack{
                                            Circle()
                                                .fill(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                                .frame(width: 50, height: 50)
                                                .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 0, y: 4)
                                            Text("2")
                                                .font(.system(size: 20, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                        
                                        Text("Receta 4")
                                            .font(.system(size: 20, weight: .bold))
                                            .padding(.horizontal)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.system(size: 20, weight: .bold))

                                        
                                    }
                                    .padding()
                                }
                            }
                            .padding(.bottom, 30)
                        }
                        .padding(20)
                    }
                    .padding(.top, 1)
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct MedicoMainView_Previews: PreviewProvider {
    static var previews: some View {
        MedicoMainView()
    }
}
