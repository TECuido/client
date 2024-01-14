//
//  DisplayedContentView.swift
//  coreML-starter
//

import SwiftUI

struct DisplayedContentView: View {
    
    private(set) var labelData: ClassificationObject
    @EnvironmentObject var closeModal: ModalManager
    
    var body: some View {
        
        ZStack {
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                if labelData.label != "Saludable" {
                    SubTitle(text: "Recomendaciones")
                    Spacer()
                }
                
                Text(labelData.recommendations)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(3)
                    .font(.custom("Lato", size: FontSize.text.rawValue))
                    .padding(.bottom, 15)
                
                if labelData.label != "Saludable"{
                    Spacer()
                    HStack(spacing: 30) {
                        Link(destination: URL(string: labelData.video)!, label: {
                            Image(systemName: "play.rectangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .foregroundColor(.red)
                        })
                        Button{
                            closeModal.goToEmergencias = true
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
                    Text(labelData.disclaimer)
                        .multilineTextAlignment(.center)
                        .font(.custom("Lato", size: FontSize.captions.rawValue))
                        .padding(.top, 20)
                    Spacer()
                }
                
            }
            .environmentObject(closeModal)
            .padding(15)
            .foregroundColor(Color("TextColor"))
            
        }
        
        
        
    }
}

struct DisplayedContentView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayedContentView(labelData: ClassificationObject())
            .environmentObject(ModalManager())
    }
}
