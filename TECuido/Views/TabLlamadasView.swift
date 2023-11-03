//
//  TabLlamadasView.swift
//  TECuido
//
//  Created by Alumno on 02/11/23.
//

import SwiftUI

struct TabLlamadasView: View {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.78, green: 0.78, blue: 0.78, alpha: 1)
    }
    
    var body: some View {
        
        TabView{
            
            
           TextToSpeechView()
                .tabItem{
                    Image(systemName: "person.3.fill")
                }
                .tint(.blue)
            
            
            SpeechToTextView()
                .tabItem{
                    Image(systemName: "phone.fill")
                }
            
            
            
            
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(red: 0.1294, green: 0.5882, blue: 0.9529, alpha: 0)
            UITabBar.appearance().backgroundColor = UIColor(red: 0.1294, green: 0.5882, blue: 0.9529, alpha: 1)
        }
        .toolbarBackground(Color(red: 0.1294, green: 0.5882, blue: 0.9529), for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
        .tint(Color(red: 0.98, green: 0.98, blue: 0.98))
        
        
    }
}
struct TabLlamadasView_Previews: PreviewProvider {
    static var previews: some View {
        TabLlamadasView()
    }
}
