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
                HStack{
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .padding()
                    Text("Paciente")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    Spacer()
                }
                ZStack{
                    // Rectangulos de fondo
                    RoundedRectangle(cornerRadius: 30)
                    .fill(Color(red: 1, green: 1, blue: 1))

                    RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color(red: 0, green: 0, blue: 0), lineWidth: 1)
                    VStack{
                        Text("Pedro Lopez")
                            .font(.system(size: 24, weight: .bold))
                        ScrollView{
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .frame(height: 50)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                HStack{
                                    Image(systemName: "syringe")
                                        .font(.system(size: 20, weight: .medium))
                                    Text("Tipo de sangre")
                                        .font(.system(size: 20, weight: .medium))
                                    Spacer()
                                    Text("A+")
                                        .font(.system(size: 20, weight: .medium))
                                }
                                .padding(.horizontal, 20)
                                
                                
                                
                            }
                            .padding(.horizontal, 50)
                            .padding(.top, 15)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .frame(height: 50)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                HStack{
                                    Image(systemName: "person.text.rectangle")
                                        .font(.system(size: 20, weight: .medium))
                                    Text("Altura")
                                        .font(.system(size: 20, weight: .medium))
                                    Spacer()
                                    Text("175 cm")
                                        .font(.system(size: 20, weight: .medium))
                                }
                                .padding(.horizontal, 20)
                            }
                            .padding(.horizontal, 50)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                    .frame(height: 50)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                HStack{
                                    Image(systemName: "person.text.rectangle.fill")
                                        .font(.system(size: 20, weight: .medium))
                                    Text("Peso")
                                        .font(.system(size: 20, weight: .medium))
                                    Spacer()
                                    Text("70 kg")
                                        .font(.system(size: 20, weight: .medium))
                                }
                                .padding(.horizontal, 20)
                            }
                            .padding(.horizontal, 50)
                            
                            HStack(spacing: 15){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .frame(height: 150)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    VStack(spacing: 20){
                                        HStack{
                                            VStack(alignment: .leading){
                                                Text("Presión")
                                                    .font(.system(size: 20, weight: .medium))
                                                Text("arterial")
                                                    .font(.system(size: 20, weight: .medium))
                                            }
                                            Spacer()
                                        }
                                        .padding(.leading, 15)
                                        
                                        VStack{
                                            Text("119 / 78")
                                                .font(.system(size: 22, weight: .bold))
                                                .foregroundColor(Color(red: 0.2784, green: 0.8627, blue: 0.4588))
                                            Text("mmHg")
                                                .font(.system(size: 16, weight: .bold))
                                                .foregroundColor(Color(red: 0.3451, green: 0.8627, blue: 0.4588))
                                        }
                                        
                                    }
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .frame(height: 150)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
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
                            .padding(.horizontal, 50)
                            
                            HStack(spacing: 15){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .frame(height: 150)
                                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                                    VStack(spacing: 20){
                                        HStack{
                                            VStack(alignment: .leading){
                                                Text("Azucar en")
                                                    .font(.system(size: 20, weight: .medium))
                                                Text("sangre")
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
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(.white)
                                        .frame(height: 150)
                                        .shadow(color: .black, radius: 5, x: 0, y: 4)
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
                            .padding(.horizontal, 50)
                        }
                        

                        ZStack{
                            Rectangle()
                                .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                                .frame(height: 100)
                                .ignoresSafeArea()
                            HStack{
                                Spacer()
                                VStack{
                                    Image(systemName: "square.and.pencil")
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .font(.system(size: 30, weight: .bold))
                                    Text("Modificar")
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .font(.system(size: 15, weight: .regular))
                                }
                                Spacer()
                                VStack{
                                    Image(systemName: "trash.fill")
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .font(.system(size: 30, weight: .bold))
                                    Text("Eliminar")
                                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        .font(.system(size: 15, weight: .regular))
                                }

                                Spacer()
                            }
                        }
                        .ignoresSafeArea()
                    }
                    .padding(.top, 20)
                    
                }
                
                .ignoresSafeArea()
                .frame(width: 393, height: 700)
            }
        }
    }
}

struct PacienteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PacienteProfileView()
    }
}
