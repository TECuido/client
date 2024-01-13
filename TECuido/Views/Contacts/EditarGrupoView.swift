//
//  EditarGrupoView.swift
//  TECuido
//
//  Created by Ruben Tandon Ramirez on 09/11/23.
//
import SwiftUI

struct EditarGrupoView: View {
    
    @Binding var path: NavigationPath
    @State var grupo: GrupoModel
    @Environment(\.presentationMode) var presentationMode
    @StateObject var EditarGrupoVM = EditarGrupoViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
//    @State private var confirmarEditar = false
    
    
    static var tag = "EditarGrupoView"

    var body: some View {

        ZStack{
            VStack{
                    // Titulo
                    Text("Editar grupo")
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
                                  text: $EditarGrupoVM.nombreGrupo,
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
                            .stroke(.red, lineWidth: CGFloat(EditarGrupoVM.nombreError)*2)
                    }
                    .padding([.top, .bottom], 10)



                    //descripcion
                    Text(" Selecciona a los contactos que quieras agregar:")
                        .font(.title2)
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)

                    // Lista de contactos
                    
                    List {
                        ForEach(EditarGrupoVM.contactos.indices, id: \.self) { index in
                            HStack {
                                if EditarGrupoVM.selectedIndices.contains(index) {
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
                                    Text(EditarGrupoVM.contactos[index].usuarioAgregado.nombre)
                                        .font(.title2)
                                    Text(EditarGrupoVM.contactos[index].usuarioAgregado.correo)
                                        .font(.title2)

                                }.padding(15)
                            }
                            .onTapGesture {
                                if EditarGrupoVM.selectedIndices.contains(index) {
                                    EditarGrupoVM.selectedIndices.removeAll { $0 == index }
                                } else {
                                    EditarGrupoVM.selectedIndices.append(index)
                                }
                            }
                        }

                    }
                    .task{
                        await EditarGrupoVM.getContactos()
                        await EditarGrupoVM.getMiembros(idGrupo: grupo.id)
                    }
                    .frame(minHeight: minRowHeight * 6)
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetListStyle())


                    .alert(isPresented: $EditarGrupoVM.editarGrupoFail) {
                    Alert(
                        title:
                            Text("Error")

                                .font(.title)
                        ,
                        message: Text("Se necesita mínimo un miembro por grupo")
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
                Text(EditarGrupoVM.error)
                    .font(.body)
                    .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                    .frame(width: 300)
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)



                // Vamos a checar lo del modal aqui
                Button("Editar Grupo"){
                    Task {
                        await EditarGrupoVM.updateMiembros(idGrupo: grupo.id, nombreGrupo: EditarGrupoVM.nombreGrupo)
//                        confirmarEditar = true
                    }
                }
                // Modal
                    .alert(isPresented: $EditarGrupoVM.editarGrupo) {
                    Alert(
                        title:
                            Text("Grupo Actualizado")

                                .font(.title)
                        ,
                        message: Text("Se editó el grupo con éxito")
                            .font(.title2),
                        dismissButton: .default(
                            Text("OK")
                                .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529)),
                            action: {

                            }
                        )
                    )
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
//        .background(
//            NavigationLink("", destination:
//                            ListaGruposView(), isActive: $confirmarEditar)
//        )
    }
}




struct EditarGrupoView_Previews: PreviewProvider {
    static var previews: some View {
        EditarGrupoView(path: .constant(NavigationPath()), grupo: GrupoModel.example)
    }
}
