//
//  DisplayedContentView.swift
//  coreML-starter
//

import SwiftUI

struct DisplayedContentView: View {
    private(set) var labelData: ClassificationObject
    
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
                .padding(.bottom, 40)
            Text(labelData.disclaimer)
                .multilineTextAlignment(.center)
                .font(.title3)
        }
        .padding(15)
        .foregroundColor(.black)
        
    }
}

struct DisplayedContentView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayedContentView(labelData: ClassificationObject())
    }
}
