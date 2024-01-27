//
//  TECuidoApp.swift
//  TECuido
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

@main
struct TECuidoApp: App {
    
    @StateObject var predictionStatus = PredictionStatus()
    @StateObject var session = SessionManager()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @State var emergencia: DataEmergenciaModel = DataEmergenciaModel.defaultEmergencia
    @State private var path: NavigationPath = .init()
    @State var isAuthenticated = false
    
    @State var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $path){
                
                Group {
                    if(isLoading){
                        SplashView()
                    } else {
                        TECuidoView(path: $path)
                    }
                }
                    .navigationDestination(for: String.self){ tag in
                        switch tag {
                        case LoginView.tag:
                            LoginView(path: $path)
                        case TipoCuentaView.tag:
                            TipoCuentaView(path: $path)
                        case AgregarUsuarioDetallesView.tag:
                            AgregarUsuarioDetallesView(path: $path)
                        case HomeView.tag:
                            HomeView(path: $path)
                                .navigationBarBackButtonHidden(true)
                        case LesionesView.tag:
                            LesionesView(path: $path)
                        case UsuarioDetallesView.tag:
                            UsuarioDetallesView(path: $path)
                        case RecetasView.tag:
                            RecetasView(path: $path)
                        case ContactosView.tag:
                            ContactosView(path: $path)
                        case CrearContactoView.tag:
                            CrearContactoView(path: $path)
                        case CreaGrupoView.tag:
                            CreaGrupoView(path: $path)
                        case DatosMedicosView.tag:
                            DatosMedicosView(path: $path)
                        case AlergiaView.tag:
                            AlergiaView(path: $path)
                        case CondicionMedicaView.tag:
                            CondicionMedicaView(path: $path)
                        case MedicamentoActualView.tag:
                            MedicamentoActualView(path: $path)
                        case ContactoEmergenciaView.tag:
                            ContactoEmergenciaView(path: $path)
                        case TECuidoView.tag:
                            TECuidoView(path: $path)
                        case CreditosView.tag:
                            CreditosView(path: $path)
                        default:
                            TECuidoView(path: $path)
                        }
                    }
                    .navigationDestination(for: TipoUsuario.self){tipo in
                        RegistroView(path: $path,
                                     typeCuenta: tipo)
                    }
                    .navigationDestination(for: GrupoModel.self){grupo in
                        GruposDetallesView(path: $path, grupo: grupo)
                    }
                    .navigationDestination(for: GrupoNavigationModel.self){item in
                        switch item.tag {
                        case EditarGrupoView.tag:
                            EditarGrupoView(path: $path, grupo: item.grupo)
                        default:
                            TECuidoView(path: $path)
                        }
                    }
                    .navigationDestination(for: ClassificationNavModel.self){item in
                        ClassificationView(path: $path, data: item.data, model: item.model)
                    }
                    .navigationDestination(for: RecetaModel.self){receta in
                        MostrarRecetaView(path: $path, receta: receta)
                    }
                    .navigationDestination(for: MedicamentoModel.self){medicamento in
                        MedicamentoDetalleView(path: $path, medicamento: medicamento)
                    }
                    .navigationDestination(for: EmergenciaNavModel.self){item in
                        EmergenciasView(path: $path, selection: item.selection, hayEmergencia: item.hayEmergencia)
                    }
                    .navigationDestination(for: MapaNavModel.self){item in
                        MapaView(region: item.getRegion(), markers: item.getMarkers())
                    }
                    .navigationDestination(for: DataEmergenciaNavModel.self){item in
                        switch item.destination{
                        case EstatusEmergenciaView.tag:
                            EstatusEmergenciaView(
                                path: $path,
                                dataEmergencia: item.data)
                        case EditarEmergenciaView.tag:
                            EditarEmergenciaView(
                                path: $path,
                                dataEmergencia: item.data
                            )
                        default:
                            TECuidoView(path: $path)
                        }
                    }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(predictionStatus)
            .environmentObject(session)
            .environmentObject(appDelegate.notificationViewModel)
            .onReceive(appDelegate.notificationViewModel.$notificationToken){token in
                //si se recibe el token de notificaciones enviarlo al servidor
                Task {
                    if(!appDelegate.notificationViewModel.tokenAgregado){
                        await appDelegate.notificationViewModel.sendNotificationToken()
                    }
                }
            }
            .onReceive(appDelegate.notificationViewModel.$emergencia) { em in
                //si se recibe una notificacion de emergencia llevar a la pantalla de emergencias
                if em.idEmergencia > -1 {
                    emergencia = em
                    path.append(
                        EmergenciaNavModel(
                            selection: 2,
                            hayEmergencia: true
                        )
                    )
                }
            }
            .onAppear(){ //si el refresh token se encuentra activo, se piden nuevos tokens y se autentica
                Task {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        withAnimation {
                            isLoading = false
                        }
                    }
                    
                    if let tokens = KeychainHelper.standard.read(service: "token", account: "tecuido.com", type: AccessKeys.self){
                        
                        //obtener nuevos tokens y guardarlos
                        do {
                            let token =  try await Webservice.instance.authManager.refreshToken(rToken: tokens.refreshToken)
                            let accessKeys = AccessKeys(id: tokens.id, accessToken: token.accessToken, refreshToken: token.refreshToken)
                            KeychainHelper.standard.save(accessKeys, service: "token", account: "tecuido.com")
                            isAuthenticated = true
                        } catch {
                            print(error.localizedDescription)
                            isAuthenticated = false
                        }
                            
                    } else {
                        isAuthenticated = false
                    }
                }
            }
            .onChange(of: isAuthenticated){value in
                //si esta autenticado llevar a Home, si no llevar a pantalla de inicio
                if(!value){
                    while(!path.isEmpty){
                        path.removeLast()
                    }
                } else {
                    path.append(HomeView.tag)
                }
            }
            .onChange(of: Webservice.instance.isAuthenticated){value in
                if(!value){
                    isAuthenticated = false
                }
            }
            
        }
    }
}


