//
//  AgregaRecetaView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct AgregaRecetaView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = CrearRecetaViewModel()

    
    var body: some View {
        
        ScrollView {
            
            // Texto general
            VStack{
                
                Title(text: "Agregar receta médica")
                
                Input(
                    inputText: $viewModel.titulo,
                    inputPrompt: "Título",
                    icon: "textformat",
                    iconSize: (28, 19),
                    iconPadding: 10
                )
                
                DateInput(
                    date: $viewModel.fecha,
                    inputPrompt: "Fecha"
                )
                
                if(session.tipoUsuario == 2){
                    LabelText(text: "Selecciona a tu paciente")
                    // Picker de pacientes
                    SelectInput(
                        title: "Selecciona a un paciente",
                        selectedOption: $viewModel.selectedOptionPaciente,
                        list: viewModel.pacientesNombres
                    ){
                        Task {
                            await viewModel.getPacientes()
                        }
                    }
                }
                
                // Cards
                LabelText(text: "Medicamentos")
                
                ForEach(viewModel.medicamentos.indices, id: \.self) { index in
                    
                    VStack(alignment: .leading) {
                        
                        Text("Medicamento #\(index+1)")
                            .font(.custom("Lato", size: FontSize.text.rawValue))
                            .foregroundColor(Color("TextColor"))
                            .bold()
                        
                        AgregarMedicamentoView(medicamento: $viewModel.medicamentos[index])
                        
                    }
                    .padding([.top, .bottom], 10)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.medicamentos.append(CrearMedicamentoModel(nombre: "", dosis: "", frecuencia: "", duracion: ""))
                    }) {
                        Text("Agregar medicamento")
                    }
                    .font(.custom("Lato", size: FontSize.captions.rawValue))
                    .foregroundColor(Color("LightBlue"))
                    .padding(.top, 3)
                    .padding(.trailing, 25)
                }
                
                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)
                
                PrimaryButton(title: "Crear receta"){
                    Task {
                        if(session.tipoUsuario == 2){
                            await viewModel.createRecetaMedico()
                        } else {
                            await viewModel.createRecetaPaciente()
                        }
                    }
                }
                
            }
        }
    }
}


struct AgregaRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregaRecetaView()
            .environmentObject(SessionManager())
    }
}
