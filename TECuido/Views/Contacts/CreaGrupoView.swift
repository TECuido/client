//
//  CreaGrupoView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//



import SwiftUI

struct CreaGrupoView: View {
    
    @Binding var path: NavigationPath
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @StateObject var viewModel = CrearGrupoViewModel()
    
    static var tag = "CrearGrupoView"
    
    
    var body: some View {
        
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Title(text: "Crear Grupo");
                
                //Icono
                Image(systemName: "person.3.fill")
                    .resizable()
                    .frame(width: 150,height:80)
                    .foregroundColor(Color("LightBlue"))
                        
                Input(
                    inputText: $viewModel.nombreGrupo,
                    inputPrompt: "Nombre del grupo",
                    icon: "person.fill", 
                    iconSize: (24, 24),
                    iconPadding: 16,
                    inputError: viewModel.nombreError
                )
    
                //descripcion
                Text("Selecciona a los contactos que quieras añadir:")
                    .font(.custom("Lato", size: FontSize.text.rawValue))
                    .frame(width: 280)
                    .padding()
                    .multilineTextAlignment(.center)
                
                if(!viewModel.contactos.isEmpty){
                    // Lista de contactos
                    List {
                        ForEach(viewModel.contactos.indices, id: \.self) { index in
                            HStack {
                                if viewModel.selectedIndices.contains(index) {
                                    CheckedItem(
                                        title: viewModel.contactos[index].usuarioAgregado.nombre,
                                        subtitle: viewModel.contactos[index].usuarioAgregado.correo
                                    )
                                } else {
                                    NumberedItem(
                                        number: index+1,
                                        title: viewModel.contactos[index].usuarioAgregado.nombre,
                                        subtitle: viewModel.contactos[index].usuarioAgregado.correo
                                    )
                                }
                            }
                            .listRowBackground(Color("BackgroundColor"))
                            .listRowSeparatorTint(Color("PlaceholderColor"))
                            .onTapGesture {
                                if viewModel.selectedIndices.contains(index) {
                                    viewModel.selectedIndices.removeAll { $0 == index }
                                } else {
                                    viewModel.selectedIndices.append(index)
                                }
                            }
                        }
                    }
                    .frame(minHeight: minRowHeight * 6)
                    .background(Color("BackgroundColor"))
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetListStyle())
                    .alert(isPresented: $viewModel.grupoCreado) {
                        AcceptAlert(
                            title: "Grupo agregado",
                            message: "Se agregó el grupo con éxito"
                        ){
                            path.removeLast()
                        }
                    }
                }
                
                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)
                
                PrimaryButton(title: "Crear grupo"){
                    Task {
                        await viewModel.crearGrupo()
                    }
                }
                .padding(.bottom, 10)
                
                Spacer()
                
            }
            .task{
                await viewModel.getContactos()
            }
            
        }
    }
}

struct CreaGrupoView_Previews: PreviewProvider {
    static var previews: some View {
        CreaGrupoView(path: .constant(NavigationPath()))
    }
}


