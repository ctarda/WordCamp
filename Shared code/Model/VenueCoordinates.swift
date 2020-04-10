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

// MARK:- Decodable
extension VenueCoordinates {
    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }

    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let latitude = try container.decodeIfPresent(Double.self, forKey: .latitude) ?? 0
            let longitude = try container.decodeIfPresent(Double.self, forKey: .longitude) ?? 0
            
            
            self.init(latitude: latitude,
                      longitude: longitude)
        } catch {
            self.init(latitude: 0.0, longitude: 0.0)
        }
    }

}
