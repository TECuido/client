//
//  PacientesView.swift
//  TECuido
//
//  Created by Alumno on 26/10/23.
//

import SwiftUI

struct PacientesView: View {
    var body: some View {
        ZStack{
            Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Image(systemName: "arrowshape.turn.up.left.fill")
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    .padding()
                ZStack{
                    Rectangle()
                        .fill(Color(red: 1, green: 1, blue: 1))
                        .edgesIgnoringSafeArea(.bottom)
                    VStack{
                        HStack{
                            Text("Pacientes")
                                .font(.system(size: 26, weight: .bold))
                            Spacer()
                            Image(systemName: "plus")
                                .font(.system(size: 26))
                                
                        }
                        .padding(30)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(.black, lineWidth: 1)
                                .frame(height: 70)
                                .padding(.horizontal, 20)

                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(Color(red: 0.7686, green: 0.7686, blue: 0.7686))
                                Text("Buscar Pacientes")
                                    .foregroundColor(Color(red: 0.6686, green: 0.6686, blue: 0.6686))
                                Spacer()

                            }
                            .padding(.horizontal, 40)
                        }
                        .padding(.bottom, 30)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 70)
                                .shadow(color: .black, radius: 5, x: 0, y: 4)
                                .padding(.horizontal, 20)
                            HStack{
                                Text("Pedro Lopez")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal, 40)
                        }
                        .padding(.bottom, 20)
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 70)
                                .shadow(color: .black, radius: 5, x: 0, y: 4)
                                .padding(.horizontal, 20)
                            HStack{
                                Text("Sofia Baeza")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal, 40)
                        }
                        .padding(.bottom, 20)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 70)
                                .shadow(color: .black, radius: 5, x: 0, y: 4)
                                .padding(.horizontal, 20)
                            HStack{
                                Text("Diego Leyva")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal, 40)
                        }
                        .padding(.bottom, 20)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white)
                                .frame(height: 70)
                                .shadow(color: .black, radius: 5, x: 0, y: 4)
                                .padding(.horizontal, 20)
                            HStack{
                                Text("Erika Lopez")
                                    .font(.system(size: 20, weight: .bold))
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 20, weight: .bold))
                            }
                            .padding(.horizontal, 40)
                        }
                        .padding(.bottom, 20)
                        Spacer()
                        
                        
                    }
                }
            }
        }
    }
}

struct PacientesView_Previews: PreviewProvider {
    static var previews: some View {
        PacientesView()
    }
}
