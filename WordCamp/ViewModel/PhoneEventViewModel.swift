import Foundation
import Combine
import CoreLocation

final class PhoneEventViewModel: ObservableObject, Identifiable, EventViewModel {
    private let event: WordCamp
    private var cancellabe: AnyCancellable?
    private let mediaService: MediaService

    var objectWillChange = PassthroughSubject<PhoneEventViewModel, Never>()

    private var media = Media(thumbnail: "") {
        didSet {
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }

    var id: Int {
        return event.id
    }

    var readableTitle: String {
        return event.title.rendered
    }

    var readableContent: String {
        return event.content.rendered.strippedHTML
    }

    var locationCoordinates: CLLocationCoordinate2D {
        return event.venueCoordinates.locationCoordinates
    }

    var location: String {
        return event.location
    }

    var startDate: String {
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

    var thumbnail: String {
        return media.thumbnail
    }

    private var mediaID: Int {
        return event.featuredMedia
    }

    convenience init(event: WordCamp) {
        self.init(event: event, mediaService: DefaultMediaService())
    }

    init(event: WordCamp, mediaService: MediaService = DefaultMediaService()) {
        self.event = event
        self.mediaService = mediaService
        fetchMedia()
    }

    func matches(textFilter: String) -> Bool {
        return readableTitle
            .lowercased()
            .contains(textFilter.lowercased())
    }

    private func fetchMedia() {
        cancellabe = mediaService
            .getAll(id: mediaID)
            .catch { _ in Just(Media(thumbnail: ""))}
            .assign(to: \.media, on: self)
    }
}