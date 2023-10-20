//
//  GruposView.swift
//  TECuido
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI


struct GruposView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @StateObject var viewModel = GrupoViewModel()
    
    var body: some View {
        
        ZStack {

            Color(red: 0.98, green: 0.98, blue: 0.98)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack {
                    
                    Text("Grupos")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                    List {
                        ForEach(viewModel.grupos){ item in
                            HStack {
                                Text(item.nombre)
                                    .listRowBackground(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .padding([.top, .bottom], 10)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.blue)
                                    .padding(.trailing, 5)
                            }
                        }
                    }.frame(minHeight: minRowHeight * 10)
                        .scrollContentBackground(.hidden)
                    
                    VStack{
                        
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 20)
    
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                }
            }
        }
    }
}

struct GruposView_Previews: PreviewProvider {
    static var previews: some View {
        GruposView()
    }
}
