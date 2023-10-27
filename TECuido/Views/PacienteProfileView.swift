//
//  PacienteProfileView.swift
//  TECuido
//
//  Created by Alumno on 26/10/23.
//

import SwiftUI

struct PacienteProfileView: View {
    var body: some View {
        ZStack{
            Color(red: 0.1294,green: 0.5882,blue: 0.9529)
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .padding()
                    Text("Paciente")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                    Spacer()
                }
                ZStack{
                    // Rectangulos de fondo
                    RoundedRectangle(cornerRadius: 30)
                    .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))

                    RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), lineWidth: 1)
                    VStack{
                        Text("Pedro Lopez")
                            .font(.system(size: 24, weight: .bold))
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                                .frame(height: 50)
                                .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 5, x: 0, y: 4)
                            HStack{
                                Text("Tipo de sangre")
                                Spacer()
                                Text("A+")
                            }
                            .padding(.horizontal, 30)
                            
                            
                            
                        }
                        .padding(.horizontal, 50)
                    }
                }
                .ignoresSafeArea()
                .frame(width: 393, height: 700)
            }
        }
    }
}

struct PacienteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        PacienteProfileView()
    }
}
