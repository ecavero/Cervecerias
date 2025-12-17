import Foundation
struct DetalleCerveceria: Codable {
    let nombre: String
    let tipo: String
    let direccion: String
    let ciudad: String
    let estado: String
    let codigoPostal: String
    let pais: String
    let telefono: String?
    let urlSitio: String?
    let latitud: Double
    let longitud: Double
    
    enum CodingKeys: String, CodingKey {
        case nombre = "name"
        case tipo = "brewery_type"
        case direccion = "address_1"
        case ciudad = "city"
        case estado = "state_province"
        case codigoPostal = "postal_code"
        case pais = "country"
        case telefono = "phone"
        case urlSitio = "website_url"
        case latitud = "latitude"
        case longitud = "longitude"
    }
}
