
//
//  EmotionRecognitionView.swift
//  face emotion recognition
//
//  Created by Alumno on 31/10/23.
//

import AVFoundation
import SwiftUI
import CoreML
import Vision

struct EmotionRecognitionView: View {
    @State private var recognizedEmotion: String = "Neutral"

    var body: some View {
        VStack {
            Text("Recognized Emotion: \(recognizedEmotion)")
                .font(.title)
                .padding()

            CameraView(recognizedEmotion: $recognizedEmotion)
            
        }
    }
}

#Preview {
    EmotionRecognitionView()
}
