//
//  ClassificationView.swift
//  coreML-starter
//
//  
//

import SwiftUI
import CoreML

struct ClassificationView: View {
    
    @State var data: String = ""
    @State var model: MLModel
    @State private var showModal = false
    @State private var LabelVariable: String = ""
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        ZStack {
            
            //[OPTIONAL] Edit background color here.
            Color(red: 0.1294, green: 0.5882, blue: 0.9529)
//                .opacity(0.5)
                .ignoresSafeArea()
            VStack{
                // DO NOT EDIT this section. This displays the classification camera
                GeometryReader { geo in
                    HStack(alignment: .top) {
                        LiveCameraRepresentable(model: model) {
                            predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                        }
//                            LiveCameraRepresentable() {
//                                predictionStatus.setLivePrediction(with: $0, label: LabelVariable, confidence: $2)
//                            }
//                        }
                        
                        //                    PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                        
                    }// HStack
                    .onAppear{
                        print(data)
                        classifierViewModel.resourceURL = data
                        classifierViewModel.loadJSON()
                    }
                    .frame(width: geo.size.width)
                }
                Spacer()
                Button{
                    showModal = true
                    LabelVariable = predictionLabel
                } label: {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                .sheet(isPresented: $showModal, onDismiss: {showModal = false}) {
                    ModalView(labelData: classifierViewModel.getPredictionData(label: LabelVariable))
                }
            }
        }
    }
}
