import XCTest
import Combine
@testable import WordCamps

final class WordCampDetailTests: XCTestCase {
    private var event: WordCamp!
    private var viewModel: PhoneEventViewModel!
    private var view: WordCampDetail!

    override func setUp() {
        super.setUp()
        event = Mocks.defaultEvent
        viewModel = PhoneEventViewModel(event: event, mediaService: MockMediaService())
        view = WordCampDetail(event: viewModel)
    }

    override func tearDown() {
        view = nil
        viewModel = nil
        event = nil
        super.tearDown()
    }

//    func testSomething() {
//        view.body.chi
//    }
}
