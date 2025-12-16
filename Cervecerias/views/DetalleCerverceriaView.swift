//
//  DetalleCerverceriaView.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import SwiftUI

struct DetalleCerveceriaView: View {
    let cerveceria: Cerveceria
    @State private var detalleCerveceria: DetalleCerveceria?
    @State private var isLoading = true
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView("Cargando...")
            } else if let detalle = detalleCerveceria {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(detalle.nombre)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(detalle.tipo)
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text(detalle.direccion)
                            .font(.body)
                        
                        Text(detalle.ciudad)
                            .font(.body)
                        
                        Text(detalle.estado)
                            .font(.body)
                        
                        Text(detalle.codigoPostal)
                            .font(.body)
                        
                        Text(detalle.pais)
                            .font(.body)
                        
                        if let telefono = detalle.telefono {
                            Text("Teléfono: \(telefono)")
                                .font(.body)
                        }
                        
                        if let url = detalle.urlSitio {
                            Link("Sitio Web", destination: URL(string: url)!)
                                .font(.body)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Detalles")
            } else if let error = errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            cargarDetalle()
        }
    }
    
    private func cargarDetalle() {
        let urlString = "https://api.openbrewerydb.org/v1/breweries/\(cerveceria.id)"
        guard let url = URL(string: urlString) else {
            errorMessage = "URL no válida."
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMessage = "No se recibieron datos."
                    self.isLoading = false
                }
                return
            }
            
            do {
                let detalle = try JSONDecoder().decode(DetalleCerveceria.self, from: data)
                DispatchQueue.main.async {
                    self.detalleCerveceria = detalle
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = "Error al decodificar: \(error.localizedDescription)"
                    self.isLoading = false
                }
            }
        }.resume()
    }
}
