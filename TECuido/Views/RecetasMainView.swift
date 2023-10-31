//
//  RecetasMainView.swift
//  TECuido
//
//  Created by Alumno on 30/10/23.
//

import SwiftUI

struct RecetasMainView: View {
    var body: some View {
        ZStack{
            Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .font(.system(size: 20))
                    Text("Recetas")
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .font(.system(size: 26, weight: .semibold))
                    Spacer()
                }
                .padding(.horizontal, 20)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    VStack{
                        VStack{
                            Text("Receta")
                                .font(.system(size: 26, weight: .semibold))
                                
                            Text("Inserte Nombre")
                                .font(.system(size: 26, weight: .semibold))
                        }
                        .padding(20)

                        HStack{
                            Text("Paciente:")
                                .font(.system(size: 20, weight: .bold))

                            Text("Pedro López")
                                .font(.system(size: 20, weight: .regular))
                        }
                        ScrollView{
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(red: 0.8824, green: 0.8824, blue: 0.8824))
                            VStack{
                                    HStack{
                                        Text("Paracetamol")
                                            .font(.system(size: 25, weight: .bold))
                                        Spacer()
                                    }
                                    .padding([.horizontal, .top])
                                    
                                    Image("icon")
                                    HStack{
                                        Text("Cantidad")
                                            .font(.system(size: 20, weight: .semibold))
                                        Spacer()
                                    }
                                    .padding(.horizontal, 20)
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(height: 50)
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        HStack{
                                            Text("1 tableta por día")
                                                .font(.system(size: 17, weight: .semibold))
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        
                                    }
                                    .padding(.horizontal, 20)
                                    
                                    HStack{
                                        Text("¿Cuando tomar?")
                                            .font(.system(size: 20, weight: .semibold))
                                        Spacer()
                                    }
                                    .padding(.horizontal, 20)
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(height: 50)
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        HStack{
                                            Text("Temprano por las mañanas")
                                                .font(.system(size: 17, weight: .semibold))
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        
                                    }
                                    .padding(.horizontal, 20)
                                    
                                    HStack{
                                        Text("PeptoBismol")
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    
                                    Image("icon")
                                    HStack{
                                        Text("Cantidad")
                                            .font(.system(size: 20, weight: .semibold))
                                        Spacer()
                                    }
                                    .padding(.horizontal, 20)
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(height: 50)
                                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                        HStack{
                                            Text("1 tableta por día")
                                                .font(.system(size: 17, weight: .semibold))
                                            Spacer()
                                        }
                                        .padding(.horizontal)
                                        
                                    }
                                    .padding(.horizontal, 20)
                                    
                                    //                                HStack{
                                    //                                    Text("¿Cuando tomar?")
                                    //                                        .font(.system(size: 20, weight: .semibold))
                                    //                                    Spacer()
                                    //                                }
                                    //                                .padding(.horizontal, 20)
                                    
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                }
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
        }
    }
}

struct RecetasMainView_Previews: PreviewProvider {
    static var previews: some View {
        RecetasMainView()
    }
}
