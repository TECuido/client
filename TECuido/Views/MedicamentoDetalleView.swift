//
//  MedicamentoDetalleView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct MedicamentoDetalleView: View {
    @State var medicamento: MedicamentoModel
    
    @State private var isDictionaryPresented = false
    @State private var isTermValid = false
    @State private var errorMessage = ""

    
    var body: some View {
        VStack(alignment: .leading) {
            Image("medicamentoBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.bottom, 15)
            
            Text("\(medicamento.nombre)")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.leading, 25)
                .padding(.bottom, 15)
            
            HStack {
                
                Spacer()
                
                Link("Ver información", destination: URL(string: "https://vsearch.nlm.nih.gov/vivisimo/cgi-bin/query-meta?v%3Aproject=medlineplus-spanish&v%3Asources=medlineplus-spanish-bundle&query=\(medicamento.nombre)")!)
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height:55)
                    .background(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .cornerRadius(25)
                    .padding(10)
                    .font(.title2)
                
                Spacer()
            }
            
            
        }
    }
    
}

struct MedicamentoDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        MedicamentoDetalleView(medicamento: MedicamentoModel.defaultMedicamento1)
    }
}
