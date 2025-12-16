//
//  ContentView.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        ProductosView()
            .modelContainer(for: Favorito.self)
    }
        
}

#Preview {
    ContentView()
}
