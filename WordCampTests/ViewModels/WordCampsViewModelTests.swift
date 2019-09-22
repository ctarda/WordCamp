import XCTest
import Combine
@testable import WordCamp

final class WordCampsViewModelTests: XCTestCase {
    var viewModel: WordCampsViewModel!

    override func setUp() {
        super.setUp()
        viewModel = WordCampsViewModel(service: MockWordCampService())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

//    func testReturnAllEventsWhenNoFilter() {
//        let events = viewModel.events
//        XCTAssertTrue(events.count == 1)
//    }
}
