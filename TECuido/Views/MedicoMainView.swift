//
//  MedicoMainView.swift
//  TECuido
//
//  Created by Alumno on 25/10/23.
//

import SwiftUI

struct MedicoMainView: View {
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
                    
                    VStack{
                        // Presentacion de dr
                        HStack{
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Hola,")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(red: 0.53, green: 0.59, blue: 0.73))
                                // Aqui falta back con el nombre personalizado
                                Text("Dr. Carlos")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            Spacer()
                            Spacer()
                            Spacer()
                            // Aqui falta back para conectar con la imagen personalizada
                            Image("icon")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            Spacer()
                        }
                        
                        // Botones de servicios
                        HStack{
                            Text("Servicios")
                                .font(.system(size: 15, weight: .bold))
                                .padding(20)
                            Spacer()
                        }
                        
                            
                        // Aqui falta back (posiblemente; en el figma hay un cuadro como para agregar mas funcionalidades)
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 128, height: 144)
                                    .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                VStack(alignment: .leading){
                                    ZStack{
                                        Circle()
                                            .frame(width: 56, height: 56)
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        Image("icon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    }
                                    
                                    Text("Pacientes")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 128, height: 144)
                                    .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                                VStack(alignment: .leading){
                                    ZStack{
                                        Circle()
                                            .frame(width: 56, height: 56)
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        Image("icon")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    }
                                    
                                    Text("Recetas")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                }
                            }
                        }
                        HStack{
                            Text("Últimos pacientes")
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                            Spacer()
                        }
                        VStack(spacing: 10){
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 355, height: 67)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    .padding(20)
                                HStack{
                                    Image("icon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    Text("Pedro Lopez")
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                    
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 355, height: 67)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    .padding(20)
                                HStack{
                                    Image("icon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    Text("Pedro Lopez")
                                    Spacer().frame(minWidth: 0, idealWidth: 10, maxWidth: 10)
                                    Image(systemName: "arrow.right")
                                    
                                }
                            }
                        }
                        HStack{
                            Text("Últimos Recetas")
                                .font(.system(size: 15, weight: .bold))
                                .padding()
                            Spacer()
                        }
                        VStack(spacing: 10){
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 355, height: 67)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    .padding(20)
                                HStack{
                                    Image("icon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    Text("Pedro Lopez")
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                    
                                }
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 355, height: 67)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    .padding(20)
                                HStack{
                                    Image("icon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    Text("Pedro Lopez")
                                    Spacer().frame(minWidth: 0, idealWidth: 10, maxWidth: 10)
                                    Image(systemName: "arrow.right")
                                    
                                }
                            }
                        }
                        
                    }
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
