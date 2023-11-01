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
    
    @ObservedObject var viewModel: CallViewModel
    @State var shouldCreateCall = false

    private var client: StreamVideo
    private let apiKey: String = "pmqxwhbbbhzf"
    private let token: String = "edww4c3mymka5hjfb3ama3wgh4e8zpw57m63u54r39bdur4e4xxew3qtmd5w7zgsn"

    private let userId: String = "IG_88" // The User Id can be found in the Credentials section
    private let callId: String = "nDpJZMXYktkO" // The CallId can be found in the Credentials section
    
    init() {
        let user = User(
            id: userId,
            name: "Martin",
            imageURL: URL(string: "https://cdn-icons-png.flaticon.com/512/3177/3177440.png")
        )

        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
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
                if(shouldCreateCall){
                    viewModel.startCall(callType: .default, callId: "123", members: [])
                } else {
                    viewModel.joinCall(callType: .default, callId: "123")
                }
            }
        }
       
    }
    
    
}


