import CoreLocation

struct VenueCoordinates: Decodable {
    let latitude: Double
    let longitude: Double
}

extension VenueCoordinates: Equatable {
    static func ==(lhs: VenueCoordinates, rhs: VenueCoordinates) -> Bool {
        return lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude
    }
}

extension VenueCoordinates {
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude)
    }
}
