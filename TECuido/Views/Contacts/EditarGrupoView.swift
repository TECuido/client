//
//  EditarGrupoView.swift
//  TECuido
//
//  Created by Ruben Tandon Ramirez on 09/11/23.
//
import SwiftUI

struct EditarGrupoView: View {
    
    @Binding var path: NavigationPath
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @StateObject var EditarGrupoVM = EditarGrupoViewModel()
    
    var grupo: GrupoModel
    
    static var tag = "EditarGrupoView"
    
    init(path: Binding<NavigationPath>, grupo: GrupoModel){
        self._path = path
        self.grupo = grupo
        EditarGrupoVM.setNombreGrupo(nombre: grupo.nombre)
    }

    var body: some View {

        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Title(text: "Editar grupo")
                
                Image(systemName: "person.3.fill")
                    .resizable()
                    .frame(width: 150,height:80)
                    .foregroundColor(Color("LightBlue"))

                Input(
                    inputText: $EditarGrupoVM.nombreGrupo,
                    inputPrompt: "Nombre del grupo",
                    icon: "person.fill",
                    iconSize: (24, 24),
                    iconPadding: 16,
                    inputError: EditarGrupoVM.nombreError
                )
                .onAppear{
                    EditarGrupoVM.nombreGrupo = grupo.nombre
                }
                
                //descripcion
                Text("Selecciona a los contactos que quieras añadir:")
                    .font(.custom("Lato", size: FontSize.text.rawValue))
                    .frame(width: 280)
                    .padding()
                    .multilineTextAlignment(.center)
                
                if(!EditarGrupoVM.contactos.isEmpty){
                    // Lista de contactos
                    List {
                        ForEach(Array(EditarGrupoVM.contactos.enumerated()), id: \.offset) { index, contacto in
                            HStack {
                                if EditarGrupoVM.selectedIndices.contains(index) {
                                    CheckedItem(
                                        title: contacto.nombre,
                                        subtitle: contacto.telefono
                                    )
                                } else {
                                    NumberedItem(
                                        number: index+1,
                                        title: contacto.nombre,
                                        subtitle: contacto.telefono
                                    )
                                }
                            }
                            .listRowBackground(Color("BackgroundColor"))
                            .listRowSeparatorTint(Color("PlaceholderColor"))
                            .onTapGesture {
                                if EditarGrupoVM.selectedIndices.contains(index) {
                                    EditarGrupoVM.selectedIndices.removeAll { $0 == index }
                                } else {
                                    EditarGrupoVM.selectedIndices.append(index)
                                }
                            }
                        }

                    }
                    .frame(minHeight: minRowHeight * 6)
                    .background(Color("BackgroundColor"))
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetListStyle())
                }

                
                

                ErrorMessage(errorText: EditarGrupoVM.error)
                
                PrimaryButton(title: "Editar Grupo"){
                    Task {
                        await EditarGrupoVM.updateMiembros(idGrupo: grupo.id, nombreGrupo: EditarGrupoVM.nombreGrupo)
                    }
                }
                .alert(isPresented: $EditarGrupoVM.grupoEditado) {
                    AcceptAlert(
                        title: "Grupo actualizado",
                        message: "Se editó el grupo con éxito"
                    ){
                        path.removeLast()
                    }
                }
                .padding(.bottom, 10)
                
                Spacer()
            }
            .task{
                await EditarGrupoVM.getContactos()
                await EditarGrupoVM.getMiembros(idGrupo: grupo.id)
            }

        }
    }
}




struct EditarGrupoView_Previews: PreviewProvider {
    static var previews: some View {
        EditarGrupoView(path: .constant(NavigationPath()), grupo: GrupoModel.example)
    }
}
