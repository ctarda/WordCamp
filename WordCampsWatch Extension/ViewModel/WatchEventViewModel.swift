import Foundation
import Combine
import CoreLocation

final class WatchEventViewModel: ObservableObject, Identifiable, EventViewModel {
    private let event: WordCamp
    private var cancellabe: AnyCancellable?

    var objectWillChange = PassthroughSubject<WatchEventViewModel, Never>()

    var id: Int {
        return event.id
    }

    var readableTitle: String {
        return event.title.rendered
    }

    var location: String {
        return event.location
    }

    var date: String {
        return event.startDate.toString(dateStyle: .medium, timeStyle: .none)
    }

    var url: String {
        return event.url
    }

    var venueName: String {
        return event.venueName
    }

    var venueAddress: String {
        return event.venueAddress
    }

    private var mediaID: Int {
        return event.featuredMedia
    }

    var annotation: WordCampAnnotation {
        return WordCampAnnotation(event: event)
    }

    init(event: WordCamp) {
        self.event = event
    }

    func matches(textFilter: String) -> Bool {
        return readableTitle
            .lowercased()
            .contains(textFilter.lowercased())
    }
}
