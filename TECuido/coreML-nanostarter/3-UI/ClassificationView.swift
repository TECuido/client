//
//  ClassificationView.swift
//  coreML-starter
//
//
//

import SwiftUI
import CoreML

class ModalManager: ObservableObject{
    @Published var closeModal: Bool = false
    @Published var showModal: Bool = false
}

struct ClassificationView: View {
    
    @State var data: String = ""
    @State var model: MLModel
    //@State private var showModal = false
    @StateObject var closeModal = ModalManager()
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
        .background(
            NavigationLink("", destination: EmergenciasView(selection: 1), isActive: $closeModal.closeModal)
        )
    }
}
