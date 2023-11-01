
//
//  CameraViewController.swift
//  face emotion recognition
//
//  Created by Alumno on 31/10/23.
//
import Foundation
import AVFoundation
import SwiftUI
import UIKit
import CoreML
import Vision

class Coordinator: NSObject {
    @Binding var recognizedEmotion: String

    init(recognizedEmotion: Binding<String>) {
        _recognizedEmotion = recognizedEmotion
    }
}

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    var delegate: Coordinator?
    var emotionModel: VNCoreMLModel!

    
    private var captureSession: AVCaptureSession!
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        emotionModel = try? VNCoreMLModel(for: CNNEmotions().model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return
        }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(input)
        } catch {
            print(error)
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.alwaysDiscardsLateVideoFrames = true
        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_420YpCbCr8BiPlanarFullRange)]
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(videoOutput)
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)
                
        // Call startRunning on a background thread
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // Perform emotion recognition on each video frame
        // Process the `sampleBuffer` and pass it to the CoreML model
        // Update the recognized emotion and display it
        if let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
            do {
                let emotionRecognitionRequest = VNCoreMLRequest(model: emotionModel)
                try VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([emotionRecognitionRequest])
                
                if let results = emotionRecognitionRequest.results as? [VNClassificationObservation] {
                    if let bestResult = results.first {
                        let emotion = bestResult.identifier
                        DispatchQueue.main.async {
                            self.delegate?.recognizedEmotion = emotion
                        }
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}
