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
        
        TECuidoView()
            .navigationBarBackButtonHidden(true)
        
        /*
        if(session.isLoggedIn){
            HomeView()
        } else {
            TECuidoView()
        }
         */
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
