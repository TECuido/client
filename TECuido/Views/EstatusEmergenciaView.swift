//
//  EstatusEmergenciaView.swift
//  TECuido
//
//  Created by Alumno on 16/10/23.
//

import SwiftUI

struct EstatusEmergenciaView: View {
    @State private var rotation: Double = 0.0

    var body: some View {
        
        VStack {
            Text("Se ha enviado una emergencia")
                .foregroundColor(Color(red: 0.8392, green: 0, blue: 0))
                .font(.system(size: 35))
                .bold()
                .frame(width: 280)
                .padding()
                .multilineTextAlignment(.center)

            Image("Mal")
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.milliseconds(200)){
                        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                            rotation = 30
                        }
                    }
                }

            Text("Alerta")
                .font(.largeTitle)
                .bold()
            Text("Descripción de la alerta")
                .font(.title3)
                .bold()
            VStack {
                Text("Descripción de la alerta")
                    .font(.title2)
            }
            .frame(width: 300, height: 200)

            Spacer()

            Rectangle()
                .fill(Color(red: 0.83, green: 0, blue: 0))
                .ignoresSafeArea()
                .frame(width:.infinity, height: 50)
                .padding(.bottom, 0)
        }
    }

}

struct EstatusEmergenciaView_Previews: PreviewProvider {
    static var previews: some View {
        EstatusEmergenciaView()
    }
}
