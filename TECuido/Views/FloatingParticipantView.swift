//
//  FloatingParticipantView.swift
//  TECuido
//
//  Created by Alumno on 27/10/23.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct FloatingParticipantView: View {

    var participant: CallParticipant?
    var size: CGSize = .init(width: 120, height: 120)

    var body: some View {
        if let participant = participant {
            VStack {
                HStack {
                    Spacer()

                    VideoRendererView(id: participant.id, size: size) { videoRenderer in
                        videoRenderer.handleViewRendering(for: participant, onTrackSizeUpdate: { _, _ in })
                    }
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                Spacer()
            }
            .padding()
        }
    }
}

/*
 struct FloatingParticipantView_Previews: PreviewProvider {
 static var previews: some View {
 FloatingParticipantView()
 }
 }
 */
