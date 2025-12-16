//
//  DetalleCerverceriaView.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import SwiftUI

struct DetalleCerveceriaView: View {
    var cerveceria: Cerveceria
    
    var body: some View {
        VStack {
            Text(cerveceria.nombre)
                .font(.largeTitle)
            // Agregar más detalles aquí
        }
    }
}
