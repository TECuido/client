//  EditRecetasView.swift
//  TECuido
//
//  Created by Erick on 06/11/23.
//
import SwiftUI

struct ModifyRecetasView: View {
    var body: some View {
        ZStack{
            Color(red: 0.2824, green: 0.5804, blue: 0.9961)
                .ignoresSafeArea(.all)
            VStack{
                HStack(spacing: 20){
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Text("Crear nueva receta")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.horizontal)

                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                    ScrollView{
                        VStack(alignment: .leading, spacing: 20){
                            Text("Titulo")
                                .font(.system(size: 20, weight: .semibold))
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .strokeBorder(Color(red: 0.851, green: 0.851, blue: 0.851), lineWidth: 1)
                                    .foregroundColor(.white)
                                    .frame(height: 50)


                                HStack{
                                    Text("Ingrese el nombre de la receta")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))

                                    Spacer()
                                }
                                .padding(.horizontal)
                            }

                            Text("Paciente")
                                .font(.system(size: 20, weight: .semibold))
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .strokeBorder(Color(red: 0.851, green: 0.851, blue: 0.851), lineWidth: 1)
                                    .foregroundColor(.white)
                                    .frame(height: 50)

                                HStack(spacing: 5){
                                    Circle()
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                        .frame(width: 30, height: 30)

                                    Text("Selecciona paciente")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                        .padding(.horizontal)

                                    Spacer()

                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                }
                                .padding(.horizontal)
                            }

                            Text("Fecha de Inicio")
                                .font(.system(size: 20, weight: .semibold))
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .strokeBorder(Color(red: 0.851, green: 0.851, blue: 0.851), lineWidth: 1)
                                    .foregroundColor(.white)
                                    .frame(height: 50)

                                HStack(spacing: 5){
                                    Circle()
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                        .frame(width: 30, height: 30)

                                    Text("dd/mm/yyyy")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                        .padding(.horizontal)

                                    Spacer()

                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                }
                                .padding(.horizontal)
                            }

                            Text("Fecha de Cierre")
                                .font(.system(size: 20, weight: .semibold))
                            ZStack{
                                RoundedRectangle(cornerRadius: 50)
                                    .strokeBorder(Color(red: 0.851, green: 0.851, blue: 0.851), lineWidth: 1)
                                    .foregroundColor(.white)
                                    .frame(height: 50)

                                HStack(spacing: 5){
                                    Circle()
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                        .frame(width: 30, height: 30)

                                    Text("dd/mm/yyyy")
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                        .padding(.horizontal)

                                    Spacer()

                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                }
                                .padding(.horizontal)
                            }

                            Text("Medicamentos")
                                .font(.system(size: 20, weight: .semibold))

                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color(red: 0.851, green: 0.851, blue: 0.851), lineWidth: 1)
                                    .foregroundColor(.white)
                                VStack{
                                    HStack{
                                        Text("Paracetamol")
                                            .font(.system(size: 25, weight: .bold))
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundColor(Color(red: 0.851, green: 0.851, blue: 0.851))
                                    }
                                    .padding(.horizontal)

                                    Image("icon")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 250)
                                    VStack(alignment: .leading){
                                        Text("Breve Descripción")
                                            .font(.system(size: 20, weight: .semibold))

                                        ZStack{
                                            RoundedRectangle(cornerRadius: 25)
                                                .strokeBorder(Color(red: 0.851, green: 0.851, blue: 0.851), lineWidth: 1)
                                                .foregroundColor(.white)
                                            HStack{
                                                Text("1 tableta por día")
                                                    .font(.system(size: 17, weight: .semibold))

                                                Spacer()

                                                Image(systemName: "chevron.down")
                                            }
                                            .padding()
                                        }

                                    }
                                    .padding(.horizontal)
                                }
                                .padding(.vertical)

                            }
                        }
                        .padding(30)
                    }
                }

                HStack{
                    Spacer()
                    VStack(spacing: 5){
                        Image(systemName: "x.square")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))

                        Text("Cancelar")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    }

                    Spacer()

                    VStack(spacing: 5){
                        Image(systemName: "checkmark.square")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))

                        Text("Guardar")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                    }

                    Spacer()
                }
                .padding(.top, 2)
            }
        }
    }
}

struct ModifyRecetasView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyRecetasView()
    }
}
