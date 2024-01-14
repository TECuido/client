//
//  ClassificationView.swift
//  coreML-starter
//
//
//

import SwiftUI
import CoreML

class ModalManager: ObservableObject{
    @Published var goToEmergencias: Bool = false
    @Published var showModal: Bool = false
}

struct ClassificationView: View {
    
    @Binding var path: NavigationPath
    @State var data: String = ""
    @State var model: MLModel

    @StateObject var closeModal = ModalManager()
    @State private var LabelVariable: String = ""
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        ZStack {
            
            Color("BackgroundColor")
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
                    closeModal.showModal = true
                    LabelVariable = predictionLabel
                } label: {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
                .sheet(isPresented: $closeModal.showModal, onDismiss: {closeModal.showModal = false}) {
                    ModalView(labelData: classifierViewModel.getPredictionData(label: LabelVariable))
                }
            }
        }
        .environmentObject(closeModal)
        .onChange(of: closeModal.goToEmergencias){ value in
            if(value){
                path.append(EmergenciaNavModel(selection: 1, hayEmergencia: false))
                closeModal.goToEmergencias = false
            }
        }
        
    }
}
