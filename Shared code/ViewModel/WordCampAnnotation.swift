import MapKit

#if canImport(Contacts)
import Contacts
#endif

final class WordCampAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?

    init(event: WordCamp) {
        self.coordinate = event.venueCoordinates.locationCoordinates
        self.title = event.location
        self.subtitle = event.venueName
    }

    #if canImport(Contacts)
    func mapItem() -> MKMapItem {
      let addressDict = [CNPostalAddressStreetKey: subtitle!]
      let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
      let mapItem = MKMapItem(placemark: placemark)
      mapItem.name = title
      return mapItem
    }
    #endif
}
