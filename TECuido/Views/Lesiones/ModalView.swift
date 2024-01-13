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

        //[OPTIONAL] Edit panel background color here.
            Color(.white)
//            .opacity(0.5)
            .ignoresSafeArea()

            VStack {
                //This view displays your prediction. Make edits in PredictiveLabelView file.
                PredictiveLabelView(labelData: labelData)
                
                Image(labelData.icono)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                //This view displays your prediction. Make edits in DisplayedContentView file.
                DisplayedContentView(labelData: labelData)
            }
            .padding()


        }
        //[OPTIONAL] Change the size of the frame.
        .frame(maxWidth: .infinity)
    }
}
