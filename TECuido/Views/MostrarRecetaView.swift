//
//  MostarRecetaView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI

struct MostrarRecetaView: View {
    
    @StateObject var viewModel = RecetaViewModel()
    
    var body: some View {
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
                    
                    List(viewModel.recetaMedicamentos){ item in
                        VStack(alignment: .leading) {
                            
                            ZStack{
                                
                                NavigationLink(destination: MedicamentoDetalleView(idMedicamento: item.id)){
                                    EmptyView()
                                }
                                
                                HStack {
                                    
                                    ZStack {
                                        
                                        Circle()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.blue)
                                        
                                        Image(systemName: "pill.fill")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 20, height:20)
                                        
                                    }
                                    .padding(.trailing, 5)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.nombre)
                                            .foregroundColor(.blue)
                                            .fontWeight(.bold)
                                            .font(.title3)
                                            .padding(.bottom, 3)
                                        
                                        Text("\(item.dosis) \(item.unidadDosis) cada \(item.frecuencia!) \(item.unidadFrecuencia!)")
                                            .padding(.bottom, 3)
                                        Text("Duración: \(item.duracion) \(item.unidadDuracion)")
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.blue)
                                }
                                .padding(.bottom, 5)
                            }
                            
                        }
                    }
                    .font(.body)
                    
                    
            }
            
        }
}

struct MostarRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        MostrarRecetaView()
    }
}
