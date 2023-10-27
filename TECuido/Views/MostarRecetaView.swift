//
//  MostarRecetaView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//
import SwiftUI
struct MostarRecetaView: View {
    @StateObject var viewModel = RecetaDetalleViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    @State private var showDetallesView = false

    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    // Titulo
                    Text("Receta X")
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(20)
                        .multilineTextAlignment(.center)

                    // Lista de contactos
                    List {
                        ForEach(Array(viewModel.ejemplo.enumerated()), id: \.offset) { index, item in
                            HStack {
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing) .frame(width: 40, height: 40) .clipShape(Circle()) .overlay( Image(systemName: "heart.fill") .foregroundColor(.white) )
                                    
                                }

                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(item.nombreMedicamento ?? "Loratadina")
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                        .multilineTextAlignment(.center)
                                        
                                    Text("Dosis: \(item.dosis ?? "50 ml")")
                                        .font(.title3)
                                        .foregroundColor(.gray)
                                    HStack{
                                        Text("\(item.frecuencia ?? "Por 8 horas") \(item.tiempo ?? "durante 3 días")")
                                            .font(.title3)
                                            .foregroundColor(.blue)

                                    }
                                    
                                }
                                .padding(20)

                                Spacer()

                                Button(action: {
                                    showDetallesView = true
                                }) {
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                        .font(.title)
                                }
                            }
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                            .padding(10)
                        }
                    }
                    .frame(minHeight: minRowHeight * 12)
                    .listStyle(PlainListStyle()) // Cambiado a PlainListStyle para quitar el espacio innecesario

                    // El botón de agregar
                    NavigationLink("", destination: SimplificarRecetaView(), isActive: $showDetallesView)
                        .padding(20)
                }
            }
        }
    }
}





// Estructura para justificar el texto
/**
 Consta de texto a enviar
 donde lo alineas y width de lados
 */
struct LabelAlignment: UIViewRepresentable {
  var text: String
  var textAlignmentStyle : TextAlignmentStyle
  var width: CGFloat

  func makeUIView(context: Context) -> UILabel {
      let label = UILabel()
      label.textAlignment = NSTextAlignment(rawValue: textAlignmentStyle.rawValue)!
      label.numberOfLines = 0
      label.preferredMaxLayoutWidth = width
      label.setContentHuggingPriority(.required, for: .horizontal)
      label.setContentHuggingPriority(.required, for: .vertical)

      return label
  }

  func updateUIView(_ uiView: UILabel, context: Context) {
      uiView.text = text
  }
}

enum TextAlignmentStyle : Int{
   case left = 0 ,center = 1 , right = 2 ,justified = 3 ,natural = 4
}


struct MostarRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        MostarRecetaView()
    }
}
