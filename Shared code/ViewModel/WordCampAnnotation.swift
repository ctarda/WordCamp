import MapKit

final class WordCampAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?

    init(event: WordCamp) {
        self.coordinate = event.venueCoordinates.locationCoordinates
        self.title = event.location
        self.subtitle = event.venueName
    }
}
