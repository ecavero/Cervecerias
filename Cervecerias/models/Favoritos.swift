import Foundation
import SwiftData
@Model
class Favorito {
    @Attribute(.unique) var id: String
    var nombre: String
    var tipo: String
    var direccion: String
    var estado: String
    
    init(id: String, nombre: String, tipo: String, direccion: String, estado: String) {
        self.id = id
        self.nombre = nombre
        self.tipo = tipo
        self.direccion = direccion
        self.estado = estado
    }
}
