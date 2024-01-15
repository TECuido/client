import SwiftUI

struct MedicamentoActualView: View {

    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = MedicamentosActualesViewModel()
    @Binding var path: NavigationPath

    static var tag = "MedicamentoActual"
    var body: some View {
      
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                // Titulo
                Title(text:"Agrega un medicamento")

                // Input Nombre
                Image(systemName: "pills.fill")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .foregroundColor(Color("LightBlue"))
                    .padding(.top, 20)

                // Input de la Alergia
                Input(inputText: $viewModel.nombre,
                      inputPrompt: "Nombre medicamento",
                      icon: "pills.fill",
                      iconSize: (30, 20),
                      iconPadding: 15,
                      inputError: viewModel.nombreError)
                    .padding(.top, 20)

                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)

                PrimaryButton(title: "Enviar") {
                    Task {
                        await viewModel.crearMedicamentosActuales()
                    }
                }

                // Modal
                .alert(isPresented: $viewModel.medicamentoCreado) {
                    AcceptAlert(
                        title: "Medicamento Agregado",
                        message: "Se agregó el medicamento con éxito"
                    ) {
                        viewModel.nombre = ""
                        path.removeLast()
                    }
                }
            }
        }
    }
}

struct MedicamentoActualView_Previews: PreviewProvider {
    static var previews: some View {
        MedicamentoActualView(path: .constant(NavigationPath()))
    }
}
