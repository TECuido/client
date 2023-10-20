//
//  MostarRecetaView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct MostarRecetaView: View {
    var body: some View {
        ZStack{
            VStack{
               
                    // Titulo
                    Text("Receta x")
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        .font(.system(size: 45))
                        .bold()
                        .frame(width: 280)
                        .padding()
                        .multilineTextAlignment(.center)
                    // Agregar select de motivo de alerta
                ScrollView{
                    LabelAlignment(text: "YLorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu pellentesque velit. Mauris eget neque volutpat, ultrices odio quis, porttitor tellus. Quisque fermentum dignissim orci eget efficitur. Vestibulum feugiat dolor sollicitudin sapien bibendum, vitae commodo dui eleifend. Proin a accumsan arcu. Nunc vulputate ex dapibus, posuere sem facilisis, vulputate nibh. Vestibulum facilisis nisl eget elit tempor lobortis", textAlignmentStyle: .justified, width: UIScreen.main.bounds.width - 80)

                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                        .font(.body)
                        .padding(.top,30)
                        
                        
                           
                    }
                .frame(maxWidth: .infinity)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(20)
                    
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
