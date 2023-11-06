//
//  ContentView.swift
//  erickxD
//
//  Created by Leonardo García Ledezma on 06/11/23.
//

import SwiftUI

struct ModifyRecetasView: View {
    var body: some View {
        ZStack{
            Color(red: 0.2824, green: 0.5804, blue: 0.9961)
                .ignoresSafeArea(.all)
            VStack{
                HStack(spacing: 20){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Text("Receta")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)
                
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                    ScrollView{
                        VStack{
                            Text("Titulo")
//                            ZStack{
//                                RoundedRectangle(corner)
//                            }
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

struct ModifyRecetasView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyRecetasView()
    }
}
