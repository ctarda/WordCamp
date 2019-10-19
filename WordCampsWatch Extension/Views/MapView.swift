import SwiftUI
import MapKit

struct MapView: WKInterfaceObjectRepresentable {
    let coordinate: CLLocationCoordinate2D

    func makeWKInterfaceObject(context: WKInterfaceObjectRepresentableContext<MapView>) -> WKInterfaceMap {
        return WKInterfaceMap()
    }

    func updateWKInterfaceObject(_ map: WKInterfaceMap, context: WKInterfaceObjectRepresentableContext<MapView>) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0,
                                    longitudeDelta: 2.0)

        let region = MKCoordinateRegion(
            center: coordinate,
            span: span)

        map.setRegion(region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2DMake(0, 0))
    }
}

