import MapKit

final class WordCampAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: NSString

    init(event: WordCamp) {
        self.coordinate = event.venueCoordinates.locationCoordinates
        self.title = NSString(string: event.title.rendered)
    }
}
