//
//  LiveCameraRepresentable.swift
//  coreML-starter
//
//  
//

import Foundation
import SwiftUI
import AVFoundation
import CoreML

struct LiveCameraRepresentable: UIViewControllerRepresentable {
    
    var model: MLModel
    
    var handleObservations: (LivePredictionResults, String, String) -> ()
    
    func makeUIViewController(context: Context) -> LiveCameraViewController {
        let vc = LiveCameraViewController(handleObservations: handleObservations)
        do {
            try vc.runSession(model: model)
        } catch {
            print(error.localizedDescription)
        }
        return vc
    }
    
    func updateUIViewController(_ cameraViewController: LiveCameraViewController, context: Context) {
    }
}
