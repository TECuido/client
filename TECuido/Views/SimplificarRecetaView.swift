//
//  SimplificarRecetaView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct SimplificarRecetaView: View {

        var body: some View {
            ZStack {
                VStack {
                    // Título
                    Text("Paracetamol")
                        .font(.system(size: 40))
                        .bold()
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                        .frame(width: 320)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // Imagen del paracetamol
                    AsyncImage(url:URL(string: "https://m.media-amazon.com/images/I/61uutWxTEIL.__AC_SX300_SY300_QL70_ML2_.jpg"))
                    .cornerRadius(10)
                      
                    Text("Descripción del medicamento:")
                        .font(.title2)
                        .bold()
                        .padding(.top, 50)
                        .foregroundColor(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                    ScrollView {
                        // Descripción del paracetamol
                        LabelAlignment(text: "El paracetamol es un medicamento ampliamente utilizado como analgésico (para aliviar el dolor) y antipirético (para reducir la fiebre). Es uno de los medicamentos más comunes y se encuentra disponible sin receta en muchas partes del mundo.", textAlignmentStyle: .justified, width: UIScreen.main.bounds.width - 80)
                            .font(.body)
                            .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                            .padding(.top,  -5)
                    }
                    .frame(maxWidth: .infinity)
                   
                    .cornerRadius(20)
                    .padding(20)
                }
            }
        }
    }




struct SimplificarRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        SimplificarRecetaView()
    }
}
