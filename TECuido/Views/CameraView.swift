//
//  CameraView.swift
//  TECuido
//
//  Created by Alumno on 01/11/23.
//

import SwiftUI
import AVFoundation
import UIKit
import CoreML
import Vision


struct CameraView: UIViewControllerRepresentable {
    @Binding var recognizedEmotion: String

    func makeUIViewController(context: Context) -> CameraViewController {
        let cameraViewController = CameraViewController()
        cameraViewController.delegate = context.coordinator
        return cameraViewController
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedEmotion: $recognizedEmotion)
    }

}
