//
//  ProductosViewModel.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import Foundation
import Combine

class ProductosViewModel: ObservableObject {
    @Published var cervecerias: [Cerveceria] = []
    @Published var tipoSeleccionado: String = "Todos"
    
    let tipos = ["Todos", "Micro", "Nano", "Regional", "Brewpub", "Large", "Planning", "Bar", "Contract", "Proprietor", "Closed"]
    
    func cargarCervecerias() {
        let urlString = "https://api.openbrewerydb.org/v1/breweries"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let cervecerias = try JSONDecoder().decode([Cerveceria].self, from: data)
                    DispatchQueue.main.async {
                        self.cervecerias = cervecerias
                    }
                } catch {
                    print("Error al decodificar: \(error)")
                }
            }
        }.resume()
    }
    
    func filtrarPorTipo(_ tipo: String) {
        tipoSeleccionado = tipo
        let urlString: String
        
        if tipo == "Todos" {
            urlString = "https://api.openbrewerydb.org/v1/breweries"
        } else {
            urlString = "https://api.openbrewerydb.org/v1/breweries?by_type=\(tipo.lowercased())"
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let cervecerias = try JSONDecoder().decode([Cerveceria].self, from: data)
                    DispatchQueue.main.async {
                        self.cervecerias = cervecerias
                    }
                } catch {
                    print("Error al decodificar: \(error)")
                }
            }
        }.resume()
    }
}
