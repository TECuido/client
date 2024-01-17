//
//  ValidationUtils.swift
//  TECuido
//
//  Created by Alumno on 16/01/24.
//

import Foundation

//validar email con regex
func isValidEmail(email: String) -> Bool {
    if email.count > 100 {
            return false
    }
    
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: email)
}

func isValidTelefono(telefono: String) -> Bool {
    if telefono.count != 10 {
        return false
    }
    let telRegx = "^[0-9]{10}$"
    let telCheck = NSPredicate(format: "SELF MATCHES %@",telRegx)
    return telCheck.evaluate(with: telefono)
}

//validar contraseña con regex
func isValidPassword(password: String) -> Bool {
    // al menos una mayuscula
    // al menos un digito
    // al menos una minuscula
    // al menos un simbolo
    // min 8, max 64 caracteres
    let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,64}$"
    let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
    return passwordCheck.evaluate(with: password)

}

//retornar errores de contaseña
func getMissingValidation(str: String) -> [String] {
    var errors: [String] = []
    if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: str)){
        errors.append("al menos una mayúscula")
    }
    
    if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: str)){
        errors.append("al menos un dígito")
    }

    if(!NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*").evaluate(with: str)){
        errors.append("al menos un caracter especial")
    }
    
    if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: str)){
        errors.append("al menos una minúscula")
    }
    
    if(str.count < 8){
        errors.append("al menos 8 caracteres")
    }
    
    if(str.count > 64){
        errors.append("ser menor de 65 caracteres")
    }
    
    return errors
}
