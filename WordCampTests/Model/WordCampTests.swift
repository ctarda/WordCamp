import XCTest
@testable import WordCamps

final class WordCampTests: XCTestCase {

    private var subject: WordCamp!

    override func setUp() {
        let jsonData = Loader.contentsOf("wordcamp")!
        let decoder = JSONDecoder()
        subject = try! decoder.decode(WordCamp.self, from: jsonData)
    }

    override func tearDown() {
        subject = nil
    }

    func testIDMatchesExpectation() {
        XCTAssertEqual(subject.id, 3095956)
    }

    func testTitleMatchesExpectation() {
        XCTAssertEqual(subject.title, WordCampTitle(rendered:"WordCamp Albuquerque, NM"))
    }

    func testContentMatchesExpectation() {
        XCTAssertEqual(subject.content, WordCampContent(rendered:""))
    }

    func testFeaturedMediaMatchesExpectation() {
        XCTAssertEqual(subject.featuredMedia, 0)
    }

    func testLocationMatchesExpectation() {
        XCTAssertEqual(subject.location, "Albuquerque, NM")
    }

    func testStartDateMatchesExpectation() {
        XCTAssertEqual(subject.startDate, Date(timeIntervalSince1970: 1584662400))
    }

    func testEndDateMatchesExpectation() {
        XCTAssertEqual(subject.endDate, Date(timeIntervalSince1970: 1584748800))
    }

    func testURLMatchesExpectation() {
        XCTAssertEqual(subject.url, "https://2020.albuquerque.wordcamp.org")
    }

    func testVenueNameMatchesExpectation() {
        XCTAssertEqual(subject.venueName, "Central New Mexico Community College (CNM)")
    }

    func testVenueAddressMatchesExpectation() {
        XCTAssertEqual(subject.venueAddress, "CNM Main Campus\r\n900 University Blvd. SE \r\nAlbuquerque, NM\r\n87106\r\nUSA")
    }

    func testVenueCoordinatesMatchesExpectation() {
        XCTAssertEqual(subject.venueCoordinates, VenueCoordinates(latitude: 35.0719041, longitude: -106.6290324))
    }

    func testTwitterMatchesExpectation() {
        XCTAssertEqual(subject.twitter, "")
    }
}
