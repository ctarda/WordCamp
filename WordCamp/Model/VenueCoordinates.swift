import CoreLocation

struct VenueCoordinates: Decodable {
    let latitude: Double
    let longitude: Double
}

extension VenueCoordinates {
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}
