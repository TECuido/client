//
//  ModalView.swift
//  coreML-nanostarter
//
//  Created by Ruben Tandon Ramirez on 27/10/23.
//

import SwiftUI

struct ModalView: View {
    
    private(set) var labelData: ClassificationObject
    
    var body: some View {
        ZStack(alignment: .top) {

            Color("BackgroundColor")
                .ignoresSafeArea()

            VStack {

                PredictiveLabelView(labelData: labelData)
                
                Image(labelData.icono)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                DisplayedContentView(labelData: labelData)
            }
            .padding()


        }
        .frame(maxWidth: .infinity)
    }
}
