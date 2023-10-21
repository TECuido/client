//
//  CreaGrupoView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct CreaGrupoView: View {
    @State private var nombre = ""
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = ContactoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @State private var selectedIndices: [Int] = []
    var body: some View {
        
        ZStack{
            VStack{
                ScrollView{
                    // Titulo
                    Text("Crear un grupo")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    //Input Nombre
                    ZStack{
                        Image(systemName: "person.3.fill")
                            .resizable()
                            .frame(width: 100,height:80)
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            
                    }.padding(10)
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        TextField("",
                                  text: $nombre,
                                  prompt: Text("Nombre")
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                          )
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                            .font(.title3)
                            .padding(.leading, 10)
                    }
                    .frame(width: 325, height: 55)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(20)
                    .padding([.top, .bottom], 10)
                    //descripcion
                    Text(" Selecciona a los contactos que quieras añadir:")
                        .font(.title2)
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    // Lista de contactos
                    
                    List {
                        ForEach(viewModel.ejemplo.indices, id: \.self) { index in
                            HStack {
                                if selectedIndices.contains(index) {
                                    ZStack{
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(Color.green)
                                    }
                                } else {
                                    ZStack{
                                        Circle()
                                            .fill(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                                            .frame(width: 40, height: 40)
                                        Text("\(index+1)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                    }
                                }
                                
                                VStack(alignment: .leading){
                                    Text(viewModel.ejemplo[index].nombre ?? "Panfila Lopez")
                                        .font(.title2)
                                    Text(viewModel.ejemplo[index].correo ?? "pan@gmail.com")
                                        .font(.title2)
                                        
                                }.padding(15)
                            }
                            .onTapGesture {
                                if selectedIndices.contains(index) {
                                    selectedIndices.removeAll { $0 == index }
                                } else {
                                    selectedIndices.append(index)
                                }
                            }
                        }
                        
                    }.frame(minHeight: minRowHeight * 6)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    
                    
                }
                Button("Crear"){
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height:55)
                .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                .cornerRadius(25)
                .padding(10)
                .font(.title2)
            }
            
                
                
        }
    }
}



    struct CheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            HStack {
                configuration.label // Utilizamos la propiedad label para mostrar el contenido del Toggle
                Spacer()
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .onTapGesture {
                        withAnimation {
                            configuration.isOn.toggle()
                        }
                    }
            }
        }
    }




struct CreaGrupoView_Previews: PreviewProvider {
    static var previews: some View {
        CreaGrupoView()
    }
}
