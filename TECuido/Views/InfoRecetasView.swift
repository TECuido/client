//
//  ContentView.swift
//  erickxD
//
//  Created by Leonardo García Ledezma on 06/11/23.
//

import SwiftUI

struct InfoRecetasView: View {
    var body: some View {
        ZStack{
            Color(red: 0.2824, green: 0.5804, blue: 0.9961)
                .ignoresSafeArea(.all)
            VStack{
                HStack(spacing: 20){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Text("Recetas")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    ScrollView{
                        VStack{
                            Text("Receta")
                                .font(.system(size: 26, weight: .heavy))

                            Text("Inserte Nombre")
                                .font(.system(size: 26, weight: .heavy))
                                .foregroundColor(Color(red: 0.5824, green: 0.5824, blue: 0.5824))
                                .padding(.bottom, 30)
                            
                            HStack(spacing: 10){
                                Text("Paciente:")
                                    .font(.system(size: 20, weight: .semibold))

                                Text("Pedro López")
                                    .font(.system(size: 20, weight: .regular))

                                Spacer()
                            }
                            .padding(.horizontal, 10)
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color(red: 0.8824, green: 0.8824, blue: 0.8824))
                                VStack{
                                    HStack{
                                        Text("Paracetamol")
                                            .font(.system(size: 30, weight: .heavy))
                                        Spacer()
                                    }
                                    
                                    Image("icon")
                                        .frame(height: 200)
                                        

                                    VStack(alignment: .leading, spacing: 15){
                                        Text("Cantidad")
                                            .font(.system(size: 20, weight: .heavy))
                                        ZStack{
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .clipShape(Capsule())
                                                .frame(height: 50)
                                            Text("1 tableta por dia")
                                                .font(.system(size: 20, weight: .semibold))
                                        }
                                        Text("¿Cuando tomar?")
                                            .font(.system(size: 20, weight: .heavy))
                                        ZStack{
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .clipShape(Capsule())
                                                .frame(height: 50)

                                            Text("Temprano por las mañanas")
                                                .font(.system(size: 20, weight: .semibold))
                                        }
                                    }
                                    
                                    Rectangle()
                                        .frame(height: 2)
                                        .padding([.top, .bottom], 30)
                                    
                                    HStack{
                                        Text("Peptobismol")
                                            .font(.system(size: 30, weight: .heavy))
                                        Spacer()
                                    }
                                    
                                    Image("icon")
                                        .frame(height: 200)

                                    VStack(alignment: .leading, spacing: 15){
                                        Text("Cantidad")
                                            .font(.system(size: 20, weight: .heavy))
                                        ZStack{
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .clipShape(Capsule())
                                                .frame(height: 50)
                                            Text("1 cucharada")
                                                .font(.system(size: 20, weight: .semibold))
                                        }
                                        Text("¿Cuando tomar?")
                                            .font(.system(size: 20, weight: .heavy))
                                        ZStack{
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .clipShape(Capsule())
                                                .frame(height: 50)

                                            Text("Cada 4 horas")
                                                .font(.system(size: 20, weight: .semibold))
                                        }
                                    }


                                }
                                .padding(.horizontal)
                                .padding([.top, .bottom], 30)
                            }
                        }
                        .padding()
                    }
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
            }
        }    }
}

struct InfoRecetasView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRecetasView()
    }
}
