//
//  PacienteProfileView.swift
//  TECuido
//
//  Created by Alumno on 26/10/23.
//

import SwiftUI

struct PacienteProfileView: View {
    var body: some View {
        ZStack{
            Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack(spacing: 20){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                    Text("Paciente")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)
                ZStack{
                    // Rectangulos de fondo
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)

                    Rectangle()
                        .foregroundColor(.white)
                    VStack{
                        Text("Pedro Lopez")
                            .font(.system(size: 24, weight: .bold))
                        ScrollView{
                            VStack(spacing: 15){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(.white)
                                        .frame(height: 50)
                                        .shadow(color: .black, radius: 3, x: 0, y: 4)
                                    HStack{
                                        Image(systemName: "syringe")
                                            .font(.system(size: 20, weight: .medium))
                                        Text("Tipo de sangre")
                                            .font(.system(size: 20, weight: .medium))
                                        Spacer()
                                        Text("A+")
                                            .font(.system(size: 20, weight: .medium))
                                    }
                                    .padding(.horizontal)
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(.white)
                                        .frame(height: 50)
                                        .shadow(color: .black, radius: 3, x: 0, y: 4)
                                    HStack{
                                        Image(systemName: "person.text.rectangle")
                                            .font(.system(size: 20, weight: .medium))
                                        Text("Altura")
                                            .font(.system(size: 20, weight: .medium))
                                        Spacer()
                                        Text("175 cm")
                                            .font(.system(size: 20, weight: .medium))
                                    }
                                    .padding(.horizontal)
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(.white)
                                        .frame(height: 50)
                                        .shadow(color: .black, radius: 3, x: 0, y: 4)
                                    HStack{
                                        Image(systemName: "person.text.rectangle.fill")
                                            .font(.system(size: 20, weight: .medium))
                                        Text("Peso")
                                            .font(.system(size: 20, weight: .medium))
                                        Spacer()
                                        Text("70 kg")
                                            .font(.system(size: 20, weight: .medium))
                                    }
                                    .padding(.horizontal)
                                }
                                
                                HStack(spacing: 15){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(.white)
                                            .frame(height: 150)
                                            .shadow(color: .black, radius: 3, x: 0, y: 4)
                                        VStack{
                                            HStack{
                                                Text("Presión arterial")
                                                    .font(.system(size: 20, weight: .medium))
                                                
                                                Spacer()
                                            }
                                            .padding(.horizontal, 15)
                                            
                                            Spacer()
                                            
                                            VStack{
                                                Text("119 / 78")
                                                    .font(.system(size: 22, weight: .bold))
                                                    .foregroundColor(Color(red: 0.2784, green: 0.8627, blue: 0.4588))
                                                Text("mmHg")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color(red: 0.3451, green: 0.8627, blue: 0.4588))
                                            }
                                        }
                                        .padding(.vertical)
                                    }
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(.white)
                                            .frame(height: 150)
                                            .shadow(color: .black, radius: 3, x: 0, y: 4)
                                        VStack(spacing: 20){
                                            HStack{
                                                VStack(alignment: .leading){
                                                    Text("Frecuencia")
                                                        .font(.system(size: 20, weight: .medium))
                                                    Text("cardiaca")
                                                        .font(.system(size: 20, weight: .medium))
                                                }
                                                Spacer()
                                            }
                                            .padding(.leading, 15)
                                            
                                            VStack{
                                                Text("110")
                                                    .font(.system(size: 22, weight: .bold))
                                                    .foregroundColor(Color(red: 0.2784, green: 0.8627, blue: 0.4588))
                                                Text("bpm")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color(red: 0.3451, green: 0.8627, blue: 0.4588))
                                            }
                                            
                                        }
                                    }
                                }
                                
                                HStack(spacing: 15){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(.white)
                                            .frame(height: 150)
                                            .shadow(color: .black, radius: 3, x: 0, y: 4)
                                        VStack(spacing: 20){
                                            HStack{
                                                VStack(alignment: .leading){
                                                    Text("Azucar en sangre")
                                                        .font(.system(size: 20, weight: .medium))
                                                }
                                                Spacer()
                                            }
                                            .padding(.leading, 15)
                                            
                                            VStack{
                                                Text("209")
                                                    .font(.system(size: 22, weight: .bold))
                                                    .foregroundColor(Color(red: 0.2784, green: 0.8627, blue: 0.4588))
                                                Text("mg / dL")
                                                    .font(.system(size: 16, weight: .bold))
                                                    .foregroundColor(Color(red: 0.3451, green: 0.8627, blue: 0.4588))
                                            }
                                            
                                        }
                                    }
                                    
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(.white)
                                            .frame(height: 150)
                                            .shadow(color: .black, radius: 3, x: 0, y: 4)
                                        VStack(spacing: 20){
                                            HStack{
                                                Text("SPO²")
                                                    .font(.system(size: 20, weight: .medium))
                                                Spacer()
                                            }
                                            .padding(.leading, 15)
                                            
                                            VStack{
                                                Text("98%")
                                                    .font(.system(size: 22, weight: .bold))
                                                    .foregroundColor(Color(red: 0.2784, green: 0.8627, blue: 0.4588))
                                            }
                                            
                                        }
                                    }
                                    
                                }
                            }
                            .padding(.horizontal, 30)
                            .padding(.top)
                        }
                    }
                    .padding(.top, 20)
                    
                }
                HStack{
                    Spacer()
                    VStack(spacing: 5){
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                        
                        Text("Modificar")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 5){
                        Image(systemName: "trash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                        
                        Text("Eliminar")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    }

                    Spacer()
                }
                .padding(.top, 2)
            }
        }
    }
}

struct PacienteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PacienteProfileView()
    }
}
