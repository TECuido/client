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
    
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $path){
                Group {
                    
                    
                    TECuidoView(path: $path)
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
                Task {
                    if(!appDelegate.notificationViewModel.tokenAgregado){
                        await appDelegate.notificationViewModel.sendNotificationToken()
                    }
                }
            }
            .onReceive(appDelegate.notificationViewModel.$emergencia) { em in
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
            
        }
    }
}


