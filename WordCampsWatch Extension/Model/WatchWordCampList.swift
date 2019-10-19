import Foundation

struct WatchWordCampList {
    private let events: [WordCamp]

    lazy var eventViewModels: [WatchEventViewModel] = {
        return events.map { WatchEventViewModel(event: $0) }
    }()

    init(events: [WordCamp]) {
        self.events = events
    }
}
