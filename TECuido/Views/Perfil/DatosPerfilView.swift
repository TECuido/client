//
//  DatosPerfilView.swift
//  TECuido
//
//  Created by Alumno on 17/01/24.
//

import SwiftUI
@StateObject var viewModel = GetUsuarioDetallesViewModel()
struct DatosPerfilView: View {
    var body: some View {
        InfoRow(titulo: "Nombre del paciente", respuesta: usuario.Usuario.nombre)
        InfoRow(titulo: "Numero de poliza", respuesta: usuario.numPoliza)
        InfoRow(titulo: "Edad", respuesta: usuario.edad)
        InfoRow(titulo: "Dirección", respuesta: usuario.direccion)

        let infoContacto = " \(usuario.contactoEmergencia.nombre)  \( usuario.contactoEmergencia.correo.map { "\n\($0)" } ?? "")  \(usuario.contactoEmergencia.telefono.map { "\n\($0)" } ?? "")"
        InfoRow(titulo: "Contacto de Emergencia", respuesta: infoContacto)

        InfoRow(titulo: "Medico tratante", respuesta: usuario.medicoTratante)
        InfoRow(titulo: "Tipo de Sangre", respuesta: usuario.tipoSangre)
        InfoRow(titulo: "Donacion de Organos", respuesta: usuario.donacionOrganos)
        InfoRow(titulo: "Donacion de Sangre", respuesta: usuario.transfusionSanguinea)
    }
}

struct DatosPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        DatosPerfilView()
    }
}
