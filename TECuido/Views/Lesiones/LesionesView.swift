//
//  LaunchScreenView.swift
//  coreML-starter
//
//
//

import SwiftUI

struct LesionesView: View {
    
    @Binding var path: NavigationPath
    @State private var showingAlertHerida = false
    @State private var showingAlertQuemadura = false
    @State private var showingAlertPicadura = false
    
    static var tag = "LesionesView"

    
    var body: some View {
        ZStack {
            
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack {
                
                Title(text: "Heridas")
                    .padding(.bottom, 30)
                
                HStack{
                    
                    BigButton(
                        title: "Herida",
                        iconName: "bandage.fill",
                        hint: "Se analiza si la persona tiene alguna herida"
                    ){
                        showingAlertHerida = true
                    }
                    .alert(isPresented: $showingAlertHerida){
                        AcceptAlert(
                            title: "Aviso",
                            message: "⚠️\n\nSolo son recomendaciones, no es consejo médico. Si te sientes mal, mejor consulta a tu médico."
                        ){
                            path.append(ClassificationNavModel(
                                data: "mydata",
                                model: Wounds().model
                            ))
                        }
                    }
                    
                    BigButton(
                        title: "Quemadura",
                        iconName: "flame.fill",
                        hint: "Se analiza si la persona tiene alguna quemadura"
                    ){
                        showingAlertQuemadura = true
                    }
                    .alert(isPresented: $showingAlertQuemadura){
                        AcceptAlert(
                            title: "Aviso",
                            message: "⚠️\n\nSolo son recomendaciones, no es consejo médico. Si te sientes mal, mejor consulta a tu médico."
                        ){
                            path.append(ClassificationNavModel(
                                data: "mydata2",
                                model: Burns().model
                            ))
                        }
                    }
                }
                
                BigButton(
                    title: "Picadura",
                    iconName: "ladybug.fill",
                    hint: "Se analiza si la persona tiene alguna picadura"
                ){
                    showingAlertPicadura = true
                }
                .alert(isPresented: $showingAlertPicadura){
                    AcceptAlert(
                        title: "Aviso",
                        message: "⚠️\n\nSolo son recomendaciones, no es consejo médico. Si te sientes mal, mejor consulta a tu médico."
                    ){
                        path.append(ClassificationNavModel(
                            data: "mydata3",
                            model: Bites().model
                        ))
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: 500) // This sets the width of the white card
            
        }

    }
    
}

struct LesionesView_Previews: PreviewProvider {
    static var previews: some View {
        LesionesView(path: .constant(NavigationPath()))
    }
}
