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
                .ignoresSafeArea()
            VStack{
                HStack(spacing: 20){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    
                    Text("Recetas")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .heavy))
                    Spacer()
                }
                .padding(.horizontal)
                
                ZStack{
                    Rectangle()
                        .fill(.white)
                        .ignoresSafeArea()
                    
                    VStack{
                        HStack{
                            Text("Lista de Recetas")
                                .font(.system(size: 26, weight: .bold))

                            Spacer()

                            Image(systemName: "plus")
                                .font(.system(size: 26, weight: .bold))

                        }
                        .padding()

                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color(red: 0.8824, green: 0.8824, blue: 0.8824))
                            ScrollView{
                                
                                VStack(spacing: 20){
                                    HStack(spacing: 20){
                                        ZStack{
                                            Circle()
                                                .fill(Color(red: 0.2824, green: 0.5804, blue: 0.9961))
                                                .frame(width: 50, height: 50)
                                            
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
                                    .padding(.top)
                                    
                                    
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(height: 1)
                                    
                                    HStack(spacing: 20){
                                        ZStack{
                                            Circle()
                                                .fill(Color(red: 0.2824, green: 0.5804, blue: 0.9961))
                                                .frame(width: 50, height: 50)
                                            
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
                                    
                                    
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(height: 1)
                                    
                                    HStack(spacing: 20){
                                        ZStack{
                                            Circle()
                                                .fill(Color(red: 0.2824, green: 0.5804, blue: 0.9961))
                                                .frame(width: 50, height: 50)
                                            
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
                                    
                                    
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(height: 1)
                                    Spacer()
                                }
                                .padding()
                            }
                        }
                    }
                    .padding()
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
