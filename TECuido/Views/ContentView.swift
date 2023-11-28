//
//  ContentView.swift
//  TECuido
//
//  Created by Alumno on 28/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionManager
    var body: some View {
        if(session.isLoggedIn){
            HomeView()
        } else {
            TECuidoView()
        }
    }
}

#Preview {
    ContentView()
}
