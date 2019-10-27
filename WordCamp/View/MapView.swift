import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D
    let delta: CLLocationDegrees
    let annotations: [MKAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .zero)
        for annotation in annotations {
            map.addAnnotation(annotation)
        }

        return map
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2DMake(0, 0), delta: 2.0, annotations: [])
    }
}
