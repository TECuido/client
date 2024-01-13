//
//  CreaGrupoView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//



import SwiftUI

struct CreaGrupoView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = CrearGrupoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    static var tag = "CrearGrupoView"
    
    
    var body: some View {
        
        ZStack{
            VStack{
                    // Titulo
                    Text("Crear grupo")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                
                    //Icono
                    ZStack{
                        Image(systemName: "person.3.fill")
                            .resizable()
                            .frame(width: 150,height:80)
                            .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                            
                    }.padding(10)
                
                    //input nombre
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 16)
                        TextField("",
                                  text: $viewModel.nombreGrupo,
                                  prompt: Text("Nombre del grupo")
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                                          )
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                            .font(.title3)
                            .padding(.leading, 10)
                    }
                    .frame(width: 325, height: 55)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.red, lineWidth: CGFloat(viewModel.nombreError)*2)
                    }
                    .padding([.top, .bottom], 10)
                
                
                    
                    //descripcion
                    Text(" Selecciona a los contactos que quieras añadir:")
                        .font(.title2)
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Lista de contactos
                    
                    List {
                        ForEach(viewModel.contactos.indices, id: \.self) { index in
                            HStack {
                                if viewModel.selectedIndices.contains(index) {
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
                                    Text(viewModel.contactos[index].usuarioAgregado.nombre)
                                        .font(.title2)
                                    Text(viewModel.contactos[index].usuarioAgregado.correo)
                                        .font(.title2)
                                    
                                }.padding(15)
                            }
                            .onTapGesture {
                                if viewModel.selectedIndices.contains(index) {
                                    viewModel.selectedIndices.removeAll { $0 == index }
                                } else {
                                    viewModel.selectedIndices.append(index)
                                }
                            }
                        }
                        
                    }
                    .task{
                        await viewModel.getContactos()
                    }
                    .frame(minHeight: minRowHeight * 6)
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetListStyle())
                     
                    
                    
                
                     
                     
                
                // Modal
                    .alert(isPresented: $viewModel.grupoCreado) {
                    Alert(
                        title:
                            Text("Grupo Agregado")
                               
                                .font(.title)
                        ,
                        message: Text("Se agregó el grupo con éxito")
                            .font(.title2),
                        dismissButton: .default(
                            Text("OK")
                                .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529)),
                            action: {
                                
                            }
                        )
                    )
                }
                
                // Aqui validamos que este incorrecto
                Text(viewModel.error)
                    .font(.body)
                    .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                    .frame(width: 300)
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
                
                
                
                // Vamos a checar lo del modal aqui
                Button("Crear Grupo"){
                    Task {
                        await viewModel.crearGrupo()
                    }
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height:55)
                .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                .cornerRadius(25)
                .padding(10)
                .font(.title2)
                
                NavigationLink("", destination: TECuidoView(), isActive: $viewModel.failedAuthentication)
                
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


