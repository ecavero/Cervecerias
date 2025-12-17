//
//  CerveceriasApp.swift
//  Cervecerias
//
//  Created by user278712 on 12/16/25.
//

import SwiftUI
import GoogleMaps

@main
struct CerveceriasApp: App {
    
    init() {
        GMSServices.provideAPIKey("AIzaSyBDFNEbEFTC4YCMEbf4UKPFwRA__JwQGRc")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
