import SwiftUI
import GoogleMaps

struct MapaView: View {
    let latitud: Double
    let longitud: Double
    
    var body: some View {
        GoogleMapView(latitud: latitud, longitud: longitud)
            .edgesIgnoringSafeArea(.all)
    }
}
struct GoogleMapView: UIViewRepresentable {
    let latitud: Double
    let longitud: Double
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: latitud, longitude: longitud, zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        marker.title = "Cervecería"
        marker.map = mapView
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        
    }
}
