//
//  HacerLlamadaView.swift
//  TECuido
//
//  Created by Alumno on 25/10/23.
//

/*
import SwiftUI
import AVFoundation
struct TextToSpeechView: View {
    @State private var showEstatusView = false
    @State private var descripcion = ""
    let speech = AVSpeechSynthesizer()
    var body: some View {
        ZStack{
            VStack{
                Text("Panfila Lopez ")
                    .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                    .font(.system(size: 30))
                    .bold()
                    .frame(width: 360)
                    .padding()
                    .multilineTextAlignment(.center)
                ZStack{
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 250,height: 250)
                        .foregroundColor(Color(red: 0.1294,green: 0.5882,blue: 0.9529))
                        
                }.padding(40)
                VStack {
                    PlaceholderTextEditor(text: $descripcion, placeholder: "Escribe aquí la descripción")
                        .foregroundColor(Color(red: 0.44, green: 0.44, blue: 0.44))
                        .font(.body)
                        .frame(width: 325, height: 200)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(20)
                }
                .frame(width: 325, height: 200)
                // Inicio boton
                    Button("Mandar mensaje") {
                        speakText()
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height: 65)
                    .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
                    .cornerRadius(25)
                    .padding(30)
                    .font(.title2)
               
            }
            
            }
            
        }
    func speakText(){
        if !descripcion.isEmpty{
        
            let speechUtterance = AVSpeechUtterance(string: descripcion)
            speechUtterance.rate = 0.5
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
            speech.speak(speechUtterance)
        }
    }
}

struct TextToSpeechView_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeechView()
    }
}

*/
