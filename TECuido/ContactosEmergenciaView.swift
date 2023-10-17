import SwiftUI

struct ContactosEmergenciaView: View {
   
    @State private var showEstatusView = false
    var body: some View {
        NavigationView { // Asegúrate de envolver tu vista en una NavigationView
            ZStack {
                VStack {
                    Text("Emergencias")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                    
                    // Texto de todo bien
                    Text("Selecciona a quien le")
                        .font(.title)
                        .bold()
                    Text("quieres mandar la alerta")
                        .font(.title)
                        .bold()
                    
                    VStack {
                        // Contenido de la vista
                    }
                    .frame(width: 200, height: 450)
                    
                    Button("Mandar") {
                       showEstatusView = true
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height: 65)
                    .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                    .cornerRadius(25)
                    .padding(30)
                    .font(.title)
                    
                    Rectangle()
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .ignoresSafeArea()
                } .background(
                    NavigationLink("", destination: EstatusEmergenciaView(), isActive: $showEstatusView)
                )

            }
            
        }
    }
}





struct ContactosEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        ContactosEmergenciaView()
    }
}


