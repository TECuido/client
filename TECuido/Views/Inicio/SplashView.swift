//
//  SplashView.swift
//  TECuido
//
//  Created by Alumno on 17/01/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            Image("splash")
                .ignoresSafeArea()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
