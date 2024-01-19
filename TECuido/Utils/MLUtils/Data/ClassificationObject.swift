//
//  Classification.swift
//  coreML-starter
//
//  
//
struct ClassificationObject: Decodable {
    // TODO: replace with the name of your keys from mydata.json and some default values
    var label: String = "Raspón"
    var icono: String = "raspon"
    var recommendations: String = "-Lava la herida suavemente con agua y jabón.\n-Aplicar una pomada antibiótica para prevenir infecciones.\n-Cubrir su herida con una venda."
    var disclaimer: String = "⚠️\n(En caso de ser provocado por algún metal oxidado, consultar vacunación contra tétanos.)"
    var video: String = "https://youtu.be/mqh62u4RrxI?si=qhVZbVJ0zlM2xTPs"
    var llamar: String = "tel:911"
}
