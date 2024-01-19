import SwiftUI

struct AlergiaView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = AlergiaViewModel()
    @Binding var path: NavigationPath

    static var tag = "Alergia"

    var body: some View {

        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                // Titulo
                Title(text:"Agrega una alergia")

                // Input Nombre
                Image(systemName: "nose")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .foregroundColor(Color("LightBlue"))
                    .padding(.top, 20)

                // Input de la Alergia
                Input(inputText: $viewModel.nombre,
                      inputPrompt: "Nombre de la alergia",
                      icon: "nose",
                      iconSize: (30, 30),
                      iconPadding: 15,
                      inputError: viewModel.nombreError)
                    .padding(.top, 20)

                ErrorMessage(errorText: viewModel.error)
                    .padding(.bottom, -10)

                PrimaryButton(title: "Enviar") {
                    Task {
                        await viewModel.crearAlergia()
                    }
                }

                // Modal
                .alert(isPresented: $viewModel.alergiaCreada) {
                    AcceptAlert(
                        title: "Alergia Agregada",
                        message: "Se agregó la alergia con éxito"
                    ) {
                        viewModel.nombre = ""
                        path.removeLast()
                    }
                }
            }
        }
    }
}

struct AlergiaView_Previews: PreviewProvider {
    static var previews: some View {
        AlergiaView(path: .constant(NavigationPath()))
    }
}
