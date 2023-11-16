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
    
    @State var creador: Bool
    @Binding var dataLlamada: DataLlamadaModel
    @Binding var token: String
    
    @ObservedObject var viewModel: CallViewModel

    private var client: StreamVideo
    private let apiKey: String = "krhf9hwpw7pv"
    
    init(creador: Bool, token: Binding<String>, dataLlamada: Binding<DataLlamadaModel>) {
        
        let userId: Int
        let user: User
        
        if(creador){
            userId = dataLlamada.wrappedValue.idUsuarioEmisor
            
            user = User(
                id: String(userId),
                name: "Pànfila López",
                imageURL: nil
            )
        } else {
            userId = dataLlamada.wrappedValue.idUsuarioReceptor
            
            user = User(
                id: String(userId),
                name: "Rubén",
                imageURL: nil
            )
        }

        self.creador = creador
        self._token = token
        self._dataLlamada = dataLlamada
        
        print(token.wrappedValue)
        
        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMyJ9.ZQgjJvuJcQjQAOwfjksz4wHR2QvyvmML21TT4T3oMuw")
        )
        
        print(self.client)
        
        self.viewModel = .init()
    }
    
    
    var body: some View {
        VStack {
            if viewModel.call != nil {
                CallContainer(viewFactory: DefaultViewFactory.shared, viewModel: viewModel)
            } else {
                Text("Cargando ...")
            }
        }.onAppear {
            Task {
                guard viewModel.call == nil else { return }
                
                if(creador){
                    viewModel.startCall(
                        callType: .default,
                        callId: dataLlamada.idLlamada,
                        members: [
                            MemberRequest(userId: String(dataLlamada.idUsuarioEmisor)),
                            MemberRequest(userId: String(dataLlamada.idUsuarioReceptor))
                        ])
                    viewModel.joinCall(callType: .default, callId: dataLlamada.idLlamada)
                } else {
                    print(dataLlamada.idLlamada)
                    viewModel.joinCall(callType: .default, callId: dataLlamada.idLlamada)
                }
                 
            }
        }
       
    }
    
    
}


