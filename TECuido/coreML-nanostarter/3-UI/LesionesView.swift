//
//  LaunchScreenView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct LesionesView: View {
    
    @State private var showHerida = false
    @State private var showQuemadura = false
    @State private var showPicadura = false
    
    @State private var showingAlertHerida = false
    @State private var showingAlertQuemadura = false
    @State private var showingAlertPicadura = false

    
    var body: some View {
        ZStack {

            //[OPTIONAL] Edit background color here. You can also replace this with a background image.
            Color(hex: 0xF9F9F9, opacity: 1.0)
                .ignoresSafeArea()
            
//            Image("Background")
//                .resizable()
//                .ignoresSafeArea()
//                .scaledToFill()

            VStack {
                // header image:
                // TODO: replace with your own image.  Drag an image from your computer to assets.xcassets and add the name of your image below
                Image("ICON 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
                // title
                // TODO: Replace app title
                Text("Heridas")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.black)
                
                Divider().frame(maxWidth: 300)
                    .padding(.bottom, 20)
                
                // button
                VStack {
                    HStack{
                        Button(action: {
                            showingAlertHerida = true
                        }) {
                            createSection(title: "Herida", iconName: "bandage.fill", hint: "Aquí se analiza si tiene alguna herida")
                        }
                        .alert("⚠️\n\nSolo son recomendaciones, no es consejo médico. Si te sientes mal, mejor consulta a tu médico.", isPresented: $showingAlertHerida) {
                            Button("Entendido", role: .cancel) {
                                showHerida = true
                            }
                        }
//                        .padding(.trailing)
                        Button(action: {
                            showingAlertQuemadura = true
                        }) {
                            createSection(title: "Quemadura", iconName: "flame.fill", hint: "Aquí se analiza si tiene alguna quemadura")
                        }
                        .alert("⚠️\n\nSolo son recomendaciones, no es consejo médico. Si te sientes mal, mejor consulta a tu médico.", isPresented: $showingAlertQuemadura) {
                            Button("Entendido", role: .cancel) {
                                showQuemadura = true
                            }
                        }
                    }
                    Button(action: {
                        showingAlertPicadura = true
                    }) {
                        createSection(title: "Picadura", iconName: "ladybug.fill", hint: "Aquí se analiza si tiene alguna picadura")
                    }
                    .alert("⚠️\n\nSolo son recomendaciones, no es consejo médico. Si te sientes mal, mejor consulta a tu médico.", isPresented: $showingAlertPicadura) {
                        Button("Entendido", role: .cancel) {
                            showPicadura = true
                        }
                    }
//                    .padding(.top)
                }
                
            }
            .padding()
            .frame(maxWidth: 500) // This sets the width of the white card
            .cornerRadius(25)
            .shadow(radius: 5)
            
        }// VStack
        .background(
            NavigationLink("", destination: ClassificationView(data: "mydata", model: Wounds().model), isActive: $showHerida)
        )
        .background(
            NavigationLink("", destination: ClassificationView(data: "mydata2", model: Burns().model), isActive: $showQuemadura)
        )
        
        .background(
            NavigationLink("", destination: ClassificationView(data: "mydata3", model: Bites().model), isActive: $showPicadura)
        )
    }
    
    private func createSection(title: String, iconName: String, hint: String) -> some View {
        
        ZStack {
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.title)
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
            }
            .frame(width: 170, height: 170)
            .background(Color(red: 0.1294, green: 0.5882, blue: 0.9529))
            .cornerRadius(16)
            .padding(5)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            .font(.title)
            .accessibilityLabel(title)
            .accessibilityHint(hint)
        }
        
    }
    
}

struct LesionesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                LesionesView()
                    .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
