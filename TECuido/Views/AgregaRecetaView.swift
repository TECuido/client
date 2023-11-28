//
//  AgregaRecetaView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct AgregaRecetaView: View {
    
    @StateObject var viewModel = CrearRecetaViewModel()

    
    var body: some View {
        
        ScrollView {
            
            // Texto general
            VStack{
                Text("Agregar receta médica")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .padding(20)
                
                //Input Correo
                HStack {
                    Image(systemName: "textformat")
                        .resizable()
                        .frame(width: 30, height: 20)
                        .foregroundColor(.blue)
                        .padding(.leading, 15)
                    TextField("",
                              text: $viewModel.titulo,
                              prompt: Text("Título")
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                    )
                    .font(.title3)
                    .padding(.leading, 5)
                    .autocapitalization(.none)
                }
                .frame(width: 325, height: 55)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(20)
                .padding([.top, .bottom], 10)
                
                //Input Correo
                HStack {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.blue)
                        .padding(.leading, 15)
                    
                    DatePicker(selection: $viewModel.fecha,
                               in: ...Date(),
                               displayedComponents: .date) {
                        Text("Fecha")
                    }
                    .font(.title3)
                    .padding(.leading, 5)
                    .autocapitalization(.none)
                }
                .frame(width: 325, height: 55)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                .cornerRadius(20)
                .padding([.top, .bottom], 10)
                
                // Cards
                Text("Medicamentos")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.bottom, 15)
                
                ForEach(viewModel.medicamentos.indices, id: \.self) { index in
                    
                    VStack(alignment: .leading) {
                        Text("Medicamento #\(index+1)")
                            .font(.title3)
                            .bold()
                        AgregarMedicamentoView(medicamento: $viewModel.medicamentos[index])
                    }
                    .padding(.bottom, 10)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.medicamentos.append(CrearMedicamentoModel(nombre: "", dosis: "", frecuencia: "", duracion: ""))
                    }) {
                        Text("Agregar medicamento")
                    }
                    .foregroundColor(.blue)
                    .padding(.trailing, 25)
                }
                
                // Aqui validamos que este incorrecto
                Text(viewModel.error)
                    .font(.body)
                    .foregroundColor(Color(red: 0.8392,green: 0,blue: 0))
                    .frame(width: 300)
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
                
                //Boton
                Button("Crear receta"){
                    Task {
                        await viewModel.createReceta()
                    }
                }
                .foregroundColor(.white)
                .bold()
                .frame(width: 300, height:55)
                .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                .cornerRadius(25)
                .padding(10)
                .font(.title2)
                
                NavigationLink(destination: HomeView(),
                               isActive: $viewModel.recetaCreada){
                    EmptyView()
                }
                .transition(.slide)

               
                
                
            }
        }
    }
}


struct AgregaRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregaRecetaView()
    }
}
