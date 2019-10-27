import SwiftUI
import MapKit

struct WatchMapView: WKInterfaceObjectRepresentable {
    let coordinate: CLLocationCoordinate2D
    let delta: CLLocationDegrees

    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<WatchMapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }

    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<WatchMapView>) {
        let span = MKCoordinateSpan(latitudeDelta: delta,
                                    longitudeDelta: delta)

        let region = MKCoordinateRegion(
            center: coordinate,
            span: span)

        map.setRegion(region)
    }
}

struct WatchMapView_Previews: PreviewProvider {
    static var previews: some View {
        WatchMapView(coordinate: CLLocationCoordinate2DMake(0, 0), delta: 0.02)
    }
}

