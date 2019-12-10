import XCTest
import Combine
@testable import WordCamps

struct Mocks {
    static let id = 1234
    static let title = WordCampTitle(rendered: "WordCamp Antartica")
    static let content = WordCampContent(rendered: "The coolest WordCamp ever")
    static let featuredMedia = 12345
    static let location = "Antartica"
    static let startDate = Date()
    static let endDate: Date? = nil
    static let url = "https://somewhere.on.the.internet"
    static let venueName = "Penguin House"
    static let venueAddress = "1, South Pole Dr."
    static let venueCoordinates = VenueCoordinates(latitude: 0, longitude: 180)

    static var defaultEvent: WordCamp {
        return WordCamp(id: id,
                        title: title,
                        content: content,
                        featuredMedia: featuredMedia,
                        location: location,
                        startDate: startDate,
                        endDate: endDate,
                        url: url,
                        venueName: venueName,
                        venueAddress: venueAddress,
                        venueCoordinates: venueCoordinates)
    }
}

final class MockMediaService: MediaService {
    static let thumbnail = ""
    func getAll(id: Int) -> AnyPublisher<Media, Error> {
        // Send nothing. Using NSNotification is the fastest way to
        // create a Publisher that I can think of
        let pub = NotificationCenter.default
            .publisher(for: Notification.Name(rawValue: "nothing"), object: nil)
            .map { _ in Media(thumbnail: MockMediaService.thumbnail) }
            .mapError { _ in NSError() as Error }
        return AnyPublisher(pub)
    }
}

final class MockWordCampService: WordCampService {
    func getAll() -> AnyPublisher<[WordCamp], Error> {
        // Send nothing. Using NSNotification is the fastest way to
        // create a Publisher that I can think of
        let pub = NotificationCenter.default
            .publisher(for: Notification.Name(rawValue: "nothing"), object: nil)
            .map { _ in [Mocks.defaultEvent] }
            .mapError { _ in NSError() as Error }
        return AnyPublisher(pub)
    }
}
