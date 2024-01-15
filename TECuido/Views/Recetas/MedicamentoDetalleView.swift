//
//  MedicamentoDetalleView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct MedicamentoDetalleView: View {
    
    @Binding var path: NavigationPath
    
    @State var medicamento: MedicamentoModel
    @State private var isDictionaryPresented = false
    @State private var isTermValid = false
    @State private var errorMessage = ""

    
    var body: some View {
        
        ZStack {
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading) {
                
                Image("medicamentoBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.bottom, 15)
                
                Text(medicamento.nombre)
                    .font(.custom("Lato", size: FontSize.label.rawValue))
                    .foregroundColor(Color("TitleColor"))
                    .padding(.leading, 25)
                    .padding(.bottom, 15)
                    .bold()
                
                HStack {
                    
                    Spacer()
                    
                    LinkButton(
                        title: "Ver más",
                        link: "https://vsearch.nlm.nih.gov/vivisimo/cgi-bin/query-meta?v%3Aproject=medlineplus-spanish&v%3Asources=medlineplus-spanish-bundle&query=\(medicamento.nombre)"
                    )
                    
                    Spacer()
                }
            }
            
        }
        
        
    }
    
}

struct MedicamentoDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        MedicamentoDetalleView(
            path: .constant(NavigationPath()),
            medicamento: MedicamentoModel.defaultMedicamento1
        )
    }
}
