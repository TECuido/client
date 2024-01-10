//
//  CondicionMedicaView.swift
//  TECuido
//
//  Created by Alumno on 09/01/24.
//

import SwiftUI

struct CondicionMedicaView: View {
    @StateObject var viewModel = CrearGrupoViewModel()
    var body: some View {
        ZStack{
            VStack{
                // Titulo
                Text("Condicion Medica")
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
                              prompt: Text("Nombre de la Condicion")
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
                Button("Agregar Condicion "){
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
            
        }//FIN ZStack
          
    }
}


struct CondicionMedicaView_Previews: PreviewProvider {
    static var previews: some View {
        CondicionMedicaView()
    }
}
