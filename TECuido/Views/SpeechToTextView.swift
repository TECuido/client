//
//  SpeechToTextView.swift
//  TECuido
//
//  Created by Alumno on 01/11/23.
//

import SwiftUI

struct SpeechToTextView: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var text = ""
    @State var lastWord = ""
    @State private var isRecording = false
    
    var body: some View {
        VStack {
            Text(text)
                .padding()
            
            Button(action: {
                if !isRecording {
                    speechRecognizer.transcribe()
                } else {
                    speechRecognizer.stopTranscribing()
                }
                
                isRecording.toggle()
            }) {
                Text(isRecording ? "Stop" : "Record")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(isRecording ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
        }.onReceive(speechRecognizer.$transcript) { newText in
            // Process and display the captions here
            processCaptions(newText)
        }
    }
    
    func processCaptions(_ newText: String) {
            let words = newText.split(separator: " ")
            
            if text.count > 200 {
                speechRecognizer.stopTranscribing()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    text = ""
                    speechRecognizer.transcribe() // Restart speech recognition after a short delay
                }
            }
        
            if words.count > 0 {
                if lastWord != words[words.count - 1] {
                    lastWord = String(words[words.count - 1])
                    text += lastWord + " "
                }
            }
            
        }
}

struct SpeechToTextView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechToTextView()
    }
}
