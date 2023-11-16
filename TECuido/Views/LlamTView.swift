//
//  LlamTView.swift
//  TECuido
//
//  Created by Alumno on 09/11/23.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct LlamTView: View {
    @ObservedObject var viewModel: CallViewModel

    private var client: StreamVideo
    private let apiKey: String = "krhf9hwpw7pv" // The API key can be found in the Credentials section
    private let userId: String = "6" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNiJ9.0RldqqW6_Duaeu99yDENZbRFn9vmird0LCO__7WX9yg" // The Token can be found in the Credentials section
    private let callId: String = "default_2b45533d-4ba8-44fd-8910-7054dcc04cd2" // The CallId can be found in the Credentials section

    init() {
        let user = User(
            id: userId,
            name: "Panf", // name and imageURL are used in the UI
            imageURL: .init(string: "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/a3911/martin-mitrevski.webp")
        )

        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: .guest(userId),
            token: .init(stringLiteral: token)
        )

        self.viewModel = .init()
    }

    var body: some View {
            VStack {
                if viewModel.call != nil {
                    CallContainer(viewFactory: DefaultViewFactory.shared, viewModel: viewModel)
                } else {
                    Text("loading...")
                }
            }.onAppear {
                Task {
                    guard viewModel.call == nil else { return }
                    viewModel.joinCall(callType: .default, callId: callId)
                    
                    /*
                    viewModel.startCall(
                        callType: .default,
                        callId: callId,
                        members: [
                            MemberRequest(userId: "3"),
                            MemberRequest(userId: "6")
                        ]
                    )
                     */
                     
                }
            }
    }
}
