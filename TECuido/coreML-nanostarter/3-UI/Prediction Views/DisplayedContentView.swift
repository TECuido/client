//
//  DisplayedContentView.swift
//  coreML-starter
//

import SwiftUI

struct DisplayedContentView: View {
    private(set) var labelData: ClassificationObject
    
    @EnvironmentObject var closeModal: ModalManager
    
    var body: some View {
        
        
        VStack {
            if labelData.label != "Saludable"{
                Text("Recomendaciones: ")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Text(labelData.recommendations)
                .multilineTextAlignment(.leading)
                .lineSpacing(3)
                .font(.title2)
                .padding(.bottom, 15)
            if labelData.label != "Saludable"{
                HStack(spacing: 20) {
                    Link(destination: URL(string: labelData.video)!, label: {
                        Image(systemName: "play.rectangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundColor(.red)
                    })
                    Button{
                        closeModal.closeModal = true
                        closeModal.showModal = false
                    } label: {
                        Image(systemName: "exclamationmark.bubble.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundColor(.blue)
                    }
                    Link(destination: URL(string: labelData.llamar)!, label: {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundColor(.green)
                    })
                }
                .padding(.bottom, 15)
            }
            if labelData.label != "Saludable"{
                Divider()
            }
            Text(labelData.disclaimer)
                .multilineTextAlignment(.center)
                .font(.title3)
        }
        .environmentObject(closeModal)
        .padding(15)
        .foregroundColor(.black)
        
    }
}

struct DisplayedContentView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayedContentView(labelData: ClassificationObject())
    }
}
