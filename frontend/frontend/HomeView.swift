//
//  HomeView.swift
//  frontend
//
//  Created by Alumno on 11/10/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image("ICON")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
                Text("Emergencias")
                    .overlay(
                        HStack{
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.white)
                                .padding(.leading,-50)
                            Spacer()

                        }
                                                    
                    )
                    .frame(width: 300, height:60)
                    .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .cornerRadius(16)
                    .padding(5)
                    .foregroundColor(.white)
                    .font(.title)
            HStack{
                createSection(title: "Emociones", iconName: "smiley.fill")
                
                createSection(title: "Recetas médicas", iconName: "doc.text.fill")
                    
            }
            
            HStack{
                createSection(title: "Llamadas", iconName: "phone.fill.arrow.down.left")
                createSection(title: "Lesiones", iconName: "bandage.fill")
                    
            }
            
        }
        .padding()
    }
}

private func createSection(title:String , iconName: String) -> some View{
    ZStack{
        VStack{
            Text(title).foregroundColor(.white)
                .font(.title)
            Image(systemName: iconName)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
            
        }
        .frame(width: 170, height: 170)
        .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
        .cornerRadius(16)
        .padding(5)
        .foregroundColor(.white)
        .font(.title)

    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
