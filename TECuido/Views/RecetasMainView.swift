//
//  ContentView.swift
//  TECuido
//
//  Created by Erick on 06/11/23.
//

import SwiftUI

struct RecetasMainView: View {
    var body: some View {
        ZStack{
            Color(red: 0.2824, green: 0.5804, blue: 0.9961)
                .ignoresSafeArea(.all)
            VStack{
                
                HStack(spacing: 20){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    
//                    Text("Recetas")
//                        .foregroundColor(.white)
//                        .font(.system(size: 26, weight: .heavy))
                    Spacer()
                }
                .padding()
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .ignoresSafeArea()
                    
                    VStack{
                        HStack{
                            Text("Recetas")
                                .font(.system(size: 26, weight: .bold))

                            Spacer()

                            Image(systemName: "plus")
                                .font(.system(size: 26, weight: .bold))

                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical)

                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(red: 0.8824, green: 0.8824, blue: 0.8824))

                            VStack{
                                HStack(spacing: 30){
                                    ZStack{
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(Color(red: 0.2824, green: 0.5804, blue: 0.9961))
                                        
                                        Text("1")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Receta 4")
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        Text("24/08/2023")
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    
                                    
                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 20, weight: .bold))
                                }
                                .padding()


                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 1)

                                HStack(spacing: 30){
                                    ZStack{
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(Color(red: 0.2824, green: 0.5804, blue: 0.9961))
                                        
                                        Text("2")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Receta 8")
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        Text("24/08/2023")
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    
                                    
                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 20, weight: .bold))
                                }
                                .padding()


                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 1)

                                HStack(spacing: 30){
                                    ZStack{
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(Color(red: 0.2824, green: 0.5804, blue: 0.9961))
                                        
                                        Text("3")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                    VStack(alignment: .leading, spacing: 10){
                                        Text("Receta 2")
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        Text("24/08/2023")
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                    
                                    
                                    Spacer()

                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 20, weight: .bold))
                                }
                                .padding()


                                Rectangle()
                                    .fill(Color.black)
                                    .frame(height: 1)
                                Spacer()
                            }
                        }
                    }
                    .padding()
                }
//                HStack{
//                    Spacer()
//                    VStack(spacing: 5){
//                        Image(systemName: "square.and.pencil")
//                            .foregroundColor(.white)
//                            .font(.system(size: 30, weight: .bold))
//                        Text("Modificar")
//                    }
//                    Spacer()
//                    Spacer()
//                }
            }
        }
    }
}

struct RecetasMainView_Previews: PreviewProvider {
    static var previews: some View {
        RecetasMainView()
    }
}
