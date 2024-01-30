//
//  CreditosView.swift
//  TECuido
//
//  Created by Alumno on 27/01/24.
//

import SwiftUI

struct CreditosView: View {
    @Binding var path: NavigationPath
    
    static var tag = "Creditos"
    
    var body: some View {
        ZStack{
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                ScrollView{
                    Title(text:"Créditos")
                    Group{
                        Heading(text: "Desarrolladores:")
                        Spacer()
                        BigText(text:"Bernardo de la Sierra Rábago bdelasierrar@gmail.com")
                        Spacer()
                        BigText(text:"kraken Alejandro Domínguez Ramírez kraken209254@gmail.com")
                        Spacer()
                        BigText(text:"Julio Emmanuel Meza Rangel julio2510@outlook.com")
                        Spacer()
                        BigText(text:"Rúben Kumar Tandon Ramírez ruben.tandon@live.com")
                        Spacer()
                    }
                    Group{
                        Heading(text: "Socios de Dilo en Señas:")
                        Spacer()
                        BigText(text:"Rocio Garza Gutiérrez ")
                        Spacer()
                        BigText(text:"Paulo Samuel Manzano Pérez ")
                        Spacer()
                        BigText(text:"José Gerardo Monsivais González ")
                    }
                    Group{
                        Heading(text: "Asesorado por:")
                        Spacer()
                        BigText(text:"Elvia Rosas ")
                     
                    }
                }
                
            }
        }//ZSTACK
    }
}

struct CreditosView_Previews: PreviewProvider {
    static var previews: some View {
        CreditosView(path: .constant(NavigationPath()))
    }
}
