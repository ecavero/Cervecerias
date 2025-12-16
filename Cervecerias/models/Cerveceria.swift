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
    let direccion: String
    let estado: String
}

