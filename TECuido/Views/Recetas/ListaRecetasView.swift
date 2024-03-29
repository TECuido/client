//
//  RecetasView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct ListaRecetasView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = ListaRecetasViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    func formatDate(date: String) -> String{
        return String(date.prefix(10))
    }
    
    func formatName(_ name: String?) -> String {
        if let name = name {
            return session.tipoUsuario == 2 ? "Paciente: \(name)" : "Dr: \(name)"
        } else {
            return ""
        }
    }
    
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                ScrollView{
                    
                    Spacer()
                    
                    Title(text: "Recetas médicas")
                    
                    if(viewModel.recetas.isEmpty){
                        NoPrescriptionIcon()
                        SubTitle(text: "Aún no hay recetas agregadas")
                    } else {
                        List{
                            ForEach(Array(viewModel.recetas.enumerated()), id:\.offset) { index,item in
                                
                                ZStack {
                                    
                                    NavigationLink(value: item){
                                        EmptyView()
                                    }
                                    
                                    HStack{
                                        
                                        NumberedBigItem(
                                            number: index+1,
                                            title: item.nombre,
                                            text1: formatDate(date: item.fecha),
                                            text2: formatName(item.nombrePersona)
                                        )
                                        
                                        Spacer()
                                        
                                        Menu {
                                            Button(action: {
                                                // Acción para borrar
                                                viewModel.isShowingConfirmationModel = true
                                                viewModel.idRecetaSeleccionada = item.id
                                                
                                            }) {
                                                Label("Eliminar", systemImage: "trash")
                                            }
                                        } label: {
                                            Image(systemName: "ellipsis.circle")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(Color("LightBlue"))
                                                .padding(.trailing, 10)
                                        }
                                                                        
                                        
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .frame(width: 15, height: 20)
                                            .padding(.leading, 15)
                                            .foregroundColor(Color("LightBlue"))
                                        
                                        
                                    }
                                    
                                }
                                // Modal
                                .alert(isPresented: $viewModel.isShowingConfirmationModel) {
                                    OptionsAlert(
                                        title: "Eliminar receta",
                                        message:"¿Estás seguro de que deseas eliminar la receta?"
                                    ){
                                        Task {
                                            await viewModel.deleteRecetas()
                                        }
                                    }
                                }
                                .padding([.top, .bottom], 10)
                                .listRowBackground(Color("BackgroundColor"))
                                .listRowSeparatorTint(Color("PlaceholderColor"))
                            
                            
                            }
                            
                        }
                        .frame(minHeight: minRowHeight * 12)
                        .scrollContentBackground(.hidden)
                        .listStyle(InsetListStyle())
                    }
                        
                
                }
                .task {
                    if(session.tipoUsuario == 2){
                        await viewModel.getRecetasMedico()
                    } else {
                        await viewModel.getRecetasPaciente()
                    }
                }
                .alert(isPresented: $viewModel.recetaEliminada) {
                    AcceptAlert(
                        title: "Receta eliminada",
                        message: "Se eliminó la receta con éxito"
                    ){
                        Task {
                            viewModel.recetaEliminada = false
                            if(session.tipoUsuario == 2){
                                await viewModel.getRecetasMedico()
                            } else {
                                await viewModel.getRecetasPaciente()
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
}

struct ListaRecetasView_Previews: PreviewProvider {
    static var previews: some View {
        ListaRecetasView()
            .environmentObject(SessionManager())
    }
}
