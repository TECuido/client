//
//  MedicamentoDetalleView.swift
//  TECuido
//
//  Created by Alumno on 16/11/23.
//

import SwiftUI

struct MedicamentoDetalleView: View {
    @State var idMedicamento: Int
    @StateObject var viewModel = MedicamentoDetalleViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("medicamentoBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.bottom, 15)
            
            Text("\(viewModel.medicamentoDetalle.nombre)")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.leading, 25)
                .padding(.bottom, 15)
            
            HStack {
                Image(systemName: "pill.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 5)

                
                Text("Usos:")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 5)
            .padding(.leading, 25)
            
            Text("\(viewModel.medicamentoDetalle.uso)")
                .padding(.bottom, 20)
                .padding(.leading, 25)
            
            HStack {
                Image(systemName: "book.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 5)
                
                Text("Descripción:")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .padding(.bottom, 5)
            .padding(.leading, 25)

            Text("\(viewModel.medicamentoDetalle.uso)")
                .padding(.bottom, 10)
                .padding(.leading, 25)

            
            Spacer()
        }
    }
}

struct MedicamentoDetalleView_Previews: PreviewProvider {
    static var previews: some View {
        MedicamentoDetalleView(idMedicamento: 0)
    }
}
