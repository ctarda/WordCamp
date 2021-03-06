import XCTest
import Combine
@testable import WordCamps

final class EventViewModelTests: XCTestCase {
    private var event: WordCamp!
    private var viewModel: PhoneEventViewModel!

    override func setUp() {
        super.setUp()
        event = Mocks.defaultEvent
        viewModel = PhoneEventViewModel(event: event, mediaService: MockMediaService())
    }

    override func tearDown() {
        viewModel = nil
        event = nil
        super.tearDown()
    }

    func testIDMatchesExpectation() {
        XCTAssertEqual(viewModel.id, event.id)
    }

    func testTitleMatchesExpectation() {
        XCTAssertEqual(viewModel.readableTitle, event.title.rendered)
    }

    func testContentMatchesExpectation() {
        XCTAssertEqual(viewModel.readableContent, event.content
            .rendered.strippedHTML)
    }

    func testLocationCoordinatesMatchesExpectation() {
        XCTAssertEqual(viewModel.annotation.coordinate.latitude, event.venueCoordinates.locationCoordinates.latitude)

        XCTAssertEqual(viewModel.annotation.coordinate.longitude, event.venueCoordinates.locationCoordinates.longitude)
    }

    func testLocationMatchesExpectation() {
        XCTAssertEqual(viewModel.location, event.location)
    }

    func testStartDateMatchesExpectation() {
        XCTAssertEqual(viewModel.date, event.startDate.toString(dateStyle: .long, timeStyle: .none))
    }

    func testURLMatchesExpectation() {
        XCTAssertEqual(viewModel.url, event.url)
    }

    func testVenueNameMatchesExpectation() {
        XCTAssertEqual(viewModel.venueName, event.venueName)
    }

    func testVenueAddressMatchesExpectation() {
        XCTAssertEqual(viewModel.venueAddress, event.venueAddress)
    }

    func testMatchMethodReturnsTrueWhenPassingTextAtBeginningOfTitle() {
        let leadingText = "WordCamp"
        XCTAssertTrue(viewModel.matches(textFilter: leadingText))
    }

    func testMatchMethodReturnsTrueWhenPassingTextAtEndOfTitle() {
        let trailingText = "ica"
        XCTAssertTrue(viewModel.matches(textFilter: trailingText))
    }

    func testMatchMethodReturnsTrueWhenPassingTextWithinTitle() {
        let middleText = "Antar"
        XCTAssertTrue(viewModel.matches(textFilter: middleText))
    }

    func testThumbnailReturnsExpectation() {
        XCTAssertEqual(viewModel.thumbnail, MockMediaService.thumbnail)
    }
}
