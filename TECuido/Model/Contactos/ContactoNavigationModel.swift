//
//  ContactoNavigationModel.swift
//  TECuido
//
//  Created by Alumno on 03/02/24.
//

struct ContactoNavigationModel: Hashable, Equatable {
    var tag: String
    var contacto: ContactoModel
}

extension ContactoNavigationModel {
    static func == (lhs: ContactoNavigationModel, rhs: ContactoNavigationModel) -> Bool {
        return lhs.tag == rhs.tag && lhs.contacto == rhs.contacto
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(tag)
        hasher.combine(contacto)
    }
}

extension ContactoModel: Hashable, Equatable {
    static func == (lhs: ContactoModel, rhs: ContactoModel) -> Bool {
        return lhs.id == rhs.id && lhs.nombre == rhs.nombre && lhs.telefono == rhs.telefono
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(nombre)
        hasher.combine(telefono)
    }
}
