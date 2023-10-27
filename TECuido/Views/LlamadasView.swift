//
//  LlamadasView.swift
//  TECuido
//
//  Created by Alumno on 20/10/23.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct LlamadasView: View {
    
    @State var call: Call
    @ObservedObject var state: CallState
    @State var callCreated: Bool = false

    private var client: StreamVideo
    private let apiKey: String = "mmhfdzb5evj2" // The API key can be found in the Credentials section
    private let userId: String = "Jango_Fett" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiVGFsb25fS2FycmRlIiwiaXNzIjoicHJvbnRvIiwic3ViIjoidXNlci9UYWxvbl9LYXJyZGUiLCJpYXQiOjE2OTg0NDE2MjksImV4cCI6MTY5OTA0NjQzNH0.mxffL3dsoFARKdoX76SzcGZEbS6TypQuNOpp5xTn1sI" // The Token can be found in the Credentials section
    private let callId: String = "sdpBKJgH4yX6" // The CallId can be found in the Credentials section
    
    init() {
        let user = User(
            id: userId,
            name: "Martin", // name and imageURL are used in the UI
            imageURL: .init(string: "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/a3911/martin-mitrevski.webp")
        )

        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: token)
        )

        // Initialize the call object
        let call = client.call(callType: "default", callId: callId)

        self.call = call
        self.state = call.state
    }
    
    
    var body: some View {
        VStack {
            if callCreated {
                ZStack {
                    ParticipantsView(
                        call: call,
                        participants: call.state.remoteParticipants,
                        onChangeTrackVisibility: changeTrackVisibility(_:isVisible:)
                        )
                    FloatingParticipantView(participant: call.state.localParticipant)
                }
            } else {
                Text("loading...")
            }
        }.onAppear {
            Task {
                guard callCreated == false else { return }
                try await call.join(create: true)
                callCreated = true
            }
        }
       
    }
    
    
    
    /// Changes the track visibility for a participant (not visible if they go off-screen).
    /// - Parameters:
    ///  - participant: the participant whose track visibility would be changed.
    ///  - isVisible: whether the track should be visible.
    private func changeTrackVisibility(_ participant: CallParticipant?, isVisible: Bool) {
        guard let participant else { return }
        Task {
            await call.changeTrackVisibility(for: participant, isVisible: isVisible)
        }
    }
    
}


