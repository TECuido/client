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
                        SubTitle(text: "Desarrolladores:")
                        Spacer()
                        LabelText(text:"Bernardo de la Sierra Rábago bdelasierrar@gmail.com")
                        Spacer()
                        LabelText(text:"kraken Alejandro Domínguez Ramírez kraken209254@gmail.com")
                        Spacer()
                        LabelText(text:"Julio Emmanuel Meza Rangel julio2510@outlook.com")
                        Spacer()
                        LabelText(text:"Rúben Kumar Tandon Ramírez ruben.tandon@live.com")
                        Spacer()
                    }
                    Group{
                        SubTitle(text: "Socios de Dilo en Señas:")
                        Spacer()
                        LabelText(text:"Rocio Garza Gutiérrez ")
                        Spacer()
                        LabelText(text:"Paulo Samuel Manzano Pérez ")
                        Spacer()
                        LabelText(text:"José Gerardo Monsivais González ")
                    }
                    Group{
                        SubTitle(text: "Asesorado por:")
                        Spacer()
                        LabelText(text:"Elvia Rosas ")
                     
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
