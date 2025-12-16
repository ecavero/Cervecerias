//
//  Cerveceria.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import Foundation

struct Cerveceria: Identifiable, Codable {
    let id: String
    let nombre: String
    let tipo: String
    let direccion_1: String
    let direccion_2: String
    let direccion_3: String
    let estado: String

    enum CodingKeys: String, CodingKey {
        case id
        case nombre = "name"
        case tipo = "brewery_type"
        case direccion_1 = "address_1" 
        case direccion_2 = "address_2" 
        case direccion_3 = "address_3" 
        case estado = "state"
    }
}

