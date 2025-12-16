//
//  ProductosPantalla.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import SwiftUI

import SwiftUI

struct ProductosView: View {
    @StateObject private var viewModel = ProductosViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Filtro de tipos
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.tipos, id: \.self) { tipo in
                            Button(action: {
                                viewModel.filtrarPorTipo(tipo)
                            }) {
                                Text(tipo)
                                    .padding()
                                    .background(viewModel.tipoSeleccionado == tipo ? Color.blue : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
                
                // Lista de cervecerías
                List{ 
                    ForEach(viewModel.$cervecerias) { cerveceria in
                        NavigationLink(destination: DetalleCerveceriaView(cerveceria: cerveceria)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(cerveceria.nombre)
                                        .font(.headline)
                                    Text(cerveceria.tipo)
                                        .font(.subheadline)
                                    Text(cerveceria.direccion)
                                        .font(.subheadline)
                                    Text(cerveceria.estado)
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Cervecerías")
            .onAppear {
                viewModel.cargarCervecerias()
            }
        }
    }
}
